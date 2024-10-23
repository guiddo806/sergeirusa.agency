local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/guiddo806/sergeirusa.agency/refs/heads/main/UI/ModdedLinoria.lua"))()
local ThemeManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/addons/ThemeManager.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/addons/SaveManager.lua"))()

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

local Window = Library:CreateWindow({
    Title = "feofelact - csgo", 
    Center = true, 
    AutoShow = true,
    TabPadding = 6,
})

local Tabs = {
    Main = Window:AddTab('Combat'),
    Visual = Window:AddTab('Visual'),
    Misc = Window:AddTab('Misc'),
    ['UI Settings'] = Window:AddTab('UI Settings'),
}

local AimlockTab = Tabs.Main:AddLeftGroupbox('Aimbot')
local VisualTab = Tabs.Visual:AddLeftGroupbox('Local Players')

AimlockTab:AddToggle('EnableAimlock', {
    Text = 'Enable Aimbot',
    Default = false,
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
    Callback = function(value)
        AimlockSettings.FOV = value
        UpdateVisuals()
    end
})

AimlockTab:AddToggle('ShowFOVCircle', {
    Text = 'Show FOV',
    Default = false,
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
    Callback = function(value)
        AimlockSettings.Smoothness = value
    end
})

AimlockTab:AddToggle('UseVisibilityCheck', {
    Text = 'Use Visibility Check',
    Default = false,
    Callback = function(state)
        AimlockSettings.UseVisibilityCheck = state
    end
})

AimlockTab:AddToggle('EnableTeamCheck', {
    Text = 'Enable Team Check',
    Default = false,
    Callback = function(state)
        AimlockSettings.TeamCheck = state
    end
})

VisualTab:AddToggle('EnableHighlightESP', {
    Text = 'Enable Highlight ESP',
    Default = false,
    Callback = function(state)
        if state then
            HighlightESP.EnableHighlightESP()
        else
            HighlightESP.DisableHighlightESP()
        end
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

local MenuGroup = Tabs['UI Settings']:AddLeftGroupbox('Menu')

MenuGroup:AddButton('Unload', function() Library:Unload() end)
MenuGroup:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', { Default = 'RightShift', NoUI = true, Text = 'Menu keybind' })

Library.ToggleKeybind = Options.MenuKeybind 

SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({ 'MenuKeybind' })
SaveManager:IgnoreThemeSettings()
SaveManager:SetFolder('MyScriptHub/specific-game')
SaveManager:BuildConfigSection(Tabs['UI Settings'])
SaveManager:LoadAutoloadConfig()
ThemeManager:ApplyToTab(Tabs['UI Settings'])
ThemeManager:SetFolder('MyScriptHub')
ThemeManager:SetLibrary(Library)
ThemeManager:ApplyToTab(Window)

Library:OnUnload(function()
    print('Script unloaded.')
end)
