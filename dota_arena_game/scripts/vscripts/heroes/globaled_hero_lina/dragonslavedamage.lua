function dragonSlaveDamage (event)
	local caster = event.caster
	local target = event.target
	local ability = event.ability

	if IsValidEntity(target) and IsValidEntity(caster) and not target:IsMagicImmune() then

		local caster_base_damage_min = caster:GetBaseDamageMin() 																--print("[caster_base_damage_min] " .. caster_base_damage_min)
		local caster_base_damage_max = caster:GetBaseDamageMax()																--print("[caster_base_damage_max] " .. caster_base_damage_max)
		local caster_base_damage_combined_possibly_float = caster_base_damage_min + caster_base_damage_max						--print("[caster_base_damage_combined_possibly_float] " .. caster_base_damage_combined_possibly_float)
		local caster_base_damage_combined_possibly_float_average = caster_base_damage_combined_possibly_float/2					--print("[caster_base_damage_combined_possibly_float_average] " .. caster_base_damage_combined_possibly_float_average)		
		local caster_base_damage_combined_average_int = math.ceil(caster_base_damage_combined_possibly_float_average) 			--print("[caster_base_damage_combined_average_int] " .. caster_base_damage_combined_average_int)
		local caster_base_damage = caster_base_damage_combined_average_int 														--print("[caster_base_damage] " .. caster_base_damage)



		local abilitySourceForCrit = caster:FindAbilityByName("lina_pb")
		local crit_chance = abilitySourceForCrit:GetLevelSpecialValueFor("crit_chance", 0)
		local crit_damage = abilitySourceForCrit:GetLevelSpecialValueFor("crit_damage", 0)

		local weapon_damage = ability:GetLevelSpecialValueFor("dragon_slave_weapon_damage", 0)

		local damageNonCritical = caster_base_damage*weapon_damage 
		local damageCritical = damageNonCritical*crit_damage

		local crit_roll = RandomFloat(1, 100) -- print("[crit_roll] " .. crit_roll)
		if crit_roll <= crit_chance then

			-- critical
			local damageTable = {
				victim = target,
				attacker = caster,
				damage_type = DAMAGE_TYPE_MAGICAL,
				damage = damageCritical
			}
			 
			ApplyDamage(damageTable)


			target:RemoveModifierByNameAndCaster("modifier_lina_burn_magical_debuff_dispellable_datadriven", caster)
			abilitySourceForCrit:ApplyDataDrivenModifier(caster, target, "modifier_lina_burn_magical_debuff_dispellable_datadriven", {})



			local damageToPrint = math.floor( damageCritical )
			if damageToPrint > 0 then		
				PopupNumbers(target, "crit", Vector(0,0,255), 2.0, damageToPrint, nil, POPUP_SYMBOL_POST_LIGHTNING)
			else
			end
		else
			-- non crit
			local damageTable = {
				victim = target,
				attacker = caster,
				damage_type = DAMAGE_TYPE_MAGICAL,
				damage = damageNonCritical
			}
			 
			ApplyDamage(damageTable)
		end


	else
	end
end