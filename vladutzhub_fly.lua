-- vladutz hub fly script with modern UI, gradient, rounded corners
-- includes a separate instructions panel with minimize and close buttons

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

-- Create main GUI
local gui = Instance.new("ScreenGui")
gui.Name = "VladutzHubFly"
gui.Parent = PlayerGui

-- Main frame
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 350, 0, 230)
frame.Position = UDim2.new(0.5, -175, 0.5, -115)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 0
frame.Active = true
frame.Parent = gui

local uicorner = Instance.new("UICorner", frame)
uicorner.CornerRadius = UDim.new(0, 15)

local gradient = Instance.new("UIGradient", frame)
gradient.Rotation = 45
gradient.Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(85, 170, 255)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(150, 85, 255))
}

-- Animate gradient colors
local t = 0
RunService.Heartbeat:Connect(function(dt)
	t = t + dt
	local c1 = Color3.fromHSV((t*0.15)%1, 0.7, 0.9)
	local c2 = Color3.fromHSV(((t*0.15)+0.33)%1, 0.7, 0.9)
	gradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, c1), ColorSequenceKeypoint.new(1, c2)}
end)

-- Title bar
local titleBar = Instance.new("Frame", frame)
titleBar.Size = UDim2.new(1, 0, 0, 40)
titleBar.BackgroundTransparency = 0.7
titleBar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
titleBar.BorderSizePixel = 0

local titleText = Instance.new("TextLabel", titleBar)
titleText.Text = "vladutz hub fly"
titleText.Size = UDim2.new(1, -120, 1, 0)
titleText.Position = UDim2.new(0, 10, 0, 0)
titleText.BackgroundTransparency = 1
titleText.TextColor3 = Color3.fromRGB(255,255,255)
titleText.Font = Enum.Font.GothamBold
titleText.TextSize = 22
titleText.TextXAlignment = Enum.TextXAlignment.Left

local closeBtn = Instance.new("TextButton", titleBar)
closeBtn.Text = "✕"
closeBtn.Size = UDim2.new(0, 40, 1, 0)
closeBtn.Position = UDim2.new(1, -40, 0, 0)
closeBtn.BackgroundTransparency = 0.8
closeBtn.TextColor3 = Color3.fromRGB(255, 100, 100)
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 24
closeBtn.AutoButtonColor = true
local closeUICorner = Instance.new("UICorner", closeBtn)
closeUICorner.CornerRadius = UDim.new(0, 8)

local minimizeBtn = Instance.new("TextButton", titleBar)
minimizeBtn.Text = "–"
minimizeBtn.Size = UDim2.new(0, 40, 1, 0)
minimizeBtn.Position = UDim2.new(1, -80, 0, 0)
minimizeBtn.BackgroundTransparency = 0.8
minimizeBtn.TextColor3 = Color3.fromRGB(255, 255, 100)
minimizeBtn.Font = Enum.Font.GothamBold
minimizeBtn.TextSize = 24
minimizeBtn.AutoButtonColor = true
local minUICorner = Instance.new("UICorner", minimizeBtn)
minUICorner.CornerRadius = UDim.new(0, 8)

-- Content frame
local contentFrame = Instance.new("Frame", frame)
contentFrame.Size = UDim2.new(1, 0, 1, -40)
contentFrame.Position = UDim2.new(0, 0, 0, 40)
contentFrame.BackgroundTransparency = 1

-- Fly button
local flyBtn = Instance.new("TextButton", contentFrame)
flyBtn.Text = "Fly (E)"
flyBtn.Size = UDim2.new(0, 140, 0, 50)
flyBtn.Position = UDim2.new(0.5, -70, 0.5, -25)
flyBtn.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
flyBtn.TextColor3 = Color3.fromRGB(255,255,255)
flyBtn.Font = Enum.Font.Gotham
flyBtn.TextSize = 22
flyBtn.AutoButtonColor = true
local flyUICorner = Instance.new("UICorner", flyBtn)
flyUICorner.CornerRadius = UDim.new(0, 10)

