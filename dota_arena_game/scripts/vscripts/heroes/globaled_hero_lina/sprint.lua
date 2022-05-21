function sprintCheckForStrengthAndAgi (event)
	local caster = event.caster
	local target = event.attacker
	local ability = event.ability


	if IsValidEntity(caster) and IsValidEntity(target) then

		if target:IsRealHero() then

			local targetPrimaryAttribute = target:GetPrimaryAttribute()

			if targetPrimaryAttribute == nil then
			else

				if targetPrimaryAttribute == DOTA_ATTRIBUTE_STRENGTH or targetPrimaryAttribute == DOTA_ATTRIBUTE_AGILITY then

					if caster:HasModifier("modifier_lina_sprint_cooldown_datadriven") then
					else
						if target:IsMagicImmune() then
						else
							ability:ApplyDataDrivenModifier(caster, target, "modifier_lina_sprint_disarm_debuff_phyiscal_dispellable_datadriven", {})
							ability:ApplyDataDrivenModifier(caster, caster, "modifier_lina_sprint_buff_magical_dispellable_datadriven", {}) 
							ability:ApplyDataDrivenModifier(caster, caster, "modifier_lina_sprint_cooldown_datadriven", {}) 
						end
					end
				else
				end

			end
			
		else
		end



	else
	end
end