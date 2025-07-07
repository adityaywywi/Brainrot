print("Brainrot Neon UI Loaded")

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

-- Neon Logo "Dmark"
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

-- Close Button
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

-- Tab Names
local tabNames = {"Main", "Visual", "Misc"}
local tabs = {}
local selectedTab = nil

local buttonFrame = Instance.new("Frame", frame)
buttonFrame.Size = UDim2.new(1, 0, 0, 35)
buttonFrame.Position = UDim2.new(0, 0, 0, 35)
buttonFrame.BackgroundTransparency = 1

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
	tabFrame.Position = UDim2.new(0, 0, 0, 70)
	tabFrame.Size = UDim2.new(1, 0, 1, -70)
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

-- Toggle Generator
local function createToggle(parent, text)
	local toggle = Instance.new("TextButton", parent)
	toggle.Size = UDim2.new(0, 160, 0, 30)
	toggle.BackgroundColor3 = Color3.fromRGB(55, 55, 90)
	toggle.Text = text .. ": OFF"
	toggle.TextColor3 = Color3.fromRGB(0, 255, 255)
	toggle.BorderSizePixel = 0
	toggle.AutoButtonColor = true
	Instance.new("UICorner", toggle)

	local state = false
	toggle.MouseButton1Click:Connect(function()
		state = not state
		toggle.Text = text .. ": " .. (state and "ON" or "OFF")
	end)

	return toggle
end

-- Toggle for Main
local y = 10
for _, name in ipairs({"Air Jump", "Speed Boost", "Float", "Anti Stun", "Anti Afk", "Steal Helper"}) do
	local t = createToggle(tabs["Main"], name)
	t.Position = UDim2.new(0, 10, 0, y)
	y = y + 35
end

-- Toggle for Visual
y = 10
for _, name in ipairs({"ESP HighLight", "ESP Name", "ESP Base Time", "ESP Brainrot"}) do
	local t = createToggle(tabs["Visual"], name)
	t.Position = UDim2.new(0, 10, 0, y)
	y = y + 35
end

-- Button for Misc
y = 10
for _, name in ipairs({"Invisibility Cloak", "Bee Launcher", "Medusa's Head", "Quantum Cloner", "Rainbowrath Sword"}) do
	local t = Instance.new("TextButton", tabs["Misc"])
	t.Size = UDim2.new(0, 300, 0, 30)
	t.Position = UDim2.new(0, 10, 0, y)
	t.Text = name
	t.BackgroundColor3 = Color3.fromRGB(55, 55, 90)
	t.TextColor3 = Color3.fromRGB(255, 0, 255)
	t.BorderSizePixel = 0
	Instance.new("UICorner", t)
	y = y + 35
end

-- Hover Glow
local function addNeonHover(button, color)
	if not button:IsA("TextButton") then return end
	local originalColor = button.BackgroundColor3
	local hoverColor = color or Color3.fromRGB(80, 0, 255)

	button.MouseEnter:Connect(function()
		TweenService:Create(button, TweenInfo.new(0.15), {BackgroundColor3 = hoverColor}):Play()
	end)
	button.MouseLeave:Connect(function()
		TweenService:Create(button, TweenInfo.new(0.15), {BackgroundColor3 = originalColor}):Play()
	end)
end

-- Apply hover to all buttons
for _, obj in pairs(gui:GetDescendants()) do
	if obj:IsA("TextButton") then
		addNeonHover(obj)
	end
end
