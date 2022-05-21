function horrifyInit (event)
	local target = event.target    
	local caster = event.caster

	if IsValidEntity(caster) and IsValidEntity(target) then

		local ability = event.ability

		local damageCapPercent = ability:GetLevelSpecialValueFor("max_hp_damage_cap_percentage", 0)
		local targetMaxHealth = target:GetMaxHealth()

		target.necrolyteHorrifydamageCap = nil
		target.necrolyteHorrifydamageCap = targetMaxHealth*damageCapPercent
		print("[GLOBALED] Printing to console current var - target.necrolyteHorrifydamageCap: ".. target.necrolyteHorrifydamageCap)   

	    target.necrolyteHorrifydamageTally = 0
		print("[GLOBALED] Printing to console current var - target.necrolyteHorrifydamageTally: ".. target.necrolyteHorrifydamageTally)   

	else

		print(" IsValidEntity(caster) and IsValidEntity(target) did not pass - horrifyInit")

	end
end

function horrifyTakeDamage (event)
	local target = event.unit
	local caster = event.caster

	if IsValidEntity(caster) and IsValidEntity(target) then

		local ability = event.ability

		local damage = event.DamageTaken
		
	    target.necrolyteHorrifydamageTally = target.necrolyteHorrifydamageTally+damage
	   -- print("[GLOBALED] Printing to console current var - target.enchantressRootdamageTally: "..target.enchantressRootdamageTally)   
	   -- print("[GLOBALED] Printing to console current var - damage: "..damage)   

	    if target.necrolyteHorrifydamageTally >= target.necrolyteHorrifydamageCap then

	    	--print("[GLOBALED] target.enchantressRootdamageTally is greater or equal than target.enchantressRootdamageCap and has triggered root break effect.".. target.enchantressRootdamageTally)   

			target.enchantressRootdamageTally = nil
	    	target:RemoveModifierByName("modifier_horrify_debuff_full_datadriven")
	    	target:RemoveModifierByName("modifier_horrify_debuff_half_datadriven")
	    else
	    end

	else
		print(" IsValidEntity(caster) and IsValidEntity(target) did not pass - horrifyTakeDamage")
	end

end

function HorrifyNil (event)
	local target = event.target
	local caster = event.caster

	if IsValidEntity(caster) and IsValidEntity(target) then

		local ability = event.ability

		target.necrolyteHorrifydamageCap = nil
	    target.necrolyteHorrifydamageTally = nil

	    print("[GLOBALED] target.necrolyteHorrifydamageCap, target.necrolyteHorrifydamageTally have been forced to nil")   

	else

		print(" IsValidEntity(caster) and IsValidEntity(target) did not pass - HorrifyNil")
	end

end


--[[

	if IsValidEntity(caster) and IsValidEntity(target) then
	else
	end


]]