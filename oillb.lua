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

local PlayerTab = Window:MakeTab({
    Title = "اللاعب",
    Icon = "rbxassetid://17132521951"
})
PlayerTab:AddSection({ Name = "التحكم" })

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")

local LocalPlayer = Players.LocalPlayer
local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local hum = char:WaitForChild("Humanoid")
local cam = Workspace.CurrentCamera

LocalPlayer.CharacterAdded:Connect(function(c)
    char = c
    hum = c:WaitForChild("Humanoid")
end)

PlayerTab:AddSlider({
    Name = "السرعة",
    Min = 16,
    Max = 500,
    Default = hum.WalkSpeed,
    Callback = function(v) 
        hum.WalkSpeed = v
    end
})

PlayerTab:AddButton({
    Name = "استرجاع السرعة",
    Callback = function()
        hum.WalkSpeed = 16
    end
})

PlayerTab:AddSlider({
    Name = "القفز",
    Min = 50,
    Max = 500,
    Default = hum.JumpPower,
    Callback = function(v) 
        hum.JumpPower = v
    end
})

PlayerTab:AddButton({
    Name = "استرجاع القفز",
    Callback = function()
        hum.JumpPower = 50
    end
})

PlayerTab:AddSlider({
    Name = "الجاذبية",
    Min = 10,
    Max = 500,
    Default = Workspace.Gravity,
    Callback = function(v) 
        Workspace.Gravity = v
    end
})

PlayerTab:AddButton({
    Name = "استرجاع الجاذبية",
    Callback = function()
        Workspace.Gravity = 196.2
    end
})

PlayerTab:AddSlider({
    Name = "FOV",
    Min = 1,
    Max = 180,
    Default = cam.FieldOfView,
    Callback = function(v) 
        cam.FieldOfView = v
    end
})

PlayerTab:AddButton({
    Name = "استرجاع FOV",
    Callback = function()
        cam.FieldOfView = 70
    end
})

PlayerTab:AddButton({
    Name = "استعادة الكل",
    Callback = function()
        hum.WalkSpeed = 16
        hum.JumpPower = 50
        Workspace.Gravity = 196.2
        cam.FieldOfView = 70
    end
})

PlayerTab:AddSection({ "التحكم" })

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local SelectedPlayer = nil
local loopTP = false

local function GetPlayerNames()
    local t = {}
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer then
            table.insert(t, p.Name)
        end
    end
    return t
end

local PlayerDropdown = PlayerTab:AddDropdown({
    Name = "اختيار اللاعب",
    Default = "",
    Multi = false,
    Options = GetPlayerNames(),
    Callback = function(name)
        SelectedPlayer = Players:FindFirstChild(name)
    end
})

PlayerTab:AddButton({
    Name = "تحديث قائمة اللاعبين",
    Callback = function()
        PlayerDropdown:Set(GetPlayerNames())
    end
})

PlayerTab:AddToggle({
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

PlayerTab:AddToggle({
    Name = "تتبع اللاعب",
    Default = false,
    Callback = function(state)
        if not SelectedPlayer then return end
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

PlayerTab:AddButton({
    Name = "تلبورت للاعب",
    Callback = function()
        if not SelectedPlayer then return end
        if SelectedPlayer.Character and SelectedPlayer.Character:FindFirstChild("HumanoidRootPart") then
            LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = SelectedPlayer.Character.HumanoidRootPart.CFrame
        end
    end
})

local NameTab = Window:MakeTab({
    Title = "الأسماء",
    Icon = "rbxassetid://127476568939667"
})

NameTab:AddSection({ Name = "الاسم" })

NameTab:AddTextBox({
    Name = "اختيار الاسم",
    Default = "",
    PlaceholderText = "ضع الاسم",
    ClearText = true,
    Callback = function(value)
        if value ~= "" then
            local args = {[1] = "RolePlayName", [2] = value}
            game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1RPNam1eTex1t"):FireServer(unpack(args))
        end
    end
})

local nameColorActive = false
local nameColor1 = Color3.fromRGB(255, 0, 0)
local nameColor2 = Color3.fromRGB(0, 0, 255)
local rainbowMode = false

local colorNames = {
    "أحمر",
    "أزرق",
    "أخضر",
    "أصفر",
    "وردي",
    "بنفسجي",
    "برتقالي",
    "سماوي",
    "أبيض",
    "أسود"
}

local colorValues = {
    Color3.fromRGB(255, 0, 0),
    Color3.fromRGB(0, 0, 255),
    Color3.fromRGB(0, 255, 0),
    Color3.fromRGB(255, 255, 0),
    Color3.fromRGB(255, 105, 180),
    Color3.fromRGB(128, 0, 128),
    Color3.fromRGB(255, 165, 0),
    Color3.fromRGB(0, 255, 255),
    Color3.fromRGB(255, 255, 255),
    Color3.fromRGB(0, 0, 0)
}

NameTab:AddToggle({
    Name = "تلوين الاسم (جميع الألوان)",
    Default = false,
    Callback = function(value)
        rainbowMode = value
        if value then
            nameColorActive = true
        end
    end    
})

NameTab:AddToggle({
    Name = "تلوين الاسم (الألوان المختارة)",
    Default = false,
    Callback = function(value)
        nameColorActive = value
        if value then
            rainbowMode = false
        end
    end    
})

NameTab:AddDropdown({
    Name = "اللون الأول للاسم",
    Default = "أحمر",
    Options = colorNames,
    Callback = function(value)
        for i, v in pairs(colorNames) do
            if v == value then
                nameColor1 = colorValues[i]
                break
            end
        end
    end
})

NameTab:AddDropdown({
    Name = "اللون الثاني للاسم",
    Default = "أزرق",
    Options = colorNames,
    Callback = function(value)
        for i, v in pairs(colorNames) do
            if v == value then
                nameColor2 = colorValues[i]
                break
            end
        end
    end
})

NameTab:AddSection({ Name = "البايو" })

NameTab:AddTextBox({
    Name = "اختيار البايو",
    Default = "",
    PlaceholderText = "ضع البايو",
    ClearText = true,
    Callback = function(value)
        if value ~= "" then
            local args = {[1] = "RolePlayBio", [2] = value}
            game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1RPNam1eTex1t"):FireServer(unpack(args))
        end
    end
})

local bioColorActive = false
local bioColor1 = Color3.fromRGB(255, 0, 0)
local bioColor2 = Color3.fromRGB(0, 0, 255)
local bioRainbow = false

NameTab:AddToggle({
    Name = "تلوين البايو (جميع الألوان)",
    Default = false,
    Callback = function(value)
        bioRainbow = value
        if value then
            bioColorActive = true
        end
    end    
})

NameTab:AddToggle({
    Name = "تلوين البايو (الألوان المختارة)",
    Default = false,
    Callback = function(value)
        bioColorActive = value
        if value then
            bioRainbow = false
        end
    end    
})

NameTab:AddDropdown({
    Name = "اللون الأول للبايو",
    Default = "أحمر",
    Options = colorNames,
    Callback = function(value)
        for i, v in pairs(colorNames) do
            if v == value then
                bioColor1 = colorValues[i]
                break
            end
        end
    end
})

NameTab:AddDropdown({
    Name = "اللون الثاني للبايو",
    Default = "أزرق",
    Options = colorNames,
    Callback = function(value)
        for i, v in pairs(colorNames) do
            if v == value then
                bioColor2 = colorValues[i]
                break
            end
        end
    end
})

local function smoothTransition(current, target, step)
    return Color3.new(
        current.r + (target.r - current.r) * step,
        current.g + (target.g - current.g) * step,
        current.b + (target.b - current.b) * step
    )
end

local rainbowColors = {
    Color3.fromRGB(255, 0, 0),
    Color3.fromRGB(255, 165, 0),
    Color3.fromRGB(255, 255, 0),
    Color3.fromRGB(0, 255, 0),
    Color3.fromRGB(0, 255, 255),
    Color3.fromRGB(0, 0, 255),
    Color3.fromRGB(128, 0, 128)
}

spawn(function()
    local rainbowIndex = 1
    while true do
        if nameColorActive then
            if rainbowMode then
                local targetColor = rainbowColors[rainbowIndex % #rainbowColors + 1]
                local steps = 20
                for i = 1, steps do
                    local t = i / steps
                    local lerpColor = smoothTransition(rainbowColors[rainbowIndex], targetColor, t)
                    pcall(function()
                        game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1RPNam1eColo1r"):FireServer("PickingRPNameColor", lerpColor)
                    end)
                    wait(0.05)
                end
                rainbowIndex = rainbowIndex % #rainbowColors + 1
            else
                local steps = 30
                for i = 1, steps do
                    local t = i / steps
                    local lerpColor = smoothTransition(nameColor1, nameColor2, t)
                    pcall(function()
                        game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1RPNam1eColo1r"):FireServer("PickingRPNameColor", lerpColor)
                    end)
                    wait(0.05)
                end
                for i = 1, steps do
                    local t = i / steps
                    local lerpColor = smoothTransition(nameColor2, nameColor1, t)
                    pcall(function()
                        game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1RPNam1eColo1r"):FireServer("PickingRPNameColor", lerpColor)
                    end)
                    wait(0.05)
                end
            end
        else
            wait(0.1)
        end
    end
end)

spawn(function()
    local rainbowIndex = 1
    while true do
        if bioColorActive then
            if bioRainbow then
                local targetColor = rainbowColors[rainbowIndex % #rainbowColors + 1]
                local steps = 20
                for i = 1, steps do
                    local t = i / steps
                    local lerpColor = smoothTransition(rainbowColors[rainbowIndex], targetColor, t)
                    pcall(function()
                        game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1RPNam1eColo1r"):FireServer("PickingRPBioColor", lerpColor)
                    end)
                    wait(0.05)
                end
                rainbowIndex = rainbowIndex % #rainbowColors + 1
            else
                local steps = 30
                for i = 1, steps do
                    local t = i / steps
                    local lerpColor = smoothTransition(bioColor1, bioColor2, t)
                    pcall(function()
                        game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1RPNam1eColo1r"):FireServer("PickingRPBioColor", lerpColor)
                    end)
                    wait(0.05)
                end
                for i = 1, steps do
                    local t = i / steps
                    local lerpColor = smoothTransition(bioColor2, bioColor1, t)
                    pcall(function()
                        game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1RPNam1eColo1r"):FireServer("PickingRPBioColor", lerpColor)
                    end)
                    wait(0.05)
                end
            end
        else
            wait(0.1)
        end
    end
end)

local ShaderTab = Window:MakeTab({
    Title = "شادرات",
    Icon = "rbxassetid://10747382750"
})

local Lighting = game:GetService("Lighting")

local defaultLighting = {
    Ambient = Lighting.Ambient,
    OutdoorAmbient = Lighting.OutdoorAmbient,
    FogStart = Lighting.FogStart,
    FogEnd = Lighting.FogEnd,
    FogColor = Lighting.FogColor
}

local shaderList = {
    "شادر نيون وبرق أسطوري",
    "شادر RTX ونيون قوي",
    "شادر مخيف ودماء ف الماب",
    "جو شتاء اسطوري",
    "شادر غروب الشمس وضباب",
    "شادر غابة سحرية مع أشعة شمس",
    "شادر بحر هادئ وضبابي",
    "شادر فضائي مع توهج النجوم",
    "شادر نار مشتعلة وبخار",
    "شادر واقعي اسطوري",
    "شادر ضباب ليلي",
    "شادر غابة ضبابية",
    "شادر غروب صحراوي",
    "شادر جليدي متلألئ",
    "شادر غابة ليزرية سحرية"
}

local selectedShader = shaderList[1]
local currentEffects = {}
local shaderActive = false

ShaderTab:AddDropdown({
    Name = "اختر الشادر",
    Default = shaderList[1],
    Options = shaderList,
    Callback = function(value)
        selectedShader = value
    end
})

local function resetLighting()
    for _, effect in pairs(currentEffects) do
        if effect and effect.Parent then
            effect:Destroy()
        end
    end
    currentEffects = {}

    Lighting.Ambient = defaultLighting.Ambient
    Lighting.OutdoorAmbient = defaultLighting.OutdoorAmbient
    Lighting.FogStart = defaultLighting.FogStart
    Lighting.FogEnd = defaultLighting.FogEnd
    Lighting.FogColor = defaultLighting.FogColor
end

local function applyShader()
    if selectedShader == "شادر نيون وبرق أسطوري" then
        Lighting.Ambient = Color3.fromRGB(50,0,100)
        Lighting.OutdoorAmbient = Color3.fromRGB(30,0,80)
        Lighting.FogStart = 100
        Lighting.FogEnd = 500

    elseif selectedShader == "شادر RTX ونيون قوي" then
        local bloom = Instance.new("BloomEffect")
        bloom.Intensity = 2
        bloom.Size = 35
        bloom.Threshold = 0.5
        bloom.Parent = Lighting
        table.insert(currentEffects, bloom)

        Lighting.Ambient = Color3.fromRGB(80,0,150)
        Lighting.OutdoorAmbient = Color3.fromRGB(60,0,130)

    elseif selectedShader == "شادر مخيف ودماء ف الماب" then
        local colorCorrection = Instance.new("ColorCorrectionEffect")
        colorCorrection.Contrast = 0.3
        colorCorrection.Brightness = -0.2
        colorCorrection.TintColor = Color3.fromRGB(100, 20, 20)
        colorCorrection.Saturation = -0.5
        colorCorrection.Parent = Lighting
        table.insert(currentEffects, colorCorrection)

        local blur = Instance.new("BlurEffect")
        blur.Size = 8
        blur.Parent = Lighting
        table.insert(currentEffects, blur)

    elseif selectedShader == "جو شتاء اسطوري" then
        Lighting.Ambient = Color3.fromRGB(150,190,220)
        Lighting.OutdoorAmbient = Color3.fromRGB(120,170,210)
        Lighting.FogColor = Color3.fromRGB(180,210,230)
        Lighting.FogStart = 50
        Lighting.FogEnd = 300

    elseif selectedShader == "شادر غروب الشمس وضباب" then
        Lighting.Ambient = Color3.fromRGB(255,150,100)
        Lighting.OutdoorAmbient = Color3.fromRGB(255,120,80)
        Lighting.FogStart = 30
        Lighting.FogEnd = 200

    elseif selectedShader == "شادر غابة سحرية مع أشعة شمس" then
        Lighting.Ambient = Color3.fromRGB(80,200,120)
        Lighting.OutdoorAmbient = Color3.fromRGB(60,180,100)
        local sunrays = Instance.new("SunRaysEffect")
        sunrays.Intensity = 0.3
        sunrays.Spread = 0.6
        sunrays.Parent = Lighting
        table.insert(currentEffects, sunrays)

    elseif selectedShader == "شادر بحر هادئ وضبابي" then
        Lighting.Ambient = Color3.fromRGB(100,150,255)
        Lighting.OutdoorAmbient = Color3.fromRGB(80,130,255)
        Lighting.FogStart = 20
        Lighting.FogEnd = 150

    elseif selectedShader == "شادر فضائي مع توهج النجوم" then
        Lighting.Ambient = Color3.fromRGB(120,80,200)
        Lighting.OutdoorAmbient = Color3.fromRGB(100,60,180)
        local bloom = Instance.new("BloomEffect")
        bloom.Intensity = 1.5
        bloom.Size = 30
        bloom.Threshold = 0.7
        bloom.Parent = Lighting
        table.insert(currentEffects, bloom)

    elseif selectedShader == "شادر نار مشتعلة وبخار" then
        Lighting.Ambient = Color3.fromRGB(255,80,20)
        Lighting.OutdoorAmbient = Color3.fromRGB(255,60,0)
        local blur = Instance.new("BlurEffect")
        blur.Size = 5
        blur.Parent = Lighting
        table.insert(currentEffects, blur)

    elseif selectedShader == "شادر واقعي اسطوري" then
        Lighting.Ambient = Color3.fromRGB(180, 185, 200)
        Lighting.OutdoorAmbient = Color3.fromRGB(150, 160, 180)
        Lighting.FogStart = 200
        Lighting.FogEnd = 800
        Lighting.FogColor = Color3.fromRGB(190, 195, 210)
        
        local bloom = Instance.new("BloomEffect")
        bloom.Intensity = 0.5
        bloom.Size = 15
        bloom.Threshold = 0.9
        bloom.Parent = Lighting
        table.insert(currentEffects, bloom)
        
        local colorCorrection = Instance.new("ColorCorrectionEffect")
        colorCorrection.Contrast = 0.1
        colorCorrection.Brightness = 0.1
        colorCorrection.Saturation = 0.2
        colorCorrection.Parent = Lighting
        table.insert(currentEffects, colorCorrection)
        
        local sunrays = Instance.new("SunRaysEffect")
        sunrays.Intensity = 0.1
        sunrays.Spread = 0.8
        sunrays.Parent = Lighting
        table.insert(currentEffects, sunrays)

    elseif selectedShader == "شادر ضباب ليلي" then
        Lighting.Ambient = Color3.fromRGB(30,30,50)
        Lighting.OutdoorAmbient = Color3.fromRGB(20,20,40)
        Lighting.FogStart = 10
        Lighting.FogEnd = 100

    elseif selectedShader == "شادر غابة ضبابية" then
        Lighting.Ambient = Color3.fromRGB(40,80,40)
        Lighting.OutdoorAmbient = Color3.fromRGB(20,60,20)
        Lighting.FogStart = 20
        Lighting.FogEnd = 150

    elseif selectedShader == "شادر غروب صحراوي" then
        Lighting.Ambient = Color3.fromRGB(255,180,100)
        Lighting.OutdoorAmbient = Color3.fromRGB(255,150,80)
        local bloom = Instance.new("BloomEffect")
        bloom.Intensity = 1.2
        bloom.Size = 25
        bloom.Threshold = 0.7
        bloom.Parent = Lighting
        table.insert(currentEffects, bloom)

    elseif selectedShader == "شادر جليدي متلألئ" then
        Lighting.Ambient = Color3.fromRGB(180,220,255)
        Lighting.OutdoorAmbient = Color3.fromRGB(150,200,255)
        local bloom = Instance.new("BloomEffect")
        bloom.Intensity = 1
        bloom.Size = 20
        bloom.Threshold = 0.8
        bloom.Parent = Lighting
        table.insert(currentEffects, bloom)

    elseif selectedShader == "شادر غابة ليزرية سحرية" then
        Lighting.Ambient = Color3.fromRGB(100,200,150)
        Lighting.OutdoorAmbient = Color3.fromRGB(60,180,120)
        local bloom = Instance.new("BloomEffect")
        bloom.Intensity = 2
        bloom.Size = 30
        bloom.Threshold = 0.6
        bloom.Parent = Lighting
        table.insert(currentEffects, bloom)
    end
end

ShaderTab:AddToggle({
    Name = "تفعيل الشادر",
    Default = false,
    Callback = function(value)
        shaderActive = value
        if shaderActive then
            resetLighting()
            applyShader()
        else
            resetLighting()
        end
    end
})

local BangTab = Window:MakeTab({
    Title = "البانق",
    Icon = "rbxassetid://75014710749916"
})

BangTab:AddSection({ Name = "بانق الطفل" })

local Onyxen = {
    CurrentTarget = nil,
    SelectedGender = "BabyBoy",
    SelectedBangType = "الوجه",
    Players = {},
    FollowLoop = nil,
    CameraLoop = nil,
    BangActive = false,
    TargetPlayerObject = nil,
    IsFollowing = false
}

local GenderOptions = {
    {Display = "ولد", Value = "BabyBoy"},
    {Display = "بنت", Value = "BabyGirl"}
}

local BangOptions = {
    "الوجه",
    "الخلف"
}

local function RefreshPlayerList()
    Onyxen.Players = {}
    for _, Player in pairs(game.Players:GetPlayers()) do
        table.insert(Onyxen.Players, Player.Name)
    end
    return Onyxen.Players
end
RefreshPlayerList()

local function FindPlayerByPartialName(input)
    if not input or input == "" then
        return nil, nil
    end
    
    input = input:lower()
    local matches = {}
    
    for _, Player in pairs(game.Players:GetPlayers()) do
        local nameLower = Player.Name:lower()
        local displayLower = Player.DisplayName:lower()
        
        if nameLower:find(input, 1, true) or displayLower:find(input, 1, true) then
            table.insert(matches, Player)
        end
    end
    
    if #matches == 0 then
        return nil, nil
    elseif #matches == 1 then
        return matches[1].Name, matches[1]
    else
        local matchNames = {}
        for i, Player in ipairs(matches) do
            table.insert(matchNames, Player.Name)
        end
        return matches[1].Name, matches[1], matchNames
    end
end

local SearchBox = BangTab:AddTextBox({
    Name = "ابحث عن لاعب (اكتب اول حرفين او ثلاث)",
    Default = "",
    PlaceholderText = "مثلاً: ah او ahmed",
    ClearText = false,
    Callback = function(value)
        if value and value ~= "" then
            local foundName, foundPlayer, allMatches = FindPlayerByPartialName(value)
            
            if foundName and foundPlayer then
                Onyxen.CurrentTarget = foundName
                Onyxen.TargetPlayerObject = foundPlayer
                
                if allMatches and #allMatches > 1 then
                    local suggestions = table.concat(allMatches, ", ")
                    game:GetService("StarterGui"):SetCore("SendNotification", {
                        Title = "Onyxen Hub - لاعبين متطابقين",
                        Text = "تم العثور على: " .. suggestions,
                        Duration = 3
                    })
                else
                    game:GetService("StarterGui"):SetCore("SendNotification", {
                        Title = "Onyxen Hub",
                        Text = "تم تحديد اللاعب: " .. foundName,
                        Duration = 2
                    })
                end
            else
                Onyxen.CurrentTarget = nil
                Onyxen.TargetPlayerObject = nil
                game:GetService("StarterGui"):SetCore("SendNotification", {
                    Title = "Onyxen Hub",
                    Text = "لم يتم العثور على لاعب بـ: " .. value,
                    Duration = 2
                })
            end
        else
            Onyxen.CurrentTarget = nil
            Onyxen.TargetPlayerObject = nil
        end
    end
})

BangTab:AddButton({
    Name = "تحديث قائمة اللاعبين",
    Callback = function()
        RefreshPlayerList()
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Onyxen Hub",
            Text = "تم تحديث القائمة - " .. #game.Players:GetPlayers() .. " لاعب",
            Duration = 2
        })
    end
})

BangTab:AddDropdown({
    Name = "نوع الطفل",
    Options = (function()
        local Options = {}
        for _, Gender in ipairs(GenderOptions) do
            table.insert(Options, Gender.Display)
        end
        return Options
    end)(),
    Default = GenderOptions[1].Display,
    Callback = function(Selected)
        for _, Gender in ipairs(GenderOptions) do
            if Gender.Display == Selected then
                Onyxen.SelectedGender = Gender.Value
                break
            end
        end
    end
})

BangTab:AddButton({
    Name = "استدعاء الطفل",
    Callback = function()
        local Arguments = {
            [1] = "CharacterFollowSpawnPlayer",
            [2] = Onyxen.SelectedGender
        }
        local Success, Error = pcall(function()
            game:GetService("ReplicatedStorage").RE:FindFirstChild("1Bab1yFollo1w"):FireServer(unpack(Arguments))
        end)
        if not Success then
            warn("Onyxen Hub: " .. Error)
        end
    end
})

BangTab:AddButton({
    Name = "ارسال الطفل (يتبع اللاعب المستهدف)",
    Callback = function()
        if not Onyxen.CurrentTarget then
            warn("Onyxen Hub: لم يتم اختيار لاعب")
            return
        end

        local Target = Onyxen.CurrentTarget
        local LocalPlayer = game.Players.LocalPlayer

        if not workspace:FindFirstChild(LocalPlayer.Name) or not workspace[LocalPlayer.Name]:FindFirstChild("FollowCharacter") then
            warn("Onyxen Hub: الطفل غير موجود")
            return
        end

        if workspace:FindFirstChild(Target) and workspace[LocalPlayer.Name]:FindFirstChild("FollowCharacter") then
            workspace[LocalPlayer.Name].FollowCharacter.Parent = workspace[Target]

            if Onyxen.FollowLoop then
                Onyxen.FollowLoop:Disconnect()
            end

            Onyxen.FollowLoop = game:GetService("RunService").Heartbeat:Connect(function()
                local FollowChar = workspace[Target]:FindFirstChild("FollowCharacter")
                local TargetHRP = workspace[Target]:FindFirstChild("HumanoidRootPart")

                if FollowChar and TargetHRP then
                    FollowChar.Torso.BodyPosition.Position = TargetHRP.Position
                    FollowChar.Torso.BodyGyro.CFrame = TargetHRP.CFrame
                end
            end)
            Onyxen.IsFollowing = true
        end
    end
})

BangTab:AddSection({ Name = "نوع البانق للطفل" })

BangTab:AddDropdown({
    Name = "نوع البانق",
    Options = BangOptions,
    Default = BangOptions[1],
    Callback = function(Selected)
        Onyxen.SelectedBangType = Selected
    end
})

BangTab:AddToggle({
    Name = "تشغيل بانق الطفل",
    Default = false,
    Callback = function(Value)
        Onyxen.BangActive = Value
        
        if Value then
            if not Onyxen.CurrentTarget then
                warn("Onyxen Hub: لم يتم اختيار لاعب")
                Onyxen.BangActive = false
                return
            end

            local Target = Onyxen.CurrentTarget
            local LocalPlayer = game.Players.LocalPlayer

            if not workspace:FindFirstChild(LocalPlayer.Name) or not workspace[LocalPlayer.Name]:FindFirstChild("FollowCharacter") then
                warn("Onyxen Hub: الطفل غير موجود")
                Onyxen.BangActive = false
                return
            end

            if workspace:FindFirstChild(Target) and workspace[LocalPlayer.Name]:FindFirstChild("FollowCharacter") then
                local FollowChar = workspace[LocalPlayer.Name].FollowCharacter
                local TargetChar = workspace[Target]
                local TargetHRP = TargetChar:FindFirstChild("HumanoidRootPart")

                if not TargetHRP then
                    warn("Onyxen Hub: تعذر العثور على الهدف")
                    Onyxen.BangActive = false
                    return
                end

                if Onyxen.SelectedBangType == "الوجه" then
                    local TargetHead = TargetChar:FindFirstChild("Head")
                    local FacePosition
                    if TargetHead then
                        FacePosition = TargetHead.Position + TargetHead.CFrame.LookVector * 0.1 
                    else
                        FacePosition = TargetHRP.Position + TargetHRP.CFrame.LookVector * 0.1
                    end

                    FollowChar.Parent = workspace
                    FollowChar:MoveTo(FacePosition)

                    if Onyxen.FollowLoop then
                        Onyxen.FollowLoop:Disconnect()
                    end

                    Onyxen.FollowLoop = game:GetService("RunService").Heartbeat:Connect(function()
                        if not (TargetChar and TargetChar:FindFirstChild("HumanoidRootPart") and FollowChar and FollowChar:FindFirstChild("Torso")) then
                            Onyxen.FollowLoop:Disconnect()
                            Onyxen.BangActive = false
                            return
                        end

                        local CurrentHRP = TargetChar.HumanoidRootPart
                        local CurrentHead = TargetChar:FindFirstChild("Head")
                        local FollowTorso = FollowChar.Torso

                        local FacePos
                        if CurrentHead then
                            FacePos = CurrentHead.Position + CurrentHead.CFrame.LookVector * 0.1 
                        else
                            FacePos = CurrentHRP.Position + CurrentHRP.CFrame.LookVector * 0.1
                        end

                        local Position1 = FacePos + CurrentHRP.CFrame.LookVector * -0.2  
                        local Position2 = FacePos + CurrentHRP.CFrame.LookVector * 2.9   

                        local Time = tick() % 1
                        local Progress = math.abs(math.sin(Time * math.pi))
                        local NewPosition = Position1:Lerp(Position2, Progress)

                        FollowTorso.BodyPosition.Position = NewPosition
                        FollowTorso.BodyGyro.CFrame = CFrame.lookAt(FollowTorso.Position, FacePos)
                    end)
                else
                    local BehindPos = TargetHRP.Position - TargetHRP.CFrame.LookVector * 0.1 

                    FollowChar.Parent = workspace
                    FollowChar:MoveTo(BehindPos)
         
                    if Onyxen.FollowLoop then
                        Onyxen.FollowLoop:Disconnect()
                    end

                    Onyxen.FollowLoop = game:GetService("RunService").Heartbeat:Connect(function()
                        if not (TargetChar and TargetChar:FindFirstChild("HumanoidRootPart") and FollowChar and FollowChar:FindFirstChild("Torso")) then
                            Onyxen.FollowLoop:Disconnect()
                            Onyxen.BangActive = false
                            return
                        end

                        local CurrentHRP = TargetChar.HumanoidRootPart
                        local FollowTorso = FollowChar.Torso

                        local BehindPos = CurrentHRP.Position - CurrentHRP.CFrame.LookVector * 0.1 

                        local Position1 = BehindPos - CurrentHRP.CFrame.LookVector * 2.8   
                        local Position2 = BehindPos - CurrentHRP.CFrame.LookVector * -0.2  

                        local Time = tick() % 1
                        local Progress = math.abs(math.sin(Time * math.pi))
                        local NewPosition = Position1:Lerp(Position2, Progress)

                        FollowTorso.BodyPosition.Position = NewPosition
                        FollowTorso.BodyGyro.CFrame = CFrame.lookAt(FollowTorso.Position, CurrentHRP.Position)
                    end)
                end
                Onyxen.IsFollowing = true
            end
        else
            if Onyxen.FollowLoop then
                Onyxen.FollowLoop:Disconnect()
                Onyxen.FollowLoop = nil
            end
            
            local Arguments = { [1] = "DeleteFollowCharacter" }
            pcall(function()
                game:GetService("ReplicatedStorage").RE:FindFirstChild("1Bab1yFollo1w"):FireServer(unpack(Arguments))
            end)
            
            local SpawnArgs = { [1] = "CharacterFollowSpawnPlayer", [2] = Onyxen.SelectedGender }
            pcall(function()
                game:GetService("ReplicatedStorage").RE:FindFirstChild("1Bab1yFollo1w"):FireServer(unpack(SpawnArgs))
            end)
            Onyxen.IsFollowing = false
        end
    end
})

BangTab:AddSection({ Name = "التحكم" })

BangTab:AddButton({
    Name = "اعادة الضبط",
    Callback = function()
        if Onyxen.FollowLoop then
            Onyxen.FollowLoop:Disconnect()
            Onyxen.FollowLoop = nil
        end
        
        Onyxen.BangActive = false
        Onyxen.IsFollowing = false

        local Arguments = { [1] = "DeleteFollowCharacter" }
        pcall(function()
            game:GetService("ReplicatedStorage").RE:FindFirstChild("1Bab1yFollo1w"):FireServer(unpack(Arguments))
        end)

        local SpawnArgs = { [1] = "CharacterFollowSpawnPlayer", [2] = Onyxen.SelectedGender }
        pcall(function()
            game:GetService("ReplicatedStorage").RE:FindFirstChild("1Bab1yFollo1w"):FireServer(unpack(SpawnArgs))
        end)
    end
})

BangTab:AddSection({ Name = "مميزات أخرى" })

BangTab:AddToggle({
    Name = "تتبع الكاميرا",
    Default = false,
    Callback = function(Value)
        local Players = game:GetService("Players")
        local RunService = game:GetService("RunService")
        local LocalPlayer = Players.LocalPlayer
        local Camera = workspace.CurrentCamera

        if Value then
            if not Onyxen.CurrentTarget then
                warn("Onyxen Hub: لم يتم اختيار لاعب")
                return
            end

            if not Onyxen.CameraLoop then
                Onyxen.CameraLoop = RunService.Heartbeat:Connect(function()
                    local TargetPlayer = Players:FindFirstChild(Onyxen.CurrentTarget)
                    if TargetPlayer and TargetPlayer.Character and TargetPlayer.Character:FindFirstChild("Humanoid") then
                        Camera.CameraSubject = TargetPlayer.Character.Humanoid
                    else
                        if Onyxen.CameraLoop then
                            Onyxen.CameraLoop:Disconnect()
                            Onyxen.CameraLoop = nil
                        end
                        Camera.CameraSubject = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") or nil
                    end
                end)
            end
        else
            if Onyxen.CameraLoop then
                Onyxen.CameraLoop:Disconnect()
                Onyxen.CameraLoop = nil
            end
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                Camera.CameraSubject = LocalPlayer.Character.Humanoid
            end
        end
    end
})

game.Players.PlayerAdded:Connect(function(Player)
    RefreshPlayerList()
    
    if Onyxen.CurrentTarget == Player.Name then
        Onyxen.TargetPlayerObject = Player
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "🎮 دخل اللاعب المستهدف",
            Text = Player.Name .. " دخل - اعد تفعيل البانق",
            Duration = 3
        })
        
        if Onyxen.BangActive then
            Onyxen.BangActive = false
            if Onyxen.FollowLoop then
                Onyxen.FollowLoop:Disconnect()
                Onyxen.FollowLoop = nil
            end
            Onyxen.IsFollowing = false
        end
    end
end)

game.Players.PlayerRemoving:Connect(function(Player)
    RefreshPlayerList()
    
    if Onyxen.CurrentTarget == Player.Name then
        Onyxen.CurrentTarget = nil
        Onyxen.TargetPlayerObject = nil
        
        if SearchBox then
            pcall(function()
                SearchBox:Set("")
            end)
        end
        
        if Onyxen.FollowLoop then
            Onyxen.FollowLoop:Disconnect()
            Onyxen.FollowLoop = nil
        end
        
        Onyxen.BangActive = false
        Onyxen.IsFollowing = false
        
        local Arguments = { [1] = "DeleteFollowCharacter" }
        pcall(function()
            game:GetService("ReplicatedStorage").RE:FindFirstChild("1Bab1yFollo1w"):FireServer(unpack(Arguments))
        end)
        
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "🚪 طلع اللاعب المستهدف",
            Text = Player.Name .. " طلع - تم حذف الطفل تلقائياً",
            Duration = 3
        })
    end
end)

