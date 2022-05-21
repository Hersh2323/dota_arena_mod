function gorgeSpendComboPointsAll( event )
	local caster = event.caster
	local ability = event.ability
	local target = event.target

	if IsValidEntity(caster) and IsValidEntity(target) then

		if	caster:HasModifier("modifier_bh_combo_points_datadriven") then
			
			local modifierNameToFind = event.caster:FindModifierByName("modifier_bh_combo_points_datadriven")

			local modifier_stack = event.modifier_stack

			local current_stack = caster:GetModifierStackCount(modifier_stack, ability)

			local gorgeAbilityDurationPerComboPoint = ability:GetLevelSpecialValueFor("bleed_duration_per_cp", 0)
			local gorgeAbilityBaseDuration = ability:GetLevelSpecialValueFor("bleed_base_duration", 0)

			caster:RemoveModifierByNameAndCaster("modifier_bh_bleed_strike_buff_datadriven", caster)
			target:RemoveModifierByNameAndCaster("modifier_bh_bleed_strike_debuff_datadriven", caster)
			
			ability:ApplyDataDrivenModifier( caster, target, "modifier_bh_bleed_strike_debuff_datadriven", { duration= gorgeAbilityBaseDuration +  gorgeAbilityDurationPerComboPoint * current_stack } )


			if current_stack < 6 then
				caster:SetModifierStackCount(modifier_stack, ability, current_stack - current_stack)
				caster:RemoveModifierByName("modifier_bh_combo_points_datadriven")
				EmitSoundOn("Hero_Beastmaster.Wild_Axes_Damage", caster)
			else
			end
		else

			caster:RemoveModifierByNameAndCaster("modifier_bh_bleed_strike_buff_datadriven", caster)

		end

	else
	end

end