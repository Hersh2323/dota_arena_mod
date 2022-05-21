function slowBurnTickDamage (event)
	local caster = event.caster
	local target = event.target
	local ability = caster:FindAbilityByName("lina_slow_burn")
	local l_ability = caster:FindAbilityByName("lina_pb")

	if IsValidEntity(caster) and IsValidEntity(target) and not target:IsMagicImmune() then

		local caster_base_damage_min = caster:GetBaseDamageMin() 																--print("[caster_base_damage_min] " .. caster_base_damage_min)
		local caster_base_damage_max = caster:GetBaseDamageMax()																--print("[caster_base_damage_max] " .. caster_base_damage_max)
		local caster_base_damage_combined_possibly_float = caster_base_damage_min + caster_base_damage_max						--print("[caster_base_damage_combined_possibly_float] " .. caster_base_damage_combined_possibly_float)
		local caster_base_damage_combined_possibly_float_average = caster_base_damage_combined_possibly_float/2					--print("[caster_base_damage_combined_possibly_float_average] " .. caster_base_damage_combined_possibly_float_average)		
		local caster_base_damage_combined_average_int = math.ceil(caster_base_damage_combined_possibly_float_average) 			--print("[caster_base_damage_combined_average_int] " .. caster_base_damage_combined_average_int)
		local caster_base_damage = caster_base_damage_combined_average_int 														--print("[caster_base_damage] " .. caster_base_damage)

		local weapon_damage_multiplier_total = ability:GetLevelSpecialValueFor("tick_total_weapon_damage", 0)

		local crit_chance = l_ability:GetLevelSpecialValueFor("crit_chance", 0)
		local crit_damage = l_ability:GetLevelSpecialValueFor("crit_damage", 0)

		local burn_duration = ability:GetLevelSpecialValueFor("slow_burn_duration", 0)
		local burn_tick_interval = ability:GetLevelSpecialValueFor("dot_tick_interval", 0)

		local ticksPerDuration = burn_duration / burn_tick_interval
		local weaponDamagePerTick = weapon_damage_multiplier_total / ticksPerDuration 


		local damageNonCritical = caster_base_damage*weaponDamagePerTick  --print("burn damageNonCritical: " .. damageNonCritical)
		local damageCritical = damageNonCritical*crit_damage			--print("burn damageCritical: " .. damageCritical)

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







function slowBurnExplosionDamage (event)
	local caster = event.caster
	local target = event.target
	local ability = caster:FindAbilityByName("lina_slow_burn")
	local l_ability = caster:FindAbilityByName("lina_pb")

	if IsValidEntity(caster) and IsValidEntity(target) and not target:IsMagicImmune() then

		local caster_base_damage_min = caster:GetBaseDamageMin() 																--print("[caster_base_damage_min] " .. caster_base_damage_min)
		local caster_base_damage_max = caster:GetBaseDamageMax()																--print("[caster_base_damage_max] " .. caster_base_damage_max)
		local caster_base_damage_combined_possibly_float = caster_base_damage_min + caster_base_damage_max						--print("[caster_base_damage_combined_possibly_float] " .. caster_base_damage_combined_possibly_float)
		local caster_base_damage_combined_possibly_float_average = caster_base_damage_combined_possibly_float/2					--print("[caster_base_damage_combined_possibly_float_average] " .. caster_base_damage_combined_possibly_float_average)		
		local caster_base_damage_combined_average_int = math.ceil(caster_base_damage_combined_possibly_float_average) 			--print("[caster_base_damage_combined_average_int] " .. caster_base_damage_combined_average_int)
		local caster_base_damage = caster_base_damage_combined_average_int 														--print("[caster_base_damage] " .. caster_base_damage)

		local weapon_damage_multiplier_total = ability:GetLevelSpecialValueFor("explosion_weapon_damage", 0)

		local crit_chance = l_ability:GetLevelSpecialValueFor("crit_chance", 0)
		local crit_damage = l_ability:GetLevelSpecialValueFor("crit_damage", 0)


		local damageNonCritical = caster_base_damage*weapon_damage_multiplier_total  		--print("burn damageNonCritical: " .. damageNonCritical)
		local damageCritical = damageNonCritical*crit_damage								--print("burn damageCritical: " .. damageCritical)

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

			l_ability:ApplyDataDrivenModifier(caster, caster, "modifier_lina_flames_crit_scored_datadriven", {}) 



			target:RemoveModifierByNameAndCaster("modifier_lina_burn_magical_debuff_dispellable_datadriven", caster)
			l_ability:ApplyDataDrivenModifier(caster, target, "modifier_lina_burn_magical_debuff_dispellable_datadriven", {})

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

			l_ability:ApplyDataDrivenModifier(caster, caster, "modifier_lina_flames_crit_failed_datadriven", {}) 

		end


	else
	end
end









function slowBurnApplication (event)
	local caster = event.caster
	local target = event.target
	local ability = caster:FindAbilityByName("lina_slow_burn")

	if IsValidEntity(caster) and IsValidEntity(target) and not target:IsMagicImmune() then

		local targetModifier = target:FindModifierByNameAndCaster("modifier_lina_slow_burn_debuff_magical_dispellable_datadriven", caster)

		if targetModifier == nil then

			target:RemoveModifierByNameAndCaster("modifier_lina_slow_burn_debuff_magical_dispellable_datadriven", caster)
			ability:ApplyDataDrivenModifier(caster, target, "modifier_lina_slow_burn_debuff_magical_dispellable_datadriven", {})


		else
			local baseDuration = ability:GetLevelSpecialValueFor("slow_burn_duration", 0) 
			local think_interval = ability:GetLevelSpecialValueFor("dot_tick_interval", 0) 
			local ticks_required_for_refresh = ability:GetLevelSpecialValueFor("ticks_required_to_refresh", 0) 

			local secondsRequiredForRefresh = think_interval*ticks_required_for_refresh+0.1

			local durationRemaining = targetModifier:GetRemainingTime()

			local modifierTimeRemaining = targetModifier:GetRemainingTime() print("slow burn duration remaining: " .. modifierTimeRemaining)

			if modifierTimeRemaining <= secondsRequiredForRefresh then
				target:RemoveModifierByNameAndCaster("modifier_lina_slow_burn_debuff_magical_dispellable_datadriven", caster)
				ability:ApplyDataDrivenModifier(caster, target, "modifier_lina_slow_burn_debuff_magical_dispellable_datadriven", {})

			else
			end

		end

	else
	end
end
