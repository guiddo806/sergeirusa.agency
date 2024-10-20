local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/guiddo806/sergeirusa.agency/refs/heads/main/UI/ModdedLinoria.lua"))()
local ThemeManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/addons/ThemeManager.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/addons/SaveManager.lua"))()

local Window = Library:CreateWindow({
    Title = 'feofelact',
    Center = true, 
    AutoShow = true,
    TabPadding = 6,
})

local Tabs = {
    Combat = Window:AddTab('Combat'),
    Visuals = Window:AddTab('Visuals'),
    ['UI Settings'] = Window:AddTab('UI Settings'),
}

local ESPSection = Tabs.Visuals:AddLeftGroupbox('Players')

local espEnabled = false 
local showDistance = false 
local currentESPDistance = 1500 

ESPSection:AddToggle('EnableBoxESP', {
    Text = 'Box',
    Default = espEnabled,
    Tooltip = 'Toggle the Box ESP',
}):OnChanged(function(state)
    espEnabled = state
end)

ESPSection:AddToggle('ShowDistance', {
    Text = 'Distance',
    Default = showDistance,
    Tooltip = 'Toggle the distance display above the box',
}):OnChanged(function(state)
    showDistance = state
end)

ESPSection:AddSlider('ESPDistance', {
    Text = 'Radius',
    Min = 750,
    Max = 2000,
    Default = 1500,
    Rounding = 0,
    Tooltip = 'Adjust ESP display distance',
}):OnChanged(function(value)
    currentESPDistance = value
end)

local distanceOffset = Vector2.new(0, -13)

local function CreateBox(Player)
    local Box = Drawing.new("Square")
    Box.Visible = false 
    Box.Color = Color3.fromRGB(255, 255, 255)
    Box.Filled = false
    Box.Transparency = 1
    Box.Thickness = 1

    local DistanceText = Drawing.new("Text")
    DistanceText.Visible = false 
    DistanceText.Color = Color3.fromRGB(255, 255, 255) 
    DistanceText.Size = 12
    DistanceText.Center = true
    DistanceText.Outline = true
    DistanceText.OutlineColor = Color3.fromRGB(0, 0, 0) 
    DistanceText.Font = Drawing.Fonts.UI 

    local Updater
    local function UpdateBox()
        local HumanoidRootPart = Player:FindFirstChild("HumanoidRootPart") or Player:FindFirstChild("UpperTorso")
        if HumanoidRootPart then
            local Camera = workspace.CurrentCamera
            local Target2dPosition, IsVisible = Camera:WorldToViewportPoint(HumanoidRootPart.Position)

            if not IsVisible then
                Box.Visible = false
                DistanceText.Visible = false
                return
            end

            local Distance = (Camera.CFrame.p - HumanoidRootPart.Position).Magnitude
            if Distance > currentESPDistance then
                Box.Visible = false
                DistanceText.Visible = false
                return
            end

            local scale_factor = 1 / (Target2dPosition.Z * math.tan(math.rad(Camera.FieldOfView * 0.5)) * 2) * 100
            local width, height = math.floor(18 * scale_factor * 3), math.floor(28 * scale_factor * 3)

            Box.Visible = espEnabled and IsVisible
            Box.Size = Vector2.new(width, height)
            Box.Position = Vector2.new(Target2dPosition.X - Box.Size.X / 2, Target2dPosition.Y - Box.Size.Y / 2)

            if showDistance and espEnabled then
                DistanceText.Text = string.format("%ds", math.floor(Distance)) 
                DistanceText.Visible = IsVisible
                DistanceText.Position = Box.Position + Vector2.new(Box.Size.X / 2, distanceOffset.Y)  
            else
                DistanceText.Visible = false
            end
        else
            Box.Visible = false
            DistanceText.Visible = false
            if not Player then
                Box:Remove()
                DistanceText:Remove()
                Updater:Disconnect()
            end
        end
    end

    Updater = RunService.RenderStepped:Connect(UpdateBox)
    return Box
end

local function EnableBoxESP()
    for _, Player in pairs(Workspace:GetChildren()) do
        if Player:IsA("Model") and (Player:FindFirstChild("HumanoidRootPart") or Player:FindFirstChild("UpperTorso")) then
            CreateBox(Player)
        end
    end
end

Workspace.ChildAdded:Connect(function(Player)
    if Player:IsA("Model") and (Player:FindFirstChild("HumanoidRootPart") or Player:FindFirstChild("UpperTorso")) then
        CreateBox(Player)
    end
end)

EnableBoxESP()

Library:SetWatermarkVisibility(true)

local FrameTimer = tick()
local FrameCounter = 0;
local FPS = 60;

local WatermarkConnection = game:GetService('RunService').RenderStepped:Connect(function()
    FrameCounter += 1;

    if (tick() - FrameTimer) >= 1 then
        FPS = FrameCounter;
        FrameTimer = tick();
        FrameCounter = 0;
    end;

    Library:SetWatermark(('feafelact  -  trident survival  | %s fps | %s ms'):format(
        math.floor(FPS),
        math.floor(game:GetService('Stats').Network.ServerStatsItem['Data Ping']:GetValue())
    ));
end);

Library:OnUnload(function()
    WatermarkConnection:Disconnect()

    print('Unloaded!')
    Library.Unloaded = true
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
