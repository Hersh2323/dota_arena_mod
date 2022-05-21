
function rootInit (event)
	local target = event.target
	local caster = event.caster
	local ability = event.ability

	local damageCapPercent = ability:GetLevelSpecialValueFor("max_hp_damage_cap_percentage", 0)
	local targetMaxHealth = target:GetMaxHealth()

	target.enchantressRootdamageCap = nil
	target.enchantressRootdamageCap = targetMaxHealth*damageCapPercent
  --  print("[GLOBALED] Printing to console current var - target.enchantressRootdamageCap: "..target.enchantressRootdamageCap)   

    target.enchantressRootdamageTally = 0
end

function rootTakeDamage (event)
	local target = event.unit
	local caster = event.caster
	local ability = event.ability

	local damage = event.DamageTaken
	
	if target.enchantressRootdamageTally == nil then
	else

	    target.enchantressRootdamageTally = target.enchantressRootdamageTally+damage
	   -- print("[GLOBALED] Printing to console current var - target.enchantressRootdamageTally: "..target.enchantressRootdamageTally)   
	   -- print("[GLOBALED] Printing to console current var - damage: "..damage)   

	    if target.enchantressRootdamageTally >= target.enchantressRootdamageCap then

	    	--print("[GLOBALED] target.enchantressRootdamageTally is greater or equal than target.enchantressRootdamageCap and has triggered root break effect.".. target.enchantressRootdamageTally)   

			target.enchantressRootdamageTally = nil
	    	target:RemoveModifierByName("modifier_treant_root_datadriven")
	    else
	    end
		
	end



end


function rootNil (event)
	local target = event.target
	local caster = event.caster
	local ability = event.ability

	target.enchantressRootdamageCap = nil
    target.enchantressRootdamageTally = nil
    print("[GLOBALED] target.enchantressRootdamageCap, target.enchantressRootdamageTally have been forced to nil")   


end