print("ESP Loaded")

return function()
    for _, player in pairs(game:GetService("Players"):GetPlayers()) do
        if player ~= game.Players.LocalPlayer then
            if not player.Character:FindFirstChild("Head"):FindFirstChild("ESP") then
                local esp = Instance.new("BillboardGui", player.Character.Head)
                esp.Name = "ESP"
                esp.Size = UDim2.new(0, 100, 0, 40)
                esp.Adornee = player.Character.Head
                esp.AlwaysOnTop = true

                local name = Instance.new("TextLabel", esp)
                name.Size = UDim2.new(1, 0, 1, 0)
                name.BackgroundTransparency = 1
                name.Text = player.Name
                name.TextColor3 = Color3.new(1, 1, 1)
                name.TextStrokeTransparency = 0
            end
        end
    end
end
