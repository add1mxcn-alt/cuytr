-- واجهة سكربت Roblox موبايل مع AIMBOT و ESP
-- تشغيل على اكسكيوتر

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Camera = workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

-- ====== الألوان ======
local Colors = {
    Primary = Color3.fromRGB(0, 150, 255),
    Secondary = Color3.fromRGB(30, 30, 50),
    Background = Color3.fromRGB(15, 15, 25),
    Text = Color3.fromRGB(255, 255, 255),
    Accent = Color3.fromRGB(0, 200, 255),
    Green = Color3.fromRGB(0, 255, 100),
    Red = Color3.fromRGB(255, 50, 50)
}

-- ====== إنشاء الواجهة الرئيسية ======
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "HackGui"
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Colors.Background
MainFrame.BackgroundTransparency = 0.05
MainFrame.BorderSizePixel = 2
MainFrame.BorderColor3 = Colors.Primary
MainFrame.Size = UDim2.new(0, 450, 0, 550)
MainFrame.Position = UDim2.new(0.5, -225, 0.5, -275)

local MainCorner = Instance.new("UICorner")
MainCorner.Parent = MainFrame
MainCorner.CornerRadius = UDim.new(0, 12)

-- ====== شريط العنوان ======
local TitleBar = Instance.new("Frame")
TitleBar.Parent = MainFrame
TitleBar.BackgroundColor3 = Colors.Primary
TitleBar.BackgroundTransparency = 0.2
TitleBar.BorderSizePixel = 0
TitleBar.Size = UDim2.new(1, 0, 0, 40)

local TitleCorner = Instance.new("UICorner")
TitleCorner.Parent = TitleBar
TitleCorner.CornerRadius = UDim.new(0, 12)

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Parent = TitleBar
TitleLabel.BackgroundTransparency = 1
TitleLabel.Size = UDim2.new(1, -50, 1, 0)
TitleLabel.Position = UDim2.new(0, 15, 0, 0)
TitleLabel.Text = "⚡ سكربت احترافي ⚡"
TitleLabel.TextColor3 = Colors.Text
TitleLabel.TextSize = 18
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

-- زر إخفاء الواجهة
local HideBtn = Instance.new("TextButton")
HideBtn.Parent = TitleBar
HideBtn.BackgroundColor3 = Colors.Text
HideBtn.BackgroundTransparency = 0.2
HideBtn.Size = UDim2.new(0, 28, 0, 28)
HideBtn.Position = UDim2.new(1, -38, 0, 6)
HideBtn.Text = "✕"
HideBtn.TextColor3 = Colors.Text
HideBtn.TextSize = 16
HideBtn.Font = Enum.Font.GothamBold
HideBtn.BorderSizePixel = 0

local HideCorner = Instance.new("UICorner")
HideCorner.Parent = HideBtn
HideCorner.CornerRadius = UDim.new(1, 0)

local Visible = true
HideBtn.MouseButton1Click:Connect(function()
    Visible = not Visible
    MainFrame.Visible = Visible
end)

-- ====== أزرار التابات ======
local TabFrame = Instance.new("Frame")
TabFrame.Parent = MainFrame
TabFrame.BackgroundTransparency = 1
TabFrame.Size = UDim2.new(1, 0, 0, 35)
TabFrame.Position = UDim2.new(0, 0, 0, 40)

local Tab1 = Instance.new("TextButton")
Tab1.Parent = TabFrame
Tab1.BackgroundColor3 = Colors.Primary
Tab1.BackgroundTransparency = 0.3
Tab1.Size = UDim2.new(0.5, -2, 1, -4)
Tab1.Position = UDim2.new(0, 2, 0, 2)
Tab1.Text = "🎯 AIMBOT"
Tab1.TextColor3 = Colors.Text
Tab1.TextSize = 15
Tab1.Font = Enum.Font.GothamBold
Tab1.BorderSizePixel = 0

local Tab1Corner = Instance.new("UICorner")
Tab1Corner.Parent = Tab1
Tab1Corner.CornerRadius = UDim.new(0, 6)

local Tab2 = Instance.new("TextButton")
Tab2.Parent = TabFrame
Tab2.BackgroundColor3 = Colors.Secondary
Tab2.BackgroundTransparency = 0.3
Tab2.Size = UDim2.new(0.5, -2, 1, -4)
Tab2.Position = UDim2.new(0.5, 2, 0, 2)
Tab2.Text = "👁️ ESP"
Tab2.TextColor3 = Colors.Text
Tab2.TextSize = 15
Tab2.Font = Enum.Font.GothamBold
Tab2.BorderSizePixel = 0

