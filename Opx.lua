-- ============================================
-- واجهة C4 - نسخة خفيفة ومستقرة جداً
-- ============================================

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local guiService = game:GetService("GuiService")

-- =======================
-- GUI الرئيسي
-- =======================
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "C4_GUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")

-- =======================
-- الألوان
-- =======================
local colors = {
    bg = Color3.fromRGB(18, 18, 28),
    surface = Color3.fromRGB(28, 28, 42),
    surfaceLight = Color3.fromRGB(38, 38, 55),
    primary = Color3.fromRGB(200, 50, 80),
    text = Color3.fromRGB(220, 220, 240),
    textDim = Color3.fromRGB(160, 160, 190),
    success = Color3.fromRGB(50, 220, 100),
    danger = Color3.fromRGB(255, 60, 60),
    border = Color3.fromRGB(50, 50, 75),
}

-- =======================
-- الإطار الرئيسي
-- =======================
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 400, 0, 480)
mainFrame.Position = UDim2.new(0.5, -200, 0.5, -240)
mainFrame.BackgroundColor3 = colors.bg
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 16)
corner.Parent = mainFrame

-- =======================
-- الهيدر
-- =======================
local header = Instance.new("Frame")
header.Size = UDim2.new(1, 0, 0, 45)
header.BackgroundColor3 = colors.surface
header.BorderSizePixel = 0
header.Parent = mainFrame

local headerCorner = Instance.new("UICorner")
headerCorner.CornerRadius = UDim.new(0, 16)
headerCorner.Parent = header

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -50, 1, 0)
title.Position = UDim2.new(0, 15, 0, 0)
title.BackgroundTransparency = 1
title.Text = "⚡ C4"
title.TextColor3 = colors.primary
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = header

-- زر إخفاء
local hideBtn = Instance.new("TextButton")
hideBtn.Size = UDim2.new(0, 30, 0, 30)
hideBtn.Position = UDim2.new(1, -40, 0.5, -15)
hideBtn.BackgroundColor3 = colors.surfaceLight
hideBtn.Text = "✕"
hideBtn.TextColor3 = colors.textDim
hideBtn.TextScaled = true
hideBtn.Font = Enum.Font.Gotham
hideBtn.BorderSizePixel = 0
hideBtn.Parent = header

local hideCorner = Instance.new("UICorner")
hideCorner.CornerRadius = UDim.new(0, 8)
hideCorner.Parent = hideBtn

-- =======================
-- الزر العائم
-- =======================
local floatBtn = Instance.new("TextButton")
floatBtn.Size = UDim2.new(0, 50, 0, 50)
floatBtn.Position = UDim2.new(0.02, 0, 0.85, 0)
floatBtn.BackgroundColor3 = colors.primary
floatBtn.Text = "⚡"
floatBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
floatBtn.TextScaled = true
floatBtn.Font = Enum.Font.GothamBold
floatBtn.BorderSizePixel = 0
floatBtn.Visible = false
floatBtn.Parent = screenGui

local floatCorner = Instance.new("UICorner")
floatCorner.CornerRadius = UDim.new(1, 0)
floatCorner.Parent = floatBtn

-- =======================
-- أزرار التبويبات (جانبية)
-- =======================
local tabPanel = Instance.new("Frame")
tabPanel.Size = UDim2.new(0, 90, 1, -45)
tabPanel.Position = UDim2.new(0, 0, 0, 45)
tabPanel.BackgroundColor3 = colors.surface
tabPanel.BorderSizePixel = 0
tabPanel.Parent = mainFrame

local contentArea = Instance.new("Frame")
contentArea.Size = UDim2.new(1, -100, 1, -55)
contentArea.Position = UDim2.new(0, 95, 0, 50)
contentArea.BackgroundTransparency = 1
contentArea.Parent = mainFrame

-- =======================
-- تبويب الحقوق
-- =======================
local rightsTab = Instance.new("Frame")
rightsTab.Size = UDim2.new(1, 0, 1, 0)
rightsTab.BackgroundTransparency = 1
rightsTab.Parent = contentArea

local rightsTitle = Instance.new("TextLabel")
rightsTitle.Size = UDim2.new(1, 0, 0, 40)
rightsTitle.BackgroundTransparency = 1
rightsTitle.Text = "📜 الحقوق"
rightsTitle.TextColor3 = colors.text
rightsTitle.TextScaled = true
rightsTitle.Font = Enum.Font.GothamBold
rightsTitle.Parent = rightsTab

local line = Instance.new("Frame")
line.Size = UDim2.new(0.9, 0, 0, 2)
line.Position = UDim2.new(0.05, 0, 0.12, 0)
line.BackgroundColor3 = colors.border
line.BorderSizePixel = 0
line.Parent = rightsTab

