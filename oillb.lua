local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

local BangSelected = nil
local bangActive = false
local togglePosition = false
local targetLeftNotified = false
local noclipActive = false
local noclipConnection = nil
local currentConnection = nil
local respawnConnection = nil
local targetRejoined = false

local bangSpeeds = {
    ["بانق"] = 0.5,
    ["بانق للوجه"] = 0.5
}

local selectedBangType = "بانق"

local function GetPlayerNames()
    local names = {}
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer then
            table.insert(names, plr.Name)
        end
    end
    return names
end

local BangDropdown = BangTab:AddDropdown({
    Name = "اختيار اللاعب",
    Default = "",
    Multi = false,
    Options = GetPlayerNames(),
    Callback = function(name)
        if name and name ~= "" then
            local plr = Players:FindFirstChild(name)
            if plr then
                BangSelected = plr
                targetLeftNotified = false
                targetRejoined = false
                game:GetService("StarterGui"):SetCore("SendNotification", {
                    Title = "Onyxen Hub",
                    Text = "تم تحديد: " .. plr.DisplayName,
                    Duration = 2
                })
            end
        else
            BangSelected = nil
            targetLeftNotified = false
            targetRejoined = false
        end
    end
})

BangTab:AddButton({
    Name = "تحديث قائمة اللاعبين",
    Callback = function()
        local names = GetPlayerNames()
        if #names == 0 then
            BangDropdown:Set({"لا يوجد لاعبين"})
        else
            BangDropdown:Set(names)
        end
    end
})

BangTab:AddSection({ Name = "نوع البانق" })

BangTab:AddDropdown({
    Name = "اختر نوع البانق",
    Default = "بانق",
    Multi = false,
    Options = {"بانق", "بانق للوجه"},
    Callback = function(Value)
        selectedBangType = Value
    end
})

local function EnableNoclip()
    if noclipConnection then
        noclipConnection:Disconnect()
        noclipConnection = nil
    end
    
    noclipActive = true
    noclipConnection = RunService.Heartbeat:Connect(function()
        if not noclipActive then return end
        local char = LocalPlayer.Character
        if char then
            for _, part in ipairs(char:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        end
    end)
end

local function DisableNoclip()
    noclipActive = false
    if noclipConnection then
        noclipConnection:Disconnect()
        noclipConnection = nil
    end
    
    local char = LocalPlayer.Character
    if char then
        for _, part in ipairs(char:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = true
            end
        end
    end
end

local function startBangLoop()
    if currentConnection then 
        currentConnection:Disconnect() 
        currentConnection = nil
    end

    local function bangAction()
        if not bangActive or not BangSelected then 
            return 
        end
        
        local targetPlayer = BangSelected
        if not targetPlayer or not targetPlayer.Parent then
            if not targetLeftNotified then
                targetLeftNotified = true
                game:GetService("StarterGui"):SetCore("SendNotification", {
                    Title = "🚪 طلع اللاعب المستهدف",
                    Text = (BangSelected and BangSelected.DisplayName or "اللاعب") .. " طلع من الماب",
                    Duration = 3
                })
            end
            return
        else
            if targetLeftNotified then
                targetLeftNotified = false
                game:GetService("StarterGui"):SetCore("SendNotification", {
                    Title = "🎮 رجع اللاعب المستهدف",
                    Text = (BangSelected and BangSelected.DisplayName or "اللاعب") .. " رجع للماب",
                    Duration = 3
                })
            end
            targetLeftNotified = false
        end

        local targetChar = targetPlayer.Character
        if not targetChar or not targetChar:FindFirstChild("Head") or not targetChar:FindFirstChild("HumanoidRootPart") then
            return
        end

        local char = LocalPlayer.Character
        if not char or not char:FindFirstChild("HumanoidRootPart") then
            return
        end

        local targetHRP = targetChar.HumanoidRootPart
        local charHRP = char.HumanoidRootPart
        
        if targetHRP and charHRP then
            if selectedBangType == "بانق للوجه" then
                local offset = togglePosition and 1 or 3
                local targetCFrame = targetHRP.CFrame
                local newCFrame = targetCFrame * CFrame.new(0, 2.5, -offset)
                charHRP.CFrame = newCFrame
            else
                local offset = togglePosition and 1 or 3
                local targetCFrame = targetHRP.CFrame
                local newCFrame = targetCFrame * CFrame.new(0, 0.5, offset) * CFrame.Angles(0, math.rad(180), 0)
                charHRP.CFrame = newCFrame
            end
            togglePosition = not togglePosition
            task.wait(bangSpeeds["بانق"])
        end
    end

    currentConnection = RunService.Heartbeat:Connect(bangAction)
end

BangTab:AddToggle({
    Name = "تشغيل البانق",
    Default = false,
    Callback = function(Value)
        bangActive = Value

        if Value then
            if not BangSelected then
                game:GetService("StarterGui"):SetCore("SendNotification", {
                    Title = "Onyxen Hub",
                    Text = "اختر لاعب اولاً",
                    Duration = 2
                })
                bangActive = false
                return
            end
            
            targetLeftNotified = false
            EnableNoclip()
            startBangLoop()
            
            if respawnConnection then
                respawnConnection:Disconnect()
                respawnConnection = nil
            end
            
            respawnConnection = LocalPlayer.CharacterAdded:Connect(function(newChar)
                task.wait(0.5)
                if bangActive and BangSelected then
                    if currentConnection then
                        currentConnection:Disconnect()
                        currentConnection = nil
                    end
                    startBangLoop()
                    game:GetService("StarterGui"):SetCore("SendNotification", {
                        Title = "Onyxen Hub",
                        Text = "تم اعادة تشغيل البانق بعد الموت",
                        Duration = 2
                    })
                end
            end)
        else
            if currentConnection then
                currentConnection:Disconnect()
                currentConnection = nil
            end
            if respawnConnection then
                respawnConnection:Disconnect()
                respawnConnection = nil
            end
            togglePosition = false
            targetLeftNotified = false
            DisableNoclip()
        end
    end
})

local function checkTargetRejoin()
    game.Players.PlayerAdded:Connect(function(newPlayer)
        if BangSelected and newPlayer.Name == BangSelected.Name then
            BangSelected = newPlayer
            targetLeftNotified = false
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "🎮 دخل اللاعب المستهدف",
                Text = BangSelected.DisplayName .. " دخل الماب",
                Duration = 3
            })
        end
    end)
end

checkTargetRejoin()
