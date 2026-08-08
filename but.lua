local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local UserInputService = game:GetService("UserInputService")
local Mouse = LocalPlayer:GetMouse()

local Settings = {
    Enabled = false,
    Range = 200,
    ESPEnabled = false
}

local Connection = nil
local ESPObjects = {}
local ESPConnection = nil
local MainGui = nil
local CircleGui = nil
local ESPActive = false

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
    Box.Color3 = Color3.fromRGB(0, 255, 0)
    Box.Transparency = 0.3
    Box.AlwaysOnTop = true
    Box.ZIndex = 10
    Box.Adornee = HRP
    Box.Parent = Folder
    
    local Hum = Character:FindFirstChildOfClass("Humanoid")
    if Hum then
        local HealthBar = Instance.new("BillboardGui")
        HealthBar.Size = UDim2.new(0, 50, 0, 5)
        HealthBar.StudsOffset = Vector3.new(0, 3.5, 0)
        HealthBar.AlwaysOnTop = true
        HealthBar.Parent = HRP
        
        local BG = Instance.new("Frame")
        BG.Size = UDim2.new(1, 0, 1, 0)
        BG.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        BG.BackgroundTransparency = 0.5
        BG.BorderSizePixel = 0
        BG.Parent = HealthBar
        
        local Fill = Instance.new("Frame")
        Fill.Size = UDim2.new(Hum.Health / Hum.MaxHealth, 0, 1, 0)
        Fill.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
        Fill.BorderSizePixel = 0
        Fill.Parent = BG
        Fill.Name = "HealthFill"
        
        Hum:GetPropertyChangedSignal("Health"):Connect(function()
            local HP = Hum.Health / Hum.MaxHealth
            Fill.Size = UDim2.new(HP, 0, 1, 0)
            if HP > 0.5 then
                Fill.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
            elseif HP > 0.25 then
                Fill.BackgroundColor3 = Color3.fromRGB(255, 200, 0)
            else
                Fill.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
            end
        end)
    end
    
    local NameLabel = Instance.new("BillboardGui")
    NameLabel.Size = UDim2.new(0, 100, 0, 16)
    NameLabel.StudsOffset = Vector3.new(0, 4, 0)
    NameLabel.AlwaysOnTop = true
    NameLabel.Parent = HRP
    
    local NameText = Instance.new("TextLabel")
    NameText.Size = UDim2.new(1, 0, 1, 0)
    NameText.BackgroundTransparency = 1
    NameText.Text = Player.Name
    NameText.TextColor3 = Color3.fromRGB(255, 255, 255)
    NameText.TextScaled = true
    NameText.Font = Enum.Font.GothamBold
    NameText.Parent = NameLabel
    
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
        for _, Folder in pairs(ESPObjects) do
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

local function StopESP()
    if ESPConnection then
        ESPConnection:Disconnect()
        ESPConnection = nil
    end
    for _, Folder in pairs(ESPObjects) do
        Folder:Destroy()
    end
    ESPObjects = {}
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
    Circle.ImageColor3 = Color3.fromRGB(0, 255, 50)
    Circle.ImageTransparency = 0.3
    Circle.Parent = CircleGui
    
    local Dot = Instance.new("ImageLabel")
    Dot.Size = UDim2.new(0, 4, 0, 4)
    Dot.Position = UDim2.new(0.5, -2, 0.5, -2)
    Dot.BackgroundTransparency = 1
    Dot.Image = "rbxassetid://5551475664"
    Dot.ImageColor3 = Color3.fromRGB(255, 0, 0)
    Dot.Parent = Circle
end

