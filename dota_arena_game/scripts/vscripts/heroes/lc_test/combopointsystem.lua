function comboPointIncrement( event )

	local caster = event.caster

	-- finds ability that created combo points (sma_pb) and defines 
	local modifierNameToFind = event.caster:FindModifierByName("modifier_pa_combo_points_datadriven")
	local ability = modifierNameToFind:GetAbility()

	local modifier_stack = event.modifier_stack
	local current_stack = caster:GetModifierStackCount(modifier_stack, ability)		


	-- grants the caster 1 combo point if below5 combo points
	if current_stack < 5 then
		caster:SetModifierStackCount(modifier_stack, ability, current_stack + 1)

		PopupNumbers(caster, "gold", Vector(255, 200, 33), 1.0, 1, POPUP_SYMBOL_PRE_PLUS, nil)
	else
	end
end


function comboPointDecrease( event )
	local caster = event.caster

	if	caster:HasModifier("modifier_pa_combo_points_datadriven") then
		
		-- finds ability that created combo points (sma_pb)
		local modifierNameToFind = event.caster:FindModifierByName("modifier_pa_combo_points_datadriven")
		local ability = modifierNameToFind:GetAbility()

		local modifier_stack = event.modifier_stack

		local current_stack = caster:GetModifierStackCount(modifier_stack, ability)


		if current_stack < 6 then
			caster:SetModifierStackCount(modifier_stack, ability, current_stack - 1)

		--	target:RemoveModifierByNameAndCaster(modifier_stack, caster)
		else
			--target:SetModifierStackCount(modifier_stack, ability, current_stack - 1)
		end

		if current_stack < 1 then


			if	caster:HasModifier("modifier_pa_combo_points_datadriven") then
				caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")
			else
			end
		else
		end
	else
	end
end




function comboPointSpendAll( event )
	local caster = event.caster

	if	caster:HasModifier("modifier_pa_combo_points_datadriven") then
		
		-- finds ability that created combo points (sma_pb)
		local modifierNameToFind = event.caster:FindModifierByName("modifier_pa_combo_points_datadriven")
		local ability = modifierNameToFind:GetAbility()

		local modifier_stack = event.modifier_stack

		local current_stack = caster:GetModifierStackCount(modifier_stack, ability)

		if current_stack < 6 then
			caster:SetModifierStackCount(modifier_stack, ability, current_stack - current_stack)
			caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")
			EmitSoundOn("Hero_Beastmaster.Wild_Axes_Damage", caster)
		else
		end
	else
	end
end
