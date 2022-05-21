function spread_contagion_debuffs(event)
	local caster = event.caster
	local target = event.target
	local ability = event.ability

	if IsValidEntity(caster) and IsValidEntity(target) and ability then

		local infest_blood_ability = caster:FindAbilityByName("undying_infest_blood")
		local chill_bones_ability = caster:FindAbilityByName("undying_chill_bones")
		local defile_ability = caster:FindAbilityByName("undying_pb")

		local spread_radius = ability:GetLevelSpecialValueFor("spread_radius", 0) 

		-- Target variables
		local target_team = DOTA_UNIT_TARGET_TEAM_ENEMY
		local target_types = DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC
		local target_flags = DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES

		if infest_blood_ability then
			local infest_blood_modifier = target:FindModifierByNameAndCaster("modifier_undying_infest_blood_disease_dispellable", caster)
			if infest_blood_modifier then

				infest_blood_modifier:ForceRefresh()

				local units = FindUnitsInRadius(target:GetTeamNumber(), target:GetAbsOrigin(), nil, spread_radius, DOTA_UNIT_TARGET_TEAM_ENEMY, target_types, DOTA_UNIT_TARGET_FLAG_NONE, FIND_ANY_ORDER, false)
				
				if units then
					if units == caster then
					else
						infest_blood_ability:ApplyDataDrivenModifier(caster, units, "modifier_undying_infest_blood_disease_dispellable", {}) 
						print("spread_contagion_debuffs method has detected units in radius of target.")
						print("Units detected in radius: " .. units:GetUnitName())
					end
				end
			else
			end
		else
		end






		local chill_bones_modifier = target:FindModifierByNameAndCaster("modifier_undying_chill_bones_disease_dispellable", caster)
		local defiling_plague_modifier = target:FindModifierByNameAndCaster("modifier_defiling_plague_disease_dispellable", caster)


	else
	end
end