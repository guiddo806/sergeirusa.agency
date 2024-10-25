local replicatedStorage = game:GetService("ReplicatedStorage")
local handModelsFolder = replicatedStorage:FindFirstChild("HandModels")

if handModelsFolder then
    for _, model in pairs(handModelsFolder:GetChildren()) do
        if model:IsA("Model") then
            for _, part in pairs(model:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.Material = Enum.Material.ForceField
                    part.Color = Color3.fromRGB(255, 102, 255) 
                end
            end
        end
    end
end
