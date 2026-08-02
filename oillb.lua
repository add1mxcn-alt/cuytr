local args = {
    "RolePlayName",
    "Onyxen Hub Beta"
}
game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1RPNam1eTex1t"):FireServer(unpack(args))
local args = {
    "PickingRPNameColor",
    Color3.fromRGB(255, 0, 0)
}
game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1RPNam1eColo1r"):FireServer(unpack(args))
local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer

local args1 = {
    "RolePlayBio",
    "Welcome " .. localPlayer.DisplayName
}
game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1RPNam1eTex1t"):FireServer(unpack(args1))

local args2 = {
    "PickingRPBioColor",
    Color3.fromRGB(20, 20, 20)
}
game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1RPNam1eColo1r"):FireServer(unpack(args2))

local Libary = loadstring(game:HttpGet("https://encrypt-x.pages.dev/Scripts?Id=15512944924"))("15512944924")
Libary.SoundSettings = {
    Enabled = true,
    SoundId = "rbxassetid://9083627113",
    Volume = 1
}
Libary.BackgroundSettings = {
    Enabled = true,
    ImageId = "rbxassetid://92958043176010",
    Transparency = 0.2
}
Libary.IntroSettings = {
    Enabled = true
}

local function PlayClickSound()
    if Libary.SoundSettings.Enabled then
        local sound = Instance.new("Sound", game:GetService("SoundService"))
        sound.SoundId = Libary.SoundSettings.SoundId
        sound.Volume = Libary.SoundSettings.Volume
        sound:Play()
        sound.Ended:Connect(function() sound:Destroy() end)
    end
end

local function ConnectButtons(parent)
    local function check(obj)
        if obj:IsA("TextButton") or obj:IsA("ImageButton") then
            obj.Activated:Connect(PlayClickSound)
        end
    end
    for _, item in pairs(parent:GetDescendants()) do check(item) end
    parent.DescendantAdded:Connect(check)
end

if Libary.IntroSettings.Enabled then
    local TweenService = game:GetService("TweenService")
    local CoreGui = game:GetService("CoreGui")
    local Players = game:GetService("Players")
    local SoundService = game:GetService("SoundService")
    local LocalPlayer = Players.LocalPlayer
    
    local introSound = Instance.new("Sound", SoundService)
    introSound.SoundId = "rbxassetid://4810729995"
    introSound.Volume = 3
    introSound:Play()
    
    local IntroGui = Instance.new("ScreenGui", CoreGui)
    IntroGui.Name = "IntroLoader"
    IntroGui.ResetOnSpawn = false
    IntroGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    local MainFrame = Instance.new("Frame", IntroGui)
    MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    MainFrame.BackgroundTransparency = 0
    MainFrame.BorderSizePixel = 0
    MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    MainFrame.Size = UDim2.new(0, 320, 0, 240)
    MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    MainFrame.ClipsDescendants = true
    
    local MainCorner = Instance.new("UICorner", MainFrame)
    MainCorner.CornerRadius = UDim.new(0, 12)
    
    local BorderFrame = Instance.new("Frame", MainFrame)
    BorderFrame.Size = UDim2.new(1, 0, 1, 0)
    BorderFrame.Position = UDim2.new(0, 0, 0, 0)
    BorderFrame.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    BorderFrame.BackgroundTransparency = 1
    BorderFrame.BorderSizePixel = 2
    BorderFrame.BorderColor3 = Color3.fromRGB(200, 0, 0)
    BorderFrame.ZIndex = 0
    local BorderCorner = Instance.new("UICorner", BorderFrame)
    BorderCorner.CornerRadius = UDim.new(0, 12)
    
    local BgImage = Instance.new("ImageLabel", MainFrame)
    BgImage.Size = UDim2.new(1, 0, 1, 0)
    BgImage.BackgroundTransparency = 1
    BgImage.Image = "rbxassetid://92958043176010"
    BgImage.ImageTransparency = 0.3
    BgImage.ScaleType = Enum.ScaleType.Crop
    BgImage.ZIndex = 1
    
    local LogoImage = Instance.new("ImageLabel", MainFrame)
    LogoImage.Size = UDim2.new(0, 60, 0, 60)
    LogoImage.Position = UDim2.new(0.5, -30, 0, 20)
    LogoImage.BackgroundTransparency = 1
    LogoImage.Image = "rbxassetid://105486605683937"
    LogoImage.ZIndex = 2
    
    local TitleText = Instance.new("TextLabel", MainFrame)
    TitleText.Size = UDim2.new(1, 0, 0, 28)
    TitleText.Position = UDim2.new(0, 0, 0, 88)
    TitleText.BackgroundTransparency = 1
    TitleText.Text = "Onyxen Hub"
    TitleText.TextColor3 = Color3.fromRGB(255, 0, 0)
    TitleText.Font = Enum.Font.GothamBold
    TitleText.TextSize = 22
    TitleText.ZIndex = 2
    
    local BetaText = Instance.new("TextLabel", MainFrame)
    BetaText.Size = UDim2.new(1, 0, 0, 16)
    BetaText.Position = UDim2.new(0, 0, 0, 116)
    BetaText.BackgroundTransparency = 1
    BetaText.Text = "BETA VERSION"
    BetaText.TextColor3 = Color3.fromRGB(200, 150, 0)
    BetaText.Font = Enum.Font.GothamBold
    BetaText.TextSize = 11
    BetaText.ZIndex = 2
    
    local WelcomeText = Instance.new("TextLabel", MainFrame)
    WelcomeText.Size = UDim2.new(1, 0, 0, 20)
    WelcomeText.Position = UDim2.new(0, 0, 0, 138)
    WelcomeText.BackgroundTransparency = 1
    WelcomeText.Text = "مرحباً " .. LocalPlayer.DisplayName
    WelcomeText.TextColor3 = Color3.fromRGB(255, 255, 255)
    WelcomeText.Font = Enum.Font.GothamBold
    WelcomeText.TextSize = 14
    WelcomeText.ZIndex = 2
    
    local FooterText = Instance.new("TextLabel", MainFrame)
    FooterText.Size = UDim2.new(1, 0, 0, 16)
    FooterText.Position = UDim2.new(0, 0, 0, 164)
    FooterText.BackgroundTransparency = 1
    FooterText.Text = "نحن مبرؤون الذمة عن استخدامكم للسكربت"
    FooterText.TextColor3 = Color3.fromRGB(130, 130, 130)
    FooterText.Font = Enum.Font.Gotham
    FooterText.TextSize = 9
    FooterText.ZIndex = 2
    
    local ProgressBg = Instance.new("Frame", MainFrame)
    ProgressBg.Size = UDim2.new(0, 180, 0, 4)
    ProgressBg.Position = UDim2.new(0.5, -90, 0, 195)
    ProgressBg.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    ProgressBg.BorderSizePixel = 0
    ProgressBg.ZIndex = 2
    local ProgBgCorner = Instance.new("UICorner", ProgressBg)
    ProgBgCorner.CornerRadius = UDim.new(0, 2)
    
    local ProgressFill = Instance.new("Frame", ProgressBg)
    ProgressFill.Size = UDim2.new(0, 0, 1, 0)
    ProgressFill.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    ProgressFill.BorderSizePixel = 0
    ProgressFill.ZIndex = 3
    local ProgFillCorner = Instance.new("UICorner", ProgressFill)
    ProgFillCorner.CornerRadius = UDim.new(0, 2)
    
    local ProgressText = Instance.new("TextLabel", MainFrame)
    ProgressText.Size = UDim2.new(1, 0, 0, 14)
    ProgressText.Position = UDim2.new(0, 0, 0, 205)
    ProgressText.BackgroundTransparency = 1
    ProgressText.Text = "0%"
    ProgressText.TextColor3 = Color3.fromRGB(180, 180, 180)
    ProgressText.Font = Enum.Font.GothamBold
    ProgressText.TextSize = 10
    ProgressText.ZIndex = 2
    
    local RunService = game:GetService("RunService")
    local rotationConnection
    
    rotationConnection = RunService.RenderStepped:Connect(function(dt)
        if LogoImage and LogoImage.Parent then
            LogoImage.Rotation = (LogoImage.Rotation + (30 * dt)) % 360
        end
    end)
    
    for i = 1, 100 do
        task.wait(0.015)
        ProgressFill.Size = UDim2.new(i/100, 0, 1, 0)
        ProgressText.Text = i .. "%"
    end
    
    task.wait(0.2)
    
    TweenService:Create(MainFrame, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Size = UDim2.new(0, 0, 0, 0)}):Play()
    task.wait(0.4)
    
    if rotationConnection then
        rotationConnection:Disconnect()
    end
    
    TweenService:Create(introSound, TweenInfo.new(0.5), {Volume = 0}):Play()
    task.wait(0.5)
    introSound:Stop()
    introSound:Destroy()
    IntroGui:Destroy()
end

local Window = Libary:MakeWindow({
    Title = "Onyxen Hub Beta",
    SubTitle = "by C4 Team",
    LoadText = "Nova",
    Flags = "Nova_Brookhaven"
})

