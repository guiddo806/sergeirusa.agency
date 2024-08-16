local function CreateFilledBoxESP()
    local FilledBoxESP = {}

    function FilledBoxESP.CreateFilledBox(Player)
        local FilledBox = Drawing.new("Square")
        FilledBox.Visible = true
        FilledBox.Color = Color3.fromRGB(128, 128, 128)
        FilledBox.Filled = true
        FilledBox.Transparency = 0.20
        FilledBox.Thickness = 0

        local Updater
        local function UpdateFilledBox()
            if Player and Player:IsA("Model") and Player:FindFirstChild("HumanoidRootPart") then
                local HumanoidRootPart = Player.HumanoidRootPart
                local Camera = workspace.CurrentCamera

                local Target2dPosition, IsVisible = Camera:WorldToViewportPoint(HumanoidRootPart.Position)
                local scale_factor = 1 / (Target2dPosition.Z * math.tan(math.rad(Camera.FieldOfView * 0.5)) * 2) * 100
                local width, height = math.floor(18 * scale_factor * 3), math.floor(28 * scale_factor * 3)

                FilledBox.Visible = IsVisible
                FilledBox.Size = Vector2.new(width, height)
                FilledBox.Position = Vector2.new(Target2dPosition.X - FilledBox.Size.X / 2, Target2dPosition.Y - FilledBox.Size.Y / 2)
            else
                FilledBox.Visible = false
                if not Player then
                    FilledBox:Remove()
                    Updater:Disconnect()
                end
            end
        end

        Updater = game:GetService("RunService").RenderStepped:Connect(UpdateFilledBox)
        return FilledBox
    end

    function FilledBoxESP.EnableFilledBoxESP()
        for _, Player in pairs(game:GetService("Workspace"):GetChildren()) do
            if Player:IsA("Model") and Player:FindFirstChild("HumanoidRootPart") then
                FilledBoxESP.CreateFilledBox(Player)
            end
        end
    end

    return FilledBoxESP
end

local FilledESP = CreateFilledBoxESP()
FilledESP.EnableFilledBoxESP()
