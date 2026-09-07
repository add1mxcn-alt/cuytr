local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

-- إعدادات الألوان والتصميم
local Colors = {
	Background = Color3.fromRGB(30, 30, 35),      -- خلفية داكنة
	Sidebar = Color3.fromRGB(25, 25, 30),          -- الشريط الجانبي
	Element = Color3.fromRGB(45, 45, 50),          -- عناصر الإدخال والأزرار
	TextMain = Color3.fromRGB(255, 255, 255),      -- نص أبيض
	TextDim = Color3.fromRGB(180, 180, 180),       -- نص رمادي
	Accent = Color3.fromRGB(0, 162, 255),          -- لون التمييز (أزرق هادئ)
	Success = Color3.fromRGB(46, 204, 113),        -- حالة التشغيل (أخضر)
	Danger = Color3.fromRGB(231, 76, 60),          -- حالة الإيقاف (أحمر)
	Hover = Color3.fromRGB(55, 55, 60)             -- عند مرور الماوس
}

-- إنشاء الشاشة الرئيسية
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ProInterface"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

-- متغيرات التحكم
local isGuiVisible = true
local currentTargetData = nil

-- ======================================================================
-- دوال مساعدة لإنشاء العناصر بسرعة وتنسيقها
-- ======================================================================

local function CreateFrame(parent, size, pos, color, cornerRadius)
	local frame = Instance.new("Frame")
	frame.Size = size
	frame.Position = pos
	frame.BackgroundColor3 = color
	frame.BorderSizePixel = 0
	frame.Parent = parent
	
	if cornerRadius then
		local uiCorner = Instance.new("UICorner")
		uiCorner.CornerRadius = UDim.new(0, cornerRadius)
		uiCorner.Parent = frame
	end
	return frame
end

local function CreateTextLabel(parent, text, size, pos, textColor, textSize, align)
	local label = Instance.new("TextLabel")
	label.Size = size
	label.Position = pos
	label.BackgroundTransparency = 1
	label.Text = text
	label.TextColor3 = textColor or Colors.TextMain
	label.TextSize = textSize or 14
	label.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json")
	label.TextXAlignment = align or Enum.TextXAlignment.Left
	label.Parent = parent
	return label
end

local function CreateTextBox(parent, placeholder, size, pos)
	local box = Instance.new("TextBox")
	box.Size = size
	box.Position = pos
	box.BackgroundColor3 = Colors.Element
	box.BorderSizePixel = 0
	box.PlaceholderText = placeholder
	box.PlaceholderColor3 = Colors.TextDim
	box.TextColor3 = Colors.TextMain
	box.TextSize = 14
	box.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json")
	box.ClearTextOnFocus = false
	
	local padding = Instance.new("UIPadding")
	padding.PaddingLeft = UDim.new(0, 10)
	padding.Parent = box
	
	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 6)
	corner.Parent = box
	
	box.Parent = parent
	return box
end

local function CreateImageButton(parent, iconOrText, size, pos, callback)
	local btn = Instance.new("TextButton")
	btn.Size = size
	btn.Position = pos
	btn.BackgroundColor3 = Colors.Element
	btn.Text = iconOrText
	btn.TextColor3 = Colors.TextMain
	btn.TextSize = 16
	btn.AutoButtonColor = false
	btn.Parent = parent
	
	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 6)
	corner.Parent = btn
	
	-- تأثير عند الضغط
	btn.MouseButton1Click:Connect(function()
		TweenService:Create(btn, TweenInfo.new(0.1), {BackgroundColor3 = Colors.Hover}):Play()
		task.wait(0.1)
		TweenService:Create(btn, TweenInfo.new(0.1), {BackgroundColor3 = Colors.Element}):Play()
		if callback then callback() end
	end)
	
	return btn
end

-- ======================================================================
-- بناء الواجهة الرئيسية
-- ======================================================================

-- الحاوية الرئيسية (أكبر قليلاً كما طلبت)
local MainContainer = CreateFrame(ScreenGui, UDim2.new(0, 800, 0, 550), UDim2.new(0.5, -400, 0.5, -275), Colors.Background, 12)