task.spawn(function()
    local coreGui = game:GetService("CoreGui")
    local gui = coreGui:WaitForChild("bruton hub with bruton library", 10)
    if gui then
        local mainFrame = gui:FindFirstChild("Hub")
        if mainFrame then
            mainFrame.ClipsDescendants = false

            local BorderFrame = Instance.new("Frame")
            BorderFrame.Name = "LiquidBorderFrame"
            BorderFrame.Size = UDim2.new(1, 6, 1, 6)
            BorderFrame.Position = UDim2.new(0, -3, 0, -3)
            BorderFrame.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
            BorderFrame.BorderSizePixel = 0
            BorderFrame.ZIndex = -2
            BorderFrame.Parent = mainFrame

            local BorderCorner = Instance.new("UICorner", BorderFrame)
            BorderCorner.CornerRadius = UDim.new(0, 16)

            local UIGradient = Instance.new("UIGradient")
            UIGradient.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
                ColorSequenceKeypoint.new(0.5, Color3.fromRGB(40, 0, 0)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 0))
            })
            UIGradient.Rotation = 0
            UIGradient.Parent = BorderFrame

            if Libary.BackgroundSettings.Enabled then
                local WindowBackground = Instance.new("ImageLabel")
                WindowBackground.Name = "CustomBackground"
                WindowBackground.Size = UDim2.new(1, 0, 1, 0)
                WindowBackground.BackgroundTransparency = 1
                WindowBackground.Image = Libary.BackgroundSettings.ImageId
                WindowBackground.ImageTransparency = Libary.BackgroundSettings.Transparency
                WindowBackground.ScaleType = Enum.ScaleType.Crop
                WindowBackground.ZIndex = -1
                WindowBackground.Active = false
                WindowBackground.Parent = mainFrame
                
                local BgCorner = Instance.new("UICorner", WindowBackground)
                BgCorner.CornerRadius = UDim.new(0, 15)
            end

            local RotatingLogo = Instance.new("ImageLabel")
            RotatingLogo.Name = "BackgroundRotatingLogo"
            RotatingLogo.Size = UDim2.new(0, 110, 0, 110)
            RotatingLogo.AnchorPoint = Vector2.new(0.5, 0.5)
            RotatingLogo.Position = UDim2.new(0.5, 0, 0.5, 0)
            RotatingLogo.BackgroundTransparency = 1
            RotatingLogo.Image = "rbxassetid://113637032468077"
            RotatingLogo.ImageTransparency = 0.65
            RotatingLogo.ZIndex = 0
            RotatingLogo.Active = false
            RotatingLogo.Parent = mainFrame

            local LogoCorner = Instance.new("UICorner", RotatingLogo)
            LogoCorner.CornerRadius = UDim.new(1, 0)

            mainFrame:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
                local isVisible = mainFrame.AbsoluteSize.Y > 100
                RotatingLogo.Visible = isVisible
                BorderFrame.Visible = isVisible
            end)

            local RunService = game:GetService("RunService")
            RunService.RenderStepped:Connect(function(dt)
                if RotatingLogo and RotatingLogo.Parent and RotatingLogo.Visible then
                    RotatingLogo.Rotation = (RotatingLogo.Rotation + (35 * dt)) % 360
                end
                if UIGradient and UIGradient.Parent then
                    UIGradient.Rotation = (UIGradient.Rotation + (90 * dt)) % 360
                end
            end)
        end
        ConnectButtons(gui)
    end
end)

Window:AddMinimizeButton({
    Button = { Image = "rbxassetid://121318102143462", BackgroundTransparency = 0 }, 
    Corner = { CornerRadius = UDim.new(35, 1) },
})

local Tab1 = Window:MakeTab({ Title = "INFO", Icon = "rbxassetid://10723415903" })
Tab1:AddDiscordInvite({
    Name = "Team C4",
    Description = "Telegram script channel",
    Logo = "rbxassetid://121318102143462",
    Invite = "https://t.me/xC4Team",
})
Tab1:AddParagraph({"CREDIT", "C4"})
Tab1:AddButton({
	Name = "Copy my Samurai telegram account",
	Callback = function()
		setclipboard("xm_mr")
	end
})

Tab1:AddButton({
	Name = "Copy my Nokia telegram account",
	Callback = function()
		setclipboard("ahmed_nokia1")
	end
})

local TrollTab = Window:MakeTab({
    Title = "TROLL",
    Icon = "rbxassetid://101969836917433"
})

TrollTab:AddSection({ "اوعدكم هذه النسخه الخاصه ب التاب قليله اما التحديث القادم" })

TrollTab:AddSection({ "اللاعب" })

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local SelectedPlayer = nil
local loopTP = false
local isSpectating = false

local function GetPlayerNames()
    local t = {}
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer then
            table.insert(t, p.Name)
        end
    end
    return t
end

local PlayerDropdown = TrollTab:AddDropdown({
    Name = "اختيار اللاعب",
    Default = "",
    Multi = false,
    Options = GetPlayerNames(),
    Callback = function(name)
        SelectedPlayer = Players:FindFirstChild(name)
    end
})

TrollTab:AddButton({
    Name = "تحديث قائمة اللاعبين",
    Callback = function()
        PlayerDropdown:Set(GetPlayerNames())
    end
})

TrollTab:AddToggle({
    Name = "تلبورت مستمر للاعب",
    Callback = function(Value)
        loopTP = Value
        if loopTP then
            task.spawn(function()
                while loopTP do
                    if SelectedPlayer and SelectedPlayer.Character and SelectedPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        local myChar = LocalPlayer.Character
                        if myChar and myChar:FindFirstChild("HumanoidRootPart") then
                            myChar.HumanoidRootPart.CFrame = SelectedPlayer.Character.HumanoidRootPart.CFrame
                        end
                    end
                    task.wait(0.02)
                end
            end)
        end
    end
})

TrollTab:AddToggle({
    Name = "تتبع اللاعب",
    Default = false,
    Callback = function(state)
        if not SelectedPlayer then
            return
        end
        if state then
            pcall(function()
                workspace.CurrentCamera.CameraSubject = SelectedPlayer.Character:WaitForChild("Humanoid")
                workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
            end)
        else
            pcall(function()
                workspace.CurrentCamera.CameraSubject = LocalPlayer.Character:WaitForChild("Humanoid")
                workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
            end)
        end
    end
})

TrollTab:AddButton({
    Name = "تلبورت للاعب",
    Callback = function()
        if not SelectedPlayer then return end
        if SelectedPlayer.Character and SelectedPlayer.Character:FindFirstChild("HumanoidRootPart") then
            LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = SelectedPlayer.Character.HumanoidRootPart.CFrame
        end
    end
})

TrollTab:AddSection({ "القارب الخشبي" })

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer

local function GetPlayerNames()
    local t = {}
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer then
            table.insert(t, p.Name)
        end
    end
    return t
end

local SelectedPlayer = nil

local PlayerDropdown = TrollTab:AddDropdown({
    Name = "اختيار اللاعب",
    Description = "",
    Default = "",
    Multi = false,
    Options = GetPlayerNames(),
    Flag = "player_list",
    Callback = function(PlayerName)
        SelectedPlayer = PlayerName
    end
})

local function UpdatePlayers()
    PlayerDropdown:Set(GetPlayerNames())
end

TrollTab:AddButton({
    Name = "تحديث قائمة اللاعبين",
    Callback = function()
        UpdatePlayers()
    end
})

TrollTab:AddButton({
    Name = "قتل بالقارب الخشبي",
    Callback = function()
        if not SelectedPlayer then return end
        local Target = Players:FindFirstChild(SelectedPlayer)
        if not Target or not Target.Character then return end
        
        local Char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local Root = Char:WaitForChild("HumanoidRootPart")
        local Hum = Char:WaitForChild("Humanoid")
        local OldPos = Root.CFrame

        if Hum.Sit then
            Hum.Sit = false
            task.wait(0.5)
        end

        Root.CFrame = workspace.WorkspaceCom["001_CanoeCloneButton"].Button.CFrame
        task.wait(0.5)
        fireclickdetector(workspace.WorkspaceCom["001_CanoeCloneButton"].Button.ClickDetector, 0)
        task.wait(0.8)

        local Boat = workspace.WorkspaceCom["001_CanoeStorage"]:WaitForChild("Canoe")
        local Seat = Boat:WaitForChild("VehicleSeat")
        Boat.PrimaryPart = Seat

        local Attempts = 0
        repeat
            Root.CFrame = Seat.CFrame * CFrame.new(0, 2, 0)
            task.wait(0.1)
            Seat:Sit(Hum)
            Attempts = Attempts + 1
        until Hum.Sit or Attempts > 50

        if not Hum.Sit then return end

        local TChar = Target.Character
        local TRoot = TChar:FindFirstChild("HumanoidRootPart")
        local THum = TChar:FindFirstChildOfClass("Humanoid")

        if TRoot and THum then
            local Timer = tick()
            while THum.Health > 0 and not THum.Sit and (tick() - Timer) < 15 do
                task.wait()
                local Ang = CFrame.Angles(math.rad(math.random(-360, 360)), math.rad(math.random(-360, 360)), math.rad(math.random(-360, 360)))
                Boat:SetPrimaryPartCFrame(CFrame.new(TRoot.Position) * Ang)
            end
        end

        Boat:SetPrimaryPartCFrame(CFrame.new(0, -500, 0))
        task.wait(0.2)
        Hum.Sit = false
        task.wait(0.3)
        Root.CFrame = OldPos
    end
})

TrollTab:AddButton({
    Name = "دوران بالقارب الخشبي",
    Callback = function()
        if not SelectedPlayer then return end
        local Target = Players:FindFirstChild(SelectedPlayer)
        if not Target then return end

        local Char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local Root = Char:WaitForChild("HumanoidRootPart")
        local Hum = Char:WaitForChild("Humanoid")

        if Hum.Sit then
            Hum.Sit = false
            task.wait(0.5)
        end

        Root.CFrame = workspace.WorkspaceCom["001_CanoeCloneButton"].Button.CFrame
        task.wait(0.4)
        fireclickdetector(workspace.WorkspaceCom["001_CanoeCloneButton"].Button.ClickDetector, 0)
        task.wait(0.4)

        local Boat = workspace.WorkspaceCom["001_CanoeStorage"].Canoe
        local Seat = Boat:FindFirstChild("VehicleSeat")
        Boat.PrimaryPart = Seat

        local Attempts = 0
        repeat
            Root.CFrame = Seat.CFrame * CFrame.new(0, 2, 0)
            task.wait(0.05)
            Seat:Sit(Hum)
            Attempts = Attempts + 1
        until Hum.Sit or Attempts > 100

        if not Hum.Sit then return end

        local TChar = Target.Character
        local TRoot = TChar:WaitForChild("HumanoidRootPart")
        local THum = TChar:WaitForChild("Humanoid")

        local Force = Instance.new("BodyForce", Boat.PrimaryPart)
        local Angular = Instance.new("BodyAngularVelocity", Boat.PrimaryPart)
        Angular.MaxTorque = Vector3.new(1e9, 1e9, 1e9)
        Angular.AngularVelocity = Vector3.new(1000, 5000, 1000)
        Angular.P = 1e9

        local Start = tick()
        while tick() - Start < 10 and Hum.Sit and TChar and THum and THum.Health > 0 do
            local Time = tick() * 30
            local Offset = TRoot.CFrame.LookVector * 10 * (math.sin(Time) > 0 and 1 or -1)
            Boat:SetPrimaryPartCFrame(CFrame.new(TRoot.Position + Offset, TRoot.Position))
            Force.Force = (TRoot.Position - Boat.PrimaryPart.Position).Unit * 1e6 + Vector3.new(0, workspace.Gravity * Boat.PrimaryPart:GetMass(), 0)
            task.wait()
        end

        Force:Destroy()
        Angular:Destroy()
        Hum.Sit = false
    end
})

