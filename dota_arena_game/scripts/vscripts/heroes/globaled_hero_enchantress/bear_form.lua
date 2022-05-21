function ModelSwapStart( keys )
	local caster = keys.caster
	local model = keys.model

	-- Saves the original model and attack capability
	if caster.caster_model == nil then
		caster.caster_model = caster:GetModelName()
	end
	caster.caster_attack = caster:GetAttackCapability()

	-- Sets the new model and projectile
	caster:SetOriginalModel(model)

	-- Sets the new attack type
	caster:SetAttackCapability(DOTA_UNIT_CAP_MELEE_ATTACK)
end



function ModelSwapEnd( keys )
	local caster = keys.caster

	caster:Stop()
	caster:SetModel(caster.caster_model)
	caster:SetOriginalModel(caster.caster_model)
	caster:SetAttackCapability(DOTA_UNIT_CAP_NO_ATTACK)
	caster:RemoveModifierByName("modifier_enchantress_bear_model_on_buff_datadriven")
end

function removeBearModifier ( keys )
	local caster = keys.caster

	caster:RemoveModifierByName("modifier_enchantress_bear_model_on_buff_datadriven")
end

function bearFormCheck ( keys )
	local caster = keys.caster
	local target = keys.caster
	local ability = keys.ability


	if keys.caster:HasModifier("modifier_enchantress_bear_model_on_buff_datadriven") then
		keys.caster:RemoveModifierByName("modifier_enchantress_bear_model_on_buff_datadriven")
	else
		keys.ability:ApplyDataDrivenModifier(caster, caster, "modifier_enchantress_bear_model_on_buff_datadriven", {})
	end
end