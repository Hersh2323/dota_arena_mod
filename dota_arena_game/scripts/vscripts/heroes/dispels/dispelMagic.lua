function dispelFriendly (event)
	local target = event.target
	local caster = event.caster
	local ability = event.ability

	target:RemoveModifierByName("modifier_external_dragon_slave_crystal_maiden_debuff_magical_dispellable_datadriven")
	target:RemoveModifierByName("modifier_external_crystal_nova_root_aquamusprime_debuff_magical_dispellable_datadriven")
	target:RemoveModifierByName("modifier_external_right_click_slow_crystal_maiden_debuff_magical_dispellable_datadriven")
	target:RemoveModifierByName("modifier_external_attacked_slow_effect_crystal_maiden_debuff_magical_dispellable_datadriven")
	target:RemoveModifierByName("modifier_external_root_nova_effect_crystal_maiden_debuff_magical_dispellable_datadriven")
	target:RemoveModifierByName("modifier_treant_root_datadriven")
	target:RemoveModifierByName("modifier_dispel_stealth_datadriven")
	target:RemoveModifierByName("necrolyte_harvest_season_debuff_datadriven")
	target:RemoveModifierByName("modifier_necrolyte_dot_one_debuff_datadriven")
	target:RemoveModifierByName("modifier_devour_debuff_datadriven")
	target:RemoveModifierByName("modifier_necrolyte_dot_three_debuff_datadriven")
	target:RemoveModifierByName("modifier_necrolyte_demo_debuff_datadriven")
	target:RemoveModifierByName("modifier_necrolye_raze_debuff_datadriven")
	target:RemoveModifierByName("modifier_necrolyte_enfeeble_debuff_datadriven")
	target:RemoveModifierByName("modifier_horrify_debuff_full_datadriven")
	target:RemoveModifierByName("modifier_horrify_debuff_half_datadriven")
	target:RemoveModifierByName("modifier_horrify_slow_debuff_datadriven")
	target:RemoveModifierByName("modifier_omniknight_stun_full_debuff_datadriven")
	target:RemoveModifierByName("modifier_omniknight_stun_half_debuff_datadriven")
	target:RemoveModifierByName("modifier_blinding_radiance_debuff_modifier")
	target:RemoveModifierByName("modifier_pa_controlled_stun_full_datadriven")
	target:RemoveModifierByName("modifier_pa_controlled_stun_half_datadriven")
	target:RemoveModifierByName("modifier_undying_feinds_grasp_debuff_datadriven")
	target:RemoveModifierByName("modifier_undying_feinds_grasp_debuff_two_datadriven")
	target:RemoveModifierByName("modifier_sheep_disorient_debuff_half_datadriven")
	target:RemoveModifierByName("modifier_sheep_disorient_debuff_full_datadriven")
	target:RemoveModifierByName("modifier_sheep_lua")
	target:RemoveModifierByName("modifier_fiends_grasp_root_debuff_datadriven")
	target:RemoveModifierByName("modifier_fire_trap_debuff_magical_dispellable_datadriven")
	target:RemoveModifierByName("necrolyte_harvest_season_magical_debuff_datadriven")
	target:RemoveModifierByName("modifier_necrolyte_attack_dot_debuff_datadriven")
	target:RemoveModifierByName("modifier_lina_dragon_slave_slow_debuff_magic_dispellable_datadriven")

	target:RemoveModifierByName("modifier_lina_burn_magical_debuff_dispellable_datadriven")
	target:RemoveModifierByName("modifier_lina_slow_burn_debuff_magical_dispellable_datadriven")
	target:RemoveModifierByName("modifier_lina_sprint_disarm_debuff_phyiscal_dispellable_datadriven")
	target:RemoveModifierByName("modifier_drgon_slave_root_datadriven")
	target:RemoveModifierByName("modifier_crystal_nova_slow_datadriven")
	target:RemoveModifierByName("modifier_frost_bite_root_datadriven")
	target:RemoveModifierByName("modifier_incapacitating_bite_debuff_datadriven")
	target:RemoveModifierByName("modifier_frc_attacked_slow_proc_datadriven_debuff")
	target:RemoveModifierByName("modifier_auto_attack_proc_root_datadriven")
	target:RemoveModifierByName("modifier_root_nova_root_datadriven")
	target:RemoveModifierByName("modifier_sheep_disorient_magical_debuff_dispellable_datadriven")
	target:RemoveModifierByName("modifier_slow_shot_slow_debuff_datadriven")
	target:RemoveModifierByName("modifier_light_strike_array_datadriven")
	target:RemoveModifierByName("modifier_silence_debuff_datadriven")
	target:RemoveModifierByName("modifier_horrify_horrify_debuff_datadriven")
	target:RemoveModifierByName("modifier_omniknight_stun_debuff_datadriven")
	target:RemoveModifierByName("modifier_omniknight_burn_debuff_datadriven")
	target:RemoveModifierByName("modifier_undying_non_crit_dot_debuff_datadriven")
	target:RemoveModifierByName("modifier_undying_crit_dot_debuff_datadriven")
	target:RemoveModifierByName("modifier_undying_silence_debuff_datadriven")

	target:RemoveModifierByName("modifier_undying_infest_blood_disease_dispellable")
	target:RemoveModifierByName("modifier_undying_chill_bones_disease_dispellable")
	target:RemoveModifierByName("modifier_undying_chill_bones_attack_speed_debuff_disease_dispellable")
	target:RemoveModifierByName("modifier_defiling_plague_disease_dispellable")

end	

function dispelMagic (event)
	local target = event.target
	local caster = event.caster
	local ability = event.ability

	if IsValidEntity(caster) and IsValidEntity(target) then

		if target:GetTeam() == caster:GetTeam() then
			-- Dispelling An ally target of debuffs
			local targetModifiers = target:FindAllModifiersByName("debuff_magic_dispellable")
			if targetModifiers == nil then
			else

			end	
		else
			-- Dispelling An enemy target of buffs

		end
	else
	end
end