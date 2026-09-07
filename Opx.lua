-- ============================================
-- واجهة C4 - النسخة النهائية المستقرة
-- ============================================

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local guiService = game:GetService("GuiService")
local RunService = game:GetService("RunService")

-- =======================
-- إنشاء ScreenGui
-- =======================
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "C4_GUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")

-- =======================
-- الألوان المتناسقة
-- =======================
local colors = {
    bg = Color3.fromRGB(20, 20, 30),
    surface = Color3.fromRGB(30, 30, 45),
    surfaceLight = Color3.fromRGB(40, 40, 58),
    primary = Color3.fromRGB(220, 60, 90),
    primaryDim = Color3.fromRGB(180, 40, 70),
    text = Color3.fromRGB(235, 235, 245),
    textDim = Color3.fromRGB(170, 170, 190),
    border = Color3.fromRGB(55, 55, 75),
    success = Color3.fromRGB(60, 210, 100),
    danger = Color3.fromRGB(230, 70, 70),
    gold = Color3.fromRGB(255, 200, 50),
}

-- ============================================
-- PART 1: واجهة الترحيب
-- ============================================
local welcomeFrame = Instance.new("Frame")
welcomeFrame.Size = UDim2.new(0, 360, 0, 280)
welcomeFrame.Position = UDim2.new(0.5, -180, 0.5, -140)
welcomeFrame.BackgroundColor3 = colors.bg
welcomeFrame.BorderSizePixel = 0
welcomeFrame.ClipsDescendants = true
welcomeFrame.Parent = screenGui

local welcomeCorner = Instance.new("UICorner")
welcomeCorner.CornerRadius = UDim.new(0, 20)
welcomeCorner.Parent = welcomeFrame

-- شعار C4 كبير
local logoBig = Instance.new("TextLabel")
logoBig.Size = UDim2.new(1, 0, 0, 70)
logoBig.Position = UDim2.new(0, 0, 0.08, 0)
logoBig.BackgroundTransparency = 1
logoBig.Text = "⚡ C4 ⚡"
logoBig.TextColor3 = colors.primary
logoBig.TextScaled = true
logoBig.Font = Enum.Font.GothamBold
logoBig.Parent = welcomeFrame

-- خط فاصل
local divWelcome = Instance.new("Frame")
divWelcome.Size = UDim2.new(0.7, 0, 0, 2)
divWelcome.Position = UDim2.new(0.15, 0, 0.32, 0)
divWelcome.BackgroundColor3 = colors.border
divWelcome.BorderSizePixel = 0
divWelcome.Parent = welcomeFrame

-- اسم السكربت
local scriptName = Instance.new("TextLabel")
scriptName.Size = UDim2.new(1, -40, 0, 35)
scriptName.Position = UDim2.new(0, 20, 0.38, 0)
scriptName.BackgroundTransparency = 1
scriptName.Text = "نظام التحكم المتقدم"
scriptName.TextColor3 = colors.text
scriptName.TextScaled = true
scriptName.Font = Enum.Font.GothamBold
scriptName.Parent = welcomeFrame

-- معلومات إضافية
local infoWelcome = Instance.new("TextLabel")
infoWelcome.Size = UDim2.new(1, -40, 0, 60)
infoWelcome.Position = UDim2.new(0, 20, 0.5, 0)
infoWelcome.BackgroundTransparency = 1
infoWelcome.Text = "نسخة 2.0\nجميع الحقوق محفوظة © 2026"
infoWelcome.TextColor3 = colors.textDim
infoWelcome.TextScaled = true
infoWelcome.Font = Enum.Font.Gotham
infoWelcome.TextXAlignment = Enum.TextXAlignment.Center
infoWelcome.Parent = welcomeFrame

-- أيقونة
local iconWelcome = Instance.new("TextLabel")
iconWelcome.Size = UDim2.new(0, 50, 0, 50)
iconWelcome.Position = UDim2.new(0.5, -25, 0.75, 0)
iconWelcome.BackgroundTransparency = 1
iconWelcome.Text = "🚀"
iconWelcome.TextScaled = true
iconWelcome.Parent = welcomeFrame

