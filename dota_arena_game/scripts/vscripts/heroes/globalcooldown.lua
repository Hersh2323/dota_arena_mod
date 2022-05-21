function activate_gcd_without_ability_specific(event)
	local caster = event.caster
	local gcd_ability = caster:FindAbilityByName("all_heroes_gcd_datadriven")

	if gcd_ability then
		gcd_ability:ApplyDataDrivenModifier(caster, caster, "modifier_gcd_activated_datadriven", {}) 
	else
		print("[GCD][ gcd_ability not found ]")
	end
end


function activate_gcd(event)
	local ability = event.ability
	local caster = event.caster

	if caster:GetUnitName() == "npc_dota_hero_phantom_assassin" or caster:GetUnitName() == "npc_dota_hero_bounty_hunter" then

		local gcd_duration = ability:GetLevelSpecialValueFor("global_cooldown", ability:GetLevel() )
		local gcd_duration = gcd_duration - 0.5

	    for abilitySlot=0,17 do
	        local zAbility = caster:GetAbilityByIndex(abilitySlot)
	        if zAbility then

	        	if zAbility:GetName() == "pa_stealth" or zAbility:GetName() == "bh_bleed_strike" then
	        	else

		        	local zAbility_cooldown_time_remaining = zAbility:GetCooldownTimeRemaining()
		        	if zAbility_cooldown_time_remaining then
		        		if zAbility_cooldown_time_remaining < gcd_duration then

	        				zAbility:StartCooldown(gcd_duration)
		        		end
		        	end

	        	end
	        end
	    end

	    for itemSlot=0,17 do
	        local yAbility = caster:GetItemInSlot(itemSlot)

	        if yAbility then

	        	if yAbility:GetName() == "item_sma_disp" or yAbility:GetName() == "item_sma_dash" or yAbility:GetName() == "item_sma_dodge" or yAbility:GetName() == "item_bh_disp" then
	        	else
		        	local yAbility_cooldown_time_remaining = yAbility:GetCooldownTimeRemaining()
		        	if yAbility_cooldown_time_remaining then
		        		if yAbility_cooldown_time_remaining < gcd_duration then
		        			yAbility:StartCooldown(gcd_duration)
		        		end
		        	end

	        	end
	        end
	    end


	else
		local gcd_duration = ability:GetLevelSpecialValueFor("global_cooldown", ability:GetLevel() )
	    for abilitySlot=0,17 do
	        local zAbility = caster:GetAbilityByIndex(abilitySlot)
	        if zAbility then
	        	local zAbility_cooldown_time_remaining = zAbility:GetCooldownTimeRemaining()
	        	if zAbility_cooldown_time_remaining then
	        		if zAbility_cooldown_time_remaining < gcd_duration then

        				zAbility:StartCooldown(gcd_duration)
	        		end
	        	end
	        end
	    end

	    for itemSlot=0,17 do
	        local yAbility = caster:GetItemInSlot(itemSlot)

	        if yAbility then
	        	local yAbility_cooldown_time_remaining = yAbility:GetCooldownTimeRemaining()
	        	if yAbility_cooldown_time_remaining then
	        		if yAbility_cooldown_time_remaining < gcd_duration then
	        			yAbility:StartCooldown(gcd_duration)
	        		end
	        	end
	        end
	    end
	end
end


function gcd_cancel(event)
	local caster = event.caster
	local ability = event.ability
	local gcd_ability = caster:FindAbilityByName("all_heroes_gcd_datadriven")
	local gcd_modifier = caster:FindModifierByName("modifier_gcd_activated_datadriven")
	local gcd_duration = gcd_ability:GetLevelSpecialValueFor("global_cooldown", ability:GetLevel() )

	local gcd_ability_cooldown_remaining = gcd_ability:GetCooldownTimeRemaining()
	print("[GCD][gcd_ability_cooldown_remaining: " .. gcd_ability_cooldown_remaining .. " ]")

    for abilitySlot=0,17 do
        local zAbility = caster:GetAbilityByIndex(abilitySlot)

        if zAbility then

        	if zAbility:GetName() == "pa_stealth" or zAbility:GetName() == "bh_bleed_strike" then
        	else
	        	local zAbility_cooldown_time_remaining = zAbility:GetCooldownTimeRemaining()
	        	if zAbility_cooldown_time_remaining then
	        		if zAbility_cooldown_time_remaining <= gcd_ability_cooldown_remaining then
	        			zAbility:EndCooldown()
	        		end
	        	end
        	end
        end
    end

    for itemSlot=0,17 do
        local yAbility = caster:GetItemInSlot(itemSlot)

        if yAbility then

        	if yAbility:GetName() == "item_sma_disp" or yAbility:GetName() == "item_sma_dash" or yAbility:GetName() == "item_sma_dodge" or yAbility:GetName() == "item_bh_disp" then
        	else
	        	local yAbility_cooldown_time_remaining = yAbility:GetCooldownTimeRemaining()
	        	if yAbility_cooldown_time_remaining then
	        		if yAbility_cooldown_time_remaining <= gcd_ability_cooldown_remaining then
	        			yAbility:EndCooldown()
	        		end
	        	end
        	end
        end
    end

	caster:RemoveModifierByName("modifier_gcd_activated_datadriven")
end