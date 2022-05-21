function dispel_magic (event)
	local caster = event.caster
	local target = event.target
	local ability = event.ability

	--local search_parameters = s

	local target_modifiers = target:FindAllModifiers()
	local target_modifiers_name = target_modifiers:GetName()

	if IsValidEntity(target) and IsValidEntity(caster) and ability and target_modifiers_name then
		if string.find( target_modifiers_name, "magical_effect_dispellable" ) then
			target_modifiers_name:Destroy()
		end
	end 
end