-- Instructions panel
local instructionsFrame = Instance.new("Frame")
instructionsFrame.Size = UDim2.new(0, 300, 0, 140)
instructionsFrame.Position = UDim2.new(0.5, -150, 0.5, 120)
instructionsFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
instructionsFrame.BorderSizePixel = 0
instructionsFrame.Parent = gui

local insUICorner = Instance.new("UICorner", instructionsFrame)
insUICorner.CornerRadius = UDim.new(0, 15)

local insTitleBar = Instance.new("Frame", instructionsFrame)
insTitleBar.Size = UDim2.new(1, 0, 0, 35)
insTitleBar.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
insTitleBar.BorderSizePixel = 0

local insTitleText = Instance.new("TextLabel", insTitleBar)
insTitleText.Text = "Instructions"
insTitleText.Size = UDim2.new(1, -80, 1, 0)
insTitleText.Position = UDim2.new(0, 10, 0, 0)
insTitleText.BackgroundTransparency = 1
insTitleText.TextColor3 = Color3.fromRGB(255, 255, 255)
insTitleText.Font = Enum.Font.GothamBold
insTitleText.TextSize = 20
insTitleText.TextXAlignment = Enum.TextXAlignment.Left

local insCloseBtn = Instance.new("TextButton", insTitleBar)
insCloseBtn.Text = "✕"
insCloseBtn.Size = UDim2.new(0, 40, 1, 0)
insCloseBtn.Position = UDim2.new(1, -40, 0, 0)
insCloseBtn.BackgroundTransparency = 0.8
insCloseBtn.TextColor3 = Color3.fromRGB(255, 100, 100)
insCloseBtn.Font = Enum.Font.GothamBold
insCloseBtn.TextSize = 24
insCloseBtn.AutoButtonColor = true
local insCloseUICorner = Instance.new("UICorner", insCloseBtn)
insCloseUICorner.CornerRadius = UDim.new(0, 8)

local insMinimizeBtn = Instance.new("TextButton", insTitleBar)
insMinimizeBtn.Text = "–"
insMinimizeBtn.Size = UDim2.new(0, 40, 1, 0)
insMinimizeBtn.Position = UDim2.new(1, -80, 0, 0)
insMinimizeBtn.BackgroundTransparency = 0.8
insMinimizeBtn.TextColor3 = Color3.fromRGB(255, 255, 100)
insMinimizeBtn.Font = Enum.Font.GothamBold
insMinimizeBtn.TextSize = 24
insMinimizeBtn.AutoButtonColor = true
local insMinUICorner = Instance.new("UICorner", insMinimizeBtn)
insMinUICorner.CornerRadius = UDim.new(0, 8)

local insText = Instance.new("TextLabel", instructionsFrame)
insText.Text = [[
- Press E to toggle fly on/off.
- Use WASD to move horizontally.
- Press SPACE to ascend.
- Hold SHIFT to descend.
- Drag the title bars to move UI windows.
- Use the – button to minimize panels.
- Use the ✕ button to close panels.
]]
insText.Size = UDim2.new(1, -20, 1, -40)
insText.Position = UDim2.new(0, 10, 0, 40)
insText.BackgroundTransparency = 1
insText.TextColor3 = Color3.fromRGB(220, 220, 220)
insText.Font = Enum.Font.Gotham
insText.TextSize = 16
insText.TextWrapped = true
insText.TextYAlignment = Enum.TextYAlignment.Top

-- Dragging main UI
local dragging = false
local dragInput
local dragStart
local startPos

local function update(input)
	local delta = input.Position - dragStart
	frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
		startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

titleBar.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = true
		dragStart = input.Position
		startPos = frame.Position

		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

titleBar.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement then
		dragInput = input
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if input == dragInput and dragging then
		update(input)
	end
end)

-- Dragging instructions UI
local draggingIns = false
local dragInputIns
local dragStartIns
local startPosIns

local function updateIns(input)
	local delta = input.Position - dragStartIns
	instructionsFrame.Position = UDim2.new(startPosIns.X.Scale, startPosIns.X.Offset + delta.X,
		startPosIns.Y.Scale, startPosIns.Y.Offset + delta.Y)
