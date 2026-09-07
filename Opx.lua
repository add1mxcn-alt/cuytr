local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer

-- إنشاء SoundService للأصوات
local SoundService = game:GetService("SoundService")
local ClickSound = Instance.new("Sound")
ClickSound.SoundId = "rbxassetid://5273897304"
ClickSound.Volume = 0.3
ClickSound.Parent = SoundService

local ToggleSound = Instance.new("Sound")
ToggleSound.SoundId = "rbxassetid://6564829556"
ToggleSound.Volume = 0.2
ToggleSound.Parent = SoundService

-- ألوان متناسقة
local Colors = {
	Background = Color3.fromRGB(25, 28, 35),
	Sidebar = Color3.fromRGB(20, 23, 30),
	Element = Color3.fromRGB(35, 40, 50),
	ElementHover = Color3.fromRGB(45, 50, 60),
	TextMain = Color3.fromRGB(240, 240, 245),
	TextDim = Color3.fromRGB(150, 155, 165),
	Accent = Color3.fromRGB(100, 150, 255),
	Success = Color3.fromRGB(80, 200, 120),
	Danger = Color3.fromRGB(220, 80, 90),
	Warning = Color3.fromRGB(255, 180, 50)
}

-- إنشاء ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ModernInterface"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local isGuiVisible = true
local currentTargetData = nil

-- متغيرات التخريب
local Benx = false
local Bang = false
local Suck = false
local HeadSit = false
local FaceBang = false
local Stand = false
local Follow = false
_G.FlingTarget = nil
_G.RetryDelay = 1

-- دوال مساعدة
local function CreateFrame(parent, size, pos, color, cornerRadius)
	local frame = Instance.new("Frame")
	frame.Size = size
	frame.Position = pos
	frame.BackgroundColor3 = color
	frame.BorderSizePixel = 0
	frame.Parent = parent
	
	if cornerRadius then
		local corner = Instance.new("UICorner")
		corner.CornerRadius = UDim.new(0, cornerRadius)
		corner.Parent = frame
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
	label.TextSize = textSize or 13
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
	box.TextSize = 13
	box.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json")
	box.ClearTextOnFocus = false
	
	local padding = Instance.new("UIPadding")
	padding.PaddingLeft = UDim.new(0, 12)
	padding.Parent = box
	
	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 10)
	corner.Parent = box
	
	box.Parent = parent
	return box
end

local function CreateButton(parent, text, size, pos, callback)
	local btn = Instance.new("TextButton")
	btn.Size = size
	btn.Position = pos
	btn.BackgroundColor3 = Colors.Element
	btn.Text = text
	btn.TextColor3 = Colors.TextMain
	btn.TextSize = 13
	btn.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json")
	btn.AutoButtonColor = false
	btn.Parent = parent
	
	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 10)
	corner.Parent = btn
	
	btn.MouseEnter:Connect(function()
		TweenService:Create(btn, TweenInfo.new(0.15), {BackgroundColor3 = Colors.ElementHover}):Play()
	end)
	
	btn.MouseLeave:Connect(function()
		TweenService:Create(btn, TweenInfo.new(0.15), {BackgroundColor3 = Colors.Element}):Play()
	end)
	
	btn.MouseButton1Click:Connect(function()
		ClickSound:Play()
		TweenService:Create(btn, TweenInfo.new(0.1), {BackgroundColor3 = Colors.Accent}):Play()
		task.wait(0.1)
		TweenService:Create(btn, TweenInfo.new(0.1), {BackgroundColor3 = Colors.ElementHover}):Play()
		if callback then callback() end
	end)
	
	return btn
end

-- الواجهة الرئيسية
local MainContainer = CreateFrame(ScreenGui, UDim2.new(0, 600, 0, 450), UDim2.new(0.5, -300, 0.5, -225), Colors.Background, 15)

local MinimizeBtn = CreateButton(MainContainer, "—", UDim2.new(0, 30, 0, 30), UDim2.new(1, -40, 0, 10), function()
	isGuiVisible = false
	MainContainer.Visible = false
	MinimizedButton.Visible = true
end)

local Sidebar = CreateFrame(MainContainer, UDim2.new(0, 150, 1, 0), UDim2.new(0, 0, 0, 0), Colors.Sidebar, 15)

CreateTextLabel(Sidebar, "⚡ MENU", UDim2.new(1, 0, 0, 40), UDim2.new(0, 0, 0, 10), Colors.Accent, 16, Enum.TextXAlignment.Center).Font = Enum.Font.GothamBold

