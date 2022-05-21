function channeling_check(event)
	local caster = event.caster
	local channeling_ability_modifier_source = caster:FindAbilityByName("all_heroes_gcd_datadriven")

	if caster:IsChanneling() then
		--print("[ INTERRUPT SYSTEM ][ Caster is currently channeling ]")
		local channeling_modifier = caster:FindModifierByName("modifier_currently_channeling_datadriven")
		if channeling_modifier then
		else
			channeling_ability_modifier_source:ApplyDataDrivenModifier(caster, caster, "modifier_currently_channeling_datadriven", {}) 
		end
	else
		local channeling_modifier = caster:FindModifierByName("modifier_currently_channeling_datadriven")
		if channeling_modifier then
			caster:RemoveModifierByName("modifier_currently_channeling_datadriven")
		else
		end
	end
end