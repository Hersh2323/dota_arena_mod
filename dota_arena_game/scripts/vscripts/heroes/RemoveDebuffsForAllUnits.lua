function removeDebuffPassedFromAllUnits(event, caster, target, debuffModifierName)
	local caster = caster
	local target = target

	local modifierNameToRemove = debuffModifierName

	-- Target variables
	local target_team = DOTA_UNIT_TARGET_TEAM_ENEMY
	local target_types = DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC + DOTA_UNIT_TARGET_BUILDING
	local target_flags = DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES


	local units = FindUnitsInRadius(target_team, caster:GetAbsOrigin(), 99999999, nil, target_team, target_types, target_flags, FIND_UNITS_EVERYWHERE, false) 

	if units and IsValidEntity(units) then
		units:RemoveModifierByNameAndCaster(modifierNameToRemove, caster)
	else
	end

end

function removeSheepFull(event)
	local caster = event.caster
	local target = event.target
	local ability = event.ability

	removeDebuffPassedFromAllUnits(event, caster, target, "modifier_sheep_disorient_magical_debuff_dispellable_datadriven")
end
