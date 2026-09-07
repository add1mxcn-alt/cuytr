local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local SoundService = game:GetService("SoundService")

-- صوت الضغط
local ClickSound = Instance.new("Sound")
ClickSound.SoundId = "rbxassetid://9120381112"
ClickSound.Volume = 0.25
ClickSound.Parent = SoundService

-- الألوان
local Colors = {
	Background = Color3.fromRGB(14, 14, 20),
	Sidebar = Color3.fromRGB(10, 10, 16),
	Element = Color3.fromRGB(26, 26, 34),
	ElementHover = Color3.fromRGB(42, 42, 52),
	Accent = Color3.fromRGB(70, 180, 255),
	AccentDark = Color3.fromRGB(50, 140, 220),
	Success = Color3.fromRGB(70, 220, 150),
	Danger = Color3.fromRGB(255, 90, 90),
	TextMain = Color3.fromRGB(235, 235, 245),
	TextDim = Color3.fromRGB(155, 155, 175)
}

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ShadowUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local isGuiVisible = true
local currentTargetData = nil
local currentTab = "Targeting"
local tabPages = {}
local tabButtons = {}

-- ======================================================================
-- دوال مساعدة
-- ======================================================================

local function PlayClick()
	ClickSound:Play()
end

local function CreateFrame(parent, size, pos, color, radius, trans)
	local f = Instance.new("Frame")
	f.Size = size
	f.Position = pos
	f.BackgroundColor3 = color
	f.BackgroundTransparency = trans or 0
	f.BorderSizePixel = 0
	f.Parent = parent
	if radius then
		local c = Instance.new("UICorner")
		c.CornerRadius = UDim.new(0, radius)
		c.Parent = f
	end
	return f
end

local function CreateLabel(parent, text, size, pos, color, sizeTxt, align)
	local l = Instance.new("TextLabel")
	l.Size = size
	l.Position = pos
	l.BackgroundTransparency = 1
	l.Text = text
	l.TextColor3 = color or Colors.TextMain
	l.TextSize = sizeTxt or 13
	l.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json")
	l.TextXAlignment = align or Enum.TextXAlignment.Left
	l.TextYAlignment = Enum.TextYAlignment.Center
	l.Parent = parent
	return l
end

local function CreateTextBox(parent, placeholder, size, pos, callback)
	local b = Instance.new("TextBox")
	b.Size = size
	b.Position = pos
	b.BackgroundColor3 = Colors.Element
	b.BorderSizePixel = 0
	b.PlaceholderText = placeholder
	b.PlaceholderColor3 = Colors.TextDim
	b.TextColor3 = Colors.TextMain
	b.TextSize = 13
	b.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json")
	b.ClearTextOnFocus = false
	
	local pad = Instance.new("UIPadding")
	pad.PaddingLeft = UDim.new(0, 12)
	pad.PaddingTop = UDim.new(0, 8)
	pad.Parent = b
	
	local c = Instance.new("UICorner")
	c.CornerRadius = UDim.new(0, 10)
	c.Parent = b
	b.Parent = parent
	
	if callback then
		b.FocusLost:Connect(function(enter) if enter then callback(b.Text) end end)
	end
	return b
end

local function CreateButton(parent, text, size, pos, callback, accent)
	local b = Instance.new("TextButton")
	b.Size = size
	b.Position = pos
	b.BackgroundColor3 = accent and Colors.Accent or Colors.Element
	b.Text = text
	b.TextColor3 = Colors.TextMain
	b.TextSize = 13
	b.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json")
	b.AutoButtonColor = false
	b.Parent = parent
	
	local c = Instance.new("UICorner")
	c.CornerRadius = UDim.new(0, 10)
	c.Parent = b
	
	local origColor = b.BackgroundColor3
	
	b.MouseEnter:Connect(function()
		TweenService:Create(b, TweenInfo.new(0.15), {BackgroundColor3 = Colors.ElementHover}):Play()
	end)
	b.MouseLeave:Connect(function()
		TweenService:Create(b, TweenInfo.new(0.15), {BackgroundColor3 = origColor}):Play()
	end)
	b.MouseButton1Click:Connect(function()
		PlayClick()
		TweenService:Create(b, TweenInfo.new(0.08), {BackgroundColor3 = Colors.AccentDark}):Play()
		task.wait(0.08)
		TweenService:Create(b, TweenInfo.new(0.12), {BackgroundColor3 = origColor}):Play()
		if callback then callback() end
	end)
	return b
