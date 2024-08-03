local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Camera = workspace.CurrentCamera

local FOVMin = 25
local FOVMax = 70
local FOVStep = 3
local FOVLevels = {70, 45, 25} 
local currentLevel = 1 

local currentFOV = Camera.FieldOfView
local desiredFOV = FOVLevels[currentLevel]

local function updateFOV()
    local delta = (desiredFOV - currentFOV)
    if math.abs(delta) < 0.1 then
        currentFOV = desiredFOV
    else
        currentFOV = currentFOV + math.clamp(delta, -0.5, 0.5)
    end
    Camera.FieldOfView = currentFOV
end

UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.F then
        currentLevel = currentLevel % #FOVLevels + 1 
        desiredFOV = FOVLevels[currentLevel]
        print("Desired FOV: ", desiredFOV)
    end
end)

RunService.RenderStepped:Connect(function()
    updateFOV()
end)
