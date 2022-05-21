function heal ( event )

	-- Variables
	local caster = event.caster
	local target = event.target
	local ability = event.ability

	-- kv
	local weapon_damage_multiplier = ability:GetLevelSpecialValueFor("weapon_damage", 0)

	local caster_base_damage_min = caster:GetBaseDamageMin() 																--print("[caster_base_damage_min] " .. caster_base_damage_min)
	local caster_base_damage_max = caster:GetBaseDamageMax()																--print("[caster_base_damage_max] " .. caster_base_damage_max)
	local caster_base_damage_combined_possibly_float = caster_base_damage_min + caster_base_damage_max						--print("[caster_base_damage_combined_possibly_float] " .. caster_base_damage_combined_possibly_float)
	local caster_base_damage_combined_possibly_float_average = caster_base_damage_combined_possibly_float/2					--print("[caster_base_damage_combined_possibly_float_average] " .. caster_base_damage_combined_possibly_float_average)		
	local caster_base_damage_combined_average_int = math.ceil(caster_base_damage_combined_possibly_float_average) 			--print("[caster_base_damage_combined_average_int] " .. caster_base_damage_combined_average_int)
	local caster_base_damage = caster_base_damage_combined_average_int 														--print("[caster_base_damage] " .. caster_base_damage)

	local healTotal = caster_base_damage * weapon_damage_multiplier
		target:Heal( healTotal, caster)
end

function healCritical( event )

	-- Variables
	local caster = event.caster
	local target = event.target
	local ability = event.ability
	
	local caster_base_damage_min = caster:GetBaseDamageMin() 																--print("[caster_base_damage_min] " .. caster_base_damage_min)
	local caster_base_damage_max = caster:GetBaseDamageMax()																--print("[caster_base_damage_max] " .. caster_base_damage_max)
	local caster_base_damage_combined_possibly_float = caster_base_damage_min + caster_base_damage_max						--print("[caster_base_damage_combined_possibly_float] " .. caster_base_damage_combined_possibly_float)
	local caster_base_damage_combined_possibly_float_average = caster_base_damage_combined_possibly_float/2					--print("[caster_base_damage_combined_possibly_float_average] " .. caster_base_damage_combined_possibly_float_average)		
	local caster_base_damage_combined_average_int = math.ceil(caster_base_damage_combined_possibly_float_average) 			--print("[caster_base_damage_combined_average_int] " .. caster_base_damage_combined_average_int)
	local caster_base_damage = caster_base_damage_combined_average_int 														--print("[caster_base_damage] " .. caster_base_damage)

	-- kv
	local weapon_damage_multiplier = ability:GetLevelSpecialValueFor("weapon_damage", 0)
	local crit_damage = ability:GetLevelSpecialValueFor("crit_damage", 0)

	local healTotal = caster_base_damage * weapon_damage_multiplier
	local healTotalAfterCrit = healTotal * crit_damage
		target:Heal( healTotalAfterCrit, caster)

	local healToPrint = math.floor( healTotal * crit_damage )
	if healToPrint > 0 then
		PopupNumbers(target, "heal", Vector(0, 255, 0), 2.0, healToPrint, POPUP_SYMBOL_PRE_PLUS, nil)
	else
	end
end
