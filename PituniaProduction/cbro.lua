local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/guiddo806/sergeirusa.agency/refs/heads/main/UI/moddedLinoria.lua"))()

local AimlockSettings = {
    Enabled = false,
    FOV = 150,
    ShowFOV = false,
    Smoothness = 1, 
    UseVisibilityCheck = false, 
    TeamCheck = false, 
    HoldingLMB = false
}

local FOVCircle = Drawing.new("Circle")
FOVCircle.Thickness = 1
FOVCircle.NumSides = 50
FOVCircle.Radius = AimlockSettings.FOV
FOVCircle.Color = Color3.fromRGB(255, 255, 255) 
FOVCircle.Transparency = 1
FOVCircle.Filled = false
FOVCircle.Visible = false 

local function ToggleAimlock(state)
    AimlockSettings.HoldingLMB = state
end

local function UpdateVisuals()
    FOVCircle.Radius = AimlockSettings.FOV
    FOVCircle.Visible = AimlockSettings.ShowFOV
end

local function IsPlayerVisible(player)
    if player and player.Character and player.Character:FindFirstChild("Head") then
        local head = player.Character.Head
        local camera = game:GetService("Workspace").CurrentCamera
        local ray = Ray.new(camera.CFrame.Position, (head.Position - camera.CFrame.Position).unit * 500)
        local part = game:GetService("Workspace"):FindPartOnRay(ray, game:GetService("Players").LocalPlayer.Character, false, true)
        return part and part:IsDescendantOf(player.Character)
    end
    return false
end

local function GetClosestPlayer()
    local closestPlayer = nil
    local shortestDistance = AimlockSettings.FOV

    for _, player in pairs(game:GetService("Players"):GetPlayers()) do
        if player ~= game:GetService("Players").LocalPlayer then
            if not AimlockSettings.TeamCheck or (player.Team ~= game:GetService("Players").LocalPlayer.Team) then
                if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                    local rootPart = player.Character.HumanoidRootPart
                    local screenPos, onScreen = game:GetService("Workspace").CurrentCamera:WorldToViewportPoint(rootPart.Position)

                    if onScreen then
                        local mousePos = game:GetService("UserInputService"):GetMouseLocation()
                        local distance = (Vector2.new(screenPos.X, screenPos.Y) - mousePos).Magnitude

                        if AimlockSettings.UseVisibilityCheck and IsPlayerVisible(player) or not AimlockSettings.UseVisibilityCheck then
                            if distance < shortestDistance then
                                closestPlayer = player
                                shortestDistance = distance
                            end
                        end
                    end
                end
            end
        end
    end

    return closestPlayer
end

local function AimAt(player)
    if player and player.Character and player.Character:FindFirstChild("Head") then
        local head = player.Character.Head
        local camera = game:GetService("Workspace").CurrentCamera
        local targetPosition = head.Position

        if AimlockSettings.HoldingLMB then
            local currentCFrame = camera.CFrame
            local targetCFrame = CFrame.new(currentCFrame.Position, targetPosition)

            camera.CFrame = currentCFrame:Lerp(targetCFrame, AimlockSettings.Smoothness)
        end
    end
end

game:GetService("RunService").RenderStepped:Connect(function()
    local mousePos = game:GetService("UserInputService"):GetMouseLocation()
    FOVCircle.Position = mousePos

    if AimlockSettings.Enabled and AimlockSettings.HoldingLMB then
        local targetPlayer = GetClosestPlayer()
        if targetPlayer then
            AimAt(targetPlayer)
        end
    end
end)

local Window = Library:CreateWindow({
    Title = "feofelact - csgo", 
    Center = true, 
    AutoShow = true,
})

local Tabs = {
    Main = Window:AddTab('Combat'),
    Visual = Window:AddTab('Visual'),
    Misc = Window:AddTab('Misc'),
}

local AimlockTab = Tabs.Main:AddLeftGroupbox('Aimbot')
local VisualTab = Tabs.Visual:AddLeftGroupbox('Local Players')

AimlockTab:AddToggle('EnableAimlock', {
    Text = 'Enable Aimbot',
    Default = false,
    Tooltip = 'Включить или выключить Aimlock',
    Callback = function(state)
        AimlockSettings.Enabled = state
    end
})

AimlockTab:AddSlider('FOVRadius', {
    Text = 'FOV Radius',
    Default = 150,
    Min = 50,
    Max = 300,
    Rounding = 0,
    Tooltip = 'Установить радиус FOV',
    Callback = function(value)
        AimlockSettings.FOV = value
        UpdateVisuals()
    end
})

AimlockTab:AddToggle('ShowFOVCircle', {
    Text = 'Show FOV',
    Default = false,
    Tooltip = 'Отобразить круг FOV',
    Callback = function(state)
        AimlockSettings.ShowFOV = state
        UpdateVisuals()
    end
})

AimlockTab:AddSlider('Smoothness', {
    Text = 'Smoothness',
    Default = 1,
    Min = 0.1,
    Max = 1,
    Rounding = 1,
    Tooltip = 'Настроить плавность наведения',
    Callback = function(value)
        AimlockSettings.Smoothness = value
    end
})

AimlockTab:AddToggle('UseVisibilityCheck', {
    Text = 'Use Visibility Check',
    Default = false,
    Tooltip = 'Включить или выключить проверку видимости',
    Callback = function(state)
        AimlockSettings.UseVisibilityCheck = state
    end
})

AimlockTab:AddToggle('EnableTeamCheck', {
    Text = 'Enable Team Check',
    Default = false,
    Tooltip = 'Проверять ли команду перед прицеливанием',
    Callback = function(state)
        AimlockSettings.TeamCheck = state
    end
})

game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed then
        if input.UserInputType == Enum.UserInputType.MouseButton1 and AimlockSettings.Enabled then
            ToggleAimlock(true)
        end
    end
end)

game:GetService("UserInputService").InputEnded:Connect(function(input, gameProcessed)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        ToggleAimlock(false)
    end
end)

Library:OnUnload(function()
    print('Script unloaded.')
end)

Library:SetWatermarkVisibility(true)
Library:SetWatermark('feofelact - csgo - Linoria Edition')
