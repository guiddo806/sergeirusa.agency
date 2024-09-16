local function CreateSkeletonLinesESP()
    local SkeletonLinesESP = {}

    function SkeletonLinesESP.CreateSkeletonLines(Player)
        local Lines = {}
        local HeadCircle = Drawing.new("Circle")
        HeadCircle.Visible = false
        HeadCircle.Color = Color3.fromRGB(255, 255, 255)
        HeadCircle.Thickness = 2
        HeadCircle.Transparency = 1
        HeadCircle.Radius = 10

        local ViewDirectionLine = Drawing.new("Line")
        ViewDirectionLine.Visible = false
        ViewDirectionLine.Color = Color3.fromRGB(255, 255, 255)  
        ViewDirectionLine.Thickness = 2
        ViewDirectionLine.Transparency = 1

        for i = 1, 14 do
            local line = Drawing.new("Line")
            line.Visible = false
            line.Color = Color3.fromRGB(255, 255, 255)
            line.Thickness = 2
            line.Transparency = 1
            table.insert(Lines, line)
        end

        local Updater
        local function UpdateSkeletonLines()
            if Player and Player:IsA("Model") and Player:FindFirstChild("HumanoidRootPart") then
                local Camera = workspace.CurrentCamera

                local parts = {
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
                        Lines[i].Visible = visible0 and visible1
                        Lines[i].From = Vector2.new(pos0.X, pos0.Y)
                        Lines[i].To = Vector2.new(pos1.X, pos1.Y)
                    else
                        Lines[i].Visible = false
                    end
                end

                if parts.Head and Player:FindFirstChild("HumanoidRootPart") then
                    local headPos, headVisible = Camera:WorldToViewportPoint(parts.Head.Position)
                    local rootPartPos, rootPartVisible = Camera:WorldToViewportPoint(Player.HumanoidRootPart.Position + Player.HumanoidRootPart.CFrame.LookVector * 5)  
                    ViewDirectionLine.Visible = headVisible and rootPartVisible
                    ViewDirectionLine.From = Vector2.new(headPos.X, headPos.Y)
                    ViewDirectionLine.To = Vector2.new(rootPartPos.X, rootPartPos.Y)
                else
                    ViewDirectionLine.Visible = false
                end
            else
                for _, line in ipairs(Lines) do
                    line.Visible = false
                end
                ViewDirectionLine.Visible = false
                if not Player then
                    for _, line in ipairs(Lines) do
                        line:Remove()
                    end
                    ViewDirectionLine:Remove()
                    Updater:Disconnect()
                end
            end
        end

        Updater = game:GetService("RunService").RenderStepped:Connect(UpdateSkeletonLines)
        return Lines
    end

    function SkeletonLinesESP.EnableSkeletonLinesESP()
        for _, Player in pairs(game:GetService("Workspace"):GetChildren()) do
            if Player:IsA("Model") and Player:FindFirstChild("HumanoidRootPart") then
                SkeletonLinesESP.CreateSkeletonLines(Player)
            end
        end
    end

    return SkeletonLinesESP
end

local SkeletonESP = CreateSkeletonLinesESP()
SkeletonESP.EnableSkeletonLinesESP()
