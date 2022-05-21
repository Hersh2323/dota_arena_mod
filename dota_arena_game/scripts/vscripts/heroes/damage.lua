function custom_base_damage_calculation(caster) -- returns weapon damage value in integer
	local caster = caster

	local base_damage_min = caster:GetBaseDamageMin() 																
	local base_damage_max = caster:GetBaseDamageMax()	

	if IsValidEntity(caster) then

		local caster_base_damage_combined_possibly_float = base_damage_min + base_damage_max						--print("[caster_base_damage_combined_possibly_float] " .. caster_base_damage_combined_possibly_float)
		local caster_base_damage_combined_average_int = math.ceil(caster_base_damage_combined_possibly_float/2) 			--print("[caster_base_damage_combined_average_int] " .. caster_base_damage_combined_average_int)
		local caster_base_damage_caluclated = caster_base_damage_combined_average_int 											--print("[caster_base_damage_caluclated] " .. caster_base_damage_caluclated)

		return caster_base_damage_caluclated
	else
	end

end






function damage_output_post_critical_strike_roll(event, ability, caster, target, base_crit_chance, crit_damage, weapon_damage, damage_type, caster_base_damage_caluclated)
	
	if ability and caster and target and base_crit_chance and crit_damage and weapon_damage and damage_type and caster_base_damage_caluclated then

		local crit_chance = base_crit_chance
		local weapon_damage = weapon_damage

		local abilityName = ability:GetAbilityName()
		--print("-------------- [ ABILITY CRIT CHANCE ROLL ] -------------- Ability: " .. abilityName)
		--print("-------------- [ CASTER BASE CRIT CHANCE ] -------------- Base Crit Chance: " .. base_crit_chance)
		--print("-------------- [ CASTER BONUS CRIT CHANCE ] -------------- Bonus Crit Chance: " .. critical_strike_bonus_modifier_stack_value_int)
		--print("-------------- [ COMBINED CRIT CHANCE ] -------------- Combined Crit Chance:" .. crit_chance)

		local caster_base_damage_caluclated = caster_base_damage_caluclated
		local damage_type = damage_type
		local damageNonCritical = caster_base_damage_caluclated*weapon_damage 
		local damageCritical = damageNonCritical*crit_damage

		local crit_roll = RandomFloat(1, 100)
		--print("-------------- [ ABILITY CRIT ROLL ] -------------- " .. crit_roll)


		if crit_roll <= crit_chance then

			-- critical
			local damageTable = {
				victim = target,
				attacker = caster,
				damage_type = damage_type,
				damage = damageCritical
			}
			 
			ApplyDamage(damageTable)

			local damageToPrint = math.floor( damageCritical )
			if damageToPrint > 0 then		
				PopupCriticalDamage(target, damageToPrint)
			else
			end

		else
			-- non crit
			local damageTable = {
				victim = target,
				attacker = caster,
				damage_type = damage_type,
				damage = damageNonCritical
			}
			 
			ApplyDamage(damageTable)
		end


	else
	end



end




function ability_whirlwind_damage(event)
	-- these variables will be passed on for use in base damage and damage calculation & application functions
	local ability = event.ability
	local caster = event.caster
	local target = event.target

	-- this ability definition will be used for later use for base critical strike chance and critical damage
	local abilitySourceForCrit = caster:FindAbilityByName("legion_commander_potion_pb")

	if ability and IsValidEntity(caster) and IsValidEntity(target) and target:IsAlive() and abilitySourceForCrit then
	-- I tend to use boolean checks to ensure im not attempting to perform actions on an invalid entity.


		local caster_base_damage_caluclated = custom_base_damage_calculation(caster) -- returns weapon damage value in integer

		local base_crit_chance = abilitySourceForCrit:GetLevelSpecialValueFor("crit_chance", 0)
		local crit_damage = abilitySourceForCrit:GetLevelSpecialValueFor("crit_damage", 0)

		local weapon_damage = ability:GetLevelSpecialValueFor( "ability_weapon_damage", ( ability:GetLevel() - 1 ) ) / 100
		local damage_type = ability:GetAbilityDamageType()

		damage_output_post_critical_strike_roll(event, ability, caster, target, base_crit_chance, crit_damage, weapon_damage, damage_type, caster_base_damage_caluclated)

	else
	end
end





