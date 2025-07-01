-- vladutz hub fly script

local gui = Instance.new("ScreenGui")
gui.Name = "VladutzHubFly"
gui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 200)
frame.Position = UDim2.new(0.5, -150, 0.5, -100)
frame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
frame.BorderSizePixel = 0
frame.Parent = gui

local uicorner = Instance.new("UICorner")
uicorner.CornerRadius = UDim.new(0, 12)
uicorner.Parent = frame

local title = Instance.new("TextLabel")
title.Text = "vladutz hub"
title.Size = UDim2.new(1, 0, 0, 40)
title.BackgroundTransparency = 1
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 24
title.Parent = frame

local button = Instance.new("TextButton")
button.Text = "Fly (E)"
button.Size = UDim2.new(0, 120, 0, 40)
button.Position = UDim2.new(0.5, -60, 0.5, -20)
button.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.Font = Enum.Font.Gotham
button.TextSize = 18
button.Parent = frame

local btnCorner = Instance.new("UICorner")
btnCorner.CornerRadius = UDim.new(0, 8)
btnCorner.Parent = button

-- Script de zbor (simplu cu E)
local flying = false
local UIS = game:GetService("UserInputService")
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
local bodyVelocity = Instance.new("BodyVelocity", humanoidRootPart)
bodyVelocity.MaxForce = Vector3.new(0, 0, 0)

UIS.InputBegan:Connect(function(input)
	if input.KeyCode == Enum.KeyCode.E then
		flying = not flying
		if flying then
			bodyVelocity.MaxForce = Vector3.new(400000, 400000, 400000)
		else
			bodyVelocity.MaxForce = Vector3.new(0, 0, 0)
		end
	end
end)

game:GetService("RunService").Heartbeat:Connect(function()
	if flying then
		bodyVelocity.Velocity = workspace.CurrentCamera.CFrame.LookVector * 60
	end
end)
