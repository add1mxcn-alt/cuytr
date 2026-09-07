-- ============================================
-- واجهة C4 - Shadow Mode V99
-- ============================================

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local guiService = game:GetService("GuiService")

-- إنشاء ScreenGui رئيسي
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "C4_MainGUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")

-- =======================
-- الجزء الأول: الترحيب
-- =======================
local welcomeFrame = Instance.new("Frame")
welcomeFrame.Size = UDim2.new(0, 280, 0, 180)
welcomeFrame.Position = UDim2.new(0.5, -140, 0.5, -90)
welcomeFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
welcomeFrame.BorderSizePixel = 0
welcomeFrame.ClipsDescendants = true
welcomeFrame.Parent = screenGui

-- حواف دائرية للترحيب
local welcomeCorner = Instance.new("UICorner")
welcomeCorner.CornerRadius = UDim.new(0, 20)
welcomeCorner.Parent = welcomeFrame

-- عنوان C4
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 0, 50)
titleLabel.Position = UDim2.new(0, 0, 0.15, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "⚡ C4 ⚡"
titleLabel.TextColor3 = Color3.fromRGB(255, 50, 80)
titleLabel.TextScaled = true
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextStrokeTransparency = 0.3
titleLabel.Parent = welcomeFrame

-- نص فرعي
local subLabel = Instance.new("TextLabel")
subLabel.Size = UDim2.new(1, 0, 0, 30)
subLabel.Position = UDim2.new(0, 0, 0.5, 0)
subLabel.BackgroundTransparency = 1
subLabel.Text = "Shadow Mode Ready"
subLabel.TextColor3 = Color3.fromRGB(180, 180, 200)
subLabel.TextScaled = true
subLabel.Font = Enum.Font.Gotham
subLabel.Parent = welcomeFrame

-- أنيميشن دخول الترحيب
welcomeFrame:TweenSizeAndPosition(
    UDim2.new(0, 280, 0, 180),
    UDim2.new(0.5, -140, 0.5, -90),
    Enum.EasingDirection.Out,
    Enum.EasingStyle.Back,
    0.8,
    true
)

-- ============================================
-- الانتقال إلى الواجهة الرئيسية بعد 2.5 ثانية
-- ============================================
task.wait(2.5)

-- إخفاء الترحيب بأنيميشن
welcomeFrame:TweenSizeAndPosition(
    UDim2.new(0, 0, 0, 0),
    UDim2.new(0.5, 0, 0.5, 0),
    Enum.EasingDirection.In,
    Enum.EasingStyle.Quad,
    0.4,
    true
)
task.wait(0.5)
welcomeFrame.Visible = false

-- =======================
-- الواجهة الرئيسية (مصغرة للجوال)
-- =======================
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 300, 0, 380)
mainFrame.Position = UDim2.new(0.5, -150, 0.5, -190)
mainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
mainFrame.BorderSizePixel = 0
mainFrame.ClipsDescendants = true
mainFrame.BackgroundTransparency = 1  -- للأنيميشن
mainFrame.Parent = screenGui

-- حواف دائرية للواجهة الرئيسية
local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 22)
mainCorner.Parent = mainFrame

-- شريط عنوان
local header = Instance.new("Frame")
header.Size = UDim2.new(1, 0, 0, 45)
header.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
header.BorderSizePixel = 0
header.Parent = mainFrame

local headerCorner = Instance.new("UICorner")
headerCorner.CornerRadius = UDim.new(0, 22)
headerCorner.Parent = header

-- عنوان C4 في الهيدر
local headerLabel = Instance.new("TextLabel")
headerLabel.Size = UDim2.new(1, 0, 1, 0)
headerLabel.BackgroundTransparency = 1
headerLabel.Text = "⚡ C4 ⚡"
headerLabel.TextColor3 = Color3.fromRGB(255, 50, 80)
headerLabel.TextScaled = true
headerLabel.Font = Enum.Font.GothamBold
headerLabel.Parent = header

-- =======================
-- تبويبات (Tabs)
-- =======================
local tabContainer = Instance.new("Frame")
tabContainer.Size = UDim2.new(1, 0, 1, -45)
tabContainer.Position = UDim2.new(0, 0, 0, 45)
tabContainer.BackgroundTransparency = 1
tabContainer.Parent = mainFrame

-- ========= تبويب الحقوق =========
local rightsTab = Instance.new("Frame")
rightsTab.Size = UDim2.new(1, 0, 1, 0)
rightsTab.BackgroundTransparency = 1
rightsTab.Parent = tabContainer

-- محتوى الحقوق
local rightsLabel = Instance.new("TextLabel")
rightsLabel.Size = UDim2.new(1, -20, 0, 50)
rightsLabel.Position = UDim2.new(0, 10, 0.2, 0)
rightsLabel.BackgroundTransparency = 1
rightsLabel.Text = "© جميع الحقوق محفوظة\nلـ فريق C4"
rightsLabel.TextColor3 = Color3.fromRGB(200, 200, 220)
rightsLabel.TextScaled = true
rightsLabel.Font = Enum.Font.Gotham
rightsLabel.TextXAlignment = Enum.TextXAlignment.Center
rightsLabel.Parent = rightsTab

