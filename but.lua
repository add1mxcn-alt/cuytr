local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local UserInputService = game:GetService("UserInputService")

local Settings = {
    Enabled = false,
    Range = 200,
    Target = nil,
    AimPart = "Head",
    ESPEnabled = false,
    Minimized = false
}

local Connection = nil
local CircleGui = nil
local MainGui = nil
local ToggleButton = nil
local RangeSlider = nil
local StatusLabel = nil
local ESPToggle = nil
local MinimizeButton = nil
local CloseButton = nil
local ESPObjects = {}
local ESPConnection = nil
local MainFrame = nil
local TopBar = nil
local MinimizedFrame = nil

local function CreateESP(Player)
    if not Settings.ESPEnabled then return end
    if Player == LocalPlayer then return end
    
    local Character = Player.Character
    if not Character then return end
    
    local HRP = Character:FindFirstChild("HumanoidRootPart")
    if not HRP then return end
    
    if ESPObjects[Player] then
        ESPObjects[Player]:Destroy()
        ESPObjects[Player] = nil
    end
    
    local Folder = Instance.new("Folder")
    Folder.Name = "ESP_" .. Player.Name
    Folder.Parent = Character
    
    local Box = Instance.new("BoxHandleAdornment")
    Box.Size = Vector3.new(4, 6, 2)
    Box.Color3 = Color3.fromRGB(0, 200, 255)
    Box.Transparency = 0.4
    Box.AlwaysOnTop = true
    Box.ZIndex = 10
    Box.Adornee = HRP
    Box.Parent = Folder
    
    local Outline = Instance.new("BoxHandleAdornment")
    Outline.Size = Vector3.new(4.2, 6.2, 2.2)
    Outline.Color3 = Color3.fromRGB(0, 0, 0)
    Outline.Transparency = 0.7
    Outline.AlwaysOnTop = true
    Outline.ZIndex = 9
    Outline.Adornee = HRP
    Outline.Parent = Folder
    
    local Hum = Character:FindFirstChildOfClass("Humanoid")
    if Hum then
        local HealthBar = Instance.new("BillboardGui")
        HealthBar.Size = UDim2.new(0, 60, 0, 8)
        HealthBar.StudsOffset = Vector3.new(0, 4, 0)
        HealthBar.AlwaysOnTop = true
        HealthBar.Parent = HRP
        
        local Background = Instance.new("Frame")
        Background.Size = UDim2.new(1, 0, 1, 0)
        Background.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        Background.BackgroundTransparency = 0.3
        Background.BorderSizePixel = 0
        Background.Parent = HealthBar
        
        local BarCorner = Instance.new("UICorner")
        BarCorner.CornerRadius = UDim.new(0, 4)
        BarCorner.Parent = Background
        
        local Fill = Instance.new("Frame")
        Fill.Size = UDim2.new(Hum.Health / Hum.MaxHealth, 0, 1, 0)
        Fill.BackgroundColor3 = Color3.fromRGB(0, 255, 100)
        Fill.BorderSizePixel = 0
        Fill.Parent = Background
        Fill.Name = "HealthFill"
        
        local FillCorner = Instance.new("UICorner")
        FillCorner.CornerRadius = UDim.new(0, 4)
        FillCorner.Parent = Fill
        
        Hum:GetPropertyChangedSignal("Health"):Connect(function()
            local HealthPercent = Hum.Health / Hum.MaxHealth
            Fill.Size = UDim2.new(HealthPercent, 0, 1, 0)
            
            if HealthPercent > 0.5 then
                Fill.BackgroundColor3 = Color3.fromRGB(0, 255, 100)
            elseif HealthPercent > 0.25 then
                Fill.BackgroundColor3 = Color3.fromRGB(255, 200, 0)
            else
                Fill.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
            end
        end)
    end
    
    local NameLabel = Instance.new("BillboardGui")
    NameLabel.Size = UDim2.new(0, 100, 0, 20)
    NameLabel.StudsOffset = Vector3.new(0, 4.5, 0)
    NameLabel.AlwaysOnTop = true
    NameLabel.Parent = HRP
    
    local NameText = Instance.new("TextLabel")
    NameText.Size = UDim2.new(1, 0, 1, 0)
    NameText.BackgroundTransparency = 1
    NameText.Text = Player.Name
    NameText.TextColor3 = Color3.fromRGB(255, 255, 255)
    NameText.TextStrokeTransparency = 0.3
    NameText.TextScaled = true
    NameText.Font = Enum.Font.GothamBold
    NameText.Parent = NameLabel
    
    local DistLabel = Instance.new("BillboardGui")
    DistLabel.Size = UDim2.new(0, 60, 0, 16)
    DistLabel.StudsOffset = Vector3.new(0, -3.5, 0)
    DistLabel.AlwaysOnTop = true
    DistLabel.Parent = HRP
    
    local DistText = Instance.new("TextLabel")
    DistText.Size = UDim2.new(1, 0, 1, 0)
    DistText.BackgroundTransparency = 1
    DistText.Text = "0m"
    DistText.TextColor3 = Color3.fromRGB(200, 200, 200)
    DistText.TextScaled = true
    DistText.Font = Enum.Font.Gotham
    DistText.Parent = DistLabel
    DistText.Name = "DistanceText"
    
    task.spawn(function()
        while DistLabel and DistLabel.Parent do
            local MyHRP = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if MyHRP and HRP then
                local Dist = (MyHRP.Position - HRP.Position).Magnitude
                DistText.Text = math.floor(Dist) .. "m"
            end
            task.wait(0.2)
        end
    end)
    
    ESPObjects[Player] = Folder
