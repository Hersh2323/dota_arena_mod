function flames_crit_scored(event)
	local caster = event.caster
	local ability = event.ability

	if IsValidEntity(caster) then

		if caster:HasModifier("modifier_line_flames_active_datadriven") then
		else

			if caster:HasModifier("modifier_lina_flames_stack_datadriven") then
				local stackModifier = caster:FindModifierByName("modifier_lina_flames_stack_datadriven")
				local stackModifierCount = stackModifier:GetStackCount()

				if stackModifierCount == nil then

					stackModifier:SetStackCount(1)

				else

					if stackModifierCount == 1 then

						stackModifier:IncrementStackCount()

						local stackModifierCount = stackModifier:GetStackCount()
		 				if stackModifierCount == 2 then

							caster:RemoveModifierByName("modifier_lina_flames_stack_datadriven")
							ability:ApplyDataDrivenModifier(caster, caster, "modifier_lina_flames_active_datadriven", {})

		 				else
		 				end
					else
					end
				end

			else
				ability:ApplyDataDrivenModifier(caster, caster, "modifier_lina_flames_stack_datadriven", {})

				local stackModifier = caster:FindModifierByName("modifier_lina_flames_stack_datadriven")

				stackModifier:SetStackCount(1)


			end

		end



	else
	end
end

function flames_crit_failed(event)
	local caster = event.caster
	local ability = event.ability

	if IsValidEntity(caster) then



		if caster:HasModifier("modifier_line_flames_active_datadriven") then
		else

			if caster:HasModifier("modifier_lina_flames_stack_datadriven") then
				local stackModifier = caster:FindModifierByName("modifier_lina_flames_stack_datadriven")
				local stackModifierCount = stackModifier:GetStackCount()

				if stackModifierCount == nil then
				else

					if stackModifierCount == 1 then

						caster:RemoveModifierByName("modifier_lina_flames_stack_datadriven")
					elseif stackModifierCount == 2 then
						stackModifier:SetStackCOunt(1)
					else
					end
				end

			else
			end

		end
	else
	end
end





function flamesAutoAttackDecider(event)
	local caster = event.caster
	local ability = event.ability

	if IsValidEntity(caster) then	

		local l_ability = caster:FindAbilityByName("lina_pb")
		if caster:HasModifier("modifier_caster_right_click_critical_effect_datadriven") then
			l_ability:ApplyDataDrivenModifier(caster, caster, "modifier_lina_flames_crit_scored_datadriven", {}) 
		else
			l_ability:ApplyDataDrivenModifier(caster, caster, "modifier_lina_flames_crit_failed_datadriven", {}) 
		end
	else
	end
end









--[[









					"RunScript"
					{
						"ScriptFile"	"heroes/globaled_hero_lina/flames.lua"
						"Function"		"flames_crit_scored"
						"stack_modifier"	"modifier_lina_flames_stack_datadriven"
					}

					"RunScript"
					{
						"ScriptFile"	"heroes/globaled_hero_lina/flames.lua"
						"Function"		"flames_crit_failed"
						"stack_modifier"	"modifier_lina_flames_stack_datadriven"
					}










]]