local TabList = {"Target", "Trolling", "Visuals", "Settings"}
local TabButtons = {}
local TabPages = {}

local ContentArea = CreateFrame(MainContainer, UDim2.new(1, -160, 1, -50), UDim2.new(0, 160, 0, 40), Color3.fromRGB(0,0,0), 0)
ContentArea.BackgroundTransparency = 1

local function CreateTab(tabName, index)
	local btnY = 60 + (index * 45)
	local tabBtn = CreateButton(Sidebar, tabName, UDim2.new(1, -20, 0, 38), UDim2.new(0, 10, 0, btnY), function()
		for _, page in pairs(TabPages) do page.Visible = false end
		TabPages[tabName].Visible = true
		
		for _, b in pairs(TabButtons) do 
			b.BackgroundColor3 = Colors.Element
			b.TextColor3 = Colors.TextDim 
		end
		tabBtn.BackgroundColor3 = Colors.Accent
		tabBtn.TextColor3 = Color3.new(1,1,1)
	end)
	tabBtn.TextXAlignment = Enum.TextXAlignment.Left
	local padding = Instance.new("UIPadding")
	padding.PaddingLeft = UDim.new(0, 15)
	padding.Parent = tabBtn
	TabButtons[tabName] = tabBtn
	
	local page = CreateFrame(ContentArea, UDim2.new(1, 0, 1, 0), UDim2.new(0, 0, 0, 0), Color3.fromRGB(255,255,255), 10)
	page.BackgroundTransparency = 1
	page.Visible = false
	TabPages[tabName] = page
	
	return page
end

local TargetingPage = CreateTab("Target", 1)
local TrollingPage = CreateTab("Trolling", 2)
CreateTab("Visuals", 3)
CreateTab("Settings", 4)

TabPages["Target"].Visible = true
TabButtons["Target"].BackgroundColor3 = Colors.Accent
TabButtons["Target"].TextColor3 = Color3.new(1,1,1)

-- قسم الاستهداف
local SearchRow = CreateFrame(TargetingPage, UDim2.new(1, -20, 0, 50), UDim2.new(0, 10, 0, 10), Color3.fromRGB(0,0,0), 0)
SearchRow.BackgroundTransparency = 1

local SearchBox = CreateTextBox(SearchRow, "Search player...", UDim2.new(1, -70, 1, 0), UDim2.new(0, 0, 0, 0))

local HeadshotImage = Instance.new("ImageButton")
HeadshotImage.Size = UDim2.new(0, 50, 0, 50)
HeadshotImage.Position = UDim2.new(1, -55, 0, 0)
HeadshotImage.BackgroundColor3 = Colors.Element
HeadshotImage.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
HeadshotImage.ScaleType = Enum.ScaleType.Crop
HeadshotImage.Parent = SearchRow

local imgCorner = Instance.new("UICorner")
imgCorner.CornerRadius = UDim.new(0, 10)
imgCorner.Parent = HeadshotImage

local PlayerInfo = CreateFrame(TargetingPage, UDim2.new(1, -20, 0, 40), UDim2.new(0, 10, 0, 70), Colors.Element, 10)
local PlayerNameLabel = CreateTextLabel(PlayerInfo, "No Target", UDim2.new(0.6, 0, 1, 0), UDim2.new(0, 12, 0, 0), Colors.TextMain, 14, Enum.TextXAlignment.Left)
PlayerNameLabel.Font = Enum.Font.GothamBold

local PlayerStatus = CreateTextLabel(PlayerInfo, "Waiting...", UDim2.new(0.4, -12, 1, 0), UDim2.new(0.6, 0, 0, 0), Colors.TextDim, 11, Enum.TextXAlignment.Right)

