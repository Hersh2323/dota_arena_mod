function minRangeCheck (event)
	local caster = event.caster
	local ability = event.ability
	local min_range = ability:GetLevelSpecialValueFor("min_range", 0)
	local think_interval = ability:GetLevelSpecialValueFor("min_range_think_interval", 0)
	local disarm_duration = ability:GetLevelSpecialValueFor("min_range_disarm_duration", 0)

	if IsValidEntity(caster) then
		if caster:GetAttackTarget() == nil then
		else
			
			local target = caster:GetAttackTarget()
			if IsValidEntity(target) then

				local casterPos = caster:GetAbsOrigin()
				local targetPos = target:GetAbsOrigin()

				local difference = casterPos - targetPos
				local distanceBetween = difference:Length2D()

				if distanceBetween <= min_range then
					ability:ApplyDataDrivenModifier(caster, caster, "modifier_drow_range_disarm_effect_datadriven", {duration=disarm_duration}) 
				else

				end

			else
			end
		end
	else
	end
end




function minRangeCheckIfCasterAttackTargetNil (event)
	local caster = event.caster
	local ability = event.ability

	if IsValidEntity(caster) then







		if caster:GetAttackTarget() == nil then
		else



		end






--[[
		local attackTargetUnitName = attackTarget:GetUnitName()
			--print("attackTargetUnitName"	..	attackTargetUnitName)

		if attackTarget == nil then

			caster:RemoveModifierByName("modifier_drow_range_disarm_effect_datadriven")
		else

			if caster.minRangeStoredTarget == nil then
				caster.minRangeStoredTarget = nil
			else
				if caster.minRangeStoredTarget == attackTarget then
				else
				end
			end

		end
]]

	else
	end
end


