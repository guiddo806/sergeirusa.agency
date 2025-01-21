local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/guiddo806/sergeirusa.agency/refs/heads/main/UI/ModdedLinoria.lua"))()
local ThemeManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/addons/ThemeManager.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/addons/SaveManager.lua"))()

local Window = Library:CreateWindow({
    Title = 'feofelact - Trident Survival V4',
    Center = true, 
    AutoShow = true,
    TabPadding = 6,
})

local Tabs = {
    Combat = Window:AddTab('Combat'),
    Visuals = Window:AddTab('Visuals'),
    Misc = Window:AddTab('Misc'),
    ['UI Settings'] = Window:AddTab('UI Settings'),
}

local HitboxSection = Tabs.Combat:AddLeftGroupbox('Hitboxes')
local ESPSection = Tabs.Visuals:AddLeftGroupbox('Players')

if (not _G.Flags) then
    _G.Flags = {
        HitboxExpander = {
            Size = 10;
            Enabled = false;
            Transparency = 0.7; 
            Part = "Torso"; 
        };
    };
end

local espEnabled = false 
local showDistance = false 
local currentESPDistance = 1500 
--fuck tooltip
ESPSection:AddToggle('EnableBoxESP', {
    Text = 'CornerBox',
    Default = espEnabled,
    Tooltip = 'Toggle the Box ESP',
}):OnChanged(function(state)
    espEnabled = state
end)

ESPSection:AddToggle('ShowDistance', {
    Text = 'Distance',
    Default = showDistance,
}):OnChanged(function(state)
    showDistance = state
end)

ESPSection:AddSlider('ESPDistance', {
    Text = 'Radius',
    Min = 100,
    Max = 5000,
    Default = 1500,
    Rounding = 0,
}):OnChanged(function(value)
    currentESPDistance = value
end)

local distanceOffset = Vector2.new(0, -13)

local function CreateBox(Player)
    --main corner
    local TopLeftLineH = Drawing.new("Line")
    local TopLeftLineV = Drawing.new("Line")
    local TopRightLineH = Drawing.new("Line")
    local TopRightLineV = Drawing.new("Line")
    local BottomLeftLineH = Drawing.new("Line")
    local BottomLeftLineV = Drawing.new("Line")
    local BottomRightLineH = Drawing.new("Line")
    local BottomRightLineV = Drawing.new("Line")
    --outline
    local OutlineTopLeftLineH = Drawing.new("Line")
    local OutlineTopLeftLineV = Drawing.new("Line")
    local OutlineTopRightLineH = Drawing.new("Line")
    local OutlineTopRightLineV = Drawing.new("Line")
    local OutlineBottomLeftLineH = Drawing.new("Line")
    local OutlineBottomLeftLineV = Drawing.new("Line")
    local OutlineBottomRightLineH = Drawing.new("Line")
    local OutlineBottomRightLineV = Drawing.new("Line")

    local lines = {TopLeftLineH, TopLeftLineV, TopRightLineH, TopRightLineV, BottomLeftLineH, BottomLeftLineV, BottomRightLineH, BottomRightLineV}
    local outlines = {OutlineTopLeftLineH, OutlineTopLeftLineV, OutlineTopRightLineH, OutlineTopRightLineV, OutlineBottomLeftLineH, OutlineBottomLeftLineV, OutlineBottomRightLineH, OutlineBottomRightLineV}
    --main line settings
    for _, line in pairs(lines) do
        line.Visible = false
        line.Color = Color3.fromRGB(0, 0, 0)
        line.Thickness = 4
    end
    --outline settings
    for _, outline in pairs(outlines) do
        outline.Visible = false
        outline.Color = Color3.fromRGB(255, 255, 255)
        outline.Thickness = 2 
    end
    --distance settings
    local DistanceText = Drawing.new("Text")
    DistanceText.Visible = false
    DistanceText.Color = Color3.fromRGB(255,99,71)
    DistanceText.Size = 12
    DistanceText.Center = true
    DistanceText.Outline = true
    DistanceText.OutlineColor = Color3.fromRGB(0, 0, 0)
    DistanceText.Font = Drawing.Fonts.UI

    local function UpdateBox()
        local HumanoidRootPart = Player:FindFirstChild("HumanoidRootPart") or Player:FindFirstChild("UpperTorso")
        if HumanoidRootPart then
            local Camera = workspace.CurrentCamera
            local ScreenPosition, IsVisible = Camera:WorldToViewportPoint(HumanoidRootPart.Position)

            if not IsVisible then
                for _, line in pairs(lines) do line.Visible = false end
                for _, outline in pairs(outlines) do outline.Visible = false end
                DistanceText.Visible = false
                return
            end

            local Distance = (Camera.CFrame.Position - HumanoidRootPart.Position).Magnitude
            if Distance > currentESPDistance then
                for _, line in pairs(lines) do line.Visible = false end
                for _, outline in pairs(outlines) do outline.Visible = false end
                DistanceText.Visible = false
                return
            end

            local scaleFactor = 1 / (ScreenPosition.Z * math.tan(math.rad(Camera.FieldOfView / 2)) * 2) * 100
            local boxWidth = 18 * scaleFactor * 3
            local boxHeight = 28 * scaleFactor * 3
            local x = ScreenPosition.X - boxWidth / 2
            local y = ScreenPosition.Y - boxHeight / 2
            local cornerLength = math.min(boxWidth, boxHeight) * 0.3

            TopLeftLineH.Visible = espEnabled
            TopLeftLineH.From = Vector2.new(x, y)
            TopLeftLineH.To = Vector2.new(x + cornerLength, y)

            TopLeftLineV.Visible = espEnabled
            TopLeftLineV.From = Vector2.new(x, y)
            TopLeftLineV.To = Vector2.new(x, y + cornerLength)

            TopRightLineH.Visible = espEnabled
            TopRightLineH.From = Vector2.new(x + boxWidth, y)
            TopRightLineH.To = Vector2.new(x + boxWidth - cornerLength, y)

            TopRightLineV.Visible = espEnabled
            TopRightLineV.From = Vector2.new(x + boxWidth, y)
            TopRightLineV.To = Vector2.new(x + boxWidth, y + cornerLength)

            BottomLeftLineH.Visible = espEnabled
            BottomLeftLineH.From = Vector2.new(x, y + boxHeight)
            BottomLeftLineH.To = Vector2.new(x + cornerLength, y + boxHeight)

            BottomLeftLineV.Visible = espEnabled
            BottomLeftLineV.From = Vector2.new(x, y + boxHeight)
            BottomLeftLineV.To = Vector2.new(x, y + boxHeight - cornerLength)

            BottomRightLineH.Visible = espEnabled
            BottomRightLineH.From = Vector2.new(x + boxWidth, y + boxHeight)
            BottomRightLineH.To = Vector2.new(x + boxWidth - cornerLength, y + boxHeight)

            BottomRightLineV.Visible = espEnabled
            BottomRightLineV.From = Vector2.new(x + boxWidth, y + boxHeight)
            BottomRightLineV.To = Vector2.new(x + boxWidth, y + boxHeight - cornerLength)

            for i, line in ipairs(lines) do
                local outline = outlines[i]
                outline.Visible = line.Visible
                outline.From = line.From
                outline.To = line.To
            end

            if showDistance and espEnabled then
                DistanceText.Text = string.format("%ds", math.floor(Distance))
                DistanceText.Visible = true
                DistanceText.Position = Vector2.new(x + boxWidth / 2, y - 15)
            else
                DistanceText.Visible = false
            end
        else
            for _, line in pairs(lines) do line.Visible = false end
            for _, outline in pairs(outlines) do outline.Visible = false end
            DistanceText.Visible = false
        end
    end

    RunService.RenderStepped:Connect(UpdateBox)