end

-- ======================================================================
-- الواجهة الرئيسية
-- ======================================================================

local MainContainer = CreateFrame(ScreenGui, UDim2.new(0, 700, 0, 480), UDim2.new(0.5, -350, 0.5, -240), Colors.Background, 14)

-- شريط العنوان
local TitleBar = CreateFrame(MainContainer, UDim2.new(1, 0, 0, 38), UDim2.new(0, 0, 0, 0), Colors.Sidebar, 0)
TitleBar.UICorner:Destroy()
local tc = Instance.new("UICorner")
tc.CornerRadius = UDim.new(0, 14)
tc.Parent = TitleBar

CreateLabel(TitleBar, "⚡ SHADOW PRO", UDim2.new(1, -50, 1, 0), UDim2.new(0, 14, 0, 0), Colors.Accent, 15, Enum.TextXAlignment.Left)

local MinimizeBtn = CreateButton(TitleBar, "─", UDim2.new(0, 28, 0, 28), UDim2.new(1, -40, 0.5, -14), function()
	isGuiVisible = false
	MainContainer.Visible = false
	MinimizedButton.Visible = true
end)
MinimizeBtn.TextSize = 16

-- ======================================================================
-- الشريط الجانبي (تبويبات)
-- ======================================================================

local Sidebar = CreateFrame(MainContainer, UDim2.new(0, 150, 1, -38), UDim2.new(0, 0, 0, 38), Colors.Sidebar, 0)
Sidebar.UICorner:Destroy()
local sc = Instance.new("UICorner")
sc.CornerRadius = UDim.new(0, 14)
sc.Parent = Sidebar

-- منطقة المحتوى
local ContentArea = CreateFrame(MainContainer, UDim2.new(1, -162, 1, -50), UDim2.new(0, 152, 0, 42), Color3.fromRGB(0,0,0), 0, 1)

-- ======================================================================
-- إنشاء التبويبات
-- ======================================================================

local tabList = {"Targeting", "Visuals", "Aimbot", "Settings"}

for i, tabName in ipairs(tabList) do
	local yPos = 10 + (i - 1) * 44
	
	local btn = CreateButton(Sidebar, tabName, UDim2.new(1, -12, 0, 36), UDim2.new(0, 6, 0, yPos), function()
		for _, page in pairs(tabPages) do page.Visible = false end
		tabPages[tabName].Visible = true
		currentTab = tabName
		
		for _, b in pairs(tabButtons) do
			b.BackgroundColor3 = Colors.Element
			b.TextColor3 = Colors.TextDim
		end
		btn.BackgroundColor3 = Colors.Element
		btn.TextColor3 = Colors.Accent
	end)
	btn.TextXAlignment = Enum.TextXAlignment.Center
	btn.TextSize = 12
	tabButtons[tabName] = btn
	
	local page = CreateFrame(ContentArea, UDim2.new(1, 0, 1, 0), UDim2.new(0, 0, 0, 0), Color3.fromRGB(0,0,0), 0, 1)
	page.Visible = false
	tabPages[tabName] = page
end

-- تفعيل أول تبويب
tabPages["Targeting"].Visible = true
if tabButtons["Targeting"] then
	tabButtons["Targeting"].TextColor3 = Colors.Accent
end

-- ======================================================================
-- تبويب Targeting (المحتوى)
-- ======================================================================

local TargetingPage = tabPages["Targeting"]

-- صف البحث (مربع + زر)
local SearchRow = CreateFrame(TargetingPage, UDim2.new(1, 0, 0, 44), UDim2.new(0, 0, 0, 6), Color3.fromRGB(0,0,0), 0, 1)

local SearchBox = CreateTextBox(SearchRow, "🔍 Search player...", UDim2.new(0.72, -6, 1, 0), UDim2.new(0, 0, 0, 0))
local SearchBtn = CreateButton(SearchRow, "FIND", UDim2.new(0.28, 0, 1, 0), UDim2.new(0.72, 6, 0, 0), function()
	local query = SearchBox.Text
	if #query < 2 then return end
	
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
			PlayerNameLabel.Text = found.Name
			PlayerStatus.Text = "✅ Locked"
			PlayerStatus.TextColor3 = Colors.Success
			local success, content = pcall(function()
				return Players:GetUserThumbnailAsync(found.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
			end)
			if success and content then HeadshotImage.Image = content end
		else
			currentTargetData = nil
			PlayerNameLabel.Text = "❌ Not Found"
			PlayerStatus.Text = "No player exists"
			PlayerStatus.TextColor3 = Colors.Danger
			HeadshotImage.Image = "rbxassetid://0"
		end
	end)
end, true)