-- نص "جاري التحميل"
local loadingText = Instance.new("TextLabel")
loadingText.Size = UDim2.new(1, 0, 0, 25)
loadingText.Position = UDim2.new(0, 0, 0.92, 0)
loadingText.BackgroundTransparency = 1
loadingText.Text = "جاري التحميل..."
loadingText.TextColor3 = colors.textDim
loadingText.TextScaled = true
loadingText.Font = Enum.Font.Gotham
loadingText.Parent = welcomeFrame

-- ============================================
-- PART 2: الواجهة الرئيسية (مربعة)
-- ============================================
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 400, 0, 460)
mainFrame.Position = UDim2.new(0.5, -200, 0.5, -230)
mainFrame.BackgroundColor3 = colors.bg
mainFrame.BorderSizePixel = 0
mainFrame.ClipsDescendants = true
mainFrame.Visible = false
mainFrame.Parent = screenGui

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 16)
mainCorner.Parent = mainFrame

-- ============================================
-- PART 3: الهيدر مع زر الإخفاء
-- ============================================
local header = Instance.new("Frame")
header.Size = UDim2.new(1, 0, 0, 45)
header.BackgroundColor3 = colors.surface
header.BorderSizePixel = 0
header.Parent = mainFrame

local headerCorner = Instance.new("UICorner")
headerCorner.CornerRadius = UDim.new(0, 16)
headerCorner.Parent = header

-- عنوان الهيدر
local headerTitle = Instance.new("TextLabel")
headerTitle.Size = UDim2.new(1, -50, 1, 0)
headerTitle.Position = UDim2.new(0, 15, 0, 0)
headerTitle.BackgroundTransparency = 1
headerTitle.Text = "⚡ C4"
headerTitle.TextColor3 = colors.primary
headerTitle.TextScaled = true
headerTitle.Font = Enum.Font.GothamBold
headerTitle.TextXAlignment = Enum.TextXAlignment.Left
headerTitle.Parent = header

-- زر الإخفاء
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

-- ============================================
-- PART 4: الزر العائم للإظهار
-- ============================================
local floatBtn = Instance.new("TextButton")
floatBtn.Size = UDim2.new(0, 48, 0, 48)
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

-- ============================================
-- PART 5: Tabs على الجانب
-- ============================================
local tabPanel = Instance.new("Frame")
tabPanel.Size = UDim2.new(0, 95, 1, -45)
tabPanel.Position = UDim2.new(0, 0, 0, 45)
tabPanel.BackgroundColor3 = colors.surface
tabPanel.BorderSizePixel = 0
tabPanel.Parent = mainFrame

-- ============================================
-- PART 6: محتوى الأقسام
-- ============================================
local contentArea = Instance.new("Frame")
contentArea.Size = UDim2.new(1, -105, 1, -55)
contentArea.Position = UDim2.new(0, 100, 0, 50)
contentArea.BackgroundTransparency = 1
contentArea.Parent = mainFrame

-- =======================
-- TAB 1: الحقوق
-- =======================
local rightsTab = Instance.new("Frame")
rightsTab.Size = UDim2.new(1, 0, 1, 0)
rightsTab.BackgroundTransparency = 1
rightsTab.Parent = contentArea

local rightsTitle = Instance.new("TextLabel")
rightsTitle.Size = UDim2.new(1, 0, 0, 35)
rightsTitle.BackgroundTransparency = 1
rightsTitle.Text = "📜 الحقوق"
rightsTitle.TextColor3 = colors.text
rightsTitle.TextScaled = true
rightsTitle.Font = Enum.Font.GothamBold
rightsTitle.Parent = rightsTab

local rightsLine = Instance.new("Frame")
rightsLine.Size = UDim2.new(0.9, 0, 0, 2)
rightsLine.Position = UDim2.new(0.05, 0, 0.12, 0)
rightsLine.BackgroundColor3 = colors.border
rightsLine.BorderSizePixel = 0
rightsLine.Parent = rightsTab