local AccessoriesTab = Window:MakeTab({
    Title = "أكسسوارات نادره",
    Icon = "rbxassetid://83107814722177"
})

AccessoriesTab:AddSection({ Name = "صنع المطور نوكيا" })

local itemList = {
    "قبعة بنفسجية",
    "نوب مع أيفكت ساعات",
    "أجنحة ذهبية مع لمعان ذهبي",
    "جمجمة زرقاء مشتعلة",
    "حاصد أرواح ضبابي",
    "مسدس ماء",
    "شيطان يطلق نار",
    "شيبس مشتعل",
    "سفينة فضاء تطلق إشعاع",
    "فراشة بنية",
    "فراشة وردية",
    "فراشة خضراء",
    "فراشة ثلجية",
    "رأس اليقطين الأزرق مشتعل",
    "رأس اليقطين الأخضر مشتعل",
    "أجنحة بيضاء تتوهج",
    "قرنان أحمران مشتعلة",
    "قرنان أصفران مشتعلة",
    "أربع جماجم متوهجة",
    "رمح ريبر زهري",
    "أخطبوط يطلق حبر زهري",
    "خوذة زهري تتحرك",
    "سيف أحمر نادر",
    "شعر مشتعل نار",
    "زهرة تتحرك في الظهر نادرة",
    "جماجم تطلق نار حولك",
    "سلاح يطلق أشعة",
    "سيف نار",
    "سيف نجوم",
    "دجاجة تطلق ليزر"
}

local itemIDs = {
    ["قبعة بنفسجية"] = 16088338699,
    ["نوب مع أيفكت ساعات"] = 14901241425,
    ["أجنحة ذهبية مع لمعان ذهبي"] = 417456127,
    ["جمجمة زرقاء مشتعلة"] = 102887469225690,
    ["حاصد أرواح ضبابي"] = 95188146402423,
    ["مسدس ماء"] = 16972562122,
    ["شيطان يطلق نار"] = 14228725502,
    ["شيبس مشتعل"] = 15316834620,
    ["سفينة فضاء تطلق إشعاع"] = 8151404994,
    ["فراشة بنية"] = 128217885,
    ["فراشة وردية"] = 150381051,
    ["فراشة خضراء"] = 226189871,
    ["فراشة ثلجية"] = 141742418,
    ["رأس اليقطين الأزرق مشتعل"] = 183468963,
    ["رأس اليقطين الأخضر مشتعل"] = 132809431,
    ["أجنحة بيضاء تتوهج"] = 192557913,
    ["قرنان أحمران مشتعلة"] = 215718515,
    ["قرنان أصفران مشتعلة"] = 233705354,
    ["أربع جماجم متوهجة"] = 14524326503,
    ["رمح ريبر زهري"] = 17756281756,
    ["أخطبوط يطلق حبر زهري"] = 115894210504764,
    ["خوذة زهري تتحرك"] = 17756304457,
    ["سيف أحمر نادر"] = 5722175994,
    ["شعر مشتعل نار"] = 191101707,
    ["زهرة تتحرك في الظهر نادرة"] = 15121280255,
    ["جماجم تطلق نار حولك"] = 527364921,
    ["سلاح يطلق أشعة"] = 18431445072,
    ["سيف نار"] = 4790788200,
    ["سيف نجوم"] = 18431436143,
    ["دجاجة تطلق ليزر"] = 18934746119
}

local selectedItem = itemList[1]

AccessoriesTab:AddDropdown({
    Name = "اختر العنصر",
    Default = itemList[1],
    Options = itemList,
    Callback = function(value)
        selectedItem = value
    end
})

AccessoriesTab:AddButton({
    Name = "اضغط واستخدم العنصر",
    Callback = function()
        if not selectedItem then
            warn("ياخي، اختار شي أول")
            return
        end

        local args = {itemIDs[selectedItem]}
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9)
            :WaitForChild("Wear",9e9):InvokeServer(unpack(args))
    end
})

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Remotes = ReplicatedStorage:WaitForChild("Remotes", 9e9)
local WearRemote = Remotes:WaitForChild("Wear", 9e9)

AccessoriesTab:AddSection({ Name = "أحذية الشيطان" })

local devilShoesList = {
    "حذاء الشيطان الأبيض",
    "حذاء الشيطان الأسود والأحمر",
    "حذاء الشيطان الأسود"
}
local devilShoesIDs = {
    ["حذاء الشيطان الأبيض"] = 14388009243,
    ["حذاء الشيطان الأسود والأحمر"] = 14388001192,
    ["حذاء الشيطان الأسود"] = 14388004031
}
local selectedDevilShoe = devilShoesList[1]

AccessoriesTab:AddDropdown({
    Name = "اختر الحذاء",
    Default = devilShoesList[1],
    Options = devilShoesList,
    Callback = function(value)
        selectedDevilShoe = value
    end
})
AccessoriesTab:AddButton({
    Name = "ارتداء الحذاء",
    Callback = function()
        if not selectedDevilShoe then return end
        local args = { devilShoesIDs[selectedDevilShoe] }
        WearRemote:InvokeServer(unpack(args))
    end
})

AccessoriesTab:AddSection({ Name = "الشوك" })

local spikesList = {
    "شوك أسود بالذراع والساق",
    "شوك أبيض بالذراع والساق",
    "شوك أسود حول كامل الجسم"
}
local spikesIDs = {
    ["شوك أسود بالذراع والساق"] = 17406577951,
    ["شوك أبيض بالذراع والساق"] = 17406634097,
    ["شوك أسود حول كامل الجسم"] = 13463285148
}
local selectedSpike = spikesList[1]

AccessoriesTab:AddDropdown({
    Name = "اختر الشوك",
    Default = spikesList[1],
    Options = spikesList,
    Callback = function(value)
        selectedSpike = value
    end
})
AccessoriesTab:AddButton({
    Name = "ارتداء الشوك",
    Callback = function()
        if not selectedSpike then return end
        local args = { spikesIDs[selectedSpike] }
        WearRemote:InvokeServer(unpack(args))
    end
})

AccessoriesTab:AddSection({ Name = "باقات الورد" })

local bouquetList = {
    "باقة ورد سوداء",
    "باقة ورد حمراء",
    "باقة ورد وردية",
    "باقة ورد بيضاء"
}
local bouquetIDs = {
    ["باقة ورد سوداء"] = 12465465333,
    ["باقة ورد حمراء"] = 86738633187728,
    ["باقة ورد وردية"] = 12465478536,
    ["باقة ورد بيضاء"] = 72175664063418
}
local selectedBouquet = bouquetList[1]

