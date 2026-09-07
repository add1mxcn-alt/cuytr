-- ============================================
-- واجهة C4 الاحترافية - Shadow Mode V99
-- ============================================

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local guiService = game:GetService("GuiService")
local userInputService = game:GetService("UserInputService")
local tweenService = game:GetService("TweenService")

-- =======================
-- إنشاء ScreenGui رئيسي
-- =======================
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "C4_ProGUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")

-- =======================
-- متغيرات التحكم
-- =======================
local isVisible = true
local selectedTarget = nil
local targetImage = nil
local targetName = ""

-- =======================
-- الألوان المتناسقة (Dark Theme)
-- =======================
local colors = {
    background = Color3.fromRGB(18, 18, 28),
    surface = Color3.fromRGB(28, 28, 42),
    surfaceLight = Color3.fromRGB(38, 38, 55),
    primary = Color3.fromRGB(200, 50, 80),
    primaryDark = Color3.fromRGB(160, 30, 60),
    text = Color3.fromRGB(220, 220, 240),
    textDim = Color3.fromRGB(160, 160, 190),
    accent = Color3.fromRGB(255, 200, 50),
    success = Color3.fromRGB(50, 220, 100),
    danger = Color3.fromRGB(255, 60, 60),
    border = Color3.fromRGB(50, 50, 75),
}

-- =======================
-- الواجهة الرئيسية (مكبرة قليلاً)
-- =======================
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 420, 0, 520)
mainFrame.Position = UDim2.new(0.5, -210, 0.5, -260)
mainFrame.BackgroundColor3 = colors.background
mainFrame.BorderSizePixel = 0
mainFrame.ClipsDescendants = true
mainFrame.BackgroundTransparency = 1
mainFrame.Parent = screenGui

-- حواف دائرية
local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 16)
mainCorner.Parent = mainFrame

-- ظل
local shadow = Instance.new("UIShadow")
shadow.Color = Color3.fromRGB(0, 0, 0)
shadow.Transparency = 0.5
shadow.Offset = Vector2.new(0, 4)
shadow.Size = 16
shadow.Parent = mainFrame

-- =======================
-- Header مع زر الإخفاء
-- =======================
local header = Instance.new("Frame")
header.Size = UDim2.new(1, 0, 0, 50)
header.BackgroundColor3 = colors.surface
header.BorderSizePixel = 0
header.Parent = mainFrame

local headerCorner = Instance.new("UICorner")
headerCorner.CornerRadius = UDim.new(0, 16)
headerCorner.Parent = header

-- عنوان C4
local headerLabel = Instance.new("TextLabel")
headerLabel.Size = UDim2.new(1, -60, 1, 0)
headerLabel.Position = UDim2.new(0, 20, 0, 0)
headerLabel.BackgroundTransparency = 1
headerLabel.Text = "⚡ C4 ⚡"
headerLabel.TextColor3 = colors.primary
headerLabel.TextScaled = true
headerLabel.Font = Enum.Font.GothamBold
headerLabel.TextXAlignment = Enum.TextXAlignment.Left
headerLabel.Parent = header

-- زر إخفاء الواجهة
local hideBtn = Instance.new("TextButton")
hideBtn.Size = UDim2.new(0, 36, 0, 36)
hideBtn.Position = UDim2.new(1, -46, 0.5, -18)
hideBtn.BackgroundColor3 = colors.surfaceLight
hideBtn.Text = "✕"
hideBtn.TextColor3 = colors.textDim
hideBtn.TextScaled = true
hideBtn.Font = Enum.Font.Gotham
hideBtn.BorderSizePixel = 0
hideBtn.Parent = header

local hideBtnCorner = Instance.new("UICorner")
hideBtnCorner.CornerRadius = UDim.new(0, 8)
hideBtnCorner.Parent = hideBtn