local rightsContent = Instance.new("TextLabel")
rightsContent.Size = UDim2.new(0.9, 0, 0, 80)
rightsContent.Position = UDim2.new(0.05, 0, 0.2, 0)
rightsContent.BackgroundTransparency = 1
rightsContent.Text = "جميع الحقوق محفوظة\nلـ فريق C4\n© 2026"
rightsContent.TextColor3 = colors.textDim
rightsContent.TextScaled = true
rightsContent.Font = Enum.Font.Gotham
rightsContent.TextXAlignment = Enum.TextXAlignment.Center
rightsContent.Parent = rightsTab

local rightsIcon = Instance.new("TextLabel")
rightsIcon.Size = UDim2.new(0, 60, 0, 60)
rightsIcon.Position = UDim2.new(0.5, -30, 0.5, 0)
rightsIcon.BackgroundTransparency = 1
rightsIcon.Text = "🔒"
rightsIcon.TextScaled = true
rightsIcon.Parent = rightsTab

-- =======================
-- TAB 2: الاستهداف
-- =======================
local targetTab = Instance.new("Frame")
targetTab.Size = UDim2.new(1, 0, 1, 0)
targetTab.BackgroundTransparency = 1
targetTab.Visible = false
targetTab.Parent = contentArea

local targetTitle = Instance.new("TextLabel")
targetTitle.Size = UDim2.new(1, 0, 0, 30)
targetTitle.BackgroundTransparency = 1
targetTitle.Text = "🎯 الاستهداف"
targetTitle.TextColor3 = colors.text
targetTitle.TextScaled = true
targetTitle.Font = Enum.Font.GothamBold
targetTitle.Parent = targetTab

local targetLine = Instance.new("Frame")
targetLine.Size = UDim2.new(0.9, 0, 0, 2)
targetLine.Position = UDim2.new(0.05, 0, 0.1, 0)
targetLine.BackgroundColor3 = colors.border
targetLine.BorderSizePixel = 0
targetLine.Parent = targetTab

-- ===== صورة اللاعب =====
local imgContainer = Instance.new("Frame")
imgContainer.Size = UDim2.new(0, 75, 0, 75)
imgContainer.Position = UDim2.new(0.03, 0, 0.14, 0)
imgContainer.BackgroundColor3 = colors.surface
imgContainer.BorderSizePixel = 0
imgContainer.Parent = targetTab

local imgCorner = Instance.new("UICorner")
imgCorner.CornerRadius = UDim.new(0, 12)
imgCorner.Parent = imgContainer

local playerImage = Instance.new("ImageLabel")
playerImage.Size = UDim2.new(1, -4, 1, -4)
playerImage.Position = UDim2.new(0, 2, 0, 2)
playerImage.BackgroundColor3 = colors.surface
playerImage.Image = ""
playerImage.ScaleType = Enum.ScaleType.Fit
playerImage.Parent = imgContainer

local defaultAvatar = Instance.new("TextLabel")
defaultAvatar.Size = UDim2.new(1, 0, 1, 0)
defaultAvatar.BackgroundTransparency = 1
defaultAvatar.Text = "👤"
defaultAvatar.TextScaled = true
defaultAvatar.Parent = imgContainer

-- ===== حقل البحث (بدون زر) =====
local inputContainer = Instance.new("Frame")
inputContainer.Size = UDim2.new(0, 195, 0, 35)
inputContainer.Position = UDim2.new(0.28, 0, 0.14, 0)
inputContainer.BackgroundColor3 = colors.surface
inputContainer.BorderSizePixel = 0
inputContainer.Parent = targetTab

local inputCorner = Instance.new("UICorner")
inputCorner.CornerRadius = UDim.new(0, 8)
inputCorner.Parent = inputContainer