local rightsText = Instance.new("TextLabel")
rightsText.Size = UDim2.new(0.9, 0, 0, 60)
rightsText.Position = UDim2.new(0.05, 0, 0.2, 0)
rightsText.BackgroundTransparency = 1
rightsText.Text = "جميع الحقوق محفوظة\n© 2026 فريق C4"
rightsText.TextColor3 = colors.textDim
rightsText.TextScaled = true
rightsText.Font = Enum.Font.Gotham
rightsText.TextXAlignment = Enum.TextXAlignment.Center
rightsText.Parent = rightsTab

local logo = Instance.new("TextLabel")
logo.Size = UDim2.new(0, 70, 0, 70)
logo.Position = UDim2.new(0.5, -35, 0.5, 0)
logo.BackgroundTransparency = 1
logo.Text = "🔒"
logo.TextScaled = true
logo.Parent = rightsTab

-- =======================
-- تبويب الاستهداف
-- =======================
local targetTab = Instance.new("Frame")
targetTab.Size = UDim2.new(1, 0, 1, 0)
targetTab.BackgroundTransparency = 1
targetTab.Visible = false
targetTab.Parent = contentArea

local targetTitle = Instance.new("TextLabel")
targetTitle.Size = UDim2.new(1, 0, 0, 35)
targetTitle.BackgroundTransparency = 1
targetTitle.Text = "🎯 الاستهداف"
targetTitle.TextColor3 = colors.text
targetTitle.TextScaled = true
targetTitle.Font = Enum.Font.GothamBold
targetTitle.Parent = targetTab

local line2 = Instance.new("Frame")
line2.Size = UDim2.new(0.9, 0, 0, 2)
line2.Position = UDim2.new(0.05, 0, 0.1, 0)
line2.BackgroundColor3 = colors.border
line2.BorderSizePixel = 0
line2.Parent = targetTab

-- صورة اللاعب
local imgFrame = Instance.new("Frame")
imgFrame.Size = UDim2.new(0, 70, 0, 70)
imgFrame.Position = UDim2.new(0.05, 0, 0.14, 0)
imgFrame.BackgroundColor3 = colors.surface
imgFrame.BorderSizePixel = 0
imgFrame.Parent = targetTab

local imgCorner = Instance.new("UICorner")
imgCorner.CornerRadius = UDim.new(0, 10)
imgCorner.Parent = imgFrame

local imgLabel = Instance.new("ImageLabel")
imgLabel.Size = UDim2.new(1, -4, 1, -4)
imgLabel.Position = UDim2.new(0, 2, 0, 2)
imgLabel.BackgroundColor3 = colors.surface
imgLabel.Image = ""
imgLabel.ScaleType = Enum.ScaleType.Fit
imgLabel.Parent = imgFrame

local defaultIcon = Instance.new("TextLabel")
defaultIcon.Size = UDim2.new(1, 0, 1, 0)
defaultIcon.BackgroundTransparency = 1
defaultIcon.Text = "👤"
defaultIcon.TextScaled = true
defaultIcon.Parent = imgFrame

-- حقل الإدخال
local inputFrame = Instance.new("Frame")
inputFrame.Size = UDim2.new(0, 200, 0, 35)
inputFrame.Position = UDim2.new(0.3, 0, 0.14, 0)
inputFrame.BackgroundColor3 = colors.surface
inputFrame.BorderSizePixel = 0
inputFrame.Parent = targetTab

local inputCorner = Instance.new("UICorner")
inputCorner.CornerRadius = UDim.new(0, 8)
inputCorner.Parent = inputFrame

local inputBox = Instance.new("TextBox")
inputBox.Size = UDim2.new(1, -10, 1, 0)
inputBox.Position = UDim2.new(0, 5, 0, 0)
inputBox.BackgroundTransparency = 1
inputBox.PlaceholderText = "اسم اللاعب..."
inputBox.PlaceholderColor3 = colors.textDim
inputBox.Text = ""
inputBox.TextColor3 = colors.text
inputBox.TextScaled = true
inputBox.Font = Enum.Font.Gotham
inputBox.ClearTextOnFocus = false
inputBox.Parent = inputFrame

-- زر البحث
local searchBtn = Instance.new("TextButton")
searchBtn.Size = UDim2.new(0, 55, 0, 35)
searchBtn.Position = UDim2.new(0.83, 0, 0.14, 0)
searchBtn.BackgroundColor3 = colors.primary
searchBtn.Text = "بحث"
searchBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
searchBtn.TextScaled = true
searchBtn.Font = Enum.Font.GothamBold
searchBtn.BorderSizePixel = 0
searchBtn.Parent = targetTab

local searchCorner = Instance.new("UICorner")
searchCorner.CornerRadius = UDim.new(0, 8)
searchCorner.Parent = searchBtn