function ability_strike_damage(event)
	local ability = event.ability
	local caster = event.caster
	local target = caster:GetAttackTarget()





	if caster:GetUnitName() == "npc_dota_hero_legion_commander" and IsValidEntity(caster) then

		if target and IsValidEntity(target) and target:IsAlive() then

			local caster_base_damage_caluclated = custom_base_damage_calculation(caster) -- returns weapon damage value in integer

			local abilitySourceForCrit = caster:FindAbilityByName("legion_commander_potion_pb")
			local base_crit_chance = abilitySourceForCrit:GetLevelSpecialValueFor("crit_chance", 0)
			local crit_damage = abilitySourceForCrit:GetLevelSpecialValueFor("crit_damage", 0)
			local weapon_damage = ability:GetLevelSpecialValueFor( "ability_weapon_damage", ( ability:GetLevel() - 1 ) ) / 100
			local damage_type = ability:GetAbilityDamageType()

			local target_hull = target:GetHullRadius()
			local caster_hull = caster:GetHullRadius()
			local caster_attack_range = caster:GetAttackRange()
			local melee_cast_range = target_hull + caster_hull + caster_attack_range

			local casterPos = caster:GetAbsOrigin()
			local targetPos = target:GetAbsOrigin()

			local difference = targetPos - casterPos
			print( difference:Length2D() )



			local mana_cost = ability:GetLevelSpecialValueFor("mana_cost", 0)
			local caster_current_mana = caster:GetMana()


			if mana_cost > caster_current_mana then
				
			end

			if difference:Length2D() < melee_cast_range+1 and mana_cost <= caster_current_mana then

				caster:SpendMana(mana_cost, ability)

				damage_output_post_critical_strike_roll(event, ability, caster, target, base_crit_chance, crit_damage, weapon_damage, damage_type, caster_base_damage_caluclated)

				EmitSoundOnLocationWithCaster(casterPos, "Hero_LegionCommander.Courage", caster)

    			StartAnimation(caster, {duration=0.4, activity=ACT_DOTA_ATTACK, rate=2.0})

    			ParticleManager:CreateParticle("particles/units/heroes/hero_tinker/tinker_base_attack_explosion_flash_b.vpcf", PATTACH_ABSORIGIN, caster)

				local cooldown = ability:GetLevelSpecialValueFor("ability_cooldown", 0)

				ability:StartCooldown(cooldown)


			end
		else

		end

		if ability:GetToggleState() == true then
			ability:ToggleAbility()
		end

	else
	end





	
	--local damage_to_deal_after_critical_strike_roll_and_calculation = 
	
	--print("This is printing from intial called function: custom_damage_test " .. caster_base_damage_caluclated)
end