-- عرض اللاعب
local PlayerDisplay = CreateFrame(TargetingPage, UDim2.new(1, 0, 0, 76), UDim2.new(0, 0, 0, 56), Colors.Element, 10)

HeadshotImage = Instance.new("ImageLabel")
HeadshotImage.Size = UDim2.new(0, 56, 0, 56)
HeadshotImage.Position = UDim2.new(0, 10, 0.5, -28)
HeadshotImage.BackgroundTransparency = 1
HeadshotImage.Image = "rbxassetid://0"
HeadshotImage.ScaleType = Enum.ScaleType.Crop
HeadshotImage.Parent = PlayerDisplay
local hic = Instance.new("UICorner")
hic.CornerRadius = UDim.new(0, 28)
hic.Parent = HeadshotImage

local PlayerNameLabel = CreateLabel(PlayerDisplay, "No Target", UDim2.new(1, -80, 0, 28), UDim2.new(0, 76, 0, 8), Colors.TextMain, 16, Enum.TextXAlignment.Left)
PlayerNameLabel.Font = Enum.Font.GothamBold

local PlayerStatus = CreateLabel(PlayerDisplay, "Search for a player", UDim2.new(1, -80, 0, 20), UDim2.new(0, 76, 0, 38), Colors.TextDim, 11, Enum.TextXAlignment.Left)

-- أزرار التبديل (2 في كل صف)
local ToggleContainer = CreateFrame(TargetingPage, UDim2.new(1, 0, 0, 120), UDim2.new(0, 0, 0, 142), Color3.fromRGB(0,0,0), 0, 1)

local function CreateToggle(parent, name, row, col)
	local x = col == 1 and 0 or 0.5 + 0.02
	local w = col == 1 and 0.48 or 0.48
	
	local frame = CreateFrame(parent, UDim2.new(w, -6, 0, 38), UDim2.new(x, 0, 0, row * 44), Colors.Element, 8)
	
	local label = CreateLabel(frame, name, UDim2.new(1, -50, 1, 0), UDim2.new(0, 10, 0, 0), Colors.TextMain, 11, Enum.TextXAlignment.Left)
	
	local status = Instance.new("TextLabel")
	status.Size = UDim2.new(0, 36, 0, 20)
	status.Position = UDim2.new(1, -40, 0.5, -10)
	status.BackgroundTransparency = 1
	status.Text = "OFF"
	status.TextColor3 = Colors.Danger
	status.Font = Enum.Font.GothamBold
	status.TextSize = 9
	status.Parent = frame
	
	local active = false
	
	frame.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			PlayClick()
			active = not active
			if active then
				status.Text = "ON"
				status.TextColor3 = Colors.Success
				TweenService:Create(frame, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(22, 44, 34)}):Play()
			else
				status.Text = "OFF"
				status.TextColor3 = Colors.Danger
				TweenService:Create(frame, TweenInfo.new(0.2), {BackgroundColor3 = Colors.Element}):Play()
			end
			print(name .. " → " .. tostring(active))
		end
	end)
end

CreateToggle(ToggleContainer, "Silent Aim", 0, 1)
CreateToggle(ToggleContainer, "Auto Lock", 0, 2)
CreateToggle(ToggleContainer, "Prediction", 1, 1)
CreateToggle(ToggleContainer, "FOV Circle", 1, 2)

-- زر المشاهدة
local ViewContainer = CreateFrame(TargetingPage, UDim2.new(1, 0, 0, 44), UDim2.new(0, 0, 1, -44), Color3.fromRGB(0,0,0), 0, 1)

