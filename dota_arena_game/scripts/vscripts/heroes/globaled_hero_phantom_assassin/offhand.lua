function offHandStrike(event)
	local caster = event.caster
	local target = event.target
	local ability = event.ability

	if IsValidEntity(caster) and IsValidEntity(target) then

		local delay_time_bat = caster:GetBaseAttackTime()
		local delay_time = delay_time_bat*0.25

		Timers:CreateTimer(delay_time,
			function()

				if IsValidEntity(caster) and IsValidEntity(target) then

					local casterPosition = caster:GetAbsOrigin()
					local targetPosition = target:GetAbsOrigin() 
					local difference = casterPosition - targetPosition		--print("[GLOBALED] difference: "..difference)
					local casterAttackRange = ability:GetLevelSpecialValueFor("offhand_range", 0)			
					local printDiff = difference:Length2D()						--print("[GLOBALED] printDiff: "..printDiff)

					local caster_base_damage_min = caster:GetBaseDamageMin() 																--print("[caster_base_damage_min] " .. caster_base_damage_min)
					local caster_base_damage_max = caster:GetBaseDamageMax()																--print("[caster_base_damage_max] " .. caster_base_damage_max)
					local caster_base_damage_combined_possibly_float = caster_base_damage_min + caster_base_damage_max						--print("[caster_base_damage_combined_possibly_float] " .. caster_base_damage_combined_possibly_float)
					local caster_base_damage_combined_possibly_float_average = caster_base_damage_combined_possibly_float/2					--print("[caster_base_damage_combined_possibly_float_average] " .. caster_base_damage_combined_possibly_float_average)		
					local caster_base_damage_combined_average_int = math.ceil(caster_base_damage_combined_possibly_float_average) 			--print("[caster_base_damage_combined_average_int] " .. caster_base_damage_combined_average_int)
					local caster_base_damage = caster_base_damage_combined_average_int 														--print("[caster_base_damage] " .. caster_base_damage)

					local crit_chance_ability_source = caster:FindAbilityByName("sma_pb")											
					local weapon_damage_multiplier = ability:GetLevelSpecialValueFor("offhand_weapon_damage", 0)					--print("[GLOBALED]weapon_damage_multiplier : "..weapon_damage_multiplier)
					local crit_chance = crit_chance_ability_source:GetLevelSpecialValueFor("crit_chance", 0)						--print("[GLOBALED]crit_chance : "..crit_chance)
					local crit_damage = crit_chance_ability_source:GetLevelSpecialValueFor("crit_damage", 0)						--print("[GLOBALED]crit_damage : "..crit_damage)

					local crit_roll = RandomFloat(1, 100) 			--print("[crit_roll] " .. crit_roll)

					if difference:Length2D() <= casterAttackRange then

						if crit_roll <= crit_chance then
							-- critical strike
							local combinedDamageValue = caster_base_damage * weapon_damage_multiplier 		--print("[GLOBALED] damageToPrint: ".. combinedDamageValue)


							local damageTable = {
								victim = target,
								attacker = caster,
								damage_type = DAMAGE_TYPE_MAGICAL,
								damage = combinedDamageValue * crit_damage
							}

							ApplyDamage(damageTable)

							local damageToPrint = math.floor( combinedDamageValue * crit_damage )
							if damageToPrint > 0 then
								PopupNumbers(target, "crit", Vector(255, 0, 0), 2.0, damageToPrint, nil, POPUP_SYMBOL_POST_LIGHTNING)
							else
							end
						else
							-- non critical strike

							local damageTable = {
								victim = target,
								attacker = caster,
								damage_type = DAMAGE_TYPE_MAGICAL,
								damage = caster_base_damage * weapon_damage_multiplier
							}

							local damageToPrint = caster_base_damage * weapon_damage_multiplier
							print("[GLOBALED] damageToPrint: ".. damageToPrint)
							ApplyDamage(damageTable)
						end

						

						EmitSoundOnLocationWithCaster(targetPosition, "Hero_Meepo.Attack", caster)

					else
					end
				else
				end

			return
		end)

	else
	end
end