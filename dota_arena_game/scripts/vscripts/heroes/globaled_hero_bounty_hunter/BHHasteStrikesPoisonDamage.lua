function BHHasteStrikesPoisonDamage( keys )

	-- Variables
	local caster = keys.caster
	local target = keys.target
	local ability = keys.ability

	-- kv
	local hasteStrikesPoisonWeaponDamageMultiplyer = ability:GetLevelSpecialValueFor("poison_weapon_damage_multiplier", 0)


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
		damage = caster_base_damage * hasteStrikesPoisonWeaponDamageMultiplyer,
	}
	 
	ApplyDamage(damageTable)
end

function BHHasteStrikesPoisonDamageCritical( keys )


	-- Variables
	local caster = keys.caster
	local target = keys.target
	local ability = keys.ability


	-- kv
	local hasteStrikesPoisonWeaponDamageMultiplyer = ability:GetLevelSpecialValueFor("poison_weapon_damage_multiplier", 0)
	
	local caster_base_crit_damage = ability:GetLevelSpecialValueFor("poison_crit_damage", 0)

	local caster_base_damage_min = caster:GetBaseDamageMin() 																--print("[caster_base_damage_min] " .. caster_base_damage_min)
	local caster_base_damage_max = caster:GetBaseDamageMax()																--print("[caster_base_damage_max] " .. caster_base_damage_max)
	local caster_base_damage_combined_possibly_float = caster_base_damage_min + caster_base_damage_max						--print("[caster_base_damage_combined_possibly_float] " .. caster_base_damage_combined_possibly_float)
	local caster_base_damage_combined_possibly_float_average = caster_base_damage_combined_possibly_float/2					--print("[caster_base_damage_combined_possibly_float_average] " .. caster_base_damage_combined_possibly_float_average)		
	local caster_base_damage_combined_average_int = math.ceil(caster_base_damage_combined_possibly_float_average) 			--print("[caster_base_damage_combined_average_int] " .. caster_base_damage_combined_average_int)
	local caster_base_damage = caster_base_damage_combined_average_int 														--print("[caster_base_damage] " .. caster_base_damage)

	
	local caster_combined_damage_value = caster_base_damage * hasteStrikesPoisonWeaponDamageMultiplyer



		-- Crit damage  popup

		--damageToPrintBHHS = caster_combined_damage_value * caster_base_crit_damage
		--damageToPrintReadyBHHS = math.floor(damageToPrintBHHS),

		PopupNumbers(target, "crit", Vector(255, 0, 0), 1.0, nil, nil, POPUP_SYMBOL_POST_LIGHTNING)
		--print("[GLOBALED] Printing to console current variable: "..damageToPrintReadyBHHS)

		--


	local damageTable = {
		victim = target,
		attacker = caster,
		damage_type = DAMAGE_TYPE_MAGICAL,
		damage = caster_combined_damage_value * caster_base_crit_damage,
	}
	 
	ApplyDamage(damageTable)




end








function comboPointSpendAllHasteStrikes( event )
	local caster = event.caster

	if IsValidEntity(caster) then

		if	caster:HasModifier("modifier_bh_combo_points_datadriven") then

			local ability_called = event.ability
			local ability = caster:FindAbilityByName("bh_bleed_strike")
			local seconds_per_cp = ability_called:GetLevelSpecialValueFor("duration_per_cp", 0)


			local modifier_stack = event.modifier_stack
			local current_stack = caster:GetModifierStackCount(modifier_stack, ability)

			if current_stack == 5 then

				ability_called:ApplyDataDrivenModifier( caster, caster, "bh_hasten_strikes_buff_datadriven", { duration=current_stack*seconds_per_cp } )
				caster:SetModifierStackCount(modifier_stack, ability, current_stack - current_stack)
				caster:RemoveModifierByName("modifier_bh_combo_points_datadriven")


			elseif current_stack == 4 then

				ability_called:ApplyDataDrivenModifier( caster, caster, "bh_hasten_strikes_buff_datadriven", { duration=current_stack*seconds_per_cp } )
				caster:SetModifierStackCount(modifier_stack, ability, current_stack - current_stack)
				caster:RemoveModifierByName("modifier_bh_combo_points_datadriven")

			elseif current_stack == 3 then

				ability_called:ApplyDataDrivenModifier( caster, caster, "bh_hasten_strikes_buff_datadriven", { duration=current_stack*seconds_per_cp } )
				caster:SetModifierStackCount(modifier_stack, ability, current_stack - current_stack)
				caster:RemoveModifierByName("modifier_bh_combo_points_datadriven")

			elseif current_stack == 2 then

				ability_called:ApplyDataDrivenModifier( caster, caster, "bh_hasten_strikes_buff_datadriven", { duration=current_stack*seconds_per_cp } )
				caster:SetModifierStackCount(modifier_stack, ability, current_stack - current_stack)
				caster:RemoveModifierByName("modifier_bh_combo_points_datadriven")

			elseif current_stack == 1 then

				ability_called:ApplyDataDrivenModifier( caster, caster, "bh_hasten_strikes_buff_datadriven", { duration=current_stack*seconds_per_cp } )
				caster:SetModifierStackCount(modifier_stack, ability, current_stack - current_stack)
				caster:RemoveModifierByName("modifier_bh_combo_points_datadriven")

			end
		else
		end

	else
	end

end
