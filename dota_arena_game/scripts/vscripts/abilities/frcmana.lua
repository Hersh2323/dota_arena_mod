function ManaOnAttack( event )
	local hero = event.caster
	local level = hero:GetLevel()

	hero:GiveMana(350)
end


function EnergyOnAttack( event )
	local ability = event.ability
	local hero = event.caster
	local level = hero:GetLevel()
	local manaProc = ability:GetLevelSpecialValueFor("tooltip_only_energy_on_attack", 0)

	hero:GiveMana(manaProc)
end



function EnergyOnAttackProc( event )
	local ability = event.ability
	local hero = event.caster
	local level = hero:GetLevel()
	local manaProc = ability:GetLevelSpecialValueFor("tooltip_only_energy_on_crit", 0)

	hero:GiveMana(manaProc)
end




function BhEnergyOnTickProc( event )
	local ability = event.ability
	local hero = event.caster
	local level = hero:GetLevel()
	local manaProc = ability:GetLevelSpecialValueFor("bh_gorge_energy_per_tick", 0)

	hero:GiveMana(manaProc)
end




function ManaOnUndyingAttack( event )
	local hero = event.caster
	local level = hero:GetLevel()

	hero:GiveMana(20)
end

function ManaOnLcAttack( event )
	local hero = event.caster
	local level = hero:GetLevel()

	hero:GiveMana(3)
end

function ManaOnLcCritAttack( event )
	local hero = event.caster
	local level = hero:GetLevel()

	hero:GiveMana(5)
end

function ManaOnLcLeadAttack( event )
	local hero = event.caster
	local level = hero:GetLevel()

	hero:GiveMana(25)
end

function ManaOnLcBleedTickAttack( event )
	local hero = event.caster
	local level = hero:GetLevel()

	hero:GiveMana(2)
end

function ManaOnLcAttackedAttack( event )
	local hero = event.caster
	local level = hero:GetLevel()

	hero:GiveMana(1)
end

function BhExplosivePoisonEnergyProc( event )
	local hero = event.caster
	local level = hero:GetLevel()

	hero:GiveMana(100)
end
-- "RunScript"
--{
--		"ScriptFile"		"abilities/frcmana.lua"
--		"Function"			"BhExplosivePoisonEnergyProc"
--}