-- Created by Noya from https://moddota.com/forums/discussion/6/custom-mana-system
function DotManaProc( event )
	local hero = event.caster
	local level = hero:GetLevel()

	hero:GiveMana(25)
end
