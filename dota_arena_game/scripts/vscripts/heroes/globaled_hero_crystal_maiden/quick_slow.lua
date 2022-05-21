function quick_slow_application(event)
	local caster = event.caster
	local target = event.target
	local ability = event.ability
	local slow_ability_source = caster:FindAbilityByName("frc_pb")
	local slow_duration = slow_ability_source:GetLevelSpecialValueFor("duration", 1) 
	local slow_duration_reduced = slow_duration - 3
	slow_ability_source:ApplyDataDrivenModifier(caster, target, "modifier_external_right_click_slow_crystal_maiden_debuff_magical_dispellable_datadriven", {duration=slow_duration_reduced}) 
end