-- أيقونة حقوق
local iconLabel = Instance.new("TextLabel")
iconLabel.Size = UDim2.new(0, 60, 0, 60)
iconLabel.Position = UDim2.new(0.5, -30, 0.55, 0)
iconLabel.BackgroundTransparency = 1
iconLabel.Text = "🔒"
iconLabel.TextScaled = true
iconLabel.Parent = rightsTab

-- ========= تبويب الاستهداف =========
local targetTab = Instance.new("Frame")
targetTab.Size = UDim2.new(1, 0, 1, 0)
targetTab.BackgroundTransparency = 1
targetTab.Visible = false  -- مخفي حتى نضغط التبويب
targetTab.Parent = tabContainer

-- محتوى الاستهداف (مؤقت)
local targetLabel = Instance.new("TextLabel")
targetLabel.Size = UDim2.new(1, -20, 0, 40)
targetLabel.Position = UDim2.new(0, 10, 0.3, 0)
targetLabel.BackgroundTransparency = 1
targetLabel.Text = "🎯 نظام الاستهداف\nجاهز للتشغيل"
targetLabel.TextColor3 = Color3.fromRGB(255, 200, 50)
targetLabel.TextScaled = true
targetLabel.Font = Enum.Font.Gotham
targetLabel.TextXAlignment = Enum.TextXAlignment.Center
targetLabel.Parent = targetTab

-- =======================
-- أزرار التبويبات (أسفل الواجهة)
-- =======================
local buttonContainer = Instance.new("Frame")
buttonContainer.Size = UDim2.new(1, 0, 0, 50)
buttonContainer.Position = UDim2.new(0, 0, 1, -50)
buttonContainer.BackgroundTransparency = 1
buttonContainer.Parent = mainFrame

-- زر الحقوق
local rightsBtn = Instance.new("TextButton")
rightsBtn.Size = UDim2.new(0, 130, 1, 0)
rightsBtn.Position = UDim2.new(0.1, 0, 0, 0)
rightsBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
rightsBtn.Text = "⚖️ حقوق"
rightsBtn.TextColor3 = Color3.fromRGB(200, 200, 220)
rightsBtn.TextScaled = true
rightsBtn.Font = Enum.Font.GothamBold
rightsBtn.BorderSizePixel = 0
rightsBtn.Parent = buttonContainer

local rightsBtnCorner = Instance.new("UICorner")
rightsBtnCorner.CornerRadius = UDim.new(0, 12)
rightsBtnCorner.Parent = rightsBtn

-- زر الاستهداف
local targetBtn = Instance.new("TextButton")
targetBtn.Size = UDim2.new(0, 130, 1, 0)
targetBtn.Position = UDim2.new(0.55, 0, 0, 0)
targetBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
targetBtn.Text = "🎯 استهداف"
targetBtn.TextColor3 = Color3.fromRGB(200, 200, 220)
targetBtn.TextScaled = true
targetBtn.Font = Enum.Font.GothamBold
targetBtn.BorderSizePixel = 0
targetBtn.Parent = buttonContainer

local targetBtnCorner = Instance.new("UICorner")
targetBtnCorner.CornerRadius = UDim.new(0, 12)
targetBtnCorner.Parent = targetBtn

-- =======================
-- وظائف التبويبات مع أنيميشن
-- =======================
local function switchTab(tabToShow)
    -- إخفاء الكل
    rightsTab.Visible = false
    targetTab.Visible = false
    
    -- إظهار المطلوب مع أنيميشن
    tabToShow.Visible = true
    tabToShow.BackgroundTransparency = 1
    tabToShow:TweenSizeAndPosition(
        UDim2.new(1, 0, 1, 0),
        UDim2.new(0, 0, 0, 0),
        Enum.EasingDirection.Out,
        Enum.EasingStyle.Quad,
        0.3,
        true
    )
end

-- أحداث الأزرار
rightsBtn.MouseButton1Click:Connect(function()
    switchTab(rightsTab)
end)

targetBtn.MouseButton1Click:Connect(function()
    switchTab(targetTab)
end)

-- =======================
-- ظهور الواجهة بأنيميشن
-- =======================
mainFrame.BackgroundTransparency = 0
mainFrame:TweenSizeAndPosition(
    UDim2.new(0, 300, 0, 380),
    UDim2.new(0.5, -150, 0.5, -190),
    Enum.EasingDirection.Out,
    Enum.EasingStyle.Elastic,
    0.7,
    true
)

-- =======================
-- تفعيل الوضع الليلي (للمظهر)
-- =================------
guiService:SetGuiInset(0, 0)  -- لجوال