local searchBox = Instance.new("TextBox")
searchBox.Size = UDim2.new(1, -12, 1, 0)
searchBox.Position = UDim2.new(0, 6, 0, 0)
searchBox.BackgroundTransparency = 1
searchBox.PlaceholderText = "اكتب اسم اللاعب..."
searchBox.PlaceholderColor3 = colors.textDim
searchBox.Text = ""
searchBox.TextColor3 = colors.text
searchBox.TextScaled = true
searchBox.Font = Enum.Font.Gotham
searchBox.ClearTextOnFocus = false
searchBox.Parent = inputContainer

-- ===== حالة البحث =====
local statusLabel = Instance.new("TextLabel")
statusLabel.Size = UDim2.new(0.9, 0, 0, 22)
statusLabel.Position = UDim2.new(0.05, 0, 0.32, 0)
statusLabel.BackgroundTransparency = 1
statusLabel.Text = "🔍 اكتب اسم لاعب للبحث"
statusLabel.TextColor3 = colors.textDim
statusLabel.TextScaled = true
statusLabel.Font = Enum.Font.Gotham
statusLabel.TextXAlignment = Enum.TextXAlignment.Center
statusLabel.Parent = targetTab

-- ===== معلومات اللاعب =====
local infoContainer = Instance.new("Frame")
infoContainer.Size = UDim2.new(0.9, 0, 0, 38)
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
infoText.Text = "👤 انتظر البحث..."
infoText.TextColor3 = colors.textDim
infoText.TextScaled = true
infoText.Font = Enum.Font.Gotham
infoText.TextXAlignment = Enum.TextXAlignment.Left
infoText.Parent = infoContainer

-- ===== أزرار التفعيل =====
local btnContainer = Instance.new("Frame")
btnContainer.Size = UDim2.new(0.9, 0, 0, 100)
btnContainer.Position = UDim2.new(0.05, 0, 0.48, 0)
btnContainer.BackgroundTransparency = 1
btnContainer.Parent = targetTab

-- دالة إنشاء زر تفعيل
local function createToggle(parent, x, y, w, label)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, w, 0, 28)
    frame.Position = UDim2.new(0, x, 0, y)
    frame.BackgroundColor3 = colors.surface
    frame.BorderSizePixel = 0
    frame.Parent = parent
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = frame
    
    local text = Instance.new("TextLabel")
    text.Size = UDim2.new(0.55, -5, 1, 0)
    text.Position = UDim2.new(0, 5, 0, 0)
    text.BackgroundTransparency = 1
    text.Text = label
    text.TextColor3 = colors.text
    text.TextScaled = true
    text.Font = Enum.Font.Gotham
    text.TextXAlignment = Enum.TextXAlignment.Left
    text.Parent = frame
    
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 42, 0, 20)
    btn.Position = UDim2.new(0.6, 0, 0.5, -10)
    btn.BackgroundColor3 = colors.danger
    btn.Text = "OFF"
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextScaled = true
    btn.Font = Enum.Font.GothamBold
    btn.BorderSizePixel = 0
    btn.Parent = frame
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 4)
    btnCorner.Parent = btn
    
    local state = false
    btn.MouseButton1Click:Connect(function()
        state = not state
        btn.BackgroundColor3 = state and colors.success or colors.danger
        btn.Text = state and "ON" or "OFF"
    end)
    
    return {btn = btn, frame = frame, state = function() return state end}
end

-- إنشاء الأزرار (شبكي 2×2)
local btnFly = createToggle(btnContainer, 0, 0, 115, "🚀 طيران")
local btnSpeed = createToggle(btnContainer, 125, 0, 115, "💨 سرعة")
local btnShield = createToggle(btnContainer, 0, 34, 115, "🛡️ حماية")
local btnVision = createToggle(btnContainer, 125, 34, 115, "👁️ رؤية")

-- ===== زر المشاهدة (View) =====
local viewContainer = Instance.new("Frame")
viewContainer.Size = UDim2.new(0, 115, 0, 28)
viewContainer.Position = UDim2.new(0.05, 0, 0.7, 0)
viewContainer.BackgroundColor3 = colors.surface
viewContainer.BorderSizePixel = 0
viewContainer.Parent = targetTab

