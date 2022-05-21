function stealthRemovalPA(keys)


	local caster = keys.caster
	local ability = keys.ability

	if caster:HasModifier("modifier_pa_stealth_invisibility_buff_datadriven") then
		caster:RemoveModifierByName("modifier_pa_stealth_invisibility_buff_datadriven")
		else
	end


	if caster:HasModifier("modifier_invisible") then
		caster:RemoveModifierByName("modifier_invisible")
		else
	end
	
	if caster:HasModifier("modifier_pa_stealth_denial_buff_datadriven") then
		caster:RemoveModifierByName("modifier_pa_stealth_denial_buff_datadriven")
		else
	end


end
