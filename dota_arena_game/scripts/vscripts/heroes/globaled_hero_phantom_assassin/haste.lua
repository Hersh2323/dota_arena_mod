function hasteSpendComboPointsAll( event )
	local caster = event.caster

	if	caster:HasModifier("modifier_pa_combo_points_datadriven") then
		
		-- finds ability that created combo points (sma_pb)
		local modifierNameToFind = event.caster:FindModifierByName("modifier_pa_combo_points_datadriven")
		local ability = modifierNameToFind:GetAbility()

		local ability_level = ability:GetLevel() - 1
		local modifier_stack = event.modifier_stack

		local current_stack = caster:GetModifierStackCount(modifier_stack, ability)




		local hasteAbilityDurationPerComboPoint = ability:GetLevelSpecialValueFor("duration_per_combo_point", 0)
		local hasteAbilityBaseDuration = ability:GetLevelSpecialValueFor("base_duration", 0)

		ability:ApplyDataDrivenModifier( caster, caster, "modifier_pa_haste_buff_datadriven", { duration= hasteAbilityBaseDuration +  hasteAbilityDurationPerComboPoint * current_stack } )


		if current_stack < 6 then
			caster:SetModifierStackCount(modifier_stack, ability, current_stack - current_stack)
			caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")
			EmitSoundOn("Hero_Beastmaster.Wild_Axes_Damage", caster)
		else
		end
	else
	end
end