end

local function RemoveESP(Player)
    if ESPObjects[Player] then
        ESPObjects[Player]:Destroy()
        ESPObjects[Player] = nil
    end
end

local function UpdateESP()
    if not Settings.ESPEnabled then
        for Player, Folder in pairs(ESPObjects) do
            Folder:Destroy()
        end
        ESPObjects = {}
        return
    end
    
    for _, Player in ipairs(Players:GetPlayers()) do
        if Player ~= LocalPlayer then
            CreateESP(Player)
        end
    end
end

local function StartESP()
    if ESPConnection then
        ESPConnection:Disconnect()
        ESPConnection = nil
    end
    
    UpdateESP()
    
    Players.PlayerAdded:Connect(function(Player)
        task.wait(0.5)
        if Settings.ESPEnabled then
            CreateESP(Player)
        end
    end)
    
    Players.PlayerRemoving:Connect(function(Player)
        RemoveESP(Player)
    end)
end

local function CreateMinimizedFrame()
    if MinimizedFrame then
        MinimizedFrame:Destroy()
        MinimizedFrame = nil
    end
    
    MinimizedFrame = Instance.new("Frame")
    MinimizedFrame.Size = UDim2.new(0, 50, 0, 50)
    MinimizedFrame.Position = UDim2.new(0.5, -25, 0.85, -25)
    MinimizedFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
    MinimizedFrame.BackgroundTransparency = 0.2
    MinimizedFrame.BorderSizePixel = 0
    MinimizedFrame.ClipsDescendants = true
    MinimizedFrame.Parent = MainGui
    
    local FrameCorner = Instance.new("UICorner")
    FrameCorner.CornerRadius = UDim.new(0, 14)
    FrameCorner.Parent = MinimizedFrame
    
    local Glow = Instance.new("Frame")
    Glow.Size = UDim2.new(1, 0, 1, 0)
    Glow.BackgroundColor3 = Color3.fromRGB(0, 180, 255)
    Glow.BackgroundTransparency = 0.85
    Glow.BorderSizePixel = 0
    Glow.Parent = MinimizedFrame
    
    local Icon = Instance.new("TextLabel")
    Icon.Size = UDim2.new(1, 0, 1, 0)
    Icon.BackgroundTransparency = 1
    Icon.Text = "🎯"
    Icon.TextColor3 = Color3.fromRGB(255, 255, 255)
    Icon.TextScaled = true
    Icon.Font = Enum.Font.GothamBold
    Icon.Parent = MinimizedFrame
    
    local RestoreButton = Instance.new("TextButton")
    RestoreButton.Size = UDim2.new(1, 0, 1, 0)
    RestoreButton.BackgroundTransparency = 1
    RestoreButton.Text = ""
    RestoreButton.Parent = MinimizedFrame
    
    RestoreButton.MouseButton1Click:Connect(function()
        Settings.Minimized = false
        MinimizedFrame.Visible = false
        MainFrame.Visible = true
    end)
    
    MinimizedFrame.Visible = false
