function omniknightControlledStunCheck ( event )
	local caster = event.caster
	local ability = event.ability
	local target = event.target



	if target:HasModifier("modifier_controlled_stun_dr_datadriven") then
		ability:ApplyDataDrivenModifier(caster, target, "modifier_omniknight_stun_half_debuff_datadriven", {})

	elseif target:HasModifier("modifier_controlled_stun_dr_immune_datadriven") then

		-- do nothing: spells become immune after 2nd application, but trigger dr still
		ability:ApplyDataDrivenModifier(caster, target, "modifier_controlled_stun_dr_immune_datadriven", {})



	else 




		ability:ApplyDataDrivenModifier(caster, target, "modifier_omniknight_stun_full_debuff_datadriven", {})

	end
end

function paControlledStunCheck ( event )
	local caster = event.caster
	local ability = event.ability
	local target = event.target



	if target:HasModifier("modifier_controlled_stun_dr_datadriven") then

		if caster:GetModifierStackCount("modifier_pa_combo_points_datadriven", caster) == 1 then
			local oneCpStunDuration = ability:GetLevelSpecialValueFor("cp_one_duration", 0)
			local oneCpStunDurationDr = oneCpStunDuration / 2

			ability:ApplyDataDrivenModifier(caster, target, "modifier_pa_controlled_stun_half_datadriven", { duration = oneCpStunDurationDr })
    		print("[GLOBALED] Printing to console current variable: oneCpStunDurationDr:" .. oneCpStunDurationDr)

			caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")
			caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")
			caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")
			caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")
			caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")

		elseif caster:GetModifierStackCount("modifier_pa_combo_points_datadriven", caster) == 2 then
			local twoCpStunDuration = ability:GetLevelSpecialValueFor("cp_two_duration", 0)
			local twoCpStunDurationDr = twoCpStunDuration / 2

			ability:ApplyDataDrivenModifier(caster, target, "modifier_pa_controlled_stun_half_datadriven", { duration = twoCpStunDurationDr })
    		print("[GLOBALED] Printing to console current variable: twoCpStunDurationDr:" .. twoCpStunDurationDr)

			caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")
			caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")
			caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")
			caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")
			caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")

		elseif caster:GetModifierStackCount("modifier_pa_combo_points_datadriven", caster) == 3 then
			local threeCpStunDuration = ability:GetLevelSpecialValueFor("cp_three_duration", 0)
			local threeCpStunDurationDr = threeCpStunDuration / 2

			ability:ApplyDataDrivenModifier(caster, target, "modifier_pa_controlled_stun_half_datadriven", { duration = threeCpStunDurationDr })
    		print("[GLOBALED] Printing to console current variable: threeCpStunDurationDr:" .. threeCpStunDurationDr)

			caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")
			caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")
			caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")
			caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")
			caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")

		elseif caster:GetModifierStackCount("modifier_pa_combo_points_datadriven", caster) == 4 then
			local fourCpStunDuration = ability:GetLevelSpecialValueFor("cp_four_duration", 0)
			local fourCpStunDurationDr = fourCpStunDuration / 2

			ability:ApplyDataDrivenModifier(caster, target, "modifier_pa_controlled_stun_half_datadriven", { duration = fourCpStunDurationDr })
    		print("[GLOBALED] Printing to console current variable: fourCpStunDurationDr:" .. fourCpStunDurationDr)

			caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")
			caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")
			caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")
			caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")
			caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")

		elseif caster:GetModifierStackCount("modifier_pa_combo_points_datadriven", caster) == 5 then
			local fiveCpStunDuration = ability:GetLevelSpecialValueFor("cp_five_duration", 0)
			local fiveCpStunDurationDr = fiveCpStunDuration / 2

			ability:ApplyDataDrivenModifier(caster, target, "modifier_pa_controlled_stun_half_datadriven", { duration = fiveCpStunDurationDr })
    		print("[GLOBALED] Printing to console current variable: fiveCpStunDurationDr:" .. fiveCpStunDurationDr)

			caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")
			caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")
			caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")
			caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")
			caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")

		end

	elseif target:HasModifier("modifier_controlled_stun_dr_immune_datadriven") then

		-- do nothing: spells become immune after 2nd application, but trigger dr still
		ability:ApplyDataDrivenModifier(caster, target, "modifier_controlled_stun_dr_immune_datadriven", {})

	else -- non dr

		if caster:GetModifierStackCount("modifier_pa_combo_points_datadriven", caster) == 1 then
			local oneCpStunDuration = ability:GetLevelSpecialValueFor("cp_one_duration", 0)

			ability:ApplyDataDrivenModifier(caster, target, "modifier_pa_controlled_stun_full_datadriven", { duration = oneCpStunDuration })
    		print("[GLOBALED] Printing to console current variable: oneCpStunDuration:" .. oneCpStunDuration)

			caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")
			caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")
			caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")
			caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")
			caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")

		elseif caster:GetModifierStackCount("modifier_pa_combo_points_datadriven", caster) == 2 then
			local twoCpStunDuration = ability:GetLevelSpecialValueFor("cp_two_duration", 0)

			ability:ApplyDataDrivenModifier(caster, target, "modifier_pa_controlled_stun_full_datadriven", { duration = twoCpStunDuration })
    		print("[GLOBALED] Printing to console current variable: twoCpStunDuration:" .. twoCpStunDuration)

			caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")
			caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")
			caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")
			caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")
			caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")

		elseif caster:GetModifierStackCount("modifier_pa_combo_points_datadriven", caster) == 3 then
			local threeCpStunDuration = ability:GetLevelSpecialValueFor("cp_three_duration", 0)

			ability:ApplyDataDrivenModifier(caster, target, "modifier_pa_controlled_stun_full_datadriven", { duration = threeCpStunDuration })
    		print("[GLOBALED] Printing to console current variable: threeCpStunDuration:" .. threeCpStunDuration)

			caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")
			caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")
			caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")
			caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")
			caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")

		elseif caster:GetModifierStackCount("modifier_pa_combo_points_datadriven", caster) == 4 then
			local fourCpStunDuration = ability:GetLevelSpecialValueFor("cp_four_duration", 0)

			ability:ApplyDataDrivenModifier(caster, target, "modifier_pa_controlled_stun_full_datadriven", { duration = fourCpStunDuration })
    		print("[GLOBALED] Printing to console current variable: fourCpStunDuration:" .. fourCpStunDuration)

			caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")
			caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")
			caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")
			caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")
			caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")

		elseif caster:GetModifierStackCount("modifier_pa_combo_points_datadriven", caster) == 5 then
			local fiveCpStunDuration = ability:GetLevelSpecialValueFor("cp_five_duration", 0)

			ability:ApplyDataDrivenModifier(caster, target, "modifier_pa_controlled_stun_full_datadriven", { duration = fiveCpStunDuration })
    		print("[GLOBALED] Printing to console current variable: fiveCpStunDuration:" .. fiveCpStunDuration)

			caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")
			caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")
			caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")
			caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")
			caster:RemoveModifierByName("modifier_pa_combo_points_datadriven")

		end

		--ability:ApplyDataDrivenModifier(caster, target, "modifier_pa_controlled_stun_full_datadriven", {})
	end
