local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local SoundService = game:GetService("SoundService")

-- تحميل صوت ناعم للضغط
local ClickSound = Instance.new("Sound")
ClickSound.SoundId = "rbxassetid://9120381112" -- صوت نقر ناعم
ClickSound.Volume = 0.3
ClickSound.Parent = SoundService

-- إعدادات الألوان والتصميم (أكثر أناقة)
local Colors = {
	Background = Color3.fromRGB(18, 18, 22),
	Sidebar = Color3.fromRGB(14, 14, 18),
	Element = Color3.fromRGB(30, 30, 38),
	ElementHover = Color3.fromRGB(45, 45, 55),
	Accent = Color3.fromRGB(100, 180, 255),
	AccentDark = Color3.fromRGB(60, 140, 220),
	Success = Color3.fromRGB(80, 220, 150),
	Danger = Color3.fromRGB(255, 100, 100),
	TextMain = Color3.fromRGB(240, 240, 245),
	TextDim = Color3.fromRGB(160, 160, 175),
	Glow = Color3.fromRGB(100, 180, 255)
}

-- إنشاء الشاشة الرئيسية
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ProInterface"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local isGuiVisible = true
local currentTargetData = nil
local targetCache = {}

-- ======================================================================
-- دوال مساعدة محسنة مع تأثيرات وصوت
-- ======================================================================

local function PlayClick()
	ClickSound:Play()
end

local function CreateFrame(parent, size, pos, color, cornerRadius, transparency)
	local frame = Instance.new("Frame")
	frame.Size = size
	frame.Position = pos
	frame.BackgroundColor3 = color
	frame.BackgroundTransparency = transparency or 0
	frame.BorderSizePixel = 0
	frame.Parent = parent
	
	if cornerRadius then
		local uiCorner = Instance.new("UICorner")
		uiCorner.CornerRadius = UDim.new(0, cornerRadius)
		uiCorner.Parent = frame
	end
	return frame
end

local function CreateTextLabel(parent, text, size, pos, textColor, textSize, align, font)
	local label = Instance.new("TextLabel")
	label.Size = size
	label.Position = pos
	label.BackgroundTransparency = 1
	label.Text = text
	label.TextColor3 = textColor or Colors.TextMain
	label.TextSize = textSize or 13
	label.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json")
	label.TextXAlignment = align or Enum.TextXAlignment.Left
	label.TextYAlignment = Enum.TextYAlignment.Center
	if font then label.Font = font end
	label.Parent = parent
	return label
end

local function CreateTextBox(parent, placeholder, size, pos, callback)
	local box = Instance.new("TextBox")
	box.Size = size
	box.Position = pos
	box.BackgroundColor3 = Colors.Element
	box.BorderSizePixel = 0
	box.PlaceholderText = placeholder
	box.PlaceholderColor3 = Colors.TextDim
	box.TextColor3 = Colors.TextMain
	box.TextSize = 13
	box.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json")
	box.ClearTextOnFocus = false
	
	local padding = Instance.new("UIPadding")
	padding.PaddingLeft = UDim.new(0, 12)
	padding.PaddingTop = UDim.new(0, 8)
	padding.Parent = box
	
	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 10)
	corner.Parent = box
	
	box.Parent = parent
	
	if callback then
		box.FocusLost:Connect(function(enterPressed)
			if enterPressed then callback(box.Text) end
		end)
	end
	
	return box
end

