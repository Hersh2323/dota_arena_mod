function removeRoots(event)
	local target = event.target
	local caster = event.caster
	local ability = event.ability

	target:RemoveModifierByName("modifier_external_crystal_nova_root_aquamusprime_debuff_magical_dispellable_datadriven")
	target:RemoveModifierByName("modifier_external_root_nova_effect_crystal_maiden_debuff_magical_dispellable_datadriven")
	target:RemoveModifierByName("modifier_treant_root_datadriven")
	target:RemoveModifierByName("modifier_fiends_grasp_root_debuff_datadriven")
	target:RemoveModifierByName("")
	target:RemoveModifierByName("")
	target:RemoveModifierByName("")

end