local Tab2Corner = Instance.new("UICorner")
Tab2Corner.Parent = Tab2
Tab2Corner.CornerRadius = UDim.new(0, 6)

-- ====== محتوى التابات ======
local ContentFrame = Instance.new("Frame")
ContentFrame.Parent = MainFrame
ContentFrame.BackgroundTransparency = 1
ContentFrame.Size = UDim2.new(1, -10, 1, -85)
ContentFrame.Position = UDim2.new(0, 5, 0, 80)

-- Tab 1: AIMBOT
local AimbotTab = Instance.new("ScrollingFrame")
AimbotTab.Parent = ContentFrame
AimbotTab.BackgroundTransparency = 1
AimbotTab.Size = UDim2.new(1, 0, 1, 0)
AimbotTab.ScrollBarThickness = 3
AimbotTab.ScrollBarImageColor3 = Colors.Primary
AimbotTab.CanvasSize = UDim2.new(0, 0, 0, 480)

-- Tab 2: ESP
local EspTab = Instance.new("ScrollingFrame")
EspTab.Parent = ContentFrame
EspTab.BackgroundTransparency = 1
EspTab.Size = UDim2.new(1, 0, 1, 0)
EspTab.ScrollBarThickness = 3
EspTab.ScrollBarImageColor3 = Colors.Primary
EspTab.CanvasSize = UDim2.new(0, 0, 0, 480)
EspTab.Visible = false

-- ====== دالة إنشاء زر تبديل ======
function CreateToggle(parent, text, yPos, default)
    local Frame = Instance.new("Frame")
    Frame.Parent = parent
    Frame.BackgroundTransparency = 1
    Frame.Size = UDim2.new(1, 0, 0, 32)
    Frame.Position = UDim2.new(0, 0, 0, yPos)
    
    local Label = Instance.new("TextLabel")
    Label.Parent = Frame
    Label.BackgroundTransparency = 1
    Label.Size = UDim2.new(0.7, 0, 1, 0)
    Label.Position = UDim2.new(0, 5, 0, 0)
    Label.Text = text
    Label.TextColor3 = Colors.Text
    Label.TextSize = 13
    Label.Font = Enum.Font.Gotham
    Label.TextXAlignment = Enum.TextXAlignment.Left
    
    local Btn = Instance.new("TextButton")
    Btn.Parent = Frame
    Btn.BackgroundColor3 = default and Colors.Primary or Colors.Secondary
    Btn.Size = UDim2.new(0, 32, 0, 28)
    Btn.Position = UDim2.new(1, -40, 0, 2)
    Btn.Text = default and "✓" or "✕"
    Btn.TextColor3 = Colors.Text
    Btn.TextSize = 14
    Btn.Font = Enum.Font.GothamBold
    Btn.BorderSizePixel = 0
    
    local BtnCorner = Instance.new("UICorner")
    BtnCorner.Parent = Btn
    BtnCorner.CornerRadius = UDim.new(1, 0)
    
    local Value = default
    Btn.MouseButton1Click:Connect(function()
        Value = not Value
        Btn.BackgroundColor3 = Value and Colors.Primary or Colors.Secondary
        Btn.Text = Value and "✓" or "✕"
    end)
    
    return function() return Value end
end

-- ====== دالة إنشاء قائمة منسدلة ======
function CreateDropdown(parent, text, yPos, options, defaultIdx)
    local Frame = Instance.new("Frame")
    Frame.Parent = parent
    Frame.BackgroundTransparency = 1
    Frame.Size = UDim2.new(1, 0, 0, 32)
    Frame.Position = UDim2.new(0, 0, 0, yPos)
    
    local Label = Instance.new("TextLabel")
    Label.Parent = Frame
    Label.BackgroundTransparency = 1
    Label.Size = UDim2.new(0.35, 0, 1, 0)
    Label.Position = UDim2.new(0, 5, 0, 0)
    Label.Text = text
    Label.TextColor3 = Colors.Text
    Label.TextSize = 13
    Label.Font = Enum.Font.Gotham
    Label.TextXAlignment = Enum.TextXAlignment.Left
    
    local Btn = Instance.new("TextButton")
    Btn.Parent = Frame
    Btn.BackgroundColor3 = Colors.Secondary
    Btn.Size = UDim2.new(0.6, -10, 1, -4)
    Btn.Position = UDim2.new(0.4, 5, 0, 2)
    Btn.Text = options[defaultIdx or 1]
    Btn.TextColor3 = Colors.Text
    Btn.TextSize = 12
    Btn.Font = Enum.Font.Gotham
    Btn.BorderSizePixel = 0
    
    local BtnCorner = Instance.new("UICorner")
    BtnCorner.Parent = Btn
    BtnCorner.CornerRadius = UDim.new(0, 4)
    
    local Selected = defaultIdx or 1
    Btn.MouseButton1Click:Connect(function()
        Selected = Selected % #options + 1
        Btn.Text = options[Selected]
    end)
    
    return function() return Selected, options[Selected] end
