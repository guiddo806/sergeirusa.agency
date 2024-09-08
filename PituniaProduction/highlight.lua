local function CreateHighlightESP()
    local HighlightESP = {}

    function HighlightESP.CreateHighlight(Player)
        if Player:FindFirstChild("HumanoidRootPart") then
            local highlight = Instance.new("Highlight")
            highlight.Parent = game:GetService("CoreGui")
            highlight.Adornee = Player
            highlight.FillColor = Color3.fromRGB(240, 230, 140)  
            highlight.FillTransparency = 0.5
            highlight.OutlineTransparency = 1
            highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop

            local Updater
            local function UpdateHighlight()
                if isHighlightEnabled and Player and Player:IsA("Model") and Player:FindFirstChild("HumanoidRootPart") then
                    local isVisible = Player:FindFirstChildOfClass("Humanoid").Health > 0
                    highlight.Adornee = Player
                    highlight.Enabled = true
                    highlight.FillColor = isVisible and Color3.fromRGB(240, 230, 140) or Color3.fromRGB(240, 230, 140)
                else
                    highlight.Enabled = false
                    if not Player then
                        highlight:Destroy()
                        if Updater then
                            Updater:Disconnect()
                        end
                    end
                end
            end

            Updater = runService.RenderStepped:Connect(UpdateHighlight)
            return highlight
        end
    end

    function HighlightESP.EnableHighlightESP()
        isHighlightEnabled = true
        for _, Player in pairs(Workspace:GetChildren()) do
            if Player:IsA("Model") and Player:FindFirstChild("HumanoidRootPart") then
                HighlightESP.CreateHighlight(Player)
            end
        end
    end

    function HighlightESP.DisableHighlightESP()
        isHighlightEnabled = false
        for _, highlight in pairs(game:GetService("CoreGui"):GetChildren()) do
            if highlight:IsA("Highlight") then
                highlight:Destroy()
            end
        end
    end

    Workspace.ChildAdded:Connect(function(Player)
        if Player:IsA("Model") and Player:FindFirstChild("HumanoidRootPart") then
            HighlightESP.CreateHighlight(Player)
        end
    end)

    return HighlightESP
end

local HighlightESP = CreateHighlightESP()