function ability_undying_infest_blood(event)
	local ability = event.ability
	local caster = event.caster
	local target = caster:GetAttackTarget()

	if caster:GetUnitName() == "npc_dota_hero_undying" and IsValidEntity(caster) then

		if target and IsValidEntity(target) and target:IsAlive() then

			local caster_base_damage_caluclated = custom_base_damage_calculation(caster) -- returns weapon damage value in integer
			local abilitySourceForCrit = caster:FindAbilityByName("undying_pb")
			local base_crit_chance = abilitySourceForCrit:GetLevelSpecialValueFor("crit_chance", 0)
			local crit_damage = abilitySourceForCrit:GetLevelSpecialValueFor("crit_damage", 0)
			local weapon_damage = ability:GetLevelSpecialValueFor( "instant_strike_weapon_damage", ( ability:GetLevel() - 1 ) ) / 100
			local damage_type = ability:GetAbilityDamageType()

			local target_hull = target:GetHullRadius()
			local caster_hull = caster:GetHullRadius()
			local caster_attack_range = caster:GetAttackRange()
			local melee_cast_range = target_hull + caster_hull + caster_attack_range

			local casterPos = caster:GetAbsOrigin()
			local targetPos = target:GetAbsOrigin()

			local difference = targetPos - casterPos
			print( difference:Length2D() )



			local mana_cost = ability:GetLevelSpecialValueFor("mana_cost", 0)
			local caster_current_mana = caster:GetMana()

			if difference:Length2D() < melee_cast_range+1 and mana_cost <= caster_current_mana then

				caster:SpendMana(mana_cost, ability)

				damage_output_post_critical_strike_roll(event, ability, caster, target, base_crit_chance, crit_damage, weapon_damage, damage_type, caster_base_damage_caluclated)

				EmitSoundOnLocationWithCaster(casterPos, "Hero_Meepo.Attack", caster)
    			StartAnimation(caster, {duration=0.4, activity=ACT_DOTA_ATTACK, rate=1.5})
    			--ParticleManager:CreateParticle("particles/units/heroes/hero_tinker/tinker_base_attack_explosion_flash_b.vpcf", PATTACH_ABSORIGIN, caster)

				local cooldown = ability:GetLevelSpecialValueFor("ability_cooldown", 0)
				ability:StartCooldown(cooldown)

				local abilityTwo = caster:FindAbilityByName("undying_chill_bones")
				if abilityTwo then
					local cooldownTwo = 1.5
					abilityTwo:StartCooldown(cooldownTwo)
				end

				local abilityTwo = caster:FindAbilityByName("undying_pb")
				if abilityTwo then
					local cooldownTwo = 1.5
					abilityTwo:StartCooldown(cooldownTwo)
				end


				local debuff_modifier = target:FindModifierByNameAndCaster("modifier_undying_infest_blood_disease_dispellable", caster)
				if debuff_modifier then
					debuff_modifier:ForceRefresh()
					EmitSoundOn("Hero_Undying.SoulRip.Cast", target)

				else
					ability:ApplyDataDrivenModifier( caster, target, "modifier_undying_infest_blood_disease_dispellable", {} )
					EmitSoundOn("Hero_Undying.SoulRip.Cast", target)

				end
			else
				EmitSoundOnClient("General.Cancel", caster:GetPlayerOwner())
			end
		else
			EmitSoundOnClient("General.Cancel", caster:GetPlayerOwner())
		end
	else
	end
	--local damage_to_deal_after_critical_strike_roll_and_calculation = 
	--print("This is printing from intial called function: custom_damage_test " .. caster_base_damage_caluclated)
end



function ability_undying_infest_blood_dot_tick(event)
	local ability = event.ability
	local caster = event.caster
	local target = event.target


	if IsValidEntity(target) and IsValidEntity(caster) then

		local caster_base_damage_caluclated = custom_base_damage_calculation(caster) -- returns weapon damage value in integer

		local abilitySourceForCrit = caster:FindAbilityByName("undying_pb")
		local base_crit_chance = abilitySourceForCrit:GetLevelSpecialValueFor("crit_chance", 0)
		local crit_damage = abilitySourceForCrit:GetLevelSpecialValueFor("crit_damage", 0)
		local weapon_damage_total = ability:GetLevelSpecialValueFor( "debuff_total_weapon_damage", ( ability:GetLevel() - 1 ) ) / 100
		local debuff_duration = ability:GetLevelSpecialValueFor( "debuff_duration", ( ability:GetLevel() - 1 ) )
		local debuff_think_interval = ability:GetLevelSpecialValueFor( "debuff_think_interval", ( ability:GetLevel() - 1 ) )
		local ticks_per_debuff_duration = debuff_duration / debuff_think_interval 				--print("ticks_per_debuff_duration: " .. ticks_per_debuff_duration)
		local weapon_damage = weapon_damage_total / ticks_per_debuff_duration print("weapon_damage: " .. weapon_damage)

		local damage_type = ability:GetAbilityDamageType()

		damage_output_post_critical_strike_roll(event, ability, caster, target, base_crit_chance, crit_damage, weapon_damage, damage_type, caster_base_damage_caluclated)

	else
	end
	--local damage_to_deal_after_critical_strike_roll_and_calculation = 
	--print("This is printing from intial called function: custom_damage_test " .. caster_base_damage_caluclated)
end



