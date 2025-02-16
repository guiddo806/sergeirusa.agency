local function CreateBoxESP()
    local BoxESP = {}

    function BoxESP.CreateBox(Player)
        local Box = Drawing.new("Square")
        Box.Visible = true
        Box.Color = Color3.fromRGB(255, 255, 255)
        Box.Filled = false
        Box.Transparency = 1
        Box.Thickness = 1

        local Updater
        local function UpdateBox()
            if Player and Player:IsA("Model") and Player:FindFirstChild("HumanoidRootPart") then
                local HumanoidRootPart = Player.HumanoidRootPart
                local Camera = workspace.CurrentCamera

                local Target2dPosition, IsVisible = Camera:WorldToViewportPoint(HumanoidRootPart.Position)
                local scale_factor = 1 / (Target2dPosition.Z * math.tan(math.rad(Camera.FieldOfView * 0.5)) * 2) * 100
                local width, height = math.floor(18 * scale_factor * 3), math.floor(28 * scale_factor * 3)

                Box.Visible = IsVisible
                Box.Size = Vector2.new(width, height)
                Box.Position = Vector2.new(Target2dPosition.X - Box.Size.X / 2, Target2dPosition.Y - Box.Size.Y / 2)
            else
                Box.Visible = false
                if not Player then
                    Box:Remove()
                    Updater:Disconnect()
                end
            end
        end

        Updater = game:GetService("RunService").RenderStepped:Connect(UpdateBox)
        return Box
    end

    function BoxESP.EnableBoxESP()
        for _, Player in pairs(game:GetService("Workspace"):GetChildren()) do
            if Player:IsA("Model") and Player:FindFirstChild("HumanoidRootPart") then
                BoxESP.CreateBox(Player)
            end
        end
    end

    return BoxESP
end

local ESP = CreateBoxESP()
ESP.EnableBoxESP()
