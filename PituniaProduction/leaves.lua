local Workspace = game:GetService("Workspace")

local leavesToDelete = {"Fir3_Leaves", "Birch1_Leaves", "Elm1_Leaves", "Palm1_Leaves"} 

local function checkAndDeleteLeaves(obj)
    if table.find(leavesToDelete, obj.Name) then
        obj:Destroy()
    end
end

for _, obj in pairs(Workspace:GetDescendants()) do
    checkAndDeleteLeaves(obj)
end

Workspace.DescendantAdded:Connect(function(obj)
    checkAndDeleteLeaves(obj)
end)
