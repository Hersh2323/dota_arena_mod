function removeMagicDebuffs(keys)

	local cater = keys.caster
	local target = keys.target

	if target:HasModifier("modifier_dragon_slave_debuff_datadriven") then
		target:RemoveModifierByName("modifier_dragon_slave_debuff_datadriven")
		else
	end
	
	if target:HasModifier("modifier_fire_trap_debuff_magical_dispellable_datadriven") then
		target:RemoveModifierByName("modifier_fire_trap_debuff_magical_dispellable_datadriven")
		else
	end

	if target:HasModifier("modifier_lina_burn_magical_debuff_dispellable_datadriven") then
		target:RemoveModifierByName("modifier_lina_burn_magical_debuff_dispellable_datadriven")
		else
	end
	if target:HasModifier("modifier_lina_slow_burn_debuff_magical_dispellable_datadriven") then
		target:RemoveModifierByName("modifier_lina_slow_burn_debuff_magical_dispellable_datadriven")
		else
	end

	if target:HasModifier("modifier_lina_sprint_disarm_debuff_phyiscal_dispellable_datadriven") then
		target:RemoveModifierByName("modifier_lina_sprint_disarm_debuff_phyiscal_dispellable_datadriven")
		else
	end

	if target:HasModifier("modifier_drgon_slave_root_datadriven") then
		target:RemoveModifierByName("modifier_drgon_slave_root_datadriven")
		else
	end
	
	if target:HasModifier("modifier_crystal_nova_slow_datadriven") then
		target:RemoveModifierByName("modifier_crystal_nova_slow_datadriven")
		else
	end

	if target:HasModifier("modifier_frost_bite_root_datadriven") then
		target:RemoveModifierByName("modifier_frost_bite_root_datadriven")
		else
	end

	if target:HasModifier("modifier_incapacitating_bite_debuff_datadriven") then
		target:RemoveModifierByName("modifier_incapacitating_bite_debuff_datadriven")
		else
	end

	if target:HasModifier("modifier_frc_attacked_slow_proc_datadriven_debuff") then
		target:RemoveModifierByName("modifier_frc_attacked_slow_proc_datadriven_debuff")
		else
	end

	if target:HasModifier("modifier_auto_attack_proc_root_datadriven") then
		target:RemoveModifierByName("modifier_auto_attack_proc_root_datadriven")
		else
	end

	if target:HasModifier("modifier_root_nova_root_datadriven") then
		target:RemoveModifierByName("modifier_root_nova_root_datadriven")
		else
	end

	if target:HasModifier("modifier_sheep_disorient_magical_debuff_dispellable_datadriven") then
		target:RemoveModifierByName("modifier_sheep_disorient_magical_debuff_dispellable_datadriven")
		else
	end

	if target:HasModifier("modifier_slow_shot_slow_debuff_datadriven") then
		target:RemoveModifierByName("modifier_slow_shot_slow_debuff_datadriven")
		else
	end

	if target:HasModifier("modifier_light_strike_array_datadriven") then
		target:RemoveModifierByName("modifier_light_strike_array_datadriven")
		else
	end

	if target:HasModifier("modifier_dispel_stealth_datadriven") then
		target:RemoveModifierByName("modifier_dispel_stealth_datadriven")
		else
	end

	if target:HasModifier("modifier_treant_root_datadriven") then
		target:RemoveModifierByName("modifier_treant_root_datadriven")
		else
	end

	if target:HasModifier("modifier_necrolyte_dot_one_debuff_datadriven") then
		target:RemoveModifierByName("modifier_necrolyte_dot_one_debuff_datadriven")
		else
	end

	if target:HasModifier("modifier_devour_debuff_datadriven") then
		target:RemoveModifierByName("modifier_devour_debuff_datadriven")
		else
	end

	if target:HasModifier("modifier_necrolyte_dot_three_debuff_datadriven") then
		target:RemoveModifierByName("modifier_necrolyte_dot_three_debuff_datadriven")
		else
	end

	if target:HasModifier("modifier_silence_debuff_datadriven") then
		target:RemoveModifierByName("modifier_silence_debuff_datadriven")
		else
	end

	if target:HasModifier("modifier_horrify_horrify_debuff_datadriven") then
		target:RemoveModifierByName("modifier_horrify_horrify_debuff_datadriven")
		else
	end

	if target:HasModifier("modifier_horrify_slow_debuff_datadriven") then
		target:RemoveModifierByName("modifier_horrify_slow_debuff_datadriven")
		else
	end

	if target:HasModifier("modifier_necrolyte_enfeeble_debuff_datadriven") then
		target:RemoveModifierByName("modifier_necrolyte_enfeeble_debuff_datadriven")
		else
	end

	if target:HasModifier("modifier_necrolyte_enfeeble_debuff_datadriven") then
		target:RemoveModifierByName("modifier_necrolyte_enfeeble_debuff_datadriven")
		else
	end

	if target:HasModifier("modifier_necrolyte_attack_dot_debuff_datadriven") then
		target:RemoveModifierByName("modifier_necrolyte_attack_dot_debuff_datadriven")
		else
	end

	if target:HasModifier("modifier_blinding_radiance_debuff_modifier") then
		target:RemoveModifierByName("modifier_blinding_radiance_debuff_modifier")
		else
	end

	if target:HasModifier("modifier_omniknight_stun_debuff_datadriven") then
		target:RemoveModifierByName("modifier_omniknight_stun_debuff_datadriven")
		else
	end

	if target:HasModifier("modifier_omniknight_burn_debuff_datadriven") then
		target:RemoveModifierByName("modifier_omniknight_burn_debuff_datadriven")
		else
	end

	if target:HasModifier("ch_dot_datadriven") then
		target:RemoveModifierByName("ch_dot_datadriven")
		else
	end

	if target:HasModifier("modifier_undying_feinds_grasp_debuff_datadriven") then
		target:RemoveModifierByName("modifier_undying_feinds_grasp_debuff_datadriven")
		else
	end

	if target:HasModifier("modifier_undying_feinds_grasp_debuff_two_datadriven") then
		target:RemoveModifierByName("modifier_undying_feinds_grasp_debuff_two_datadriven")
		else
	end

	if target:HasModifier("modifier_undying_non_crit_dot_debuff_datadriven") then
		target:RemoveModifierByName("modifier_undying_non_crit_dot_debuff_datadriven")
		else
	end

	if target:HasModifier("modifier_undying_crit_dot_debuff_datadriven") then
		target:RemoveModifierByName("modifier_undying_crit_dot_debuff_datadriven")
		else
	end

	if target:HasModifier("modifier_undying_non_crit_dot_debuff_datadriven") then
		target:RemoveModifierByName("modifier_undying_non_crit_dot_debuff_datadriven")
		else
	end

	if target:HasModifier("modifier_undying_fools_blood_debuff_datadriven") then
		target:RemoveModifierByName("modifier_undying_fools_blood_debuff_datadriven")
		else
	end

	if target:HasModifier("modifier_undying_silence_debuff_datadriven") then
		target:RemoveModifierByName("modifier_undying_silence_debuff_datadriven")
		else
	end

	if target:HasModifier("necrolyte_harvest_season_magical_debuff_datadriven") then
		target:RemoveModifierByName("necrolyte_harvest_season_magical_debuff_datadriven")
		else
	end
--[[
	if target:HasModifier("") then
		target:RemoveModifierByName("")
		else
	end
]]


end
