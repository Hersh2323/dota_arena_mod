function removeAndApplyOwnModifierCurses (keys)

	-- Variables
	local caster = keys.caster
	local target = keys.target
	local ability = keys.ability

	local modifierName = keys.modifierName

	if not target:IsMagicImmune() then


		--local curseCD1 = caster:FindAbilityByName()
		--local curseCD2 = caster:FindAbilityByName()
		--local curseCD3 = caster:FindAbilityByName()

		target:RemoveModifierByNameAndCaster(modifierName, caster)

		target:RemoveModifierByNameAndCaster("modifier_necrolyte_dot_three_debuff_datadriven", caster)
		-- deteriorate
		target:RemoveModifierByNameAndCaster("modifier_necrolyte_demo_debuff_datadriven", caster)
		target:RemoveModifierByNameAndCaster("modifier_necrolyte_enfeeble_debuff_datadriven", caster)

		ability:ApplyDataDrivenModifier(caster, target, modifierName, {})
	else
	end
end

--[[
		"RunScript"
		{
			"ScriptFile"		"heroes/globaled_hero_necrolyte/curses.lua"
			"Function"			"removeAndApplyOwnModifierCurses"

			"modifierName"		"modifier_necrolyte_dot_three_debuff_datadriven"
		}


]]