end

-- ====== AIMBOT Settings ======
local aimY = 5

local AimbotEnabled = CreateToggle(AimbotTab, "🔫 تفعيل الـ AIMBOT", aimY, true)
aimY = aimY + 37

local AimPart = CreateDropdown(AimbotTab, "🎯 نقطة التصويب:", aimY, {"الرأس", "الجسم", "الرجل"}, 1)
aimY = aimY + 37

local Priority = CreateDropdown(AimbotTab, "🎯 أولوية التحديد:", aimY, {"الأقرب", "الأبعد", "أقل دم"}, 1)
aimY = aimY + 37

local WallCheck = CreateToggle(AimbotTab, "🧱 تجاهل خلف الجدار", aimY, true)
aimY = aimY + 37

local TeamCheck = CreateToggle(AimbotTab, "👥 تجاهل فريقك", aimY, true)
aimY = aimY + 37

-- FOV Slider
local FovFrame = Instance.new("Frame")
FovFrame.Parent = AimbotTab
FovFrame.BackgroundTransparency = 1
FovFrame.Size = UDim2.new(1, 0, 0, 32)
FovFrame.Position = UDim2.new(0, 0, 0, aimY)

local FovLabel = Instance.new("TextLabel")
FovLabel.Parent = FovFrame
FovLabel.BackgroundTransparency = 1
FovLabel.Size = UDim2.new(0.35, 0, 1, 0)
FovLabel.Position = UDim2.new(0, 5, 0, 0)
FovLabel.Text = "📏 مسافة FOV:"
FovLabel.TextColor3 = Colors.Text
FovLabel.TextSize = 13
FovLabel.Font = Enum.Font.Gotham
FovLabel.TextXAlignment = Enum.TextXAlignment.Left

local FovValue = Instance.new("TextLabel")
FovValue.Parent = FovFrame
FovValue.BackgroundTransparency = 1
FovValue.Size = UDim2.new(0.1, 0, 1, 0)
FovValue.Position = UDim2.new(0.35, 5, 0, 0)
FovValue.Text = "200"
FovValue.TextColor3 = Colors.Primary
FovValue.TextSize = 13
FovValue.Font = Enum.Font.GothamBold

local FovInput = Instance.new("TextBox")
FovInput.Parent = FovFrame
FovInput.BackgroundColor3 = Colors.Secondary
FovInput.Size = UDim2.new(0.5, -10, 1, -4)
FovInput.Position = UDim2.new(0.5, 5, 0, 2)
FovInput.Text = "200"
FovInput.TextColor3 = Colors.Text
FovInput.TextSize = 12
FovInput.Font = Enum.Font.Gotham
FovInput.BorderSizePixel = 0

local FovInputCorner = Instance.new("UICorner")
FovInputCorner.Parent = FovInput
FovInputCorner.CornerRadius = UDim.new(0, 4)

local FovSize = 200
FovInput.FocusLost:Connect(function()
    local num = tonumber(FovInput.Text)
    if num then
        FovSize = math.clamp(num, 10, 500)
        FovInput.Text = tostring(FovSize)
        FovValue.Text = tostring(FovSize)
        UpdateFOVCircle()
    else
        FovInput.Text = tostring(FovSize)
    end
end)

aimY = aimY + 37

-- ====== دائرة FOV ======
local FOVCircle = Instance.new("Frame")
FOVCircle.Parent = ScreenGui
FOVCircle.BackgroundTransparency = 0.8
FOVCircle.BorderSizePixel = 2
FOVCircle.BorderColor3 = Colors.Primary
FOVCircle.BackgroundColor3 = Colors.Primary
FOVCircle.Size = UDim2.new(0, 0, 0, 0)
FOVCircle.Position = UDim2.new(0.5, 0, 0.5, 0)
FOVCircle.Visible = false

