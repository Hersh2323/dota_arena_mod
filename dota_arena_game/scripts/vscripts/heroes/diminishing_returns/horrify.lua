function horrifyCheck ( event )
	local caster = event.caster
	local target = event.target


	if IsValidEntity(caster) and IsValidEntity(target) then

		local ability = event.ability

		target:RemoveModifierByName("modifier_horrify_debuff_full_datadriven")
		target:RemoveModifierByName("modifier_horrify_debuff_half_datadriven")


		if target:HasModifier("modifier_horrify_dr_datadriven") then

			ability:ApplyDataDrivenModifier(caster, target, "modifier_horrify_debuff_half_datadriven", {})

		elseif target:HasModifier("modifier_horrify_dr_immune_datadriven") then

			-- do nothing: spells become immune after 2nd application, but trigger dr still
			ability:ApplyDataDrivenModifier(caster, target, "modifier_horrify_dr_immune_datadriven", {})

		else 

			ability:ApplyDataDrivenModifier(caster, target, "modifier_horrify_debuff_full_datadriven", {})

		end

	else
		print("ERROR: IsValidEntity(caster) and IsValidEntity(target) did not pass - horrifyCheck")
	end
end