local function CreateButton(parent, text, size, pos, callback, accent)
	local btn = Instance.new("TextButton")
	btn.Size = size
	btn.Position = pos
	btn.BackgroundColor3 = accent and Colors.Accent or Colors.Element
	btn.Text = text
	btn.TextColor3 = Colors.TextMain
	btn.TextSize = 13
	btn.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json")
	btn.AutoButtonColor = false
	btn.Parent = parent
	
	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 10)
	corner.Parent = btn
	
	local originalColor = btn.BackgroundColor3
	
	-- تأثيرات hover والضغط مع الصوت
	btn.MouseEnter:Connect(function()
		TweenService:Create(btn, TweenInfo.new(0.15), {BackgroundColor3 = Colors.ElementHover}):Play()
	end)
	
	btn.MouseLeave:Connect(function()
		TweenService:Create(btn, TweenInfo.new(0.15), {BackgroundColor3 = originalColor}):Play()
	end)
	
	btn.MouseButton1Click:Connect(function()
		PlayClick()
		TweenService:Create(btn, TweenInfo.new(0.08), {BackgroundColor3 = Colors.AccentDark}):Play()
		task.wait(0.08)
		TweenService:Create(btn, TweenInfo.new(0.12), {BackgroundColor3 = originalColor}):Play()
		if callback then callback() end
	end)
	
	return btn
end

-- ======================================================================
-- الواجهة الرئيسية (مصغرة وأنيقة)
-- ======================================================================

local MainContainer = CreateFrame(ScreenGui, UDim2.new(0, 620, 0, 440), UDim2.new(0.5, -310, 0.5, -220), Colors.Background, 16)

-- شريط العنوان مع زر التصغير
local TitleBar = CreateFrame(MainContainer, UDim2.new(1, 0, 0, 40), UDim2.new(0, 0, 0, 0), Colors.Sidebar, 0)
TitleBar.UICorner:Destroy()
local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, 16)
titleCorner.Parent = TitleBar

CreateTextLabel(TitleBar, "⚡ TARGET PRO", UDim2.new(1, -50, 1, 0), UDim2.new(0, 16, 0, 0), Colors.Accent, 16, Enum.TextXAlignment.Left)
TitleBar.Font = Enum.Font.GothamBold

local MinimizeBtn = CreateButton(TitleBar, "─", UDim2.new(0, 30, 0, 30), UDim2.new(1, -40, 0.5, -15), function()
	isGuiVisible = false
	MainContainer.Visible = false
	MinimizedButton.Visible = true
end)
MinimizeBtn.TextSize = 18
MinimizeBtn.Font = Enum.Font.GothamBold

-- ======================================================================
-- قسم البحث (مربع + زر جنباً إلى جنب)
-- ======================================================================

local SearchContainer = CreateFrame(MainContainer, UDim2.new(1, -24, 0, 50), UDim2.new(0, 12, 0, 50), Color3.fromRGB(0,0,0), 0, 1)

-- مربع البحث (يأخذ 75% من العرض)
local SearchBox = CreateTextBox(SearchContainer, "🔍 Search player...", UDim2.new(0.75, -8, 1, 0), UDim2.new(0, 0, 0, 0))

-- زر البحث (25% من العرض)
local SearchBtn = CreateButton(SearchContainer, "FIND", UDim2.new(0.25, 0, 1, 0), UDim2.new(0.75, 8, 0, 0), function()
	local query = SearchBox.Text
	if #query < 2 then return end
	
	-- البحث الفعلي
	task.spawn(function()
		local found = nil
		for _, p in ipairs(Players:GetPlayers()) do
			if string.find(string.lower(p.Name), string.lower(query)) or string.find(string.lower(p.DisplayName), string.lower(query)) then
				found = p
				break
			end
		end
		
		if found then
			currentTargetData = found
			UpdatePlayerDisplay(found)
		else
			currentTargetData = nil
			PlayerNameLabel.Text = "❌ Not Found"
			PlayerStatus.Text = "Player doesn't exist"
			PlayerStatus.TextColor3 = Colors.Danger
			HeadshotImage.Image = "rbxassetid://0"
		end
	end)
end, true) -- accent = true

-- ======================================================================
-- عرض اللاعب (الصورة + المعلومات)
-- ======================================================================

local PlayerDisplay = CreateFrame(MainContainer, UDim2.new(1, -24, 0, 80), UDim2.new(0, 12, 0, 110), Colors.Element, 12)

