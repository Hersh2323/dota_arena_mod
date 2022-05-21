function portalInitLocation (keys)
	local caster = keys.caster
	local ability = keys.ability
	local casterPos = caster:GetAbsOrigin()

	local particle = keys.particleName

	caster.portalLocation = nil
	caster.portalLocation = casterPos

--	caster.portalParticle = nil

	
    if caster.portalParticle == nil then
    else
	   	ParticleManager:DestroyParticle(caster.portalParticle, true)
		caster.portalParticle = nil
    end

	caster.portalParticle = ParticleManager:CreateParticle(particle, PATTACH_ABSORIGIN, caster)
end

function portalTeleport (keys)
	local caster = keys.caster
	local ability = keys.ability

	local casterPos = caster:GetAbsOrigin()


	if caster.portalLocation == nil then
		-- would like to convey to caster that portal is not put down/usable
	else

		local difference = caster.portalLocation - casterPos
		local range = ability:GetLevelSpecialValueFor("range", 0)

		local blinkFailureSound = keys.blinkFailureSound
		local blinkSuccessSound = keys.blinkSuccessSound

		local printDiff = difference:Length2D()
	      print("[GLOBALED] Printing to console current printDiff variable: "..printDiff)

		if difference:Length2D() > range then
			caster:EmitSound(blinkFailureSound)
		else
			local portalLocation = caster.portalLocation

			caster:EmitSound(blinkSuccessSound)

			ProjectileManager:ProjectileDodge(caster)

			FindClearSpaceForUnit(caster, portalLocation, false)

			local coolDownTime = ability:GetLevelSpecialValueFor("cooldown", 0)
			ability:StartCooldown(coolDownTime)

			ability:ApplyDataDrivenModifier(caster, caster, "modifier_necrolyte_portal_animation_datadriven", {}) 
			
			caster:Stop()	
		end

	end
end

function portalRespawnClear (keys)
	local caster = keys.caster
	local ability = keys.ability

    if caster.portalParticle == nil then
    else
	   	ParticleManager:DestroyParticle(caster.portalParticle, true)
		caster.portalParticle = nil
    end

end