local FOVCircleCorner = Instance.new("UICorner")
FOVCircleCorner.Parent = FOVCircle
FOVCircleCorner.CornerRadius = UDim.new(1, 0)

function UpdateFOVCircle()
    if AimbotEnabled() then
        FOVCircle.Visible = true
        local size = FovSize * 2
        local scale = Camera.ViewportSize.X / 1000
        local finalSize = size * scale
        FOVCircle.Size = UDim2.new(0, finalSize, 0, finalSize)
        FOVCircle.Position = UDim2.new(0.5, -finalSize/2, 0.5, -finalSize/2)
        FOVCircle.BackgroundTransparency = 0.85
    else
        FOVCircle.Visible = false
    end
end

-- ====== ESP Settings ======
local espY = 5

local EspEnabled = CreateToggle(EspTab, "👁️ تفعيل الـ ESP", espY, true)
espY = espY + 37

local NameToggle = CreateToggle(EspTab, "📝 إظهار الأسماء", espY, true)
espY = espY + 37

local BoxToggle = CreateToggle(EspTab, "📦 إظهار المربع", espY, true)
espY = espY + 37

local DistanceToggle = CreateToggle(EspTab, "📏 إظهار المسافة", espY, true)
espY = espY + 37

local HealthToggle = CreateToggle(EspTab, "❤️ إظهار الدم", espY, true)
espY = espY + 37

local ArrowToggle = CreateToggle(EspTab, "⬆️ إظهار السهم", espY, true)
espY = espY + 37

local EspFriends = CreateToggle(EspTab, "👫 إخفاء ESP الأصدقاء", espY, false)
espY = espY + 37

-- ====== تبديل التابات ======
Tab1.MouseButton1Click:Connect(function()
    AimbotTab.Visible = true
    EspTab.Visible = false
    Tab1.BackgroundColor3 = Colors.Primary
    Tab2.BackgroundColor3 = Colors.Secondary
end)

Tab2.MouseButton1Click:Connect(function()
    AimbotTab.Visible = false
    EspTab.Visible = true
    Tab2.BackgroundColor3 = Colors.Primary
    Tab1.BackgroundColor3 = Colors.Secondary
end)

-- ====== نظام ESP ======
local EspObjects = {}
local EspColor = Colors.Primary

function CreateESP(player)
    if player == LocalPlayer then return end
    
    local Box = Instance.new("Frame")
    Box.Parent = ScreenGui
    Box.BackgroundTransparency = 0.8
    Box.BorderSizePixel = 2
    Box.BorderColor3 = EspColor
    Box.BackgroundColor3 = EspColor
    Box.Visible = false
    
    local Name = Instance.new("TextLabel")
    Name.Parent = ScreenGui
    Name.BackgroundTransparency = 1
    Name.Size = UDim2.new(0, 200, 0, 18)
    Name.Text = player.Name
    Name.TextColor3 = Colors.Text
    Name.TextSize = 13
    Name.Font = Enum.Font.GothamBold
    Name.TextStrokeTransparency = 0.3
    Name.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    Name.Visible = false
    
    local Dist = Instance.new("TextLabel")
    Dist.Parent = ScreenGui
    Dist.BackgroundTransparency = 1
    Dist.Size = UDim2.new(0, 100, 0, 16)
    Dist.Text = "0m"
    Dist.TextColor3 = Colors.Text
    Dist.TextSize = 12
    Dist.Font = Enum.Font.Gotham
    Dist.TextStrokeTransparency = 0.3
    Dist.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    Dist.Visible = false
    
    local HealthBg = Instance.new("Frame")
    HealthBg.Parent = ScreenGui
    HealthBg.Size = UDim2.new(0, 50, 0, 3)
    HealthBg.BackgroundColor3 = Colors.Secondary
    HealthBg.BorderSizePixel = 0
    HealthBg.Visible = false
    
    local Health = Instance.new("Frame")
    Health.Parent = ScreenGui
    Health.Size = UDim2.new(0, 50, 0, 3)
    Health.BackgroundColor3 = Colors.Green
    Health.BorderSizePixel = 0
    Health.Visible = false
    
    local Arrow = Instance.new("TextLabel")
    Arrow.Parent = ScreenGui
    Arrow.BackgroundTransparency = 1
    Arrow.Size = UDim2.new(0, 25, 0, 25)
    Arrow.Text = "⬇️"
    Arrow.TextColor3 = EspColor
    Arrow.TextSize = 20
    Arrow.Visible = false
    
    EspObjects[player] = {
        Box = Box,
        Name = Name,
        Dist = Dist,
        Health = Health,
        HealthBg = HealthBg,
        Arrow = Arrow,
        Player = player
    }
