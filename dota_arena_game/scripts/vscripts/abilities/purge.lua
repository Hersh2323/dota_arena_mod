function PurgeHealer ( event )
	local target = event.target
	local RemoveDebuffs = true
	local RemoveStuns

	target:Purge( RemoveDebuffs, RemoveStuns)
end