require('heroes/globaled_hero_phantom_assassin/haste')

function empowerPoisonDamage ( keys, event )
	-- Variables	
	local caster = keys.caster
	local ability = keys.ability
	local target = keys.target	




	if not target:IsMagicImmune() then

		local currentMana = caster:GetMana()
		local manaCost = ability:GetLevelSpecialValueFor("mana_cost", 0)

		local one_cp_poison_damage_multiplier = ability:GetLevelSpecialValueFor("one_cp", 0)
		local two_cp_poison_damage_multiplier = ability:GetLevelSpecialValueFor("two_cp", 0)
		local three_cp_poison_damage_multiplier = ability:GetLevelSpecialValueFor("three_cp", 0)
		local four_cp_poison_damage_multiplier = ability:GetLevelSpecialValueFor("four_cp", 0)
		local five_cp_poison_damage_multiplier = ability:GetLevelSpecialValueFor("five_cp", 0)

		local comboPointCount = caster:GetModifierStackCount("modifier_pa_combo_points_datadriven", caster)

		if currentMana > manaCost then


			if caster:GetModifierStackCount("modifier_pa_combo_points_datadriven", caster) == 1 then

				caster:SetMana(currentMana - manaCost)
				local poisonWeaponDamageMultiplyerOne = one_cp_poison_damage_multiplier
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
					damage = caster_base_damage * poisonWeaponDamageMultiplyerOne
				}
				 
				ApplyDamage(damageTable)
				caster:RemoveModifierByName("modifier_empower_poison_bonus_damage_buff_datadriven")
				if keys.ability:GetToggleState() == true then
					keys.ability:ToggleAbility()
				end

    			print("[GLOBALED] Printing to console current  variable: poisonWeaponDamageMultiplyerOne:" .. poisonWeaponDamageMultiplyerOne)

				caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")
				caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")
				caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")
				caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")
				caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")

			elseif caster:GetModifierStackCount("modifier_pa_combo_points_datadriven", caster) == 2 then

				caster:SetMana(currentMana - manaCost)
				local poisonWeaponDamageMultiplyerTwo = two_cp_poison_damage_multiplier
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
					damage = caster_base_damage * poisonWeaponDamageMultiplyerTwo
				}
				 
				ApplyDamage(damageTable)
				caster:RemoveModifierByName("modifier_empower_poison_bonus_damage_buff_datadriven")
				if keys.ability:GetToggleState() == true then
					keys.ability:ToggleAbility()
				end

    			print("[GLOBALED] Printing to console current  variable: poisonWeaponDamageMultiplyerTwo:" .. poisonWeaponDamageMultiplyerTwo)

				caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")
				caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")
				caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")
				caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")
				caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")


			elseif caster:GetModifierStackCount("modifier_pa_combo_points_datadriven", caster) == 3 then

				caster:SetMana(currentMana - manaCost)
				local poisonWeaponDamageMultiplyerThree = three_cp_poison_damage_multiplier
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
					damage = caster_base_damage * poisonWeaponDamageMultiplyerThree
				}
				 
				ApplyDamage(damageTable)
				caster:RemoveModifierByName("modifier_empower_poison_bonus_damage_buff_datadriven")
				if keys.ability:GetToggleState() == true then
					keys.ability:ToggleAbility()
				end

    			print("[GLOBALED] Printing to console current  variable: three_cp_poison_damage_multiplier:" .. three_cp_poison_damage_multiplier)

				caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")
				caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")
				caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")
				caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")
				caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")


			elseif caster:GetModifierStackCount("modifier_pa_combo_points_datadriven", caster) == 4 then

				caster:SetMana(currentMana - manaCost)
				local poisonWeaponDamageMultiplyerFour = four_cp_poison_damage_multiplier
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
					damage = caster_base_damage * poisonWeaponDamageMultiplyerFour
				}
				 
				ApplyDamage(damageTable)
				caster:RemoveModifierByName("modifier_empower_poison_bonus_damage_buff_datadriven")
				if keys.ability:GetToggleState() == true then
					keys.ability:ToggleAbility()
				end

    			print("[GLOBALED] Printing to console current  variable: four_cp_poison_damage_multiplier:" .. four_cp_poison_damage_multiplier)

				caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")
				caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")
				caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")
				caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")
				caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")



			elseif caster:GetModifierStackCount("modifier_pa_combo_points_datadriven", caster) == 5 then

				caster:SetMana(currentMana - manaCost)
				local poisonWeaponDamageMultiplyerFive = five_cp_poison_damage_multiplier
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
					damage = caster_base_damage * poisonWeaponDamageMultiplyerFive
				}
				 
				ApplyDamage(damageTable)
				caster:RemoveModifierByName("modifier_empower_poison_bonus_damage_buff_datadriven")
				if keys.ability:GetToggleState() == true then
					keys.ability:ToggleAbility()
				end

    			print("[GLOBALED] Printing to console current  variable: five_cp_poison_damage_multiplier:" .. five_cp_poison_damage_multiplier)

				caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")
				caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")
				caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")
				caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")
				caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")


			end
		else
		end




	else
	end
end

