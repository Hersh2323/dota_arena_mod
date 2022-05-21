LinkLuaModifier("modifier_sheep_lua", "heroes/globaled_hero_crystal_maiden/modifiers/modifier_sheep_lua.lua", LUA_MODIFIER_MOTION_NONE)

--[[Author: Pizzalol
	Date: 27.09.2015.
	Checks if the target is an illusion, if true then it kills it
	otherwise it applies the hex modifier to the target]]
function sheep_start( keys )
	local caster = keys.caster
	local ability = keys.ability
	local ability_level = ability:GetLevel() - 1
	local target = keys.target

	local duration = ability:GetLevelSpecialValueFor("duration", ability_level)

	target:AddNewModifier(caster, ability, "modifier_sheep_lua", {duration = duration})
end

function sheep_start_half( keys )
	local caster = keys.caster
	local ability = keys.ability
	local ability_level = ability:GetLevel() - 1
	local target = keys.target

	local duration = ability:GetLevelSpecialValueFor("duration_half", ability_level)

	target:AddNewModifier(caster, ability, "modifier_sheep_lua", {duration = duration})
end


function sheep_end( keys )
	local caster = keys.caster
	local ability = keys.ability
	local target = keys.unit

	target:RemoveModifierByNameAndCaster("modifier_sheep_disorient_debuff_full_datadriven", caster)
	target:RemoveModifierByName("modifier_sheep_lua")
	target:RemoveModifierByNameAndCaster("modifier_sheep_disorient_debuff_half_datadriven", caster)
end

function remove_other_sheep (keys)
	local ability = keys.ability
	local caster = keys.caster
	local target = keys.target

	target:RemoveModifierByNameAndCaster("modifier_sheep_disorient_debuff_full_datadriven", caster)
	target:RemoveModifierByNameAndCaster("modifier_sheep_lua", caster)
	target:RemoveModifierByNameAndCaster("modifier_sheep_disorient_debuff_half_datadriven", caster)
end







--[[
	modifier_sheep_disorient_magical_debuff_dispellable_datadriven
	modifier_disorient_dr_datadriven
	modifier_disorient_dr_immune_datadriven
]]



function removeSheepDebuffs(event)
	local caster = event.caster
	local target = event.target

	if IsValidEntity(caster) and IsValidEntity(target) then
		local ability = event.ability

		if target:HasModifier("modifier_sheep_disorient_magical_debuff_dispellable_datadriven") then

			local frameTime = GetFrameCount() print("[removeSheepDebuffs] Current frame " .. frameTime)

			target:RemoveModifierByName("modifier_sheep_disorient_magical_debuff_dispellable_datadriven")
		else
		end
	else
	end
end



function determineSheepDuration(event)
	local caster = event.caster
	local target = event.target

	if IsValidEntity(caster) and IsValidEntity(target) then
		local ability = event.ability
		local duration = ability:GetLevelSpecialValueFor("duration", 0)
		local duration_half = duration*0.5



		if target:HasModifier("modifier_disorient_dr_datadriven") then
			-- apply modifier for half duration
			local frameTime = GetFrameCount() print("[determineSheepDuration] Current frame " .. frameTime)

			ability:ApplyDataDrivenModifier(caster, target, "modifier_sheep_disorient_magical_debuff_dispellable_datadriven", {duration=duration_half})


		elseif target:HasModifier("modifier_disorient_dr_immune_datadriven") then
			-- do nothing but reapply modifier_disorient_dr_immune_datadriven
			local frameTime = GetFrameCount() print("[determineSheepDuration] Current frame " .. frameTime)

			ability:ApplyDataDrivenModifier(caster, target, "modifier_disorient_dr_immune_datadriven", {})


		else
			-- apply modifier full, target is not diminished
			local frameTime = GetFrameCount() print("[determineSheepDuration] Current frame " .. frameTime)

			ability:ApplyDataDrivenModifier(caster, target, "modifier_sheep_disorient_magical_debuff_dispellable_datadriven", {duration=duration})


		end


		caster:Stop()

	else
	end
end



function sheepCreated(event)
	local caster = event.caster
	local target = event.target

	if IsValidEntity(caster) and IsValidEntity(target) then
		local ability = event.ability

		local datadriven_sheep_modifier = target:FindModifierByName("modifier_sheep_disorient_magical_debuff_dispellable_datadriven")
		if datadriven_sheep_modifier == nil then
		else
			local duration_to_apply = datadriven_sheep_modifier:GetDuration() print ("[sheepCreated] duration_to_apply: " .. duration_to_apply)

			target:AddNewModifier(caster, ability, "modifier_sheep_lua", {duration = duration_to_apply})
		end


	else
	end
end



function sheepDestroyed(event)
	local caster = event.caster
	local target = event.target
	
	if IsValidEntity(caster) and IsValidEntity(target) then
		local ability = event.ability


		if target:HasModifier("modifier_disorient_dr_datadriven") then

			ability:ApplyDataDrivenModifier(caster, target, "modifier_disorient_dr_immune_datadriven", {})
		elseif target:HasModifier("modifier_disorient_dr_immune_datadriven") then

			ability:ApplyDataDrivenModifier(caster, target, "modifier_disorient_dr_immune_datadriven", {})
		else

			ability:ApplyDataDrivenModifier(caster, target, "modifier_disorient_dr_datadriven", {})
		end

		if target:HasModifier("modifier_sheep_lua") then		
			target:RemoveModifierByName("modifier_sheep_lua")
		else
		end

	else
	end
end

