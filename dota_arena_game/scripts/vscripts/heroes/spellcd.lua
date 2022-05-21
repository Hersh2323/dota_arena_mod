function apply_cd(event)
	local caster = event.caster
	local ability = event.ability
	local ability_cooldown = ability:GetLevelSpecialValueFor("channel_succeed_cooldown", 1) 

	local ability_current_cd = ability:GetCooldownTimeRemaining()
	ability:StartCooldown(ability_cooldown)
end