function ability_undying_chill_bones(event)
	local ability = event.ability
	local caster = event.caster
	local target = caster:GetAttackTarget()


	if caster:GetUnitName() == "npc_dota_hero_undying" and IsValidEntity(caster) then

		if target and IsValidEntity(target) and target:IsAlive() then

			local caster_base_damage_caluclated = custom_base_damage_calculation(caster) -- returns weapon damage value in integer

			local abilitySourceForCrit = caster:FindAbilityByName("undying_pb")
			local base_crit_chance = abilitySourceForCrit:GetLevelSpecialValueFor("crit_chance", 0)
			local crit_damage = abilitySourceForCrit:GetLevelSpecialValueFor("crit_damage", 0)
			local weapon_damage = ability:GetLevelSpecialValueFor( "instant_strike_weapon_damage", ( ability:GetLevel() - 1 ) ) / 100

			local damage_type = ability:GetAbilityDamageType()

			local target_hull = target:GetHullRadius()
			local caster_hull = caster:GetHullRadius()
			local caster_attack_range = caster:GetAttackRange()
			local melee_cast_range = target_hull + caster_hull + caster_attack_range


			local cast_range = ability:GetLevelSpecialValueFor( "ability_cast_range", ability:GetLevel() )
			print(cast_range)
			local casterPos = caster:GetAbsOrigin()
			local targetPos = target:GetAbsOrigin()

			local difference = targetPos - casterPos
			print( difference:Length2D() )

			local mana_cost = ability:GetLevelSpecialValueFor("mana_cost", 0)
			local caster_current_mana = caster:GetMana()

			if difference:Length2D() < melee_cast_range+1 and mana_cost <= caster_current_mana then

				caster:SpendMana(mana_cost, ability)

				damage_output_post_critical_strike_roll(event, ability, caster, target, base_crit_chance, crit_damage, weapon_damage, damage_type, caster_base_damage_caluclated)

				EmitSoundOnLocationWithCaster(casterPos, "Hero_Meepo.Attack", caster)
    			StartAnimation(caster, {duration=0.4, activity=ACT_DOTA_ATTACK, rate=1.5})
    			--ParticleManager:CreateParticle("particles/units/heroes/hero_tinker/tinker_base_attack_explosion_flash_b.vpcf", PATTACH_ABSORIGIN, caster)

				local cooldown = ability:GetLevelSpecialValueFor("ability_cooldown", 0)
				ability:StartCooldown(cooldown)

				local abilityTwo = caster:FindAbilityByName("undying_infest_blood")
				if abilityTwo then
					local cooldownTwo = 1.5

					local remaining_cd = abilityTwo:GetCooldownTimeRemaining()
					if remaining_cd < cooldownTwo then
						abilityTwo:StartCooldown(cooldownTwo)
					end
				end


				local abilityTwo = caster:FindAbilityByName("undying_pb")
				if abilityTwo then
					local cooldownTwo = 1.5
					abilityTwo:StartCooldown(cooldownTwo)
				end

				local debuff_modifier = target:FindModifierByNameAndCaster("modifier_undying_chill_bones_disease_dispellable", caster)
				if debuff_modifier then
					debuff_modifier:ForceRefresh()

					EmitSoundOn("Hero_Ancient_Apparition.ColdFeetTick", target)

				else
					ability:ApplyDataDrivenModifier( caster, target, "modifier_undying_chill_bones_disease_dispellable", {} )
				end

				ability:ApplyDataDrivenModifier( caster, target, "modifier_undying_chill_bones_attack_speed_debuff_disease_dispellable", {} )

			else
				EmitSoundOnClient("General.Cancel", caster:GetPlayerOwner())

				print("target and IsValidEntity(target) and target:IsAlive() has passed false")

			end
		else

			EmitSoundOnClient("General.Cancel", caster:GetPlayerOwner())
		end
	else
	end
	--local damage_to_deal_after_critical_strike_roll_and_calculation = 
	--print("This is printing from intial called function: custom_damage_test " .. caster_base_damage_caluclated)
end


function ability_undying_infest_blood_dot_tick(event)
	local ability = event.ability
	local caster = event.caster
	local target = event.target


	if IsValidEntity(target) and IsValidEntity(caster) then

		local caster_base_damage_caluclated = custom_base_damage_calculation(caster) -- returns weapon damage value in integer

		local abilitySourceForCrit = caster:FindAbilityByName("undying_pb")
		local base_crit_chance = abilitySourceForCrit:GetLevelSpecialValueFor("crit_chance", 0)
		local crit_damage = abilitySourceForCrit:GetLevelSpecialValueFor("crit_damage", 0)
		local weapon_damage_total = ability:GetLevelSpecialValueFor( "debuff_total_weapon_damage", ( ability:GetLevel() - 1 ) ) / 100
		local debuff_duration = ability:GetLevelSpecialValueFor( "debuff_duration", ( ability:GetLevel() - 1 ) )
		local debuff_think_interval = ability:GetLevelSpecialValueFor( "debuff_think_interval", ( ability:GetLevel() - 1 ) )
		local ticks_per_debuff_duration = debuff_duration / debuff_think_interval 				--print("ticks_per_debuff_duration: " .. ticks_per_debuff_duration)
		local weapon_damage = weapon_damage_total / ticks_per_debuff_duration print("weapon_damage: " .. weapon_damage)

		local damage_type = ability:GetAbilityDamageType()

		if IsValidEntity(target) and target:IsAlive() then

			damage_output_post_critical_strike_roll(event, ability, caster, target, base_crit_chance, crit_damage, weapon_damage, damage_type, caster_base_damage_caluclated)

		else
		end
	else
	end
	--local damage_to_deal_after_critical_strike_roll_and_calculation = 
	--print("This is printing from intial called function: custom_damage_test " .. caster_base_damage_caluclated)
