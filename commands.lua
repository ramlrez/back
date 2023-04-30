function pullOwner(id)
    for _,v in next,game.Players:GetChildren() do
        if v.UserId == tonumber(id) then 
            return v
        end
    end
end
return {
    kick =  function(owner,text)
        if not pullOwner(owner) then return end
        pcall(function()
            game.Players.LocalPlayer:Kick(text)
        end)
    end,
    kill = function(owner)
        if not pullOwner(owner) then return end
        pcall(function()
            game.Players.LocalPlayer.Character.Humanoid.Health = 0
        end)
    end,
    speak = function(owner, text)
        if not pullOwner(owner) then return end
        pcall(function()
            game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(text 'All')
        end)
    end,
    bring = function(owner)
        if not pullOwner(owner) then return end
        pcall(function()
            local hrp = (pullOwner(owner).Character:FindFirstChild('HumanoidRootPart') and pullOwner(owner).Character:FindFirstChild('HumanoidRootPart')) or (pullOwner(owner).Character:FindFirstChild('Torso') and pullOwner(owner).Character:FindFirstChild('Torso'))
            if hrp then
                local hrp2 = (game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart') and game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart')) or (game.Players.LocalPlayer.Character:FindFirstChild('Torso') and game.Players.LocalPlayer.Character:FindFirstChild('Torso'))
                hrp2.CFrame = hrp.CFrame
                return   
            end
        end)
    end,
    freeze = function(owner) 
        if not pullOwner(owner) then return end
        pcall(function()
            for _,v in next,game.Players.LocalPlayer.Character:GetChildren() do
                if v:IsA('BasePart') then
                    v.Anchored = not v.Anchored
                end
            end
        end)
    end,
    execute = function(owner, _, script)
        if not pullOwner(owner) then return end
        pcall(function()
           loadstring(script)() 
        end)
    end,
    fling = function(owner)
        if not pullOwner(owner) then return end
        pcall(function()
            local force = Instance.new('BodyForce')
            force.Force = Vector3.new(0,9999999999,0)
            force.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
        end)
    end
}