end

function UpdateESP()
    if not EspEnabled() then
        for _, data in pairs(EspObjects) do
            data.Box.Visible = false
            data.Name.Visible = false
            data.Dist.Visible = false
            data.Health.Visible = false
            data.HealthBg.Visible = false
            data.Arrow.Visible = false
        end
        return
    end
    
    for _, data in pairs(EspObjects) do
        local player = data.Player
        if not player or not player.Character or not player.Character:FindFirstChild("Humanoid") or not player.Character:FindFirstChild("Head") then
            data.Box.Visible = false
            data.Name.Visible = false
            data.Dist.Visible = false
            data.Health.Visible = false
            data.HealthBg.Visible = false
            data.Arrow.Visible = false
            goto continue
        end
        
        if EspFriends() and player:IsFriendsWith(LocalPlayer.UserId) then
            data.Box.Visible = false
            data.Name.Visible = false
            data.Dist.Visible = false
            data.Health.Visible = false
            data.HealthBg.Visible = false
            data.Arrow.Visible = false
            goto continue
        end
        
        local head = player.Character.Head
        local humanoid = player.Character.Humanoid
        local root = player.Character:FindFirstChild("HumanoidRootPart")
        if not root then goto continue end
        
        local vec, onScreen = Camera:WorldToScreenPoint(root.Position)
        local headPos, headOn = Camera:WorldToScreenPoint(head.Position + Vector3.new(0, 1.5, 0))
        local feetPos, feetOn = Camera:WorldToScreenPoint(root.Position - Vector3.new(0, 3, 0))
        
        if not onScreen and not headOn and not feetOn then
            data.Box.Visible = false
            data.Name.Visible = false
            data.Dist.Visible = false
            data.Health.Visible = false
            data.HealthBg.Visible = false
            data.Arrow.Visible = false
            goto continue
        end
        
        local dist = (LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and 
                     (LocalPlayer.Character.HumanoidRootPart.Position - root.Position).Magnitude) or 0
        
        local height = math.abs(headPos.Y - feetPos.Y)
        local width = height * 0.6
        local x = vec.X - width/2
        local y = feetPos.Y - height
        
        if BoxToggle() then
            data.Box.Visible = true
            data.Box.Size = UDim2.new(0, width, 0, height)
            data.Box.Position = UDim2.new(0, x, 0, y)
        else
            data.Box.Visible = false
        end
        
        if NameToggle() then
            data.Name.Visible = true
            data.Name.Position = UDim2.new(0, x + width/2 - 100, 0, y - 18)
        else
            data.Name.Visible = false
        end
        
        if DistanceToggle() then
            data.Dist.Visible = true
            data.Dist.Position = UDim2.new(0, x + width/2 - 50, 0, y + height + 2)
            data.Dist.Text = string.format("%.1fm", dist)
        else
            data.Dist.Visible = false
        end
        
        if HealthToggle() then
            local hp = humanoid.Health / humanoid.MaxHealth
            data.HealthBg.Visible = true
            data.HealthBg.Position = UDim2.new(0, x + 5, 0, y + height + 16)
            data.Health.Visible = true
            data.Health.Position = UDim2.new(0, x + 5, 0, y + height + 16)
            data.Health.Size = UDim2.new(0, (width - 10) * hp, 0, 3)
            data.Health.BackgroundColor3 = hp > 0.5 and Colors.Green or 
                                          hp > 0.25 and Color3.fromRGB(255, 200, 0) or 
                                          Colors.Red
        else
            data.Health.Visible = false
            data.HealthBg.Visible = false
        end
        
        if ArrowToggle() then
            if not onScreen then
                data.Arrow.Visible = true
                local size = Camera.ViewportSize
                local center = Vector2.new(size.X/2, size.Y/2)
                local dir = (Vector2.new(vec.X, vec.Y) - center).Unit
                local pos = center + dir * math.min(size.X, size.Y) * 0.4
                data.Arrow.Position = UDim2.new(0, pos.X - 12, 0, pos.Y - 12)
            else
                data.Arrow.Visible = false
            end
        else
            data.Arrow.Visible = false
        end
        
        ::continue::
    end