AccessoriesTab:AddDropdown({
    Name = "اختر الباقة",
    Default = bouquetList[1],
    Options = bouquetList,
    Callback = function(value)
        selectedBouquet = value
    end
})
AccessoriesTab:AddButton({
    Name = "ارتداء الباقة",
    Callback = function()
        if not selectedBouquet then return end
        local args = { bouquetIDs[selectedBouquet] }
        WearRemote:InvokeServer(unpack(args))
    end
})

AccessoriesTab:AddSection({ Name = "ضمادات الذراع" })

local armBandageList = {
    "ضمادات الذراع السوداء",
    "ضمادات الذراع البيضاء"
}
local armBandageIDs = {
    ["ضمادات الذراع السوداء"] = 11456892689,
    ["ضمادات الذراع البيضاء"] = 11458078735
}
local selectedArmBandage = armBandageList[1]

AccessoriesTab:AddDropdown({
    Name = "اختر الضمادات",
    Default = armBandageList[1],
    Options = armBandageList,
    Callback = function(value)
        selectedArmBandage = value
    end
})
AccessoriesTab:AddButton({
    Name = "ارتداء الضمادات",
    Callback = function()
        if not selectedArmBandage then return end
        local args = { armBandageIDs[selectedArmBandage] }
        WearRemote:InvokeServer(unpack(args))
    end
})

AccessoriesTab:AddSection({ Name = "القفازات" })

local glovesList = {
    "قفازات طويلة سوداء",
    "قفازات قصيرة سوداء",
    "قفازات طويلة حمراء",
    "قفازات طويلة بيضاء",
    "قفازات قصيرة بيضاء",
    "قفازات طويلة زرقاء",
    "قفازات قصيرة زرقاء",
    "قفازات طويلة وردية",
    "قفازات قصيرة وردية",
    "قفازات طويلة خضراء",
    "قفازات قصيرة خضراء",
    "قفاز غريب",
    "قفازات حمراء مخططة بالابيض",
    "قفازات للجنسين",
    "قفازات وردية للبنات",
    "قفازات سوداء انيقة",
    "قفازات بيضاء انيقة",
    "قفازات خضراء انيقة",
    "قفازات مخططة اسود واحمر",
    "قفازات مخططة ابيض واسود"
}
local glovesIDs = {
    ["قفازات طويلة سوداء"] = 14663501859,
    ["قفازات قصيرة سوداء"] = 14915193711,
    ["قفازات طويلة حمراء"] = 15209194774,
    ["قفازات طويلة بيضاء"] = 10789933479,
    ["قفازات قصيرة بيضاء"] = 15066901505,
    ["قفازات طويلة زرقاء"] = 10789945803,
    ["قفازات قصيرة زرقاء"] = 10714157708,
    ["قفازات طويلة وردية"] = 10789939838,
    ["قفازات قصيرة وردية"] = 17775444165,
    ["قفازات طويلة خضراء"] = 13233318125,
    ["قفازات قصيرة خضراء"] = 10713817180,
    ["قفاز غريب"] = 12175951307,
    ["قفازات حمراء مخططة بالابيض"] = 14687547890,
    ["قفازات للجنسين"] = 106701020164834,
    ["قفازات وردية للبنات"] = 16030963309,
    ["قفازات سوداء انيقة"] = 12368927792,
    ["قفازات بيضاء انيقة"] = 12368919975,
    ["قفازات خضراء انيقة"] = 12368854118,
    ["قفازات مخططة اسود واحمر"] = 14758885890,
    ["قفازات مخططة ابيض واسود"] = 14758885890
}
local selectedGlove = glovesList[1]

AccessoriesTab:AddDropdown({
    Name = "اختر القفازات",
    Default = glovesList[1],
    Options = glovesList,
    Callback = function(value)
        selectedGlove = value
    end
})
AccessoriesTab:AddButton({
    Name = "ارتداء القفازات",
    Callback = function()
        if not selectedGlove then return end
        local args = { glovesIDs[selectedGlove] }
        WearRemote:InvokeServer(unpack(args))
    end
})

AccessoriesTab:AddSection({ Name = "النار في اليد" })

AccessoriesTab:AddButton({
    Name = "تشغيل نار في اليد",
    Description = "",
    Callback = function()
        local Player = game.Players.LocalPlayer
        local Character = Player.Character
        local Humanoid = Character:FindFirstChildOfClass("Humanoid")
        local RootPart = Character:FindFirstChild("HumanoidRootPart")
        local OldPos = RootPart.CFrame
        
        local function freezeHumanoid(humanoid)
            humanoid.WalkSpeed = 0
            humanoid.JumpPower = 0
        end
        
        local function restoreHumanoid(humanoid)
            humanoid.WalkSpeed = 16
            humanoid.JumpPower = 50
        end
        
        local firstPosition = CFrame.new(-349, 5, 98)
        
        local PoolClick = workspace.WorkspaceCom["001_Hospital"]:FindFirstChild("PoolClick")
        
        if PoolClick and PoolClick:FindFirstChild("ClickDetector") then
            freezeHumanoid(Humanoid)
            RootPart.CFrame = firstPosition
            task.wait(1)
            RootPart.CFrame = PoolClick.CFrame
            fireclickdetector(PoolClick.ClickDetector)
            task.wait(2)
            RootPart.CFrame = OldPos
            restoreHumanoid(Humanoid)
        else
            warn("Onyxen Hub")
        end
    end
})

AccessoriesTab:AddButton({
    Name = "إطفاء النار في اليد",
    Callback = function()
        local Player = game.Players.LocalPlayer
        local Character = Player.Character or Player.CharacterAdded:Wait()
        local Humanoid = Character:FindFirstChildWhichIsA("Humanoid")

        if Humanoid then
            Humanoid.Health = 0
        else
            warn("Onyxen Hub")
        end
    end
})

AccessoriesTab:AddSection({ Name = "النار في الجسم" })

local FireActive = false
local FireSelected = nil

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ApplyEmmiter = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("ApplyEmmiter")

local FireEffects = {
    ["نار بيضاء"] = "030FireWhite",
    ["نار برتقالية"] = "031FireOrange",
    ["نار خضراء"] = "032FireGreen",
    ["نار زرقاء"] = "033FireBlue",
    ["نار بنفسجية"] = "034FirePurple",
    ["نار سوداء"] = "035FireBlack",
}

local FireOptions = {}
for name, _ in pairs(FireEffects) do
    table.insert(FireOptions, name)
end

AccessoriesTab:AddDropdown({
    Name = "اختر لون النار",
    Options = FireOptions,
    Default = FireOptions[1],
    Callback = function(Value)
        FireSelected = FireEffects[Value]
        if FireActive and FireSelected then
            ApplyEmmiter:InvokeServer(123456789, FireSelected)
        end
    end
})

AccessoriesTab:AddToggle({
    Name = "تشغيل / إطفاء النار",
    Default = false,
    Callback = function(Value)
        FireActive = Value
        if FireActive and FireSelected then
            ApplyEmmiter:InvokeServer(123456789, FireSelected)
        else
            ApplyEmmiter:InvokeServer(0, "Clear")
        end
    end
})

AccessoriesTab:AddSection({ Name = "تأثيرات مرئية للجميع" })

local EffectActive = false
local EffectSelected = nil

local Effects = {
    ["أبيض حر"] = "0002FreeWhite",
    ["أصفر حر"] = "0003FreeYellow",
    ["برتقالي حر"] = "0004FreeOrange",
    ["أخضر حر"] = "0005FreeGreen",
    ["أزرق حر"] = "0006FreeBlue",
    ["بنفسجي حر"] = "0007FreePurple",
    ["وردي حر"] = "0008FreePink",
    ["أحمر حر"] = "0009FreeRed",

    ["قلوب صفراء"] = "001HeartsYellow",
    ["قلوب خضراء"] = "002HeartsGreen",
    ["قلوب زرقاء"] = "003HeartsBlue",
    ["قلوب بنفسجية"] = "004HeartsPurple",
    ["قلوب وردية"] = "005HeartsPink",
    ["قلوب حمراء"] = "006HeartsRed",

    ["بريق أبيض"] = "020TwinkleWhite",
    ["بريق أصفر"] = "021TwinkleYellow",
    ["بريق أخضر"] = "022TwinkleGreen",
    ["بريق بنفسجي"] = "023TwinklePurple",
    ["بريق وردي"] = "024TwinklePink",
    ["بريق أحمر"] = "025TwinkleRed",

    ["شرر أبيض"] = "050SparksWhite",
    ["شرر أخضر"] = "051SparksGreen",
    ["شرر أزرق"] = "052SparksBlue",
    ["شرر بنفسجي"] = "053SparksPurple",
    ["شرر وردي"] = "054SparksPink",
    ["شرر أحمر"] = "055SparksRed",

    ["دخان أبيض"] = "080SmokeWhite",
    ["دخان أصفر"] = "081SmokeYellow",
    ["دخان برتقالي"] = "082SmokeOrange",
    ["دخان أخضر"] = "083SmokeGreen",
    ["دخان أزرق"] = "084SmokeBlue",
    ["دخان بنفسجي"] = "085SmokePurple",
    ["دخان أحمر"] = "086SmokeRed",
    ["دخان أسود"] = "087SmokeBlack",

    ["نجوم بيضاء"] = "090StarWhite",
    ["نجوم برتقالية"] = "091StarOrange",
    ["نجوم خضراء"] = "092StarGreen",
    ["نجوم زرقاء"] = "093StarBlue",
    ["نجوم بنفسجية"] = "094StarPurple",
    ["نجوم وردية"] = "095StarPink",
    ["نجوم حمراء"] = "096StarRed",
}

local EffectOptions = {}
for name, _ in pairs(Effects) do
    table.insert(EffectOptions, name)
end

AccessoriesTab:AddDropdown({
    Name = "اختر التأثير",
    Options = EffectOptions,
    Default = EffectOptions[1],
    Callback = function(Value)
        EffectSelected = Effects[Value]
        if EffectActive and EffectSelected then
            ApplyEmmiter:InvokeServer(123456789, EffectSelected)
        end
    end
})

AccessoriesTab:AddToggle({
    Name = "تشغيل / إطفاء التأثير",
    Default = false,
    Callback = function(Value)
        EffectActive = Value
        if EffectActive and EffectSelected then
            ApplyEmmiter:InvokeServer(123456789, EffectSelected)
        else
            ApplyEmmiter:InvokeServer(0, "Clear")
        end
    end
})

local SkinTab = Window:MakeTab({
    Title = "السكنات",
    Icon = "rbxassetid://10734952036"
})

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Remotes = ReplicatedStorage:WaitForChild("Remotes", 9e9)
local ChangeCharacterBody = Remotes:WaitForChild("ChangeCharacterBody", 9e9)
local WearRemote = Remotes:WaitForChild("Wear", 9e9)
local ChangeBodyColor = Remotes:WaitForChild("ChangeBodyColor", 9e9)
local localPlayer = Players.LocalPlayer

local function wearAsset(id)
    local args = { [1] = id }
    pcall(function()
        WearRemote:InvokeServer(unpack(args))
    end)
    task.wait(0.5)
end

local function changeBody(ids)
    local args = { [1] = ids }
    pcall(function()
        ChangeCharacterBody:InvokeServer(unpack(args))
    end)
    task.wait(2)
end

local function applySkin(changeIds, wearIds, skinName)
    task.spawn(function()
        changeBody(changeIds)
        for _, id in ipairs(wearIds) do
            wearAsset(id)
        end
        task.wait(1)
        local character = localPlayer.Character
        if character then
            local humanoid = character:FindFirstChild("Humanoid")
            if humanoid then
                humanoid.Health = 0
            end
        end
        local Sound = Instance.new("Sound", game:GetService("SoundService"))
        Sound.SoundId = "rbxassetid://8183296024"
        Sound:Play()
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Onyxen Hub",
            Text = "تم ارتداء سكن " .. skinName .. " بنجاح كامل!",
            Duration = 4
        })
    end)
end

SkinTab:AddSection({ Name = "ملاحظه: السكنات قيد التطوير" })

SkinTab:AddSection({ Name = "سكنات اولاد" })

SkinTab:AddButton({
    Name = "سكن ولد ابيض",
    Callback = function()
        applySkin(
            {5625858521, 1, 1, 1, 1, 1},
            {110000215464315, 76695697637517, 131956287240171, 25321961, 134082579, 86499666, 27112052, 27112039, 27112056, 14547141130, 18308506919, 2510242378, 2510238627, 11600324801, 2510230574, 106537993816942, 15474900644, 15598027352, 15848173823, 12411004315, 102628652339402, 116672080819750, 108054918550322, 114521343169547, 94294863894618, 114085443415096, 76853326316082, 14136620469, 6934118068, 73600503443279, 132948724132771, 89089371397018, 13463352017, 11440746687, 139695455477560, 97259733545525, 107467911109776, 92990727221525, 6773963835, 12523669982},
            "ولد ابيض"
        )
    end
})

SkinTab:AddButton({
    Name = "سكن ولد بني واسود",
    Callback = function()
        applySkin(
            {5625858521, 1, 1, 1, 1, 1},
            {12519496793, 139626774800903, 7699174, 134082579, 86499666, 27112052, 27112039, 27112056, 139607718, 11600321661, 619537468, 619536621, 2510236649, 2510233257, 2510230574, 2510240941, 12523694032, 15422147496, 15847200142, 15847969469, 109216506009477, 127486359276546, 12563891331, 5944818089, 114521343169547, 120623165437473, 13620518518, 124136948189503, 18582129002, 13060809764, 100889331255790, 135171231133085, 10513904989, 129654807973329, 6934118068, 133339344724037, 77320963564953, 78823652285940, 130321935821353},
            "ولد بني واسود"
        )
    end
})

SkinTab:AddButton({
    Name = "سكن ولد ابيض واحمر",
    Callback = function()
        applySkin(
            {5625858521, 1, 1, 1, 1, 1},
            {5955940965, 122862772609199, 139626774800903, 134082579, 86499666, 27112052, 27112039, 27112056, 14547141130, 11600321661, 619537468, 619536621, 619536283, 619535616, 76664743826864, 78100899215950, 6934118068, 150381051, 93232496824184, 102931521699302, 105802499753497, 17352386942, 103509947734243, 18500102032, 86952016572779, 12523688366, 15360967485, 15848166908, 11666241096, 17773307797, 107746275518792, 93221904910049, 73506212595494, 12563920762},
            "ولد ابيض واحمر"
        )
    end
})

SkinTab:AddButton({
    Name = "سكن ولد ابيض 2",
    Callback = function()
        applySkin(
            {5625858521, 1, 1, 1, 1, 1},
            {119711827958266, 6148830177, 86487700, 134082579, 86499666, 27112052, 27112039, 27112056, 139607718, 18308506919, 11600331426, 11600327265, 8356408450, 128710332730779, 116672080819750, 15547027816, 15848166908, 16079349120, 11440746687, 12523688366, 12410997561, 110039967666270, 96171320357221, 12323768229, 137491238797293, 128734240798370, 108222191179683, 13620518518, 114126033878052, 120623165437473, 16290585600, 17170428998, 106123752937395, 73506212595494},
            "ولد ابيض 2"
        )
    end
})

SkinTab:AddButton({
    Name = "سكن ولد اسود",
    Callback = function()
        applySkin(
            {5625858521, 1, 1, 1, 1, 1},
            {112091195493074, 18682126744, 134082579, 86499666, 27112052, 27112039, 27112056, 139607718, 18308506919, 619537468, 619536621, 1113752285, 1113751889, 1113754738, 1113752975, 12410997561, 126841570867591, 15547027816, 12523688366, 15349536713, 15848166908, 103548920195980, 128196949583926, 106627934576230, 100889331255790, 135171231133085, 77320963564953, 8356417938, 11440759171, 17170428998},
            "ولد اسود"
        )
    end
})

SkinTab:AddButton({
    Name = "سكن ولد ماريو",
    Callback = function()
        applySkin(
            {5625858521, 1, 1, 1, 1, 1},
            {11329758371, 5301042976, 139626774800903, 134082579, 86499666, 27112052, 27112039, 27112056, 14547141130, 18308506919, 2510242378, 2510238627, 11600324801, 2510230574, 1113742944, 12523694032, 15360984157, 15547031877, 15474908416, 109216506009477, 12722096506, 95508847076167, 16794004327, 121072373535149, 125774809056799, 108385648612792, 114521343169547, 13620518518, 18431436143, 85879112587089, 11984967571, 11678233873, 93762353247656},
            "ولد ماريو"
        )
    end
})

SkinTab:AddButton({
    Name = "سكن ولد اخضر فاتح",
    Callback = function()
        applySkin(
            {5625858521, 1, 1, 1, 1, 1},
            {6179465423, 90682481960811, 139626774800903, 134082579, 86499666, 27112052, 27112039, 27112056, 14547141130, 18308506919, 2510242378, 2510238627, 11600324801, 2510230574, 1113742944, 94022970402993, 82982880800523, 89598065250958, 127346336794672, 96163916111600, 122495287527454, 84080260707553, 12523698801, 15422129985, 15908577611, 15360979028, 16849618417, 17170428998},
            "ولد اخضر فاتح"
        )
    end
})

SkinTab:AddButton({
    Name = "سكن ولد اسود 2",
    Callback = function()
        applySkin(
            {5625858521, 1, 1, 1, 1, 1},
            {13970681765, 74640420297444, 139626774800903, 134082579, 86499666, 27112052, 27112039, 27112056, 14547141130, 11600321661, 619537468, 619536621, 115715495289805, 93993406355955, 123695349157584, 106537993816942, 12523694032, 15894552056, 15422147496, 15474908416, 16079358481, 12410992183, 12668628052, 109216506009477, 15598031013, 9174391966, 132466907655678, 98010402623385, 8356417938, 11440746687, 128196949583926, 106391512510357, 77320963564953, 132641613427329, 3339372724, 16290585600, 103135806954655, 91654497062220, 13620518518},
            "ولد اسود 2"
        )
    end
})

SkinTab:AddButton({
    Name = "سكن ولد برازيلي",
    Callback = function()
        applySkin(
            {5625858521, 1, 1, 1, 1, 1},
            {15042717445, 117923463092880, 139626774800903, 134082579, 86499666, 27112052, 27112039, 27112056, 14547141130, 11600321661, 619537468, 619536621, 1113752285, 1113751889, 1113754738, 1113752975, 12523694032, 109216506009477, 15847200142, 15474908416, 15422147496, 15847969469, 103135806954655, 82987349552249, 93124330609364, 136777510825696, 16290585600, 8356417938, 71561979890902, 128024987578321, 78418196501630, 17268497283, 78410619504838, 108514963983539, 128196949583926, 16849546796, 15218556335, 11474065643, 12563891331, 75063100835024},
            "ولد برازيلي"
        )
    end
})

SkinTab:AddButton({
    Name = "سكن ولد بينك",
    Callback = function()
        applySkin(
            {5625858521, 1, 1, 1, 1, 1},
            {15570219366, 6035159160, 139626774800903, 134082579, 86499666, 27112052, 27112039, 27112056, 14547141130, 11600321661, 106810508343012, 619536621, 115715495289805, 93993406355955, 123695349157584, 106537993816942, 12523694032, 15894552056, 15422147496, 15474908416, 16079358481, 12410992183, 12668628052, 109216506009477, 103135806954655, 122596174236692, 84589383864650, 8356417938, 10907543700, 116672080819750, 83184608604926, 108802533468081, 109531999241580, 11655528528, 11655508769, 118228858381482, 136777510825696, 16290585600, 114318596016916, 18658232712, 17458940780, 75063100835024},
            "ولد بينك"
        )
    end
})

SkinTab:AddButton({
    Name = "كلاسيك 1",
    Callback = function()
        applySkin(
            {5625858521, 1, 1, 1, 1, 1},
            {5769684509, 730003802, 108065275382928, 106411216404626, 81500432784353, 87202958751790, 129699548221468, 103452055306587, 11600321661, 619537468, 619536621, 619536283, 619535616, 619535091, 619537096, 134249167748852},
            "كلاسيك 1"
        )
    end
})

SkinTab:AddButton({
    Name = "كلاسيك 2",
    Callback = function()
        applySkin(
            {5625858521, 1, 1, 1, 1, 1},
            {79533091742651, 8225844280, 15383132657, 104406251407292, 76782780579144, 99171220857487, 109371598412339, 36781518, 11600321661, 619537468, 619536621, 619536283, 619535616, 619535091, 619537096, 191101707, 117845013050815, 13265134760, 87940367641897, 112842116239046, 105932371564503},
            "كلاسيك 2"
        )
    end
})