-- دوال البحث والمراقبة
local function findTargetPlayer()
    local targetName = SearchBox.Text
    if targetName == "" then
        return nil
    end
    
    for _, player in pairs(Players:GetPlayers()) do
        if player.Name:lower():sub(1, #targetName) == targetName:lower() or 
           player.DisplayName:lower():sub(1, #targetName) == targetName:lower() then
            return player
        end
    end
    return nil
end

local function isPlayerValid(player)
    if not player then return false end
    if not player.Character then return false end
    local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
    if not humanoid then return false end
    if humanoid.Health <= 0 then return false end
    return true
end

local function waitForPlayer(targetPlayer)
    if not targetPlayer then return false end
    
    while not isPlayerValid(targetPlayer) do
        task.wait(_G.RetryDelay)
        if not targetPlayer.Parent then
            return false
        end
    end
    return true
end

SearchBox.FocusLost:Connect(function(enterPressed)
	if enterPressed then
		local query = SearchBox.Text
		if #query < 2 then return end
		
		PlayerStatus.Text = "Searching..."
		PlayerStatus.TextColor3 = Colors.Warning
		
		task.spawn(function()
			task.wait(0.3)
			
			local foundPlayer = findTargetPlayer()
			
			if foundPlayer then
				currentTargetData = foundPlayer
				PlayerNameLabel.Text = foundPlayer.DisplayName
				PlayerStatus.Text = "✓ Locked"
				PlayerStatus.TextColor3 = Colors.Success
				
				local thumbType = Enum.ThumbnailType.HeadShot
				local thumbSize = Enum.ThumbnailSize.Size100x100
				local content, isReady = Players:GetUserThumbnailAsync(foundPlayer.UserId, thumbType, thumbSize)
				HeadshotImage.Image = content
				
				ToggleSound:Play()
			else
				currentTargetData = nil
				PlayerNameLabel.Text = "Not Found"
				PlayerStatus.Text = "✗ Error"
				PlayerStatus.TextColor3 = Colors.Danger
				HeadshotImage.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
			end
		end)
	end
end)

-- زر المشاهدة
local ViewBtn = CreateButton(TargetingPage, "👁️ VIEW TARGET", UDim2.new(1, -20, 0, 45), UDim2.new(0, 10, 1, -55), function()
	if currentTargetData and currentTargetData.Character then
		local camera = workspace.CurrentCamera
		local targetHead = currentTargetData.Character:FindFirstChild("Head")
		
		if targetHead then
			camera.CameraSubject = targetHead
			print("Viewing: " .. currentTargetData.Name)
		else
			warn("Character not found!")
		end
	else
		warn("No target selected!")
		PlayerStatus.Text = "Select target first!"
		PlayerStatus.TextColor3 = Colors.Warning
		task.wait(2)
		if not currentTargetData then
			PlayerStatus.Text = "Waiting..."
			PlayerStatus.TextColor3 = Colors.TextDim
		end
	end
end)

-- ============================================================================
-- قسم التخريب (Trolling Tab)
-- ============================================================================

local function CreateTrollingButton(parent, name, posX, posY, callback)
	local btn = CreateFrame(parent, UDim2.new(0.31, 0, 0, 40), UDim2.new(posX, 0, posY, 0), Colors.Element, 10)
	
	local label = CreateTextLabel(btn, name, UDim2.new(1, -60, 1, 0), UDim2.new(0, 12, 0, 0), Colors.TextMain, 12, Enum.TextXAlignment.Left)
	
	local statusDot = Instance.new("Frame")
	statusDot.Size = UDim2.new(0, 8, 0, 8)
	statusDot.Position = UDim2.new(1, -20, 0.5, -4)
	statusDot.BackgroundColor3 = Colors.Danger
	statusDot.BorderSizePixel = 0
	statusDot.Parent = btn
	
	local dotCorner = Instance.new("UICorner")
	dotCorner.CornerRadius = UDim.new(1, 0)
	dotCorner.Parent = statusDot
	
	btn.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			ClickSound:Play()
			callback()
		end
	end)
	
	btn.MouseEnter:Connect(function()
		TweenService:Create(btn, TweenInfo.new(0.15), {BackgroundColor3 = Colors.ElementHover}):Play()
	end)
	
	btn.MouseLeave:Connect(function()
		TweenService:Create(btn, TweenInfo.new(0.15), {BackgroundColor3 = Colors.Element}):Play()
	end)
	
	return btn, statusDot
end

-- دوال التخريب
local function startBenx(target)
    if not target or not isPlayerValid(target) then return end
    
    pcall(function()
        local player = LocalPlayer
        if not player.Character then return end
        
        player.Character.HumanoidRootPart.CFrame = target.Character.LowerTorso.CFrame * CFrame.new(0, 0, -1.3) * CFrame.Angles(-1.5, 0, 0)
        task.wait()
        player.Character.Humanoid.Sit = true
        player.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
    end)
end

local function startBang(target)
    if not target or not isPlayerValid(target) then return end
    
    pcall(function()
        local player = LocalPlayer
        if not player.Character then return end
        
        player.Character:FindFirstChildOfClass("Humanoid").PlatformStand = true
        player.Character.HumanoidRootPart.CFrame = target.Character.LowerTorso.CFrame * CFrame.new(0, 0, 1.3)
        task.wait()
        player.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
    end)
end

local function startFaceBang(target)
    if not target or not isPlayerValid(target) then return end
    
    pcall(function()
        local player = LocalPlayer
        if not player.Character then return end
        
        player.Character.HumanoidRootPart.CFrame = target.Character.Head.CFrame * CFrame.new(0, 0.5, -1.3) * CFrame.Angles(0, -3.3, 0)
        task.wait()
        player.Character.Humanoid.Sit = true
        player.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
    end)
end

local function startHeadSit(target)
    if not target or not isPlayerValid(target) then return end
    
    pcall(function()
        local player = LocalPlayer
        if not player.Character then return end
        
        player.Character.Humanoid.Sit = true
        player.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
        player.Character.HumanoidRootPart.CFrame = target.Character.Head.CFrame * CFrame.new(0, 1.3, 1)
    end)
end

local function startSuck(target)
    if not target or not isPlayerValid(target) then return end
    
    pcall(function()
        local player = LocalPlayer
        if not player.Character then return end
        
        player.Character.Humanoid.Sit = true
        player.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
        player.Character.HumanoidRootPart.CFrame = target.Character.LowerTorso.CFrame * CFrame.new(0, -1, -1.7) * CFrame.Angles(0, -3.3, 0)
    end)
end

local function startFollow(target)
    if not target or not isPlayerValid(target) then return end
    
    pcall(function()
        local player = LocalPlayer
        if not player.Character then return end
        
        player.Character.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -3)
    end)
