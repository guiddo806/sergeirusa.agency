local Players = game:GetService("Players")
local player = Players.LocalPlayer

local keysUrl = "https://raw.githubusercontent.com/feofelact/feofelact.gg/refs/heads/main/main/KeySystem/ValidKeys.txt"

local function fetchKeys()
    local success, result = pcall(function()
        return game:HttpGet(keysUrl)
    end)
    if success then
        local keys = {}
        for key in string.gmatch(result, "[^\r\n]+") do
            table.insert(keys, key)
        end
        return keys
    else
        warn("Error because:", result)
        return {}
    end
end

local function isValidKey(inputKey)
    local validKeys = fetchKeys()
    for _, key in ipairs(validKeys) do
        if inputKey == key then
            return true
        end
    end
    return false
end

local screenGui = Instance.new("ScreenGui", player.PlayerGui)
screenGui.Name = "KeyMenu"

local keyFrame = Instance.new("Frame", screenGui)
keyFrame.Size = UDim2.new(0, 400, 0, 200)
keyFrame.Position = UDim2.new(0.5, 0, 0.5, 0) 
keyFrame.AnchorPoint = Vector2.new(0.5, 0.5) 
keyFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)

local keyFrameCorner = Instance.new("UICorner", keyFrame)
keyFrameCorner.CornerRadius = UDim.new(0, 10)

local keyInput = Instance.new("TextBox", keyFrame)
keyInput.Size = UDim2.new(0.8, 0, 0, 40)
keyInput.Position = UDim2.new(0.1, 0, 0.3, 0)
keyInput.PlaceholderText = "Enter your key here"
keyInput.Text = ""
keyInput.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
keyInput.TextColor3 = Color3.fromRGB(200, 200, 200)
keyInput.Font = Enum.Font.Gotham
keyInput.TextScaled = true

local keyInputCorner = Instance.new("UICorner", keyInput)
keyInputCorner.CornerRadius = UDim.new(0, 8)

local checkKeyButton = Instance.new("TextButton", keyFrame)
checkKeyButton.Size = UDim2.new(0.6, 0, 0, 40)
checkKeyButton.Position = UDim2.new(0.2, 0, 0.6, 0)
checkKeyButton.Text = "Submit Key"
checkKeyButton.BackgroundColor3 = Color3.fromRGB(0, 170, 127)
checkKeyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
checkKeyButton.Font = Enum.Font.Gotham
checkKeyButton.TextScaled = true

local checkKeyButtonCorner = Instance.new("UICorner", checkKeyButton)
checkKeyButtonCorner.CornerRadius = UDim.new(0, 8)

local errorMessage = Instance.new("TextLabel", keyFrame)
errorMessage.Size = UDim2.new(0.8, 0, 0, 30)
errorMessage.Position = UDim2.new(0.1, 0, 0.8, 0)
errorMessage.Text = ""
errorMessage.BackgroundTransparency = 1
errorMessage.TextColor3 = Color3.fromRGB(255, 85, 85)
errorMessage.Font = Enum.Font.Gotham
errorMessage.TextScaled = true

checkKeyButton.MouseButton1Click:Connect(function()
    local userInputKey = keyInput.Text

    if isValidKey(userInputKey) then
        keyFrame.Visible = false
        screenGui:Destroy()

        local success, errorMessage = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/guiddo806/sergeirusa.agency/refs/heads/main/Loader.lua", true))()
        end)

        if not success then
            warn("Erorr", errorMessage)
        end
    else
        errorMessage.Text = "Invalid key. Please try again."
        wait(2)
        errorMessage.Text = ""
    end
end)
