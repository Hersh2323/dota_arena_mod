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
	caster:SetRangedProjectileName(projectile_model)

	-- Sets the new attack type
	caster:SetAttackCapability(DOTA_UNIT_CAP_MELEE_ATTACK)
end



function ModelSwapEnd( keys )
	local caster = keys.caster
	
	caster:Stop()
	caster:SetModel(caster.caster_model)
	caster:SetOriginalModel(caster.caster_model)
	caster:SetAttackCapability(caster.caster_attack)
end

function removeTreeModifier ( keys )
	local caster = keys.caster
	caster:RemoveModifierByName("modifier_enchantress_tree_model_on_buff_datadriven")
end