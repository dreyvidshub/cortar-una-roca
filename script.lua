local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

for _, obj in ipairs(game:GetDescendants()) do
    if obj:IsA("ProximityPrompt") then obj.HoldDuration = 0 end
end
game.DescendantAdded:Connect(function(obj)
    if obj:IsA("ProximityPrompt") then obj.HoldDuration = 0 end
end)

local coordsList = {
    {name = "Inicio", pos = Vector3.new(91.25, 7.00, 205.90)},
    {name = "Última zona", pos = Vector3.new(21.41, -1596.20, -2713.24)},
}

local function makeDraggable(frame, handle)
    local dragging, dragStart, startPos = false, nil, nil
    handle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then dragging = false end
            end)
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement
        or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - dragStart
            frame.Position = UDim2.new(
                startPos.X.Scale, startPos.X.Offset + delta.X,
                startPos.Y.Scale, startPos.Y.Offset + delta.Y
            )
        end
    end)
end

local COL = {
    bg          = Color3.fromRGB(245, 230, 211),
    bgDark      = Color3.fromRGB(230, 210, 185),
    card        = Color3.fromRGB(255, 248, 240),
    cardHover   = Color3.fromRGB(252, 238, 220),
    accent      = Color3.fromRGB(181, 126, 84),
    accentDark  = Color3.fromRGB(140, 92, 56),
    textDark    = Color3.fromRGB(74, 50, 32),
    textLight   = Color3.fromRGB(255, 250, 240),
    stroke      = Color3.fromRGB(200, 170, 140),
    shadow      = Color3.fromRGB(80, 55, 35),
    green       = Color3.fromRGB(120, 170, 100),
}

local gui = Instance.new("ScreenGui")
gui.Name = "DreyHub"
gui.ResetOnSpawn = false
gui.Parent = playerGui

local shadow = Instance.new("Frame")
shadow.Size = UDim2.fromOffset(300, 400)
shadow.Position = UDim2.fromScale(0.75, 0.05) + UDim2.fromOffset(5, 6)
shadow.BackgroundColor3 = COL.shadow
shadow.BackgroundTransparency = 0.55
shadow.BorderSizePixel = 0
shadow.ZIndex = 1
shadow.Parent = gui
Instance.new("UICorner", shadow).CornerRadius = UDim.new(0, 16)

local frame = Instance.new("Frame")
frame.Size = UDim2.fromOffset(300, 400)
frame.Position = UDim2.fromScale(0.75, 0.05)
frame.BackgroundColor3 = COL.bg
frame.BorderSizePixel = 0
frame.Active = true
frame.ZIndex = 2
frame.Parent = gui
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 16)

local gradient = Instance.new("UIGradient")
gradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, COL.bg),
    ColorSequenceKeypoint.new(1, COL.bgDark),
}
gradient.Rotation = 90
gradient.Parent = frame

local stroke = Instance.new("UIStroke")
stroke.Color = COL.stroke
stroke.Thickness = 1.5
stroke.Transparency = 0.2
stroke.Parent = frame

local padding = Instance.new("UIPadding")
padding.PaddingTop = UDim.new(0, 14)
padding.PaddingBottom = UDim.new(0, 14)
padding.PaddingLeft = UDim.new(0, 14)
padding.PaddingRight = UDim.new(0, 14)
padding.Parent = frame

local layout = Instance.new("UIListLayout")
layout.SortOrder = Enum.SortOrder.LayoutOrder
layout.Padding = UDim.new(0, 10)
layout.Parent = frame

local header = Instance.new("Frame")
header.Size = UDim2.new(1, 0, 0, 52)
header.BackgroundColor3 = COL.card
header.BorderSizePixel = 0
header.LayoutOrder = 1
header.ZIndex = 3
header.Parent = frame
Instance.new("UICorner", header).CornerRadius = UDim.new(0, 12)

local headerGradient = Instance.new("UIGradient")
headerGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, COL.card),
    ColorSequenceKeypoint.new(1, COL.bgDark),
}
headerGradient.Rotation = 15
headerGradient.Parent = header

local headerStroke = Instance.new("UIStroke")
headerStroke.Color = COL.stroke
headerStroke.Thickness = 1
headerStroke.Transparency = 0.4
headerStroke.Parent = header

local iconFrame = Instance.new("Frame")
iconFrame.Size = UDim2.fromOffset(36, 36)
iconFrame.Position = UDim2.fromOffset(10, 8)
iconFrame.BackgroundColor3 = COL.accent
iconFrame.BorderSizePixel = 0
iconFrame.ZIndex = 4
iconFrame.Parent = header
Instance.new("UICorner", iconFrame).CornerRadius = UDim.new(0, 10)

