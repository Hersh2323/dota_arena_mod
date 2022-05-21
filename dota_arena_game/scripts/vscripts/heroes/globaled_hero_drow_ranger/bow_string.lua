function launchProjectile (keys)

	-- variables
	local caster = keys.caster
	local ability = keys.ability
	local casterLoc = caster:GetAbsOrigin()

	-- modifiers
	local target = caster:GetAttackTarget()

	-- code


	if caster:IsAttacking() then

		local targetPos = target:GetAbsOrigin()
		local castRange = ability:GetCastRange()

		-- check if the distance between the caster and target is within attackrange
		local distanceBetween = casterLoc - targetPos
		local distDiff = distanceBetween:Length2D()

		local casterHullRadius = caster:GetHullRadius()
		local targetHullRadius = target:GetHullRadius()

  		print("[GLOBALED] DROW RANGER BOW STRING VARIABLE: casterHullRadius ".. casterHullRadius)
  		print("[GLOBALED] DROW RANGER BOW STRING VARIABLE: targetHullRadius ".. targetHullRadius)

  		local distDiffPrint = distDiff+casterHullRadius+targetHullRadius
  		print("[GLOBALED] DROW RANGER BOW STRING VARIABLE: distDiffPrint ".. distDiffPrint)

		if distDiff+casterHullRadius+targetHullRadius <= castRange then

			local projectileSpeed = ability:GetLevelSpecialValueFor("projectile_speed", 0)

			local projectile_info = 
		    {
		        EffectName = "particles/units/heroes/hero_drow/drow_base_attack.vpcf",
		        Ability = ability,
		        vSpawnOrigin = caster:GetAbsOrigin(),
		        Target = target,
		        Source = caster,
		        bHasFrontalCone = false,
		        iMoveSpeed = projectileSpeed,
		        bReplaceExisting = false,
		        bProvidesVision = false
		    }

		   	ProjectileManager:CreateTrackingProjectile(projectile_info)

		   	local abilityPB = caster:FindAbilityByName("drow_pb")
		   	local cooldown = abilityPB:GetLevelSpecialValueFor("global_cooldown", 0)
		   	ability:StartCooldown(cooldown)
		else
		end

	else
	end
end