end

local function resetCharacter()
    local player = LocalPlayer
    if player and player.Character then
        local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.Sit = false
            humanoid.PlatformStand = false
            humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end

-- الصف الأول: 3 أزرار
local BenxBtn, BenxDot = CreateTrollingButton(TrollingPage, "Benx", 0.01, 0, function()
    local target = findTargetPlayer() or currentTargetData
    if not target then
        PlayerStatus.Text = "Select target!"
        PlayerStatus.TextColor3 = Colors.Warning
        return
    end
    
    Benx = not Benx
    Bang = false; Suck = false; HeadSit = false; FaceBang = false; Stand = false; Follow = false
    
    if Benx then
        _G.FlingTarget = target
        BenxDot.BackgroundColor3 = Colors.Success
        task.spawn(function()
            while Benx do
                if isPlayerValid(target) then
                    startBenx(target)
                else
                    waitForPlayer(target)
                end
                task.wait(0.1)
            end
        end)
    else
        BenxDot.BackgroundColor3 = Colors.Danger
        resetCharacter()
        _G.FlingTarget = nil
    end
end)

local BangBtn, BangDot = CreateTrollingButton(TrollingPage, "Bang", 0.345, 0, function()
    local target = findTargetPlayer() or currentTargetData
    if not target then
        PlayerStatus.Text = "Select target!"
        PlayerStatus.TextColor3 = Colors.Warning
        return
    end
    
    Bang = not Bang
    Benx = false; Suck = false; HeadSit = false; FaceBang = false; Stand = false; Follow = false
    
    if Bang then
        _G.FlingTarget = target
        BangDot.BackgroundColor3 = Colors.Success
        task.spawn(function()
            while Bang do
                if isPlayerValid(target) then
                    startBang(target)
                else
                    waitForPlayer(target)
                end
                task.wait(0.1)
            end
        end)
    else
        BangDot.BackgroundColor3 = Colors.Danger
        resetCharacter()
        _G.FlingTarget = nil
    end
end)

local FaceBangBtn, FaceBangDot = CreateTrollingButton(TrollingPage, "Face Bang", 0.68, 0, function()
    local target = findTargetPlayer() or currentTargetData
    if not target then
        PlayerStatus.Text = "Select target!"
        PlayerStatus.TextColor3 = Colors.Warning
        return
    end
    
    FaceBang = not FaceBang
    Benx = false; Bang = false; Suck = false; HeadSit = false; Stand = false; Follow = false
    
    if FaceBang then
        _G.FlingTarget = target
        FaceBangDot.BackgroundColor3 = Colors.Success
        task.spawn(function()
            while FaceBang do
                if isPlayerValid(target) then
                    startFaceBang(target)
                else
                    waitForPlayer(target)
                end
                task.wait(0.1)
            end
        end)
    else
        FaceBangDot.BackgroundColor3 = Colors.Danger
        resetCharacter()
        _G.FlingTarget = nil
    end
end)

