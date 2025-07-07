
-- DeadMark666X - LURK Style UI | Steal a Brainrot
-- Script by ChatGPT x Aditya

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local HumanoidRootPart = Char:WaitForChild("HumanoidRootPart")
local UIS = game:GetService("UserInputService")

-- [[ UI LIBRARY: Rayfield ]] --
local Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Rayfield/main/source"))()

local Window = Rayfield:CreateWindow({
    Name = "DeadMark Hub | Brainrot",
    LoadingTitle = "DeadMark Loader",
    LoadingSubtitle = "by 666XAditya",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "DeadMark666X",
        FileName = "brainrot"
    },
    Discord = {
        Enabled = false
    },
    KeySystem = false,
})

-- Variables
_G.AutoSteal = false
_G.AirJump = false
_G.SpeedBoost = false
_G.Float = false
_G.AntiAFK = false
_G.AntiStun = false

-- Main Tab
local Main = Window:CreateTab("Main", 4483362458)

Main:CreateToggle({
    Name = "Air Jump",
    CurrentValue = false,
    Callback = function(v)
        _G.AirJump = v
    end
})

Main:CreateToggle({
    Name = "Speed Boost",
    CurrentValue = false,
    Callback = function(v)
        _G.SpeedBoost = v
        if v then
            Char.Humanoid.WalkSpeed = 50
        else
            Char.Humanoid.WalkSpeed = 16
        end
    end
})

Main:CreateToggle({
    Name = "Float",
    CurrentValue = false,
    Callback = function(v)
        _G.Float = v
    end
})

Main:CreateToggle({
    Name = "Anti Stun",
    CurrentValue = true,
    Callback = function(v)
        _G.AntiStun = v
    end
})

Main:CreateToggle({
    Name = "Anti AFK",
    CurrentValue = true,
    Callback = function(v)
        _G.AntiAFK = v
    end
})

Main:CreateToggle({
    Name = "Auto Steal Brainrot",
    CurrentValue = false,
    Callback = function(v)
        _G.AutoSteal = v
    end
})

-- Visual Tab
local Visual = Window:CreateTab("Visual", 4483362458)

Visual:CreateParagraph({
    Title = "Coming Soon",
    Content = "ESP Brainrot, ESP Player, Highlight"
})

-- Misc Tab
local Misc = Window:CreateTab("Misc", 4483362458)

Misc:CreateButton({
    Name = "Rejoin Server",
    Callback = function()
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
    end
})

-- Function: Anti AFK
spawn(function()
    while true do
        if _G.AntiAFK then
            VirtualUser = game:service("VirtualUser")
            VirtualUser:CaptureController()
            VirtualUser:ClickButton2(Vector2.new())
        end
        task.wait(30)
    end
end)

-- Function: Auto Steal
spawn(function()
    while task.wait(1) do
        if _G.AutoSteal then
            for _, v in pairs(workspace:GetDescendants()) do
                if v:IsA("ProximityPrompt") and v.Parent:IsA("Model") and v.ObjectText == "Steal Brainrot" then
                    HumanoidRootPart.CFrame = v.Parent.PrimaryPart.CFrame + Vector3.new(0, 3, 0)
                    fireproximityprompt(v)
                    wait(0.5)
                end
            end
        end
    end
end)

-- Air Jump & Float
UIS.JumpRequest:Connect(function()
    if _G.AirJump and Char then
        Char:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
    end
end)

RunService.Heartbeat:Connect(function()
    if _G.Float and Char then
        HumanoidRootPart.Velocity = Vector3.new(0, 2, 0)
    end
    if _G.AntiStun then
        for _, v in pairs(Char:GetDescendants()) do
            if v:IsA("BoolValue") and v.Name:lower():find("stun") then
                v:Destroy()
            end
        end
    end
end)