function empowerPoisonDamageCritical ( keys )
	-- Variables	
	local caster = keys.caster
	local ability = keys.ability
	local target = keys.target	

	local currentMana = caster:GetMana()

	local manaCost = ability:GetLevelSpecialValueFor("mana_cost", 0)
	local caster_base_crit_damage = ability:GetLevelSpecialValueFor("crit_bonus", 0)

	local caster_base_damage_min = caster:GetBaseDamageMin() 																--print("[caster_base_damage_min] " .. caster_base_damage_min)
	local caster_base_damage_max = caster:GetBaseDamageMax()																--print("[caster_base_damage_max] " .. caster_base_damage_max)
	local caster_base_damage_combined_possibly_float = caster_base_damage_min + caster_base_damage_max						--print("[caster_base_damage_combined_possibly_float] " .. caster_base_damage_combined_possibly_float)
	local caster_base_damage_combined_possibly_float_average = caster_base_damage_combined_possibly_float/2					--print("[caster_base_damage_combined_possibly_float_average] " .. caster_base_damage_combined_possibly_float_average)		
	local caster_base_damage_combined_average_int = math.ceil(caster_base_damage_combined_possibly_float_average) 			--print("[caster_base_damage_combined_average_int] " .. caster_base_damage_combined_average_int)
	local caster_base_damage = caster_base_damage_combined_average_int 														--print("[caster_base_damage] " .. caster_base_damage)


	if not target:IsMagicImmune() then

		if currentMana > manaCost then
			caster:SetMana(currentMana - manaCost)

			if caster:GetModifierStackCount("modifier_pa_combo_points_datadriven", caster) == 1 then
				local poisonWeaponDamageMultiplyer = ability:GetLevelSpecialValueFor("one_cp", 0)

				local caster_combined_damage_value = caster_base_damage * poisonWeaponDamageMultiplyer

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
				caster:RemoveModifierByName("modifier_empower_poison_bonus_damage_buff_datadriven")
				if keys.ability:GetToggleState() == true then
					keys.ability:ToggleAbility()
				end

				caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")
				caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")
				caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")
				caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")
				caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")
	    		--print("[GLOBALED] -CRITICALSTRIKE- Printing to console current variable: poisonWeaponDamageMultiplyer:" .. poisonWeaponDamageMultiplyer)


			elseif caster:GetModifierStackCount("modifier_pa_combo_points_datadriven", caster) == 2 then
				local poisonWeaponDamageMultiplyer = ability:GetLevelSpecialValueFor("two_cp", 0)

				local caster_combined_damage_value = caster_base_damage * poisonWeaponDamageMultiplyer

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
				caster:RemoveModifierByName("modifier_empower_poison_bonus_damage_buff_datadriven")
				if keys.ability:GetToggleState() == true then
					keys.ability:ToggleAbility()
				end

				caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")
				caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")
				caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")
				caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")
				caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")
	    		--print("[GLOBALED] -CRITICALSTRIKE- Printing to console current variable: poisonWeaponDamageMultiplyer:" .. poisonWeaponDamageMultiplyer)


			elseif caster:GetModifierStackCount("modifier_pa_combo_points_datadriven", caster) == 3 then
				local poisonWeaponDamageMultiplyer = ability:GetLevelSpecialValueFor("three_cp", 0)

				local caster_combined_damage_value = caster_base_damage * poisonWeaponDamageMultiplyer

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
				caster:RemoveModifierByName("modifier_empower_poison_bonus_damage_buff_datadriven")
				if keys.ability:GetToggleState() == true then
					keys.ability:ToggleAbility()
				end

				caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")
				caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")
				caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")
				caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")
				caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")
	    		--print("[GLOBALED] -CRITICALSTRIKE- Printing to console current variable: poisonWeaponDamageMultiplyer:" .. poisonWeaponDamageMultiplyer)


			elseif caster:GetModifierStackCount("modifier_pa_combo_points_datadriven", caster) == 4 then
				local poisonWeaponDamageMultiplyer = ability:GetLevelSpecialValueFor("four_cp", 0)

				local caster_combined_damage_value = caster_base_damage * poisonWeaponDamageMultiplyer

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
				caster:RemoveModifierByName("modifier_empower_poison_bonus_damage_buff_datadriven")
				if keys.ability:GetToggleState() == true then
					keys.ability:ToggleAbility()
				end

				caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")
				caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")
				caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")
				caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")
				caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")
	    		--print("[GLOBALED] -CRITICALSTRIKE- Printing to console current variable: poisonWeaponDamageMultiplyer:" .. poisonWeaponDamageMultiplyer)


			elseif caster:GetModifierStackCount("modifier_pa_combo_points_datadriven", caster) == 5 then
				local poisonWeaponDamageMultiplyer = ability:GetLevelSpecialValueFor("five_cp", 0)

				local caster_combined_damage_value = caster_base_damage * poisonWeaponDamageMultiplyer

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
				caster:RemoveModifierByName("modifier_empower_poison_bonus_damage_buff_datadriven")
				if keys.ability:GetToggleState() == true then
					keys.ability:ToggleAbility()
				end

				caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")
				caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")
				caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")
				caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")
				caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")
	    		--print("[GLOBALED] -CRITICALSTRIKE- Printing to console current variable: poisonWeaponDamageMultiplyer:" .. poisonWeaponDamageMultiplyer)


			end

		else
		end
	else
	end
end