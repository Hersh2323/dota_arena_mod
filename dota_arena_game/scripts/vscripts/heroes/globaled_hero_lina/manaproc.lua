function manaprocLina (event)
	local caster = event.caster
	local abilityb = caster:FindAbilityByName("lina_pb")

	if IsValidEntity(caster) then
		local manaToGive = abilityb:GetLevelSpecialValueFor("mana_proc", 0)
		caster:GiveMana(manaToGive)


	else
	end
end