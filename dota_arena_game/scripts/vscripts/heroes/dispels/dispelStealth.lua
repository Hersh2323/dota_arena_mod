function dispelStealthBuffs (keys)
	local target = keys.target
	local caster = keys.caster
	local ability = keys.ability

	local revealedSound = keys.revealedSound

	if target:HasModifier("modifier_pa_stealth_invisibility_buff_datadriven") then
		target:RemoveModifierByName("modifier_pa_stealth_invisibility_buff_datadriven")

		EmitSoundOn(revealedSound, target)
	else
	end

	if target:HasModifier("modifier_pa_stealth_denial_buff_datadriven") then
		target:RemoveModifierByName("modifier_pa_stealth_denial_buff_datadriven")

	else
	end

	if target:HasModifier("modifier_wind_walk_datadriven") then
		target:RemoveModifierByName("modifier_wind_walk_datadriven")

		EmitSoundOn(revealedSound, target)
	else
	end

end