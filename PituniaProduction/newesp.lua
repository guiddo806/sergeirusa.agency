local Loaded = false
local Flags = {
    ESP = {
        Box = true,
        Weapon = true,
        Distance = true,
        Skeleton = true, 
    },
    MaxDistance = 2000, 
}

if not Loaded then
    Loaded = true
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local RunService = game:GetService("RunService")
    local Items = ReplicatedStorage:WaitForChild("HandModels")
    local CurrentCamera = workspace.CurrentCamera

    for _, v in pairs(Items:GetChildren()) do
        v:SetAttribute("RealName", v.Name)
    end

    function CreateESP()
        local espContainer = {}

        local Box = Drawing.new("Square")
        Box.Color = Color3.fromRGB(255, 255, 255)
        Box.Thickness = 1.5
        Box.Filled = false
        Box.Transparency = 1
        Box.Visible = false

        local DistanceText = Drawing.new("Text")
        DistanceText.Color = Color3.fromRGB(136, 121, 232)
        DistanceText.Size = 15
        DistanceText.Outline = true
        DistanceText.Center = true
        DistanceText.Visible = false

        local WeaponText = Drawing.new("Text")
        WeaponText.Color = Color3.fromRGB(136, 121, 232)
        WeaponText.Size = 15
        WeaponText.Outline = true
        WeaponText.Center = true
        WeaponText.Visible = false

        espContainer.Box = Box
        espContainer.DistanceText = DistanceText
        espContainer.WeaponText = WeaponText
        espContainer.SkeletonLines = nil 

        return espContainer
    end

    function GetPlayerWeapon(playerModel)
        local weaponModel = playerModel:FindFirstChildOfClass("Model")
        return weaponModel and weaponModel:GetAttribute("RealName") or "None"
    end

    local function CreateSkeletonLines(Player)
        local Lines = {}

        for i = 1, 15 do  
            local line = Drawing.new("Line")
            line.Visible = false
            line.Color = Color3.fromRGB(136, 121, 232)
            line.Thickness = 2
            line.Transparency = 1
            table.insert(Lines, line)
        end

        local function UpdateSkeletonLines()
            if Player and Player:IsA("Model") and Player:FindFirstChild("HumanoidRootPart") then
                local Camera = workspace.CurrentCamera
                local Root = Player:FindFirstChild("HumanoidRootPart")

                if not Root then return end

                local Position, OnScreen = Camera:WorldToViewportPoint(Root.Position)
                local distance = (Camera.CFrame.Position - Root.Position).Magnitude

                if not OnScreen or distance > Flags.MaxDistance then
                    for _, line in ipairs(Lines) do
                        line.Visible = false
                    end
                    return
                end

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
                    {parts.Torso, parts.Head},
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
                        Lines[i].Visible = visible0 and visible1 and Flags.ESP.Skeleton
                        Lines[i].From = Vector2.new(pos0.X, pos0.Y)
                        Lines[i].To = Vector2.new(pos1.X, pos1.Y)
                    else
                        Lines[i].Visible = false
                    end
                end
            else
                for _, line in ipairs(Lines) do
                    line.Visible = false
                end
            end
        end

        RunService.RenderStepped:Connect(UpdateSkeletonLines)
        return Lines
    end

    local HasESP = {}

    RunService.RenderStepped:Connect(function()
        for _, model in pairs(workspace:GetChildren()) do
            if model:IsA("Model") and model:FindFirstChild("Head") and model.PrimaryPart then
                if not HasESP[model] then
                    local espElements = CreateESP()
                    espElements.SkeletonLines = CreateSkeletonLines(model) 
                    HasESP[model] = espElements
                end

                local espElements = HasESP[model]
                local Camera = workspace.CurrentCamera
                local Root = model.PrimaryPart
                local Position, OnScreen = Camera:WorldToViewportPoint(Root.Position)

                local distance = math.floor((Camera.CFrame.Position - Root.Position).Magnitude)

                if OnScreen and distance <= Flags.MaxDistance then
                    local scale = 1 / (Position.Z * math.tan(math.rad(Camera.FieldOfView * 0.5)) * 2) * 100
                    local width, height = math.floor(22 * scale * 3), math.floor(28 * scale * 3)

                    espElements.Box.Visible = Flags.ESP.Box
                    espElements.Box.Size = Vector2.new(width, height)
                    espElements.Box.Position = Vector2.new(Position.X - width / 2, Position.Y - height / 2)

                    espElements.DistanceText.Visible = Flags.ESP.Distance
                    espElements.DistanceText.Text = tostring(distance) .. "s"
                    espElements.DistanceText.Position = Vector2.new(Position.X, Position.Y - height / 2 - 15)

                    local weapon = GetPlayerWeapon(model)
                    espElements.WeaponText.Visible = Flags.ESP.Weapon
                    espElements.WeaponText.Text = string.lower(weapon)
                    espElements.WeaponText.Position = Vector2.new(Position.X, Position.Y + height / 2 + 5)
                else
                    espElements.Box.Visible = false
                    espElements.DistanceText.Visible = false
                    espElements.WeaponText.Visible = false
                end
            end
        end

        for model, espElements in pairs(HasESP) do
            if not model:IsDescendantOf(workspace) then
                espElements.Box:Remove()
                espElements.DistanceText:Remove()
                espElements.WeaponText:Remove()

                if espElements.SkeletonLines then
                    for _, line in ipairs(espElements.SkeletonLines) do
                        line:Remove()
                    end
                end

                HasESP[model] = nil
            end
        end
    end)
end
