function turnFleshBaseDmgReduction ( event )
	local caster = event.caster
	local target = event.target
	local ability = event.ability

	if not target:IsMagicImmune() then

		local caster_base_damage_min = target:GetBaseDamageMin() 																--print("[caster_base_damage_min] " .. caster_base_damage_min)
		local caster_base_damage_max = target:GetBaseDamageMax()																--print("[caster_base_damage_max] " .. caster_base_damage_max)
		local caster_base_damage_combined_possibly_float = caster_base_damage_min + caster_base_damage_max						--print("[caster_base_damage_combined_possibly_float] " .. caster_base_damage_combined_possibly_float)
		local caster_base_damage_combined_possibly_float_average = caster_base_damage_combined_possibly_float/2					--print("[caster_base_damage_combined_possibly_float_average] " .. caster_base_damage_combined_possibly_float_average)		
		local caster_base_damage_combined_average_int = math.ceil(caster_base_damage_combined_possibly_float_average) 			--print("[caster_base_damage_combined_average_int] " .. caster_base_damage_combined_average_int)
		local caster_base_damage = caster_base_damage_combined_average_int 														--print("[caster_base_damage] " .. caster_base_damage)

		local taretBaseDamage = caster_base_damage


		local abilityDamageReductionPercentage = ability:GetLevelSpecialValueFor("weapon_damage", 0)
		local targetDmgReductionAmmount = targetBaseDamage * abilityDamageReductionPercentage
		local targetDesiredDmgReduction = taretBaseDamage - targetDmgReductionAmmount
		target:SetBaseDamageMin(targetDesiredDmgReduction)
		target:SetBaseDamageMax(targetDesiredDmgReduction)
	else
	end
end