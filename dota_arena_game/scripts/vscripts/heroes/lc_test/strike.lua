function ShadowrazePoint( event )
	local caster = event.caster
	local fv = caster:GetForwardVector()
	local origin = caster:GetAbsOrigin()
	local distance = event.distance
	
	local front_position = origin + fv * distance
	local result = {}
	table.insert(result, front_position)

	return result
end