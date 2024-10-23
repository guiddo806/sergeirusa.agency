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
            Transparency = .7; 
            Part = "Torso"; 
        };
    };
end

local espEnabled = false 
local showDistance = false 
local currentESPDistance = 1500 

HitboxSection:AddToggle('EnableHitboxExpander', {
    Text = 'Enable Hitbox',
    Default = _G.Flags.HitboxExpander.Enabled,
    Tooltip = 'Toggle hitbox',
}):OnChanged(function(state)
    _G.Flags.HitboxExpander.Enabled = state
end)

HitboxSection:AddSlider('HitboxSize', {
    Text = 'Size',
    Default = _G.Flags.HitboxExpander.Size,
    Min = 1,
    Max = 15,
    Rounding = 1,
    Tooltip = 'Adjust hitbox size',
}):OnChanged(function(value)
    _G.Flags.HitboxExpander.Size = value
end)

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
    Tooltip = 'Toggle the Distance ESP',
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
    local TopLeftLineH = Drawing.new("Line")
    local TopLeftLineV = Drawing.new("Line")
    
    local TopRightLineH = Drawing.new("Line")
    local TopRightLineV = Drawing.new("Line")
    
    local BottomLeftLineH = Drawing.new("Line")
    local BottomLeftLineV = Drawing.new("Line")
    
    local BottomRightLineH = Drawing.new("Line")
    local BottomRightLineV = Drawing.new("Line")

    local lines = {TopLeftLineH, TopLeftLineV, TopRightLineH, TopRightLineV, BottomLeftLineH, BottomLeftLineV, BottomRightLineH, BottomRightLineV}
    for _, line in pairs(lines) do
        line.Visible = false
        line.Color = Color3.fromRGB(255, 255, 255)
        line.Thickness = 1
        line.Transparency = 1
    end

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
                for _, line in pairs(lines) do
                    line.Visible = false
                end
                DistanceText.Visible = false
                return
            end

            local Distance = (Camera.CFrame.p - HumanoidRootPart.Position).Magnitude
            if Distance > currentESPDistance then
                for _, line in pairs(lines) do
                    line.Visible = false
                end
                DistanceText.Visible = false
                return
            end

            local scale_factor = 1 / (Target2dPosition.Z * math.tan(math.rad(Camera.FieldOfView * 0.5)) * 2) * 100
            local width, height = math.floor(18 * scale_factor * 3), math.floor(28 * scale_factor * 3)
            local x = Target2dPosition.X - width / 2
            local y = Target2dPosition.Y - height / 2

            local cornerLength = math.min(width, height) * 0.3

            TopLeftLineH.Visible = espEnabled and IsVisible
            TopLeftLineH.From = Vector2.new(x, y)
            TopLeftLineH.To = Vector2.new(x + cornerLength, y)

            TopLeftLineV.Visible = espEnabled and IsVisible
            TopLeftLineV.From = Vector2.new(x, y)
            TopLeftLineV.To = Vector2.new(x, y + cornerLength)

            TopRightLineH.Visible = espEnabled and IsVisible
            TopRightLineH.From = Vector2.new(x + width, y)
            TopRightLineH.To = Vector2.new(x + width - cornerLength, y)

            TopRightLineV.Visible = espEnabled and IsVisible
            TopRightLineV.From = Vector2.new(x + width, y)
            TopRightLineV.To = Vector2.new(x + width, y + cornerLength)

            BottomLeftLineH.Visible = espEnabled and IsVisible
            BottomLeftLineH.From = Vector2.new(x, y + height)
            BottomLeftLineH.To = Vector2.new(x + cornerLength, y + height)

            BottomLeftLineV.Visible = espEnabled and IsVisible
            BottomLeftLineV.From = Vector2.new(x, y + height)
            BottomLeftLineV.To = Vector2.new(x, y + height - cornerLength)

            BottomRightLineH.Visible = espEnabled and IsVisible
            BottomRightLineH.From = Vector2.new(x + width, y + height)
            BottomRightLineH.To = Vector2.new(x + width - cornerLength, y + height)

            BottomRightLineV.Visible = espEnabled and IsVisible
            BottomRightLineV.From = Vector2.new(x + width, y + height)
            BottomRightLineV.To = Vector2.new(x + width, y + height - cornerLength)

            if showDistance and espEnabled then
                DistanceText.Text = string.format("%ds", math.floor(Distance))
                DistanceText.Visible = IsVisible
                DistanceText.Position = Vector2.new(x + width / 2, y - 13)  
            else
                DistanceText.Visible = false
            end
        else
            for _, line in pairs(lines) do
                line.Visible = false
            end
            DistanceText.Visible = false
            if not Player then
                for _, line in pairs(lines) do
                    line:Remove()
                end
                DistanceText:Remove()
                Updater:Disconnect()
            end
        end
    end

    Updater = RunService.RenderStepped:Connect(UpdateBox)
    return {lines = lines, DistanceText = DistanceText}
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