TrollTab:AddToggle({
    Name = "سحب بالقارب الخشبي",
    Default = false,
    Callback = function(Value)
        _G.PullToggle = Value
        if _G.PullToggle then
            task.spawn(function()
                if not SelectedPlayer then return end
                local Target = Players:FindFirstChild(SelectedPlayer)
                if not Target or not Target.Character then return end

                local Char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
                local Root = Char:WaitForChild("HumanoidRootPart")
                local Hum = Char:WaitForChild("Humanoid")
                local OldPos = Root.CFrame

                if Hum.Sit then
                    Hum.Sit = false
                    task.wait(0.5)
                end

                Root.CFrame = workspace.WorkspaceCom["001_CanoeCloneButton"].Button.CFrame
                task.wait(0.8)
                fireclickdetector(workspace.WorkspaceCom["001_CanoeCloneButton"].Button.ClickDetector, 0)
                task.wait(1)

                local Boat = workspace.WorkspaceCom["001_CanoeStorage"]:WaitForChild("Canoe")
                local Seat = Boat:WaitForChild("VehicleSeat")
                Boat.PrimaryPart = Seat

                local Attempts = 0
                repeat
                    Root.CFrame = Seat.CFrame * CFrame.new(0, 2, 0)
                    task.wait(0.1)
                    Seat:Sit(Hum)
                    Attempts = Attempts + 1
                until Hum.Sit or Attempts > 50 or not _G.PullToggle

                if not Hum.Sit then return end

                local TChar = Target.Character
                local TRoot = TChar:FindFirstChild("HumanoidRootPart")
                local THum = TChar:FindFirstChildOfClass("Humanoid")

                if TRoot and THum then
                    local Timer = tick()
                    while _G.PullToggle and THum.Health > 0 and not THum.Sit and (tick() - Timer) < 15 do
                        task.wait()
                        local Time = tick() * 35
                        Boat:SetPrimaryPartCFrame(TRoot.CFrame * CFrame.new(math.sin(Time) * 4, 0, math.cos(Time) * 15))
                    end

                    if THum.Sit then
                        task.wait(0.8)
                        Boat:SetPrimaryPartCFrame(OldPos)
                        task.wait(1.5)
                    end
                end

                Hum.Sit = false
                task.wait(0.5)
                Root.CFrame = OldPos + Vector3.new(0, 3, 0)
                Root.Anchored = true
                task.wait(1)
                Root.Anchored = false
            end)
        end
    end
})

TrollTab:AddSection({ "الكل بالقارب الخشبي" })