-- الحالة
local statusText = Instance.new("TextLabel")
statusText.Size = UDim2.new(0.9, 0, 0, 25)
statusText.Position = UDim2.new(0.05, 0, 0.32, 0)
statusText.BackgroundTransparency = 1
statusText.Text = "🔍 انتظر الإدخال..."
statusText.TextColor3 = colors.textDim
statusText.TextScaled = true
statusText.Font = Enum.Font.Gotham
statusText.TextXAlignment = Enum.TextXAlignment.Center
statusText.Parent = targetTab

-- معلومات
local infoFrame = Instance.new("Frame")
infoFrame.Size = UDim2.new(0.9, 0, 0, 40)
infoFrame.Position = UDim2.new(0.05, 0, 0.38, 0)
infoFrame.BackgroundColor3 = colors.surface
infoFrame.BorderSizePixel = 0
infoFrame.Parent = targetTab

local infoCorner = Instance.new("UICorner")
infoCorner.CornerRadius = UDim.new(0, 8)
infoCorner.Parent = infoFrame

local infoText = Instance.new("TextLabel")
infoText.Size = UDim2.new(1, -10, 1, 0)
infoText.Position = UDim2.new(0, 5, 0, 0)
infoText.BackgroundTransparency = 1
infoText.Text = "👤 لا يوجد لاعب"
infoText.TextColor3 = colors.textDim
infoText.TextScaled = true
infoText.Font = Enum.Font.Gotham
infoText.TextXAlignment = Enum.TextXAlignment.Left
infoText.Parent = infoFrame

-- أزرار التفعيل
local btnContainer = Instance.new("Frame")
btnContainer.Size = UDim2.new(0.9, 0, 0, 120)
btnContainer.Position = UDim2.new(0.05, 0, 0.48, 0)
btnContainer.BackgroundTransparency = 1
btnContainer.Parent = targetTab

-- دالة إنشاء زر
local function makeBtn(parent, x, y, w, txt)
    local f = Instance.new("Frame")
    f.Size = UDim2.new(0, w, 0, 30)
    f.Position = UDim2.new(0, x, 0, y)
    f.BackgroundColor3 = colors.surface
    f.BorderSizePixel = 0
    f.Parent = parent
    
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, 6)
    c.Parent = f
    
    local l = Instance.new("TextLabel")
    l.Size = UDim2.new(0.6, -5, 1, 0)
    l.Position = UDim2.new(0, 5, 0, 0)
    l.BackgroundTransparency = 1
    l.Text = txt
    l.TextColor3 = colors.text
    l.TextScaled = true
    l.Font = Enum.Font.Gotham
    l.TextXAlignment = Enum.TextXAlignment.Left
    l.Parent = f
    
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(0, 45, 0, 22)
    b.Position = UDim2.new(0.65, 0, 0.5, -11)
    b.BackgroundColor3 = colors.danger
    b.Text = "OFF"
    b.TextColor3 = Color3.fromRGB(255, 255, 255)
    b.TextScaled = true
    b.Font = Enum.Font.GothamBold
    b.BorderSizePixel = 0
    b.Parent = f
    
    local bc = Instance.new("UICorner")
    bc.CornerRadius = UDim.new(0, 4)
    bc.Parent = b
    
    local on = false
    b.MouseButton1Click:Connect(function()
        on = not on
        b.BackgroundColor3 = on and colors.success or colors.danger
        b.Text = on and "ON" or "OFF"
    end)
end

makeBtn(btnContainer, 0, 0, 120, "🚀 طيران")
makeBtn(btnContainer, 130, 0, 120, "💨 سرعة")
makeBtn(btnContainer, 0, 38, 120, "🛡️ حماية")
makeBtn(btnContainer, 130, 38, 120, "👁️ رؤية")

-- زر View
local viewFrame = Instance.new("Frame")
viewFrame.Size = UDim2.new(0, 120, 0, 30)
viewFrame.Position = UDim2.new(0.05, 0, 0.72, 0)
viewFrame.BackgroundColor3 = colors.surface
viewFrame.BorderSizePixel = 0
viewFrame.Parent = targetTab

local viewCorner = Instance.new("UICorner")
viewCorner.CornerRadius = UDim.new(0, 6)
viewCorner.Parent = viewFrame

local viewLabel = Instance.new("TextLabel")
viewLabel.Size = UDim2.new(0.55, -5, 1, 0)
viewLabel.Position = UDim2.new(0, 5, 0, 0)
viewLabel.BackgroundTransparency = 1
viewLabel.Text = "👁️ مشاهدة"
viewLabel.TextColor3 = colors.text
viewLabel.TextScaled = true
viewLabel.Font = Enum.Font.Gotham
viewLabel.TextXAlignment = Enum.TextXAlignment.Left
viewLabel.Parent = viewFrame