SkinTab:AddButton({
    Name = "كلاسيك 3",
    Callback = function()
        applySkin(
            {5625858521, 1, 1, 1, 1, 1},
            {80828306025559, 131008891237252, 111740960054374, 27402546, 27402641, 27402580, 27402714, 27402742, 11600321661, 619537468, 619536621, 619536283, 619535616, 619535091, 619537096, 73848762187098},
            "كلاسيك 3"
        )
    end
})

SkinTab:AddButton({
    Name = "كلاسيك 4",
    Callback = function()
        applySkin(
            {5625858521, 1, 1, 1, 1, 1},
            {16648649036, 11160073992, 87422552751476, 104406251407292, 76782780579144, 99171220857487, 109371598412339, 139607718, 11600321661, 619537468, 619536621, 619536283, 619535616, 619535091, 619537096, 187998056, 51245241, 323476364, 11268790321, 100776419423233, 16009916783, 96079043},
            "كلاسيك 4"
        )
    end
})

SkinTab:AddButton({
    Name = "كلاسيك 5",
    Callback = function()
        applySkin(
            {5625858521, 1, 1, 1, 1, 1},
            {107466649386040, 111141164066160, 134082579, 104406251407292, 76782780579144, 99171220857487, 109371598412339, 36781518, 11600321661, 619537468, 619536621, 619536283, 619535616, 619535091, 619537096, 15230865589, 75082169084244, 98147613328249, 109039915397757, 87719366970131, 13705728672, 12351903802, 132325777590029},
            "كلاسيك 5"
        )
    end
})

SkinTab:AddSection({ Name = "يوجد مشكله الرأس لايرتدى في سكن البنات" })

SkinTab:AddSection({ Name = "سكنات بنات" })

SkinTab:AddButton({
    Name = "سكن بنت اسود",
    Callback = function()
        applySkin(
            {4571055698, 1, 1, 1, 1, 1},
            {15054520753, 92467925474973, 131711785187389, 18839824113, 18839824132, 18839824209, 86500064, 86500078, 18308506919, 1018549681, 2510238627, 11600324801, 11600319649, 11600317961, 11600329588, 15264899199, 12650377005, 18658232712, 74672562952517, 13280857565, 16146677425, 15264875793, 11990063212, 12342774692, 12342615103, 13280574639, 15590383083, 11990059649, 14910000746, 126149151576998, 126999864773218, 13002975349, 16885154916, 13620518518, 103135806954655, 114521343169547, 76752642804857, 113563402156196, 135543013445657, 11548626866, 11549160707, 18236318644, 136459936418643, 115328506996887, 93221904910049, 118722887524229, 14426623369, 12922239190, 115598724400026, 78116240587706, 9509132480, 16303101175, 75565326517940, 136169399963454, 18899122089, 15264863474, 17802431789, 14426634470, 81300770647151, 17055350629, 3339372724},
            "بنت اسود"
        )
    end
})

SkinTab:AddButton({
    Name = "سكن بنت ابيض واحمر",
    Callback = function()
        applySkin(
            {4571055698, 1, 1, 1, 1, 1},
            {70485883791168, 8355192770, 92467925474973, 86487766, 746767604, 18839824113, 18839824132, 18839824209, 86500064, 139607718, 18308506919, 619536621, 973768058, 12342738005, 11990041097, 16885149320, 10553396797, 18658232712, 10680893950, 16146677425, 11990059649, 12650377005, 13280857565, 15590383083, 13620518518, 114521343169547, 103135806954655, 74664900823981, 6934118068, 17505200063, 119694360722474, 80941748025443, 115328506996887, 102628652339402, 116672080819750, 73624517361092, 12410997561, 126841570867591, 18431443033, 16409600867, 139222895177257, 91053437795033, 74513474705436},
            "بنت ابيض واحمر"
        )
    end
})

SkinTab:AddButton({
    Name = "سكن بنت ارنب بينك",
    Callback = function()
        applySkin(
            {4571055698, 1, 1, 1, 1, 1},
            {15570219366, 4080983570, 92467925474973, 81609694789127, 18839824113, 18839824132, 18839824209, 86500064, 139607718, 11600321661, 16744219182, 619536621, 12342774692, 12342738005, 11990063212, 12342615103, 16146677425, 16885154916, 95969315881407, 126149151576998, 12650377005, 10553396797, 15264899199, 15264875793, 13280857565, 13280517902, 93363972541336, 18658232712, 18658242272, 133602782390697, 16493137815, 77013977646675, 11990049341, 17813502063, 12342784316, 15590377869, 136435782200054, 15264863474, 13003024727, 78289377066764, 94475733362733, 15615642993, 88782964132646, 99743560022172, 13206385231, 135631157365091, 8356417938, 8356408450, 106383652884207, 84108498320100, 11497901639, 106391512510357, 77246961863099, 18961572779, 102628652339402, 116672080819750, 17899540026, 83898161589013, 17092135501, 101515211442184},
            "بنت ارنب بينك"
        )
    end
})

SkinTab:AddButton({
    Name = "سكن بنت اسود 2",
    Callback = function()
        applySkin(
            {4571055698, 1, 1, 1, 1, 1},
            {78672695197779, 75407887543141, 139626774800903, 746767604, 18839824113, 110127539411791, 108349951349566, 86500064, 139607718, 11600321661, 16744219182, 619536621, 2510236649, 2510233257, 2510240941, 12342774692, 12342738005, 11990059649, 11990063212, 12342615103, 16146677425, 16885154916, 95969315881407, 11773650702, 126149151576998, 12650377005, 10553396797, 15264899199, 15264875793, 13280857565, 13280517902, 93363972541336, 14910000746, 18658232712, 18658242272, 13620518518, 120623165437473, 114521343169547, 139075743544534, 78116240587706, 15590377869, 15264863474, 15264895091, 14426623369, 18192836763, 90961015312174, 14050700268, 12307048143, 13003024727, 78289377066764, 109152558884894, 11497901639, 16291241605, 92587518753019, 128137008319054, 107632239317028, 99743560022172, 94475733362733, 13206710824, 12368528729, 136459936418643, 121211658258674, 125859563328439, 132466907655678, 98010402623385, 104393718736940, 93221904910049, 8356417938, 118929739847948},
            "بنت اسود 2"
        )
    end
})

SkinTab:AddButton({
    Name = "سكن بنت تايجر",
    Callback = function()
        applySkin(
            {4571055698, 1, 1, 1, 1, 1},
            {139844681686463, 12041436835, 92467925474973, 81609694789127, 18839824113, 18839824132, 18839824209, 86500064, 139607718, 11600321661, 133304526526319, 114998633936467, 2510236649, 2510233257, 2510240941, 12342774692, 12342738005, 11990059649, 11990063212, 12342615103, 16146677425, 16885154916, 95969315881407, 11773650702, 126149151576998, 12650377005, 10553396797, 15264899199, 15264875793, 13280857565, 13280517902, 93363972541336, 18658232712, 18658242272, 133602782390697, 16493137815, 77013977646675, 11990049341, 17813502063, 12342784316, 15590377869, 136435782200054, 127233423640859, 15264863474, 13003024727, 78289377066764, 94475733362733, 18899369694, 79173366242731, 15615642993, 127329684987223, 88782964132646, 106392982825041, 116364907876711, 91190149193191, 17354531382, 124591035553497, 124664999032921, 78020446026085, 105072979561035, 129001503744055, 123157666819802, 131716894936205, 79041217021501, 137455870385517},
            "بنت تايجر"
        )
    end
})

SkinTab:AddButton({
    Name = "سكن بنت ابيض",
    Callback = function()
        applySkin(
            {4571055698, 1, 1, 1, 1, 1},
            {135869132671742, 9194572061, 92467925474973, 81609694789127, 18839824113, 18839824132, 18839824209, 86500064, 139607718, 11600321661, 16744219182, 619536621, 12342774692, 12342738005, 11990063212, 12342615103, 16146677425, 16885154916, 95969315881407, 126149151576998, 12650377005, 10553396797, 15264899199, 15264875793, 13280857565, 13280517902, 93363972541336, 18658232712, 18658242272, 133602782390697, 16493137815, 77013977646675, 11990049341, 17813502063, 12342784316, 15590377869, 136435782200054, 15264863474, 13003024727, 78289377066764, 94475733362733, 15615642993, 88782964132646, 99743560022172, 13206385231, 135631157365091, 8356417938, 8356408450, 106383652884207, 84108498320100, 11497901639, 106391512510357, 77246961863099, 18961572779, 102628652339402, 116672080819750, 18946548218, 84887082607533},
            "بنت ابيض"
        )
    end
})

SkinTab:AddButton({
    Name = "سكن بنت ازرق",
    Callback = function()
        applySkin(
            {4571055698, 1, 1, 1, 1, 1},
            {99129392041136, 16795661187, 89365507387231, 746767604, 18839824113, 18839824132, 18839824209, 86500064, 139607718, 18308506919, 2510233257, 2510240941, 14102464945, 11773650702, 14575281021, 95969315881407, 15590383083, 18658232712, 14910000746, 11990059649, 11990063212, 13280517902, 12342774692, 12342738005, 12342615103, 16146677425, 13280857565, 15264899199, 15264875793, 10553396797, 13003268590, 140497487750684, 16885154916, 83270899390755, 12296357256, 15799955770, 126841570867591, 12354072213, 109423756668263, 90110938630567, 17352386942, 103256089585485, 133304526526319, 93794469517952, 96205947659006, 3339372724, 15358571797, 15358579299, 13620518518, 91654497062220, 73188216876574, 101884051134364},
            "بنت ازرق"
        )
    end
})

SkinTab:AddButton({
    Name = "سكن بنت بيبي شارك",
    Callback = function()
        applySkin(
            {4571055698, 1, 1, 1, 1, 1},
            {8863265262, 83117754374312, 92467925474973, 101659363323498, 18839824113, 18839824132, 18839824209, 86500064, 139607718, 18308506919, 133304526526319, 619536621, 11600324801, 11600317961, 11600329588, 12650377005, 13206710824, 18658232712, 14575281021, 74672562952517, 13280857565, 16146677425, 15264875793, 16493137815, 16885149320, 15590383083, 12342738005, 11990059649, 12342615103, 12342761717, 18730136012, 13003024727, 78289377066764, 99743560022172, 18181472420, 134559145888950, 77973691120888, 18154390923, 14355108360, 95101764849510, 16290585600, 103135806954655, 114521343169547, 13620518518, 135417458130104, 82035137871253, 100889331255790, 135171231133085, 76112131509818, 12354070595, 15799603445},
            "بنت بيبي شارك"
        )
    end
})

SkinTab:AddButton({
    Name = "سكن بنت بني",
    Callback = function()
        applySkin(
            {4571055698, 1, 1, 1, 1, 1},
            {13244908898, 85678913398794, 139626774800903, 746767604, 18839824113, 110127539411791, 108349951349566, 86500064, 139607718, 11600321661, 1018549681, 11600327265, 2510236649, 2510233257, 2510240941, 12342774692, 12342738005, 11990059649, 11990063212, 12342615103, 16146677425, 16885154916, 95969315881407, 11773650702, 126149151576998, 12650377005, 10553396797, 15264899199, 15264875793, 13280857565, 13280517902, 93363972541336, 14910000746, 13002975349, 126999864773218, 18658232712, 18658242272, 13620518518, 120623165437473, 114521343169547, 91654497062220, 15590377869, 15264863474, 15264895091, 14426623369, 18192836763, 11549160707, 6965372930, 6134532324, 14050694921, 139273418417263, 119336273950997, 15772526540, 15960831766, 123157666819802, 81296102261972, 125305177060635, 122911280543984, 101617043174084, 6934118068, 126709862611330},
            "بنت بني"
        )
    end
})

SkinTab:AddButton({
    Name = "سكن بنت ازرق 2",
    Callback = function()
        applySkin(
            {4571055698, 1, 1, 1, 1, 1},
            {7576924636, 14876830197, 129556110584587, 81609694789127, 18839824113, 18839824132, 18839824209, 86500064, 139607718, 18308506919, 2510242378, 619536621, 2510236649, 2510233257, 2510230574, 2510240941, 15590383083, 95969315881407, 11990049341, 12342738005, 16146677425, 10553396797, 10472113844, 82874429819173, 18658232712, 11773650702, 12650377005, 115109327261341, 84356802548506, 16885149320, 15264899199, 15264875793, 15264895091, 15264863474, 14426628259, 13003024727, 73157425513148, 92906676639273, 75854895529907, 13871832127, 128512372334410, 75786632979197, 104619930323199, 103135806954655, 91654497062220, 13620518518, 12283967892, 16290585600, 3339372724, 117079462739557, 79341898647714, 15388845939, 91945574942647, 100889331255790, 135171231133085},
            "بنت ازرق 2"
        )
    end
})

SkinTab:AddButton({
    Name = "سكن بنت ابيض 2",
    Callback = function()
        applySkin(
            {4571055698, 1, 1, 1, 1, 1},
            {72043684844515, 92467925474973, 101659363323498, 18839824113, 18839824132, 18839824209, 86500064, 139607718, 18308506919, 133304526526319, 619536621, 11600324801, 11600319649, 11600317961, 11600329588, 12650377005, 13206710824, 18658232712, 14575281021, 74672562952517, 13280857565, 16146677425, 15264875793, 16885149320, 15590383083, 12342738005, 11990059649, 12342615103, 12342761717, 126999864773218, 13002975349, 18730136012, 14050694921, 130539280520278, 112178193270078, 131691517715857, 11773650702, 16290585600, 18431436143, 136459936418643, 139208088548756, 18181472420, 134559145888950, 91676709871017, 98593312057505, 14850491823, 13049830568, 78187895390844, 129144177664403, 132466907655678, 98010402623385, 90476342076107, 14213412547, 13184975791, 73456731323836},
            "بنت ابيض 2"
        )
    end
})

SkinTab:AddButton({
    Name = "سكن بنت شعر احمر",
    Callback = function()
        applySkin(
            {4571055698, 1, 1, 1, 1, 1},
            {83630008192093, 118500959165881, 139626774800903, 746767604, 18839824113, 110127539411791, 108349951349566, 86500064, 86500078, 11600321661, 1018549681, 11600327265, 2510236649, 2510233257, 2510240941, 12342774692, 12342738005, 11990059649, 11990063212, 12342615103, 16146677425, 16885154916, 95969315881407, 11773650702, 126149151576998, 12650377005, 10553396797, 15264899199, 15264875793, 13280857565, 13280517902, 93363972541336, 14910000746, 18658232712, 18658242272, 13620518518, 120623165437473, 114521343169547, 139075743544534, 78116240587706, 15590377869, 15264863474, 15264895091, 14426623369, 18192836763, 90961015312174, 14050700268, 12307048143, 13003024727, 78289377066764, 128512372334410, 12375909842, 13871832127, 109152558884894, 111705314841358, 17802431789, 128137008319054, 107632239317028, 99743560022172, 94475733362733, 13206710824, 12368528729, 136459936418643, 109216506009477, 121211658258674, 100512885157747, 123587021722609, 112237931268581, 101664457145124, 110573635807802, 102628652339402, 116672080819750, 133260703045478, 119336273950997, 12374996571, 139962616559018, 17899627446},
            "بنت شعر احمر"
        )
    end
})

SkinTab:AddButton({
    Name = "سكن بنت لون شعر بني",
    Callback = function()
        applySkin(
            {4571055698, 1, 1, 1, 1, 1},
            {82823318777173, 91433087817715, 139626774800903, 746767604, 18839824113, 110127539411791, 108349951349566, 86500064, 86500078, 11600321661, 1018549681, 11600327265, 2510236649, 2510233257, 2510240941, 12342774692, 12342738005, 11990059649, 11990063212, 12342615103, 16146677425, 16885154916, 95969315881407, 11773650702, 126149151576998, 12650377005, 10553396797, 15264899199, 15264875793, 13280857565, 13280517902, 93363972541336, 14910000746, 18658232712, 18658242272, 13620518518, 120623165437473, 114521343169547, 139075743544534, 78116240587706, 15590377869, 15264863474, 15264895091, 14426623369, 18192836763, 90961015312174, 14050700268, 12307048143, 13003024727, 78289377066764, 12354070595, 128512372334410, 11548594864, 12375909842, 13871832127, 109152558884894, 11440759171, 11497901639, 111705314841358, 17802431789, 128137008319054, 107632239317028, 99743560022172, 94475733362733, 13206710824, 12368528729, 136459936418643, 109216506009477, 121211658258674, 100512885157747, 123587021722609, 112237931268581, 101664457145124, 71865439963352, 77320963564953, 106431262230880, 12353536131, 12339916130, 78823652285940, 96759975066480},
            "بنت لون شعر بني"
        )
    end
})

SkinTab:AddButton({
    Name = "سكن بنت اسود 3",
    Callback = function()
        applySkin(
            {4571055698, 1, 1, 1, 1, 1},
            {113755380739046, 115380744728476, 105536855862708, 746767604, 18839824113, 110127539411791, 108349951349566, 86500064, 139607718, 11600321661, 11600331426, 11600327265, 2510236649, 2510233257, 2510240941, 15590383083, 12342774692, 12342738005, 11990059649, 11990063212, 12342615103, 16146677425, 16885154916, 95969315881407, 11773650702, 126149151576998, 12650377005, 10553396797, 15264899199, 15264875793, 13280857565, 13280517902, 93363972541336, 14910000746, 127233423640859, 136994122872489, 13002975349, 126999864773218, 18658232712, 18658242272, 12342753219, 76011317594786, 122833108758777, 115915944317023, 120307550470684, 90642198938811, 14976930798, 14513395948, 7456687336, 110868010510532, 18658137251, 135909241385900, 16493137815, 131903381273535, 11133691994, 97929301259518, 139768379079423, 15104957011, 12354068773, 113956624449425, 94174893872472, 131742723958710, 8356417938, 129690649104416},
            "بنت اسود 3"
        )
    end
})

SkinTab:AddButton({
    Name = "سكن بنت اصفر",
    Callback = function()
        applySkin(
            {4571055698, 1, 1, 1, 1, 1},
            {8037567331, 14876830197, 92467925474973, 128033167847283, 18839824113, 18839824132, 18839824209, 86500064, 139607718, 11600321661, 16744219182, 114998633936467, 12342774692, 12342738005, 11990063212, 12342615103, 16146677425, 16885154916, 95969315881407, 126149151576998, 12650377005, 10553396797, 15264899199, 15264875793, 13280857565, 13280517902, 93363972541336, 18658232712, 18658242272, 133602782390697, 16493137815, 77013977646675, 11990049341, 17813502063, 12342784316, 15590377869, 136435782200054, 127233423640859, 15264863474, 13003024727, 78289377066764, 94475733362733, 15615642993, 88782964132646, 106392982825041, 99743560022172, 103135806954655, 105882235602655, 107109245239987, 107293851535602, 120665742891830, 77486416495383, 136815862212222, 117678270675654, 12563891331, 140635150752224, 83728028938556, 93221904910049, 116191042782774, 99755707652009, 78100899215950, 102479973401382, 110083047310010},
            "بنت اصفر"
        )
    end
})

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Remotes = ReplicatedStorage:WaitForChild("Remotes", 9e9)
local ChangeCharacterBody = Remotes:WaitForChild("ChangeCharacterBody", 9e9)
local WearRemote = Remotes:WaitForChild("Wear", 9e9)
local ChangeBodyColor = Remotes:WaitForChild("ChangeBodyColor", 9e9)
local localPlayer = Players.LocalPlayer

local function wearAsset(id)
    local args = { [1] = id }
    pcall(function()
        WearRemote:InvokeServer(unpack(args))
    end)
    task.wait(0.5)
end

local function changeBody(ids)
    local args = { [1] = ids }
    pcall(function()
        ChangeCharacterBody:InvokeServer(unpack(args))
    end)
    task.wait(2)
end