-- =======================
-- زر عائم للإظهار (مخفي في البداية)
-- =======================
local floatingBtn = Instance.new("TextButton")
floatingBtn.Size = UDim2.new(0, 50, 0, 50)
floatingBtn.Position = UDim2.new(0.02, 0, 0.85, 0)
floatingBtn.BackgroundColor3 = colors.primary
floatingBtn.Text = "⚡"
floatingBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
floatingBtn.TextScaled = true
floatingBtn.Font = Enum.Font.GothamBold
floatingBtn.BorderSizePixel = 0
floatingBtn.Visible = false
floatingBtn.Parent = screenGui

local floatCorner = Instance.new("UICorner")
floatCorner.CornerRadius = UDim.new(1, 0)
floatCorner.Parent = floatingBtn

-- ظل للزر العائم
local floatShadow = Instance.new("UIShadow")
floatShadow.Color = Color3.fromRGB(0, 0, 0)
floatShadow.Transparency = 0.6
floatShadow.Offset = Vector2.new(0, 4)
floatShadow.Size = 12
floatShadow.Parent = floatingBtn

-- =======================
-- Container للـ Tabs والأعمدة
-- =======================
local mainContainer = Instance.new("Frame")
mainContainer.Size = UDim2.new(1, 0, 1, -50)
mainContainer.Position = UDim2.new(0, 0, 0, 50)
mainContainer.BackgroundTransparency = 1
mainContainer.Parent = mainFrame

-- =======================
-- Tabs على الجانب الأيسر
-- =======================
local tabPanel = Instance.new("Frame")
tabPanel.Size = UDim2.new(0, 100, 1, 0)
tabPanel.BackgroundColor3 = colors.surface
tabPanel.BorderSizePixel = 0
tabPanel.Parent = mainContainer

local tabPanelCorner = Instance.new("UICorner")
tabPanelCorner.CornerRadius = UDim.new(0, 0)
tabPanelCorner.Parent = tabPanel

-- =======================
-- محتوى الأقسام (يمين)
-- =======================
local contentArea = Instance.new("Frame")
contentArea.Size = UDim2.new(1, -110, 1, -16)
contentArea.Position = UDim2.new(0, 110, 0, 8)
contentArea.BackgroundTransparency = 1
contentArea.Parent = mainContainer

-- =======================
-- تبويب الحقوق
-- =======================
local rightsTab = Instance.new("Frame")
rightsTab.Size = UDim2.new(1, 0, 1, 0)
rightsTab.BackgroundTransparency = 1
rightsTab.Parent = contentArea

-- محتوى الحقوق
local rightsTitle = Instance.new("TextLabel")
rightsTitle.Size = UDim2.new(1, -20, 0, 40)
rightsTitle.Position = UDim2.new(0, 10, 0.1, 0)
rightsTitle.BackgroundTransparency = 1
rightsTitle.Text = "📜 الحقوق"
rightsTitle.TextColor3 = colors.text
rightsTitle.TextScaled = true
rightsTitle.Font = Enum.Font.GothamBold
rightsTitle.TextXAlignment = Enum.TextXAlignment.Left
rightsTitle.Parent = rightsTab

-- خط فاصل
local divider = Instance.new("Frame")
divider.Size = UDim2.new(0.95, 0, 0, 2)
divider.Position = UDim2.new(0.025, 0, 0.25, 0)
divider.BackgroundColor3 = colors.border
divider.BorderSizePixel = 0
divider.Parent = rightsTab

-- نص الحقوق
local rightsText = Instance.new("TextLabel")
rightsText.Size = UDim2.new(0.9, 0, 0, 80)
rightsText.Position = UDim2.new(0.05, 0, 0.3, 0)
rightsText.BackgroundTransparency = 1
rightsText.Text = "جميع الحقوق محفوظة\n© 2026 فريق C4"
rightsText.TextColor3 = colors.textDim
rightsText.TextScaled = true
rightsText.Font = Enum.Font.Gotham
rightsText.TextXAlignment = Enum.TextXAlignment.Center
rightsText.Parent = rightsTab

-- شعار C4
local logoLabel = Instance.new("TextLabel")
logoLabel.Size = UDim2.new(0, 80, 0, 80)
logoLabel.Position = UDim2.new(0.5, -40, 0.55, 0)
logoLabel.BackgroundTransparency = 1
logoLabel.Text = "🔒"
logoLabel.TextScaled = true
logoLabel.Parent = rightsTab