end

local function CreateMainGui()
    if MainGui then
        MainGui:Destroy()
        MainGui = nil
    end
    
    MainGui = Instance.new("ScreenGui")
    MainGui.Name = "BulletTrackGUI"
    MainGui.Parent = LocalPlayer.PlayerGui
    MainGui.ResetOnSpawn = false
    
    MainFrame = Instance.new("Frame")
    MainFrame.Size = UDim2.new(0, 280, 0, 280)
    MainFrame.Position = UDim2.new(0.5, -140, 0.85, -140)
    MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
    MainFrame.BackgroundTransparency = 0.1
    MainFrame.BorderSizePixel = 0
    MainFrame.ClipsDescendants = true
    MainFrame.Parent = MainGui
    
    local FrameCorner = Instance.new("UICorner")
    FrameCorner.CornerRadius = UDim.new(0, 14)
    FrameCorner.Parent = MainFrame
    
    local Glow = Instance.new("Frame")
    Glow.Size = UDim2.new(1, 0, 1, 0)
    Glow.BackgroundColor3 = Color3.fromRGB(0, 180, 255)
    Glow.BackgroundTransparency = 0.85
    Glow.BorderSizePixel = 0
    Glow.Parent = MainFrame
    
    TopBar = Instance.new("Frame")
    TopBar.Size = UDim2.new(1, 0, 0, 35)
    TopBar.Position = UDim2.new(0, 0, 0, 0)
    TopBar.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    TopBar.BackgroundTransparency = 0.5
    TopBar.BorderSizePixel = 0
    TopBar.Parent = MainFrame
    
    local Drag = Instance.new("TextButton")
    Drag.Size = UDim2.new(0.8, 0, 1, 0)
    Drag.Position = UDim2.new(0, 0, 0, 0)
    Drag.BackgroundTransparency = 1
    Drag.Text = ""
    Drag.Parent = TopBar
    
    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(0.6, 0, 1, 0)
    Title.Position = UDim2.new(0, 10, 0, 0)
    Title.BackgroundTransparency = 1
    Title.Text = "🎯 بولت تراك"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextScaled = true
    Title.Font = Enum.Font.GothamBold
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.Parent = TopBar
    
    MinimizeButton = Instance.new("TextButton")
    MinimizeButton.Size = UDim2.new(0, 30, 0, 30)
    MinimizeButton.Position = UDim2.new(0.85, 0, 0.07, 0)
    MinimizeButton.BackgroundTransparency = 1
    MinimizeButton.Text = "➖"
    MinimizeButton.TextColor3 = Color3.fromRGB(200, 200, 200)
    MinimizeButton.TextScaled = true
    MinimizeButton.Font = Enum.Font.GothamBold
    MinimizeButton.Parent = TopBar
    
    CloseButton = Instance.new("TextButton")
    CloseButton.Size = UDim2.new(0, 30, 0, 30)
    CloseButton.Position = UDim2.new(0.93, 0, 0.07, 0)
    CloseButton.BackgroundTransparency = 1
    CloseButton.Text = "✕"
    CloseButton.TextColor3 = Color3.fromRGB(255, 80, 80)
    CloseButton.TextScaled = true
    CloseButton.Font = Enum.Font.GothamBold
    CloseButton.Parent = TopBar
    
    local Line = Instance.new("Frame")
    Line.Size = UDim2.new(0.9, 0, 0, 2)
    Line.Position = UDim2.new(0.05, 0, 0, 35)
    Line.BackgroundColor3 = Color3.fromRGB(0, 180, 255)
    Line.BackgroundTransparency = 0.4
    Line.BorderSizePixel = 0
    Line.Parent = MainFrame
    
    StatusLabel = Instance.new("TextLabel")
    StatusLabel.Size = UDim2.new(1, 0, 0, 25)
    StatusLabel.Position = UDim2.new(0, 0, 0, 40)
    StatusLabel.BackgroundTransparency = 1
    StatusLabel.Text = "❌ معطل"
    StatusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
    StatusLabel.TextScaled = true
    StatusLabel.Font = Enum.Font.GothamBold
    StatusLabel.Parent = MainFrame
    
    ToggleButton = Instance.new("TextButton")
    ToggleButton.Size = UDim2.new(0.8, 0, 0, 35)
    ToggleButton.Position = UDim2.new(0.1, 0, 0, 70)
    ToggleButton.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
    ToggleButton.BackgroundTransparency = 0.4
    ToggleButton.Text = "▶ تشغيل التتبع"
    ToggleButton.TextColor3 = Color3.fromRGB(0, 255, 150)
    ToggleButton.TextScaled = true
    ToggleButton.Font = Enum.Font.GothamBold
    ToggleButton.BorderSizePixel = 0
    ToggleButton.Parent = MainFrame
    
    local ToggleCorner = Instance.new("UICorner")
    ToggleCorner.CornerRadius = UDim.new(0, 8)
    ToggleCorner.Parent = ToggleButton
    
    ESPToggle = Instance.new("TextButton")
    ESPToggle.Size = UDim2.new(0.8, 0, 0, 30)
    ESPToggle.Position = UDim2.new(0.1, 0, 0, 112)
    ESPToggle.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
    ESPToggle.BackgroundTransparency = 0.4
    ESPToggle.Text = "👁️ تشغيل ESP"
    ESPToggle.TextColor3 = Color3.fromRGB(255, 200, 100)
    ESPToggle.TextScaled = true
    ESPToggle.Font = Enum.Font.GothamBold
    ESPToggle.BorderSizePixel = 0
    ESPToggle.Parent = MainFrame
    
    local ESPCorner = Instance.new("UICorner")
    ESPCorner.CornerRadius = UDim.new(0, 8)
    ESPCorner.Parent = ESPToggle
    
    local RangeLabel = Instance.new("TextLabel")
    RangeLabel.Size = UDim2.new(0.4, 0, 0, 25)
    RangeLabel.Position = UDim2.new(0.05, 0, 0, 152)
    RangeLabel.BackgroundTransparency = 1
    RangeLabel.Text = "المدى: 200"
    RangeLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    RangeLabel.TextScaled = true
    RangeLabel.Font = Enum.Font.Gotham
    RangeLabel.TextXAlignment = Enum.TextXAlignment.Left
    RangeLabel.Parent = MainFrame
    
    RangeSlider = Instance.new("Frame")
    RangeSlider.Size = UDim2.new(0.6, 0, 0, 8)
    RangeSlider.Position = UDim2.new(0.35, 0, 0, 157)
    RangeSlider.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
    RangeSlider.BackgroundTransparency = 0.5
    RangeSlider.BorderSizePixel = 0
    RangeSlider.Parent = MainFrame
    
    local SliderCorner = Instance.new("UICorner")
    SliderCorner.CornerRadius = UDim.new(0, 4)
    SliderCorner.Parent = RangeSlider
    
    local SliderFill = Instance.new("Frame")
    SliderFill.Size = UDim2.new(0.5, 0, 1, 0)
    SliderFill.BackgroundColor3 = Color3.fromRGB(0, 180, 255)
    SliderFill.BorderSizePixel = 0
    SliderFill.Parent = RangeSlider
    
    local FillCorner = Instance.new("UICorner")
    FillCorner.CornerRadius = UDim.new(0, 4)
    FillCorner.Parent = SliderFill
    
    local SliderButton = Instance.new("ImageButton")
    SliderButton.Size = UDim2.new(0, 16, 0, 16)
    SliderButton.Position = UDim2.new(0.5, -8, 0.5, -8)
    SliderButton.BackgroundTransparency = 1
    SliderButton.Image = "rbxassetid://5551475664"
    SliderButton.ImageColor3 = Color3.fromRGB(0, 180, 255)
    SliderButton.Parent = SliderFill
    
    local InfoLabel = Instance.new("TextLabel")
    InfoLabel.Size = UDim2.new(1, 0, 0, 20)
    InfoLabel.Position = UDim2.new(0, 0, 0, 185)
    InfoLabel.BackgroundTransparency = 1
    InfoLabel.Text = "🎯 التتبع للاعب الأقرب داخل المدى"
    InfoLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
    InfoLabel.TextScaled = true
    InfoLabel.Font = Enum.Font.Gotham
    InfoLabel.Parent = MainFrame
    
    local function UpdateRange(Value)
        local Clamped = math.clamp(Value, 50, 500)
        Settings.Range = Clamped
        SliderFill.Size = UDim2.new((Clamped - 50) / 450, 0, 1, 0)
        RangeLabel.Text = "المدى: " .. math.floor(Clamped)
    end
    
    local Dragging = false
    SliderButton.MouseButton1Down:Connect(function()
        Dragging = true
    end)
    
    UserInputService.InputEnded:Connect(function(Input)
        if Input.UserInputType == Enum.UserInputType.MouseButton1 then
            Dragging = false
        end
    end)
    
    UserInputService.InputChanged:Connect(function(Input)
        if Dragging and Input.UserInputType == Enum.UserInputType.MouseMovement then
            local MousePos = Input.Position.X
            local SliderPos = RangeSlider.AbsolutePosition.X
            local SliderSize = RangeSlider.AbsoluteSize.X
            local Value = ((MousePos - SliderPos) / SliderSize) * 450 + 50
            UpdateRange(Value)
        end
    end)
    
    local function ToggleBulletTrack()
        Settings.Enabled = not Settings.Enabled
        
        if Settings.Enabled then
            ToggleButton.Text = "⏹ إيقاف التتبع"
            ToggleButton.TextColor3 = Color3.fromRGB(255, 100, 100)
            StatusLabel.Text = "✅ مفعل"
            StatusLabel.TextColor3 = Color3.fromRGB(100, 255, 100)
            ToggleButton.BackgroundColor3 = Color3.fromRGB(70, 30, 30)
            StartTracking()
            CreateCircle()
        else
            ToggleButton.Text = "▶ تشغيل التتبع"
            ToggleButton.TextColor3 = Color3.fromRGB(0, 255, 150)
            StatusLabel.Text = "❌ معطل"
            StatusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
            ToggleButton.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
            
            if Connection then
                Connection:Disconnect()
                Connection = nil
            end
            
            if CircleGui then
                CircleGui:Destroy()
                CircleGui = nil
            end
            
            for _, BV in ipairs(workspace:GetDescendants()) do
                if BV.Name == "TrackVelocity" then
                    BV:Destroy()
                end
            end
        end
    end
    
    local function ToggleESP()
        Settings.ESPEnabled = not Settings.ESPEnabled
        
        if Settings.ESPEnabled then
            ESPToggle.Text = "👁️ إيقاف ESP"
            ESPToggle.TextColor3 = Color3.fromRGB(100, 255, 100)
            ESPToggle.BackgroundColor3 = Color3.fromRGB(30, 70, 30)
            StartESP()
        else
            ESPToggle.Text = "👁️ تشغيل ESP"
            ESPToggle.TextColor3 = Color3.fromRGB(255, 200, 100)
            ESPToggle.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
            
            if ESPConnection then
                ESPConnection:Disconnect()
                ESPConnection = nil
            end
            
            for Player, Folder in pairs(ESPObjects) do
                Folder:Destroy()
            end
            ESPObjects = {}
        end
    end
    
    MinimizeButton.MouseButton1Click:Connect(function()
        Settings.Minimized = true
        MainFrame.Visible = false
        MinimizedFrame.Visible = true
    end)
    
    CloseButton.MouseButton1Click:Connect(function()
        MainGui:Destroy()
        MainGui = nil
        if CircleGui then
            CircleGui:Destroy()
            CircleGui = nil
        end
        if Connection then
            Connection:Disconnect()
            Connection = nil
        end
        if ESPConnection then
            ESPConnection:Disconnect()
            ESPConnection = nil
        end
        for Player, Folder in pairs(ESPObjects) do
            Folder:Destroy()
        end
        ESPObjects = {}
        for _, BV in ipairs(workspace:GetDescendants()) do
            if BV.Name == "TrackVelocity" then
                BV:Destroy()
            end
        end
    end)
    
    ToggleButton.MouseButton1Click:Connect(ToggleBulletTrack)
    ESPToggle.MouseButton1Click:Connect(ToggleESP)
    
    CreateMinimizedFrame()
    
    return MainGui