local iconLabel = Instance.new("TextLabel")
iconLabel.Size = UDim2.fromScale(1, 1)
iconLabel.BackgroundTransparency = 1
iconLabel.TextColor3 = COL.textLight
iconLabel.Font = Enum.Font.GothamBold
iconLabel.TextSize = 20
iconLabel.Text = "D"
iconLabel.ZIndex = 5
iconLabel.Parent = iconFrame

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -110, 0, 22)
title.Position = UDim2.fromOffset(54, 8)
title.BackgroundTransparency = 1
title.TextColor3 = COL.textDark
title.Font = Enum.Font.GothamBold
title.TextSize = 17
title.TextXAlignment = Enum.TextXAlignment.Left
title.Text = "Drey Hub"
title.ZIndex = 4
title.Parent = header

local subtitle = Instance.new("TextLabel")
subtitle.Size = UDim2.new(1, -110, 0, 14)
subtitle.Position = UDim2.fromOffset(54, 30)
subtitle.BackgroundTransparency = 1
subtitle.TextColor3 = COL.accentDark
subtitle.Font = Enum.Font.Gotham
subtitle.TextSize = 11
subtitle.TextXAlignment = Enum.TextXAlignment.Left
subtitle.Text = "Teletransporte rápido"
subtitle.ZIndex = 4
subtitle.Parent = header

local minBtn = Instance.new("TextButton")
minBtn.Size = UDim2.fromOffset(28, 28)
minBtn.Position = UDim2.new(1, -38, 0.5, -14)
minBtn.BackgroundColor3 = COL.accent
minBtn.TextColor3 = COL.textLight
minBtn.Font = Enum.Font.GothamBold
minBtn.TextSize = 16
minBtn.Text = "−"
minBtn.AutoButtonColor = false
minBtn.ZIndex = 5
minBtn.Parent = header
Instance.new("UICorner", minBtn).CornerRadius = UDim.new(1, 0)

minBtn.MouseEnter:Connect(function()
    TweenService:Create(minBtn, TweenInfo.new(0.18), {BackgroundColor3 = COL.accentDark}):Play()
end)
minBtn.MouseLeave:Connect(function()
    TweenService:Create(minBtn, TweenInfo.new(0.18), {BackgroundColor3 = COL.accent}):Play()
end)

makeDraggable(frame, header)
makeDraggable(shadow, header)

local content = Instance.new("Frame")
content.Size = UDim2.new(1, 0, 1, -62)
content.BackgroundTransparency = 1
content.LayoutOrder = 2
content.ZIndex = 3
content.Parent = frame

local contentLayout = Instance.new("UIListLayout")
contentLayout.SortOrder = Enum.SortOrder.LayoutOrder
contentLayout.Padding = UDim.new(0, 10)
contentLayout.Parent = content

local function createCoordCard(coord, index)
    local card = Instance.new("TextButton")
    card.Size = UDim2.new(1, 0, 0, 74)
    card.BackgroundColor3 = COL.card
    card.AutoButtonColor = false
    card.Text = ""
    card.LayoutOrder = index
    card.ZIndex = 4
    card.Parent = content
    Instance.new("UICorner", card).CornerRadius = UDim.new(0, 12)

    local cardStroke = Instance.new("UIStroke")
    cardStroke.Color = COL.stroke
    cardStroke.Thickness = 1
    cardStroke.Transparency = 0.3
    cardStroke.Parent = card

    local circle = Instance.new("Frame")
    circle.Size = UDim2.fromOffset(40, 40)
    circle.Position = UDim2.fromOffset(14, 17)
    circle.BackgroundColor3 = COL.accent
    circle.BorderSizePixel = 0
    circle.ZIndex = 5
    circle.Parent = card
    Instance.new("UICorner", circle).CornerRadius = UDim.new(1, 0)

    local circleIcon = Instance.new("TextLabel")
    circleIcon.Size = UDim2.fromScale(1, 1)
    circleIcon.BackgroundTransparency = 1
    circleIcon.TextColor3 = COL.textLight
    circleIcon.Font = Enum.Font.GothamBold
    circleIcon.TextSize = 18
    circleIcon.Text = (index == 1) and "🏠" or "🎯"
    circleIcon.ZIndex = 6
    circleIcon.Parent = circle

    local nameLabel = Instance.new("TextLabel")
    nameLabel.Size = UDim2.new(1, -80, 0, 22)
    nameLabel.Position = UDim2.fromOffset(66, 12)
    nameLabel.BackgroundTransparency = 1
    nameLabel.TextColor3 = COL.textDark
    nameLabel.Font = Enum.Font.GothamBold
    nameLabel.TextSize = 15
    nameLabel.TextXAlignment = Enum.TextXAlignment.Left
    nameLabel.Text = coord.name
    nameLabel.ZIndex = 5
    nameLabel.Parent = card

    local coordsLabel = Instance.new("TextLabel")
    coordsLabel.Size = UDim2.new(1, -80, 0, 18)
    coordsLabel.Position = UDim2.fromOffset(66, 36)
    coordsLabel.BackgroundTransparency = 1
    coordsLabel.TextColor3 = COL.accentDark
    coordsLabel.Font = Enum.Font.Code
    coordsLabel.TextSize = 12
    coordsLabel.TextXAlignment = Enum.TextXAlignment.Left
    coordsLabel.Text = string.format("(%.1f, %.1f, %.1f)", coord.pos.X, coord.pos.Y, coord.pos.Z)
    coordsLabel.ZIndex = 5
    coordsLabel.Parent = card

    local arrow = Instance.new("TextLabel")
    arrow.Size = UDim2.fromOffset(28, 28)
    arrow.Position = UDim2.new(1, -40, 0.5, -14)
    arrow.BackgroundTransparency = 1
    arrow.TextColor3 = COL.accent
    arrow.Font = Enum.Font.GothamBold
    arrow.TextSize = 20
    arrow.Text = "›"
    arrow.ZIndex = 5
    arrow.Parent = card

    card.MouseEnter:Connect(function()
        TweenService:Create(card, TweenInfo.new(0.18), {BackgroundColor3 = COL.cardHover}):Play()
        TweenService:Create(arrow, TweenInfo.new(0.18), {TextColor3 = COL.accentDark}):Play()
    end)
    card.MouseLeave:Connect(function()
        TweenService:Create(card, TweenInfo.new(0.18), {BackgroundColor3 = COL.card}):Play()
        TweenService:Create(arrow, TweenInfo.new(0.18), {TextColor3 = COL.accent}):Play()
    end)

    card.MouseButton1Click:Connect(function()
        local char = player.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            char.HumanoidRootPart.CFrame = CFrame.new(coord.pos + Vector3.new(0, 3, 0))
            TweenService:Create(card, TweenInfo.new(0.15), {BackgroundColor3 = COL.green}):Play()
            task.wait(0.35)
            TweenService:Create(card, TweenInfo.new(0.3), {BackgroundColor3 = COL.card}):Play()
        end
    end)

    return card
