function fastStrikeShatterCheck (keys)

	local caster = keys.caster
	local target = keys.target

	if IsValidEntity(caster) and IsValidEntity(target) then

		local ability = keys.ability

		if target:HasModifier("modifier_external_root_nova_effect_crystal_maiden_debuff_magical_dispellable_datadriven") 
			or target:HasModifier("modifier_external_crystal_nova_root_aquamusprime_debuff_magical_dispellable_datadriven") 
			or target:HasModifier("modifier_internal_shatter_critical_window_crystal_maiden_debuff_magical_undispellable_datadriven")

		then

			if not target:IsMagicImmune() then

				local caster_base_damage_min = caster:GetBaseDamageMin() 																--print("[caster_base_damage_min] " .. caster_base_damage_min)
				local caster_base_damage_max = caster:GetBaseDamageMax()																--print("[caster_base_damage_max] " .. caster_base_damage_max)
				local caster_base_damage_combined_possibly_float = caster_base_damage_min + caster_base_damage_max						--print("[caster_base_damage_combined_possibly_float] " .. caster_base_damage_combined_possibly_float)
				local caster_base_damage_combined_possibly_float_average = caster_base_damage_combined_possibly_float/2					--print("[caster_base_damage_combined_possibly_float_average] " .. caster_base_damage_combined_possibly_float_average)		
				local caster_base_damage_combined_average_int = math.ceil(caster_base_damage_combined_possibly_float_average) 			--print("[caster_base_damage_combined_average_int] " .. caster_base_damage_combined_average_int)
				local caster_base_damage = caster_base_damage_combined_average_int 														--print("[caster_base_damage] " .. caster_base_damage)

				local shatterWeaponDamage = ability:GetLevelSpecialValueFor("shatter_weapon_damage", 0)
				local shatterCritDamage = ability:GetLevelSpecialValueFor("crit_damage", 0)
				local shatterCombinedDamage = caster_base_damage * shatterWeaponDamage

				local damageTable = {
					victim = target,
					attacker = caster,
					damage_type = DAMAGE_TYPE_MAGICAL,
					damage = shatterCombinedDamage * shatterCritDamage
				}

				ApplyDamage(damageTable)

				local damageToPrint = math.floor( shatterCombinedDamage * shatterCritDamage )

				if damageToPrint > 0 then
					PopupNumbers(target, "crit", Vector(255, 0, 0), 2.0, damageToPrint, nil, POPUP_SYMBOL_POST_LIGHTNING)
				else
				end

				ParticleManager:CreateParticle("particles/units/heroes/hero_ancient_apparition/ancient_apparition_ice_blast_death.vpcf", PATTACH_CUSTOMORIGIN_FOLLOW, target)
				EmitSoundOn( "Hero_Winter_Wyvern.SplinterBlast.Splinter", Target )

				--target:RemoveModifierByName("modifier_internal_shatter_critical_window_debuff_magical_undispellable_datadriven")
			else
			end

		else

			if not target:IsMagicImmune() then

				local caster_base_damage_min = caster:GetBaseDamageMin() 																--print("[caster_base_damage_min] " .. caster_base_damage_min)
		local caster_base_damage_max = caster:GetBaseDamageMax()																--print("[caster_base_damage_max] " .. caster_base_damage_max)
		local caster_base_damage_combined_possibly_float = caster_base_damage_min + caster_base_damage_max						--print("[caster_base_damage_combined_possibly_float] " .. caster_base_damage_combined_possibly_float)
		local caster_base_damage_combined_possibly_float_average = caster_base_damage_combined_possibly_float/2					--print("[caster_base_damage_combined_possibly_float_average] " .. caster_base_damage_combined_possibly_float_average)		
		local caster_base_damage_combined_average_int = math.ceil(caster_base_damage_combined_possibly_float_average) 			--print("[caster_base_damage_combined_average_int] " .. caster_base_damage_combined_average_int)
		local caster_base_damage = caster_base_damage_combined_average_int 														--print("[caster_base_damage] " .. caster_base_damage)

				local shatterWeaponDamage = ability:GetLevelSpecialValueFor("non_shatter_weapon_damage", 0)
				local shatterCombinedDamage = caster_base_damage * shatterWeaponDamage


				local damageTable = {
					victim = target,
					attacker = caster,
					damage_type = DAMAGE_TYPE_MAGICAL,
					damage = shatterCombinedDamage
				}

				ApplyDamage(damageTable)

			else
			end
		end

	else
	end

end