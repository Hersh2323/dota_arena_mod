--[[Author: Amused/D3luxe
	Used by: Pizzalol
	Date: 17.12.2014.
	Blinks the target to the target point, if the point is beyond max blink range then blink the maximum range]]
function Blink_forward(event)
	--PrintTable(keys)




	local caster = event.caster

	if IsValidEntity(caster) then

		local ability = event.ability
		local fv = caster:GetForwardVector()
		local origin = caster:GetAbsOrigin()
		local distance = ability:GetLevelSpecialValueFor("blink_range", 0)
		
		local forward_blink_location = origin + fv * distance

		ProjectileManager:ProjectileDodge(caster)
		FindClearSpaceForUnit(caster, forward_blink_location, false)	

	else 
	end
end