local viewCorner = Instance.new("UICorner")
viewCorner.CornerRadius = UDim.new(0, 6)
viewCorner.Parent = viewContainer

local viewLabel = Instance.new("TextLabel")
viewLabel.Size = UDim2.new(0.55, -5, 1, 0)
viewLabel.Position = UDim2.new(0, 5, 0, 0)
viewLabel.BackgroundTransparency = 1
viewLabel.Text = "👁️ مشاهدة"
viewLabel.TextColor3 = colors.text
viewLabel.TextScaled = true
viewLabel.Font = Enum.Font.Gotham
viewLabel.TextXAlignment = Enum.TextXAlignment.Left
viewLabel.Parent = viewContainer

local viewBtn = Instance.new("TextButton")
viewBtn.Size = UDim2.new(0, 42, 0, 20)
viewBtn.Position = UDim2.new(0.6, 0, 0.5, -10)
viewBtn.BackgroundColor3 = colors.danger
viewBtn.Text = "OFF"
viewBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
viewBtn.TextScaled = true
viewBtn.Font = Enum.Font.GothamBold
viewBtn.BorderSizePixel = 0
viewBtn.Parent = viewContainer

local viewCorner2 = Instance.new("UICorner")
viewCorner2.CornerRadius = UDim.new(0, 4)
viewCorner2.Parent = viewBtn

local viewState = false
viewBtn.MouseButton1Click:Connect(function()
    viewState = not viewState
    viewBtn.BackgroundColor3 = viewState and colors.success or colors.danger
    viewBtn.Text = viewState and "ON" or "OFF"
    if viewState and selectedPlayer then
        print("👁️ مشاهدة اللاعب: " .. selectedPlayer.Name)
    elseif viewState then
        print("⚠️ لا يوجد لاعب مستهدف")
        viewState = false
        viewBtn.BackgroundColor3 = colors.danger
        viewBtn.Text = "OFF"
    end
end)

-- ============================================
-- PART 7: أزرار التبويبات
-- ============================================
local selectedPlayer = nil
local searchTimer = nil

local function createTabButton(name, icon, tab, yPos)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.9, 0, 0, 42)
    btn.Position = UDim2.new(0.05, 0, 0, yPos)
    btn.BackgroundColor3 = colors.surfaceLight
    btn.Text = icon .. " " .. name
    btn.TextColor3 = colors.textDim
    btn.TextScaled = true
    btn.Font = Enum.Font.GothamBold
    btn.BorderSizePixel = 0
    btn.Parent = tabPanel
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = btn
    
    local indicator = Instance.new("Frame")
    indicator.Size = UDim2.new(0, 3, 0.6, 0)
    indicator.Position = UDim2.new(0.02, 0, 0.2, 0)
    indicator.BackgroundColor3 = colors.primary
    indicator.BorderSizePixel = 0
    indicator.Visible = false
    indicator.Name = "Indicator"
    indicator.Parent = btn
    
    btn.MouseButton1Click:Connect(function()
        rightsTab.Visible = false
        targetTab.Visible = false
        tab.Visible = true
        
        for _, child in pairs(tabPanel:GetChildren()) do
            if child:IsA("TextButton") then
                local ind = child:FindFirstChild("Indicator")
                if ind then ind.Visible = false end
                child.BackgroundColor3 = colors.surfaceLight
                child.TextColor3 = colors.textDim
            end
        end
        
        indicator.Visible = true
        btn.BackgroundColor3 = colors.surface
        btn.TextColor3 = colors.text
    end)
    
    return btn
end

-- إنشاء أزرار التبويبات
local rightsBtn = createTabButton("الحقوق", "⚖️", rightsTab, 0.12)
local targetBtn = createTabButton("الاستهداف", "🎯", targetTab, 0.28)

-- تفعيل تبويب الحقوق افتراضياً
rightsBtn.MouseButton1Click:Fire()

