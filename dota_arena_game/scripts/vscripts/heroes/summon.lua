function custom_function_summon_pet(pet_unit_name, caster, ability)
	local pet_unit_name = pet_unit_name
	local caster = caster
	local ability = ability

	local casterPos = caster:GetAbsOrigin()
	local casterTeamNumber = caster:GetTeamNumber()

	local target_team = DOTA_UNIT_TARGET_TEAM_FRIENDLY
	local target_types = DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC
	local target_flags = DOTA_UNIT_TARGET_FLAG_NONE


	local doesSummonPetExist = FindUnitsInRadius(casterTeamNumber, casterPos, nil, FIND_UNITS_EVERYWHERE, target_team, target_types, target_flags, FIND_ANY_ORDER, false)


	if not doesSummonPetExist == nil then

		local summonPetName = doesSummonPetExist:GetUnitName()
		local summonPetOwner = doesSummonPetExist:GetOwner()
		if summonPetName == pet_unit_name and summonPetOwner == caster then

			doesSummonPetExist:ForceKill( true )
			summonedPet:SetControllableByPlayer( caster:GetPlayerID(), true )
			summonedPet:SetOwner(caster)


		else
		end
	else

		local summonedPet = CreateUnitByName( pet_unit_name, casterPos, true, caster, caster, casterTeamNumber )
		FindClearSpaceForUnit(summonedPet, summonedPet:GetAbsOrigin(), false)

		summonedPet:SetControllableByPlayer( caster:GetPlayerID(), true )
		summonedPet:SetOwner(caster)

	end
end




function summon_drow_buddy(event)
	local caster = event.caster
	local ability = event.ability

	local pet_unit_name = "npc_drow_buddy"

	print("summon drow buddy string: pet_unit_name - - - " .. pet_unit_name )

	custom_function_summon_pet(pet_unit_name, caster, ability)
end









function remove_drow_buddy(event)
	local caster = event.caster
	local ability = event.ability
	local target = event.target

	local targetOwner = target:GetPlayerOwner()
	local targetOwnerPID = targetOwner:GetPlayerID()
	print("Owner of drow buddy is player ID: " .. targetOwnerPID)

	if target:GetUnitName() == "npc_drow_buddy" then

		caster.DrowBuddyCds = {}

		local ability1 = target:GetAbilityByIndex(0)
		local ability1Cooldown = ability1:GetCooldownTimeRemaining()

		if ability1Cooldown then
			if ability1Cooldown > 0 then
				caster.DrowBuddyCds.ability1Cooldown = ability1Cooldown
			end
		end

		if ability2Cooldown then
			local ability2 = target:GetAbilityByIndex(1)
			local ability2Cooldown = ability2:GetCooldownTimeRemaining()
			if ability2Cooldown > 0 then
				caster.DrowBuddyCds.ability2Cooldown = ability2Cooldown
			end
		end



		local ability3 = target:GetAbilityByIndex(2)
		local ability3Cooldown = ability3:GetCooldownTimeRemaining()
		if ability3Cooldown > 0 then
			caster.DrowBuddyCds.ability3Cooldown = ability3Cooldown
		end


		local ability6 = target:GetAbilityByIndex(3)
		local ability6Cooldown = ability6:GetCooldownTimeRemaining()
		if ability6Cooldown > 0 then
			caster.DrowBuddyCds.ability6Cooldown = ability6Cooldown
		end



		target:ForceKill(false)	
	else
	end

end


function set_drow_buddy_cooldowns(event)
	local ability = event.ability
	local pet = event.caster
	local petOwnerID = pet:GetPlayerOwnerID()
	local owner = HeroList:GetHero(petOwnerID)

	print("set_drow_buddy_cooldowns(event) function has executed")

	if owner.DrowBuddyCds then
		if owner.DrowBuddyCds.ability1Cooldown then
			local ability1CD = owner.DrowBuddyCds.ability1Cooldown
			local ability1 = pet:GetAbilityByIndex(0)

			ability1:StartCooldown(ability1CD)

			owner.DrowBuddyCds.ability1Cooldown = nil
		end

		if owner.DrowBuddyCds.ability2Cooldown then
			local ability2CD = owner.DrowBuddyCds.ability2Cooldown
			local ability2 = pet:GetAbilityByIndex(1)

			ability2:StartCooldown(ability2CD)
			
			owner.DrowBuddyCds.ability2Cooldown = nil
		end

		if owner.DrowBuddyCds.ability3Cooldown then
			local ability3CD = owner.DrowBuddyCds.ability3Cooldown
			local ability3 = pet:GetAbilityByIndex(2)

			ability3:StartCooldown(ability3CD)
			
			owner.DrowBuddyCds.ability3Cooldown = nil
		end
	
		if owner.DrowBuddyCds.ability6Cooldown then
			local ability6CD = owner.DrowBuddyCds.ability6Cooldown
			local ability6 = pet:GetAbilityByIndex(5)

			ability6:StartCooldown(ability6CD)
			
			owner.DrowBuddyCds.ability6Cooldown = nil
		end
	end

end


function remove_ghoul(event)
	local caster = event.caster
	local ability = event.ability
	local pet = event.target

	local petOwnerID = pet:GetPlayerOwnerID()
	local hero_pet_owner = HeroList:GetHero(petOwnerID)



	if pet:GetUnitName() == "npc_undying_ghoul" then
		if hero_pet_owner == caster then
			pet:ForceKill(false)	
		else
		end
	else
	end

end