local function applySkin(changeIds, wearIds, skinName)
    task.spawn(function()
        changeBody(changeIds)
        for _, id in ipairs(wearIds) do
            wearAsset(id)
        end
        task.wait(1)
        local character = localPlayer.Character
        if character then
            local humanoid = character:FindFirstChild("Humanoid")
            if humanoid then
                humanoid.Health = 0
            end
        end
        local Sound = Instance.new("Sound", game:GetService("SoundService"))
        Sound.SoundId = "rbxassetid://8183296024"
        Sound:Play()
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Onyxen Hub",
            Text = "تم ارتداء سكن " .. skinName .. " بنجاح كامل!",
            Duration = 4
        })
    end)
end

SkinTab:AddSection({ Name = "يوجد مشكله الرأس لايرتدى في سكن البنات" })

SkinTab:AddSection({ Name = "سكنات تطقيم مصريه" })

SkinTab:AddButton({
    Name = "ولد 1",
    Callback = function()
        applySkin(
            {4637265517, 1, 1, 1, 1, 1},
            {7015405833, 5271888955, 139626774800903, 134082579, 86499666, 27112052, 27112039, 27112056, 14547141130, 11600321661, 106810508343012, 124765145869332, 115715495289805, 93993406355955, 123695349157584, 106537993816942, 12523694032, 15894552056, 15422147496, 15474908416, 16079358481, 12410992183, 12668628052, 109216506009477, 103135806954655, 11655528528, 11655508769, 118228858381482, 16290585600, 114318596016916, 18658232712, 75063100835024, 103484911220480, 132082048184937, 138680387336756, 82748628551739},
            "ولد 1"
        )
    end
})

SkinTab:AddButton({
    Name = "بنت 1",
    Callback = function()
        applySkin(
            {4571055698, 1, 1, 1, 1, 1},
            {114953095866235, 95982976169839, 121905293435818, 18839824113, 18839824132, 18839824209, 86500064, 139607718, 11600321661, 619537468, 619536621, 115715495289805, 2510233257, 2510240941, 15590383083, 16146677425, 12342615103, 12342738005, 16885149320, 10553396797, 136994122872489, 12650377005, 15264863474, 15264875793, 15264889909, 13280857565, 13206385231, 18431436143, 14575281021, 13002975349, 126999864773218, 12354068773, 135543013445657, 13059933311, 106939918547997, 120623165437473, 114521343169547, 103135806954655, 11773650702, 14136620469, 74101357014951, 99755707652009, 90306212836755, 118904168332667, 132082048184937, 11856087406},
            "بنت 1"
        )
    end
})

SkinTab:AddButton({
    Name = "ولد 2",
    Callback = function()
        applySkin(
            {5625858521, 1, 1, 1, 1, 1},
            {5138350104, 119701538092886, 139626774800903, 134082579, 86499666, 27112052, 27112039, 27112056, 14547162578, 18308506919, 619537468, 619536621, 1113742359, 658831500, 2510230574, 114521343169547, 89333149372236, 114126033878052, 103135806954655, 105882235602655, 13620518518, 109079544063122, 96748929996358, 74664900823981, 12523698801, 123957446170267, 113956624449425, 15474881355, 15422129985, 15597960489, 120912575896166, 130236014334019, 13978587354, 73406161906891, 89912013177546},
            "ولد 2"
        )
    end
})

SkinTab:AddButton({
    Name = "بنت 2",
    Callback = function()
        applySkin(
            {4571055698, 1, 1, 1, 1, 1},
            {9740445130, 16734007766, 746767604, 18839824113, 18839824132, 18839824209, 86500064, 139607718, 18308506919, 133304526526319, 619536621, 11600324801, 11600319649, 11600317961, 11600329588, 15264895091, 12650377005, 13206710824, 75913336240367, 74672562952517, 16885154916, 13280857565, 16146677425, 15264889909, 15264881807, 17170428998, 18431436143, 121639111800351, 114521343169547, 91654497062220, 13620518518, 98958105901287, 96748929996358, 18730136012, 15590377869, 16493137815, 15358571797, 15358579299, 13003268590, 140497487750684, 12342774692, 16512125956, 103292779587733, 134138279399984, 10954568687, 89912013177546, 79655671864620},
            "بنت 2"
        )
    end
})

SkinTab:AddButton({
    Name = "ولد 3",
    Callback = function()
        applySkin(
            {5625858521, 1, 1, 1, 1, 1},
            {13894732451, 84045854280167, 139626774800903, 134082579, 86499666, 27112052, 27112039, 27112056, 14547162578, 18308506919, 619537468, 619536621, 1113742359, 658831500, 2510230574, 114521343169547, 113602714328366, 91654497062220, 114126033878052, 103135806954655, 105882235602655, 13620518518, 109079544063122, 12523698801, 123957446170267, 113956624449425, 15474881355, 15422129985, 15597960489, 120912575896166, 130236014334019, 10791180072, 132267545932599, 85263730587370, 125305177060635, 122911280543984},
            "ولد 3"
        )
    end
})

SkinTab:AddButton({
    Name = "بنت 3",
    Callback = function()
        applySkin(
            {4571055698, 1, 1, 1, 1, 1},
            {15864550654, 84045854280167, 746767604, 18839824113, 18839824132, 18839824209, 86500064, 139607718, 18308506919, 133304526526319, 619536621, 11600324801, 11600319649, 11600317961, 11600329588, 15264895091, 12650377005, 13206710824, 75913336240367, 74672562952517, 16885154916, 13280857565, 16146677425, 15264889909, 15264881807, 17170428998, 18431436143, 121639111800351, 114521343169547, 91654497062220, 13620518518, 98958105901287, 96748929996358, 18730136012, 15590377869, 16493137815, 15358571797, 15358579299, 13003268590, 140497487750684, 12342774692, 132466907655678, 98010402623385, 111248839084939, 124214817185730, 119694360722474, 77980419438461, 85263730587370, 8356417938, 17359973018, 16512125956, 63689493},
            "بنت 3"
        )
    end
})

SkinTab:AddButton({
    Name = "ولد 4",
    Callback = function()
        applySkin(
            {5625858521, 1, 1, 1, 1, 1},
            {16450198916, 15644960961, 139626774800903, 134082579, 86499666, 27112052, 27112039, 27112056, 139607718, 18308506919, 619537468, 619536621, 1113742359, 658831500, 2510230574, 114521343169547, 116946086726003, 91654497062220, 114126033878052, 103135806954655, 105882235602655, 13620518518, 109079544063122, 76392410751948, 12483105503, 11856087406, 135378537725198, 15787493634, 77517965663412, 97174928376829, 136297131884524, 16290585600, 102528213498468, 95749238062454, 138140934376783, 105488922604915, 8356417938},
            "ولد 4"
        )
    end
})

SkinTab:AddButton({
    Name = "بنت 4",
    Callback = function()
        applySkin(
            {4571055698, 1, 1, 1, 1, 1},
            {10477410991, 4601512450, 746767604, 18839824113, 110127539411791, 108349951349566, 86500064, 139607718, 18308506919, 619537468, 619536621, 2510236649, 2510233257, 2510240941, 12342774692, 12342738005, 11990059649, 11990063212, 12342615103, 16146677425, 16885154916, 95969315881407, 11773650702, 126149151576998, 12650377005, 10553396797, 15264899199, 15264875793, 13280857565, 13280517902, 93363972541336, 14910000746, 18658232712, 18658242272, 130539280520278, 15590377869, 122652584267736, 17101991010, 129133192051965, 98708584730458, 129031729251903, 108566962765444, 114803851986112, 74101357014951, 77980419438461, 112917699473852, 122368442253003},
            "بنت 4"
        )
    end
})

SkinTab:AddButton({
    Name = "ولد 5",
    Callback = function()
        applySkin(
            {5625858521, 1, 1, 1, 1, 1},
            {129111600274209, 11418363533, 139626774800903, 134082579, 86499666, 27112052, 27112039, 27112056, 139607718, 11600321661, 619537468, 619536621, 1113752285, 1113751889, 1113754738, 1113752975, 103135806954655, 15598023320, 15349536713, 15547027816, 12410997561, 126841570867591, 12523688366, 125352260112516, 10789914680, 77341862253112, 8356417938},
            "ولد 5"
        )
    end
})

local BodyTab = Window:MakeTab({
    Title = "الأجساد",
    Icon = "rbxassetid://10734883598"
})

BodyTab:AddSection({ Name = "أجساد الأولاد الكاملة" })

BodyTab:AddButton({
    Name = "جسم طويل بساقين",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/bruton-lua-sources/Body/refs/heads/main/%D8%AC%D8%B3%D9%85%20%D8%B7%D9%88%D9%8A%D9%84%20%D8%A8%D8%B1%D8%AC%D9%84%D9%8A%D9%86"))()
    end
})

BodyTab:AddButton({
    Name = "جسم طويل بساق شبح يمين",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/bruton-lua-sources/Body/refs/heads/main/%D8%B7%D9%88%D9%8A%D9%84%20%D8%A8%D8%B1%D8%AC%D9%84%20%D8%B4%D8%A8%D8%AD%20%D9%8A%D9%85%D9%86%D9%89"))()
    end
})

BodyTab:AddButton({
    Name = "جسم طويل بساق شبح يسار",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/bruton-lua-sources/Body/refs/heads/main/%D8%B7%D9%88%D9%8A%D9%84%20%D8%A8%D8%B1%D8%AC%D9%84%20%D8%B4%D8%A8%D8%AD%20%D9%8A%D8%B3%D8%B1%D9%89"))()
    end
})

BodyTab:AddButton({
    Name = "جسم طويل بساق مقطوعة",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/bruton-lua-sources/Body/refs/heads/main/%D8%B7%D9%88%D9%8A%D9%84%20%D8%A8%D8%B1%D8%AC%D9%84%20%D9%85%D9%82%D8%B7%D9%88%D8%B9%D8%A9"))()
    end
})

BodyTab:AddButton({
    Name = "جسم طويل بساق مافيا يمين",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/bruton-lua-sources/Body/refs/heads/main/%D8%B7%D9%88%D9%8A%D9%84%20%D8%A8%D8%B1%D8%AC%D9%84%20%D9%85%D8%A7%D9%81%D9%8A%D8%A7%20%D9%8A%D9%85%D9%86%D8%A9"))()
    end
})

BodyTab:AddButton({
    Name = "جسم طويل بساق مافيا يسار",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/bruton-lua-sources/Body/refs/heads/main/%D8%B7%D9%88%D9%8A%D9%84%20%D8%A8%D8%B1%D8%AC%D9%84%20%D9%85%D8%A7%D9%81%D9%8A%D8%A7%20%D9%8A%D8%B3%D8%B1%D9%89"))()
    end
})

BodyTab:AddButton({
    Name = "جسم أنمي ولد",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/bruton-lua-sources/Body/refs/heads/main/%D8%AC%D8%B3%D9%85%20%D8%A7%D9%86%D9%85%D9%8A%202"))()
    end
})

BodyTab:AddButton({
    Name = "جسم وحش مطلوب",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/bruton-lua-sources/Body/refs/heads/main/%D9%85%D9%88%D9%86%D8%B3%D8%AA%D8%B1"))()
    end
})

BodyTab:AddButton({
    Name = "جسم تحول وحش",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/bruton-lua-sources/Body/refs/heads/main/%D9%85%D9%88%D8%B1%D9%81%D9%86"))()
    end
})

BodyTab:AddButton({
    Name = "جسم ترند",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/bruton-lua-sources/Body/refs/heads/main/%D8%AC%D8%B3%D9%85%20%D8%AA%D8%B1%D9%86%D8%AF"))()
    end
})

BodyTab:AddButton({
    Name = "جسم لطيف",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/bruton-lua-sources/Body/refs/heads/main/%D8%AC%D8%B3%D9%85%20%D9%83%D9%8A%D9%88%D8%AA%201"))()
    end
})

BodyTab:AddButton({
    Name = "جسم معضل",
    Callback = function()
        WearRemote:InvokeServer(139626774800903)
    end
})

BodyTab:AddButton({
    Name = "جسم ولد معضل",
    Callback = function()
        applySkin(
            {2517204456, 1, 1, 1, 1, 1},
            {2517207746, 77523632016364, 132497080002785, 98327719189062},
            ""
        )
    end
})

BodyTab:AddButton({
    Name = "جسم ولد معضل 2",
    Callback = function()
        applySkin(
            {92893876195279, 1, 1, 1, 1, 1},
            {102262728710700, 119944754814745, 133757109397390, 129543160215232},
            ""
        )
    end
})

BodyTab:AddButton({
    Name = "جسم ولد ريل",
    Callback = function()
        applySkin(
            {92565592431265, 1, 1, 1, 1, 1},
            {103224430842613, 82542418567050, 124836215743468, 116852226852049},
            ""
        )
    end
})

BodyTab:AddSection({ Name = "أجساد البنات الكاملة" })

BodyTab:AddButton({
    Name = "جسم بنت طويل بساقين",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/bruton-lua-sources/Body-2/refs/heads/main/%D8%AC%D8%B3%D9%85%20%D8%A8%D9%86%D8%AA%20%D8%B7%D9%88%D9%8A%D9%84%20%D8%A8%D8%B1%D8%AC%D9%84%D9%8A%D9%86"))()
    end
})

BodyTab:AddButton({
    Name = "جسم بنت طويل بساق شبح يمين",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/bruton-lua-sources/Body-2/refs/heads/main/%D8%AC%D8%B3%D9%85%20%D8%A8%D9%86%D8%AA%20%D8%B7%D9%88%D9%8A%D9%84%20%D8%A8%D8%B1%D8%AC%D9%84%20%D8%B4%D8%A8%D8%AD%20%D9%8A%D9%85%D9%86%D9%89"))()
    end
})

BodyTab:AddButton({
    Name = "جسم بنت طويل بساق شبح يسار",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/bruton-lua-sources/Body-2/refs/heads/main/%D8%AC%D8%B3%D9%85%20%D8%A8%D9%86%D8%AA%20%D8%B7%D9%88%D9%8A%D9%84%20%D8%A8%D8%B1%D8%AC%D9%84%20%D8%B4%D8%A8%D8%AD%20%D9%8A%D8%B3%D8%B1%D9%89"))()
    end
})

BodyTab:AddButton({
    Name = "جسم بنت طويل بساق مقطوعة",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/bruton-lua-sources/Body-2/refs/heads/main/%D8%AC%D8%B3%D9%85%20%D8%A8%D9%86%D8%AA%20%D8%B7%D9%88%D9%8A%D9%84%20%D8%A8%D8%B1%D8%AC%D9%84%20%D9%85%D9%82%D8%B7%D9%88%D8%B9%D8%A9"))()
    end
})

BodyTab:AddButton({
    Name = "جسم أنمي بنت",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/bruton-lua-sources/Body-2/refs/heads/main/%D8%AC%D8%B3%D9%85%20%D8%A8%D9%86%D8%AA%20%D8%A7%D9%86%D9%85%D9%8A"))()
    end
})

BodyTab:AddSection({ Name = "أجساد R6" })

BodyTab:AddButton({
    Name = "R6_مشيه قبل ارتداء السكن",
    Callback = function()
        applySkin(
            {93723227449632, 1, 1, 1, 1, 1},
            {75952534268236, 136267358649588, 134301892751246, 109010842145258},
            ""
        )
    end
})

