function refund_channel_int(mana_value, caster)

	if mana_value and caster then
		caster:GiveMana(mana_value)
	else
		print("[ ERROR ][ custom function refund_channel_int failed ]")
	end
end

function general_channel_refund(event)
	local caster = event.caster
	local ability = event.ability

	local ability_channel_mana_cost = ability:GetManaCost(1)
	refund_channel_int(ability_channel_mana_cost, caster)
end