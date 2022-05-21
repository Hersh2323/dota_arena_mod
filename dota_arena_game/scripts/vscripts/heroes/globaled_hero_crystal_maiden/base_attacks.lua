function rightClickDamage( event )

	-- Variables
	local caster = event.caster
	local target = event.target
	local ability = event.ability
	local damage_dealt = event.attack_damage


	if IsValidEntity(caster) and IsValidEntity(target) then

		if damage_dealt == nil then
		else

			if damage_dealt >= 1 then

				target:Heal(damage_dealt, caster)

			else
			end
			
		end

	else
	end



--[[
	local damageTable = {
		victim = target,
		attacker = caster,
		damage_type = DAMAGE_TYPE_MAGICAL,
		damage = caster_base_damage,
	}
	 
	ApplyDamage(damageTable)


]]

end
