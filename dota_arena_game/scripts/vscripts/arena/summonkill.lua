function killSummonedUnits (keys)

	if GetMapName() == "arena_a3" then

		local caster = keys.caster
		local target = keys.target
		local ability = keys.ability


		if IsValidEntity(target) then

			if target:GetUnitName() == "npc_storm_spirit_gnoll" then
				target:ForceKill(false)	
			else
			end


			if target:GetUnitName() == "npc_drow_buddy" then
				target:ForceKill(false)	
			else
			end

			if target:GetUnitName() == "npc_aquamusprime" then
				target:ForceKill(false)	
			else
			end

			if target:GetUnitName() == "npc_treant_dubious_mushroom" then
				target:ForceKill(false)	
			else
			end

			if target:GetUnitName() == "npc_necrolyte_ghost" then
				target:ForceKill(false)	
			else
			end

			if target:GetUnitName() == "npc_undying_ghoul" then
				target:ForceKill(false)	
			else
			end

			if target:GetUnitName() == "npc_undying_ranged_ghast" then
				target:ForceKill(false)	
			else
			end

			if target:GetUnitName() == "npc_undying_ghoul_defender" then
				target:ForceKill(false)	
			else
			end

			if target:GetUnitName() == "npc_drow_ranger_ice_trap" then
				target:ForceKill(false)	
			else
			end

		else
		end
    	





--[[
		local caster = keys.caster
		local modifiersToBeRemoved = caster:FindAllModifiers()

		if modifiersToBeRemoved:IsPassive() == false then
			Destroy()
		else
		end
]]





--[[
		if not modifiersToBeRemoved:IsPassive() then

			if not modifiersToBeRemoved == nil then
				modifiersToBeRemoved:Destroy()
			else
			end

		else
		end
]]
	else
	end
end