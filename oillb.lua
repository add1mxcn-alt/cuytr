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

local ShaderTab = Window:MakeTab({
    Title = "شادرات",
    Icon = "rbxassetid://75529783306690"
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
    "شادر قوس قزح متوهج",
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

    elseif selectedShader == "شادر قوس قزح متوهج" then
        local bloom = Instance.new("BloomEffect")
        bloom.Intensity = 2
        bloom.Size = 35
        bloom.Threshold = 0.6
        bloom.Parent = Lighting
        table.insert(currentEffects, bloom)

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