end

local function CreateCircle()
    if CircleGui then
        CircleGui:Destroy()
        CircleGui = nil
    end
    
    CircleGui = Instance.new("ScreenGui")
    CircleGui.Name = "BulletTrackCircle"
    CircleGui.Parent = LocalPlayer.PlayerGui
    CircleGui.ResetOnSpawn = false
    
    local Circle = Instance.new("ImageLabel")
    Circle.Size = UDim2.new(0, 200, 0, 200)
    Circle.Position = UDim2.new(0.5, -100, 0.5, -100)
    Circle.BackgroundTransparency = 1
    Circle.Image = "rbxassetid://5551475664"
    Circle.ImageColor3 = Color3.fromRGB(0, 255, 150)
    Circle.ImageTransparency = 0.4
    Circle.Parent = CircleGui
    
    local Dot = Instance.new("ImageLabel")
    Dot.Size = UDim2.new(0, 4, 0, 4)
    Dot.Position = UDim2.new(0.5, -2, 0.5, -2)
    Dot.BackgroundTransparency = 1
    Dot.Image = "rbxassetid://5551475664"
    Dot.ImageColor3 = Color3.fromRGB(255, 50, 50)
    Dot.Parent = Circle
end

local function GetClosestTarget()
    local Character = LocalPlayer.Character
    if not Character then return nil end
    
    local HRP = Character:FindFirstChild("HumanoidRootPart")
    if not HRP then return nil end
    
    local Closest = nil
    local ClosestDist = Settings.Range
    
    for _, Player in ipairs(Players:GetPlayers()) do
        if Player ~= LocalPlayer then
            local TargetChar = Player.Character
            if TargetChar then
                local TargetHRP = TargetChar:FindFirstChild("HumanoidRootPart")
                if TargetHRP then
                    local Distance = (HRP.Position - TargetHRP.Position).Magnitude
                    if Distance < ClosestDist then
                        local Hum = TargetChar:FindFirstChildOfClass("Humanoid")
                        if Hum and Hum.Health > 0 then
                            Closest = TargetChar
                            ClosestDist = Distance
                        end
                    end
                end
            end
        end
    end
    
    return Closest
