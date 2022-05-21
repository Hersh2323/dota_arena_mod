function applySoulBondToOwner(event)
	local ability = event.ability
	local pet = event.caster
	local owner = event.target

	if owner then
		local potential_pet_owner = pet:GetPlayerOwnerID()
		print(potential_pet_owner)
		if owner == potential_pet_owner then

		end
	end		
end