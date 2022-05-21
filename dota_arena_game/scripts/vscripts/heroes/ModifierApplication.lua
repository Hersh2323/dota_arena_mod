function removeAndApplyOwnModifier (keys)

	-- Variables
	local caster = keys.caster
	local target = keys.target

	if IsValidEntity(caster) and IsValidEntity(target) then

		local ability = keys.ability
		local modifierName = keys.modifierName

		target:RemoveModifierByNameAndCaster(modifierName, caster)
		ability:ApplyDataDrivenModifier(caster, target, modifierName, {})

	else
	end
end

function removeOwnModifier (keys)

	-- Variables
	local caster = keys.caster
	local target = keys.target

	if IsValidEntity(caster) and IsValidEntity(target) then

		local ability = keys.ability
		local modifierName = keys.modifierName

		target:RemoveModifierByNameAndCaster(modifierName, caster)

	else
	end

end


--[[
			"RunScript"
			{
				"ScriptFile"		"heroes/ModifierApplication.lua"
				"Function"			"removeAndApplyOwnModifier"

				"modifierName"		"modifier_rejuvinate_hot_datadriven"
			}

]]