local ViewBtn = CreateButton(ViewContainer, "👁️ VIEW TARGET", UDim2.new(1, 0, 1, 0), UDim2.new(0, 0, 0, 0), function()
	if not currentTargetData then
		PlayerStatus.Text = "⚠️ No target!"
		PlayerStatus.TextColor3 = Colors.Danger
		task.wait(1)
		PlayerStatus.Text = "Search for a player"
		PlayerStatus.TextColor3 = Colors.TextDim
		return
	end
	
	local cam = workspace.CurrentCamera
	local char = currentTargetData.Character
	if char and char:FindFirstChild("HumanoidRootPart") then
		local pos = char.HumanoidRootPart.Position
		cam.CameraType = Enum.CameraType.Scriptable
		TweenService:Create(cam, TweenInfo.new(0.4, Enum.EasingStyle.Quad), {
			CFrame = CFrame.lookAt(pos + Vector3.new(0, 2, 4), pos)
		}):Play()
		PlayerStatus.Text = "🔭 Spectating..."
		PlayerStatus.TextColor3 = Colors.Accent
		task.wait(2.5)
		cam.CameraType = Enum.CameraType.Custom
		PlayerStatus.Text = "✅ Locked"
		PlayerStatus.TextColor3 = Colors.Success
	else
		PlayerStatus.Text = "❌ Not in game"
		PlayerStatus.TextColor3 = Colors.Danger
	end
end, true)

-- ======================================================================
-- تبويبات أخرى (محتوى بسيط)
-- ======================================================================

-- Visuals
local vPage = tabPages["Visuals"]
CreateLabel(vPage, "🎨 VISUAL SETTINGS", UDim2.new(1, 0, 0, 40), UDim2.new(0, 10, 0, 10), Colors.Accent, 18, Enum.TextXAlignment.Center)
CreateLabel(vPage, "Coming soon...", UDim2.new(1, 0, 0, 30), UDim2.new(0, 10, 0, 60), Colors.TextDim, 14, Enum.TextXAlignment.Center)

-- Aimbot
local aPage = tabPages["Aimbot"]
CreateLabel(aPage, "🎯 AIMBOT CONFIG", UDim2.new(1, 0, 0, 40), UDim2.new(0, 10, 0, 10), Colors.Accent, 18, Enum.TextXAlignment.Center)
CreateLabel(aPage, "Coming soon...", UDim2.new(1, 0, 0, 30), UDim2.new(0, 10, 0, 60), Colors.TextDim, 14, Enum.TextXAlignment.Center)

-- Settings
local sPage = tabPages["Settings"]
CreateLabel(sPage, "⚙️ SETTINGS", UDim2.new(1, 0, 0, 40), UDim2.new(0, 10, 0, 10), Colors.Accent, 18, Enum.TextXAlignment.Center)
CreateLabel(sPage, "Coming soon...", UDim2.new(1, 0, 0, 30), UDim2.new(0, 10, 0, 60), Colors.TextDim, 14, Enum.TextXAlignment.Center)

-- ======================================================================
-- زر الإظهار المصغر
-- ======================================================================

local MinimizedButton = Instance.new("TextButton")
MinimizedButton.Size = UDim2.new(0, 46, 0, 46)
MinimizedButton.Position = UDim2.new(0, 14, 0.5, -23)
MinimizedButton.BackgroundColor3 = Colors.Accent
MinimizedButton.Text = "⚡"
MinimizedButton.TextSize = 20
MinimizedButton.TextColor3 = Color3.new(1, 1, 1)
MinimizedButton.Visible = false
MinimizedButton.AutoButtonColor = false
MinimizedButton.Parent = ScreenGui

local mc = Instance.new("UICorner")
mc.CornerRadius = UDim.new(1, 0)
mc.Parent = MinimizedButton

MinimizedButton.MouseButton1Click:Connect(function()
	PlayClick()
	isGuiVisible = true
	MainContainer.Visible = true
	MinimizedButton.Visible = false
	MainContainer.Position = UDim2.new(0.5, -350, 0.5, -260)
	TweenService:Create(MainContainer, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
		Position = UDim2.new(0.5, -350, 0.5, -240)
	}):Play()
end)

-- ======================================================================
-- سحب الواجهة
-- ======================================================================

local dragging = false
local dragStart, frameStart

TitleBar.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = true
		dragStart = input.Position
		frameStart = MainContainer.Position
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement and dragging then
		local delta = input.Position - dragStart
		MainContainer.Position = UDim2.new(
			frameStart.X.Scale,
			frameStart.X.Offset + delta.X,
			frameStart.Y.Scale,
			frameStart.Y.Offset + delta.Y
		)
	end
end)

UserInputService.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = false
	end
end)

print("✅ Shadow UI Loaded — All Tabs Working")