end

for i, coord in ipairs(coordsList) do
    createCoordCard(coord, i)
end

local footer = Instance.new("Frame")
footer.Size = UDim2.new(1, 0, 0, 40)
footer.BackgroundColor3 = COL.bgDark
footer.BorderSizePixel = 0
footer.LayoutOrder = 10
footer.ZIndex = 3
footer.Parent = content
Instance.new("UICorner", footer).CornerRadius = UDim.new(0, 10)

local footerStroke = Instance.new("UIStroke")
footerStroke.Color = COL.stroke
footerStroke.Thickness = 1
footerStroke.Transparency = 0.5
footerStroke.Parent = footer

local footerText = Instance.new("TextLabel")
footerText.Size = UDim2.new(1, -20, 0, 16)
footerText.Position = UDim2.fromOffset(10, 5)
footerText.BackgroundTransparency = 1
footerText.TextColor3 = COL.textDark
footerText.Font = Enum.Font.GothamBold
footerText.TextSize = 11
footerText.TextXAlignment = Enum.TextXAlignment.Left
footerText.Text = "⚡ Auto-agarrar activo"
footerText.ZIndex = 4
footerText.Parent = footer

local footerSub = Instance.new("TextLabel")
footerSub.Size = UDim2.new(1, -20, 0, 14)
footerSub.Position = UDim2.fromOffset(10, 21)
footerSub.BackgroundTransparency = 1
footerSub.TextColor3 = COL.accentDark
footerSub.Font = Enum.Font.Gotham
footerSub.TextSize = 10
footerSub.TextXAlignment = Enum.TextXAlignment.Left
footerSub.Text = "Los objetos se agarran al instante"
footerSub.ZIndex = 4
footerSub.Parent = footer

local minimized = false
local originalSize = frame.Size
local minimizedSize = UDim2.fromOffset(300, 62)

minBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    if minimized then
        TweenService:Create(frame, TweenInfo.new(0.28, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            Size = minimizedSize
        }):Play()
        TweenService:Create(shadow, TweenInfo.new(0.28, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            Size = minimizedSize
        }):Play()
        content.Visible = false
        minBtn.Text = "+"
        minBtn.BackgroundColor3 = COL.green
    else
        TweenService:Create(frame, TweenInfo.new(0.28, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            Size = originalSize
        }):Play()
        TweenService:Create(shadow, TweenInfo.new(0.28, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            Size = originalSize
        }):Play()
        content.Visible = true
        minBtn.Text = "−"
        minBtn.BackgroundColor3 = COL.accent
    end
end)

frame:GetPropertyChangedSignal("Position"):Connect(function()
    shadow.Position = frame.Position + UDim2.fromOffset(5, 6)
end)
