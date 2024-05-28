local gui = Instance.new("ScreenGui")
gui.Name = "ScriptHub"
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.IgnoreGuiInset = true 
gui.Enabled = true

local frame = Instance.new("Frame")
frame.Name = "MainFrame"
frame.Size = UDim2.new(0, 800, 0, 600)
frame.Position = UDim2.new(0.5, -400, 0.5, -300)
frame.BackgroundColor3 = Color3.new(0, 1, 0)
frame.BackgroundTransparency = 0.5
frame.BorderSizePixel = 0
frame.Parent = gui

local upperBar = Instance.new("Frame")
upperBar.Name = "UpperBar"
upperBar.Size = UDim2.new(1, 0, 0, 20)
upperBar.BackgroundColor3 = Color3.new(0, 1, 0)
upperBar.BackgroundTransparency = 0.5
upperBar.BorderSizePixel = 0
upperBar.Parent = frame

local titleLabel = Instance.new("TextLabel")
titleLabel.Name = "TitleLabel"
titleLabel.Size = UDim2.new(1, 0, 0, 40)
titleLabel.Position = UDim2.new(0, 5, 0, 20)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "Best Script Hub v0.1"
titleLabel.TextColor3 = Color3.new(1, 1, 1)
titleLabel.Font = Enum.Font.SourceSans
titleLabel.TextSize = 28
titleLabel.Parent = frame

local closeButton = Instance.new("TextButton")
closeButton.Name = "CloseButton"
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -30, 0, 0)
closeButton.BackgroundColor3 = Color3.new(1, 0, 0)
closeButton.BackgroundTransparency = 0.5
closeButton.BorderSizePixel = 0
closeButton.Text = "X"
closeButton.TextColor3 = Color3.new(1, 1, 1)
closeButton.Font = Enum.Font.SourceSans
closeButton.TextSize = 20
closeButton.Parent = frame

local minimizeButton = Instance.new("TextButton")
minimizeButton.Name = "MinimizeButton"
minimizeButton.Size = UDim2.new(0, 30, 0, 30)
minimizeButton.Position = UDim2.new(1, -60, 0, 0)
minimizeButton.BackgroundColor3 = Color3.new(0, 0, 0)
minimizeButton.BackgroundTransparency = 0.5
minimizeButton.BorderSizePixel = 0
minimizeButton.Text = "-"
minimizeButton.TextColor3 = Color3.new(1, 0, 0)
minimizeButton.Font = Enum.Font.SourceSans
minimizeButton.TextSize = 20
minimizeButton.Parent = frame

local toggleKey = Enum.KeyCode.RightShift
local dragging = false
local offset = Vector2.new()

closeButton.MouseButton1Click:Connect(function()
    gui.Enabled = false
end)

minimizeButton.MouseButton1Click:Connect(function()
    frame.Visible = false
end)

game:GetService("UserInputService").InputBegan:Connect(function(input)
    if input.KeyCode == toggleKey then
        frame.Visible = not frame.Visible
    end
end)

upperBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        offset = input.Position - frame.Position
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        frame.Position = UDim2.new(0, input.Position.X - offset.X, 0, input.Position.Y - offset.Y)
    end
end)

game:GetService("UserInputService").InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

-- Ding Sound
local dingSound = Instance.new("Sound")
dingSound.SoundId = "rbxassetid://2865227271" -- Ding sound asset ID
dingSound.Parent = gui

gui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")