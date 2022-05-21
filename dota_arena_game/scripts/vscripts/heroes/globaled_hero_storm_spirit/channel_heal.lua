function channelHealTick( event )

	-- Variables
	local caster = event.caster
	local target = event.target

	if IsValidEntity(caster) and IsValidEntity(target) then



		local ability = event.ability
		local caster_base_damage_min = caster:GetBaseDamageMin() 																--print("[caster_base_damage_min] " .. caster_base_damage_min)
		local caster_base_damage_max = caster:GetBaseDamageMax()																--print("[caster_base_damage_max] " .. caster_base_damage_max)
		local caster_base_damage_combined_possibly_float = caster_base_damage_min + caster_base_damage_max						--print("[caster_base_damage_combined_possibly_float] " .. caster_base_damage_combined_possibly_float)
		local caster_base_damage_combined_possibly_float_average = caster_base_damage_combined_possibly_float/2					--print("[caster_base_damage_combined_possibly_float_average] " .. caster_base_damage_combined_possibly_float_average)		
		local caster_base_damage_combined_average_int = math.ceil(caster_base_damage_combined_possibly_float_average) 			--print("[caster_base_damage_combined_average_int] " .. caster_base_damage_combined_average_int)
		local caster_base_damage = caster_base_damage_combined_average_int 														--print("[caster_base_damage] " .. caster_base_damage)


		local weapon_damage_multiplier = ability:GetLevelSpecialValueFor("weapon_damage", 0)
		local crit_damage = ability:GetLevelSpecialValueFor("crit_damage", 0)

		local crit_chance_ability_source = caster:FindAbilityByName("storm_spirit_pb")
		local crit_chance = crit_chance_ability_source:GetLevelSpecialValueFor("crit_chance", 0)
		local crit_damage = crit_chance_ability_source:GetLevelSpecialValueFor("crit_damage", 0)

		local crit_roll = RandomFloat(1, 100) -- print("[crit_roll] " .. crit_roll)



		if caster == target then
			StartAnimation(caster, {duration=0.5, activity=ACT_DOTA_OVERRIDE_ABILITY_1, rate=1.0})
		else
			StartAnimation(caster, {duration=0.5, activity=ACT_DOTA_OVERRIDE_ABILITY_1, rate=1.0})

			local ProjectileTABLE = {
		            EffectName = "particles/units/heroes/hero_skywrath_mage/skywrath_mage_concussive_shot.vpcf",
		            Ability = ability,
		            Target = target,
		            Source = caster,
		            bDodgeable = false,
		            bProvidesVision = false,
		            vSpawnOrigin = caster:GetAbsOrigin(),
		            iMoveSpeed = 9000,
		            iVisionRadius = 0,
		            iVisionTeamNumber = caster:GetTeamNumber(),
		            iSourceAttachment = DOTA_PROJECTILE_ATTACHMENT_ATTACK_1
		        }

		    ProjectileManager:CreateTrackingProjectile(ProjectileTABLE)

		end

		if crit_roll <= crit_chance then

			-- critical strike
			local healTotal = caster_base_damage * weapon_damage_multiplier -- print("[healTotal] " .. healTotal)
			local healTotalAfterCrit = healTotal * crit_damage -- print("[healTotalAfterCrit] " .. healTotalAfterCrit)
			target:Heal( healTotalAfterCrit, caster)

			local healToPrint = math.floor( healTotalAfterCrit )
			if healToPrint > 0 then
				PopupNumbers(target, "heal", Vector(0, 255, 0), 2.0, healToPrint, POPUP_SYMBOL_PRE_PLUS, nil)
			else
			end

		else

			-- non-critical strike
			local healTotal = caster_base_damage * weapon_damage_multiplier
			target:Heal( healTotal, caster)

			local healToPrint = math.floor( healTotal )
			if healToPrint > 0 then
				PopupNumbers(target, "heal", Vector(0, 255, 0), 2.0, healToPrint, POPUP_SYMBOL_PRE_PLUS, nil)
			else
			end

		end





	else
	end

end
