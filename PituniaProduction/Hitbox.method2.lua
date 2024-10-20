local SelectPart = "Torso"
local HBSizeX = 8
local HBSizeY = 8
local HBSizeZ = 8
local SelectedColor = BrickColor.new("White")
local hitboxlist = {}

local function createHitbox(parent)
    local FakeHead = Instance.new("Part", parent)
    FakeHead.CFrame = parent.HumanoidRootPart.CFrame
    FakeHead.Name = SelectPart
    FakeHead.Size = Vector3.new(HBSizeX, HBSizeY, HBSizeZ)
    FakeHead.Anchored = true
    FakeHead.CanCollide = false
    FakeHead.Transparency = 0.9
    FakeHead.BrickColor = SelectedColor  
    local subndom = Instance.new("Part", parent)
    subndom.Name = "Fake"
    table.insert(hitboxlist, FakeHead)
    table.insert(hitboxlist, subndom)
end

local function clearHitboxes()
    for _, hitbox in ipairs(hitboxlist) do
        if hitbox and hitbox.Parent then
            hitbox:Destroy()
        end
    end
    hitboxlist = {}
end

local function updateHitboxSize(x, y, z)
    x = math.clamp(x, 1, 9)
    y = math.clamp(y, 1, 10)
    z = math.clamp(z, 1, 9)

    HBSizeX = x
    HBSizeY = y
    HBSizeZ = z

    for _, hitbox in ipairs(hitboxlist) do
        hitbox.Size = Vector3.new(HBSizeX, HBSizeY, HBSizeZ)
    end
end

local function updateHitboxColor(color)
    SelectedColor = color
    for _, hitbox in ipairs(hitboxlist) do
        if hitbox.Name == SelectPart then
            hitbox.BrickColor = color
        end
    end
end

local function initializeHitboxes()
    clearHitboxes()

    for _, instance in pairs(workspace:GetChildren()) do
        if instance:IsA("Model") and instance:FindFirstChild("HumanoidRootPart") and not instance:FindFirstChild("Fake") then
            createHitbox(instance)
        end
    end
end

local function onNewModelAdded(model)
    if model:IsA("Model") and model:FindFirstChild("HumanoidRootPart") and not model:FindFirstChild("Fake") then
        createHitbox(model)
    end
end

initializeHitboxes()

workspace.ChildAdded:Connect(onNewModelAdded)

local RunService = game:GetService("RunService")

RunService.Heartbeat:Connect(function()
    updateHitboxSize(HBSizeX, HBSizeY, HBSizeZ)
    updateHitboxColor(SelectedColor)
end)
