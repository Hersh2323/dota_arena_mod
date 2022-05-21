function setCooldownHook( keys )
	local ability = keys.ability
	local coolDownTime = ability:GetLevelSpecialValueFor("cooldown_time", 0)
	ability:StartCooldown(coolDownTime)
end