BodyTab:AddButton({ Name = "R6_1", Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/bruton-lua-sources/R6/refs/heads/main/R61"))() end })
BodyTab:AddButton({ Name = "R6_2", Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/bruton-lua-sources/R6/refs/heads/main/R62"))() end })
BodyTab:AddButton({ Name = "R6_3", Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/bruton-lua-sources/R6/refs/heads/main/R63"))() end })
BodyTab:AddButton({ Name = "R6_4", Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/bruton-lua-sources/R6/refs/heads/main/R64"))() end })
BodyTab:AddButton({ Name = "R6_5", Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/bruton-lua-sources/R6/refs/heads/main/R67"))() end })
BodyTab:AddButton({ Name = "R6_1X1X1X", Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/bruton-lua-sources/R6/refs/heads/main/R6%5Cn1X1X1X1"))() end })
BodyTab:AddButton({ Name = "R6_بنت1", Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/bruton-lua-sources/R6/refs/heads/main/R6girl"))() end })
BodyTab:AddButton({ Name = "R6_بنت2", Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/bruton-lua-sources/R6/refs/heads/main/R6girl2"))() end })
BodyTab:AddButton({ Name = "R6_مقلوب", Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/bruton-lua-sources/R6/refs/heads/main/R6%D9%85%D9%82%D9%84%D9%88%D8%A8"))() end })

BodyTab:AddSection({ Name = "أجساد الأقزام" })

BodyTab:AddButton({ Name = "قزم 1", Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/bruton-lua-sources/Mini-body/refs/heads/main/%D9%82%D8%B2%D9%85%201"))() end })
BodyTab:AddButton({ Name = "قزم 2", Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/bruton-lua-sources/Mini-body/refs/heads/main/%D9%82%D8%B2%D9%85%202"))() end })
BodyTab:AddButton({ Name = "قزم 3", Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/bruton-lua-sources/Mini-body/refs/heads/main/%D9%82%D8%B2%D9%85%203"))() end })
BodyTab:AddButton({ Name = "قزم 4", Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/bruton-lua-sources/Mini-body/refs/heads/main/%D9%82%D8%B2%D9%85%204"))() end })
BodyTab:AddButton({ Name = "قزم 5", Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/bruton-lua-sources/Mini-body/refs/heads/main/%D9%82%D8%B2%D9%85%205"))() end })
BodyTab:AddButton({ Name = "قزم 6", Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/bruton-lua-sources/Mini-body/refs/heads/main/%D9%82%D8%B2%D9%85%206"))() end })
BodyTab:AddButton({ Name = "قزم 7", Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/bruton-lua-sources/Mini-body/refs/heads/main/%D9%82%D8%B2%D9%85%207"))() end })

local BoatsTab = Window:MakeTab({
    Title = "ترول قوارب",
    Icon = "rbxassetid://101969836917433"
})

BoatsTab:AddSection({ "القارب الخشبي" })

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer

local SelectedBoatPlayer = nil
local LastRandomBoat = nil

local function GetBoatPlayerNames()
    local t = {}
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer then
            table.insert(t, p.Name)
        end
    end
    return t
end

local BoatPlayerDropdown = BoatsTab:AddDropdown({
    Name = "اختيار اللاعب",
    Default = "",
    Multi = false,
    Options = GetBoatPlayerNames(),
    Callback = function(PlayerName)
        SelectedBoatPlayer = PlayerName
    end
})

BoatsTab:AddButton({
    Name = "تحديث قائمة اللاعبين",
    Callback = function()
        BoatPlayerDropdown:Set(GetBoatPlayerNames())
    end
})

BoatsTab:AddButton({
    Name = "قتل بالقارب الخشبي",
    Callback = function()
        if not SelectedBoatPlayer then return end
        local Target = Players:FindFirstChild(SelectedBoatPlayer)
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

BoatsTab:AddButton({
    Name = "دوران بالقارب الخشبي",
    Callback = function()
        if not SelectedBoatPlayer then return end
        local Target = Players:FindFirstChild(SelectedBoatPlayer)
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

BoatsTab:AddToggle({
    Name = "سحب بالقارب الخشبي",
    Default = false,
    Callback = function(Value)
        _G.PullToggleBoat = Value
        if _G.PullToggleBoat then
            task.spawn(function()
                if not SelectedBoatPlayer then return end
                local Target = Players:FindFirstChild(SelectedBoatPlayer)
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
                until Hum.Sit or Attempts > 50 or not _G.PullToggleBoat

                if not Hum.Sit then return end

                local TChar = Target.Character
                local TRoot = TChar:FindFirstChild("HumanoidRootPart")
                local THum = TChar:FindFirstChildOfClass("Humanoid")

                if TRoot and THum then
                    local Timer = tick()
                    while _G.PullToggleBoat and THum.Health > 0 and not THum.Sit and (tick() - Timer) < 15 do
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

BoatsTab:AddSection({ "الكل بالقارب الخشبي" })

BoatsTab:AddToggle({
    Name = "قتل الكل بالقارب الخشبي",
    Default = false,
    Callback = function(Value)
        _G.KillAllBoats = Value
        if _G.KillAllBoats then
            task.spawn(function()
                while _G.KillAllBoats do
                    for _, Target in ipairs(Players:GetPlayers()) do
                        if not _G.KillAllBoats then break end
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
                                    until Hum.Sit or Attempts > 40 or not _G.KillAllBoats

                                    if Hum.Sit then
                                        local Timer = tick()
                                        while THum.Health > 0 and not THum.Sit and _G.KillAllBoats and (tick() - Timer) < 10 do
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

BoatsTab:AddToggle({
    Name = "سحب الكل بالقارب الخشبي",
    Default = false,
    Callback = function(Value)
        _G.PullAllBoats = Value
        if _G.PullAllBoats then
            task.spawn(function()
                while _G.PullAllBoats do
                    for _, Target in ipairs(Players:GetPlayers()) do
                        if not _G.PullAllBoats then break end
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
                                if not _G.PullAllBoats then break end
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
                                until Hum.Sit or Attempts > 40 or not _G.PullAllBoats

                                if Hum.Sit then
                                    local Timer = tick()
                                    while _G.PullAllBoats and THum.Health > 0 and not THum.Sit and (tick() - Timer) < 10 do
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

BoatsTab:AddSection({ "عشوائي القارب الخشبي" })

local function GetRandomBoatTarget()
    local Available = {}
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p ~= LastRandomBoat and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
            local Hum = p.Character:FindFirstChildOfClass("Humanoid")
            if Hum and Hum.Health > 0 then
                table.insert(Available, p)
            end
        end
    end
    if #Available == 0 then
        LastRandomBoat = nil
        return GetRandomBoatTarget()
    end
    local Chosen = Available[math.random(1, #Available)]
    LastRandomBoat = Chosen
    return Chosen
end

BoatsTab:AddButton({
    Name = "قتل عشوائي بالقارب",
    Callback = function()
        local Target = GetRandomBoatTarget()
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

BoatsTab:AddToggle({
    Name = "سحب عشوائي بالقارب الخشبي",
    Default = false,
    Callback = function(Value)
        _G.PullRandomBoat = Value
        if not _G.PullRandomBoat then return end
        
        task.spawn(function()
            local Target = GetRandomBoatTarget()
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
            while _G.PullRandomBoat and THum.Health > 0 and not THum.Sit and (tick() - Timer) < 15 do
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

BoatsTab:AddButton({
    Name = "دوران عشوائي بالقارب الخشبي",
    Callback = function()
        local Target = GetRandomBoatTarget()
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

BoatsTab:AddSection({ "القارب العسكري" })

local MilitarySelected = nil
local LastRandomMilitary = nil

local MilitaryDropdown = BoatsTab:AddDropdown({
    Name = "اختيار اللاعب",
    Default = "",
    Multi = false,
    Options = GetBoatPlayerNames(),
    Callback = function(name)
        MilitarySelected = Players:FindFirstChild(name)
    end
})

BoatsTab:AddButton({
    Name = "تحديث قائمة اللاعبين",
    Callback = function()
        MilitaryDropdown:Set(GetBoatPlayerNames())
    end
})

BoatsTab:AddButton({
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

BoatsTab:AddButton({
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

BoatsTab:AddSection({ "الكل القارب العسكري" })

BoatsTab:AddButton({
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

BoatsTab:AddSection({ "عشوائي القارب العسكري" })

local function GetRandomMilitaryTarget()
    local Available = {}
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p ~= LastRandomMilitary and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
            local Hum = p.Character:FindFirstChildOfClass("Humanoid")
            if Hum and Hum.Health > 0 then
                table.insert(Available, p)
            end
        end
    end
    if #Available == 0 then
        LastRandomMilitary = nil
        return GetRandomMilitaryTarget()
    end
    local Chosen = Available[math.random(1, #Available)]
    LastRandomMilitary = Chosen
    return Chosen
end

BoatsTab:AddButton({
    Name = "V1 - فلنق عشوائي",
    Callback = function()
        local RandomTarget = GetRandomMilitaryTarget()
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

BoatsTab:AddButton({
    Name = "V2 - فلنق عشوائي",
    Callback = function()
        local RandomTarget = GetRandomMilitaryTarget()
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

BoatsTab:AddSection({ "قارب القرصان" })

local PirateSelected = nil
local LastRandomPirate = nil

local PirateDropdown = BoatsTab:AddDropdown({
    Name = "اختيار اللاعب",
    Default = "",
    Multi = false,
    Options = GetBoatPlayerNames(),
    Callback = function(name)
        PirateSelected = Players:FindFirstChild(name)
    end
})

BoatsTab:AddButton({
    Name = "تحديث قائمة اللاعبين",
    Callback = function()
        PirateDropdown:Set(GetBoatPlayerNames())
    end
})

BoatsTab:AddButton({
    Name = "فلنق قارب القرصان",
    Callback = function()
        local RS = game:GetService("ReplicatedStorage")
        local RunService = game:GetService("RunService")
        local Player = Players.LocalPlayer
        local Character = Player.Character or Player.CharacterAdded:Wait()
        local Humanoid = Character:WaitForChild("Humanoid")
        local RootPart = Character:WaitForChild("HumanoidRootPart")
        local Vehicles = workspace:WaitForChild("Vehicles")

        if not PirateSelected then return end
        local target = PirateSelected
        if not target or not target.Character then return end

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

BoatsTab:AddSection({ "الكل قارب القرصان" })

BoatsTab:AddButton({
    Name = "فلنق الكل قارب القرصان",
    Callback = function()
        local RS = game:GetService("ReplicatedStorage")
        local RunService = game:GetService("RunService")
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

BoatsTab:AddSection({ "عشوائي قارب القرصان" })

local function GetRandomPirateTarget()
    local Available = {}
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p ~= LastRandomPirate and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
            local Hum = p.Character:FindFirstChildOfClass("Humanoid")
            if Hum and Hum.Health > 0 then
                table.insert(Available, p)
            end
        end
    end
    if #Available == 0 then
        LastRandomPirate = nil
        return GetRandomPirateTarget()
    end
    local Chosen = Available[math.random(1, #Available)]
    LastRandomPirate = Chosen
    return Chosen
end

BoatsTab:AddButton({
    Name = "فلنق عشوائي قارب القرصان",
    Callback = function()
        local RS = game:GetService("ReplicatedStorage")
        local RunService = game:GetService("RunService")
        local Player = Players.LocalPlayer
        local Character = Player.Character or Player.CharacterAdded:Wait()
        local Humanoid = Character:WaitForChild("Humanoid")
        local RootPart = Character:WaitForChild("HumanoidRootPart")
        local Vehicles = workspace:WaitForChild("Vehicles")

        local RandomTarget = GetRandomPirateTarget()
        if not RandomTarget then return end

        local target = RandomTarget
        if not target or not target.Character then return end

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

local MiscTab = Window:MakeTab({
    Title = "ترول متنوع",
    Icon = "rbxassetid://87060218582359"
})

MiscTab:AddSection({ "البيت" })

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer

local SelectedHousePlayer = nil
local LastRandomHouse = nil
local AutoBanActive = false

local function GetHousePlayerList()
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

local HousePlayerDropdown = MiscTab:AddDropdown({
    Name = "اختيار اللاعب",
    Options = GetHousePlayerList(),
    Default = "",
    Callback = function(Value)
        SelectedHousePlayer = Value
    end
})

MiscTab:AddButton({
    Name = "تحديث قائمة اللاعبين",
    Callback = function()
        HousePlayerDropdown:Refresh(GetHousePlayerList(), true)
    end
})

MiscTab:AddButton({
    Name = "حظر وقتل بالبيت",
    Callback = function()
        if not SelectedHousePlayer then return end
        local Target = Players:FindFirstChild(SelectedHousePlayer)
        if Target then
            HouseBanKill(Target)
        end
    end
})

MiscTab:AddSection({ "الكل بالبيت" })

MiscTab:AddToggle({
    Name = "حظر وقتل الكل بالبيت",
    Default = false,
    Callback = function(State)
        AutoBanActive = State
        if State then
            task.spawn(function()
                while AutoBanActive do
                    for _, p in ipairs(Players:GetPlayers()) do
                        if not AutoBanActive then break end
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

MiscTab:AddSection({ "عشوائي بالبيت" })

local function GetRandomHouseTarget()
    local Available = {}
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p ~= LastRandomHouse and p.Character and p.Character:FindFirstChild("Humanoid") then
            local Hum = p.Character:FindFirstChildOfClass("Humanoid")
            if Hum and Hum.Health > 0 then
                table.insert(Available, p)
            end
        end
    end
    if #Available == 0 then
        LastRandomHouse = nil
        return GetRandomHouseTarget()
    end
    local Chosen = Available[math.random(1, #Available)]
    LastRandomHouse = Chosen
    return Chosen
end

MiscTab:AddButton({
    Name = "حظر وقتل عشوائي بالبيت",
    Callback = function()
        local Target = GetRandomHouseTarget()
        if Target then
            HouseBanKill(Target)
        end
    end
})

MiscTab:AddSection({ "سكاي بوكس" })

local SkyboxSettings = {
    enabled = false,
    track = nil,
    rigidTrack = nil,
    savedBody = {}
}

local function StopSkyboxAnimations()
    if SkyboxSettings.rigidTrack then
        pcall(function()
            SkyboxSettings.rigidTrack:Stop()
            SkyboxSettings.rigidTrack:Destroy()
        end)
        SkyboxSettings.rigidTrack = nil
    end
    
    if SkyboxSettings.track then
        pcall(function()
            SkyboxSettings.track:Stop()
            SkyboxSettings.track:Destroy()
        end)
        SkyboxSettings.track = nil
    end
end

MiscTab:AddToggle({
    Name = "سكاي بوكس V1",
    Default = false,
    Callback = function(value)
        if value then
            local player = game.Players.LocalPlayer
            local character = player.Character
            
            if character then
                local humanoid = character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    local description = humanoid:GetAppliedDescription()
                    
                    SkyboxSettings.savedBody = {
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
                    
                    SkyboxSettings.track = humanoid:LoadAnimation(newAnim)
                    SkyboxSettings.track.Priority = Enum.AnimationPriority.Action4
                    SkyboxSettings.track:Play(0.1, 1, 0.01)
                    
                    task.wait(0.5)
                    
                    local plankAnim = Instance.new("Animation")
                    plankAnim.AnimationId = "rbxassetid://3695333486"
                    SkyboxSettings.rigidTrack = humanoid:LoadAnimation(plankAnim)
                    SkyboxSettings.rigidTrack.Priority = Enum.AnimationPriority.Movement
                    SkyboxSettings.rigidTrack:Play(0.1, 1, 0)
                end
            end
        else
            StopSkyboxAnimations()
            
            task.wait(0.2)
            
            if next(SkyboxSettings.savedBody) then
                local player = game.Players.LocalPlayer
                local character = player.Character
                
                if character then
                    local humanoid = character:FindFirstChildOfClass("Humanoid")
                    if humanoid then
                        local restoreBody = {
                            [1] = SkyboxSettings.savedBody.Torso,
                            [2] = SkyboxSettings.savedBody.RightArm,
                            [3] = SkyboxSettings.savedBody.LeftArm,
                            [4] = SkyboxSettings.savedBody.RightLeg,
                            [5] = SkyboxSettings.savedBody.LeftLeg,
                            [6] = SkyboxSettings.savedBody.Head
                        }
                        
                        local args = {
                            [1] = restoreBody
                        }
                        
                        pcall(function()
                            game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))
                        end)
                        
                        SkyboxSettings.savedBody = {}
                    end
                end
            end
        end
    end
})

local FlashSettings = {
    enabled = false,
    track = nil,
    rigidTrack = nil,
    savedBody = {}
}

local function StopFlashAnimations()
    if FlashSettings.rigidTrack then
        pcall(function()
            FlashSettings.rigidTrack:Stop()
            FlashSettings.rigidTrack:Destroy()
        end)
        FlashSettings.rigidTrack = nil
    end
    
    if FlashSettings.track then
        pcall(function()
            FlashSettings.track:Stop()
            FlashSettings.track:Destroy()
        end)
        FlashSettings.track = nil
    end
end

MiscTab:AddToggle({
    Name = "سكاي بوكس V2",
    Default = false,
    Callback = function(value)
        if value then
            local player = game.Players.LocalPlayer
            local character = player.Character
            
            if character then
                local humanoid = character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    local description = humanoid:GetAppliedDescription()
                    
                    FlashSettings.savedBody = {
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
                    
                    FlashSettings.track = humanoid:LoadAnimation(newAnim)
                    FlashSettings.track.Priority = Enum.AnimationPriority.Action4
                    FlashSettings.track:Play(0.1, 1, 1)
                    
                    task.wait(0.1)
                    FlashSettings.track:AdjustSpeed(5)
                    
                    task.wait(0.3)
                    
                    local plankAnim = Instance.new("Animation")
                    plankAnim.AnimationId = "rbxassetid://3695333486"
                    FlashSettings.rigidTrack = humanoid:LoadAnimation(plankAnim)
                    FlashSettings.rigidTrack.Priority = Enum.AnimationPriority.Movement
                    FlashSettings.rigidTrack:Play(0.1, 1, 0)
                end
            end
        else
            StopFlashAnimations()
            
            task.wait(0.2)
            
            if next(FlashSettings.savedBody) then
                local player = game.Players.LocalPlayer
                local character = player.Character
                
                if character then
                    local humanoid = character:FindFirstChildOfClass("Humanoid")
                    if humanoid then
                        local restoreBody = {
                            [1] = FlashSettings.savedBody.Torso,
                            [2] = FlashSettings.savedBody.RightArm,
                            [3] = FlashSettings.savedBody.LeftArm,
                            [4] = FlashSettings.savedBody.RightLeg,
                            [5] = FlashSettings.savedBody.LeftLeg,
                            [6] = FlashSettings.savedBody.Head
                        }
                        
                        local args = {
                            [1] = restoreBody
                        }
                        
                        pcall(function()
                            game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))
                        end)
                        
                        FlashSettings.savedBody = {}
                    end
                end
            end
        end
    end
})

local LoopAnimV3 = false
local CurrentTrackV3 = nil
local InitializedV3 = false

local function ApplyFreshBangV3()
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
        game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))
    end)
end

local function PlayAnimationV3()
    local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local humanoid = char:WaitForChild("Humanoid")
    local animator = humanoid:FindFirstChildOfClass("Animator") or Instance.new("Animator", humanoid)

    local anim = Instance.new("Animation")
    anim.AnimationId = "rbxassetid://70883871260184"

    local track = animator:LoadAnimation(anim)
    track.Priority = Enum.AnimationPriority.Action
    track.Looped = false
    track:Play()

    CurrentTrackV3 = track
end

local function StopEverythingV3()
    LoopAnimV3 = false

    if CurrentTrackV3 then
        pcall(function()
            CurrentTrackV3:Stop()
        end)
        CurrentTrackV3 = nil
    end

    pcall(function()
        game:GetService("ReplicatedStorage").Remotes.ResetCharacterAppearance:FireServer()
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

MiscTab:AddToggle({
    Name = "سكاي بوكس V3",
    Default = false,
    Callback = function(Value)
        if not InitializedV3 then
            InitializedV3 = true
            return
        end

        if Value then
            if LoopAnimV3 then return end
            LoopAnimV3 = true

            task.spawn(function()
                while LoopAnimV3 do
                    PlayAnimationV3()
                    task.wait(0.1)
                end
            end)

            task.delay(1.2, ApplyFreshBangV3)
        else
            StopEverythingV3()
        end
    end
})

local CarTab = Window:MakeTab({
    Title = "السيارة",
    Icon = "rbxassetid://10709789810"
})

CarTab:AddSection({ Name = "السرعة والتيربو مجاناً" })
local speedValue = 200
local turboValue = 11.3

local function getAllCars()
    local cars = {}
    if workspace:FindFirstChild("Vehicles") then
        for _, vehicle in pairs(workspace.Vehicles:GetChildren()) do
            if vehicle:FindFirstChild("Seats") and vehicle.Seats:FindFirstChild("VehicleSeat") then
                table.insert(cars, vehicle)
            end
        end
    end
    return cars
end

local function applyToAllCars(valueType, value)
    local cars = getAllCars()
    local carsModified = 0

    for _, car in pairs(cars) do
        local seat = car.Seats.VehicleSeat
        local target = seat:FindFirstChild(valueType)

        if target and target.Value ~= nil then
            target.Value = value
            carsModified += 1
        else
            pcall(function()
                seat[valueType] = value
                carsModified += 1
            end)
        end
    end

    newNotify("تم", "تم تعديل " .. carsModified .. " سيارة")
end


CarTab:AddTextBox({
    Title = "السرعة",
    Placeholder = "مثال: 300",
    Callback = function(text)
        local num = tonumber(text)
        if num then
            speedValue = num
            newNotify("جاهز", "تم تحديد السرعة : " .. num)
        else
            newNotify("خطأ", "أدخل رقم صحيح")
        end
    end
})

CarTab:AddTextBox({
    Title = "التيربو",
    Placeholder = "مثال: 15",
    Callback = function(text)
        local num = tonumber(text)
        if num then
            turboValue = num
            newNotify("جاهز", "تم تحديد التيربو : " .. num)
        else
            newNotify("خطأ", "أدخل رقم صحيح")
        end
    end
})

CarTab:AddButton({
    Title = "تطبيق السرعة",
    Callback = function()
        applyToAllCars("MaxSpeed", speedValue)
    end
})

CarTab:AddButton({
    Title = "تطبيق التيربو",
    Callback = function()
        applyToAllCars("Turbo", turboValue)
    end
})
CarTab:AddSection({ Name = "مرح مع السيارة" })
local CurrentDecal = ""
local CurrentVehicleUUID = nil

local function ApplyDecal(decalId)
    if not CurrentVehicleUUID then return end
    
    local formattedDecal = "http://www.roblox.com/asset/?id=" .. decalId
    
    pcall(function()
        local Remote = game:GetService("ReplicatedStorage").Remotes.SuspensionHeightChanged
        firesignal(Remote.OnClientEvent, CurrentVehicleUUID)
        
        game:GetService("ReplicatedStorage").Remotes.ApplyStateToVehicle:InvokeServer(
            CurrentVehicleUUID,
            {
                ["Lights"] = {
                    ["hazardsActive"] = false,
                    ["lightsOn"] = false,
                },
                ["IsLocked"] = false,
                ["Appearance"] = {
                    ["IsSmoking"] = false,
                    ["SuspensionHeight"] = 1.1,
                    ["BabyCarSeatInstalledNumber"] = 0,
                    ["IsOnFire"] = false,
                    ["WheelDecal"] = formattedDecal,
                },
                ["Performance"] = {
                    ["Turbo"] = 0,
                    ["MaxSpeed"] = 25,
                    ["DriftStrength"] = 1,
                },
                ["Owner"] = game:GetService("Players").LocalPlayer,
            }
        )
    end)
end

game:GetService("ReplicatedStorage").Remotes.PlayerSpawnedVehicle.OnClientEvent:Connect(function(data)
    if data and data.uuid then
        CurrentVehicleUUID = data.uuid
    end
end)

CarTab:AddTextBox({
    Name = "ملصق العجلات",
    Description = "ضع معرف الصورة وسوف تتغير مع العجلات",
    Default = "",
    PlaceholderText = "93386023056221",
    ClearText = false,
    Callback = function(text)
        if text and text:gsub(" ", ""):len() > 0 then
            local cleanId = text:match("%d+")
            if cleanId then
                CurrentDecal = cleanId
            end
        end
    end
})

CarTab:AddButton({
    Name = "تطبيق الصورة",
    Callback = function()
        if CurrentDecal and CurrentDecal:len() > 0 then
            ApplyDecal(CurrentDecal)
        end
    end
})

CarTab:AddToggle({
    Name = "تكرار الأضواء الأمامية",
    Default = false,
    Callback = function(value)
        spammingHeadLights = value
        if spammingHeadLights then
            spawn(spamHeadLights)
        else
            wait(0.2)
            ReplicatedStorage.Remotes.ToggleHeadLights:InvokeServer()
        end
    end
})

CarTab:AddToggle({
    Name = "تكرار أضواء الخطر",
    Default = false,
    Callback = function(value)
        spammingHazardLights = value
        if spammingHazardLights then
            spawn(spamHazardLights)
        else
            wait(0.2)
            ReplicatedStorage.Remotes.ToggleHazardLights:InvokeServer()
        end
    end
})

CarTab:AddButton({
    Name = "سكربت طيران السيارة",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/raelhubfunctions/Save-scripts/refs/heads/main/CarMobile.lua"))()
    end
})
CarTab:AddButton({
    Name = "تيربو V3",
    Callback = function()
     local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")

local flying = false
local speed = 30

local screenGui = Instance.new("ScreenGui", player.PlayerGui)

local function createImageButton(name, position, imageId, rotation, action)
    local button = Instance.new("ImageButton", screenGui)
    button.Size = UDim2.new(0, 60, 0, 60)
    button.Position = position
    button.BackgroundTransparency = 1
    button.Image = "rbxassetid://" .. imageId
    button.Rotation = rotation
    button.MouseButton1Down:Connect(action)
    return button
end

local forwardButton = createImageButton("ForwardButton", UDim2.new(0, 10, 0.35, 0), "18478249606", 0, function()
    flying = true
    while flying do
        if humanoidRootPart then
            humanoidRootPart.Velocity = humanoidRootPart.CFrame.LookVector * speed
        end
        task.wait()
    end
end)

local backButton = createImageButton("BackButton", UDim2.new(0, 10, 0.5, 0), "18478249606", 180, function()
    flying = true
    while flying do
        if humanoidRootPart then
            humanoidRootPart.Velocity = -humanoidRootPart.CFrame.LookVector * speed
        end
        task.wait()
    end
end)

local leftButton = createImageButton("LeftButton", UDim2.new(1, -210, 0.3, 0), "18478249606", -90, function()
    flying = true
    while flying do
        if humanoidRootPart then
            humanoidRootPart.Velocity = -humanoidRootPart.CFrame.RightVector * speed
        end
        task.wait()
    end
end)

local rightButton = createImageButton("RightButton", UDim2.new(1, -140, 0.3, 0), "18478249606", 90, function()
    flying = true
    while flying do
        if humanoidRootPart then
            humanoidRootPart.Velocity = humanoidRootPart.CFrame.RightVector * speed
        end
        task.wait()
    end
end)

local function stopFlying()
    flying = false
    if humanoidRootPart then
        humanoidRootPart.Velocity = Vector3.new(0, 0, 0)
    end
end

forwardButton.MouseButton1Up:Connect(stopFlying)
backButton.MouseButton1Up:Connect(stopFlying)
leftButton.MouseButton1Up:Connect(stopFlying)
rightButton.MouseButton1Up:Connect(stopFlying)

local turboButton = Instance.new("ImageButton", screenGui)
turboButton.Size = UDim2.new(0, 60, 0, 60)
turboButton.Position = UDim2.new(1, -130, 0, 10)
turboButton.BackgroundTransparency = 1
turboButton.Image = "rbxassetid://97607579386418"
turboButton.MouseButton1Down:Connect(function()
    speed = 300
end)

local minimizeButton = Instance.new("TextButton", screenGui)
minimizeButton.Size = UDim2.new(0, 60, 0, 60)
minimizeButton.Position = UDim2.new(0, 10, 0, 10)
minimizeButton.BackgroundTransparency = 1
minimizeButton.Text = "-"
minimizeButton.TextSize = 40
minimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)

local buttons = {forwardButton, backButton, leftButton, rightButton, turboButton}

local minimized = false

local function toggleButtons()
    minimized = not minimized
    for _, button in ipairs(buttons) do
        button.Visible = not minimized
    end
    if minimized then
        minimizeButton.Text = "+"
    else
        minimizeButton.Text = "-"
    end
end

minimizeButton.MouseButton1Down:Connect(toggleButtons)    
    end
})
local carList = {
    "SchoolBus", "SmartCar", "FarmTruck", "Cadillac", "Excavator",
    "Jeep", "NascarTruck", "TowTruck", "Snowplow", "MilitaryTruck",
    "Tank", "Limo", "FireTruck"
}

local spamCarsActive = false

local function spawnCar(carName)
    local args = {
        [1] = "PickingCar",
        [2] = carName
    }
    game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(args))
end

CarTab:AddToggle({
    Name = "تكرار السيارات",
    Default = false,
    Callback = function(state)
        spamCarsActive = state
        if spamCarsActive then
            task.spawn(function()
                while spamCarsActive do
                    for _, carName in ipairs(carList) do
                        if not spamCarsActive then break end
                        spawnCar(carName)
                        wait(0.4)
                    end
                end
            end)
        end
    end
})

local HouseTab = Window:MakeTab({
    Title = "البيت",
    Icon = "rbxassetid://10723407389"
})

HouseTab:AddParagraph({"─── ممكن يكون في اخطاء في المميزات ───"})

HouseTab:AddParagraph({"─── التحكم الرئيسي بالبيت ───"})

HouseTab:AddTextBox({
    Name = "تغيير اسم البيت",
    Default = "",
    PlaceholderText = "اكتب الاسم الجديد للبيت",
    Callback = function(value)
        local args = {
            "BusinessName",
            value
        }
        game:GetService("ReplicatedStorage").RE:FindFirstChild("1RPHous1eEven1t"):FireServer(unpack(args))
    end
})

local rainbowHouseActive = false
HouseTab:AddToggle({
    Name = "ألوان متحركة للبيت (RGB)",
    Default = false,
    Callback = function(state)
        rainbowHouseActive = state
        if state then
            task.spawn(function()
                local time = 0
                while rainbowHouseActive do
                    local color = Color3.fromHSV((time % 1), 1, 1)
                    local args = {
                        "ColorPickHouse",
                        color
                    }
                    local event = game:GetService("ReplicatedStorage"):FindFirstChild("RE") and game:GetService("ReplicatedStorage").RE:FindFirstChild("1Player1sHous1e")
                    if event then
                        pcall(function()
                            event:FireServer(unpack(args))
                        end)
                    end
                    task.wait(0.1)
                    time = time + 0.02
                end
            end)
        end
    end
})

HouseTab:AddTextBox({
    Name = "كود الاغنية",
    Default = "",
    PlaceholderText = "ادخل كود الاغنية",
    Callback = function(value)
        _G.MusicCode = value
    end
})

HouseTab:AddButton({
    Name = "تشغيل الموسيقى",
    Callback = function()
        local value = _G.MusicCode
        if not value or value == "" then
            warn("Onyxen Hub: لم يتم ادخال كود الاغنية")
            return
        end
        
        local RE = game:GetService("ReplicatedStorage"):FindFirstChild("RE")
        if not RE then
            warn("Onyxen Hub: خطأ")
            return
        end
        
        local Events = {
            RE:FindFirstChild("1Player1sHous1e"),
            RE:FindFirstChild("1RPHous1eEven1t"),
            RE:FindFirstChild("1Hous1eMus1ic"),
            RE:FindFirstChild("1Playe1rHous1e"),
            RE:FindFirstChild("HouseMusic")
        }
        
        local MusicTypes = {
            "PickHouseMusicText",
            "PlayMusic",
            "HouseMusic",
            "MusicID",
            "SetMusic",
            "PickMusic",
            "MusicText",
            "PlayHouseMusic",
            "ChangeMusic",
            "SetHouseMusic"
        }
        
        local success = false
        
        for _, Event in ipairs(Events) do
            if Event then
                for _, MusicType in ipairs(MusicTypes) do
                    local args = {
                        [1] = MusicType,
                        [2] = value
                    }
                    local worked, err = pcall(function()
                        Event:FireServer(unpack(args))
                    end)
                    if worked then
                        success = true
                        break
                    end
                end
                if success then break end
            end
        end
        
        if success then
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "Onyxen Hub",
                Text = "تم تشغيل الموسيقى بنجاح",
                Duration = 2
            })
        else
            warn("Onyxen Hub: فشل تشغيل الموسيقى - تأكد من الكود")
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "Onyxen Hub",
                Text = "فشل تشغيل الموسيقى - جرب كود صحيح",
                Duration = 3
            })
        end
    end
})

HouseTab:AddParagraph({"─── البيت الخاص (أبواب + شبابيك + كراج + جرس + طرق) ───"})

local spamAllActive = false
HouseTab:AddToggle({
    Name = "سبام شامل (أبواب + شبابيك + كراج)",
    Default = false,
    Callback = function(state)
        spamAllActive = state
        if state then
            task.spawn(function()
                local RE = game:GetService("ReplicatedStorage").RE:FindFirstChild("1Player1sHous1e")
                while spamAllActive do
                    RE:FireServer("LockDoors")
                    wait(0.3)
                    RE:FireServer("Curtains")
                    wait(0.3)
                    RE:FireServer("GarageDoor")
                    wait(0.3)
                end
            end)
        end
    end
})

local loopTravaPorta = false
HouseTab:AddToggle({
    Name = "سبام فتح وغلق الأبواب",
    Default = false,
    Callback = function(state)
        loopTravaPorta = state
        if state then
            task.spawn(function()
                local RE = game:GetService("ReplicatedStorage").RE:FindFirstChild("1Player1sHous1e")
                while loopTravaPorta do
                    RE:FireServer("LockDoors")
                    wait(0.5)
                end
            end)
        end
    end
})

local runningCurtains = false
HouseTab:AddToggle({
    Name = "سبام فتح وغلق الشبابيك",
    Default = false,
    Callback = function(state)
        runningCurtains = state
        if state then
            task.spawn(function()
                local RE = game:GetService("ReplicatedStorage").RE:FindFirstChild("1Player1sHous1e")
                while runningCurtains do
                    RE:FireServer("Curtains")
                    wait(0.5)
                end
            end)
        end
    end
})

local runningGarage = false
HouseTab:AddToggle({
    Name = "سبام فتح وغلق الكراج",
    Default = false,
    Callback = function(state)
        runningGarage = state
        if state then
            task.spawn(function()
                local RE = game:GetService("ReplicatedStorage").RE:FindFirstChild("1Player1sHous1e")
                while runningGarage do
                    RE:FireServer("GarageDoor")
                    wait(0.5)
                end
            end)
        end
    end
})

HouseTab:AddParagraph({"─── الانتقال للبيوت ───"})

local casas = {
    ["House 1"] = Vector3.new(260.29, 4.37, 209.32),
    ["House 2"] = Vector3.new(234.49, 4.37, 228.00),
    ["House 3"] = Vector3.new(262.79, 21.37, 210.84),
    ["House 4"] = Vector3.new(229.60, 21.37, 225.40),
    ["House 5"] = Vector3.new(173.44, 21.37, 228.11),
    ["House 6"] = Vector3.new(-43, 21, -137),
    ["House 7"] = Vector3.new(-40, 36, -137),
    ["House 11"] = Vector3.new(-21, 40, 436),
    ["House 12"] = Vector3.new(155, 37, 433),
    ["House 13"] = Vector3.new(255, 35, 431),
    ["House 14"] = Vector3.new(254, 38, 394),
    ["House 15"] = Vector3.new(148, 39, 387),
    ["House 16"] = Vector3.new(-17, 42, 395),
    ["House 17"] = Vector3.new(-189, 37, -247),
    ["House 18"] = Vector3.new(-354, 37, -244),
    ["House 19"] = Vector3.new(-456, 36, -245),
    ["House 20"] = Vector3.new(-453, 38, -295),
    ["House 21"] = Vector3.new(-356, 38, -294),
    ["House 22"] = Vector3.new(-187, 37, -295),
    ["House 23"] = Vector3.new(-410, 68, -447),
    ["House 24"] = Vector3.new(-348, 69, -496),
    ["House 28"] = Vector3.new(-103, 12, 1087),
    ["House 29"] = Vector3.new(-730, 6, 808),
    ["House 30"] = Vector3.new(-245, 7, 822),
    ["House 31"] = Vector3.new(639, 76, -361),
    ["House 32"] = Vector3.new(-908, 6, -361),
    ["House 33"] = Vector3.new(-111, 70, -417),
    ["House 34"] = Vector3.new(230, 38, 569),
    ["House 35"] = Vector3.new(-30, 13, 2209)
}

local houseNames = {}
for name, _ in pairs(casas) do
    table.insert(houseNames, name)
end
table.sort(houseNames, function(a, b)
    local numA = tonumber(a:match("%d+")) or 0
    local numB = tonumber(b:match("%d+")) or 0
    return numA < numB
end)

local selectedTeleportHouse = nil

HouseTab:AddDropdown({
    Name = "اختر البيت للانتقال",
    Options = houseNames,
    Default = "",
    Callback = function(house)
        selectedTeleportHouse = house
    end
})

HouseTab:AddButton({
    Name = "الانتقال للبيت المختار",
    Callback = function()
        if not selectedTeleportHouse then
            return
        end
        local targetPos = casas[selectedTeleportHouse]
        if targetPos then
            local character = game:GetService("Players").LocalPlayer.Character
            if character then
                character.HumanoidRootPart.CFrame = CFrame.new(targetPos)
            end
        end
    end
})

HouseTab:AddParagraph({"─── إزالة الحظر من البيوت ───"})

HouseTab:AddButton({
    Name = "إزالة الحظر من كل البيوت",
    Callback = function()
        local successCount = 0
        for i = 1, 37 do
            local bannedBlockName = "BannedBlock" .. i
            local bannedBlock = workspace:FindFirstChild(bannedBlockName, true)
            if bannedBlock then
                pcall(function()
                    bannedBlock:Destroy()
                    successCount = successCount + 1
                end)
            end
        end
        for _, house in pairs(workspace:GetDescendants()) do
            if house.Name:match("BannedBlock") then
                pcall(function()
                    house:Destroy()
                    successCount = successCount + 1
                end)
            end
        end
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Onyxen Hub",
            Text = "تم إزالة الحظر من " .. successCount .. " بيت",
            Duration = 3
        })
    end
})

local autoRemoveBan = false
HouseTab:AddToggle({
    Name = "إزالة الحظر التلقائي",
    Default = false,
    Callback = function(state)
        autoRemoveBan = state
        while autoRemoveBan do
            for i = 1, 37 do
                local bannedBlock = workspace:FindFirstChild("BannedBlock" .. i, true)
                if bannedBlock then
                    pcall(function()
                        bannedBlock:Destroy()
                    end)
                end
            end
            task.wait(1)
        end
    end
})

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VirtualUser = game:GetService("VirtualUser")
local LocalPlayer = Players.LocalPlayer

local PointsTab = Window:MakeTab({
    Title = "صملة / تتبع",
    Icon = "rbxassetid://13364900349"
})

PointsTab:AddButton({
    Name = "سكربت تتبع (مافي مثله والله)",
    Callback = function()
        loadstring(game:HttpGet("https://encrypt-x.pages.dev/Scripts?Id=15512944923"))("15512944923")
    end
})

PointsTab:AddSection({
    Name = "معلومات السيرفر"
})

PointsTab:AddButton({
    Name = "عدد اللاعبين",
    Callback = function()
        local playerCount = #game.Players:GetPlayers()
        game.StarterGui:SetCore("SendNotification", {
            Title = "عدد اللاعبين",
            Text = "عدد اللاعبين في السيرفر: " .. playerCount,
            Duration = 5
        })
    end
})

PointsTab:AddButton({
    Name = "سرعة الاتصال",
    Callback = function()
        local ping = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
        game.StarterGui:SetCore("SendNotification", {
            Title = "حالة الاتصال",
            Text = "الـ Ping الحالي: " .. ping .. " MS",
            Duration = 4
        })
    end
})

PointsTab:AddButton({
    Name = "عدد الإطارات",
    Callback = function()
        local fps = math.floor(1 / game:GetService("RunService").RenderStepped:Wait())
        game.StarterGui:SetCore("SendNotification", {
            Title = "الأداء",
            Text = "عدد الإطارات: " .. fps .. " FPS",
            Duration = 3
        })
    end
})

PointsTab:AddSection({
    Name = "معلومات اللاعب"
})

PointsTab:AddButton({
    Name = "عرض احداثياتك",
    Callback = function()
        local character = game.Players.LocalPlayer.Character
        if character and character:FindFirstChild("HumanoidRootPart") then
            local position = character.HumanoidRootPart.Position
            game.StarterGui:SetCore("SendNotification", {
                Title = "احداثياتك",
                Text = "X: " .. math.floor(position.X) .. "\nY: " .. math.floor(position.Y) .. "\nZ: " .. math.floor(position.Z),
                Duration = 6
            })
        else
            game.StarterGui:SetCore("SendNotification", {
                Title = "خطأ",
                Text = "تعذر العثور على موقعك",
                Duration = 3
            })
        end
    end
})

PointsTab:AddSection({
    Name = "التنقل بين السيرفرات"
})

PointsTab:AddButton({
    Name = "عرض ايدي السيرفر",
    Callback = function()
        local jobId = game.JobId
        game.StarterGui:SetCore("SendNotification", {
            Title = "ايدي السيرفر",
            Text = "ايدي السيرفر: " .. jobId,
            Duration = 8
        })
    end
})

PointsTab:AddButton({
    Name = "نسخ ايدي السيرفر",
    Callback = function()
        local jobId = game.JobId
        setclipboard(jobId)
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم النسخ",
            Text = "تم نسخ ايدي السيرفر إلى الحافظة",
            Duration = 3
        })
    end
})

PointsTab:AddSection({
    Name = "الانتقال بالايدي"
})

local ServerIdBox = PointsTab:AddTextBox({
    Name = "أدخل ايدي السيرفر",
    Placeholder = "ضع ايدي السيرفر هنا"
})

PointsTab:AddButton({
    Name = "انتقال للايدي المدخل",
    Callback = function()
        local serverId = ServerIdBox:Get()
        if serverId and serverId ~= "" then
            game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, serverId, game.Players.LocalPlayer)
        else
            game.StarterGui:SetCore("SendNotification", {
                Title = "خطأ",
                Text = "الرجاء إدخال ايدي السيرفر أولاً",
                Duration = 3
            })
        end
    end
})

PointsTab:AddSection({
    Name = "خيارات سريعة"
})

PointsTab:AddButton({
    Name = "اعادة الدخول للسيرفر",
    Callback = function()
        game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
    end
})

PointsTab:AddButton({
    Name = "الانتقال لسيرفر فارغ",
    Callback = function()
        local servers = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?limit=100"))
        local found = false
        for _, server in pairs(servers.data) do
            if server.playing < 10 and server.id ~= game.JobId then
                game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, server.id, game.Players.LocalPlayer)
                found = true
                break
            end
        end
        if not found then
            game.StarterGui:SetCore("SendNotification", {
                Title = "تنبيه",
                Text = "لا يوجد سيرفر فارغ متاح حالياً",
                Duration = 4
            })
        end
    end
})

PointsTab:AddButton({
    Name = "الانتقال لسيرفر افضل اتصال",
    Callback = function()
        local servers = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?limit=100"))
        local bestServer = nil
        local regions = {"US-E", "US-W", "EU", "AS", "AU", "SA"}
        for _, region in pairs(regions) do
            for _, server in pairs(servers.data) do
                if server.region == region and server.id ~= game.JobId then
                    bestServer = server
                    break
                end
            end
            if bestServer then break end
        end
        if bestServer then
            game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, bestServer.id, game.Players.LocalPlayer)
        else
            game.StarterGui:SetCore("SendNotification", {
                Title = "تنبيه",
                Text = "لا يوجد سيرفر متاح حالياً",
                Duration = 4
            })
        end
    end
})

local ToolTab = Window:MakeTab({ Title = "العبث بالممتلكات", Icon = "rbxassetid://10709782497" })

local SelectedPlayer = nil
local FlingConnection = nil
local BringConnection = nil
local KillConnection = nil
local LoopActive = false
local CurrentMode = ""

local function ClearAll()
    pcall(function()
        ReplicatedStorage.RE:FindFirstChild("1Clea1rTool1s"):FireServer("ClearAllTools")
        ReplicatedStorage.RE:FindFirstChild("1Clea1rTool1s"):FireServer("ClearAllProps")
    end)
end

local function GetMyProps()
    local props = {}
    local workspaceCom = workspace:FindFirstChild("WorkspaceCom")
    if not workspaceCom then return props end
    for _,folder in ipairs(workspaceCom:GetChildren()) do
        for _,prop in ipairs(folder:GetChildren()) do
            if prop.Name:find("Prop"..LocalPlayer.Name) and prop:FindFirstChild("SetCurrentCFrame") then
                table.insert(props, prop)
            end
        end
    end
    return props
end

local function TeleportProps(cf)
    for _,prop in ipairs(GetMyProps()) do
        task.spawn(function()
            pcall(function()
                prop.SetCurrentCFrame:InvokeServer(cf)
            end)
        end)
    end
end

local function SetupProp()
    ClearAll()
    task.wait(0.2)
    local char = LocalPlayer.Character
    if not char then return end
    local hrp = char:WaitForChild("HumanoidRootPart")
    local humanoid = char:WaitForChild("Humanoid")
    ReplicatedStorage.RE:FindFirstChild("1Too1l"):InvokeServer("PickingTools", "PropMaker")
    local tool = LocalPlayer.Backpack:WaitForChild("PropMaker", 5)
    if tool then
        humanoid:EquipTool(tool)
        task.wait(0.3)
        local reqArgs = {"RequestingPropName", "FurnitureBleachers", "Furniture"}
        ReplicatedStorage.RE:FindFirstChild("1Clea1rTool1s"):FireServer(unpack(reqArgs))
        task.wait(0.5)
        local toolRemote = tool:FindFirstChild("Tool_PropMake")
        if toolRemote then
            toolRemote:FireServer(workspace.Model.Street.Street, hrp.Position + Vector3.new(0, -15, 0))
        end
        VirtualUser:Button1Down(Vector2.new(0, 500), workspace.CurrentCamera.CFrame)
        task.wait(0.1)
        VirtualUser:Button1Up(Vector2.new(0, 500), workspace.CurrentCamera.CFrame)
    end
end

local function getPlayerNames()
    local t = {}
    for _,p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer then
            table.insert(t,p.Name)
        end
    end
    return t
end

local DropdownPlayer = ToolTab:AddDropdown({
    Name = "اختيار اللاعب",
    Default = "",
    Multi = false,
    Options = getPlayerNames(),
    Callback = function(name)
        SelectedPlayer = Players:FindFirstChild(name)
    end
})

ToolTab:AddButton({
    Name = "تحديث القائمة",
    Callback = function()
        DropdownPlayer:Set(getPlayerNames())
    end
})

local function HandleAction(targetPlayer, destinationCF, connectionRef)
    if connectionRef then connectionRef:Disconnect() end
    ClearAll()
    if not targetPlayer then return nil end
    
    SetupProp()
    local wasSitting = false
    local liftOffset = -10
    
    return RunService.Heartbeat:Connect(function()
        local c = targetPlayer.Character
        local r = c and c:FindFirstChild("HumanoidRootPart")
        local h = c and c:FindFirstChild("Humanoid")
        if not r or not h then return end
        
        if h.Sit then
            if not wasSitting then
                wasSitting = true
                TeleportProps(destinationCF)
                task.wait(0.4)
                ClearAll()
            end
        else
            wasSitting = false
            liftOffset = liftOffset + 0.5
            if liftOffset > 2 then liftOffset = -10 end
            TeleportProps(r.CFrame * CFrame.new(0, liftOffset, 0))
        end
    end)
end

ToolTab:AddToggle({
    Name = "دفع اللاعب",
    Default = false,
    Callback = function(v)
        if v then
            FlingConnection = HandleAction(SelectedPlayer, CFrame.new(1082537, 81322368, -4719626), FlingConnection)
        else
            if FlingConnection then FlingConnection:Disconnect() FlingConnection = nil end
            ClearAll()
        end
    end
})

ToolTab:AddToggle({
    Name = "جلب اللاعب",
    Default = false,
    Callback = function(v)
        if v then
            local myHrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            local dest = myHrp and myHrp.CFrame * CFrame.new(0, 0, -5) or LocalPlayer.Character.PrimaryPart.CFrame
            BringConnection = HandleAction(SelectedPlayer, dest, BringConnection)
        else
            if BringConnection then BringConnection:Disconnect() BringConnection = nil end
            ClearAll()
        end
    end
})

ToolTab:AddToggle({
    Name = "قتل اللاعب",
    Default = false,
    Callback = function(v)
        if v then
            KillConnection = HandleAction(SelectedPlayer, CFrame.new(216, -1338, -477), KillConnection)
        else
            if KillConnection then KillConnection:Disconnect() KillConnection = nil end
            ClearAll()
        end
    end
})

local function ExecuteOnPlayer(targetPlayer)
    if not targetPlayer or targetPlayer == LocalPlayer or not LoopActive then return end
    
    SetupProp()
    
    local destinationCF
    if CurrentMode == "Kill" then
        destinationCF = CFrame.new(216, -1338, -477)
    elseif CurrentMode == "Fling" then
        destinationCF = CFrame.new(1082537, 81322368, -4719626)
    elseif CurrentMode == "Bring" then
        local myHrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        destinationCF = myHrp and myHrp.CFrame * CFrame.new(0, 0, -5) or CFrame.new(0,0,0)
    end

    local wasSitting = false
    local liftOffset = -12
    local startTime = tick()
    local finished = false

    local conn
    conn = RunService.Heartbeat:Connect(function()
        if not LoopActive or finished then 
            conn:Disconnect()
            return 
        end

        local c = targetPlayer.Character
        local r = c and c:FindFirstChild("HumanoidRootPart")
        local h = c and c:FindFirstChild("Humanoid")
        
        if not r or not h or (tick() - startTime > 10) then 
            finished = true
            return 
        end

        if h.Sit then
            finished = true
            TeleportProps(destinationCF)
            task.wait(0.4)
            ClearAll()
        else
            liftOffset = liftOffset + 0.8
            if liftOffset > 3 then liftOffset = -12 end
            TeleportProps(r.CFrame * CFrame.new(0, liftOffset, 0))
        end
    end)

    while not finished and LoopActive do task.wait(0.1) end
end

local function StartServerLoop(mode)
    LoopActive = true
    CurrentMode = mode
    task.spawn(function()
        while LoopActive do
            if CurrentMode == "Bring" then
                pcall(function() LocalPlayer.Character.Humanoid.Sit = true end)
            end
            local playersToTarget = Players:GetPlayers()
            for _, p in ipairs(playersToTarget) do
                if not LoopActive then break end
                if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                    ExecuteOnPlayer(p)
                    task.wait(0.2)
                end
            end
            task.wait(0.3)
        end
        pcall(function() LocalPlayer.Character.Humanoid.Sit = false end)
    end)
end

ToolTab:AddToggle({
    Name = "قتل الكل",
    Default = false,
    Callback = function(v)
        LoopActive = v
        if v then
            StartServerLoop("Kill")
        else
            ClearAll()
        end
    end
})

ToolTab:AddToggle({
    Name = "جلب الكل",
    Default = false,
    Callback = function(v)
        LoopActive = v
        if v then
            StartServerLoop("Bring")
        else
            ClearAll()
            pcall(function() LocalPlayer.Character.Humanoid.Sit = false end)
        end
    end
})

ToolTab:AddToggle({
    Name = "دفع الكل",
    Default = false,
    Callback = function(v)
        LoopActive = v
        if v then
            StartServerLoop("Fling")
        else
            ClearAll()
        end
    end
})

local SongTab = Window:MakeTab({
    Title = "الأغاني",
    Icon = "rbxassetid://95704435998219"
})

SongTab:AddSection({ Name = "ملاحظه:غير مسؤول عن ذنوبكم" })

SongTab:AddButton({
    Name = "اقتل نفسك للريست",
    Callback = function()
        game.Players.LocalPlayer.Character.Humanoid.Health = 0
    end
})

SongTab:AddSection({ Name = "شغل الاغاني حسب الكود الخاص بك" })

local scooterCode = ""
SongTab:AddTextBox({
    Name = "للسكوتر",
    Default = "",
    PlaceholderText = "ادخل كود الاغنية",
    ClearText = false,
    Callback = function(Value)
        scooterCode = Value
    end 
})

SongTab:AddButton({
    Name = "تشغيل كود السكوتر",
    Callback = function()
        if scooterCode and scooterCode ~= "" then
            local args1 = {[1] = "SkateBoard"}
            game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1NoMoto1rVehicle1s"):FireServer(unpack(args1))
        
            local args2 = {[1] = "PickingScooterMusicText",[2] = scooterCode}
            game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1NoMoto1rVehicle1s"):FireServer(unpack(args2))
        end
    end
})

SongTab:AddSection({ Name = "اصوات تخريب يسمعها الجميع بدون جيم باس" })

local audioList = {
    "Yamete Kudasai","Scream","Horror Jumpscare","Loud Audio","Noise",
    "Jumpscare 2","Minecraft Witch Laugh","The Boiled One","Crazy Hail Mary","Mandrake Detected",
    "Aaaaaaaaa","AAAHHHH","amongus","Sus","Big Scream AAAAAAAAA",
    "UHHHHH COFFCOFF","SUS","Sonic.exe","Tubers93 1","Tubers93 2",
    "John's Laugh","No Idea LOL","Screaming","Sus Audio","AAAH",
    "Gay, gay","Bat Hit","Nuclear Siren","No idea for a name LOL","Scream 2",
    "Eardrum Buster","Annoying Moan","Meme Sound Clip","iFood Ad","I Ghost The down",
    "Shop Online at Shopee","Uh, So Gross","Get Out, Go Wash Dishes","Meme Quote"
}

local audioIDs = {
    ["Yamete Kudasai"] = 108494476595033,
    ["Scream"] = 5710016194,
    ["Horror Jumpscare"] = 85435253347146,
    ["Loud Audio"] = 6855150757,
    ["Noise"] = 120034877160791,
    ["Jumpscare 2"] = 110637995610528,
    ["Minecraft Witch Laugh"] = 116214940486087,
    ["The Boiled One"] = 137177653817621,
    ["Crazy Hail Mary"] = 128669424001766,
    ["Mandrake Detected"] = 9068077052,
    ["Aaaaaaaaa"] = 80156405968805,
    ["AAAHHHH"] = 9084006093,
    ["amongus"] = 6651571134,
    ["Sus"] = 6701126635,
    ["Big Scream AAAAAAAAA"] = 5853668794,
    ["UHHHHH COFFCOFF"] = 7056720271,
    ["SUS"] = 7153419575,
    ["Sonic.exe"] = 2496367477,
    ["Tubers93 1"] = 270145703,
    ["Tubers93 2"] = 18131809532,
    ["John's Laugh"] = 130759239,
    ["No Idea LOL"] = 6549021381,
    ["Screaming"] = 80156405968805,
    ["Sus Audio"] = 7705506391,
    ["AAAH"] = 7772283448,
    ["Gay, gay"] = 18786647417,
    ["Bat Hit"] = 7129073354,
    ["Nuclear Siren"] = 675587093,
    ["No idea for a name LOL"] = 7520729342,
    ["Scream 2"] = 91412024101709,
    ["Eardrum Buster"] = 268116333,
    ["Annoying Moan"] = 106835463235574,
    ["Meme Sound Clip"] = 132603645477541,
    ["iFood Ad"] = 133843750864059,
    ["I Ghost The down"] = 84663543883498,
    ["Shop Online at Shopee"] = 8747441609,
    ["Uh, So Gross"] = 103440368630269,
    ["Get Out, Go Wash Dishes"] = 101232400175829,
    ["Meme Quote"] = 78442476709262
}

local selectedAudio = audioList[1]
local customAudioID = nil
local audioVolume = 1
local audioDelay = 0.5

local audioIDInput = ""
SongTab:AddTextBox({
    Name = "هنا ايدي الأغنية",
    Description = "ادخل أي ID تريد تشغيله",
    PlaceholderText = "ضع ID هنا",
    ClearText = false,
    Callback = function(value)
        if value and value ~= "" then
            customAudioID = tonumber(value)
            audioIDInput = value
        end
    end
})

SongTab:AddButton({
    Name = "تشغيل الأغنية",
    Callback = function()
        local idToPlay = customAudioID or audioIDs[selectedAudio]
        if not idToPlay then
            warn("ياخي، اختار صوت أو ادخل ID أول")
            return
        end

        local sound = Instance.new("Sound")
        sound.SoundId = "rbxassetid://" .. idToPlay
        sound.Volume = audioVolume
        sound.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
        sound:Play()
    end
})

SongTab:AddDropdown({
    Name = "اختر الأغنية",
    Options = audioList,
    Default = audioList[1],
    Callback = function(value)
        selectedAudio = value
    end
})

SongTab:AddDropdown({
    Name = "مستوى الصوت",
    Options = {"0","0.25","0.5","1","1.5","2","3","4","5"},
    Default = "1",
    Callback = function(value)
        audioVolume = tonumber(value)
    end
})

SongTab:AddDropdown({
    Name = "مدة بين الأصوات",
    Options = {"0.05","0.1","0.25","0.5","1","2"},
    Default = "0.5",
    Callback = function(value)
        audioDelay = tonumber(value)
    end
})

local audioSpam = false
SongTab:AddToggle({
    Name = "سبام سريع الأغنية",
    Description = "تشغيل الصوت عند كل اللاعبين بسرعة مع التحكم بالمدة",
    Default = false,
    Callback = function(value)
        audioSpam = value
        if audioSpam then
            task.spawn(function()
                while audioSpam do
                    local idToPlay = customAudioID or audioIDs[selectedAudio]
                    if idToPlay then
                        local sound = Instance.new("Sound")
                        sound.SoundId = "rbxassetid://" .. idToPlay
                        sound.Volume = audioVolume
                        sound.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
                        sound:Play()
                    end
                    task.wait(audioDelay)
                end
            end)
        end
    end
})

local RgbTab = Window:MakeTab({ Title = "آر جي بي", Icon = "rbxassetid://10734910187" })

RgbTab:AddSection({ "الأدوات" })

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

local Player = Players.LocalPlayer
local RE = ReplicatedStorage:WaitForChild("RE")
local Running = false
local ToolName = "BabyRattle"
local ToolSpeed = 3

local Tools = {
    ["دهان || PaintRoller"] = "PaintRoller",
    ["أحمر شفاه || Lipstick"] = "Lipstick",
    ["قوس || Bow"] = "Bow",
    ["راديو || Boombox"] = "Boombox",
    ["ترمس || Thermos"] = "Thermos",
    ["دونات || Donut"] = "Donut",
    ["فرشاة خيل || HorseBrush"] = "HorseBrush",
    ["هراوات || GlowingBatons"] = "GlowingBatons",
    ["مكبر صوت || Megaphone"] = "Megaphone",
    ["شمعة || Candle"] = "Candle",
    ["مشعل || GuardTorch"] = "GuardTorch",
    ["لعبة أطفال || BabyRattle"] = "BabyRattle"
}

local function EquipTool(Name)
    local Char = Player.Character or Player.CharacterAdded:Wait()
    local Hum = Char:WaitForChild("Humanoid")
    local Tool = Player.Backpack:WaitForChild(Name, 2)
    if Tool then
        Tool.Parent = Char
        Hum:EquipTool(Tool)
    end
    return Tool
end

local function HSV(T)
    return Color3.fromHSV(T % 1, 1, 1)
end

RgbTab:AddDropdown({
    Name = "اختيار الأداة",
    Default = "لعبة أطفال || BabyRattle",
    Options = {"دهان || PaintRoller", "أحمر شفاه || Lipstick", "قوس || Bow", "راديو || Boombox", "ترمس || Thermos", "دونات || Donut", "فرشاة خيل || HorseBrush", "هراوات || GlowingBatons", "مكبر صوت || Megaphone", "شمعة || Candle", "مشعل || GuardTorch", "لعبة أطفال || BabyRattle"},
    Callback = function(Value)
        ToolName = Tools[Value]
    end
})

RgbTab:AddSlider({
    Name = "سرعة التلوين",
    Min = 1,
    Max = 10,
    Default = 3,
    Callback = function(Value)
        ToolSpeed = Value / 10
    end
})

RgbTab:AddToggle({
    Name = "تفعيل آر جي بي للأدوات",
    Default = false,
    Callback = function(State)
        Running = State
        if not State then return end

        task.spawn(function()
            RE:WaitForChild("1Clea1rTool1s"):FireServer("ClearAllTools")
            task.wait(0.2)
            RE:WaitForChild("1Too1l"):InvokeServer("PickingTools", ToolName)
            task.wait(0.3)

            local Tool = EquipTool(ToolName)
            if not Tool then return end

            local SetColor = Player.PlayerGui:WaitForChild("ToolGui"):WaitForChild("ToolSettings"):WaitForChild("Settings"):WaitForChild("PropsColor"):WaitForChild("SetColor")

            local Hue = 0
            local Current = HSV(0)

            local Connection
            Connection = RunService.RenderStepped:Connect(function(Delta)
                if not Running then
                    Connection:Disconnect()
                    return
                end
                Hue += Delta * ToolSpeed
                local Target = HSV(Hue)
                Current = Current:Lerp(Target, Delta * 5)
                SetColor:FireServer(Current)
            end)
        end)
    end
})

RgbTab:AddSection({ "الشعر" })

local HairColors = {
    Color3.new(1, 1, 0), Color3.new(0, 0, 1), Color3.new(1, 0, 1), Color3.new(1, 1, 1),
    Color3.new(0, 1, 0), Color3.new(0.5, 0, 1), Color3.new(1, 0.647, 0), Color3.new(0, 1, 1)
}

local HairActive = false
local HairSpeed = 1

RgbTab:AddSlider({
    Name = "سرعة التلوين",
    Min = 1,
    Max = 10,
    Default = 1,
    Callback = function(Value)
        HairSpeed = Value / 10
    end
})

local function ChangeHairColor()
    local Index = 1
    while HairActive do
        if not HairActive then break end
        local Args = { [1] = "ChangeHairColor2", [2] = HairColors[Index] }
        RE:WaitForChild("1Max1y"):FireServer(unpack(Args))
        task.wait(HairSpeed)
        Index = Index % #HairColors + 1
    end
end

RgbTab:AddToggle({
    Name = "تفعيل آر جي بي للشعر",
    Default = false,
    Callback = function(Value)
        HairActive = Value
        if HairActive then
            ChangeHairColor()
        end
    end
})

RgbTab:AddSection({ "الجسم" })

local Remotes = ReplicatedStorage:WaitForChild("Remotes")
local ChangeBodyColor = Remotes:WaitForChild("ChangeBodyColor")

local BodyColors = {
    "بني فاتح", "أصفر فاتح", "أزرق فاتح", "أخضر فاتح", "وردي فاتح",
    "أحمر غامق", "برتقالي", "أزرق غامق", "بنفسجي غامق", "أخضر غامق",
    "أصفر غامق", "أبيض", "أسود", "رمادي غامق", "رمادي", "رمادي فاتح",
    "أحمر", "أخضر مصفر", "أزرق مخضر", "أرجواني", "وردي", "بني محمر",
    "أخضر ترابي", "أحمر رملي", "أزرق رملي", "أخضر رملي", "أخضر داكن",
    "أزرق بحري", "معجون أسنان", "سماوي", "وردي نيون", "قرمزي",
    "أرجواني ملكي", "برتقالي نيون", "أخضر نيون", "وردي نيون", "أزرق نيون",
    "ذهبي", "ذهبي لامع", "أصفر جديد", "برتقالي غامق", "أزرق عميق",
    "كستنائي", "أحمر كستنائي"
}

local BodyActive = false
local BodySpeed = 3

RgbTab:AddSlider({
    Name = "سرعة التلوين",
    Min = 1,
    Max = 10,
    Default = 3,
    Callback = function(Value)
        BodySpeed = Value / 10
    end
})

RgbTab:AddToggle({
    Name = "تفعيل آر جي بي للجسم",
    Default = false,
    Callback = function(Value)
        BodyActive = Value
        if BodyActive then
            task.spawn(function()
                while BodyActive do
                    for _, Color in ipairs(BodyColors) do
                        if not BodyActive then break end
                        ChangeBodyColor:FireServer(Color)
                        task.wait(BodySpeed)
                    end
                end
            end)
        end
    end
})

RgbTab:AddSection({ "الدراجة" })

local SpeedRGB = 3
local BicycleActive = false

RgbTab:AddSlider({
    Name = "سرعة التلوين",
    Min = 1,
    Max = 10,
    Default = 3,
    Callback = function(Value)
        SpeedRGB = Value
    end
})

local function GetRainbowColor(SpeedMultiplier)
    local H = (tick() * SpeedMultiplier % 5) / 5
    return Color3.fromHSV(H, 1, 1)
end

local function FireServer(EventName, Args)
    local Event = ReplicatedStorage:FindFirstChild("RE")
    if Event and Event:FindFirstChild(EventName) then
        pcall(function()
            Event[EventName]:FireServer(unpack(Args))
        end)
    end
end

RgbTab:AddToggle({
    Name = "تفعيل آر جي بي للدراجة",
    Default = false,
    Callback = function(Value)
        BicycleActive = Value
        task.spawn(function()
            while BicycleActive do
                FireServer("1Player1sCa1r", {
                    "NoMotorColor",
                    GetRainbowColor(SpeedRGB)
                })
                task.wait(0.1)
            end
        end)
    end
})
