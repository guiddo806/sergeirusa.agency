local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Camera = workspace.CurrentCamera

local FOVMin = 70 
local FOVMax = 120 
local FOVStep = 5 
local currentFOV = Camera.FieldOfView 
local desiredFOV = Camera.FieldOfView 

local function updateFOV()
    local delta = (desiredFOV - currentFOV)
    if math.abs(delta) < 0.1 then
        currentFOV = desiredFOV
    else
        currentFOV = currentFOV + math.clamp(delta, -0.5, 0.5) 
    end
    Camera.FieldOfView = currentFOV
end

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    
    if not gameProcessed then
        if input.KeyCode == Enum.KeyCode.Equals or input.KeyCode == Enum.KeyCode.Plus then
            desiredFOV = math.clamp(desiredFOV + FOVStep, FOVMin, FOVMax)
            print("Desired FOV: ", desiredFOV)
        elseif input.KeyCode == Enum.KeyCode.Minus then
            desiredFOV = math.clamp(desiredFOV - FOVStep, FOVMin, FOVMax)
            print("Desired FOV: ", desiredFOV)
        end
    end
end)

RunService.RenderStepped:Connect(function()
    updateFOV()
end)
