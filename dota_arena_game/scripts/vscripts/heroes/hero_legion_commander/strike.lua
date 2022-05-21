


function lc_strike_mana_check( event )
	local caster = event.caster
	local ability = event.ability
	local targets = event.target_entities
	
	-- Check if the spell mana cost can be maintained
	if caster:GetMana() >= 30 then
		if ability:GetToggleState() == true then
			ability:ToggleAbility()
		end
	else
		
	end
end