local viewBtn = Instance.new("TextButton")
viewBtn.Size = UDim2.new(0, 45, 0, 22)
viewBtn.Position = UDim2.new(0.58, 0, 0.5, -11)
viewBtn.BackgroundColor3 = colors.danger
viewBtn.Text = "OFF"
viewBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
viewBtn.TextScaled = true
viewBtn.Font = Enum.Font.GothamBold
viewBtn.BorderSizePixel = 0
viewBtn.Parent = viewFrame

local viewCorner2 = Instance.new("UICorner")
viewCorner2.CornerRadius = UDim.new(0, 4)
viewCorner2.Parent = viewBtn

local viewOn = false
viewBtn.MouseButton1Click:Connect(function()
    viewOn = not viewOn
    viewBtn.BackgroundColor3 = viewOn and colors.success or colors.danger
    viewBtn.Text = viewOn and "ON" or "OFF"
end)

-- =======================
-- وظائف التبويبات
-- =======================
local function createTabButton(name, icon, tab, y)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.9, 0, 0, 45)
    btn.Position = UDim2.new(0.05, 0, 0, y)
    btn.BackgroundColor3 = colors.surfaceLight
    btn.Text = icon .. " " .. name
    btn.TextColor3 = colors.textDim
    btn.TextScaled = true
    btn.Font = Enum.Font.GothamBold
    btn.BorderSizePixel = 0
    btn.Parent = tabPanel
    
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, 8)
    c.Parent = btn
    
    local ind = Instance.new("Frame")
    ind.Size = UDim2.new(0, 3, 0.6, 0)
    ind.Position = UDim2.new(0.02, 0, 0.2, 0)
    ind.BackgroundColor3 = colors.primary
    ind.BorderSizePixel = 0
    ind.Visible = false
    ind.Parent = btn
    
    btn.MouseButton1Click:Connect(function()
        rightsTab.Visible = false
        targetTab.Visible = false
        tab.Visible = true
        
        for _, ch in pairs(tabPanel:GetChildren()) do
            if ch:IsA("TextButton") then
                local i = ch:FindFirstChild("Indicator")
                if i then i.Visible = false end
                ch.BackgroundColor3 = colors.surfaceLight
                ch.TextColor3 = colors.textDim
            end
        end
        
        ind.Visible = true
        btn.BackgroundColor3 = colors.surface
        btn.TextColor3 = colors.text
    end)
    
    return btn
end

createTabButton("الحقوق", "⚖️", rightsTab, 0.12)
createTabButton("الاستهداف", "🎯", targetTab, 0.28)

-- تفعيل الحقوق افتراضياً
for _, ch in pairs(tabPanel:GetChildren()) do
    if ch:IsA("TextButton") and ch.Text:find("الحقوق") then
        ch.MouseButton1Click:Fire()
        break
    end
end

-- =======================
-- وظائف البحث
-- =======================
local selectedPlayer = nil

local function findPlayer(name)
    if name == "" then return nil end
    local n = string.lower(name)
    for _, p in pairs(Players:GetPlayers()) do
        if string.lower(p.Name):sub(1, #n) == n then
            return p
        end
    end
    return nil
end

local function updateTarget(p)
    if p then
        selectedPlayer = p
        imgLabel.Image = "rbxthumb://type=AvatarHeadShot&id=" .. p.UserId .. "&w=150&h=150"
        defaultIcon.Visible = false
        infoText.Text = "👤 " .. p.Name .. " | 🆔 " .. p.UserId
        statusText.Text = "✅ تم العثور على: " .. p.Name
        statusText.TextColor3 = colors.success
    else
        selectedPlayer = nil
        imgLabel.Image = ""
        defaultIcon.Visible = true
        infoText.Text = "👤 لا يوجد لاعب"
        statusText.Text = "❌ لم يتم العثور على لاعب"
        statusText.TextColor3 = colors.danger
    end
end

searchBtn.MouseButton1Click:Connect(function()
    local p = findPlayer(inputBox.Text)
    updateTarget(p)
end)

inputBox.FocusLost:Connect(function(enter)
    if enter then
        local p = findPlayer(inputBox.Text)
        updateTarget(p)
    end
end)

-- =======================
-- إخفاء/إظهار
-- =======================
hideBtn.MouseButton1Click:Connect(function()
    mainFrame.Visible = false
    floatBtn.Visible = true
end)

floatBtn.MouseButton1Click:Connect(function()
    mainFrame.Visible = true
    floatBtn.Visible = false
end)

-- =======================
-- إعدادات إضافية
-- =======================
guiService:SetGuiInset(0, 0)

print("✅ C4 GUI Loaded Successfully!")