-- زر الإغلاق/التصغير (في الزاوية العلوية)
local MinimizeBtn = CreateImageButton(MainContainer, "_", UDim2.new(0, 30, 0, 30), UDim2.new(1, -40, 0, 10), function()
	isGuiVisible = false
	MainContainer.Visible = false
	MinimizedButton.Visible = true
end)
MinimizeBtn.TextSize = 20
MinimizeBtn.Font = Enum.Font.GothamBold

-- الشريط الجانبي (Sidebar)
local Sidebar = CreateFrame(MainContainer, UDim2.new(0, 200, 1, 0), UDim2.new(0, 0, 0, 0), Colors.Sidebar, 0)
-- إزالة الزاوية من اليسار للشريط ليبدو متصلاً
Sidebar.UICorner:Destroy() 
local sidebarCorner = Instance.new("UICorner")
sidebarCorner.CornerRadius = UDim.new(0, 12)
sidebarCorner.Parent = Sidebar

-- عنوان الشريط الجانبي
CreateTextLabel(Sidebar, "MENU", UDim2.new(1, 0, 0, 40), UDim2.new(0, 0, 0, 0), Colors.Accent, 18, Enum.TextXAlignment.Center).Font = Enum.Font.GothamBold

-- قائمة التبويبات (Tabs)
local TabList = {"Targeting", "Visuals", "Aimbot", "Settings"}
local TabButtons = {}
local TabPages = {}

-- حاوية محتوى التبويبات (على اليمين)
local ContentArea = CreateFrame(MainContainer, UDim2.new(1, -210, 1, -50), UDim2.new(0, 210, 0, 40), Color3.fromRGB(0,0,0), 0)
ContentArea.BackgroundTransparency = 1

-- دالة لإنشاء تبويب
local function CreateTab(tabName, index)
	-- زر التبويب في الشريط الجانبي
	local btnY = 50 + (index * 45)
	local tabBtn = CreateImageButton(Sidebar, tabName, UDim2.new(1, -20, 0, 40), UDim2.new(0, 10, 0, btnY), function()
		-- تفعيل التبويب
		for _, page in pairs(TabPages) do page.Visible = false end
		TabPages[tabName].Visible = true
		
		-- تلوين الزر النشط
		for _, b in pairs(TabButtons) do b.BackgroundColor3 = Colors.Element; b.TextColor3 = Colors.TextDim end
		tabBtn.BackgroundColor3 = Colors.Element -- يمكن تغييرها للون مميز
		tabBtn.TextColor3 = Colors.Accent
	end)
	tabBtn.TextXAlignment = Enum.TextXAlignment.Left
	local padding = Instance.new("UIPadding"); padding.PaddingLeft = UDim.new(0, 20); padding.Parent = tabBtn
	TabButtons[tabName] = btnY and tabBtn or nil -- تخزين مرجع بسيط
	
	-- صفحة المحتوى الخاصة بالتبويب
	local page = CreateFrame(ContentArea, UDim2.new(1, 0, 1, 0), UDim2.new(0, 0, 0, 0), Color3.fromRGB(255,255,255), 8)
	page.BackgroundTransparency = 1
	page.Visible = false
	TabPages[tabName] = page
	
	return page
end

-- إنشاء التبويبات
local TargetingPage = CreateTab("Targeting", 1)
CreateTab("Visuals", 2)
CreateTab("Aimbot", 3)
CreateTab("Settings", 4)

-- تفعيل التبويب الأول افتراضياً
TabPages["Targeting"].Visible = true
if TabButtons["Targeting"] then TabButtons["Targeting"].TextColor3 = Colors.Accent end


-- ======================================================================
-- تصميم قسم الاستهداف (Targeting Section)
-- ======================================================================

-- 1. مربع البحث والصورة
local SearchBox = CreateTextBox(TargetingPage, "Enter Player Name...", UDim2.new(1, -20, 0, 40), UDim2.new(0, 10, 0, 10))

-- حاوية عرض اللاعب (الصورة + الاسم المكتشف)
local PlayerDisplay = CreateFrame(TargetingPage, UDim2.new(1, -20, 0, 120), UDim2.new(0, 10, 0, 60), Colors.Element, 8)

