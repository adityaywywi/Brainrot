print("Brainrot UI Loaded")

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local plr = Players.LocalPlayer
local gui = Instance.new("ScreenGui", plr:WaitForChild("PlayerGui"))
gui.Name = "BrainrotUI"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 350, 0, 250)
frame.Position = UDim2.new(0.5, -175, 0.5, -125)
frame.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 10)

-- Logo Dmark
local logo = Instance.new("TextLabel", frame)
logo.Text = "Dmark"
logo.Font = Enum.Font.GothamBlack
logo.TextColor3 = Color3.fromRGB(0, 255, 255)
logo.TextStrokeTransparency = 0.5
logo.TextStrokeColor3 = Color3.fromRGB(255, 0, 255)
logo.TextScaled = true
logo.BackgroundTransparency = 1
logo.Size = UDim2.new(0, 120, 0, 25)
logo.Position = UDim2.new(0, 10, 0, 5)

-- Close button
local close = Instance.new("TextButton", frame)
close.Text = "X"
close.Size = UDim2.new(0, 30, 0, 25)
close.Position = UDim2.new(1, -35, 0, 5)
close.BackgroundColor3 = Color3.fromRGB(60, 0, 0)
close.TextColor3 = Color3.fromRGB(255, 255, 255)
close.BorderSizePixel = 0
Instance.new("UICorner", close).CornerRadius = UDim.new(0, 4)
close.MouseButton1Click:Connect(function()
	gui:Destroy()
end)

-- Tabs
local buttonFrame = Instance.new("Frame", frame)
buttonFrame.Size = UDim2.new(1, 0, 0, 35)
buttonFrame.Position = UDim2.new(0, 0, 0, 40)
buttonFrame.BackgroundTransparency = 1

local tabs = {}
local tabNames = {"Main", "Visual"}
local selectedTab = nil

for i, name in ipairs(tabNames) do
	local btn = Instance.new("TextButton", buttonFrame)
	btn.Size = UDim2.new(0, 100, 0, 30)
	btn.Position = UDim2.new(0, (i - 1) * 110, 0, 2)
	btn.Text = name
	btn.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
	btn.TextColor3 = Color3.fromRGB(200, 200, 255)
	btn.BorderSizePixel = 0
	Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)

	local tabFrame = Instance.new("Frame", frame)
	tabFrame.Position = UDim2.new(0, 0, 0, 75)
	tabFrame.Size = UDim2.new(1, 0, 1, -75)
	tabFrame.Visible = false
	tabFrame.BackgroundTransparency = 1
	tabs[name] = tabFrame

	btn.MouseButton1Click:Connect(function()
		for _, f in pairs(tabs) do f.Visible = false end
		tabFrame.Visible = true
	end)

	if not selectedTab then
		tabFrame.Visible = true
		selectedTab = name
	end
end

-- Toggle
local function createToggle(parent, text, callback)
	local toggle = Instance.new("TextButton", parent)
	toggle.Size = UDim2.new(0, 160, 0, 30)
	toggle.BackgroundColor3 = Color3.fromRGB(55, 55, 90)
	toggle.Text = text .. ": OFF"
	toggle.TextColor3 = Color3.fromRGB(0, 255, 255)
	toggle.BorderSizePixel = 0
	Instance.new("UICorner", toggle)

	local state = false
	toggle.MouseButton1Click:Connect(function()
		state = not state
		toggle.Text = text .. ": " .. (state and "ON" or "OFF")
		if callback then callback(state) end
	end)

	return toggle
end

-- ESP Toggle
local espToggle = createToggle(tabs["Visual"], "ESP Name", function(state)
	if state then
		local espFunc = loadstring(readfile("esp.lua")) -- Ganti dengan game:HttpGet jika online
		if espFunc then espFunc() end
	else
		for _, plr in pairs(Players:GetPlayers()) do
			if plr ~= Players.LocalPlayer and plr.Character and plr.Character:FindFirstChild("Head") then
				local esp = plr.Character.Head:FindFirstChild("ESP")
				if esp then esp:Destroy() end
			end
		end
	end
end)
espToggle.Position = UDim2.new(0, 10, 0, 10)
