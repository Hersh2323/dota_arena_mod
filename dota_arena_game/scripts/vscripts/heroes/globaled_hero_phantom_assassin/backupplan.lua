function paBackUpPlan (keys)
	local caster = keys.caster
	local ability = keys.ability

	local phantom_strike = caster:GetAbilityByIndex(1)
		phantom_strike:EndCooldown()

	local stealth = caster:GetAbilityByIndex(3)
		stealth:EndCooldown()

	for i=0, 5, 1 do
		local current_item = keys.caster:GetItemInSlot(i)
		if current_item ~= nil then
			if current_item:GetName() == "item_sma_disp" then
				current_item:EndCooldown()
			end

			if current_item:GetName() == "item_sma_dash" then
				current_item:EndCooldown()
			end

			if current_item:GetName() == "item_sma_dodge" then
				current_item:EndCooldown()
			end			
		else
		end
	end
end