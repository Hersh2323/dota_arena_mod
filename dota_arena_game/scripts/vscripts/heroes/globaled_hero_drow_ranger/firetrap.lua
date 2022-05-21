function fireTrapPlant( keys )
	local caster = keys.caster
	--local target_point = keys.target_points[1]
	local ability = keys.ability

	-- Modifiers
	local modifier_fire_trap = keys.modifier_fire_trap
	local modifier_tracker = keys.modifier_tracker
	local modifier_fire_trap_invisibility = keys.modifier_fire_trap_invisibility

	-- Ability variables
	local activation_time = ability:GetLevelSpecialValueFor("activation_time", 0) 
	local trap_duration = ability:GetLevelSpecialValueFor("trap_duration", 0)
	local trap_duration_plus_activation_time = activation_time + trap_duration


	local fv = caster:GetForwardVector()
	local origin = caster:GetAbsOrigin()
	local distance = ability:GetLevelSpecialValueFor("trap_plant_distance", 0)
	
	--local front_position = origin + fv * distance
	local target_point = origin + fv * distance




	-- Create the land mine and apply the land mine modifier
	local fire_trap = CreateUnitByName("npc_drow_ranger_ice_trap", target_point, false, nil, nil, caster:GetTeamNumber())
	ability:ApplyDataDrivenModifier(caster, fire_trap, modifier_fire_trap, {})



	caster.fire_trap = nil
	caster.fire_trap = fire_trap

	ability.trap_location = nil
	ability.trap_location = fire_trap:GetAbsOrigin()


	-- Apply the tracker after the activation time
	Timers:CreateTimer(activation_time, function()
		ability:ApplyDataDrivenModifier(caster, fire_trap, modifier_tracker, {})

		--local gameTime = GameRules:GetDOTATime(false, true)
    	--print("[GLOBALED] Drow Ranger Fire Trap: fire trap now armed " .. gameTime)

	end)

--[[
	-- Apply the invisibility after the fade time
	Timers:CreateTimer(fade_time, function()
		ability:ApplyDataDrivenModifier(caster, fire_trap, modifier_fire_trap_invisibility, {})
	end)
]]

	-- Destroy trap 
	Timers:CreateTimer(trap_duration_plus_activation_time, function()

		if not fire_trap:IsNull() then
			fire_trap:ForceKill(true) 

			--local gameTime = GameRules:GetDOTATime(false, true)
    		--print("[GLOBALED] Drow Ranger Fire Trap: has been killed via destroy " .. gameTime)

		end

	end)


end



function fireTrapTracker( keys )
	local target = keys.target
	local caster = keys.caster
	local ability = keys.ability

	-- Ability variables
	local trigger_radius = ability:GetLevelSpecialValueFor("trigger_radius", 0) 

	-- Target variables
	local target_team = DOTA_UNIT_TARGET_TEAM_ENEMY
	local target_types = DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC + DOTA_UNIT_TARGET_BUILDING
	local target_flags = DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES

	-- modifiers
	local modifier_thinker = keys.modifier_thinker

	-- Find the valid units in the trigger radius
	local units = FindUnitsInRadius(target:GetTeamNumber(), target:GetAbsOrigin(), nil, trigger_radius, target_team, target_types, target_flags, FIND_CLOSEST, false) 

	-- If there is a valid unit in range then explode the mine
	if #units > 0 then

		if not caster.fire_trap:IsNull() then

			ability:ApplyDataDrivenThinker(keys.caster, ability.trap_location, modifier_thinker, {duration = duration})

			-- EmitSoundOnLocationWithCaster(ability.trap_location, "Hero_Ancient_Apparition.fireVortexCast", caster)
			caster.fire_trap:ForceKill(true)
		end

	end
end

function fireTrapApplication(keys)

	local target = keys.target
	local caster = keys.caster
	local ability = keys.ability

	-- Ability variables
	local dot_base_duration = ability:GetLevelSpecialValueFor("dot_base_duration", 0) 
	local duration_increase_increment = ability:GetLevelSpecialValueFor("duration_increase_increment", 0) 

	-- Target variables
	local target_team = DOTA_UNIT_TARGET_TEAM_ENEMY
	local target_types = DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC + DOTA_UNIT_TARGET_BUILDING
	local target_flags = DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES

	-- modifiers
	local modifier_dot_debuff = keys.modifier_dot_debuff


	local targetHasDebuff = target:FindModifierByNameAndCaster(modifier_dot_debuff, caster)

	if not targetHasDebuff == nil then

		local current_duration = targetHasDebuff:GetDuration()
		local adjusted_duration = current_duration+duration_increase_increment
		targetHasDebuff:SetDuration(adjusted_duration, true)

	elseif targetHasDebuff == nil then
		target:ApplyDataDrivenModifier(caster, target, modifier_dot_debuff, {duration=duration})

	else
	end