-- =======================
-- تبويب الاستهداف (المطور)
-- =======================
local targetTab = Instance.new("Frame")
targetTab.Size = UDim2.new(1, 0, 1, 0)
targetTab.BackgroundTransparency = 1
targetTab.Visible = false
targetTab.Parent = contentArea

-- عنوان الاستهداف
local targetTitle = Instance.new("TextLabel")
targetTitle.Size = UDim2.new(1, -20, 0, 35)
targetTitle.Position = UDim2.new(0, 10, 0.02, 0)
targetTitle.BackgroundTransparency = 1
targetTitle.Text = "🎯 نظام الاستهداف"
targetTitle.TextColor3 = colors.text
targetTitle.TextScaled = true
targetTitle.Font = Enum.Font.GothamBold
targetTitle.TextXAlignment = Enum.TextXAlignment.Left
targetTitle.Parent = targetTab

-- خط فاصل
local targetDivider = Instance.new("Frame")
targetDivider.Size = UDim2.new(0.95, 0, 0, 2)
targetDivider.Position = UDim2.new(0.025, 0, 0.1, 0)
targetDivider.BackgroundColor3 = colors.border
targetDivider.BorderSizePixel = 0
targetDivider.Parent = targetTab

-- ====== حاوية صورة اللاعب ======
local imageContainer = Instance.new("Frame")
imageContainer.Size = UDim2.new(0, 80, 0, 80)
imageContainer.Position = UDim2.new(0.05, 0, 0.14, 0)
imageContainer.BackgroundColor3 = colors.surface
imageContainer.BorderSizePixel = 0
imageContainer.Parent = targetTab

local imageCorner = Instance.new("UICorner")
imageCorner.CornerRadius = UDim.new(0, 12)
imageCorner.Parent = imageContainer

-- ImageLabel للاعب
local targetImageLabel = Instance.new("ImageLabel")
targetImageLabel.Size = UDim2.new(1, -4, 1, -4)
targetImageLabel.Position = UDim2.new(0, 2, 0, 2)
targetImageLabel.BackgroundColor3 = colors.surface
targetImageLabel.Image = "rbxassetid://0"
targetImageLabel.ScaleType = Enum.ScaleType.Fit
targetImageLabel.Parent = imageContainer

-- أيقونة افتراضية
local defaultIcon = Instance.new("TextLabel")
defaultIcon.Size = UDim2.new(1, 0, 1, 0)
defaultIcon.BackgroundTransparency = 1
defaultIcon.Text = "👤"
defaultIcon.TextScaled = true
defaultIcon.Parent = imageContainer

-- ====== حقل إدخال اسم اللاعب ======
local inputContainer = Instance.new("Frame")
inputContainer.Size = UDim2.new(0, 220, 0, 42)
inputContainer.Position = UDim2.new(0.32, 0, 0.14, 0)
inputContainer.BackgroundColor3 = colors.surface
inputContainer.BorderSizePixel = 0
inputContainer.Parent = targetTab

local inputCorner = Instance.new("UICorner")
inputCorner.CornerRadius = UDim.new(0, 8)
inputCorner.Parent = inputContainer

-- TextBox للإدخال
local targetInput = Instance.new("TextBox")
targetInput.Size = UDim2.new(1, -10, 1, 0)
targetInput.Position = UDim2.new(0, 5, 0, 0)
targetInput.BackgroundTransparency = 1
targetInput.PlaceholderText = "أدخل اسم اللاعب..."
targetInput.PlaceholderColor3 = colors.textDim
targetInput.Text = ""
targetInput.TextColor3 = colors.text
targetInput.TextScaled = true
targetInput.Font = Enum.Font.Gotham
targetInput.ClearTextOnFocus = false
targetInput.Parent = inputContainer

-- زر بحث
local searchBtn = Instance.new("TextButton")
searchBtn.Size = UDim2.new(0, 60, 0, 42)
searchBtn.Position = UDim2.new(0.85, 0, 0.14, 0)
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

