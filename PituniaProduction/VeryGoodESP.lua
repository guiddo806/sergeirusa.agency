local function CreateBoxESP()
    local BoxESP = {}

    function BoxESP.Create(Player)
        local Box = Drawing.new("Square")
        Box.Visible = true
        Box.Color = Color3.fromRGB(128, 0, 128) 
        Box.Filled = false
        Box.Transparency = 0.50
        Box.Thickness = 2

        local FilledBox = Drawing.new("Square")
        FilledBox.Visible = true
        FilledBox.Color = Color3.fromRGB(128, 128, 128) 
        FilledBox.Filled = true
        FilledBox.Transparency = 0.15
        FilledBox.Thickness = 0

        local DistanceLabel = Drawing.new("Text")
        DistanceLabel.Visible = false
        DistanceLabel.Size = 14
        DistanceLabel.Color = Color3.fromRGB(128, 0, 128) 
        DistanceLabel.Center = true
        DistanceLabel.Outline = false

        local Lines = {}
        for i = 1, 14 do
            local line = Drawing.new("Line")
            line.Visible = false
            line.Color = Color3.fromRGB(255, 255, 255)
            line.Thickness = 2
            line.Transparency = 0.50
            table.insert(Lines, line)
        end

        local Updater

        local function UpdateBox()
            if Player and Player:IsA("Model") and Player:FindFirstChild("HumanoidRootPart") and Player:FindFirstChild("Head") then
                local HumanoidRootPart = Player.HumanoidRootPart
                local Head = Player.Head
                local Camera = workspace.CurrentCamera

                local Distance = (Camera.CFrame.p - HumanoidRootPart.Position).magnitude
                local DistanceText = string.format("[ %.d ] s", Distance)

                local Target2dPosition, IsVisible = Camera:WorldToViewportPoint(HumanoidRootPart.Position)
                local scale_factor = 1 / (Target2dPosition.Z * math.tan(math.rad(Camera.FieldOfView * 0.5)) * 2) * 100
                local width, height = math.floor(18 * scale_factor * 3), math.floor(28 * scale_factor * 3) 

                Box.Visible = IsVisible
                Box.Size = Vector2.new(width, height)
                Box.Position = Vector2.new(Target2dPosition.X - Box.Size.X / 2, Target2dPosition.Y - Box.Size.Y / 2)

                FilledBox.Visible = IsVisible
                FilledBox.Size = Box.Size
                FilledBox.Position = Box.Position

                DistanceLabel.Visible = IsVisible
                DistanceLabel.Position = Vector2.new(Target2dPosition.X, Target2dPosition.Y + Box.Size.Y / 2 + 10)
                DistanceLabel.Text = DistanceText

                local parts = {
                    Head = Player:FindFirstChild("Head"),
                    Torso = Player:FindFirstChild("UpperTorso") or Player:FindFirstChild("Torso"),
                    LeftArm = Player:FindFirstChild("LeftUpperArm"),
                    RightArm = Player:FindFirstChild("RightUpperArm"),
                    LeftLeg = Player:FindFirstChild("LeftUpperLeg"),
                    RightLeg = Player:FindFirstChild("RightUpperLeg"),
                    LeftLowerArm = Player:FindFirstChild("LeftLowerArm"),
                    RightLowerArm = Player:FindFirstChild("RightLowerArm"),
                    LeftLowerLeg = Player:FindFirstChild("LeftLowerLeg"),
                    RightLowerLeg = Player:FindFirstChild("RightLowerLeg"),
                    LeftHand = Player:FindFirstChild("LeftHand"),
                    RightHand = Player:FindFirstChild("RightHand"),
                    LeftFoot = Player:FindFirstChild("LeftFoot"),
                    RightFoot = Player:FindFirstChild("RightFoot")
                }

                local skeleton_connections = {
                    {parts.Head, parts.Torso},
                    {parts.Torso, parts.LeftArm},
                    {parts.Torso, parts.RightArm},
                    {parts.Torso, parts.LeftLeg},
                    {parts.Torso, parts.RightLeg},
                    {parts.LeftArm, parts.LeftLowerArm},
                    {parts.RightArm, parts.RightLowerArm},
                    {parts.LeftLowerArm, parts.LeftHand},
                    {parts.RightLowerArm, parts.RightHand},
                    {parts.LeftLeg, parts.LeftLowerLeg},
                    {parts.RightLeg, parts.RightLowerLeg},
                    {parts.LeftLowerLeg, parts.LeftFoot},
                    {parts.RightLowerLeg, parts.RightFoot},
                }

                for i, connection in pairs(skeleton_connections) do
                    local part0, part1 = connection[1], connection[2]
                    if part0 and part1 then
                        local pos0, visible0 = Camera:WorldToViewportPoint(part0.Position)
                        local pos1, visible1 = Camera:WorldToViewportPoint(part1.Position)
                        Lines[i].Visible = IsVisible and visible0 and visible1
                        Lines[i].From = Vector2.new(pos0.X, pos0.Y)
                        Lines[i].To = Vector2.new(pos1.X, pos1.Y)
                    else
                        Lines[i].Visible = false
                    end
                end
            else
                Box.Visible = false
                FilledBox.Visible = false
                DistanceLabel.Visible = false
                for _, line in ipairs(Lines) do
                    line.Visible = false
                end
                if not Player then
                    Box:Remove()
                    FilledBox:Remove()
                    DistanceLabel:Remove()
                    for _, line in ipairs(Lines) do
                        line:Remove()
                    end
                    Updater:Disconnect()
                end
            end
        end

        Updater = game:GetService("RunService").RenderStepped:Connect(UpdateBox)

        return Box, FilledBox, DistanceLabel, Lines
    end

    local Boxes = {}

    function BoxESP.Enable()
        for _, Player in pairs(game:GetService("Workspace"):GetChildren()) do
            if Player:IsA("Model") and Player:FindFirstChild("HumanoidRootPart") and Player:FindFirstChild("Head") then
                local Box, FilledBox, DistanceLabel, Lines = BoxESP.Create(Player)
                table.insert(Boxes, {Box = Box, FilledBox = FilledBox, DistanceLabel = DistanceLabel, Lines = Lines})
            end
        end
    end

    game.Workspace.DescendantAdded:Connect(function(i)
        if i:IsA("Model") and i:FindFirstChild("HumanoidRootPart") and i:FindFirstChild("Head") then
            local Box, FilledBox, DistanceLabel, Lines = BoxESP.Create(i)
            table.insert(Boxes, {Box = Box, FilledBox = FilledBox, DistanceLabel = DistanceLabel, Lines = Lines})
        end
    end)

    function BoxESP.Disable()
        for _, BoxData in pairs(Boxes) do
            BoxData.Box:Remove()
            BoxData.FilledBox:Remove()
            BoxData.DistanceLabel:Remove()
            for _, line in ipairs(BoxData.Lines) do
                line:Remove()
            end
        end
        Boxes = {}
    end

    return BoxESP
end

local ESP = CreateBoxESP()

local Toggle = MiscTab:CreateToggle({
    Name = "BoxESP",
    CurrentValue = false,
    Flag = "ToggleBoxESP",
    Callback = function(Value)
        if Value then
            ESP.Enable()  
        else
            ESP.Disable() 
        end
    end,
})