end



function fireTrapDamage ( keys )
	-- Variables	
	local caster = keys.caster
	local ability = keys.ability
	local target = keys.target	

	if not target:IsMagicImmune() and not target:IsAttackImmune() then

		local WeaponDamageMultiplyer = ability:GetLevelSpecialValueFor("weapon_damage_multiplier", 0)
		local caster_base_damage_min = caster:GetBaseDamageMin() 																--print("[caster_base_damage_min] " .. caster_base_damage_min)
		local caster_base_damage_max = caster:GetBaseDamageMax()																--print("[caster_base_damage_max] " .. caster_base_damage_max)
		local caster_base_damage_combined_possibly_float = caster_base_damage_min + caster_base_damage_max						--print("[caster_base_damage_combined_possibly_float] " .. caster_base_damage_combined_possibly_float)
		local caster_base_damage_combined_possibly_float_average = caster_base_damage_combined_possibly_float/2					--print("[caster_base_damage_combined_possibly_float_average] " .. caster_base_damage_combined_possibly_float_average)		
		local caster_base_damage_combined_average_int = math.ceil(caster_base_damage_combined_possibly_float_average) 			--print("[caster_base_damage_combined_average_int] " .. caster_base_damage_combined_average_int)
		local caster_base_damage = caster_base_damage_combined_average_int 														--print("[caster_base_damage] " .. caster_base_damage)


		local damageTable = {
			victim = target,
			attacker = caster,
			damage_type = DAMAGE_TYPE_MAGICAL,
			damage = caster_base_damage * WeaponDamageMultiplyer
		}
		 
		ApplyDamage(damageTable)

	else
	end
end

function fireTrapDamageCritical ( keys )
	-- Variables	
	local caster = keys.caster
	local ability = keys.ability
	local target = keys.target	

	if not target:IsMagicImmune() and not target:IsAttackImmune() then

		local caster_base_crit_damage = ability:GetLevelSpecialValueFor("crit_damage", 0)
		local WeaponDamageMultiplyer = ability:GetLevelSpecialValueFor("weapon_damage_multiplier", 0)

		local caster_base_damage_min = caster:GetBaseDamageMin() 																--print("[caster_base_damage_min] " .. caster_base_damage_min)
		local caster_base_damage_max = caster:GetBaseDamageMax()																--print("[caster_base_damage_max] " .. caster_base_damage_max)
		local caster_base_damage_combined_possibly_float = caster_base_damage_min + caster_base_damage_max						--print("[caster_base_damage_combined_possibly_float] " .. caster_base_damage_combined_possibly_float)
		local caster_base_damage_combined_possibly_float_average = caster_base_damage_combined_possibly_float/2					--print("[caster_base_damage_combined_possibly_float_average] " .. caster_base_damage_combined_possibly_float_average)		
		local caster_base_damage_combined_average_int = math.ceil(caster_base_damage_combined_possibly_float_average) 			--print("[caster_base_damage_combined_average_int] " .. caster_base_damage_combined_average_int)
		local caster_base_damage = caster_base_damage_combined_average_int 														--print("[caster_base_damage] " .. caster_base_damage)

		local caster_combined_damage_value = caster_base_damage * WeaponDamageMultiplyer

		local damageTable = {
			victim = target,
			attacker = caster,
			damage_type = DAMAGE_TYPE_MAGICAL,
			damage = caster_combined_damage_value * caster_base_crit_damage
		}
		
		ApplyDamage(damageTable)

		local damageToPrint = math.floor( caster_combined_damage_value * caster_base_crit_damage )
		
		if damageToPrint > 0 then
			PopupNumbers(target, "crit", Vector(255, 0, 0), 2.0, damageToPrint, nil, POPUP_SYMBOL_POST_LIGHTNING)
		else
		end

	else
	end
end