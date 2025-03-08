local workspace = game:GetService("Workspace")
local leaves = {"Fir3_Leaves", "Birch1_Leaves", "Elm1_Leaves", "Palm1_Leaves"}

local oldNamecall
oldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
    local method = getnamecallmethod()
    if self == workspace and method == "DescendantAdded" then
        return oldNamecall(self, ...) 
    end
    return oldNamecall(self, ...)
end)

local function spoofLeaves(obj)
    if table.find(leaves, obj.Name) then
        obj.Transparency = 1
        obj.CanCollide = false
        if obj:IsA("BasePart") then
            obj.CastShadow = false
        end
    end
end

for _, obj in pairs(workspace:GetDescendants()) do
    spoofLeaves(obj)
end

workspace.DescendantAdded:Connect(function(obj)
    spoofLeaves(obj)
end)
