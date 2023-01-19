_G.keyword = "0001" -- keyword you can change this based off what they say the most, this scans chat for the message
_G.removemessage = false -- if enabled deletes the message the bot sends doesn't close the space between messages
local ui = Instance.new("ScreenGui")
local txtlbl = Instance.new("TextLabel")
ui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
txtlbl.Parent = ui
txtlbl.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
txtlbl.BackgroundTransparency = 1.000
txtlbl.Position = UDim2.new(0, 0, 1, -27)
txtlbl.Size = UDim2.new(0, 483, 0, 27)
txtlbl.Font = Enum.Font.FredokaOne
txtlbl.Text = "Antibot: Enabled | Discord.gg/2ta6UfUn7U" -- woulda obfuscated this shi but im too lazy
txtlbl.TextColor3 = Color3.fromRGB(255, 255, 255)
txtlbl.TextScaled = true
txtlbl.TextSize = 14.000
txtlbl.TextStrokeTransparency = 0.000
txtlbl.TextWrapped = true
while wait(1) do
    for i, v in pairs(
        game:GetService("Players").LocalPlayer.PlayerGui.Chat.Frame.ChatChannelParentFrame["Frame_MessageLogDisplay"].Scroller:GetChildren(

        )
    ) do
        if v:IsA("Frame") and v:FindFirstChild("TextLabel") ~= nil then
            msg = v.TextLabel
            if string.find(msg.Text, _G.keyword) then
               
                filt = string.gsub(msg.TextButton.Text, ":", "")
                filt2 = string.gsub(filt, "%[", "")
                filt3 = string.gsub(filt2, "%]", "")
                user = filt3
                for i, player in pairs(game.Players:GetChildren()) do
                    if string.find(string.lower(player.DisplayName), string.lower(user)) then
                        local playerObject = workspace:FindFirstChild(player.Name)
                        if playerObject ~= nil then
                            playerObject:Destroy()
                        end
                    end
                end
                if _G.removemessage == false then
                msg.Text = "                              CLEANED BY SOURCECODEDS ANTIBOT, SERVER: 2ta6UfUn7U"
                msg.TextButton.Text = "[FLINGBOT]:"
                end
                if _G.removemessage == true then
                    msg:Destroy()
                end
            end
        end
    end
end
