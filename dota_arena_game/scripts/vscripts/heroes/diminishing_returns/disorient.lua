function knockoutCheck ( event )
	local caster = event.caster
	local ability = event.ability
	local target = event.target



	if target:HasModifier("modifier_disorient_dr_datadriven") then

		ability:ApplyDataDrivenModifier(caster, target, "modifier_light_strike_array_half_datadriven", {})

	elseif target:HasModifier("modifier_disorient_dr_immune_datadriven") then

		-- do nothing: spells become immune after 2nd application, but trigger dr still
		ability:ApplyDataDrivenModifier(caster, target, "modifier_disorient_dr_immune_datadriven", {})

	else 

		ability:ApplyDataDrivenModifier(caster, target, "modifier_light_strike_array_full_datadriven", {})
	end
end


LinkLuaModifier("modifier_sheep_lua", "heroes/globaled_hero_crystal_maiden/modifiers/modifier_sheep_lua.lua", LUA_MODIFIER_MOTION_NONE)

function sheepCheck ( event )
	local caster = event.caster
	local ability = event.ability
	local target = event.target



	if target:HasModifier("modifier_disorient_dr_datadriven") then

		ability:ApplyDataDrivenModifier(caster, target, "modifier_sheep_disorient_debuff_half_datadriven", {})
		target:AddNewModifier(caster, ability, "modifier_sheep_lua", { duration = 5 })

	elseif target:HasModifier("modifier_disorient_dr_immune_datadriven") then

		-- do nothing: spells become immune after 2nd application, but trigger dr still
		ability:ApplyDataDrivenModifier(caster, target, "modifier_disorient_dr_immune_datadriven", {})

	else 

		ability:ApplyDataDrivenModifier(caster, target, "modifier_sheep_disorient_debuff_full_datadriven", {})
	end
end