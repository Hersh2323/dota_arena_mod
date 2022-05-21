function pain(event)
	local caster = event.caster
	local ability = event.ability
	local target = caster

	if IsValidEntity(caster) then

		local base_damage = caster
		local caster_base_damage_min = caster:GetBaseDamageMin() 																--print("[caster_base_damage_min] " .. caster_base_damage_min)
		local caster_base_damage_max = caster:GetBaseDamageMax()																--print("[caster_base_damage_max] " .. caster_base_damage_max)
		local caster_base_damage_combined_possibly_float = caster_base_damage_min + caster_base_damage_max						--print("[caster_base_damage_combined_possibly_float] " .. caster_base_damage_combined_possibly_float)
		local caster_base_damage_combined_possibly_float_average = caster_base_damage_combined_possibly_float/2					--print("[caster_base_damage_combined_possibly_float_average] " .. caster_base_damage_combined_possibly_float_average)		
		local caster_base_damage_combined_average_int = math.ceil(caster_base_damage_combined_possibly_float_average) 			--print("[caster_base_damage_combined_average_int] " .. caster_base_damage_combined_average_int)
		local caster_base_damage = caster_base_damage_combined_average_int 														--print("[caster_base_damage] " .. caster_base_damage)

		local weapon_damage = ability:GetLevelSpecialValueFor("weapon_damage", 0)
		local ability_damage_type = ability:GetAbilityDamageType() 

		local damageTable = {
			victim = caster,
			attacker = caster,
			damage_type = ability_damage_type,
			damage = caster_base_damage*weapon_damage
		}
		 
		ApplyDamage(damageTable)

		local damageToPrint = math.floor( caster_base_damage*weapon_damage )

		if damageToPrint > 0 then
			PopupNumbers(target, "crit", Vector(255, 0, 0), 2.0, damageToPrint, nil, POPUP_SYMBOL_POST_LIGHTNING)
		else
		end

	else
	end
end