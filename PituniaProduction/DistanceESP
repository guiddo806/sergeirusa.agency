local function CreateDistanceLabelESP()
    local DistanceLabelESP = {}
    local DistanceLabels = {} 

    function DistanceLabelESP.CreateDistanceLabel(Player)
        local DistanceLabel = Drawing.new("Text")
        DistanceLabel.Visible = false
        DistanceLabel.Size = 12
        DistanceLabel.Color = Color3.fromRGB(255, 255, 255)
        DistanceLabel.Center = true
        DistanceLabel.Outline = false

        local function UpdateDistanceLabel()
            if Player and Player:IsA("Model") and Player:FindFirstChild("HumanoidRootPart") and Player:FindFirstChild("Head") then
                local HumanoidRootPart = Player.HumanoidRootPart
                local Camera = workspace.CurrentCamera

                local Distance = (Camera.CFrame.p - HumanoidRootPart.Position).magnitude
                local DistanceText = string.format("[ %d ]", math.floor(Distance))

                local Target2dPosition, IsVisible = Camera:WorldToViewportPoint(HumanoidRootPart.Position)
                local scale_factor = 1 / (Target2dPosition.Z * math.tan(math.rad(Camera.FieldOfView * 0.5)) * 2) * 100

                DistanceLabel.Visible = IsVisible
                DistanceLabel.Position = Vector2.new(Target2dPosition.X, Target2dPosition.Y + 10) -- Исправлено положение
                DistanceLabel.Text = DistanceText
            else
                DistanceLabel.Visible = false
                if not Player then 
                    DistanceLabel:Remove()
                    if Updater then
                        Updater:Disconnect()
                    end
                end
            end
        end

        local Updater = game:GetService("RunService").RenderStepped:Connect(UpdateDistanceLabel)
        return DistanceLabel
    end

    function DistanceLabelESP.Enable()
        for _, Player in pairs(game:GetService("Workspace"):GetChildren()) do
            if Player:IsA("Model") and Player:FindFirstChild("HumanoidRootPart") and Player:FindFirstChild("Head") then
                local DistanceLabel = DistanceLabelESP.CreateDistanceLabel(Player)
                table.insert(DistanceLabels, { DistanceLabel = DistanceLabel })
            end
        end
    end

    game.Workspace.DescendantAdded:Connect(function(i)
        if i:IsA("Model") and i:FindFirstChild("HumanoidRootPart") and i:FindFirstChild("Head") then
            local DistanceLabel = DistanceLabelESP.CreateDistanceLabel(i)
            table.insert(DistanceLabels, { DistanceLabel = DistanceLabel })
        end
    end)

    function DistanceLabelESP.Disable()
        for _, LabelData in pairs(DistanceLabels) do
            LabelData.DistanceLabel:Remove()
        end
        DistanceLabels = {}
    end

    return DistanceLabelESP
end

local ESP = CreateDistanceLabelESP()
ESP.Enable()
