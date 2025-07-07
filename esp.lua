return function()
	print("ESP Activated")
	for _, player in pairs(game:GetService("Players"):GetPlayers()) do
		if player ~= game.Players.LocalPlayer then
			if player.Character and player.Character:FindFirstChild("Head") then
				if not player.Character.Head:FindFirstChild("ESP") then
					local esp = Instance.new("BillboardGui", player.Character.Head)
					esp.Name = "ESP"
					esp.Size = UDim2.new(0, 100, 0, 40)
					esp.Adornee = player.Character.Head
					esp.AlwaysOnTop = true

					local label = Instance.new("TextLabel", esp)
					label.Size = UDim2.new(1, 0, 1, 0)
					label.Text = player.Name
					label.BackgroundTransparency = 1
					label.TextColor3 = Color3.new(1, 1, 1)
					label.TextStrokeTransparency = 0.5
					label.Font = Enum.Font.SourceSansBold
					label.TextScaled = true
				end
			end
		end
	end
end