end


function decaying_circle_damage(event)
	local ability = event.ability
	local caster = event.caster
	local target = event.target

	if caster:GetUnitName() == "npc_dota_hero_undying" and IsValidEntity(caster) then

		local caster_base_damage_caluclated = custom_base_damage_calculation(caster) -- returns weapon damage value in integer

		local abilitySourceForCrit = caster:FindAbilityByName("undying_pb")
		local base_crit_chance = abilitySourceForCrit:GetLevelSpecialValueFor("crit_chance", 0)
		local crit_damage = abilitySourceForCrit:GetLevelSpecialValueFor("crit_damage", 0)

		local weapon_damage_total = ability:GetLevelSpecialValueFor( "circle_total_weapon_damage", ( ability:GetLevel() - 1 ) ) / 100
		local debuff_duration = ability:GetLevelSpecialValueFor( "duration", ( ability:GetLevel() - 1 ) )
		local debuff_think_interval = ability:GetLevelSpecialValueFor( "circle_tick_rate", ( ability:GetLevel() - 1 ) )
		local ticks_per_debuff_duration = debuff_duration / debuff_think_interval 				--print("ticks_per_debuff_duration: " .. ticks_per_debuff_duration)
		local weapon_damage = weapon_damage_total / ticks_per_debuff_duration print("weapon_damage: " .. weapon_damage)
		local damage_type = ability:GetAbilityDamageType()


		local damage_type = ability:GetAbilityDamageType()

		if target and IsValidEntity(target) and target:IsAlive() and not target:IsMagicImmune() then

			damage_output_post_critical_strike_roll(event, ability, caster, target, base_crit_chance, crit_damage, weapon_damage, damage_type, caster_base_damage_caluclated)

		else
		end
	else
	end
end





