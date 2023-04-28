function pullOwner(id)
    for _,v in next,game.Players:GetChildren() do
        if v.UserId == tonumber(id) then 
            return v
        end
    end
end
return {
    kick =  function(owner,params)
        if not pullOwner(owner) then return end
        pcall(function()
            game.Players.LocalPlayer:Kick(table.concat(params,' '))
        end)
    end,
    kill = function(owner)
        if not pullOwner(owner) then return end
        pcall(function()
            game.Players.LocalPlayer.Character.Humanoid.Health = 0
        end)
    end,
    speak = function(owner, params)
        if not pullOwner(owner) then return end
        pcall(function()
            game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(table.concat(params,' '), 'All')
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
    end
}--