end
















function bhControlledStunCheck ( event )
	local caster = event.caster
	local ability = event.ability
	local target = event.target



	if target:HasModifier("modifier_controlled_stun_dr_datadriven") then

		if caster:GetModifierStackCount("modifier_bh_combo_points_datadriven", caster) == 1 then
			local oneCpStunDuration = ability:GetLevelSpecialValueFor("cp_one_duration", 0)
			local oneCpStunDurationDr = oneCpStunDuration / 2

			ability:ApplyDataDrivenModifier(caster, target, "modifier_pa_controlled_stun_half_datadriven", { duration = oneCpStunDurationDr })
    		print("[GLOBALED] Printing to console current variable: oneCpStunDurationDr:" .. oneCpStunDurationDr)

			caster:RemoveModifierByName("modifier_bh_combo_points_datadriven")
			caster:RemoveModifierByName("modifier_bh_combo_points_datadriven")
			caster:RemoveModifierByName("modifier_bh_combo_points_datadriven")
			caster:RemoveModifierByName("modifier_bh_combo_points_datadriven")
			caster:RemoveModifierByName("modifier_bh_combo_points_datadriven")

		elseif caster:GetModifierStackCount("modifier_bh_combo_points_datadriven", caster) == 2 then
			local twoCpStunDuration = ability:GetLevelSpecialValueFor("cp_two_duration", 0)
			local twoCpStunDurationDr = twoCpStunDuration / 2

			ability:ApplyDataDrivenModifier(caster, target, "modifier_pa_controlled_stun_half_datadriven", { duration = twoCpStunDurationDr })
    		print("[GLOBALED] Printing to console current variable: twoCpStunDurationDr:" .. twoCpStunDurationDr)

			caster:RemoveModifierByName("modifier_bh_combo_points_datadriven")
			caster:RemoveModifierByName("modifier_bh_combo_points_datadriven")
			caster:RemoveModifierByName("modifier_bh_combo_points_datadriven")
			caster:RemoveModifierByName("modifier_bh_combo_points_datadriven")
			caster:RemoveModifierByName("modifier_bh_combo_points_datadriven")

		elseif caster:GetModifierStackCount("modifier_bh_combo_points_datadriven", caster) == 3 then
			local threeCpStunDuration = ability:GetLevelSpecialValueFor("cp_three_duration", 0)
			local threeCpStunDurationDr = threeCpStunDuration / 2

			ability:ApplyDataDrivenModifier(caster, target, "modifier_pa_controlled_stun_half_datadriven", { duration = threeCpStunDurationDr })
    		print("[GLOBALED] Printing to console current variable: threeCpStunDurationDr:" .. threeCpStunDurationDr)

			caster:RemoveModifierByName("modifier_bh_combo_points_datadriven")
			caster:RemoveModifierByName("modifier_bh_combo_points_datadriven")
			caster:RemoveModifierByName("modifier_bh_combo_points_datadriven")
			caster:RemoveModifierByName("modifier_bh_combo_points_datadriven")
			caster:RemoveModifierByName("modifier_bh_combo_points_datadriven")

		elseif caster:GetModifierStackCount("modifier_bh_combo_points_datadriven", caster) == 4 then
			local fourCpStunDuration = ability:GetLevelSpecialValueFor("cp_four_duration", 0)
			local fourCpStunDurationDr = fourCpStunDuration / 2

			ability:ApplyDataDrivenModifier(caster, target, "modifier_pa_controlled_stun_half_datadriven", { duration = fourCpStunDurationDr })
    		print("[GLOBALED] Printing to console current variable: fourCpStunDurationDr:" .. fourCpStunDurationDr)

			caster:RemoveModifierByName("modifier_bh_combo_points_datadriven")
			caster:RemoveModifierByName("modifier_bh_combo_points_datadriven")
			caster:RemoveModifierByName("modifier_bh_combo_points_datadriven")
			caster:RemoveModifierByName("modifier_bh_combo_points_datadriven")
			caster:RemoveModifierByName("modifier_bh_combo_points_datadriven")

		elseif caster:GetModifierStackCount("modifier_bh_combo_points_datadriven", caster) == 5 then
			local fiveCpStunDuration = ability:GetLevelSpecialValueFor("cp_five_duration", 0)
			local fiveCpStunDurationDr = fiveCpStunDuration / 2

			ability:ApplyDataDrivenModifier(caster, target, "modifier_pa_controlled_stun_half_datadriven", { duration = fiveCpStunDurationDr })
    		print("[GLOBALED] Printing to console current variable: fiveCpStunDurationDr:" .. fiveCpStunDurationDr)

			caster:RemoveModifierByName("modifier_bh_combo_points_datadriven")
			caster:RemoveModifierByName("modifier_bh_combo_points_datadriven")
			caster:RemoveModifierByName("modifier_bh_combo_points_datadriven")
			caster:RemoveModifierByName("modifier_bh_combo_points_datadriven")
			caster:RemoveModifierByName("modifier_bh_combo_points_datadriven")

		end

	elseif target:HasModifier("modifier_controlled_stun_dr_immune_datadriven") then

		-- do nothing: spells become immune after 2nd application, but trigger dr still
		ability:ApplyDataDrivenModifier(caster, target, "modifier_controlled_stun_dr_immune_datadriven", {})

	else -- non dr

		if caster:GetModifierStackCount("modifier_bh_combo_points_datadriven", caster) == 1 then
			local oneCpStunDuration = ability:GetLevelSpecialValueFor("cp_one_duration", 0)

			ability:ApplyDataDrivenModifier(caster, target, "modifier_pa_controlled_stun_full_datadriven", { duration = oneCpStunDuration })
    		print("[GLOBALED] Printing to console current variable: oneCpStunDuration:" .. oneCpStunDuration)

			caster:RemoveModifierByName("modifier_bh_combo_points_datadriven")
			caster:RemoveModifierByName("modifier_bh_combo_points_datadriven")
			caster:RemoveModifierByName("modifier_bh_combo_points_datadriven")
			caster:RemoveModifierByName("modifier_bh_combo_points_datadriven")
			caster:RemoveModifierByName("modifier_bh_combo_points_datadriven")

		elseif caster:GetModifierStackCount("modifier_bh_combo_points_datadriven", caster) == 2 then
			local twoCpStunDuration = ability:GetLevelSpecialValueFor("cp_two_duration", 0)

			ability:ApplyDataDrivenModifier(caster, target, "modifier_pa_controlled_stun_full_datadriven", { duration = twoCpStunDuration })
    		print("[GLOBALED] Printing to console current variable: twoCpStunDuration:" .. twoCpStunDuration)

			caster:RemoveModifierByName("modifier_bh_combo_points_datadriven")
			caster:RemoveModifierByName("modifier_bh_combo_points_datadriven")
			caster:RemoveModifierByName("modifier_bh_combo_points_datadriven")
			caster:RemoveModifierByName("modifier_bh_combo_points_datadriven")
			caster:RemoveModifierByName("modifier_bh_combo_points_datadriven")

		elseif caster:GetModifierStackCount("modifier_bh_combo_points_datadriven", caster) == 3 then
			local threeCpStunDuration = ability:GetLevelSpecialValueFor("cp_three_duration", 0)

			ability:ApplyDataDrivenModifier(caster, target, "modifier_pa_controlled_stun_full_datadriven", { duration = threeCpStunDuration })
    		print("[GLOBALED] Printing to console current variable: threeCpStunDuration:" .. threeCpStunDuration)

			caster:RemoveModifierByName("modifier_bh_combo_points_datadriven")
			caster:RemoveModifierByName("modifier_bh_combo_points_datadriven")
			caster:RemoveModifierByName("modifier_bh_combo_points_datadriven")
			caster:RemoveModifierByName("modifier_bh_combo_points_datadriven")
			caster:RemoveModifierByName("modifier_bh_combo_points_datadriven")

		elseif caster:GetModifierStackCount("modifier_bh_combo_points_datadriven", caster) == 4 then
			local fourCpStunDuration = ability:GetLevelSpecialValueFor("cp_four_duration", 0)

			ability:ApplyDataDrivenModifier(caster, target, "modifier_pa_controlled_stun_full_datadriven", { duration = fourCpStunDuration })
    		print("[GLOBALED] Printing to console current variable: fourCpStunDuration:" .. fourCpStunDuration)

			caster:RemoveModifierByName("modifier_bh_combo_points_datadriven")
			caster:RemoveModifierByName("modifier_bh_combo_points_datadriven")
			caster:RemoveModifierByName("modifier_bh_combo_points_datadriven")
			caster:RemoveModifierByName("modifier_bh_combo_points_datadriven")
			caster:RemoveModifierByName("modifier_bh_combo_points_datadriven")

		elseif caster:GetModifierStackCount("modifier_bh_combo_points_datadriven", caster) == 5 then
			local fiveCpStunDuration = ability:GetLevelSpecialValueFor("cp_five_duration", 0)

			ability:ApplyDataDrivenModifier(caster, target, "modifier_pa_controlled_stun_full_datadriven", { duration = fiveCpStunDuration })
    		--print("[GLOBALED] Printing to console current variable: fiveCpStunDuration:" .. fiveCpStunDuration)

			caster:RemoveModifierByName("modifier_bh_combo_points_datadriven")
			caster:RemoveModifierByName("modifier_bh_combo_points_datadriven")
			caster:RemoveModifierByName("modifier_bh_combo_points_datadriven")
			caster:RemoveModifierByName("modifier_bh_combo_points_datadriven")
			caster:RemoveModifierByName("modifier_bh_combo_points_datadriven")

		end

		--ability:ApplyDataDrivenModifier(caster, target, "modifier_pa_controlled_stun_full_datadriven", {})
	end
end