function ability_undying_defiling_strike(event)
	local ability = event.ability
	local caster = event.caster
	local target = caster:GetAttackTarget()


	if caster:GetUnitName() == "npc_dota_hero_undying" and IsValidEntity(caster) then




		if target and IsValidEntity(target) and target:IsAlive() then

			local caster_base_damage_caluclated = custom_base_damage_calculation(caster) -- returns weapon damage value in integer

			local abilitySourceForCrit = caster:FindAbilityByName("undying_pb")
			local base_crit_chance = abilitySourceForCrit:GetLevelSpecialValueFor("crit_chance", 0)
			local crit_damage = abilitySourceForCrit:GetLevelSpecialValueFor("crit_damage", 0)

			local weapon_damage = ability:GetLevelSpecialValueFor( "instant_strike_weapon_damage", ( ability:GetLevel() - 1 ) ) / 100
			local weapon_damage_bonus_per_disease = ability:GetLevelSpecialValueFor( "instant_strike_weapon_damage_bonus_per_disease", ( ability:GetLevel() - 1 ) ) / 100

			local damage_type = ability:GetAbilityDamageType()


			local target_hull = target:GetHullRadius()
			local caster_hull = caster:GetHullRadius()
			local caster_attack_range = caster:GetAttackRange()
			local melee_cast_range = target_hull + caster_hull + caster_attack_range

			local cast_range = ability:GetLevelSpecialValueFor( "ability_cast_range", ability:GetLevel() )
			print(cast_range)
			local casterPos = caster:GetAbsOrigin()
			local targetPos = target:GetAbsOrigin()

			local difference = targetPos - casterPos
			print( difference:Length2D() )

			local mana_cost = ability:GetLevelSpecialValueFor("mana_cost", 0)
			local caster_current_mana = caster:GetMana()

			if difference:Length2D() < melee_cast_range+1 and mana_cost <= caster_current_mana then

				local disease_count = 0
				local infest_blood_modifier = target:FindModifierByNameAndCaster("modifier_undying_infest_blood_disease_dispellable", caster)
				local chill_bones_modifier = target:FindModifierByNameAndCaster("modifier_undying_chill_bones_disease_dispellable", caster)
				local defiling_plague_modifier = target:FindModifierByNameAndCaster("modifier_defiling_plague_disease_dispellable", caster)

				if infest_blood_modifier then
					disease_count = disease_count+1
				end

				if chill_bones_modifier then
					disease_count = disease_count+1
				end

				if defiling_plague_modifier then
					disease_count = disease_count+1
				end

				if disease_count then
					print("Disease count is currently: " .. disease_count)
				end

				local additional_bonus_damage = weapon_damage_bonus_per_disease * disease_count
				weapon_damage = weapon_damage + additional_bonus_damage

				--print("Weapon damage is: " .. weapon_damage)

				caster:SpendMana(mana_cost, ability)

				damage_output_post_critical_strike_roll(event, ability, caster, target, base_crit_chance, crit_damage, weapon_damage, damage_type, caster_base_damage_caluclated)

				EmitSoundOnLocationWithCaster(casterPos, "Hero_Meepo.Attack", caster)
    			StartAnimation(caster, {duration=0.4, activity=ACT_DOTA_ATTACK, rate=1.5})
    			--ParticleManager:CreateParticle("particles/units/heroes/hero_tinker/tinker_base_attack_explosion_flash_b.vpcf", PATTACH_ABSORIGIN, caster)

				local cooldown = ability:GetLevelSpecialValueFor("ability_cooldown", 0)
				ability:StartCooldown(cooldown)

				local abilityTwo = caster:FindAbilityByName("undying_infest_blood")
				if abilityTwo then
					local cooldownTwo = 1.5
					abilityTwo:StartCooldown(cooldownTwo)
				end

				local abilityTwo = caster:FindAbilityByName("undying_chill_bones")
				if abilityTwo then
					local cooldownTwo = 1.5
					abilityTwo:StartCooldown(cooldownTwo)
				end

			else

				EmitSoundOnClient("General.Cancel", caster:GetPlayerOwner())
				--print("target and IsValidEntity(target) and target:IsAlive() has passed false")

			end
		else

			EmitSoundOnClient("General.Cancel", caster:GetPlayerOwner())

		end
	else
	end
	--local damage_to_deal_after_critical_strike_roll_and_calculation = 
	--print("This is printing from intial called function: custom_damage_test " .. caster_base_damage_caluclated)
end










function ability_undying_defiling_plague_dot_tick(event)
	local ability = event.ability
	local caster = event.caster
	local target = event.target


	if IsValidEntity(target) and IsValidEntity(caster) then

		local caster_base_damage_caluclated = custom_base_damage_calculation(caster) -- returns weapon damage value in integer
		local abilitySourceForCrit = caster:FindAbilityByName("undying_pb")
		local base_crit_chance = abilitySourceForCrit:GetLevelSpecialValueFor("crit_chance", 0)
		local crit_damage = abilitySourceForCrit:GetLevelSpecialValueFor("crit_damage", 0)

		local weapon_damage_total = ability:GetLevelSpecialValueFor( "defiling_plague_total_weapon_damage", ( ability:GetLevel() - 1 ) ) / 100

		local debuff_duration = ability:GetLevelSpecialValueFor( "defiling_plague_debuff_duration", ( ability:GetLevel() - 1 ) )

		local debuff_think_interval = ability:GetLevelSpecialValueFor( "defiling_plague_debuff_tick_rate", ( ability:GetLevel() - 1 ) )

		local ticks_per_debuff_duration = debuff_duration / debuff_think_interval 				--print("ticks_per_debuff_duration: " .. ticks_per_debuff_duration)
		local weapon_damage = weapon_damage_total / ticks_per_debuff_duration 					--print("weapon_damage: " .. weapon_damage)

		local damage_type = ability:GetAbilityDamageType()


		damage_output_post_critical_strike_roll(event, ability, caster, target, base_crit_chance, crit_damage, weapon_damage, damage_type, caster_base_damage_caluclated)
	else
	end
	--local damage_to_deal_after_critical_strike_roll_and_calculation = 
	--print("This is printing from intial called function: custom_damage_test " .. caster_base_damage_caluclated)
end