end
--udpater
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
--fuck tooltip
HitboxSection:AddToggle('EnableHitboxExpander', {
    Text = 'Enable Hitbox',
    Default = _G.Flags.HitboxExpander.Enabled,
}):OnChanged(function(state)
    _G.Flags.HitboxExpander.Enabled = state
end)

HitboxSection:AddSlider('HitboxSize', {
    Text = 'Size',
    Default = _G.Flags.HitboxExpander.Size,
    Min = 1,
    Max = 15,
    Rounding = 1,
}):OnChanged(function(value)
    _G.Flags.HitboxExpander.Size = value
end)

HitboxSection:AddSlider('HitboxTransparency', {
    Text = 'Transparency',
    Default = _G.Flags.HitboxExpander.Transparency or 0.7, 
    Min = 0, 
    Max = 1, 
    Rounding = 2,
}):OnChanged(function(value)
    _G.Flags.HitboxExpander.Transparency = value
end)

HitboxSection:AddDropdown('HitboxPartDropdown', {
    Text = '',
    Values = { 'Torso', 'Head' },
    Default = 1, 
}):OnChanged(function(selected)
    _G.Flags.HitboxExpander.Part = selected
end)

if (not _G.Loaded) then
    _G.Loaded = true;
    local OriginalSizes = {}

    for i, v in pairs(game:GetService("ReplicatedStorage").Shared.entities.Player.Model:GetChildren()) do
        if v:IsA("BasePart") then
            OriginalSizes[v.Name] = v.Size;
        end
    end

    function IsPlayer(Model)
        return Model.ClassName == "Model" and Model:FindFirstChild("Head") and Model.PrimaryPart ~= nil;
    end

    function HitboxExpander(Model, Size, Hitbox)
        local Part = Model[Hitbox.Part]
        if (Hitbox.Enabled) then
            Part.Size = Vector3.new(Size, Size, Size) 
            Part.Transparency = Hitbox.Transparency
            Part.CanCollide = false
        else
            Part.Size = OriginalSizes[Hitbox.Part]
            Part.Transparency = 0
            Part.CanCollide = true
        end
    end

    RunService.Heartbeat:Connect(function()
        local Hitbox = _G.Flags.HitboxExpander
        for i, v in pairs(workspace:GetChildren()) do
            if IsPlayer(v) then
                HitboxExpander(v, Hitbox.Size, Hitbox)
            end
        end
    end)
end

Library:OnUnload(function()
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
