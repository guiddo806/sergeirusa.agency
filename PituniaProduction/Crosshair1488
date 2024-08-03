local function API_Check()
    if Drawing == nil then
        return "No"
    else
        return "Yes"
    end
end

local Find_Required = API_Check()

if Find_Required == "No" then
    game:GetService("StarterGui"):SetCore("SendNotification",{
        Title = "Exunys Developer";
        Text = "Crosshair script could not be loaded because your exploit is unsupported.";
        Duration = math.huge;
        Button1 = "OK"
    })

    return
end

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Camera = workspace.CurrentCamera

local Typing = false

local ViewportSize_ = Camera.ViewportSize / 2
local Axis_X, Axis_Y = ViewportSize_.X, ViewportSize_.Y

local CrosshairSegments = {}

for i = 1, 8 do
    CrosshairSegments[i] = Drawing.new("Line")
end

_G.SendNotifications = true
_G.DefaultSettings = false
_G.ToMouse = false

_G.CrosshairVisible = true
_G.CrosshairSize = 15
_G.CrosshairThickness = 1
_G.CrosshairColor = Color3.fromRGB(255, 255, 255)
_G.CrosshairTransparency = 1

_G.DisableKey = Enum.KeyCode.Q

local rotationAngle = 0

local function DrawCrosshair()
    local Real_Size = _G.CrosshairSize / 2
    local armLength = Real_Size * 1.5  -- Увеличим длину конечных линий
    local centerX = Axis_X
    local centerY = Axis_Y

    rotationAngle = rotationAngle + math.rad(1)

    for i = 1, 4 do
        local angle = math.rad(90 * (i - 1)) + rotationAngle
        local x = math.cos(angle) * Real_Size
        local y = math.sin(angle) * Real_Size

        CrosshairSegments[2 * i - 1].From = Vector2.new(centerX, centerY)
        CrosshairSegments[2 * i - 1].To = Vector2.new(centerX + x, centerY + y)

        CrosshairSegments[2 * i - 1].Color = _G.CrosshairColor
        CrosshairSegments[2 * i - 1].Thickness = _G.CrosshairThickness
        CrosshairSegments[2 * i - 1].Transparency = _G.CrosshairTransparency
        CrosshairSegments[2 * i - 1].Visible = _G.CrosshairVisible

        local armAngle = angle + math.rad(90)
        local armX = math.cos(armAngle) * armLength
        local armY = math.sin(armAngle) * armLength

        CrosshairSegments[2 * i].From = Vector2.new(centerX + x, centerY + y)
        CrosshairSegments[2 * i].To = Vector2.new(centerX + x + armX, centerY + y + armY)

        CrosshairSegments[2 * i].Color = _G.CrosshairColor
        CrosshairSegments[2 * i].Thickness = _G.CrosshairThickness
        CrosshairSegments[2 * i].Transparency = _G.CrosshairTransparency
        CrosshairSegments[2 * i].Visible = _G.CrosshairVisible
    end
end

RunService.RenderStepped:Connect(function()
    if _G.ToMouse == true then
        local mousePos = UserInputService:GetMouseLocation()
        Axis_X, Axis_Y = mousePos.X, mousePos.Y
    else
        Axis_X, Axis_Y = ViewportSize_.X, ViewportSize_.Y
    end
    
    DrawCrosshair()
end)

if _G.DefaultSettings == true then
    _G.CrosshairVisible = true
    _G.CrosshairSize = 25
    _G.CrosshairThickness = 1
    _G.CrosshairColor = Color3.fromRGB(255, 255, 255)
    _G.CrosshairTransparency = 0.15
    _G.DisableKey = Enum.KeyCode.Q
end

UserInputService.TextBoxFocused:Connect(function()
    Typing = true
end)

UserInputService.TextBoxFocusReleased:Connect(function()
    Typing = false
end)

UserInputService.InputBegan:Connect(function(Input)
    if Input.KeyCode == _G.DisableKey and Typing == false then
        _G.CrosshairVisible = not _G.CrosshairVisible
        
        if _G.SendNotifications == true then
            game:GetService("StarterGui"):SetCore("SendNotification",{
                Title = "guiddo806 developer";
                Text = "The crosshair's visibility is now set to "..tostring(_G.CrosshairVisible)..".";
                Duration = 5;
            })
        end
    end
end)
