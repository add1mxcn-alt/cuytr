local Tab = {} 

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local StarterGui = game:GetService("StarterGui")

local SelectedTarget = nil
local ActiveBang = nil
local HeartbeatConnection = nil
local TogglePosition = false
local isBangActive = false

local function GetPlayerNames()
    local names = {}
    for _, player in ipairs(Players:GetPlayers()) do
        table.insert(names, player.Name)
    end
    return names
end

local function GetPlayerByName(name)
    return Players:FindFirstChild(name)
end

local function SaveTarget(targetName)
    if targetName and targetName ~= "" then
        setclipboard and setclipboard(targetName)
        writefile and writefile("BangTarget.txt", targetName)
    end
end

local function LoadSavedTarget()
    local saved = nil
    if readfile then
        saved = readfile("BangTarget.txt")
        if saved and saved ~= "" then
            saved = saved:gsub("\n", "")
        end
    end
    return saved
end

local function ResetAllAnimations(char)
    if not char then return end
    local animator = char:FindFirstChildOfClass("Animator")
    if animator then
        for _, track in ipairs(animator:GetPlayingAnimationTracks()) do
            track:Stop()
        end
    end
    local humanoid = char:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.WalkSpeed = 16
        humanoid.JumpPower = 50
        humanoid.AutoRotate = true
        humanoid.PlatformStand = false
    end
end

local function FreezeCharacter(char)
    if not char then return end
    local humanoid = char:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.WalkSpeed = 0
        humanoid.JumpPower = 0
        humanoid.AutoRotate = false
        humanoid.PlatformStand = true
    end
    local animator = char:FindFirstChildOfClass("Animator")
    if animator then
        for _, track in ipairs(animator:GetPlayingAnimationTracks()) do
            track:Stop()
        end
    end
end

local function StopActiveBang()
    if HeartbeatConnection then
        HeartbeatConnection:Disconnect()
        HeartbeatConnection = nil
    end
    
    local char = LocalPlayer.Character
    if char then
        ResetAllAnimations(char)
    end
    
    ActiveBang = nil
    isBangActive = false
    TogglePosition = false
end

local function ExecuteBang(bangType, offsetY, isFaceBang)
    if ActiveBang then
        StopActiveBang()
    end
    
    if not SelectedTarget or SelectedTarget == "" then
        warn("الرجاء اختيار لاعب أولاً!")
        return
    end
    
    local targetPlayer = GetPlayerByName(SelectedTarget)
    if not targetPlayer or not targetPlayer.Character then
        warn("اللاعب المختار غير متوفر!")
        return
    end
    
    ActiveBang = bangType
    isBangActive = true
    TogglePosition = false
    
    local char = LocalPlayer.Character
    if not char then return end
    
    FreezeCharacter(char)
    
    if HeartbeatConnection then
        HeartbeatConnection:Disconnect()
    end
    
    HeartbeatConnection = RunService.Heartbeat:Connect(function()
        if not isBangActive then 
            HeartbeatConnection:Disconnect()
            HeartbeatConnection = nil
            return 
        end
        
        local targetPlayer = GetPlayerByName(SelectedTarget)
        if not targetPlayer or not targetPlayer.Character then
            StopActiveBang()
            warn("اللاعب " .. SelectedTarget .. " غادر السيرفر!")
            SelectedTarget = nil
            return
        end
        
        local targetHead = targetPlayer.Character:FindFirstChild("Head")
        local primaryPart = char.PrimaryPart
        
        if not targetHead or not primaryPart then return end
        
        TogglePosition = not TogglePosition
        local offsetDistance = TogglePosition and 1 or 4
        
        if isFaceBang then
            char:SetPrimaryPartCFrame(
                targetHead.CFrame * CFrame.new(0, 1, -offsetDistance) * CFrame.Angles(0, math.rad(180), 0)
            )
        else
            char:SetPrimaryPartCFrame(
                targetHead.CFrame * CFrame.new(0, offsetY, offsetDistance) * CFrame.Angles(0, 0, 0)
            )
        end
        
        wait(1)
    end)
end

local PlayerDropdown = Tab:AddDropdown({
    Name = "اختيار اللاعب",
    Default = "",
    Multi = false,
    Options = GetPlayerNames(),
    Callback = function(name)
        if name and name ~= "" then
            SelectedTarget = name
            SaveTarget(name)
            if isBangActive then
                local bangData = GetActiveBangData()
                if bangData then
                    ExecuteBang(bangData.type, bangData.offsetY, bangData.isFaceBang)
                end
            end
        end
    end
})

local savedTarget = LoadSavedTarget()
if savedTarget and table.find(GetPlayerNames(), savedTarget) then
    SelectedTarget = savedTarget
    PlayerDropdown:Set(savedTarget)
end

Tab:AddButton({
    Name = "تحديث قائمة اللاعبين",
    Callback = function()
        PlayerDropdown:Set(GetPlayerNames())
        local saved = LoadSavedTarget()
        if saved and table.find(GetPlayerNames(), saved) then
            SelectedTarget = saved
            PlayerDropdown:Set(saved)
        end
    end
})