-- ====== حالة اللاعب ======
local statusLabel = Instance.new("TextLabel")
statusLabel.Size = UDim2.new(0.9, 0, 0, 30)
statusLabel.Position = UDim2.new(0.05, 0, 0.32, 0)
statusLabel.BackgroundTransparency = 1
statusLabel.Text = "🔍 انتظر الإدخال..."
statusLabel.TextColor3 = colors.textDim
statusLabel.TextScaled = true
statusLabel.Font = Enum.Font.Gotham
statusLabel.TextXAlignment = Enum.TextXAlignment.Center
statusLabel.Parent = targetTab

-- ====== معلومات اللاعب ======
local infoContainer = Instance.new("Frame")
infoContainer.Size = UDim2.new(0.9, 0, 0, 50)
infoContainer.Position = UDim2.new(0.05, 0, 0.38, 0)
infoContainer.BackgroundColor3 = colors.surface
infoContainer.BorderSizePixel = 0
infoContainer.Parent = targetTab

local infoCorner = Instance.new("UICorner")
infoCorner.CornerRadius = UDim.new(0, 8)
infoCorner.Parent = infoContainer

local infoText = Instance.new("TextLabel")
infoText.Size = UDim2.new(1, -10, 1, 0)
infoText.Position = UDim2.new(0, 5, 0, 0)
infoText.BackgroundTransparency = 1
infoText.Text = "اللاعب: لا يوجد"
infoText.TextColor3 = colors.textDim
infoText.TextScaled = true
infoText.Font = Enum.Font.Gotham
infoText.TextXAlignment = Enum.TextXAlignment.Left
infoText.Parent = infoContainer

-- ====== أزرار التفعيل ======
local buttonsContainer = Instance.new("Frame")
buttonsContainer.Size = UDim2.new(0.9, 0, 0, 130)
buttonsContainer.Position = UDim2.new(0.05, 0, 0.48, 0)
buttonsContainer.BackgroundTransparency = 1
buttonsContainer.Parent = targetTab