-- ============================================
-- PART 8: وظائف البحث التلقائي
-- ============================================
local function findPlayer(input)
    if input == "" or input == nil then return nil end
    local lower = string.lower(input)
    local matches = {}
    
    for _, plr in pairs(Players:GetPlayers()) do
        local nameLower = string.lower(plr.Name)
        if string.sub(nameLower, 1, #lower) == lower then
            table.insert(matches, plr)
        end
    end
    
    if #matches == 0 then return nil end
    if #matches == 1 then return matches[1] end
    
    -- إذا كان هناك أكثر من تطابق، اختر الأقصر (الأكثر دقة)
    table.sort(matches, function(a, b) return #a.Name < #b.Name end)
    return matches[1]
end

local function updateTarget(player)
    if player then
        selectedPlayer = player
        playerImage.Image = "rbxthumb://type=AvatarHeadShot&id=" .. player.UserId .. "&w=150&h=150"
        defaultAvatar.Visible = false
        infoText.Text = "👤 " .. player.Name .. " | 🆔 " .. player.UserId
        statusLabel.Text = "✅ تم العثور على: " .. player.Name
        statusLabel.TextColor3 = colors.success
        
        -- إعادة ضبط حالة View إذا كان مفعلاً
        if viewState then
            print("👁️ تحديث المشاهدة إلى: " .. player.Name)
        end
    else
        selectedPlayer = nil
        playerImage.Image = ""
        defaultAvatar.Visible = true
        infoText.Text = "👤 لا يوجد لاعب"
        statusLabel.Text = "❌ لم يتم العثور على لاعب"
        statusLabel.TextColor3 = colors.danger
        
        -- إيقاف View إذا كان مفعلاً
        if viewState then
            viewState = false
            viewBtn.BackgroundColor3 = colors.danger
            viewBtn.Text = "OFF"
        end
    end
end

-- البحث التلقائي عند الكتابة
searchBox:GetPropertyChangedSignal("Text"):Connect(function()
    local text = searchBox.Text
    if #text >= 1 then
        -- تأخير بسيط لتجنب البحث المفرط
        if searchTimer then
            searchTimer:Disconnect()
        end
        searchTimer = RunService.Heartbeat:Connect(function()
            searchTimer:Disconnect()
            searchTimer = nil
            local found = findPlayer(text)
            updateTarget(found)
        end)
        task.wait(0.3) -- تأخير 0.3 ثانية
        if searchTimer then
            searchTimer:Disconnect()
            searchTimer = nil
            local found = findPlayer(text)
            updateTarget(found)
        end
    else
        -- إذا كان الحقل فارغاً
        selectedPlayer = nil
        playerImage.Image = ""
        defaultAvatar.Visible = true
        infoText.Text = "👤 انتظر البحث..."
        statusLabel.Text = "🔍 اكتب اسم لاعب للبحث"
        statusLabel.TextColor3 = colors.textDim
    end
end)

-- ============================================
-- PART 9: وظائف الإخفاء والإظهار
-- ============================================
hideBtn.MouseButton1Click:Connect(function()
    mainFrame.Visible = false
    floatBtn.Visible = true
end)

floatBtn.MouseButton1Click:Connect(function()
    mainFrame.Visible = true
    floatBtn.Visible = false
end)

-- ============================================
-- PART 10: الانتقال من الترحيب للواجهة
-- ============================================
task.wait(2.5)

welcomeFrame:TweenSizeAndPosition(
    UDim2.new(0, 0, 0, 0),
    UDim2.new(0.5, 0, 0.5, 0),
    Enum.EasingDirection.In,
    Enum.EasingStyle.Quad,
    0.4,
    true
)
task.wait(0.4)
welcomeFrame.Visible = false

mainFrame.Visible = true
mainFrame:TweenSizeAndPosition(
    UDim2.new(0, 400, 0, 460),
    UDim2.new(0.5, -200, 0.5, -230),
    Enum.EasingDirection.Out,
    Enum.EasingStyle.Elastic,
    0.6,
    true
)

guiService:SetGuiInset(0, 0)
print("✅ C4 GUI Loaded Successfully!")
