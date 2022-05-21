function couldBeAttacking (event)

	local caster = event.caster

	if not caster:IsAttacking() then
		caster:RemoveModifierByName("modifier_casting_datadriven")
	end

end