end

local function TrackProjectile(Projectile)
    if not Settings.Enabled then return end
    
    local Target = GetClosestTarget()
    if not Target then return end
    
    local TargetPart = Target:FindFirstChild(Settings.AimPart) or Target:FindFirstChild("HumanoidRootPart")
    if not TargetPart then return end
    
    local BV = Projectile:FindFirstChild("TrackVelocity")
    if BV then BV:Destroy() end
    
    local NewBV = Instance.new("BodyVelocity")
    NewBV.Name = "TrackVelocity"
    NewBV.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    NewBV.P = 9e9
    
    local Direction = (TargetPart.Position - Projectile.Position).Unit
    NewBV.Velocity = Direction * 500
    NewBV.Parent = Projectile
    
    task.spawn(function()
        local StartTime = tick()
        while Projectile and Projectile.Parent and (Projectile.Position - TargetPart.Position).Magnitude > 3 do
            if not Settings.Enabled then break end
            if tick() - StartTime > 5 then break end
            
            local NewDir = (TargetPart.Position - Projectile.Position).Unit
            NewBV.Velocity = NewDir * 500
            task.wait(0.05)
        end
        
        if NewBV and NewBV.Parent then
            NewBV:Destroy()
        end
    end)
end

local function DetectProjectiles()
    if not Settings.Enabled then return end
    
    for _, Part in ipairs(workspace:GetDescendants()) do
        if Part:IsA("BasePart") and not Part:IsDescendantOf(LocalPlayer.Character) then
            if Part.Velocity.Magnitude > 50 and Part.Size.Magnitude < 10 then
                if not Part:FindFirstChild("Tracked") then
                    local Tag = Instance.new("BoolValue")
                    Tag.Name = "Tracked"
                    Tag.Parent = Part
                    TrackProjectile(Part)
                end
            end
        end
    end
end

local function StartTracking()
    if Connection then
        Connection:Disconnect()
        Connection = nil
    end
    
    Connection = RunService.Heartbeat:Connect(function()
        if not Settings.Enabled then
            Connection:Disconnect()
            Connection = nil
            return
        end
        
        DetectProjectiles()
    end)
end

CreateMainGui()
