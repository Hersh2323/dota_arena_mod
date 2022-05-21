function TestGravityFunc(args)
        local targetPos = args.target:GetAbsOrigin()
        local casterPos = args.caster:GetAbsOrigin()
 
        local direction = targetPos - casterPos
        local vec = direction:Normalized() * -3.0
 
        args.caster:SetAbsOrigin(casterPos + vec)
    end