function harvestSeasonHeal( event )

	-- Variables
	local caster = event.caster
	local target = event.target
	local ability = event.ability

	-- kv
	local weapon_damage_multiplier = ability:GetLevelSpecialValueFor("weapon_damage", 0)
	local caster_base_damage_min = caster:GetBaseDamageMin() 																--print("[caster_base_damage_min] " .. caster_base_damage_min)
	local caster_base_damage_max = caster:GetBaseDamageMax()																--print("[caster_base_damage_max] " .. caster_base_damage_max)
	local caster_base_damage_combined_possibly_float = caster_base_damage_min + caster_base_damage_max						--print("[caster_base_damage_combined_possibly_float] " .. caster_base_damage_combined_possibly_float)
	local caster_base_damage_combined_possibly_float_average = caster_base_damage_combined_possibly_float/2					--print("[caster_base_damage_combined_possibly_float_average] " .. caster_base_damage_combined_possibly_float_average)		
	local caster_base_damage_combined_average_int = math.ceil(caster_base_damage_combined_possibly_float_average) 			--print("[caster_base_damage_combined_average_int] " .. caster_base_damage_combined_average_int)
	local caster_base_damage = caster_base_damage_combined_average_int 														--print("[caster_base_damage] " .. caster_base_damage)

	local healTotal = caster_base_damage * weapon_damage_multiplier
		caster:Heal( healTotal, caster)
end


function harvestTick( keys )

	-- Variables
	local caster = keys.caster
	local target = keys.target
	local ability = keys.ability

	if not target:IsMagicImmune() then

		-- kv
		local weapon_damage_multiplier = ability:GetLevelSpecialValueFor("weapon_damage", 0)
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
			damage = caster_base_damage * weapon_damage_multiplier
		}
		 
		ApplyDamage(damageTable)

		local healTotal = caster_base_damage * weapon_damage_multiplier
		caster:Heal( healTotal, caster)

		local healToPrint = math.floor( healTotal )

--[[
		if healToPrint > 0 then		
			PopupNumbers(caster, "crit", Vector(0, 255, 0), 2.0, healToPrint, nil, POPUP_SYMBOL_PRE_PLUS)
		else
		end

]]

	else
	end
end

function harvestTickCritical( keys )


	-- Variables
	local caster = keys.caster
	local target = keys.target
	local ability = keys.ability

	if not target:IsMagicImmune() then

		-- kv
		local weapon_damage_multiplier = ability:GetLevelSpecialValueFor("weapon_damage", 0)
		local caster_base_crit_damage = ability:GetLevelSpecialValueFor("crit_damage", 0)

		local caster_base_damage_min = caster:GetBaseDamageMin() 																--print("[caster_base_damage_min] " .. caster_base_damage_min)
		local caster_base_damage_max = caster:GetBaseDamageMax()																--print("[caster_base_damage_max] " .. caster_base_damage_max)
		local caster_base_damage_combined_possibly_float = caster_base_damage_min + caster_base_damage_max						--print("[caster_base_damage_combined_possibly_float] " .. caster_base_damage_combined_possibly_float)
		local caster_base_damage_combined_possibly_float_average = caster_base_damage_combined_possibly_float/2					--print("[caster_base_damage_combined_possibly_float_average] " .. caster_base_damage_combined_possibly_float_average)		
		local caster_base_damage_combined_average_int = math.ceil(caster_base_damage_combined_possibly_float_average) 			--print("[caster_base_damage_combined_average_int] " .. caster_base_damage_combined_average_int)
		local caster_base_damage = caster_base_damage_combined_average_int 														--print("[caster_base_damage] " .. caster_base_damage)

		local caster_combined_damage_value = caster_base_damage * weapon_damage_multiplier


		local damageTable = {
			victim = target,
			attacker = caster,
			damage_type = DAMAGE_TYPE_MAGICAL,
			damage = caster_combined_damage_value * caster_base_crit_damage
		}
		 
		ApplyDamage(damageTable)

		local healTotal = caster_combined_damage_value * caster_base_crit_damage
		caster:Heal( healTotal, caster)

		local healToPrint = math.floor( healTotal )		

		if healToPrint > 0 then		
			PopupNumbers(caster, "crit", Vector(0, 255, 0), 2.0, healToPrint, nil, POPUP_SYMBOL_PRE_PLUS)
		else
		end




		local damageToPrint = math.floor( caster_combined_damage_value * caster_base_crit_damage )
		if damageToPrint > 0 then		
			PopupNumbers(target, "crit", Vector(215, 50, 248), 2.0, damageToPrint, nil, POPUP_SYMBOL_POST_EYE)
		else
		end
	else
	end
end