-- الصف الثاني: 3 أزرار
local HeadSitBtn, HeadSitDot = CreateTrollingButton(TrollingPage, "Head Sit", 0.01, 45, function()
    local target = findTargetPlayer() or currentTargetData
    if not target then
        PlayerStatus.Text = "Select target!"
        PlayerStatus.TextColor3 = Colors.Warning
        return
    end
    
    HeadSit = not HeadSit
    Benx = false; Bang = false; Suck = false; FaceBang = false; Stand = false; Follow = false
    
    if HeadSit then
        _G.FlingTarget = target
        HeadSitDot.BackgroundColor3 = Colors.Success
        task.spawn(function()
            while HeadSit do
                if isPlayerValid(target) then
                    startHeadSit(target)
                else
                    waitForPlayer(target)
                end
                task.wait(0.1)
            end
        end)
    else
        HeadSitDot.BackgroundColor3 = Colors.Danger
        resetCharacter()
        _G.FlingTarget = nil
    end
end)

local SuckBtn, SuckDot = CreateTrollingButton(TrollingPage, "Suck", 0.345, 45, function()
    local target = findTargetPlayer() or currentTargetData
    if not target then
        PlayerStatus.Text = "Select target!"
        PlayerStatus.TextColor3 = Colors.Warning
        return
    end
    
    Suck = not Suck
    Benx = false; Bang = false; HeadSit = false; FaceBang = false; Stand = false; Follow = false
    
    if Suck then
        _G.FlingTarget = target
        SuckDot.BackgroundColor3 = Colors.Success
        task.spawn(function()
            while Suck do
                if isPlayerValid(target) then
                    startSuck(target)
                else
                    waitForPlayer(target)
                end
                task.wait(0.1)
            end
        end)
    else
        SuckDot.BackgroundColor3 = Colors.Danger
        resetCharacter()
        _G.FlingTarget = nil
    end
end)

local FollowBtn, FollowDot = CreateTrollingButton(TrollingPage, "Follow", 0.68, 45, function()
    local target = findTargetPlayer() or currentTargetData
    if not target then
        PlayerStatus.Text = "Select target!"
        PlayerStatus.TextColor3 = Colors.Warning
        return
    end
    
    Follow = not Follow
    Benx = false; Bang = false; Suck = false; HeadSit = false; FaceBang = false; Stand = false
    
    if Follow then
        _G.FlingTarget = target
        FollowDot.BackgroundColor3 = Colors.Success
        task.spawn(function()
            while Follow do
                if isPlayerValid(target) then
                    startFollow(target)
                else
                    waitForPlayer(target)
                end
                task.wait(0.1)
            end
        end)
    else
        FollowDot.BackgroundColor3 = Colors.Danger
        _G.FlingTarget = nil
    end
end)

-- زر إلغاء كل التخريب
local ResetBtn = CreateButton(TrollingPage, "🛑 Reset All", UDim2.new(1, -20, 0, 40), UDim2.new(0, 10, 0, 100), function()
    Benx = false; Bang = false; Suck = false; HeadSit = false; FaceBang = false; Stand = false; Follow = false
    _G.FlingTarget = nil
    
    BenxDot.BackgroundColor3 = Colors.Danger
    BangDot.BackgroundColor3 = Colors.Danger
    FaceBangDot.BackgroundColor3 = Colors.Danger
    HeadSitDot.BackgroundColor3 = Colors.Danger
    SuckDot.BackgroundColor3 = Colors.Danger
    FollowDot.BackgroundColor3 = Colors.Danger
    
    resetCharacter()
    print("تم إلغاء كل عمليات التخريب")
end)

-- زر الإظهار العائم
local MinimizedButton = Instance.new("TextButton")
MinimizedButton.Name = "RestoreBtn"
MinimizedButton.Size = UDim2.new(0, 45, 0, 45)
MinimizedButton.Position = UDim2.new(0, 15, 0.5, -22.5)
MinimizedButton.BackgroundColor3 = Colors.Accent
MinimizedButton.Text = "⚙"
MinimizedButton.TextSize = 22
MinimizedButton.TextColor3 = Color3.new(1,1,1)
MinimizedButton.Visible = false
MinimizedButton.AutoButtonColor = false
MinimizedButton.Parent = ScreenGui

local miniCorner = Instance.new("UICorner")
miniCorner.CornerRadius = UDim.new(1, 0)
miniCorner.Parent = MinimizedButton

MinimizedButton.MouseButton1Click:Connect(function()
	ClickSound:Play()
	isGuiVisible = true
	MainContainer.Visible = true
	MinimizedButton.Visible = false
	
	MainContainer.Position = UDim2.new(0.5, -300, 0.5, -245)
	TweenService:Create(MainContainer, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
		Position = UDim2.new(0.5, -300, 0.5, -225)
	}):Play()
end)

-- جعل الواجهة قابلة للسحب
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
