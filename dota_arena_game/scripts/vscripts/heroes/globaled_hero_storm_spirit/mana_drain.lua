function manaDrain (event)
	local caster = event.caster
	local target = event.target

	if IsValidEntity(target) and IsValidEntity(caster) then

		local ability = event.ability

		local mana_drain_percentage_float = ability:GetLevelSpecialValueFor("mana_percent", 0)
		local mana_to_damage_percent = ability:GetLevelSpecialValueFor("mana_to_damage_percent", 0)

		local targetMaxMana = target:GetMaxMana() --print("targetMaxMana" .. targetMaxMana)
		local targetCurrentMana = target:GetMana() --print("targetCurrentMana" .. targetCurrentMana)

		local manaToBeRemoved = targetMaxMana*mana_drain_percentage_float --print("manaToBeRemoved" .. manaToBeRemoved)

		local ability_damage_type = ability:GetAbilityDamageType() 

		if targetCurrentMana > manaToBeRemoved then

			local manaPrintValue = math.floor(manaToBeRemoved)
			if manaPrintValue > 0 then
				PopupNumbers(target, "damage", Vector(0, 0, 255), 2.0, manaPrintValue, nil, POPUP_SYMBOL_POST_DROP)
			else
			end

			target:SetMana(targetCurrentMana - manaToBeRemoved)

			local damageTable = {
				victim = target,
				attacker = caster,
				damage_type = ability_damage_type,
				damage = manaToBeRemoved*mana_to_damage_percent
			}
			 
			ApplyDamage(damageTable)

			EmitSoundOn("n_creep_SatyrSoulstealer.ManaBurn", target)

		else

			local damageTable = {
				victim = target,
				attacker = caster,
				damage_type = ability_damage_type,
				damage = targetCurrentMana*mana_drain_percentage_float
			}
			 
			ApplyDamage(damageTable)

			local manaPrintValue = math.floor(manaToBeRemoved)
			if manaPrintValue > 0 then
				PopupNumbers(target, "damage", Vector(0, 0, 255), 2.0, manaPrintValue, nil, POPUP_SYMBOL_POST_DROP)
			else
			end

			target:SetMana(1)

			EmitSoundOn("n_creep_SatyrSoulstealer.ManaBurn", target)

		end



	else
	end
end