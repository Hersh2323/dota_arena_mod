function iceTrapPlant( keys )


	local caster = keys.caster
	--local target_point = keys.target_points[1]
	local ability = keys.ability





	local fv = caster:GetForwardVector()
	local origin = caster:GetAbsOrigin()
	local distance = ability:GetLevelSpecialValueFor("trap_plant_distance", 0)
	
	--local front_position = origin + fv * distance
	local target_point = origin + fv * distance





	-- Modifiers
	local modifier_ice_trap = keys.modifier_ice_trap
	local modifier_tracker = keys.modifier_tracker
	local modifier_ice_trap_invisibility = keys.modifier_ice_trap_invisibility

	-- Ability variables
	local activation_time = ability:GetLevelSpecialValueFor("activation_time", 0) 
	local fade_time = ability:GetLevelSpecialValueFor("fade_time", 0)
	local trap_duration = ability:GetLevelSpecialValueFor("trap_duration", 0)

	-- Create the land mine and apply the land mine modifier
	local ice_trap = CreateUnitByName("npc_drow_ranger_ice_trap", target_point, false, nil, nil, caster:GetTeamNumber())
	ability:ApplyDataDrivenModifier(caster, ice_trap, modifier_ice_trap, {})

	caster.ice_trap = nil
	caster.ice_trap = ice_trap

	ability.trap_location = nil
	ability.trap_location = ice_trap:GetAbsOrigin()


	-- Apply the tracker after the activation time
	Timers:CreateTimer(activation_time, function()
		ability:ApplyDataDrivenModifier(caster, ice_trap, modifier_tracker, {})
	end)



--[[
	-- Apply the invisibility after the fade time
	Timers:CreateTimer(fade_time, function()
		ability:ApplyDataDrivenModifier(caster, ice_trap, modifier_ice_trap_invisibility, {})
	end)
]]


	-- Destroy trap 
	Timers:CreateTimer(trap_duration, function()

		if not ice_trap:IsNull() then
			ice_trap:ForceKill(true) 
		end

	end)
end
 
--[[Author: Pizzalol
	Date: 24.03.2015.
	Tracks if any enemy units are within the mine radius]]
function iceTrapTracker( keys )
	local target = keys.target
	local caster = keys.caster
	local ability = keys.ability

	-- Ability variables
	local trigger_radius = ability:GetLevelSpecialValueFor("trigger_radius", 0) 
	local slow_debuff_duration = ability:GetLevelSpecialValueFor("slow_debuff_duration", 0) 

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
		if not caster.ice_trap:IsNull() then

			ability:ApplyDataDrivenThinker(keys.caster, ability.trap_location, modifier_thinker, {duration = duration})

			EmitSoundOnLocationWithCaster(ability.trap_location, "Hero_Ancient_Apparition.IceVortexCast", caster)
			caster.ice_trap:ForceKill(true)
		end
	end
end
