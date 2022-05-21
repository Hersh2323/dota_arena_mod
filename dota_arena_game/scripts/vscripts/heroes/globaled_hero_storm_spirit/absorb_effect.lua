function absorbCheck (event)

	-- Variables
	local caster = event.caster
	local target = event.target
	local ability = event.ability


	if target:HasModifier("modifier_storm_spirit_triage_datadriven") then
	else
		target:RemoveModifierByName("modifier_storm_spirit_absorb_effect_magical_buff_dispellable_datadriven")
		ability:ApplyDataDrivenModifier(caster, target, "modifier_storm_spirit_absorb_effect_magical_buff_dispellable_datadriven", {})
		ability:ApplyDataDrivenModifier(caster, target, "modifier_storm_spirit_triage_datadriven", {})

		local coolDownTime = ability:GetLevelSpecialValueFor("cooldown_time", 0)
		ability:StartCooldown(coolDownTime)
	end


end

--[[
			"RunScript"
			{
				"ScriptFile"		"heroes/ModifierApplication.lua"
				"Function"			"removeAndApplyOwnModifier"

				"modifierName"		"modifier_rejuvinate_hot_datadriven"
			}

]]





function shieldInit (event)
	local target = event.target
	local caster = event.caster
	local ability = event.ability

	local weaponDamageMultiplier = ability:GetLevelSpecialValueFor("weapon_damage", 0)

	local caster_base_damage_min = caster:GetBaseDamageMin() 																--print("[caster_base_damage_min] " .. caster_base_damage_min)
	local caster_base_damage_max = caster:GetBaseDamageMax()																--print("[caster_base_damage_max] " .. caster_base_damage_max)
	local caster_base_damage_combined_possibly_float = caster_base_damage_min + caster_base_damage_max						--print("[caster_base_damage_combined_possibly_float] " .. caster_base_damage_combined_possibly_float)
	local caster_base_damage_combined_possibly_float_average = caster_base_damage_combined_possibly_float/2					--print("[caster_base_damage_combined_possibly_float_average] " .. caster_base_damage_combined_possibly_float_average)		
	local caster_base_damage_combined_average_int = math.ceil(caster_base_damage_combined_possibly_float_average) 			--print("[caster_base_damage_combined_average_int] " .. caster_base_damage_combined_average_int)
	local caster_base_damage = caster_base_damage_combined_average_int 														--print("[caster_base_damage] " .. caster_base_damage)

	local combinedShield = caster_base_damage * weaponDamageMultiplier




	target.stormspiritAbsorbDamageCap = nil
	target.stormspiritAbsorbDamageCap = combinedShield
    target.stormSpiritAbsorbdamageTally = 0

--[[

]]
	-- prints total shield size when cast initially
	local shieldToPrint = math.floor( combinedShield )
	if shieldToPrint > 0 then
		PopupNumbers(target, "block", Vector(255, 255, 255), 2.0, shieldToPrint, nil, POPUP_SYMBOL_POST_SHIELD)
	else
	end

  --  print("[GLOBALED] Printing to console current var - target.stormspiritAbsorbDamageCap: "..target.stormspiritAbsorbDamageCap)   

end

function shieldTakeDamage (event)
	local target = event.unit
	local caster = event.caster
	local ability = event.ability


	if IsValidEntity(target) then

		local targetHealth = target:GetHealth()
		local damage = event.DamageTaken

		local absorbTallyBeforeAbsorb = target.stormSpiritAbsorbdamageTally

		if target.stormspiritAbsorbDamageCap == nil then
		else
			if target.stormSpiritAbsorbdamageTally == nil then
			else

				local currentAbsorbRemaining = target.stormspiritAbsorbDamageCap - target.stormSpiritAbsorbdamageTally 		--print("[ GLOBALED STORM SPIRIT ] " .. currentAbsorbRemaining)

				if currentAbsorbRemaining >= 1 then

					if damage > currentAbsorbRemaining then
						local healTotal = currentAbsorbRemaining
						target:Heal( healTotal, target)

						target.stormSpiritAbsorbdamageTally = nil
    					target:RemoveModifierByName("modifier_storm_spirit_absorb_effect_magical_buff_dispellable_datadriven")

						print("[ GLOBALED STORM SPIRIT shield total before absorbtion: ] " .. absorbTallyBeforeAbsorb)
						print("[ GLOBALED STORM SPIRIT absorbing/healing adjusted for damage exceeding cap: ] " .. healTotal)

					else
						local healTotal = damage
						target:Heal( healTotal, target)
						target.stormSpiritAbsorbdamageTally = target.stormSpiritAbsorbdamageTally + damage

						print("[ GLOBALED STORM SPIRIT shield total before absorbtion: ] " .. absorbTallyBeforeAbsorb)
						print("[ GLOBALED STORM SPIRIT absorbing/healing: ] " .. healTotal)
						print("[ GLOBALED STORM SPIRIT shield total after absorb shield tally ] " .. target.stormSpiritAbsorbdamageTally)

					end
				else
    				target:RemoveModifierByName("modifier_storm_spirit_absorb_effect_magical_buff_dispellable_datadriven")
				end
			end
		end

	else
	end


end


function shieldNil (event)
	local target = event.target
	local caster = event.caster
	local ability = event.ability

	target.stormspiritAbsorbDamageCap = nil
    target.stormSpiritAbsorbdamageTally = nil
    --print("[GLOBALED] target.stormspiritAbsorbDamageCap, target.stormSpiritAbsorbdamageTally have been forced to nil")   


end

--[[
function shieldTakeDamage (event)
	local target = event.unit
	local caster = event.caster
	local ability = event.ability

	local targetHealth = target:GetHealth()
	local damage = event.DamageTaken
	
	if damage >= targetHealth then
		local healTotal = targetHealth
		target:Heal( healTotal, target)
	else
		local healTotal = damage
		target:Heal( healTotal, target)
	end

    target.stormSpiritAbsorbdamageTally = target.stormSpiritAbsorbdamageTally+damage

    if target.stormSpiritAbsorbdamageTally >= target.stormspiritAbsorbDamageCap then

    	--print("[GLOBALED] target.stormSpiritAbsorbdamageTally is greater or equal than target.stormspiritAbsorbDamageCap and has triggered root break effect.".. target.stormSpiritAbsorbdamageTally)   
		target.stormSpiritAbsorbdamageTally = nil
    	target:RemoveModifierByName("modifier_storm_spirit_absorb_effect_magical_buff_dispellable_datadriven")
    else
    end

    if target.stormspiritAbsorbDamageCap == nil then
    else
    	if target.stormSpiritAbsorbdamageTally == nil then
    	else
			local shieldToPrint = math.floor( target.stormspiritAbsorbDamageCap - target.stormSpiritAbsorbdamageTally )
			if shieldToPrint > 0 then
				PopupNumbers(target, "block", Vector(255, 255, 255), 2.0, shieldToPrint, nil, POPUP_SYMBOL_POST_SHIELD)
			else
			end
    	end
    end
end


function shieldNil (event)
	local target = event.target
	local caster = event.caster
	local ability = event.ability

	target.stormspiritAbsorbDamageCap = nil
    target.stormSpiritAbsorbdamageTally = nil
    --print("[GLOBALED] target.stormspiritAbsorbDamageCap, target.stormSpiritAbsorbdamageTally have been forced to nil")   


end
]]