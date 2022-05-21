function silenceCheck ( keys )

	local caster = keys.caster
	local target = keys.caster
	local ability = keys.ability
	local silence_modifier = keys.silence_modifier



	if target:HasModifier("modifier_casting_datadriven")	then

	--	ability:ApplyDataDrivenModifier(caster, target, "modifier_external_silence_crystal_maiden_debuff_magical_datadriven", {})
		ability:ApplyDataDrivenModifier(caster, target, silence_modifier, {duration = 7 })

	else
	end

end