-- صورة اللاعب (Headshot)
local HeadshotImage = Instance.new("ImageLabel")
HeadshotImage.Size = UDim2.new(0, 100, 0, 100)
HeadshotImage.Position = UDim2.new(0, 10, 0, 10)
HeadshotImage.BackgroundTransparency = 1
HeadshotImage.Image = "rbxassetid://0" -- صورة افتراضية فارغة أو أيقونة
HeadshotImage.ScaleType = Enum.ScaleType.Crop
HeadshotImage.Parent = PlayerDisplay
local imgCorner = Instance.new("UICorner"); imgCorner.CornerRadius = UDim.new(1, 0); imgCorner.Parent = HeadshotImage

-- معلومات اللاعب النصية
local PlayerNameLabel = CreateTextLabel(PlayerDisplay, "No Player Selected", UDim2.new(1, -130, 0, 30), UDim2.new(0, 120, 0, 10), Colors.TextMain, 18, Enum.TextXAlignment.Left)
PlayerNameLabel.Font = Enum.Font.GothamBold

local PlayerStatus = CreateTextLabel(PlayerDisplay, "Waiting for input...", UDim2.new(1, -130, 0, 20), UDim2.new(0, 120, 0, 45), Colors.TextDim, 12, Enum.TextXAlignment.Left)

-- 2. منطق البحث (Simulation)
-- ملاحظة: في السكربت الحقيقي ستحتاج لاستخدام HttpService أو Module خاص للبحث
SearchBox.FocusLost:Connect(function(enterPressed)
	if enterPressed then
		local query = SearchBox.Text
		if #query < 2 then return end
		
		PlayerStatus.Text = "Searching..."
		
		-- محاكاة بحث (استبدل هذا بالكود الحقيقي الخاص بك)
		task.spawn(function()
			task.wait(0.5) -- تأخير بسيط للمحاكاة
			
			-- مثال: البحث في السيرفر الحالي
			local foundPlayer = nil
			for _, p in ipairs(Players:GetPlayers()) do
				if string.find(string.lower(p.Name), string.lower(query)) or string.find(string.lower(p.DisplayName), string.lower(query)) then
					foundPlayer = p
					break
				end
			end
			
			if foundPlayer then
				currentTargetData = foundPlayer
				PlayerNameLabel.Text = foundPlayer.Name
				PlayerStatus.Text = "Target Locked"
				PlayerStatus.TextColor3 = Colors.Success
				
				-- جلب الصورة الحقيقية
				local thumbType = Enum.ThumbnailType.HeadShot
				local thumbSize = Enum.ThumbnailSize.Size420x420
				local content, isReady = Players:GetUserThumbnailAsync(foundPlayer.UserId, thumbType, thumbSize)
				HeadshotImage.Image = content
			else
				currentTargetData = nil
				PlayerNameLabel.Text = "Not Found"
				PlayerStatus.Text = "Player Not Found"
				PlayerStatus.TextColor3 = Colors.Danger
				HeadshotImage.Image = "rbxassetid://0" -- أيقونة خطأ
			end
		end)
	end
end)

-- ======================================================================
-- أزرار التفعيل (Toggles Grid)
-- ======================================================================

local TogglesContainer = CreateFrame(TargetingPage, UDim2.new(1, -20, 0, 250), UDim2.new(0, 10, 0, 190), Color3.fromRGB(0,0,0), 0)
TogglesContainer.BackgroundTransparency = 1

