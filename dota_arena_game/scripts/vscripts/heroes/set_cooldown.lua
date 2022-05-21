-- for PA stealth
function setCooldownStealth( keys )
	local ability = keys.ability
	local coolDownTime = ability:GetLevelSpecialValueFor("cooldown_time", 0)
	ability:StartCooldown(coolDownTime)
end

function setCooldownCastPoint( keys )
	local ability = keys.ability

	local coolDownTime = ability:GetCastPoint()
	ability:StartCooldown(coolDownTime)
end