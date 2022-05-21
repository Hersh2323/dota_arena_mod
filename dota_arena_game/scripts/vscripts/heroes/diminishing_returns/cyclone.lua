function cycloneCheck ( event )
	local caster = event.caster
	local ability = event.ability
	local target = event.target



	if target:HasModifier("modifier_cyclone_dr_datadriven") then

		ability:ApplyDataDrivenModifier(caster, target, "modifier_cyclone_debuff_half_datadriven", {})

	elseif target:HasModifier("modifier_cyclone_dr_immune_datadriven") then

		-- do nothing: spells become immune after 2nd application, but trigger dr still
		ability:ApplyDataDrivenModifier(caster, target, "modifier_cyclone_dr_immune_datadriven", {})

	else 

		ability:ApplyDataDrivenModifier(caster, target, "modifier_cyclone_debuff_full_datadriven", {})

	end
end