end

-- ====== نظام AIMBOT ======
local Target = nil

function IsVisible(origin, targetPos)
    local ray = Ray.new(origin, (targetPos - origin).Unit * (targetPos - origin).Magnitude)
    local hit, pos = workspace:FindPartOnRayWithIgnoreList(ray, {LocalPlayer.Character})
    if hit then
        return (pos - origin).Magnitude >= (targetPos - origin).Magnitude - 1
    end
    return true
end

function GetBestTarget()
    if not LocalPlayer.Character or not LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then return nil end
    
    local origin = LocalPlayer.Character.HumanoidRootPart.Position
    local bestScore = math.huge
    local bestTarget = nil
    
    for _, player in pairs(Players:GetPlayers()) do
        if player == LocalPlayer then continue end
        if not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then continue end
        if not player.Character:FindFirstChild("Head") then continue end
        
        if TeamCheck() and LocalPlayer.Team and player.Team == LocalPlayer.Team then
            continue
        end
        
        local root = player.Character.HumanoidRootPart
        local head = player.Character.Head
        local targetPos = root.Position
        
        if WallCheck() and not IsVisible(origin, targetPos) then
            continue
        end
        
        local dist = (origin - targetPos).Magnitude
        
        if dist > FovSize then
            continue
        end
        
        local _, priorityName = Priority()
        local score = 0
        
        if priorityName == "الأقرب" then
            score = dist
        elseif priorityName == "الأبعد" then
            score = -dist
        elseif priorityName == "أقل دم" then
            local hum = player.Character:FindFirstChild("Humanoid")
            score = hum and hum.Health or 100
        end
        
        if score < bestScore then
            bestScore = score
            bestTarget = {
                Player = player,
                Root = root,
                Head = head,
                Dist = dist
            }
        end
    end
    
    return bestTarget
end

-- ====== اللوب الرئيسي ======
RunService.RenderStepped:Connect(function()
    if AimbotEnabled() then
        local best = GetBestTarget()
        Target = best
        
        if best and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local _, aimPartName = AimPart()
            local targetPos
            
            if aimPartName == "الرأس" then
                targetPos = best.Head.Position
            elseif aimPartName == "الجسم" then
                targetPos = best.Root.Position
            else
                targetPos = best.Root.Position - Vector3.new(0, 2, 0)
            end
            
            Camera.CFrame = CFrame.lookAt(Camera.CFrame.Position, targetPos)
        end
        
        UpdateFOVCircle()
    else
        FOVCircle.Visible = false
    end
    
    UpdateESP()
end)

-- ====== إضافة وإزالة اللاعبين ======
Players.PlayerAdded:Connect(function(player)
    if player ~= LocalPlayer then
        CreateESP(player)
    end
end)

Players.PlayerRemoving:Connect(function(player)
    if EspObjects[player] then
        for _, obj in pairs(EspObjects[player]) do
            obj:Destroy()
        end
        EspObjects[player] = nil
    end
end)

for _, player in pairs(Players:GetPlayers()) do
    if player ~= LocalPlayer then
        CreateESP(player)
    end
end

-- ====== زر إخفاء باللمس للموبايل ======
local touchBtn = Instance.new("TextButton")
touchBtn.Parent = ScreenGui
touchBtn.BackgroundColor3 = Colors.Primary
touchBtn.BackgroundTransparency = 0.2
touchBtn.Size = UDim2.new(0, 50, 0, 50)
touchBtn.Position = UDim2.new(0, 10, 1, -60)
touchBtn.Text = "☰"
touchBtn.TextColor3 = Colors.Text
touchBtn.TextSize = 20
touchBtn.Font = Enum.Font.GothamBold
touchBtn.BorderSizePixel = 0

local touchCorner = Instance.new("UICorner")
touchCorner.Parent = touchBtn
touchCorner.CornerRadius = UDim.new(1, 0)

touchBtn.MouseButton1Click:Connect(function()
    Visible = not Visible
    MainFrame.Visible = Visible
end)

-- ====== أنيميشن دخول ======
MainFrame.Size = UDim2.new(0, 0, 0, 0)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)

local TweenIn = TweenService:Create(MainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
    Size = UDim2.new(0, 450, 0, 550),
    Position = UDim2.new(0.5, -225, 0.5, -275)
})
TweenIn:Play()

print("✅ تم تشغيل السكربت بنجاح للموبايل!")
