function grantMana(event)
	local caster = event.caster

	if IsValidEntity(caster) then
		local entityOwner = caster:GetOwner()

		if IsValidEntity(entityOwner) then

			local entityOwnerClassName = entityOwner:GetClassname() 			--print("entityOwnerClassName: " .. entityOwnerClassName)
			local ability = event.ability

			local stormSpiritMaxMana = entityOwner:GetMaxMana()
			local stormSpiritManaMultiplier = ability:GetLevelSpecialValueFor("mana_percent_float", 0)

			local manaToGive = stormSpiritMaxMana*stormSpiritManaMultiplier

			entityOwner:GiveMana(manaToGive)	

		else
		end

	else
	end

end