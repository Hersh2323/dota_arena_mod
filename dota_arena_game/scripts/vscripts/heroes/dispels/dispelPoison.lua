function dispelPoisonFriendly (keys)
	local target = keys.target
	local caster = keys.caster
	local ability = keys.ability

	target:RemoveModifierByName("modifier_pa_slow_debuff_datadriven")
	target:RemoveModifierByName("modifier_movement_speed_slow_debuff_datadriven")
		
end