-- وظيفة إنشاء زر
local function createToggleButton(parent, x, y, width, text, color)
    local btn = Instance.new("Frame")
    btn.Size = UDim2.new(0, width, 0, 35)
    btn.Position = UDim2.new(0, x, 0, y)
    btn.BackgroundColor3 = colors.surface
    btn.BorderSizePixel = 0
    btn.Parent = parent
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 6)
    btnCorner.Parent = btn
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.6, -5, 1, 0)
    label.Position = UDim2.new(0, 5, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = colors.text
    label.TextScaled = true
    label.Font = Enum.Font.Gotham
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = btn
    
    local toggle = Instance.new("TextButton")
    toggle.Size = UDim2.new(0, 50, 0, 25)
    toggle.Position = UDim2.new(0.68, 0, 0.5, -12.5)
    toggle.BackgroundColor3 = colors.danger
    toggle.Text = "OFF"
    toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
    toggle.TextScaled = true
    toggle.Font = Enum.Font.GothamBold
    toggle.BorderSizePixel = 0
    toggle.Parent = btn
    
    local toggleCorner = Instance.new("UICorner")
    toggleCorner.CornerRadius = UDim.new(0, 4)
    toggleCorner.Parent = toggle
    
    local isOn = false
    
    toggle.MouseButton1Click:Connect(function()
        isOn = not isOn
        if isOn then
            toggle.BackgroundColor3 = colors.success
            toggle.Text = "ON"
        else
            toggle.BackgroundColor3 = colors.danger
            toggle.Text = "OFF"
        end
    end)
    
    return {button = btn, toggle = toggle, isOn = function() return isOn end}
end

-- أزرار التفعيل (شبكي 2×3)
local btn1 = createToggleButton(buttonsContainer, 0, 0, 130, "🚀 طيران", colors.primary)
local btn2 = createToggleButton(buttonsContainer, 145, 0, 130, "💨 سرعة", colors.primary)
local btn3 = createToggleButton(buttonsContainer, 0, 45, 130, "🛡️ حماية", colors.primary)
local btn4 = createToggleButton(buttonsContainer, 145, 45, 130, "👁️ رؤية", colors.primary)

-- زر View خاص
local viewBtn = Instance.new("Frame")
viewBtn.Size = UDim2.new(0, 130, 0, 35)
viewBtn.Position = UDim2.new(0.05, 0, 0.73, 0)
viewBtn.BackgroundColor3 = colors.surface
viewBtn.BorderSizePixel = 0
viewBtn.Parent = targetTab

local viewCorner = Instance.new("UICorner")
viewCorner.CornerRadius = UDim.new(0, 6)
viewCorner.Parent = viewBtn

local viewLabel = Instance.new("TextLabel")
viewLabel.Size = UDim2.new(0.55, -5, 1, 0)
viewLabel.Position = UDim2.new(0, 5, 0, 0)
viewLabel.BackgroundTransparency = 1
viewLabel.Text = "👁️ مشاهدة"
viewLabel.TextColor3 = colors.text
viewLabel.TextScaled = true
viewLabel.Font = Enum.Font.Gotham
viewLabel.TextXAlignment = Enum.TextXAlignment.Left
viewLabel.Parent = viewBtn

local viewToggle = Instance.new("TextButton")
viewToggle.Size = UDim2.new(0, 50, 0, 25)
viewToggle.Position = UDim2.new(0.62, 0, 0.5, -12.5)
viewToggle.BackgroundColor3 = colors.danger
viewToggle.Text = "OFF"
viewToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
viewToggle.TextScaled = true
viewToggle.Font = Enum.Font.GothamBold
viewToggle.BorderSizePixel = 0
viewToggle.Parent = viewBtn

local viewCorner2 = Instance.new("UICorner")
viewCorner2.CornerRadius = UDim.new(0, 4)
viewCorner2.Parent = viewToggle

local isViewOn = false

viewToggle.MouseButton1Click:Connect(function()
    isViewOn = not isViewOn
    if isViewOn then
        viewToggle.BackgroundColor3 = colors.success
        viewToggle.Text = "ON"
        if selectedTarget then
            -- تفعيل المشاهدة على الهدف المحدد
            print("مشاهدة اللاعب: " .. selectedTarget.Name)
        end
    else
        viewToggle.BackgroundColor3 = colors.danger
        viewToggle.Text = "OFF"
        print("إيقاف المشاهدة")
    end
end)

-- =======================
-- أزرار التبويبات (جانبية)
-- =======================
local tabButtons = {}

local function createTabButton(name, icon, tabRef, yPos)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.9, 0, 0, 50)
    btn.Position = UDim2.new(0.05, 0, 0, yPos)
    btn.BackgroundColor3 = colors.surfaceLight
    btn.Text = icon .. " " .. name
    btn.TextColor3 = colors.textDim
    btn.TextScaled = true
    btn.Font = Enum.Font.GothamBold
    btn.BorderSizePixel = 0
    btn.Parent = tabPanel
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 8)
    btnCorner.Parent = btn
    
    -- حالة نشاط
    local indicator = Instance.new("Frame")
    indicator.Size = UDim2.new(0, 3, 0.6, 0)
    indicator.Position = UDim2.new(0.02, 0, 0.2, 0)
    indicator.BackgroundColor3 = colors.primary
    indicator.BorderSizePixel = 0
    indicator.Visible = false
    indicator.Parent = btn
    
    btn.MouseButton1Click:Connect(function()
        -- إخفاء الكل
        rightsTab.Visible = false
        targetTab.Visible = false
        
        -- إظهار المطلوب
        tabRef.Visible = true
        
        -- تحديث المؤشرات
        for _, tb in pairs(tabButtons) do
            tb.indicator.Visible = false
            tb.btn.BackgroundColor3 = colors.surfaceLight
            tb.btn.TextColor3 = colors.textDim
        end
        indicator.Visible = true
        btn.BackgroundColor3 = colors.surface
        btn.TextColor3 = colors.text
    end)
    
    return {btn = btn, indicator = indicator}
end

-- إنشاء أزرار التبويبات
local tabRights = createTabButton("الحقوق", "⚖️", rightsTab, 0.15)
local tabTarget = createTabButton("الاستهداف", "🎯", targetTab, 0.32)