end

insTitleBar.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		draggingIns = true
		dragStartIns = input.Position
		startPosIns = instructionsFrame.Position

		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				draggingIns = false
			end
		end)
	end
end)

insTitleBar.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement then
		dragInputIns = input
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if input == dragInputIns and draggingIns then
		updateIns(input)
	end
end)

-- Minimize main UI
local minimized = false
minimizeBtn.MouseButton1Click:Connect(function()
	if not minimized then
		contentFrame.Visible = false
		frame.Size = UDim2.new(0, 350, 0, 40)
		minimized = true
	else
		contentFrame.Visible = true
		frame.Size = UDim2.new(0, 350, 0, 230)
		minimized = false
	end
end)

-- Close main UI
closeBtn.MouseButton1Click:Connect(function()
	gui:Destroy()
end)

-- Minimize instructions panel
local insMinimized = false
insMinimizeBtn.MouseButton1Click:Connect(function()
	if not insMinimized then
		insText.Visible = false
		insMinimizeBtn.Text = "+"
		insMinimized = true
	else
		insText.Visible = true
		insMinimizeBtn.Text = "–"
		insMinimized = false
	end
end)

-- Close instructions panel
insCloseBtn.MouseButton1Click:Connect(function()
	instructionsFrame.Visible = false
end)

-- Flying logic

local flying = false
local player = LocalPlayer
local UIS = UserInputService

local character = player.Character or player.CharacterAdded:Wait()
local hrp = character:WaitForChild("HumanoidRootPart")

local bv = Instance.new("BodyVelocity")
bv.MaxForce = Vector3.new(0,0,0)
bv.Velocity = Vector3.new(0,0,0)
bv.Parent = hrp

local speed = 70
local keysDown = {}

local function toggleFly()
	flying = not flying
	if flying then
		bv.MaxForce = Vector3.new(9e9,9e9,9e9)
		bv.Velocity = Vector3.new(0,0,0)
	else
		bv.MaxForce = Vector3.new(0,0,0)
		bv.Velocity = Vector3.new(0,0,0)
	end
end

flyBtn.MouseButton1Click:Connect(toggleFly)

UIS.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then return end
	if input.KeyCode == Enum.KeyCode.E then
		toggleFly()
	elseif input.UserInputType == Enum.UserInputType.Keyboard then
		keysDown[input.KeyCode] = true
	end
end)

UIS.InputEnded:Connect(function(input, gameProcessed)
	if gameProcessed then return end
	if input.UserInputType == Enum.UserInputType.Keyboard then
		keysDown[input.KeyCode] = nil
	end
end)

RunService.Heartbeat:Connect(function()
	if flying then
		local cam = workspace.CurrentCamera
		local lookVector = cam.CFrame.LookVector
		local rightVector = cam.CFrame.RightVector
		local moveVector = Vector3.new(0,0,0)

		if keysDown[Enum.KeyCode.W] then
			moveVector = moveVector + Vector3.new(lookVector.X, 0, lookVector.Z)
		end
		if keysDown[Enum.KeyCode.S] then
			moveVector = moveVector - Vector3.new(lookVector.X, 0, lookVector.Z)
		end
		if keysDown[Enum.KeyCode.A] then
			moveVector = moveVector - Vector3.new(rightVector.X, 0, rightVector.Z)
		end
		if keysDown[Enum.KeyCode.D] then
			moveVector = moveVector + Vector3.new(rightVector.X, 0, rightVector.Z)
		end

		-- vertical movement
		if keysDown[Enum.KeyCode.Space] then
			moveVector = moveVector + Vector3.new(0,1,0)
		end
		if keysDown[Enum.KeyCode.LeftShift] or keysDown[Enum.KeyCode.RightShift] then
			moveVector = moveVector - Vector3.new(0,1,0)
		end

		if moveVector.Magnitude > 0 then
			moveVector = moveVector.Unit * speed
		else
			moveVector = Vector3.new(0,0,0)
		end

		bv.Velocity = moveVector
	else
		bv.Velocity = Vector3.new(0,0,0)
	end
end)