-- صورة اللاعب
local HeadshotImage = Instance.new("ImageLabel")
HeadshotImage.Size = UDim2.new(0, 60, 0, 60)
HeadshotImage.Position = UDim2.new(0, 10, 0.5, -30)
HeadshotImage.BackgroundTransparency = 1
HeadshotImage.Image = "rbxassetid://0"
HeadshotImage.ScaleType = Enum.ScaleType.Crop
HeadshotImage.Parent = PlayerDisplay
local imgCorner = Instance.new("UICorner")
imgCorner.CornerRadius = UDim.new(0, 30)
imgCorner.Parent = HeadshotImage

-- معلومات اللاعب
local PlayerNameLabel = CreateTextLabel(PlayerDisplay, "No Target", UDim2.new(1, -100, 0, 30), UDim2.new(0, 80, 0, 10), Colors.TextMain, 17, Enum.TextXAlignment.Left)
PlayerNameLabel.Font = Enum.Font.GothamBold

local PlayerStatus = CreateTextLabel(PlayerDisplay, "Waiting for search...", UDim2.new(1, -100, 0, 20), UDim2.new(0, 80, 0, 42), Colors.TextDim, 12, Enum.TextXAlignment.Left)

-- دالة تحديث العرض
local function UpdatePlayerDisplay(player)
	if not player then return end
	PlayerNameLabel.Text = player.Name
	PlayerStatus.Text = "✅ Target Locked"
	PlayerStatus.TextColor3 = Colors.Success
	
	local success, content = pcall(function()
		return Players:GetUserThumbnailAsync(player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
	end)
	if success and content then
		HeadshotImage.Image = content
	end
end

-- ======================================================================
-- أزرار الاستهداف (زرين في كل سطر)
-- ======================================================================

local TogglesContainer = CreateFrame(MainContainer, UDim2.new(1, -24, 0, 120), UDim2.new(0, 12, 0, 200), Color3.fromRGB(0,0,0), 0, 1)

local toggles = {}

local function CreateToggle(parent, name, row, col)
	local xPos = col == 1 and 0 or 0.5 + 0.02
	local width = col == 1 and 0.48 or 0.48
	
	local toggleFrame = CreateFrame(parent, UDim2.new(width, -4, 0, 40), UDim2.new(xPos, 0, 0, row * 45), Colors.Element, 10)
	
	local label = CreateTextLabel(toggleFrame, name, UDim2.new(1, -50, 1, 0), UDim2.new(0, 12, 0, 0), Colors.TextMain, 12, Enum.TextXAlignment.Left)
	
	-- مؤشر الحالة
	local statusIndicator = Instance.new("TextLabel")
	statusIndicator.Size = UDim2.new(0, 40, 0, 22)
	statusIndicator.Position = UDim2.new(1, -45, 0.5, -11)
	statusIndicator.BackgroundTransparency = 1
	statusIndicator.Text = "OFF"
	statusIndicator.TextColor3 = Colors.Danger
	statusIndicator.Font = Enum.Font.GothamBold
	statusIndicator.TextSize = 10
	statusIndicator.Parent = toggleFrame
	
	local isActive = false
	toggles[name] = function() return isActive end
	
	toggleFrame.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			PlayClick()
			isActive = not isActive
			
			if isActive then
				statusIndicator.Text = "ON"
				statusIndicator.TextColor3 = Colors.Success
				TweenService:Create(toggleFrame, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(25, 45, 35)}):Play()
			else
				statusIndicator.Text = "OFF"
				statusIndicator.TextColor3 = Colors.Danger
				TweenService:Create(toggleFrame, TweenInfo.new(0.2), {BackgroundColor3 = Colors.Element}):Play()
			end
			print(name .. " → " .. tostring(isActive))
		end
	end)
end

-- أزرار الاستهداف (2 في كل سطر)
CreateToggle(TogglesContainer, "Silent Aim", 0, 1)
CreateToggle(TogglesContainer, "Auto Lock", 0, 2)
CreateToggle(TogglesContainer, "Prediction", 1, 1)
CreateToggle(TogglesContainer, "FOV Circle", 1, 2)

