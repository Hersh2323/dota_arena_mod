
function rootInit (event)
	local target = event.target
	local caster = event.caster

	if IsValidEntity(caster) and IsValidEntity(target) then

		local ability = event.ability

		local damageCapPercent = ability:GetLevelSpecialValueFor("max_hp_damage_cap_percentage", 0)
		local targetMaxHealth = target:GetMaxHealth()

		target.crystalMaidenRootdamageCap = nil
		target.crystalMaidenRootdamageCap = targetMaxHealth*damageCapPercent
	  --  print("[GLOBALED] Printing to console current var - target.crystalMaidenRootdamageCap: "..target.crystalMaidenRootdamageCap)   

	    target.crystalMaidenRootdamageTally = 0
	else
	end

end

function rootTakeDamage (event)
	local target = event.unit
	local caster = event.caster

	if IsValidEntity(caster) and IsValidEntity(target) then

		local ability = event.ability
		local damage = event.DamageTaken

		if target.crystalMaidenRootdamageTally == nil then
		else

		    target.crystalMaidenRootdamageTally = target.crystalMaidenRootdamageTally+damage
		   -- print("[GLOBALED] Printing to console current var - target.crystalMaidenRootdamageTally: "..target.crystalMaidenRootdamageTally)   
		   -- print("[GLOBALED] Printing to console current var - damage: "..damage)   

		    if target.crystalMaidenRootdamageTally >= target.crystalMaidenRootdamageCap then

		    	print("[GLOBALED] target.crystalMaidenRootdamageTally is greater or equal than target.crystalMaidenRootdamageCap and has triggered root break effect.".. target.crystalMaidenRootdamageTally)   

				target.crystalMaidenRootdamageTally = nil
		    	target:RemoveModifierByName("modifier_external_crystal_nova_root_aquamusprime_debuff_magical_dispellable_datadriven")
		    	target:RemoveModifierByName("modifier_external_root_nova_effect_crystal_maiden_debuff_magical_dispellable_datadriven")
		    	
		    else
		    end

		end



	else
	end

end


function rootNil (event)
	local target = event.target
	local caster = event.caster

	if IsValidEntity(caster) and IsValidEntity(target) then

		local ability = event.ability

		target.crystalMaidenRootdamageCap = nil
	    target.crystalMaidenRootdamageTally = nil
	    --print("[GLOBALED] target.crystalMaidenRootdamageCap, target.crystalMaidenRootdamageTally have been forced to nil")   

	else
	end

end