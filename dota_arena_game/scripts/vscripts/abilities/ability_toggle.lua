-- ToggleAbility Off only if its turned On
function ToggleOff( keys )
	local caster = keys.caster

	if IsValidEntity(caster) then
		
		local ability = keys.ability
		if keys.ability:GetToggleState() == true then
			keys.ability:ToggleAbility()
		end

	else
	end

end
