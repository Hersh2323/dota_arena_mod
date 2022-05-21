function ControlledStunRemove(keys)
	-- Controlled Stun DR
	local target = keys.target

	if target:HasModifier("modifier_pa_controlled_stun_datadriven") then
		target:RemoveModifierByName("modifier_pa_controlled_stun_datadriven")
		else
	end
	
end


function disorientRemove(event)
	-- Disorient DR
	local caster = event.caster
	local ability = event.ability
	local target = event.target

	if target:HasModifier("modifier_sheep_disorient_debuff_datadriven") then
		target:RemoveModifierByName("modifier_sheep_disorient_debuff_datadriven")
	else
	end

	if target:HasModifier("modifier_sheep_lua") then
		target:RemoveModifierByName("modifier_sheep_lua")
	else
	end
	
	if target:HasModifier("modifier_light_strike_array_datadriven") then
		target:RemoveModifierByName("modifier_light_strike_array_datadriven")
	else
	end


end