-- ======================================================================
-- زر المشاهدة (يعمل فعلياً)
-- ======================================================================

local ViewContainer = CreateFrame(MainContainer, UDim2.new(1, -24, 0, 50), UDim2.new(0, 12, 1, -60), Color3.fromRGB(0,0,0), 0, 1)

local ViewBtn = CreateButton(ViewContainer, "👁️ VIEW TARGET", UDim2.new(1, 0, 1, 0), UDim2.new(0, 0, 0, 0), function()
	if not currentTargetData then
		PlayerStatus.Text = "⚠️ No target selected!"
		PlayerStatus.TextColor3 = Colors.Danger
		task.wait(1)
		if currentTargetData then
			PlayerStatus.Text = "✅ Target Locked"
			PlayerStatus.TextColor3 = Colors.Success
		else
			PlayerStatus.Text = "Waiting for search..."
			PlayerStatus.TextColor3 = Colors.TextDim
		end
		return
	end
	
	-- كود المشاهدة الفعلي (Spectate)
	local camera = workspace.CurrentCamera
	local targetChar = currentTargetData.Character
	if targetChar and targetChar:FindFirstChild("HumanoidRootPart") then
		local camPos = targetChar.HumanoidRootPart.Position + Vector3.new(0, 3, 5)
		camera.CameraType = Enum.CameraType.Scriptable
		
		TweenService:Create(camera, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			CFrame = CFrame.lookAt(camPos, targetChar.HumanoidRootPart.Position)
		}):Play()
		
		PlayerStatus.Text = "🔭 Spectating " .. currentTargetData.Name
		PlayerStatus.TextColor3 = Colors.Accent
		
		-- العودة للكاميرا العادية بعد 3 ثوان أو عند الضغط مجدداً
		task.wait(3)
		camera.CameraType = Enum.CameraType.Custom
		PlayerStatus.Text = "✅ Target Locked"
		PlayerStatus.TextColor3 = Colors.Success
	else
		PlayerStatus.Text = "❌ Target not in game"
		PlayerStatus.TextColor3 = Colors.Danger
	end
end, true)

-- ======================================================================
-- زر الإظهار العائم
-- ======================================================================

local MinimizedButton = Instance.new("TextButton")
MinimizedButton.Name = "RestoreBtn"
MinimizedButton.Size = UDim2.new(0, 48, 0, 48)
MinimizedButton.Position = UDim2.new(0, 16, 0.5, -24)
MinimizedButton.BackgroundColor3 = Colors.Accent
MinimizedButton.Text = "⚡"
MinimizedButton.TextSize = 22
MinimizedButton.TextColor3 = Color3.new(1,1,1)
MinimizedButton.Visible = false
MinimizedButton.AutoButtonColor = false
MinimizedButton.Parent = ScreenGui

local miniCorner = Instance.new("UICorner")
miniCorner.CornerRadius = UDim.new(1, 0)
miniCorner.Parent = MinimizedButton

-- إضافة glow حول الزر المصغر
local glow = Instance.new("ImageLabel")
glow.Size = UDim2.new(1.6, 0, 1.6, 0)
glow.Position = UDim2.new(-0.3, 0, -0.3, 0)
glow.BackgroundTransparency = 1
glow.Image = "rbxassetid://0"
glow.ImageTransparency = 0.5
glow.Parent = MinimizedButton

MinimizedButton.MouseButton1Click:Connect(function()
	PlayClick()
	isGuiVisible = true
	MainContainer.Visible = true
	MinimizedButton.Visible = false
	
	MainContainer.Position = UDim2.new(0.5, -310, 0.5, -250)
	TweenService:Create(MainContainer, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
		Position = UDim2.new(0.5, -310, 0.5, -220)
	}):Play()
end)

-- ======================================================================
-- سحب الواجهة
-- ======================================================================

local dragging = false
local dragInput, mousePos, framePos

TitleBar.InputBegan:Connect(function(input)
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

UserInputService.InputChanged:Connect(function(input)
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

print("✅ Shadow Interface Loaded Successfully")
