function stealthRemoval(keys)


	local target = keys.target

	if target:HasModifier("modifier_pa_stealth_invisibility_buff_datadriven") then
		target:RemoveModifierByName("modifier_pa_stealth_invisibility_buff_datadriven")
		else
	end


	if target:HasModifier("modifier_invisible") then
		target:RemoveModifierByName("modifier_invisible")
		else
	end
	
	if target:HasModifier("modifier_pa_stealth_denial_buff_datadriven") then
		target:RemoveModifierByName("modifier_pa_stealth_denial_buff_datadriven")
		else
	end


end
