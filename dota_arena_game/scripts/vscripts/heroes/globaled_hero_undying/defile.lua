
function ability_undying_defile_debuff_application(event)
	local ability = event.ability
	local caster = event.caster
	local target = event.target


	if ability and IsValidEntity(caster) and IsValidEntity(target)and not target:IsMagicImmune() then

		local debuff_modifier = target:FindModifierByNameAndCaster("modifier_defiling_plague_disease_dispellable", caster)
		if debuff_modifier then
			debuff_modifier:ForceRefresh()
			EmitSoundOn("Hero_Undying.Decay.Target", target)

		else
			ability:ApplyDataDrivenModifier( caster, target, "modifier_defiling_plague_disease_dispellable", {} )
			EmitSoundOn("Hero_Undying.Decay.Target", target)
		end
	else
		print("ability_undying_defile_debuff_application failed.")
	end
	--local damage_to_deal_after_critical_strike_roll_and_calculation = 
	--print("This is printing from intial called function: custom_damage_test " .. caster_base_damage_caluclated)
end