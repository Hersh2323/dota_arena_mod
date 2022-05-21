function stealthStunCheck ( keys )
	local caster = keys.caster
	local ability = keys.ability
	local target = keys.target

	local stunDuration = ability:GetLevelSpecialValueFor("stun_duration", 0)

	ability:ApplyDataDrivenModifier(caster, target, "modifier_pa_stealth_unique_stun_datadriven", {duration = stunDuration})

end


function stealthCooldown(event)	
	local caster = event.caster
	local target = event.target
	local ability = event.ability

	-- var
	local cooldown_time = ability:GetLevelSpecialValueFor("cooldown_time", 0)

	ability:StartCooldown(cooldown_time)

end


function isCasterInvisible(event)	
	local caster = event.caster
	local target = event.target
	local ability = event.ability

	if IsValidEntity(caster) then
		if caster:HasModifier("modifier_invisible") then
		else
			caster:RemoveModifierByName("modifier_pa_stealth_invisibility_buff_datadriven")
		end
	else
	end

end