local function GetClosestTarget()
    local Char = LocalPlayer.Character
    if not Char then return nil end
    
    local HRP = Char:FindFirstChild("HumanoidRootPart")
    if not HRP then return nil end
    
    local Closest = nil
    local ClosestDist = Settings.Range
    
    for _, Player in ipairs(Players:GetPlayers()) do
        if Player ~= LocalPlayer then
            local TChar = Player.Character
            if TChar then
                local THRP = TChar:FindFirstChild("HumanoidRootPart")
                if THRP then
                    local Dist = (HRP.Position - THRP.Position).Magnitude
                    if Dist < ClosestDist then
                        local Hum = TChar:FindFirstChildOfClass("Humanoid")
                        if Hum and Hum.Health > 0 then
                            Closest = TChar
                            ClosestDist = Dist
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
    
    local TargetPart = Target:FindFirstChild("Head") or Target:FindFirstChild("HumanoidRootPart")
    if not TargetPart then return end
    
    local BV = Projectile:FindFirstChild("TrackVelocity")
    if BV then BV:Destroy() end
    
    local NewBV = Instance.new("BodyVelocity")
    NewBV.Name = "TrackVelocity"
    NewBV.MaxForce = Vector3.new(9e9, 9e9, 9e9)
    NewBV.P = 9e9
    
    local Dir = (TargetPart.Position - Projectile.Position).Unit
    NewBV.Velocity = Dir * 500
    NewBV.Parent = Projectile
    
    task.spawn(function()
        local Start = tick()
        while Projectile and Projectile.Parent and (Projectile.Position - TargetPart.Position).Magnitude > 2 do
            if not Settings.Enabled then break end
            if tick() - Start > 5 then break end
            
            local NewDir = (TargetPart.Position - Projectile.Position).Unit
            NewBV.Velocity = NewDir * 500
            task.wait()
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

local function CreateUI()
    if MainGui then
        MainGui:Destroy()
        MainGui = nil
    end
    
    MainGui = Instance.new("ScreenGui")
    MainGui.Name = "BulletTrackGUI"
    MainGui.Parent = LocalPlayer.PlayerGui
    MainGui.ResetOnSpawn = false
    
    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(0, 220, 0, 200)
    Frame.Position = UDim2.new(0.5, -110, 0.8, -100)
    Frame.BackgroundColor3 = Color3.fromRGB(10, 10, 20)
    Frame.BackgroundTransparency = 0.1
    Frame.BorderSizePixel = 0
    Frame.ClipsDescendants = true
    Frame.Parent = MainGui
    
    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 10)
    Corner.Parent = Frame
    
    local TitleBar = Instance.new("Frame")
    TitleBar.Size = UDim2.new(1, 0, 0, 28)
    TitleBar.BackgroundColor3 = Color3.fromRGB(0, 100, 200)
    TitleBar.BackgroundTransparency = 0.2
    TitleBar.BorderSizePixel = 0
    TitleBar.Parent = Frame
    
    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(0.7, 0, 1, 0)
    Title.Position = UDim2.new(0, 10, 0, 0)
    Title.BackgroundTransparency = 1
    Title.Text = "🎯 بولت تراك"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextScaled = true
    Title.Font = Enum.Font.GothamBold
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.Parent = TitleBar
    
    local CloseBtn = Instance.new("TextButton")
    CloseBtn.Size = UDim2.new(0, 22, 0, 22)
    CloseBtn.Position = UDim2.new(0.9, 0, 0.1, 0)
    CloseBtn.BackgroundTransparency = 1
    CloseBtn.Text = "✕"
    CloseBtn.TextColor3 = Color3.fromRGB(255, 50, 50)
    CloseBtn.TextScaled = true
    CloseBtn.Font = Enum.Font.GothamBold
    CloseBtn.Parent = TitleBar
    
    CloseBtn.MouseButton1Click:Connect(function()
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
        StopESP()
        for _, BV in ipairs(workspace:GetDescendants()) do
            if BV.Name == "TrackVelocity" then
                BV:Destroy()
            end
        end
    end)
    
    local Status = Instance.new("TextLabel")
    Status.Size = UDim2.new(1, 0, 0, 22)
    Status.Position = UDim2.new(0, 0, 0, 32)
    Status.BackgroundTransparency = 1
    Status.Text = "❌ معطل"
    Status.TextColor3 = Color3.fromRGB(255, 80, 80)
    Status.TextScaled = true
    Status.Font = Enum.Font.GothamBold
    Status.Parent = Frame
    
    local ToggleBtn = Instance.new("TextButton")
    ToggleBtn.Size = UDim2.new(0.8, 0, 0, 30)
    ToggleBtn.Position = UDim2.new(0.1, 0, 0, 58)
    ToggleBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 50)
    ToggleBtn.Text = "▶ تشغيل التتبع"
    ToggleBtn.TextColor3 = Color3.fromRGB(0, 255, 100)
    ToggleBtn.TextScaled = true
    ToggleBtn.Font = Enum.Font.GothamBold
    ToggleBtn.BorderSizePixel = 0
    ToggleBtn.Parent = Frame
    
    local ToggleCorner = Instance.new("UICorner")
    ToggleCorner.CornerRadius = UDim.new(0, 6)
    ToggleCorner.Parent = ToggleBtn
    
    local ESPBtn = Instance.new("TextButton")
    ESPBtn.Size = UDim2.new(0.8, 0, 0, 28)
    ESPBtn.Position = UDim2.new(0.1, 0, 0, 93)
    ESPBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 50)
    ESPBtn.Text = "👁️ تشغيل ESP"
    ESPBtn.TextColor3 = Color3.fromRGB(255, 200, 50)
    ESPBtn.TextScaled = true
    ESPBtn.Font = Enum.Font.GothamBold
    ESPBtn.BorderSizePixel = 0
    ESPBtn.Parent = Frame
    
    local ESPCorner = Instance.new("UICorner")
    ESPCorner.CornerRadius = UDim.new(0, 6)
    ESPCorner.Parent = ESPBtn
    
    local RangeLabel = Instance.new("TextLabel")
    RangeLabel.Size = UDim2.new(0.4, 0, 0, 20)
    RangeLabel.Position = UDim2.new(0.05, 0, 0, 130)
    RangeLabel.BackgroundTransparency = 1
    RangeLabel.Text = "المدى: 200"
    RangeLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    RangeLabel.TextScaled = true
    RangeLabel.Font = Enum.Font.Gotham
    RangeLabel.TextXAlignment = Enum.TextXAlignment.Left
    RangeLabel.Parent = Frame
    
    local RangeBar = Instance.new("Frame")
    RangeBar.Size = UDim2.new(0.5, 0, 0, 6)
    RangeBar.Position = UDim2.new(0.42, 0, 0, 134)
    RangeBar.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
    RangeBar.BorderSizePixel = 0
    RangeBar.Parent = Frame
    
    local BarCorner = Instance.new("UICorner")
    BarCorner.CornerRadius = UDim.new(0, 3)
    BarCorner.Parent = RangeBar
    
    local BarFill = Instance.new("Frame")
    BarFill.Size = UDim2.new(0.5, 0, 1, 0)
    BarFill.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
    BarFill.BorderSizePixel = 0
    BarFill.Parent = RangeBar
    
    local FillCorner = Instance.new("UICorner")
    FillCorner.CornerRadius = UDim.new(0, 3)
    FillCorner.Parent = BarFill
    
    local function UpdateRange(Value)
        local Clamped = math.clamp(Value, 50, 500)
        Settings.Range = Clamped
        BarFill.Size = UDim2.new((Clamped - 50) / 450, 0, 1, 0)
        RangeLabel.Text = "المدى: " .. math.floor(Clamped)
    end
    
    local function ToggleTrack()
        Settings.Enabled = not Settings.Enabled
        
        if Settings.Enabled then
            ToggleBtn.Text = "⏹ إيقاف التتبع"
            ToggleBtn.TextColor3 = Color3.fromRGB(255, 80, 80)
            Status.Text = "✅ مفعل"
            Status.TextColor3 = Color3.fromRGB(0, 255, 100)
            ToggleBtn.BackgroundColor3 = Color3.fromRGB(60, 20, 20)
            StartTracking()
            CreateCircle()
        else
            ToggleBtn.Text = "▶ تشغيل التتبع"
            ToggleBtn.TextColor3 = Color3.fromRGB(0, 255, 100)
            Status.Text = "❌ معطل"
            Status.TextColor3 = Color3.fromRGB(255, 80, 80)
            ToggleBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 50)
            
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
            ESPBtn.Text = "👁️ إيقاف ESP"
            ESPBtn.TextColor3 = Color3.fromRGB(0, 255, 100)
            ESPBtn.BackgroundColor3 = Color3.fromRGB(20, 60, 20)
            StartESP()
        else
            ESPBtn.Text = "👁️ تشغيل ESP"
            ESPBtn.TextColor3 = Color3.fromRGB(255, 200, 50)
            ESPBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 50)
            StopESP()
        end
    end
    
    ToggleBtn.MouseButton1Click:Connect(ToggleTrack)
    ESPBtn.MouseButton1Click:Connect(ToggleESP)
    
    local Dragging = false
    Mouse.Button1Down:Connect(function()
        local MousePos = Mouse.X
        local SliderPos = RangeBar.AbsolutePosition.X
        local SliderSize = RangeBar.AbsoluteSize.X
        if MousePos >= SliderPos and MousePos <= SliderPos + SliderSize then
            Dragging = true
        end
    end)
    
    Mouse.Button1Up:Connect(function()
        Dragging = false
    end)
    
    Mouse.Move:Connect(function()
        if not Dragging then return end
        local MousePos = Mouse.X
        local SliderPos = RangeBar.AbsolutePosition.X
        local SliderSize = RangeBar.AbsoluteSize.X
        if SliderSize > 0 then
            local Value = ((MousePos - SliderPos) / SliderSize) * 450 + 50
            UpdateRange(Value)
        end
    end)
end

CreateUI()