-- تخزين للاستخدام
tabButtons = {
    {btn = tabRights.btn, indicator = tabRights.indicator},
    {btn = tabTarget.btn, indicator = tabTarget.indicator}
}

-- تفعيل التبويب الافتراضي
tabRights.btn.MouseButton1Click:Fire()

-- =======================
-- وظائف البحث عن اللاعب
-- =======================
local function findPlayer(input)
    if input == "" then return nil end
    local inputLower = string.lower(input)
    local found = nil
    
    for _, plr in pairs(Players:GetPlayers()) do
        local nameLower = string.lower(plr.Name)
        if string.sub(nameLower, 1, #inputLower) == inputLower then
            if not found then
                found = plr
            else
                -- إذا كان هناك أكثر من تطابق، نأخذ الأقرب
                if #plr.Name < #found.Name then
                    found = plr
                end
            end
        end
    end
    
    return found
end

local function updateTargetInfo(plr)
    if plr then
        selectedTarget = plr
        targetName = plr.Name
        
        -- تحديث الصورة
        local thumbnail = Players:GetUserThumbnailAsync(plr.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size150x150)
        targetImageLabel.Image = thumbnail
        defaultIcon.Visible = false
        
        -- تحديث المعلومات
        infoText.Text = "👤 " .. plr.Name .. " | 🆔 " .. plr.UserId .. " | ✅ متصل"
        statusLabel.Text = "✅ تم العثور على: " .. plr.Name
        statusLabel.TextColor3 = colors.success
        
        print("تم تحديد الهدف: " .. plr.Name)
    else
        selectedTarget = nil
        targetName = ""
        targetImageLabel.Image = "rbxassetid://0"
        defaultIcon.Visible = true
        infoText.Text = "اللاعب: غير موجود"
        statusLabel.Text = "❌ لم يتم العثور على لاعب"
        statusLabel.TextColor3 = colors.danger
    end
end

-- حدث البحث
searchBtn.MouseButton1Click:Connect(function()
    local input = targetInput.Text
    local plr = findPlayer(input)
    updateTargetInfo(plr)
end)

-- البحث عند الضغط على Enter
targetInput.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        local input = targetInput.Text
        local plr = findPlayer(input)
        updateTargetInfo(plr)
    end
end)

-- =======================
-- وظائف إخفاء/إظهار الواجهة
-- =======================
hideBtn.MouseButton1Click:Connect(function()
    isVisible = false
    mainFrame:TweenSizeAndPosition(
        UDim2.new(0, 0, 0, 0),
        UDim2.new(0.5, 0, 0.5, 0),
        Enum.EasingDirection.In,
        Enum.EasingStyle.Quad,
        0.3,
        true
    )
    floatingBtn.Visible = true
    floatingBtn:TweenSizeAndPosition(
        UDim2.new(0, 60, 0, 60),
        UDim2.new(0.02, 0, 0.85, 0),
        Enum.EasingDirection.Out,
        Enum.EasingStyle.Back,
        0.4,
        true
    )
end)

floatingBtn.MouseButton1Click:Connect(function()
    isVisible = true
    floatingBtn.Visible = false
    mainFrame:TweenSizeAndPosition(
        UDim2.new(0, 420, 0, 520),
        UDim2.new(0.5, -210, 0.5, -260),
        Enum.EasingDirection.Out,
        Enum.EasingStyle.Elastic,
        0.6,
        true
    )
end)

-- =======================
-- ظهور الواجهة بأنيميشن
-- =======================
mainFrame.BackgroundTransparency = 0
mainFrame:TweenSizeAndPosition(
    UDim2.new(0, 420, 0, 520),
    UDim2.new(0.5, -210, 0.5, -260),
    Enum.EasingDirection.Out,
    Enum.EasingStyle.Elastic,
    0.7,
    true
)

-- =======================
-- تفعيل الوضع الليلي
-- =======================
guiService:SetGuiInset(0, 0)

print("✅ واجهة C4 الاحترافية جاهزة!")
