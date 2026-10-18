
-- YBA-style Auto Farm GUI (UI prototype)
-- Place in a LocalScript in StarterPlayerScripts

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local gui = Instance.new("ScreenGui")
gui.Name = "FarmHub"
gui.ResetOnSpawn = false
gui.Parent = playerGui

local frame = Instance.new("Frame")
frame.Size = UDim2.fromOffset(320, 280)
frame.Position = UDim2.new(0.5, -160, 0.5, -140)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 32)
frame.Parent = gui

Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 10)

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -45, 0, 42)
title.Position = UDim2.fromOffset(12, 0)
title.BackgroundTransparency = 1
title.Text = "YBA | FARM HUB"
title.TextColor3 = Color3.fromRGB(255, 90, 90)
title.TextSize = 19
title.Font = Enum.Font.GothamBold
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = frame

local close = Instance.new("TextButton")
close.Size = UDim2.fromOffset(32, 30)
close.Position = UDim2.new(1, -38, 0, 6)
close.Text = "X"
close.BackgroundColor3 = Color3.fromRGB(170, 55, 55)
close.TextColor3 = Color3.new(1, 1, 1)
close.Parent = frame
close.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

local status = Instance.new("TextLabel")
status.Size = UDim2.new(1, -24, 0, 28)
status.Position = UDim2.fromOffset(12, 45)
status.BackgroundTransparency = 1
status.Text = "Status: Idle"
status.TextColor3 = Color3.fromRGB(200, 200, 210)
status.TextSize = 14
status.Parent = frame

local function makeButton(text, y)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, -24, 0, 36)
    button.Position = UDim2.fromOffset(12, y)
    button.BackgroundColor3 = Color3.fromRGB(48, 48, 60)
    button.TextColor3 = Color3.new(1, 1, 1)
    button.TextSize = 14
    button.Font = Enum.Font.Gotham
    button.Text = text
    button.Parent = frame
    Instance.new("UICorner", button).CornerRadius =
        UDim.new(0, 6)
    return button
end

local farming = false
local delayTime = 1

local farmButton = makeButton("Auto Farm: OFF", 82)
farmButton.MouseButton1Click:Connect(function()
    farming = not farming
    farmButton.Text = farming and
        "Auto Farm: ON" or "Auto Farm: OFF"
    farmButton.BackgroundColor3 = farming and
        Color3.fromRGB(45, 130, 85) or
        Color3.fromRGB(48, 48, 60)

    status.Text = farming and
        "Status: Enabled (UI only)" or "Status: Idle"
end)

local delayButton = makeButton("Collect Delay: 1s", 126)
delayButton.MouseButton1Click:Connect(function()
    delayTime = delayTime + 0.5
    if delayTime > 3 then
        delayTime = 0.5
    end
    delayButton.Text = "Collect Delay: " ..
        tostring(delayTime) .. "s"
end)

local sellButton = makeButton("Auto Sell: OFF", 170)
local selling = false
sellButton.MouseButton1Click:Connect(function()
    selling = not selling
    sellButton.Text = selling and
        "Auto Sell: ON" or "Auto Sell: OFF"
end)

local hopButton = makeButton("Server Hop", 214)
hopButton.MouseButton1Click:Connect(function()
    status.Text = "Status: Server Hop not connected"
end)
