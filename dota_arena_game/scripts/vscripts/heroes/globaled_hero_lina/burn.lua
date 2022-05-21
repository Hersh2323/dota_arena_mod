function burnDamage (event)
	local caster = event.caster
	local target = event.target
	local ability = event.ability

	if IsValidEntity(caster) and IsValidEntity(target) and not target:IsMagicImmune() then

		local ability = event.ability
		local caster_base_damage_min = caster:GetBaseDamageMin() 																--print("[caster_base_damage_min] " .. caster_base_damage_min)
		local caster_base_damage_max = caster:GetBaseDamageMax()																--print("[caster_base_damage_max] " .. caster_base_damage_max)
		local caster_base_damage_combined_possibly_float = caster_base_damage_min + caster_base_damage_max						--print("[caster_base_damage_combined_possibly_float] " .. caster_base_damage_combined_possibly_float)
		local caster_base_damage_combined_possibly_float_average = caster_base_damage_combined_possibly_float/2					--print("[caster_base_damage_combined_possibly_float_average] " .. caster_base_damage_combined_possibly_float_average)		
		local caster_base_damage_combined_average_int = math.ceil(caster_base_damage_combined_possibly_float_average) 			--print("[caster_base_damage_combined_average_int] " .. caster_base_damage_combined_average_int)
		local caster_base_damage = caster_base_damage_combined_average_int 														--print("[caster_base_damage] " .. caster_base_damage)

		local weapon_damage_multiplier_total = ability:GetLevelSpecialValueFor("burn_weapon_damage_total", 0)

		--local crit_chance = ability:GetLevelSpecialValueFor("crit_chance", 0)
		--local crit_damage = ability:GetLevelSpecialValueFor("crit_damage", 0)

		local burn_duration = ability:GetLevelSpecialValueFor("burn_duration", 0)
		local burn_tick_interval = ability:GetLevelSpecialValueFor("burn_think_interval", 0)

		local ticksPerDuration = burn_duration / burn_tick_interval
		local weaponDamagePerTick = weapon_damage_multiplier_total / ticksPerDuration 


		local damageNonCritical = caster_base_damage*weaponDamagePerTick  print("burn damageNonCritical: " .. damageNonCritical)

--[[
		local damageCritical = damageNonCritical*crit_damage			print("burn damageCritical: " .. damageCritical)

		local crit_roll = RandomFloat(1, 100) -- print("[crit_roll] " .. crit_roll)
		if crit_roll <= crit_chance then

			-- critical
			local damageTable = {
				victim = target,
				attacker = caster,
				damage_type = DAMAGE_TYPE_MAGICAL,
				damage = damageCritical
			}
			 
			ApplyDamage(damageTable)

			local damageToPrint = math.floor( damageCritical )
			if damageToPrint > 0 then		
				PopupNumbers(target, "crit", Vector(0,0,255), 2.0, damageToPrint, nil, POPUP_SYMBOL_POST_LIGHTNING)
			else
			end
		else
		end
]]



	else
	end
end