Tab:AddToggle({
    Name = "V1 - بانق خلفي",
    Default = false,
    Callback = function(value)
        if value then
            ExecuteBang("BangV1", -1, false)
        else
            if ActiveBang == "BangV1" then
                StopActiveBang()
                ActiveBang = nil
                isBangActive = false
                local char = LocalPlayer.Character
                if char then
                    ResetAllAnimations(char)
                end
            end
        end
    end
})

Tab:AddToggle({
    Name = "V2 - بانق خلفي",
    Default = false,
    Callback = function(value)
        if value then
            ExecuteBang("BangV2", -1.5, false)
        else
            if ActiveBang == "BangV2" then
                StopActiveBang()
                ActiveBang = nil
                isBangActive = false
                local char = LocalPlayer.Character
                if char then
                    ResetAllAnimations(char)
                end
            end
        end
    end
})

Tab:AddToggle({
    Name = "V1 - بانق امامي",
    Default = false,
    Callback = function(value)
        if value then
            ExecuteBang("FaceBangV1", 1, true)
        else
            if ActiveBang == "FaceBangV1" then
                StopActiveBang()
                ActiveBang = nil
                isBangActive = false
                local char = LocalPlayer.Character
                if char then
                    ResetAllAnimations(char)
                end
            end
        end
    end
})

Tab:AddToggle({
    Name = "V2 - بانق امامي",
    Default = false,
    Callback = function(value)
        if value then
            ExecuteBang("FaceBangV2", 1, true)
        else
            if ActiveBang == "FaceBangV2" then
                StopActiveBang()
                ActiveBang = nil
                isBangActive = false
                local char = LocalPlayer.Character
                if char then
                    ResetAllAnimations(char)
                end
            end
        end
    end
})

Tab:AddButton({
    Name = "ايقاف الكل",
    Callback = function()
        StopActiveBang()
        ActiveBang = nil
        isBangActive = false
        local char = LocalPlayer.Character
        if char then
            ResetAllAnimations(char)
        end
        for _, toggle in ipairs(Tab:GetToggles()) do
            toggle:Set(false)
        end
    end
})

Tab:AddButton({
    Name = "اعادة تعيين الكل",
    Callback = function()
        StopActiveBang()
        ActiveBang = nil
        isBangActive = false
        SelectedTarget = nil
        PlayerDropdown:Set("")
        TogglePosition = false
        local char = LocalPlayer.Character
        if char then
            ResetAllAnimations(char)
        end
        for _, toggle in ipairs(Tab:GetToggles()) do
            toggle:Set(false)
        end
        print("تم إعادة تعيين الكل")
    end
})

local function GetActiveBangData()
    if not ActiveBang then return nil end
    
    local bangMap = {
        BangV1 = {type = "BangV1", offsetY = -1, isFaceBang = false},
        BangV2 = {type = "BangV2", offsetY = -1.5, isFaceBang = false},
        FaceBangV1 = {type = "FaceBangV1", offsetY = 1, isFaceBang = true},
        FaceBangV2 = {type = "FaceBangV2", offsetY = 1, isFaceBang = true}
    }
    
    return bangMap[ActiveBang]
end

Players.PlayerAdded:Connect(function(player)
    PlayerDropdown:Set(GetPlayerNames())
    local saved = LoadSavedTarget()
    if saved and saved == player.Name then
        SelectedTarget = saved
        PlayerDropdown:Set(saved)
    end
    if player.Name ~= LocalPlayer.Name then
        print("دخل " .. player.Name)
        StarterGui:SetCore("SendNotification", {
            Title = "دخول لاعب",
            Text = player.Name .. " دخل السيرفر!",
            Duration = 3
        })
    end
end)

Players.PlayerRemoving:Connect(function(player)
    PlayerDropdown:Set(GetPlayerNames())
    
    if SelectedTarget == player.Name then
        print("طلع " .. player.Name .. " - تم ايقاف البانق!")
        StarterGui:SetCore("SendNotification", {
            Title = "خروج لاعب",
            Text = player.Name .. " طلع من السيرفر! تم ايقاف البانق.",
            Duration = 4
        })
        StopActiveBang()
        ActiveBang = nil
        isBangActive = false
        SelectedTarget = nil
        PlayerDropdown:Set("")
        local char = LocalPlayer.Character
        if char then
            ResetAllAnimations(char)
        end
        for _, toggle in ipairs(Tab:GetToggles()) do
            toggle:Set(false)
        end
    else
        if player.Name ~= LocalPlayer.Name then
            print("طلع " .. player.Name)
            StarterGui:SetCore("SendNotification", {
                Title = "خروج لاعب",
                Text = player.Name .. " طلع من السيرفر!",
                Duration = 3
            })
        end
    end
end)

LocalPlayer.OnTeleport:Connect(function()
    StopActiveBang()
end)

LocalPlayer.CharacterAdded:Connect(function(char)
    wait(0.5)
    if isBangActive then
        FreezeCharacter(char)
        local bangData = GetActiveBangData()
        if bangData and SelectedTarget then
            local targetPlayer = GetPlayerByName(SelectedTarget)
            if targetPlayer and targetPlayer.Character then
                ExecuteBang(bangData.type, bangData.offsetY, bangData.isFaceBang)
            end
        end
    end
end)

print("تم تحميل سكريبت البانق المطور بنجاح!")
print("تم تحميل اللاعب المحفوظ: " .. (savedTarget or "لا يوجد"))