-- دالة لإنشاء زر تبديل (Toggle Button)
local function CreateToggle(parent, name, yPos)
	local toggleFrame = CreateFrame(parent, UDim2.new(1, 0, 0, 40), UDim2.new(0, 0, 0, yPos), Colors.Element, 6)
	
	local label = CreateTextLabel(toggleFrame, name, UDim2.new(1, -60, 1, 0), UDim2.new(0, 10, 0, 0), Colors.TextMain, 14, Enum.TextXAlignment.Left)
	
	-- مؤشر الحالة (ON/OFF)
	local statusIndicator = Instance.new("TextLabel")
	statusIndicator.Size = UDim2.new(0, 50, 0, 25)
	statusIndicator.Position = UDim2.new(1, -55, 0.5, -12.5)
	statusIndicator.BackgroundTransparency = 1
	statusIndicator.Text = "OFF"
	statusIndicator.TextColor3 = Colors.Danger
	statusIndicator.Font = Enum.Font.GothamBold
	statusIndicator.TextSize = 12
	statusIndicator.Parent = toggleFrame
	
	local isActive = false
	
	toggleFrame.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			isActive = not isActive
			
			if isActive then
				statusIndicator.Text = "ON"
				statusIndicator.TextColor3 = Colors.Success
				toggleFrame.BackgroundColor3 = Color3.fromRGB(35, 50, 35) -- تلميح أخضر خفيف
			else
				statusIndicator.Text = "OFF"
				statusIndicator.TextColor3 = Colors.Danger
				toggleFrame.BackgroundColor3 = Colors.Element
			end
			
			-- هنا تضع كود التفعيل الفعلي
			print(name .. " set to " .. tostring(isActive))
		end
	end)
end

-- إنشاء الأزرار المطلوبة
CreateToggle(TogglesContainer, "Silent Aim", 0)
CreateToggle(TogglesContainer, "Auto Lock", 45)
CreateToggle(TogglesContainer, "Prediction", 90)

-- زر المشاهدة (View Button) المميز
local ViewBtnFrame = CreateFrame(TargetingPage, UDim2.new(1, -20, 0, 50), UDim2.new(0, 10, 1, -60), Colors.Element, 8)
local ViewBtn = CreateImageButton(ViewBtnFrame, "👁️ VIEW TARGET", UDim2.new(1, -20, 1, -10), UDim2.new(0, 10, 0, 5), function()
	if currentTargetData then
		print("Viewing player: " .. currentTargetData.Name)
		-- كود الكاميرا أو Spectate هنا
	else
		warn("No target selected to view!")
	end
end)
ViewBtn.TextSize = 16
ViewBtn.Font = Enum.Font.GothamBold
ViewBtn.TextColor3 = Colors.Accent


-- ======================================================================
-- زر الإظهار العائم (Floating Restore Button)
-- ======================================================================

local MinimizedButton = Instance.new("TextButton")
MinimizedButton.Name = "RestoreBtn"
MinimizedButton.Size = UDim2.new(0, 50, 0, 50)
MinimizedButton.Position = UDim2.new(0, 20, 0.5, -25) -- جانب الشاشة
MinimizedButton.BackgroundColor3 = Colors.Accent
MinimizedButton.Text = "⚙️"
MinimizedButton.TextSize = 24
MinimizedButton.TextColor3 = Color3.new(1,1,1)
MinimizedButton.Visible = false
MinimizedButton.AutoButtonColor = false
MinimizedButton.Parent = ScreenGui

local miniCorner = Instance.new("UICorner")
miniCorner.CornerRadius = UDim.new(1, 0) -- دائرة كاملة
miniCorner.Parent = MinimizedButton

MinimizedButton.MouseButton1Click:Connect(function()
	isGuiVisible = true
	MainContainer.Visible = true
	MinimizedButton.Visible = false
	
	-- تأثير ظهور ناعم
	MainContainer.Position = UDim2.new(0.5, -400, 0.5, -300) -- البدء من الأعلى قليلاً
	TweenService:Create(MainContainer, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
		Position = UDim2.new(0.5, -400, 0.5, -275)
	}):Play()
end)

-- جعل الواجهة قابلة للسحب (Draggable) بشكل بسيط
local dragging = false
local dragInput, mousePos, framePos

MainContainer.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = true
		mousePos = input.Position
		framePos = MainContainer.Position
		
		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

MainContainer.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement and dragging then
		local delta = input.Position - mousePos
		MainContainer.Position = UDim2.new(
			framePos.X.Scale, 
			framePos.X.Offset + delta.X, 
			framePos.Y.Scale, 
			framePos.Y.Offset + delta.Y
		)
	end
end)