TrollTab:AddToggle({
    Name = "قتل الكل بالقارب الخشبي",
    Default = false,
    Callback = function(Value)
        _G.KillAll = Value
        if _G.KillAll then
            task.spawn(function()
                while _G.KillAll do
                    for _, Target in ipairs(Players:GetPlayers()) do
                        if not _G.KillAll then break end
                        if Target ~= LocalPlayer and Target.Character then
                            local TChar = Target.Character
                            local TRoot = TChar:FindFirstChild("HumanoidRootPart")
                            local THum = TChar:FindFirstChildOfClass("Humanoid")
                            if TRoot and THum and THum.Health > 0 and not THum.Sit then
                                local Char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
                                local Root = Char:WaitForChild("HumanoidRootPart")
                                local Hum = Char:WaitForChild("Humanoid")
                                local OldPos = Root.CFrame

                                if Hum.Sit then
                                    Hum.Sit = false
                                    task.wait(0.3)
                                end

                                Root.CFrame = workspace.WorkspaceCom["001_CanoeCloneButton"].Button.CFrame
                                task.wait(0.6)
                                fireclickdetector(workspace.WorkspaceCom["001_CanoeCloneButton"].Button.ClickDetector, 0)
                                task.wait(0.8)

                                local BoatFolder = workspace.WorkspaceCom["001_CanoeStorage"]
                                local AllBoats = BoatFolder:GetChildren()
                                local LatestBoat = AllBoats[#AllBoats]

                                if LatestBoat and LatestBoat:FindFirstChild("VehicleSeat") then
                                    local Seat = LatestBoat.VehicleSeat
                                    LatestBoat.PrimaryPart = Seat

                                    local Attempts = 0
                                    repeat
                                        Root.CFrame = Seat.CFrame * CFrame.new(0, 2, 0)
                                        task.wait(0.1)
                                        Seat:Sit(Hum)
                                        Attempts = Attempts + 1
                                    until Hum.Sit or Attempts > 40 or not _G.KillAll

                                    if Hum.Sit then
                                        local Timer = tick()
                                        while THum.Health > 0 and not THum.Sit and _G.KillAll and (tick() - Timer) < 10 do
                                            task.wait()
                                            local Ang = CFrame.Angles(math.rad(math.random(-360, 360)), math.rad(math.random(-360, 360)), math.rad(math.random(-360, 360)))
                                            LatestBoat:SetPrimaryPartCFrame(CFrame.new(TRoot.Position) * Ang)
                                        end

                                        LatestBoat:SetPrimaryPartCFrame(CFrame.new(0, -1000, 0))
                                        task.wait(0.2)
                                        Hum.Sit = false
                                        task.wait(0.4)
                                        Root.CFrame = OldPos
                                        task.wait(0.5)
                                    end
                                end
                            end
                        end
                    end
                    task.wait(1)
                end
            end)
        end
    end
})

TrollTab:AddToggle({
    Name = "سحب الكل بالقارب الخشبي",
    Default = false,
    Callback = function(Value)
        _G.AutoPullAll = Value
        if _G.AutoPullAll then
            task.spawn(function()
                while _G.AutoPullAll do
                    for _, Target in ipairs(Players:GetPlayers()) do
                        if not _G.AutoPullAll then break end
                        if Target ~= LocalPlayer and Target.Character then
                            local TChar = Target.Character
                            local TRoot = TChar:FindFirstChild("HumanoidRootPart")
                            local THum = TChar:FindFirstChildOfClass("Humanoid")
                            if TRoot and THum and THum.Health > 0 and not THum.Sit then
                                local Char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
                                local Root = Char:WaitForChild("HumanoidRootPart")
                                local Hum = Char:WaitForChild("Humanoid")
                                local OldPos = Root.CFrame

                                if Hum.Sit then
                                    Hum.Sit = false
                                    task.wait(0.5)
                                end

                                Root.CFrame = workspace.WorkspaceCom["001_CanoeCloneButton"].Button.CFrame
                                task.wait(0.8)
                                if not _G.AutoPullAll then break end
                                fireclickdetector(workspace.WorkspaceCom["001_CanoeCloneButton"].Button.ClickDetector, 0)
                                task.wait(1)

                                local Boat = workspace.WorkspaceCom["001_CanoeStorage"]:WaitForChild("Canoe")
                                local Seat = Boat:WaitForChild("VehicleSeat")
                                Boat.PrimaryPart = Seat

                                local Attempts = 0
                                repeat
                                    Root.CFrame = Seat.CFrame * CFrame.new(0, 2, 0)
                                    task.wait(0.1)
                                    Seat:Sit(Hum)
                                    Attempts = Attempts + 1
                                until Hum.Sit or Attempts > 40 or not _G.AutoPullAll

                                if Hum.Sit then
                                    local Timer = tick()
                                    while _G.AutoPullAll and THum.Health > 0 and not THum.Sit and (tick() - Timer) < 10 do
                                        task.wait()
                                        local Time = tick() * 35
                                        Boat:SetPrimaryPartCFrame(TRoot.CFrame * CFrame.new(math.sin(Time) * 4, 0, math.cos(Time) * 15))
                                    end

                                    if THum.Sit then
                                        task.wait(0.8)
                                        Boat:SetPrimaryPartCFrame(OldPos)
                                        task.wait(1.5)
                                    end

                                    Hum.Sit = false
                                    task.wait(0.5)
                                    Root.CFrame = OldPos + Vector3.new(0, 3, 0)
                                    Root.Anchored = true
                                    task.wait(1)
                                    Root.Anchored = false
                                    task.wait(1)
                                end
                            end
                        end
                    end
                    task.wait(2)
                end
            end)
        end
    end
})

TrollTab:AddSection({ "عشوائي القارب الخشبي" })

local LastRandom = nil

local function GetRandomTarget()
    local Available = {}
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p ~= LastRandom and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
            local Hum = p.Character:FindFirstChildOfClass("Humanoid")
            if Hum and Hum.Health > 0 then
                table.insert(Available, p)
            end
        end
    end
    if #Available == 0 then
        LastRandom = nil
        return GetRandomTarget()
    end
    local Chosen = Available[math.random(1, #Available)]
    LastRandom = Chosen
    return Chosen
end

TrollTab:AddButton({
    Name = "قتل عشوائي بالقارب",
    Callback = function()
        local Target = GetRandomTarget()
        if not Target then return end
        
        local Char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local Root = Char:WaitForChild("HumanoidRootPart")
        local Hum = Char:WaitForChild("Humanoid")
        local OldPos = Root.CFrame

        if Hum.Sit then
            Hum.Sit = false
            task.wait(0.5)
        end

        Root.CFrame = workspace.WorkspaceCom["001_CanoeCloneButton"].Button.CFrame
        task.wait(0.5)
        fireclickdetector(workspace.WorkspaceCom["001_CanoeCloneButton"].Button.ClickDetector, 0)
        task.wait(0.8)

        local Boat = workspace.WorkspaceCom["001_CanoeStorage"]:WaitForChild("Canoe")
        local Seat = Boat:WaitForChild("VehicleSeat")
        Boat.PrimaryPart = Seat

        local Attempts = 0
        repeat
            Root.CFrame = Seat.CFrame * CFrame.new(0, 2, 0)
            task.wait(0.1)
            Seat:Sit(Hum)
            Attempts = Attempts + 1
        until Hum.Sit or Attempts > 50

        if not Hum.Sit then return end

        local TChar = Target.Character
        local TRoot = TChar:FindFirstChild("HumanoidRootPart")
        local THum = TChar:FindFirstChildOfClass("Humanoid")

        if TRoot and THum then
            local Timer = tick()
            while THum.Health > 0 and not THum.Sit and (tick() - Timer) < 12 do
                task.wait()
                local Ang = CFrame.Angles(math.rad(math.random(-360, 360)), math.rad(math.random(-360, 360)), math.rad(math.random(-360, 360)))
                Boat:SetPrimaryPartCFrame(CFrame.new(TRoot.Position) * Ang)
            end
        end

        Boat:SetPrimaryPartCFrame(CFrame.new(0, -500, 0))
        task.wait(0.2)
        Hum.Sit = false
        task.wait(0.3)
        Root.CFrame = OldPos
    end
})

TrollTab:AddToggle({
    Name = "سحب عشوائي بالقارب الخشبي",
    Default = false,
    Callback = function(Value)
        _G.PullToggle = Value
        if not _G.PullToggle then return end
        
        task.spawn(function()
            local Target = GetRandomTarget()
            if not Target then return end

            local Char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
            local Root = Char:WaitForChild("HumanoidRootPart")
            local Hum = Char:WaitForChild("Humanoid")
            local OldPos = Root.CFrame

            if Hum.Sit then
                Hum.Sit = false
                task.wait(0.5)
            end

            Root.CFrame = workspace.WorkspaceCom["001_CanoeCloneButton"].Button.CFrame
            task.wait(0.8)
            fireclickdetector(workspace.WorkspaceCom["001_CanoeCloneButton"].Button.ClickDetector, 0)
            task.wait(1)

            local Boat = workspace.WorkspaceCom["001_CanoeStorage"]:WaitForChild("Canoe")
            local Seat = Boat:WaitForChild("VehicleSeat")
            Boat.PrimaryPart = Seat

            local Attempts = 0
            repeat
                Root.CFrame = Seat.CFrame * CFrame.new(0, 2, 0)
                task.wait(0.1)
                Seat:Sit(Hum)
                Attempts = Attempts + 1
            until Hum.Sit or Attempts > 50

            if not Hum.Sit then return end

            local TChar = Target.Character
            local TRoot = TChar:FindFirstChild("HumanoidRootPart")
            local THum = TChar:FindFirstChildOfClass("Humanoid")

            local Timer = tick()
            while _G.PullToggle and THum.Health > 0 and not THum.Sit and (tick() - Timer) < 15 do
                task.wait()
                local Time = tick() * 35
                Boat:SetPrimaryPartCFrame(TRoot.CFrame * CFrame.new(math.sin(Time) * 4, 0, math.cos(Time) * 15))
            end

            if THum.Sit then
                task.wait(0.8)
                Boat:SetPrimaryPartCFrame(OldPos)
                task.wait(1.5)
            end

            Hum.Sit = false
            task.wait(0.5)
            Root.CFrame = OldPos + Vector3.new(0, 3, 0)
            Root.Anchored = true
            task.wait(2)
            Root.Anchored = false
        end)
    end
})

TrollTab:AddButton({
    Name = "دوران عشوائي بالقارب الخشبي",
    Callback = function()
        local Target = GetRandomTarget()
        if not Target then return end

        local Char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local Root = Char:WaitForChild("HumanoidRootPart")
        local Hum = Char:WaitForChild("Humanoid")

        if Hum.Sit then
            Hum.Sit = false
            task.wait(0.5)
        end

        Root.CFrame = workspace.WorkspaceCom["001_CanoeCloneButton"].Button.CFrame
        task.wait(0.4)
        fireclickdetector(workspace.WorkspaceCom["001_CanoeCloneButton"].Button.ClickDetector, 0)
        task.wait(0.5)

        local Boat = workspace.WorkspaceCom["001_CanoeStorage"].Canoe
        local Seat = Boat:FindFirstChild("VehicleSeat")
        Boat.PrimaryPart = Seat

        local Attempts = 0
        repeat
            Root.CFrame = Seat.CFrame * CFrame.new(0, 2, 0)
            task.wait(0.1)
            Seat:Sit(Hum)
            Attempts = Attempts + 1
        until Hum.Sit or Attempts > 50

        if not Hum.Sit then return end

        local TChar = Target.Character
        local TRoot = TChar:WaitForChild("HumanoidRootPart")
        local THum = TChar:WaitForChild("Humanoid")

        local Force = Instance.new("BodyForce", Boat.PrimaryPart)
        local Angular = Instance.new("BodyAngularVelocity", Boat.PrimaryPart)
        Angular.MaxTorque = Vector3.new(1e9, 1e9, 1e9)
        Angular.AngularVelocity = Vector3.new(1000, 5000, 1000)
        Angular.P = 1e9

        local Start = tick()
        while tick() - Start < 10 and Hum.Sit and THum.Health > 0 and not THum.Sit do
            local Time = tick() * 30
            local Offset = TRoot.CFrame.LookVector * 10 * (math.sin(Time) > 0 and 1 or -1)
            Boat:SetPrimaryPartCFrame(CFrame.new(TRoot.Position + Offset, TRoot.Position))
            Force.Force = (TRoot.Position - Boat.PrimaryPart.Position).Unit * 1e6 + Vector3.new(0, workspace.Gravity * Boat.PrimaryPart:GetMass(), 0)
            task.wait()
        end

        Force:Destroy()
        Angular:Destroy()
        Hum.Sit = false
    end
})

TrollTab:AddSection({ "البيت" })

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer

local SelectedPlayer = nil

local function GetPlayerList()
    local Names = {}
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer then
            table.insert(Names, p.Name)
        end
    end
    return Names
end

local function HouseBanKill(Target)
    if not Target or not Target.Character then return end

    local Char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local Root = Char:WaitForChild("HumanoidRootPart")
    local Hum = Char:WaitForChild("Humanoid")
    local Houses = workspace:FindFirstChild("001_Lots")
    local Vehicles = workspace.Vehicles
    local OldPos = Root.CFrame

    local MyHouse = Houses:FindFirstChild(LocalPlayer.Name .. "House")
    local LotNumber = nil

    if not MyHouse then
        local Available = {}
        for _, Lot in pairs(Houses:GetChildren()) do
            if Lot.Name == "For Sale" then
                for _, num in pairs(Lot:GetDescendants()) do
                    if num:IsA("NumberValue") and num.Name == "Number" and num.Value <= 25 and num.Value >= 11 then
                        table.insert(Available, {Lot = Lot, Number = num.Value})
                        break
                    end
                end
            end
        end

        if #Available > 0 then
            local RandomHouse = Available[math.random(1, #Available)]
            local EmptyHouse = RandomHouse.Lot
            LotNumber = RandomHouse.Number
            local BuyDetector = EmptyHouse:FindFirstChild("BuyHouse")

            if BuyDetector then
                Root.CFrame = BuyDetector.CFrame + Vector3.new(0, -6, 0)
                task.wait(0.5)
                fireclickdetector(BuyDetector:FindFirstChild("ClickDetector"))
                
                ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Lot:Claim"):InvokeServer(LotNumber)
                task.wait(0.5)
                ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("TelemetryClientInteraction"):FireServer("filterClick", {name = "052_House", itemType = "Houses"})
                task.wait(0.5)
                ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Lot:BuildProperty"):InvokeServer(LotNumber, "052_House")
                task.wait(2)
            end
        else
            return
        end
    else
        for _, x in pairs(MyHouse:GetDescendants()) do
            if x.Name == "Number" and x:IsA("NumberValue") then
                LotNumber = x.Value
                break
            end
        end
    end

    MyHouse = Houses:FindFirstChild(LocalPlayer.Name .. "House")
    if not MyHouse then return end

    local BusSpawn = CFrame.new(82.657265, 6.133477, -1368.286011)
    Root.CFrame = BusSpawn
    task.wait(1.5)

    ReplicatedStorage.RE:FindFirstChild("1Ca1r"):FireServer("PickingCar", "Bus", "Work")
    task.wait(2.5)

    local Bus = Vehicles:FindFirstChild(LocalPlayer.Name .. "Car")
    if Bus then
        local Seat = Bus:FindFirstChild("Seats") and Bus.Seats:FindFirstChild("VehicleSeat")
        if Seat then
            repeat
                Root.CFrame = Seat.CFrame * CFrame.new(0, 2, 0)
                task.wait(0.1)
                Seat:Sit(Hum)
            until Hum.Sit or not Bus.Parent
        end

        local TChar = Target.Character
        local TRoot = TChar:FindFirstChild("HumanoidRootPart")
        local THum = TChar:FindFirstChildOfClass("Humanoid")

        if TRoot and THum then
            local Timer = tick()
            while THum.Health > 0 and not THum.Sit and (tick() - Timer) < 15 do
                task.wait()
                local Time = tick() * 35
                Bus:PivotTo(TRoot.CFrame * CFrame.new(math.sin(Time) * 4, 0, math.cos(Time) * 20))
            end

            if THum.Sit then
                task.wait(1)
                local HouseCenter = MyHouse:FindFirstChild("HouseSpawnPosition")
                if HouseCenter then
                    Bus:PivotTo(HouseCenter.CFrame + Vector3.new(0, 5, 0))
                end
                task.wait(1.5)
                
                ReplicatedStorage.RE:FindFirstChild("1Playe1rTrigge1rEven1t"):FireServer("BanPlayerFromHouse", Target, TChar)
                
                task.wait(1)
                ReplicatedStorage.RE:FindFirstChild("1Ca1r"):FireServer("DeleteAllVehicles")
                task.wait(0.5)
                Hum.Sit = false
                Root.CFrame = OldPos
            end
        end
    end
end

local PlayerDropdown = TrollTab:AddDropdown({
    Name = "اختيار اللاعب",
    Options = GetPlayerList(),
    Default = "",
    Callback = function(Value)
        SelectedPlayer = Value
        getgenv().Target = Value
    end
})

TrollTab:AddButton({
    Name = "تحديث قائمة اللاعبين",
    Callback = function()
        local NewList = {}
        for _, p in ipairs(Players:GetPlayers()) do
            if p ~= LocalPlayer then
                table.insert(NewList, p.Name)
            end
        end
        PlayerDropdown:Refresh(NewList, true)
    end
})

TrollTab:AddButton({
    Name = "حظر وقتل بالبيت",
    Callback = function()
        if not SelectedPlayer then return end
        local Target = Players:FindFirstChild(SelectedPlayer)
        if Target then
            HouseBanKill(Target)
        end
    end
})

TrollTab:AddSection({ "الكل بالبيت" })

TrollTab:AddToggle({
    Name = "حظر وقتل الكل بالبيت",
    Default = false,
    Callback = function(State)
        getgenv().AutoBanActive = State
        if State then
            task.spawn(function()
                while getgenv().AutoBanActive do
                    for _, p in ipairs(Players:GetPlayers()) do
                        if not getgenv().AutoBanActive then break end
                        if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("Humanoid") then
                            HouseBanKill(p)
                        end
                    end
                    task.wait(1)
                end
            end)
        end
    end
})

TrollTab:AddSection({ "عشوائي بالبيت" })

local LastRandomBan = nil

local function GetRandomBanTarget()
    local Available = {}
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p ~= LastRandomBan and p.Character and p.Character:FindFirstChild("Humanoid") then
            local Hum = p.Character:FindFirstChildOfClass("Humanoid")
            if Hum and Hum.Health > 0 then
                table.insert(Available, p)
            end
        end
    end
    if #Available == 0 then
        LastRandomBan = nil
        return GetRandomBanTarget()
    end
    local Chosen = Available[math.random(1, #Available)]
    LastRandomBan = Chosen
    return Chosen
end

TrollTab:AddButton({
    Name = "حظر وقتل عشوائي بالبيت",
    Callback = function()
        local Target = GetRandomBanTarget()
        if Target then
            HouseBanKill(Target)
        end
    end
})

TrollTab:AddSection({ "سكاي بوكس" })

local skyboxEnabled = false
local skyboxTrack = nil
local rigidTrack = nil
local savedNukeBody = {}

local function stopAllAnimations()
    if rigidTrack then
        pcall(function()
            rigidTrack:Stop()
            rigidTrack:Destroy()
        end)
        rigidTrack = nil
    end
    
    if skyboxTrack then
        pcall(function()
            skyboxTrack:Stop()
            skyboxTrack:Destroy()
        end)
        skyboxTrack = nil
    end
    
    local player = game.Players.LocalPlayer
    local character = player.Character
    if character then
        local humanoid = character:FindFirstChild("Humanoid")
        if humanoid then
            local animator = humanoid:FindFirstChild("Animator")
            if animator then
                for _, track in pairs(animator:GetPlayingAnimationTracks()) do
                    if track.Animation then
                        local animId = track.Animation.AnimationId
                        if animId == "rbxassetid://70883871260184" or animId == "rbxassetid://3695333486" then
                            pcall(function()
                                track:Stop()
                            end)
                        end
                    end
                end
            end
        end
    end
end
TrollTab:AddToggle({
    Name = "V1",
    Default = false,
    Callback = function(value)
        skyboxEnabled = value
        
        if value then
            local player = game.Players.LocalPlayer
            local character = player.Character
            
            if character then
                local humanoid = character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    local description = humanoid:GetAppliedDescription()
                    
                    savedNukeBody = {
                        Torso = description.Torso,
                        RightArm = description.RightArm,
                        LeftArm = description.LeftArm,
                        RightLeg = description.RightLeg,
                        LeftLeg = description.LeftLeg,
                        Head = description.Head
                    }
                    
                    task.wait(0.2)
                    
                    local args = {
                        [1] = 123402086843885,
                        [2] = 100839513065432,
                        [3] = 78300682916056,
                        [4] = 86276701020724,
                        [5] = 78409653958165,
                        [6] = 15093053680
                    }
                    
                    pcall(function()
                        game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(args)
                    end)
                    
                    task.wait(0.3)
                    
                    local newAnim = Instance.new("Animation")
                    newAnim.AnimationId = "rbxassetid://70883871260184"
                    
                    skyboxTrack = humanoid:LoadAnimation(newAnim)
                    skyboxTrack.Priority = Enum.AnimationPriority.Action4
                    skyboxTrack:Play(0.1, 1, 0.01)
                    
                    task.wait(0.5)
                    
                    local plankAnim = Instance.new("Animation")
                    plankAnim.AnimationId = "rbxassetid://3695333486"
                    rigidTrack = humanoid:LoadAnimation(plankAnim)
                    rigidTrack.Priority = Enum.AnimationPriority.Movement
                    rigidTrack:Play(0.1, 1, 0)
                end
            end
        else
            stopAllAnimations()
            
            task.wait(0.2)
            
            if next(savedNukeBody) then
                local player = game.Players.LocalPlayer
                local character = player.Character
                
                if character then
                    local humanoid = character:FindFirstChildOfClass("Humanoid")
                    if humanoid then
                        local restoreBody = {
                            [1] = savedNukeBody.Torso,
                            [2] = savedNukeBody.RightArm,
                            [3] = savedNukeBody.LeftArm,
                            [4] = savedNukeBody.RightLeg,
                            [5] = savedNukeBody.LeftLeg,
                            [6] = savedNukeBody.Head
                        }
                        
                        local args = {
                            [1] = restoreBody
                        }
                        
                        pcall(function()
                            game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))
                        end)
                        
                        savedNukeBody = {}
                    end
                end
            end
        end
    end
})
local nukeFlashEnabled = false
local nukeFlashTrack = nil
local flashRigidTrack = nil
local savedNukeFlashBody = {}

local function stopFlashAnimations()
    if flashRigidTrack then
        pcall(function()
            flashRigidTrack:Stop()
            flashRigidTrack:Destroy()
        end)
        flashRigidTrack = nil
    end
    
    if nukeFlashTrack then
        pcall(function()
            nukeFlashTrack:Stop()
            nukeFlashTrack:Destroy()
        end)
        nukeFlashTrack = nil
    end
end

TrollTab:AddToggle({
    Name = "V2",
    Default = false,
    Callback = function(value)
        nukeFlashEnabled = value
        
        if value then
            local player = game.Players.LocalPlayer
            local character = player.Character
            
            if character then
                local humanoid = character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    local description = humanoid:GetAppliedDescription()
                    
                    savedNukeFlashBody = {
                        Torso = description.Torso,
                        RightArm = description.RightArm,
                        LeftArm = description.LeftArm,
                        RightLeg = description.RightLeg,
                        LeftLeg = description.LeftLeg,
                        Head = description.Head
                    }
                    
                    task.wait(0.2)
                    
                    local args = {
                        [1] = 123402086843885,
                        [2] = 100839513065432,
                        [3] = 78300682916056,
                        [4] = 86276701020724,
                        [5] = 78409653958165,
                        [6] = 15093053680
                    }
                    
                    pcall(function()
                        game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(args)
                    end)
                    
                    task.wait(0.3)
                    
                    local newAnim = Instance.new("Animation")
                    newAnim.AnimationId = "rbxassetid://70883871260184"
                    
                    nukeFlashTrack = humanoid:LoadAnimation(newAnim)
                    nukeFlashTrack.Priority = Enum.AnimationPriority.Action4
                    nukeFlashTrack:Play(0.1, 1, 1)
                    
                    task.wait(0.1)
                    nukeFlashTrack:AdjustSpeed(5)
                    
                    task.wait(0.3)
                    
                    local plankAnim = Instance.new("Animation")
                    plankAnim.AnimationId = "rbxassetid://3695333486"
                    flashRigidTrack = humanoid:LoadAnimation(plankAnim)
                    flashRigidTrack.Priority = Enum.AnimationPriority.Movement
                    flashRigidTrack:Play(0.1, 1, 0)
                end
            end
        else
            stopFlashAnimations()
            
            task.wait(0.2)
            
            if next(savedNukeFlashBody) then
                local player = game.Players.LocalPlayer
                local character = player.Character
                
                if character then
                    local humanoid = character:FindFirstChildOfClass("Humanoid")
                    if humanoid then
                        local restoreBody = {
                            [1] = savedNukeFlashBody.Torso,
                            [2] = savedNukeFlashBody.RightArm,
                            [3] = savedNukeFlashBody.LeftArm,
                            [4] = savedNukeFlashBody.RightLeg,
                            [5] = savedNukeFlashBody.LeftLeg,
                            [6] = savedNukeFlashBody.Head
                        }
                        
                        local args = {
                            [1] = restoreBody
                        }
                        
                        pcall(function()
                            game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))
                        end)
                        
                        savedNukeFlashBody = {}
                    end
                end
            end
        end
    end
})

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local ChangeCharacterBody = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("ChangeCharacterBody")
local ResetAppearance = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("ResetCharacterAppearance")

local LoopAnim = false
local CurrentTrack
local Initialized = false

local function ApplyFreshBang()
	pcall(function()
		local args = {
			[1] = {
				96655874457685,
				123402086843885,
				78300682916056,
				86276701020724,
				78409653958165,
				120668655481073
			}
		}
		ChangeCharacterBody:InvokeServer(unpack(args))
	end)
end

local function PlayAnimation()
	local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
	local humanoid = char:WaitForChild("Humanoid")
	local animator = humanoid:FindFirstChildOfClass("Animator") or Instance.new("Animator", humanoid)

	local anim = Instance.new("Animation")
	anim.AnimationId = "rbxassetid://70883871260184"

	local track = animator:LoadAnimation(anim)
	track.Priority = Enum.AnimationPriority.Action
	track.Looped = false
	track:Play()

	CurrentTrack = track
end

local function StopEverything()
	LoopAnim = false

	if CurrentTrack then
		pcall(function()
			CurrentTrack:Stop()
		end)
		CurrentTrack = nil
	end

	pcall(function()
		ResetAppearance:FireServer()
	end)

	task.wait(0.5)

	local char = LocalPlayer.Character
	if char then
		local hum = char:FindFirstChildOfClass("Humanoid")
		if hum then
			hum.Health = 0
		end
	end
end

TrollTab:AddToggle({
	Name = "V3",
	Default = false,
	Callback = function(Value)
		if not Initialized then
			Initialized = true
			return
		end

		if Value then
			if LoopAnim then return end
			LoopAnim = true

			task.spawn(function()
				while LoopAnim do
					PlayAnimation()
					task.wait(0.1)
				end
			end)

			task.delay(1.2, ApplyFreshBang)
		else
			StopEverything()
		end
	end
})

TrollTab:AddSection({ "القارب العسكري" })

local MilitarySelected = nil

local MilitaryDropdown = TrollTab:AddDropdown({
    Name = "اختيار اللاعب",
    Default = "",
    Multi = false,
    Options = GetPlayerNames(),
    Callback = function(name)
        MilitarySelected = Players:FindFirstChild(name)
    end
})

TrollTab:AddButton({
    Name = "تحديث قائمة اللاعبين",
    Callback = function()
        MilitaryDropdown:Set(GetPlayerNames())
    end
})

TrollTab:AddButton({
    Name = "V1 - فلنق",
    Callback = function()
        if not MilitarySelected then return end
        
        local Player = game.Players.LocalPlayer
        local Character = Player.Character
        local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
        local RootPart = Character and Character:FindFirstChild("HumanoidRootPart")
        local Vehicles = workspace:FindFirstChild("Vehicles")
        if not Humanoid or not RootPart then return end

        local function spawnBoat()
            RootPart.CFrame = CFrame.new(1754, -2, 58)
            task.wait(0.5)
            game:GetService("ReplicatedStorage").RE:FindFirstChild("1Ca1r"):FireServer("PickingBoat", "MilitaryBoatFree")
            task.wait(1)
            return Vehicles and Vehicles:FindFirstChild(Player.Name.."Car")
        end

        local PCar = Vehicles and Vehicles:FindFirstChild(Player.Name.."Car") or spawnBoat()
        if not PCar then return end

        local Seat = PCar:FindFirstChild("Body") and PCar.Body:FindFirstChild("VehicleSeat")
        if not Seat then return end

        repeat 
            task.wait(0.1)
            RootPart.CFrame = Seat.CFrame * CFrame.new(0, math.random(-1, 1), 0)
        until Humanoid.Sit

        local SpinGyro = Instance.new("BodyGyro")
        SpinGyro.Parent = PCar.PrimaryPart
        SpinGyro.MaxTorque = Vector3.new(1e7, 1e7, 1e7)
        SpinGyro.P = 1e7
        SpinGyro.CFrame = PCar.PrimaryPart.CFrame * CFrame.Angles(0, math.rad(90), 0)

        workspace.Gravity = 0.1

        local TargetPlayer = MilitarySelected
        if not TargetPlayer or not TargetPlayer.Character then return end
        local TargetC = TargetPlayer.Character
        local TargetH = TargetC:FindFirstChildOfClass("Humanoid")
        local TargetRP = TargetC:FindFirstChild("HumanoidRootPart")
        if not TargetRP or not TargetH then return end

        local StartTime = tick()
        local function flingTarget()
            local vel = TargetRP.Velocity.Magnitude
            local dir = TargetH.MoveDirection
            local function kill(alvo, pos)
                if PCar and PCar.PrimaryPart then
                    PCar:SetPrimaryPartCFrame(CFrame.new(alvo.Position) * pos)
                end
            end
            kill(TargetRP, CFrame.new(0, 3, 0) + dir * vel / 1.05)
            kill(TargetRP, CFrame.new(0, -2.25, 5) + dir * vel / 1.05)
            kill(TargetRP, CFrame.new(0, 2.25, 0.25) + dir * vel / 1.10)
            kill(TargetRP, CFrame.new(-2.25, -1.5, 2.25) + dir * vel / 1.10)
            kill(TargetRP, CFrame.new(0, 1.5, 0) + dir * vel / 1.05)
            kill(TargetRP, CFrame.new(0, -1.5, 0) + dir * vel / 1.05)
        end

        while TargetH.Health > 0 and not TargetH.Sit and (tick() - StartTime) < 10 do
            task.wait(0.1)
            flingTarget()
        end

        PCar:SetPrimaryPartCFrame(CFrame.new(0, -500, 0))
        task.wait(0.2)
        Humanoid.Sit = false
        task.wait(0.3)
        workspace.Gravity = 196.2
        SpinGyro:Destroy()
    end
})

TrollTab:AddButton({
    Name = "V2 - فلنق",
    Callback = function()
        if not MilitarySelected then return end
        
        local Player = game.Players.LocalPlayer
        local Character = Player.Character
        local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
        local RootPart = Character and Character:FindFirstChild("HumanoidRootPart")
        local Vehicles = workspace:FindFirstChild("Vehicles")
        if not Humanoid or not RootPart then return end

        local function spawnBoat()
            RootPart.CFrame = CFrame.new(1754, -2, 58)
            task.wait(0.5)
            game:GetService("ReplicatedStorage").RE:FindFirstChild("1Ca1r"):FireServer("PickingBoat", "MilitaryBoatFree")
            task.wait(1)
            return Vehicles and Vehicles:FindFirstChild(Player.Name.."Car")
        end

        local PCar = Vehicles and Vehicles:FindFirstChild(Player.Name.."Car") or spawnBoat()
        if not PCar then return end

        local Seat = PCar:FindFirstChild("Body") and PCar.Body:FindFirstChild("VehicleSeat")
        if not Seat then return end

        repeat 
            task.wait(0.1)
            RootPart.CFrame = Seat.CFrame * CFrame.new(0, 1, 0)
        until Humanoid.SeatPart == Seat

        local TargetPlayer = MilitarySelected
        if not TargetPlayer or not TargetPlayer.Character then return end
        local TargetC = TargetPlayer.Character
        local TargetH = TargetC:FindFirstChildOfClass("Humanoid")
        local TargetRP = TargetC:FindFirstChild("HumanoidRootPart")
        if not TargetRP or not TargetH then return end

        local Spin = Instance.new("BodyAngularVelocity")
        Spin.Name = "Spinning"
        Spin.Parent = PCar.PrimaryPart
        Spin.MaxTorque = Vector3.new(0, math.huge, 0)
        Spin.AngularVelocity = Vector3.new(0, 369, 0)

        workspace.Gravity = 0.1

        local StartTime = tick()
        local function moveCar(TargetRP, offset)
            if PCar and PCar.PrimaryPart then
                PCar:SetPrimaryPartCFrame(CFrame.new(TargetRP.Position + offset))
            end
        end

        while TargetH.Health > 0 and not TargetH.Sit and (tick() - StartTime) < 10 do
            task.wait(0.01)
            local front = TargetRP.CFrame.LookVector * 2
            moveCar(TargetRP, front + Vector3.new(0, 1.5, 0))
            if TargetRP.Position.Y > 7000 then
                if Spin and Spin.Parent then Spin:Destroy() end
                PCar:Destroy()
                break
            end
            if PCar and PCar.PrimaryPart then
                local Rotation = CFrame.Angles(
                    math.rad(math.random(-369, 369)),
                    math.rad(math.random(-369, 369)),
                    math.rad(math.random(-369, 369))
                )
                PCar:SetPrimaryPartCFrame(CFrame.new(TargetRP.Position + front + Vector3.new(0,1.5,0)) * Rotation)
            end
        end

        task.wait(0.5)
        PCar:SetPrimaryPartCFrame(CFrame.new(0, -500, 0))
        task.wait(0.2)
        Humanoid.Sit = false
        task.wait(0.3)
        workspace.Gravity = 196.2
        if Spin and Spin.Parent then Spin:Destroy() end
    end
})

TrollTab:AddSection({ "الكل القارب العسكري" })

TrollTab:AddButton({
    Name = "فلنق الكل القارب العسكري",
    Callback = function()
        local Player = game.Players.LocalPlayer
        local Character = Player.Character
        local Humanoid = Character:FindFirstChildOfClass("Humanoid")
        local RootPart = Character:FindFirstChild("HumanoidRootPart")
        local Vehicles = game.Workspace:FindFirstChild("Vehicles")
        local OldPos = RootPart.CFrame
        local Angles = 0
        local PCar = Vehicles:FindFirstChild(Player.Name.."Car")
        
        if not PCar then  
            if RootPart then  
                RootPart.CFrame = CFrame.new(1754, -2, 58)  
                task.wait(0.5)  
                game:GetService("ReplicatedStorage").RE:FindFirstChild("1Ca1r"):FireServer("PickingBoat", "MilitaryBoatFree")  
                task.wait(0.5)  
                PCar = Vehicles:FindFirstChild(Player.Name.."Car")  
                task.wait(0.5)  
                local Seat = PCar:FindFirstChild("Body") and PCar.Body:FindFirstChild("VehicleSeat")  
                if Seat then  
                    repeat  
                        task.wait()  
                        RootPart.CFrame = Seat.CFrame * CFrame.new(0, math.random(-1, 1), 0)  
                    until Humanoid.Sit  
                end  
            end  
        end  

        task.wait(0.5)  
        PCar = Vehicles:FindFirstChild(Player.Name.."Car")  

        if PCar then  
            if not Humanoid.Sit then  
                local Seat = PCar:FindFirstChild("Body") and PCar.Body:FindFirstChild("VehicleSeat")  
                if Seat then  
                    repeat  
                        task.wait()  
                        RootPart.CFrame = Seat.CFrame * CFrame.new(0, math.random(-1, 1), 0)  
                    until Humanoid.Sit  
                end  
            end  
        end  

        local SpinGyro = Instance.new("BodyGyro")  
        SpinGyro.Parent = PCar.PrimaryPart  
        SpinGyro.MaxTorque = Vector3.new(1e7, 1e7, 1e7)  
        SpinGyro.P = 1e7  
        SpinGyro.CFrame = PCar.PrimaryPart.CFrame * CFrame.Angles(0, math.rad(90), 0)  

        local function flingPlayer(TargetC, TargetRP, TargetH)
            Angles = 0  
            local endTime = tick() + 1  
            while tick() < endTime do  
                Angles = Angles + 100  
                task.wait()  

                local kill = function(target, pos, angle)  
                    PCar:SetPrimaryPartCFrame(CFrame.new(target.Position) * pos * angle)  
                end  

                kill(TargetRP, CFrame.new(0, 3, 0), CFrame.Angles(math.rad(Angles), 0, 0))  
                kill(TargetRP, CFrame.new(0, -1.5, 2), CFrame.Angles(math.rad(Angles), 0, 0))  
                kill(TargetRP, CFrame.new(2, 1.5, 2.25), CFrame.Angles(math.rad(50), 0, 0))  
                kill(TargetRP, CFrame.new(-2.25, -1.5, 2.25), CFrame.Angles(math.rad(30), 0, 0))  
                kill(TargetRP, CFrame.new(0, 1.5, 0), CFrame.Angles(math.rad(Angles), 0, 0))  
                kill(TargetRP, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(Angles), 0, 0))  
            end  
        end  

        for _, Target in pairs(game.Players:GetPlayers()) do  
            if Target ~= Player then  
                local TargetC = Target.Character  
                local TargetH = TargetC and TargetC:FindFirstChildOfClass("Humanoid")  
                local TargetRP = TargetC and TargetC:FindFirstChild("HumanoidRootPart")  

                if TargetC and TargetH and TargetRP then  
                    flingPlayer(TargetC, TargetRP, TargetH)  
                end  
            end  
        end  

        task.wait(0.5)  
        PCar:SetPrimaryPartCFrame(CFrame.new(0, 0, 0))  
        task.wait(0.5)  
        Humanoid.Sit = false  
        task.wait(0.5)  
        RootPart.CFrame = OldPos  

        SpinGyro:Destroy()  
    end
})

local MilitaryRandom = nil

local function GetRandomMilitary()
    local Available = {}
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p ~= MilitaryRandom and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
            local Hum = p.Character:FindFirstChildOfClass("Humanoid")
            if Hum and Hum.Health > 0 then
                table.insert(Available, p)
            end
        end
    end
    if #Available == 0 then
        MilitaryRandom = nil
        return GetRandomMilitary()
    end
    local Chosen = Available[math.random(1, #Available)]
    MilitaryRandom = Chosen
    return Chosen
end

TrollTab:AddSection({ "عشوائي القارب العسكري" })

TrollTab:AddButton({
    Name = "V1 - فلنق عشوائي القارب العسكري",
    Callback = function()
        local RandomTarget = GetRandomMilitary()
        if not RandomTarget then return end
        
        local Player = game.Players.LocalPlayer
        local Character = Player.Character
        local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
        local RootPart = Character and Character:FindFirstChild("HumanoidRootPart")
        local Vehicles = workspace:FindFirstChild("Vehicles")
        if not Humanoid or not RootPart then return end

        local function spawnBoat()
            RootPart.CFrame = CFrame.new(1754, -2, 58)
            task.wait(0.5)
            game:GetService("ReplicatedStorage").RE:FindFirstChild("1Ca1r"):FireServer("PickingBoat", "MilitaryBoatFree")
            task.wait(1)
            return Vehicles and Vehicles:FindFirstChild(Player.Name.."Car")
        end

        local PCar = Vehicles and Vehicles:FindFirstChild(Player.Name.."Car") or spawnBoat()
        if not PCar then return end

        local Seat = PCar:FindFirstChild("Body") and PCar.Body:FindFirstChild("VehicleSeat")
        if not Seat then return end

        repeat 
            task.wait(0.1)
            RootPart.CFrame = Seat.CFrame * CFrame.new(0, math.random(-1, 1), 0)
        until Humanoid.Sit

        local SpinGyro = Instance.new("BodyGyro")
        SpinGyro.Parent = PCar.PrimaryPart
        SpinGyro.MaxTorque = Vector3.new(1e7, 1e7, 1e7)
        SpinGyro.P = 1e7
        SpinGyro.CFrame = PCar.PrimaryPart.CFrame * CFrame.Angles(0, math.rad(90), 0)

        workspace.Gravity = 0.1

        local TargetPlayer = RandomTarget
        if not TargetPlayer or not TargetPlayer.Character then return end
        local TargetC = TargetPlayer.Character
        local TargetH = TargetC:FindFirstChildOfClass("Humanoid")
        local TargetRP = TargetC:FindFirstChild("HumanoidRootPart")
        if not TargetRP or not TargetH then return end

        local StartTime = tick()
        local function flingTarget()
            local vel = TargetRP.Velocity.Magnitude
            local dir = TargetH.MoveDirection
            local function kill(alvo, pos)
                if PCar and PCar.PrimaryPart then
                    PCar:SetPrimaryPartCFrame(CFrame.new(alvo.Position) * pos)
                end
            end
            kill(TargetRP, CFrame.new(0, 3, 0) + dir * vel / 1.05)
            kill(TargetRP, CFrame.new(0, -2.25, 5) + dir * vel / 1.05)
            kill(TargetRP, CFrame.new(0, 2.25, 0.25) + dir * vel / 1.10)
            kill(TargetRP, CFrame.new(-2.25, -1.5, 2.25) + dir * vel / 1.10)
            kill(TargetRP, CFrame.new(0, 1.5, 0) + dir * vel / 1.05)
            kill(TargetRP, CFrame.new(0, -1.5, 0) + dir * vel / 1.05)
        end

        while TargetH.Health > 0 and not TargetH.Sit and (tick() - StartTime) < 10 do
            task.wait(0.1)
            flingTarget()
        end

        PCar:SetPrimaryPartCFrame(CFrame.new(0, -500, 0))
        task.wait(0.2)
        Humanoid.Sit = false
        task.wait(0.3)
        workspace.Gravity = 196.2
        SpinGyro:Destroy()
    end
})

TrollTab:AddButton({
    Name = "V2 - فلنق عشوائي القارب العسكري",
    Callback = function()
        local RandomTarget = GetRandomMilitary()
        if not RandomTarget then return end
        
        local Player = game.Players.LocalPlayer
        local Character = Player.Character
        local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
        local RootPart = Character and Character:FindFirstChild("HumanoidRootPart")
        local Vehicles = workspace:FindFirstChild("Vehicles")
        if not Humanoid or not RootPart then return end

        local function spawnBoat()
            RootPart.CFrame = CFrame.new(1754, -2, 58)
            task.wait(0.5)
            game:GetService("ReplicatedStorage").RE:FindFirstChild("1Ca1r"):FireServer("PickingBoat", "MilitaryBoatFree")
            task.wait(1)
            return Vehicles and Vehicles:FindFirstChild(Player.Name.."Car")
        end

        local PCar = Vehicles and Vehicles:FindFirstChild(Player.Name.."Car") or spawnBoat()
        if not PCar then return end

        local Seat = PCar:FindFirstChild("Body") and PCar.Body:FindFirstChild("VehicleSeat")
        if not Seat then return end

        repeat 
            task.wait(0.1)
            RootPart.CFrame = Seat.CFrame * CFrame.new(0, 1, 0)
        until Humanoid.SeatPart == Seat

        local TargetPlayer = RandomTarget
        if not TargetPlayer or not TargetPlayer.Character then return end
        local TargetC = TargetPlayer.Character
        local TargetH = TargetC:FindFirstChildOfClass("Humanoid")
        local TargetRP = TargetC:FindFirstChild("HumanoidRootPart")
        if not TargetRP or not TargetH then return end

        local Spin = Instance.new("BodyAngularVelocity")
        Spin.Name = "Spinning"
        Spin.Parent = PCar.PrimaryPart
        Spin.MaxTorque = Vector3.new(0, math.huge, 0)
        Spin.AngularVelocity = Vector3.new(0, 369, 0)

        workspace.Gravity = 0.1

        local StartTime = tick()
        local function moveCar(TargetRP, offset)
            if PCar and PCar.PrimaryPart then
                PCar:SetPrimaryPartCFrame(CFrame.new(TargetRP.Position + offset))
            end
        end

        while TargetH.Health > 0 and not TargetH.Sit and (tick() - StartTime) < 10 do
            task.wait(0.01)
            local front = TargetRP.CFrame.LookVector * 2
            moveCar(TargetRP, front + Vector3.new(0, 1.5, 0))
            if TargetRP.Position.Y > 7000 then
                if Spin and Spin.Parent then Spin:Destroy() end
                PCar:Destroy()
                break
            end
            if PCar and PCar.PrimaryPart then
                local Rotation = CFrame.Angles(
                    math.rad(math.random(-369, 369)),
                    math.rad(math.random(-369, 369)),
                    math.rad(math.random(-369, 369))
                )
                PCar:SetPrimaryPartCFrame(CFrame.new(TargetRP.Position + front + Vector3.new(0,1.5,0)) * Rotation)
            end
        end

        task.wait(0.5)
        PCar:SetPrimaryPartCFrame(CFrame.new(0, -500, 0))
        task.wait(0.2)
        Humanoid.Sit = false
        task.wait(0.3)
        workspace.Gravity = 196.2
        if Spin and Spin.Parent then Spin:Destroy() end
    end
})

TrollTab:AddSection({ "قارب القرصان" })

local PirateSelected = nil

local PirateDropdown = TrollTab:AddDropdown({
    Name = "اختيار اللاعب",
    Default = "",
    Multi = false,
    Options = GetPlayerNames(),
    Callback = function(name)
        PirateSelected = Players:FindFirstChild(name)
    end
})

TrollTab:AddButton({
    Name = "تحديث قائمة اللاعبين",
    Callback = function()
        PirateDropdown:Set(GetPlayerNames())
    end
})

TrollTab:AddButton({
    Name = "فلنق قارب القرصان",
    Callback = function()
        local RS = game:GetService("ReplicatedStorage")
        local RunService = game:GetService("RunService")
        local Players = game:GetService("Players")
        local Player = Players.LocalPlayer
        local Character = Player.Character or Player.CharacterAdded:Wait()
        local Humanoid = Character:WaitForChild("Humanoid")
        local RootPart = Character:WaitForChild("HumanoidRootPart")
        local Vehicles = workspace:WaitForChild("Vehicles")

        if not PirateSelected then return end
        local target = PirateSelected
        if not target or not target.Character then return end

        local selectedAudioID = 000000
        task.spawn(function()
            local args = {workspace, selectedAudioID, 1}
            for i = 1, 5 do
                RS.RE:FindFirstChild("1Gu1nSound1s"):FireServer(unpack(args))
                local s = Instance.new("Sound")
                s.SoundId = "rbxassetid://" .. selectedAudioID
                s.Parent = RootPart
                s:Play()
                task.wait(1.5)
                s:Destroy()
            end
        end)

        RootPart.CFrame = CFrame.new(1754, -2, 58)
        task.wait(0.5)
        RS.RE:FindFirstChild("1Ca1r"):FireServer("PickingBoat", "PirateFree")
        task.wait(1)

        local PCar = Vehicles:FindFirstChild(Player.Name.."Car")
        if not PCar or not PCar.PrimaryPart then return end

        local Seat = PCar.Body.VehicleSeat
        repeat
            task.wait()
            RootPart.CFrame = Seat.CFrame * CFrame.new(0, 1, 0)
        until Humanoid.SeatPart == Seat

        local alvoChar = target.Character
        local alvoRoot = alvoChar:WaitForChild("HumanoidRootPart")
        local alvoHum = alvoChar:WaitForChild("Humanoid")

        local force = Instance.new("BodyForce", PCar.PrimaryPart)
        local angular = Instance.new("BodyAngularVelocity", PCar.PrimaryPart)
        angular.MaxTorque = Vector3.new(1e9, 1e9, 1e9)
        angular.AngularVelocity = Vector3.new(4000, 8000, 4000)
        angular.P = 1e9

        local dist = 8
        local dirSwitch = 1

        RunService.Heartbeat:Connect(function()
            if not (PCar and PCar.PrimaryPart and alvoHum.Health > 0) then return end
            local offset = alvoRoot.CFrame.LookVector * dist * dirSwitch
            local pos = alvoRoot.Position + offset
            PCar:SetPrimaryPartCFrame(CFrame.new(pos, alvoRoot.Position))
            dirSwitch = -dirSwitch
            local dir = (alvoRoot.Position - PCar.PrimaryPart.Position).Unit
            force.Force = dir * 1e6 + Vector3.new(0, workspace.Gravity * PCar.PrimaryPart:GetMass(), 0)
        end)
    end
})

TrollTab:AddSection({ "الكل قارب القرصان" })

TrollTab:AddButton({
    Name = "فلنق الكل قارب القرصان",
    Callback = function()
        local RS = game:GetService("ReplicatedStorage")
        local RunService = game:GetService("RunService")
        local Players = game:GetService("Players")
        local Player = Players.LocalPlayer
        local Character = Player.Character or Player.CharacterAdded:Wait()
        local Humanoid = Character:WaitForChild("Humanoid")
        local RootPart = Character:WaitForChild("HumanoidRootPart")
        local Vehicles = workspace:WaitForChild("Vehicles")

        RootPart.CFrame = CFrame.new(1754, -2, 58)
        task.wait(0.5)
        RS.RE:FindFirstChild("1Ca1r"):FireServer("PickingBoat", "PirateFree")
        task.wait(1)

        local PCar = Vehicles:FindFirstChild(Player.Name.."Car")
        if not PCar or not PCar.PrimaryPart then return end

        local Seat = PCar.Body.VehicleSeat
        repeat
            task.wait()
            RootPart.CFrame = Seat.CFrame * CFrame.new(0, 1, 0)
        until Humanoid.SeatPart == Seat

        local force = Instance.new("BodyForce", PCar.PrimaryPart)
        local angular = Instance.new("BodyAngularVelocity", PCar.PrimaryPart)
        angular.MaxTorque = Vector3.new(1e9, 1e9, 1e9)
        angular.AngularVelocity = Vector3.new(4000, 8000, 4000)
        angular.P = 1e9

        local dist = 8
        local dirSwitch = 1
        local playersList = {}
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= Player and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                table.insert(playersList, p)
            end
        end
        if #playersList == 0 then return end

        local currentIndex = 1
        local target = playersList[currentIndex]
        local lastSwitch = tick()

        RunService.Heartbeat:Connect(function()
            if not (PCar and PCar.PrimaryPart and Humanoid and Humanoid.SeatPart) then return end
            if not target or not target.Character or not target.Character:FindFirstChild("HumanoidRootPart") then return end

            local alvoRoot = target.Character.HumanoidRootPart
            local offset = alvoRoot.CFrame.LookVector * dist * dirSwitch
            local pos = alvoRoot.Position + offset
            PCar:SetPrimaryPartCFrame(CFrame.new(pos, alvoRoot.Position))
            dirSwitch = -dirSwitch
            local dir = (alvoRoot.Position - PCar.PrimaryPart.Position).Unit
            force.Force = dir * 1e6 + Vector3.new(0, workspace.Gravity * PCar.PrimaryPart:GetMass(), 0)

            if tick() - lastSwitch > 3 then
                currentIndex = currentIndex + 1
                if currentIndex > #playersList then currentIndex = 1 end
                target = playersList[currentIndex]
                lastSwitch = tick()
            end
        end)
    end
})

local PirateRandom = nil

local function GetRandomPirate()
    local Available = {}
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p ~= PirateRandom and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
            local Hum = p.Character:FindFirstChildOfClass("Humanoid")
            if Hum and Hum.Health > 0 then
                table.insert(Available, p)
            end
        end
    end
    if #Available == 0 then
        PirateRandom = nil
        return GetRandomPirate()
    end
    local Chosen = Available[math.random(1, #Available)]
    PirateRandom = Chosen
    return Chosen
end

TrollTab:AddSection({ "عشوائي قارب القرصان" })

TrollTab:AddButton({
    Name = "فلنق عشوائي قارب القرصان",
    Callback = function()
        local RS = game:GetService("ReplicatedStorage")
        local RunService = game:GetService("RunService")
        local Players = game:GetService("Players")
        local Player = Players.LocalPlayer
        local Character = Player.Character or Player.CharacterAdded:Wait()
        local Humanoid = Character:WaitForChild("Humanoid")
        local RootPart = Character:WaitForChild("HumanoidRootPart")
        local Vehicles = workspace:WaitForChild("Vehicles")

        local RandomTarget = GetRandomPirate()
        if not RandomTarget then return end

        local target = RandomTarget
        if not target or not target.Character then return end

        local selectedAudioID = 000000
        task.spawn(function()
            local args = {workspace, selectedAudioID, 1}
            for i = 1, 5 do
                RS.RE:FindFirstChild("1Gu1nSound1s"):FireServer(unpack(args))
                local s = Instance.new("Sound")
                s.SoundId = "rbxassetid://" .. selectedAudioID
                s.Parent = RootPart
                s:Play()
                task.wait(1.5)
                s:Destroy()
            end
        end)

        RootPart.CFrame = CFrame.new(1754, -2, 58)
        task.wait(0.5)
        RS.RE:FindFirstChild("1Ca1r"):FireServer("PickingBoat", "PirateFree")
        task.wait(1)

        local PCar = Vehicles:FindFirstChild(Player.Name.."Car")
        if not PCar or not PCar.PrimaryPart then return end

        local Seat = PCar.Body.VehicleSeat
        repeat
            task.wait()
            RootPart.CFrame = Seat.CFrame * CFrame.new(0, 1, 0)
        until Humanoid.SeatPart == Seat

        local alvoChar = target.Character
        local alvoRoot = alvoChar:WaitForChild("HumanoidRootPart")
        local alvoHum = alvoChar:WaitForChild("Humanoid")

        local force = Instance.new("BodyForce", PCar.PrimaryPart)
        local angular = Instance.new("BodyAngularVelocity", PCar.PrimaryPart)
        angular.MaxTorque = Vector3.new(1e9, 1e9, 1e9)
        angular.AngularVelocity = Vector3.new(4000, 8000, 4000)
        angular.P = 1e9

        local dist = 8
        local dirSwitch = 1

        RunService.Heartbeat:Connect(function()
            if not (PCar and PCar.PrimaryPart and alvoHum.Health > 0) then return end
            local offset = alvoRoot.CFrame.LookVector * dist * dirSwitch
            local pos = alvoRoot.Position + offset
            PCar:SetPrimaryPartCFrame(CFrame.new(pos, alvoRoot.Position))
            dirSwitch = -dirSwitch
            local dir = (alvoRoot.Position - PCar.PrimaryPart.Position).Unit
            force.Force = dir * 1e6 + Vector3.new(0, workspace.Gravity * PCar.PrimaryPart:GetMass(), 0)
        end)
    end
})
