--[[
                         /$$               /$$                 /$$      
                        |__/              | $$                | $$      
  /$$$$$$$ /$$  /$$  /$$ /$$ /$$$$$$/$$$$ | $$$$$$$  /$$   /$$| $$$$$$$ 
 /$$_____/| $$ | $$ | $$| $$| $$_  $$_  $$| $$__  $$| $$  | $$| $$__  $$
|  $$$$$$ | $$ | $$ | $$| $$| $$ \ $$ \ $$| $$  \ $$| $$  | $$| $$  \ $$
 \____  $$| $$ | $$ | $$| $$| $$ | $$ | $$| $$  | $$| $$  | $$| $$  | $$
 /$$$$$$$/|  $$$$$/$$$$/| $$| $$ | $$ | $$| $$  | $$|  $$$$$$/| $$$$$$$/
|_______/  \_____/\___/ |__/|__/ |__/ |__/|__/  |__/ \______/ |_______/ 

---------> the cheapest of all, clearly, not the best <---------

--:: buyer impression > "when i bought swimhub, i still had my money cash on me, cause swimhub is hell cheap!!"

]]--

local G2L = {};

-- StarterGui.ScreenGui
G2L["1"] = Instance.new("Folder", game:GetService("CoreGui").RobloxGui);


-- StarterGui.ScreenGui.main
G2L["2"] = Instance.new("Frame", G2L["1"]);
G2L["2"]["BorderSizePixel"] = 0;
G2L["2"]["BackgroundColor3"] = Color3.fromRGB(10, 0, 32);
G2L["2"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["2"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
G2L["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2"]["Name"] = [[main]];


-- StarterGui.ScreenGui.main.Dragify
G2L["3"] = Instance.new("LocalScript", G2L["2"]);
G2L["3"]["Name"] = [[Dragify]];


-- StarterGui.ScreenGui.main.loadholder
G2L["4"] = Instance.new("Frame", G2L["2"]);
G2L["4"]["Visible"] = false;
G2L["4"]["BorderSizePixel"] = 0;
G2L["4"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["4"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["4"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["4"]["Name"] = [[loadholder]];
G2L["4"]["BackgroundTransparency"] = 1;


-- StarterGui.ScreenGui.main.loadholder.choosebox
G2L["5"] = Instance.new("Frame", G2L["4"]);
G2L["5"]["BorderSizePixel"] = 0;
G2L["5"]["BackgroundColor3"] = Color3.fromRGB(12, 8, 50);
G2L["5"]["Size"] = UDim2.new(0.5, -30, 1, -80);
G2L["5"]["Position"] = UDim2.new(0, 15, 0, 65);
G2L["5"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["5"]["Name"] = [[choosebox]];


-- StarterGui.ScreenGui.main.loadholder.choosebox.UICorner
G2L["6"] = Instance.new("UICorner", G2L["5"]);
G2L["6"]["CornerRadius"] = UDim.new(0, 4);


-- StarterGui.ScreenGui.main.loadholder.choosebox.UIStroke
G2L["7"] = Instance.new("UIStroke", G2L["5"]);
G2L["7"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
G2L["7"]["Color"] = Color3.fromRGB(56, 44, 94);


-- StarterGui.ScreenGui.main.loadholder.choosebox.chooseinfoholder
G2L["8"] = Instance.new("Frame", G2L["5"]);
G2L["8"]["BorderSizePixel"] = 0;
G2L["8"]["BackgroundColor3"] = Color3.fromRGB(23, 16, 67);
G2L["8"]["Size"] = UDim2.new(1, 0, 0, 25);
G2L["8"]["Position"] = UDim2.new(0, 0, 0, 25);
G2L["8"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["8"]["Name"] = [[chooseinfoholder]];


-- StarterGui.ScreenGui.main.loadholder.choosebox.chooseinfoholder.UIStroke
G2L["9"] = Instance.new("UIStroke", G2L["8"]);
G2L["9"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
G2L["9"]["Color"] = Color3.fromRGB(56, 44, 94);


-- StarterGui.ScreenGui.main.loadholder.choosebox.chooseinfoholder.chooseinfobox
G2L["a"] = Instance.new("Frame", G2L["8"]);
G2L["a"]["BorderSizePixel"] = 0;
G2L["a"]["BackgroundColor3"] = Color3.fromRGB(23, 16, 67);
G2L["a"]["Size"] = UDim2.new(1, 0, 2, 0);
G2L["a"]["Position"] = UDim2.new(0, 0, -1, 0);
G2L["a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["a"]["Name"] = [[chooseinfobox]];


-- StarterGui.ScreenGui.main.loadholder.choosebox.chooseinfoholder.chooseinfobox.UICorner
G2L["b"] = Instance.new("UICorner", G2L["a"]);
G2L["b"]["CornerRadius"] = UDim.new(0, 4);


-- StarterGui.ScreenGui.main.loadholder.choosebox.chooseinfoholder.chooseinfobox.chooseinfoboxname
G2L["c"] = Instance.new("TextLabel", G2L["a"]);
G2L["c"]["TextWrapped"] = true;
G2L["c"]["ZIndex"] = 4;
G2L["c"]["BorderSizePixel"] = 0;
G2L["c"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["c"]["TextSize"] = 20;
G2L["c"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["c"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["c"]["BackgroundTransparency"] = 1;
G2L["c"]["Size"] = UDim2.new(1, -50, 0.5, -10);
G2L["c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["c"]["Text"] = [[roblox: ...]];
G2L["c"]["Name"] = [[chooseinfoboxname]];
G2L["c"]["Position"] = UDim2.new(0, 50, 0, 10);


-- StarterGui.ScreenGui.main.loadholder.choosebox.chooseinfoholder.chooseinfobox.chooseinfoboxcount
G2L["d"] = Instance.new("TextLabel", G2L["a"]);
G2L["d"]["TextWrapped"] = true;
G2L["d"]["ZIndex"] = 4;
G2L["d"]["BorderSizePixel"] = 0;
G2L["d"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["d"]["TextSize"] = 17;
G2L["d"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["d"]["TextColor3"] = Color3.fromRGB(183, 183, 183);
G2L["d"]["BackgroundTransparency"] = 1;
G2L["d"]["Size"] = UDim2.new(1, -50, 0.5, -10);
G2L["d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["d"]["Text"] = [[chosed: ...]];
G2L["d"]["Name"] = [[chooseinfoboxcount]];
G2L["d"]["Position"] = UDim2.new(0, 50, 0.5, 3);


-- StarterGui.ScreenGui.main.loadholder.choosebox.chooseinfoholder.chooseinfobox.chooseinfologo
G2L["e"] = Instance.new("Frame", G2L["a"]);
G2L["e"]["BorderSizePixel"] = 0;
G2L["e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["e"]["Size"] = UDim2.new(0, 26, 0, 26);
G2L["e"]["Position"] = UDim2.new(0, 12, 0, 12);
G2L["e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["e"]["Name"] = [[chooseinfologo]];
G2L["e"]["Rotation"] = 15;
G2L["e"]["BackgroundTransparency"] = 1;


-- StarterGui.ScreenGui.main.loadholder.choosebox.chooseinfoholder.chooseinfobox.chooseinfologo.logopart1
G2L["f"] = Instance.new("Frame", G2L["e"]);
G2L["f"]["BorderSizePixel"] = 0;
G2L["f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["f"]["Size"] = UDim2.new(1, 0, 0.33, 0);
G2L["f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["f"]["Name"] = [[logopart1]];


-- StarterGui.ScreenGui.main.loadholder.choosebox.chooseinfoholder.chooseinfobox.chooseinfologo.logopart2
G2L["10"] = Instance.new("Frame", G2L["e"]);
G2L["10"]["BorderSizePixel"] = 0;
G2L["10"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["10"]["AnchorPoint"] = Vector2.new(0, 1);
G2L["10"]["Size"] = UDim2.new(1, 0, 0.33, 0);
G2L["10"]["Position"] = UDim2.new(0, 0, 1, 0);
G2L["10"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["10"]["Name"] = [[logopart2]];


-- StarterGui.ScreenGui.main.loadholder.choosebox.chooseinfoholder.chooseinfobox.chooseinfologo.logopart3
G2L["11"] = Instance.new("Frame", G2L["e"]);
G2L["11"]["BorderSizePixel"] = 0;
G2L["11"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["11"]["AnchorPoint"] = Vector2.new(1, 0);
G2L["11"]["Size"] = UDim2.new(0.33, 0, 1, 0);
G2L["11"]["Position"] = UDim2.new(1, 0, 0, 0);
G2L["11"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["11"]["Name"] = [[logopart3]];


-- StarterGui.ScreenGui.main.loadholder.choosebox.chooseinfoholder.chooseinfobox.chooseinfologo.logopart4
G2L["12"] = Instance.new("Frame", G2L["e"]);
G2L["12"]["BorderSizePixel"] = 0;
G2L["12"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["12"]["Size"] = UDim2.new(0.33, 0, 1, 0);
G2L["12"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["12"]["Name"] = [[logopart4]];


-- StarterGui.ScreenGui.main.loadholder.choosebox.choosescroll
G2L["13"] = Instance.new("ScrollingFrame", G2L["5"]);
G2L["13"]["Active"] = true;
G2L["13"]["BorderSizePixel"] = 0;
G2L["13"]["CanvasSize"] = UDim2.new(0, 0, 0, 0);
G2L["13"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["13"]["Name"] = [[choosescroll]];
G2L["13"]["Size"] = UDim2.new(1, -20, 1, -70);
G2L["13"]["ScrollBarImageColor3"] = Color3.fromRGB(0, 0, 0);
G2L["13"]["Position"] = UDim2.new(0, 10, 0, 60);
G2L["13"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["13"]["ScrollBarThickness"] = 0;
G2L["13"]["BackgroundTransparency"] = 1;


-- StarterGui.ScreenGui.main.loadholder.choosebox.choosescroll.UIListLayout
G2L["18"] = Instance.new("UIListLayout", G2L["13"]);
G2L["18"]["Padding"] = UDim.new(0, 10);
G2L["18"]["SortOrder"] = Enum.SortOrder.LayoutOrder;


-- StarterGui.ScreenGui.main.loadholder.logoframeload
G2L["21"] = Instance.new("Frame", G2L["4"]);
G2L["21"]["BorderSizePixel"] = 0;
G2L["21"]["BackgroundColor3"] = Color3.fromRGB(12, 8, 50);
G2L["21"]["Size"] = UDim2.new(1, 0, 0, 48);
G2L["21"]["Position"] = UDim2.new(0, 0, 0, 2);
G2L["21"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["21"]["Name"] = [[logoframeload]];


-- StarterGui.ScreenGui.main.loadholder.logoframeload.logo
G2L["22"] = Instance.new("TextLabel", G2L["21"]);
G2L["22"]["TextWrapped"] = true;
G2L["22"]["ZIndex"] = 4;
G2L["22"]["BorderSizePixel"] = 0;
G2L["22"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["22"]["TextScaled"] = true;
G2L["22"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["22"]["TextSize"] = 14;
G2L["22"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["22"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["22"]["BackgroundTransparency"] = 1;
G2L["22"]["Size"] = UDim2.new(0.25, -15, 1, -20);
G2L["22"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["22"]["Text"] = [[swimhub]];
G2L["22"]["Name"] = [[logo]];
G2L["22"]["Position"] = UDim2.new(0, 15, 0, 10);


-- StarterGui.ScreenGui.main.loadholder.logoframeload.logored
G2L["23"] = Instance.new("TextLabel", G2L["21"]);
G2L["23"]["TextWrapped"] = true;
G2L["23"]["ZIndex"] = 2;
G2L["23"]["BorderSizePixel"] = 0;
G2L["23"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["23"]["TextScaled"] = true;
G2L["23"]["BackgroundColor3"] = Color3.fromRGB(255, 0, 0);
G2L["23"]["TextSize"] = 14;
G2L["23"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["23"]["TextColor3"] = Color3.fromRGB(255, 0, 0);
G2L["23"]["BackgroundTransparency"] = 1;
G2L["23"]["Size"] = UDim2.new(0.25, -15, 1, -20);
G2L["23"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["23"]["Text"] = [[swimhub]];
G2L["23"]["Name"] = [[logored]];
G2L["23"]["Position"] = UDim2.new(0, 14, 0, 9);


-- StarterGui.ScreenGui.main.loadholder.logoframeload.logoblue
G2L["24"] = Instance.new("TextLabel", G2L["21"]);
G2L["24"]["TextWrapped"] = true;
G2L["24"]["ZIndex"] = 3;
G2L["24"]["BorderSizePixel"] = 0;
G2L["24"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["24"]["TextScaled"] = true;
G2L["24"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 255);
G2L["24"]["TextSize"] = 14;
G2L["24"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["24"]["TextColor3"] = Color3.fromRGB(0, 0, 255);
G2L["24"]["BackgroundTransparency"] = 1;
G2L["24"]["Size"] = UDim2.new(0.25, -15, 1, -20);
G2L["24"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["24"]["Text"] = [[swimhub]];
G2L["24"]["Name"] = [[logoblue]];
G2L["24"]["Position"] = UDim2.new(0, 16, 0, 11);


-- StarterGui.ScreenGui.main.loadholder.userinfobox
G2L["25"] = Instance.new("Frame", G2L["4"]);
G2L["25"]["BorderSizePixel"] = 0;
G2L["25"]["BackgroundColor3"] = Color3.fromRGB(12, 8, 50);
G2L["25"]["Size"] = UDim2.new(0.5, -15, 0, 55);
G2L["25"]["Position"] = UDim2.new(0.5, 0, 0.6, 80);
G2L["25"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["25"]["Name"] = [[userinfobox]];


-- StarterGui.ScreenGui.main.loadholder.userinfobox.UICorner
G2L["26"] = Instance.new("UICorner", G2L["25"]);
G2L["26"]["CornerRadius"] = UDim.new(0, 4);


-- StarterGui.ScreenGui.main.loadholder.userinfobox.UIStroke
G2L["27"] = Instance.new("UIStroke", G2L["25"]);
G2L["27"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
G2L["27"]["Color"] = Color3.fromRGB(56, 44, 94);


-- StarterGui.ScreenGui.main.loadholder.userinfobox.userinfoexpiretext
G2L["28"] = Instance.new("TextLabel", G2L["25"]);
G2L["28"]["TextWrapped"] = true;
G2L["28"]["BorderSizePixel"] = 0;
G2L["28"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["28"]["TextYAlignment"] = Enum.TextYAlignment.Top;
G2L["28"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["28"]["TextSize"] = 18;
G2L["28"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["28"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["28"]["BackgroundTransparency"] = 1;
G2L["28"]["RichText"] = true;
G2L["28"]["AnchorPoint"] = Vector2.new(0, 0.5);
G2L["28"]["Size"] = UDim2.new(1, -30, 0, 20);
G2L["28"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["28"]["Text"] = [[expires: (FREE)]];
G2L["28"]["Name"] = [[userinfoexpiretext]];
G2L["28"]["Position"] = UDim2.new(0, 15, 0.25, 5);


-- StarterGui.ScreenGui.main.loadholder.userinfobox.userinfoupdtext
G2L["29"] = Instance.new("TextLabel", G2L["25"]);
G2L["29"]["TextWrapped"] = true;
G2L["29"]["BorderSizePixel"] = 0;
G2L["29"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["29"]["TextYAlignment"] = Enum.TextYAlignment.Top;
G2L["29"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["29"]["TextSize"] = 18;
G2L["29"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["29"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["29"]["BackgroundTransparency"] = 1;
G2L["29"]["RichText"] = true;
G2L["29"]["AnchorPoint"] = Vector2.new(0, 0.5);
G2L["29"]["Size"] = UDim2.new(1, -30, 0, 20);
G2L["29"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["29"]["Text"] = [[last update: (FREE)]];
G2L["29"]["Name"] = [[userinfoupdtext]];
G2L["29"]["Position"] = UDim2.new(0, 15, 0.75, -3);


-- StarterGui.ScreenGui.main.loadholder.userinfobox.userinfoexpiretextthickness
G2L["2a"] = Instance.new("TextLabel", G2L["25"]);
G2L["2a"]["TextWrapped"] = true;
G2L["2a"]["BorderSizePixel"] = 0;
G2L["2a"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["2a"]["TextYAlignment"] = Enum.TextYAlignment.Top;
G2L["2a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["2a"]["TextSize"] = 18;
G2L["2a"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["2a"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["2a"]["BackgroundTransparency"] = 1;
G2L["2a"]["RichText"] = true;
G2L["2a"]["AnchorPoint"] = Vector2.new(0, 0.5);
G2L["2a"]["Size"] = UDim2.new(1, -30, 0, 20);
G2L["2a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2a"]["Text"] = [[expires: 2 days]];
G2L["2a"]["Name"] = [[userinfoexpiretextthickness]];
G2L["2a"]["Position"] = UDim2.new(0, 15, 0.25, 5);


-- StarterGui.ScreenGui.main.loadholder.userinfobox.userinfoupdtextthickness
G2L["2b"] = Instance.new("TextLabel", G2L["25"]);
G2L["2b"]["TextWrapped"] = true;
G2L["2b"]["BorderSizePixel"] = 0;
G2L["2b"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["2b"]["TextYAlignment"] = Enum.TextYAlignment.Top;
G2L["2b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["2b"]["TextSize"] = 18;
G2L["2b"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["2b"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["2b"]["BackgroundTransparency"] = 1;
G2L["2b"]["RichText"] = true;
G2L["2b"]["AnchorPoint"] = Vector2.new(0, 0.5);
G2L["2b"]["Size"] = UDim2.new(1, -30, 0, 20);
G2L["2b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2b"]["Text"] = [[last update: 1 year ago]];
G2L["2b"]["Name"] = [[userinfoupdtextthickness]];
G2L["2b"]["Position"] = UDim2.new(0, 15, 0.75, -3);


-- StarterGui.ScreenGui.main.loadholder.exit
G2L["2c"] = Instance.new("TextButton", G2L["4"]);
G2L["2c"]["BorderSizePixel"] = 0;
G2L["2c"]["TextSize"] = 18;
G2L["2c"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["2c"]["BackgroundColor3"] = Color3.fromRGB(12, 8, 50);
G2L["2c"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["2c"]["AnchorPoint"] = Vector2.new(1, 1);
G2L["2c"]["Size"] = UDim2.new(0.25, -15, 0, 35);
G2L["2c"]["Name"] = [[exit]];
G2L["2c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2c"]["Text"] = [[exit]];
G2L["2c"]["Position"] = UDim2.new(0.75, -15, 1, -15);


-- StarterGui.ScreenGui.main.loadholder.exit.UICorner
G2L["2d"] = Instance.new("UICorner", G2L["2c"]);
G2L["2d"]["CornerRadius"] = UDim.new(0, 4);


-- StarterGui.ScreenGui.main.loadholder.exit.UIStroke
G2L["2e"] = Instance.new("UIStroke", G2L["2c"]);
G2L["2e"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
G2L["2e"]["Color"] = Color3.fromRGB(56, 44, 94);


-- StarterGui.ScreenGui.main.loadholder.load
G2L["2f"] = Instance.new("TextButton", G2L["4"]);
G2L["2f"]["BorderSizePixel"] = 0;
G2L["2f"]["TextSize"] = 18;
G2L["2f"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["2f"]["BackgroundColor3"] = Color3.fromRGB(12, 8, 50);
G2L["2f"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["2f"]["AnchorPoint"] = Vector2.new(1, 1);
G2L["2f"]["Size"] = UDim2.new(0.25, -15, 0, 35);
G2L["2f"]["Name"] = [[load]];
G2L["2f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2f"]["Text"] = [[load]];
G2L["2f"]["Position"] = UDim2.new(1, -15, 1, -15);


-- StarterGui.ScreenGui.main.loadholder.load.UICorner
G2L["30"] = Instance.new("UICorner", G2L["2f"]);
G2L["30"]["CornerRadius"] = UDim.new(0, 4);


-- StarterGui.ScreenGui.main.loadholder.load.UIStroke
G2L["31"] = Instance.new("UIStroke", G2L["2f"]);
G2L["31"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
G2L["31"]["Color"] = Color3.fromRGB(56, 44, 94);


-- StarterGui.ScreenGui.main.loadholder.changelogbox
G2L["32"] = Instance.new("Frame", G2L["4"]);
G2L["32"]["BorderSizePixel"] = 0;
G2L["32"]["BackgroundColor3"] = Color3.fromRGB(12, 8, 50);
G2L["32"]["Size"] = UDim2.new(0.5, -15, 0.6, 0);
G2L["32"]["Position"] = UDim2.new(0.5, 0, 0, 65);
G2L["32"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["32"]["Name"] = [[changelogbox]];


-- StarterGui.ScreenGui.main.loadholder.changelogbox.UICorner
G2L["33"] = Instance.new("UICorner", G2L["32"]);
G2L["33"]["CornerRadius"] = UDim.new(0, 4);


-- StarterGui.ScreenGui.main.loadholder.changelogbox.UIStroke
G2L["34"] = Instance.new("UIStroke", G2L["32"]);
G2L["34"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
G2L["34"]["Color"] = Color3.fromRGB(56, 44, 94);


-- StarterGui.ScreenGui.main.loadholder.changelogbox.changeloginfoholder
G2L["35"] = Instance.new("Frame", G2L["32"]);
G2L["35"]["BorderSizePixel"] = 0;
G2L["35"]["BackgroundColor3"] = Color3.fromRGB(23, 16, 67);
G2L["35"]["Size"] = UDim2.new(1, 0, 0, 20);
G2L["35"]["Position"] = UDim2.new(0, 0, 0, 20);
G2L["35"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["35"]["Name"] = [[changeloginfoholder]];


-- StarterGui.ScreenGui.main.loadholder.changelogbox.changeloginfoholder.UIStroke
G2L["36"] = Instance.new("UIStroke", G2L["35"]);
G2L["36"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
G2L["36"]["Color"] = Color3.fromRGB(56, 44, 94);


-- StarterGui.ScreenGui.main.loadholder.changelogbox.changeloginfoholder.changeloginfobox
G2L["37"] = Instance.new("Frame", G2L["35"]);
G2L["37"]["BorderSizePixel"] = 0;
G2L["37"]["BackgroundColor3"] = Color3.fromRGB(23, 16, 67);
G2L["37"]["Size"] = UDim2.new(1, 0, 2, 0);
G2L["37"]["Position"] = UDim2.new(0, 0, -1, 0);
G2L["37"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["37"]["Name"] = [[changeloginfobox]];


-- StarterGui.ScreenGui.main.loadholder.changelogbox.changeloginfoholder.changeloginfobox.UICorner
G2L["38"] = Instance.new("UICorner", G2L["37"]);
G2L["38"]["CornerRadius"] = UDim.new(0, 4);


-- StarterGui.ScreenGui.main.loadholder.changelogbox.changeloginfoholder.changeloginfobox.chooseinfoboxname
G2L["39"] = Instance.new("TextLabel", G2L["37"]);
G2L["39"]["TextWrapped"] = true;
G2L["39"]["ZIndex"] = 4;
G2L["39"]["BorderSizePixel"] = 0;
G2L["39"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["39"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["39"]["TextSize"] = 20;
G2L["39"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["39"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["39"]["BackgroundTransparency"] = 1;
G2L["39"]["Size"] = UDim2.new(1, -10, 1, -20);
G2L["39"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["39"]["Text"] = [[changelog]];
G2L["39"]["Name"] = [[chooseinfoboxname]];
G2L["39"]["Position"] = UDim2.new(0, 10, 0, 10);


-- StarterGui.ScreenGui.main.loadholder.changelogbox.changelogtext
G2L["3a"] = Instance.new("TextLabel", G2L["32"]);
G2L["3a"]["BorderSizePixel"] = 0;
G2L["3a"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["3a"]["TextYAlignment"] = Enum.TextYAlignment.Top;
G2L["3a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["3a"]["TextSize"] = 16;
G2L["3a"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["3a"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["3a"]["BackgroundTransparency"] = 1;
G2L["3a"]["RichText"] = true;
G2L["3a"]["Size"] = UDim2.new(1, -30, 1, -75);
G2L["3a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["3a"]["Text"] = [[placeholder (waiting for load)]];
G2L["3a"]["Name"] = [[changelogtext]];
G2L["3a"]["Position"] = UDim2.new(0, 15, 0, 60);


-- StarterGui.ScreenGui.main.loadholder.changelogbox.changelogtextthickness
G2L["3b"] = Instance.new("TextLabel", G2L["32"]);
G2L["3b"]["BorderSizePixel"] = 0;
G2L["3b"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["3b"]["TextYAlignment"] = Enum.TextYAlignment.Top;
G2L["3b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["3b"]["TextSize"] = 16;
G2L["3b"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["3b"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["3b"]["BackgroundTransparency"] = 1;
G2L["3b"]["RichText"] = true;
G2L["3b"]["Size"] = UDim2.new(1, -30, 1, -75);
G2L["3b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["3b"]["Text"] = [[- fixed
- made loader
- made <font color="rgb(70, 255, 70)">undetected</font> version for trident survival]];
G2L["3b"]["Name"] = [[changelogtextthickness]];
G2L["3b"]["Position"] = UDim2.new(0, 15, 0, 60);


-- StarterGui.ScreenGui.main.hider
G2L["3c"] = Instance.new("Frame", G2L["2"]);
G2L["3c"]["Visible"] = false;
G2L["3c"]["ZIndex"] = 999999;
G2L["3c"]["BorderSizePixel"] = 0;
G2L["3c"]["BackgroundColor3"] = Color3.fromRGB(10, 0, 32);
G2L["3c"]["Size"] = UDim2.new(1, 0, 1, -2);
G2L["3c"]["Position"] = UDim2.new(0, 0, 0, 2);
G2L["3c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["3c"]["Name"] = [[hider]];


-- StarterGui.ScreenGui.main.hider.TextLabel
G2L["3d"] = Instance.new("TextLabel", G2L["3c"]);
G2L["3d"]["BorderSizePixel"] = 0;
G2L["3d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["3d"]["TextSize"] = 14;
G2L["3d"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["3d"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["3d"]["BackgroundTransparency"] = 1;
G2L["3d"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["3d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["3d"]["Text"] = [[]];


-- StarterGui.ScreenGui.main.gradient
G2L["3e"] = Instance.new("Frame", G2L["2"]);
G2L["3e"]["Visible"] = false;
G2L["3e"]["BorderSizePixel"] = 0;
G2L["3e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["3e"]["Size"] = UDim2.new(1, 0, 0, 2);
G2L["3e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["3e"]["Name"] = [[gradient]];


-- StarterGui.ScreenGui.main.gradient.UIGradient
G2L["3f"] = Instance.new("UIGradient", G2L["3e"]);
G2L["3f"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(126, 0, 235)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(192, 0, 167))};


-- StarterGui.ScreenGui.main.loginholder
G2L["40"] = Instance.new("Frame", G2L["2"]);
G2L["40"]["Visible"] = false;
G2L["40"]["BorderSizePixel"] = 0;
G2L["40"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["40"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["40"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["40"]["Name"] = [[loginholder]];
G2L["40"]["BackgroundTransparency"] = 1;


-- StarterGui.ScreenGui.main.loginholder.loginbutton
G2L["41"] = Instance.new("TextButton", G2L["40"]);
G2L["41"]["BorderSizePixel"] = 0;
G2L["41"]["TextSize"] = 18;
G2L["41"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["41"]["BackgroundColor3"] = Color3.fromRGB(12, 8, 50);
G2L["41"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["41"]["AnchorPoint"] = Vector2.new(1, 1);
G2L["41"]["Size"] = UDim2.new(1, -30, 0, 35);
G2L["41"]["Name"] = [[loginbutton]];
G2L["41"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["41"]["Text"] = [[login]];
G2L["41"]["Position"] = UDim2.new(1, -15, 1, -15);


-- StarterGui.ScreenGui.main.loginholder.loginbutton.UICorner
G2L["42"] = Instance.new("UICorner", G2L["41"]);
G2L["42"]["CornerRadius"] = UDim.new(0, 4);


-- StarterGui.ScreenGui.main.loginholder.loginbutton.UIStroke
G2L["43"] = Instance.new("UIStroke", G2L["41"]);
G2L["43"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
G2L["43"]["Color"] = Color3.fromRGB(56, 44, 94);


-- StarterGui.ScreenGui.main.loginholder.logologin
G2L["44"] = Instance.new("TextLabel", G2L["40"]);
G2L["44"]["TextWrapped"] = true;
G2L["44"]["ZIndex"] = 4;
G2L["44"]["BorderSizePixel"] = 0;
G2L["44"]["TextScaled"] = true;
G2L["44"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["44"]["TextSize"] = 14;
G2L["44"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["44"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["44"]["BackgroundTransparency"] = 1;
G2L["44"]["Size"] = UDim2.new(1, 0, 0, 28);
G2L["44"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["44"]["Text"] = [[swimhub]];
G2L["44"]["Name"] = [[logologin]];
G2L["44"]["Position"] = UDim2.new(0, 0, 0, 12);


-- StarterGui.ScreenGui.main.loginholder.logobluelogin
G2L["45"] = Instance.new("TextLabel", G2L["40"]);
G2L["45"]["TextWrapped"] = true;
G2L["45"]["ZIndex"] = 3;
G2L["45"]["BorderSizePixel"] = 0;
G2L["45"]["TextScaled"] = true;
G2L["45"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 255);
G2L["45"]["TextSize"] = 14;
G2L["45"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["45"]["TextColor3"] = Color3.fromRGB(0, 0, 255);
G2L["45"]["BackgroundTransparency"] = 1;
G2L["45"]["Size"] = UDim2.new(1, 0, 0, 28);
G2L["45"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["45"]["Text"] = [[swimhub]];
G2L["45"]["Name"] = [[logobluelogin]];
G2L["45"]["Position"] = UDim2.new(0, 1, 0, 13);


-- StarterGui.ScreenGui.main.loginholder.logoredlogin
G2L["46"] = Instance.new("TextLabel", G2L["40"]);
G2L["46"]["TextWrapped"] = true;
G2L["46"]["ZIndex"] = 2;
G2L["46"]["BorderSizePixel"] = 0;
G2L["46"]["TextScaled"] = true;
G2L["46"]["BackgroundColor3"] = Color3.fromRGB(255, 0, 0);
G2L["46"]["TextSize"] = 14;
G2L["46"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["46"]["TextColor3"] = Color3.fromRGB(255, 0, 0);
G2L["46"]["BackgroundTransparency"] = 1;
G2L["46"]["Size"] = UDim2.new(1, 0, 0, 28);
G2L["46"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["46"]["Text"] = [[swimhub]];
G2L["46"]["Name"] = [[logoredlogin]];
G2L["46"]["Position"] = UDim2.new(0, -1, 0, 11);


-- StarterGui.ScreenGui.main.loginholder.keyinputholder
G2L["47"] = Instance.new("Frame", G2L["40"]);
G2L["47"]["BorderSizePixel"] = 0;
G2L["47"]["BackgroundColor3"] = Color3.fromRGB(12, 8, 50);
G2L["47"]["AnchorPoint"] = Vector2.new(1, 1);
G2L["47"]["Size"] = UDim2.new(1, -30, 0, 35);
G2L["47"]["Position"] = UDim2.new(1, -15, 1, -65);
G2L["47"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["47"]["Name"] = [[keyinputholder]];


-- StarterGui.ScreenGui.main.loginholder.keyinputholder.UICorner
G2L["48"] = Instance.new("UICorner", G2L["47"]);
G2L["48"]["CornerRadius"] = UDim.new(0, 4);


-- StarterGui.ScreenGui.main.loginholder.keyinputholder.UIStroke
G2L["49"] = Instance.new("UIStroke", G2L["47"]);
G2L["49"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
G2L["49"]["Color"] = Color3.fromRGB(56, 44, 94);


-- StarterGui.ScreenGui.main.loginholder.keyinputholder.keyinput
G2L["4a"] = Instance.new("TextBox", G2L["47"]);
G2L["4a"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["4a"]["PlaceholderColor3"] = Color3.fromRGB(98, 94, 164);
G2L["4a"]["BorderSizePixel"] = 0;
G2L["4a"]["TextTruncate"] = Enum.TextTruncate.AtEnd;
G2L["4a"]["TextSize"] = 14;
G2L["4a"]["Name"] = [[keyinput]];
G2L["4a"]["BackgroundColor3"] = Color3.fromRGB(12, 8, 50);
G2L["4a"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["4a"]["AnchorPoint"] = Vector2.new(0.5, 0);
G2L["4a"]["PlaceholderText"] = [[enter key]];
G2L["4a"]["Size"] = UDim2.new(1, -20, 0, 35);
G2L["4a"]["Position"] = UDim2.new(0.5, 0, 0, 0);
G2L["4a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["4a"]["Text"] = [[free]];
G2L["4a"]["BackgroundTransparency"] = 1;


-- StarterGui.ScreenGui.main.Dragify
local function C_3()
    local UserInputService = game:GetService("UserInputService")
    local gui = G2L["2"]
    
    local dragging
    local dragInput
    local dragStart
    local startPos
    
    local function update(input)
        local delta = input.Position - dragStart
        gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
    
    gui.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = gui.Position
    
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    
    gui.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            update(input)
        end
    end)
end;
task.spawn(C_3);
-- StarterGui.ScreenGui.LocalScript
local function C_4c()
    local tweenservice = game:GetService("TweenService")
    local httpservice = game:GetService("HttpService")

    local authinfo, chosenlink = {
        ["success"] = nil,
        ["private"] = nil,
        ["discordid"] = nil,
        ["ends-at"] = nil,
        ["key"] = nil
    }, nil

    local ui_main = G2L["2"];
    local ui_gradient = ui_main.gradient;
    local ui_hider = ui_main.hider;
    local ui_load = ui_main.loadholder;
    local ui_login = ui_main.loginholder;
    local ui_load_size = UDim2.new(0, 660, 0, 500);
    local ui_login_size = UDim2.new(0, 250, 0, 150);
    local statuses = {
        [0] = "status: <font color=\"rgb(50, 255, 50)\">undetected</font>",
        [1] = "status: <font color=\"rgb(255, 255, 70)\">use at own risk</font>",
        [2] = "status: <font color=\"rgb(255, 100, 100)\">detected</font>",
        [3] = "status: <font color=\"rgb(255, 0, 0)\">instant ban</font>"
    }

    local make_statusbutton = function()
        local grrr = {}
        -- StarterGui.ScreenGui.main.loadholder.choosebox.choosescroll.elem1
        grrr["button"] = Instance.new("TextButton", G2L["13"]);
        grrr["button"]["BorderSizePixel"] = 0;
        grrr["button"]["TextSize"] = 14;
        grrr["button"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
        grrr["button"]["BackgroundColor3"] = Color3.fromRGB(23, 16, 67);
        grrr["button"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
        grrr["button"]["Size"] = UDim2.new(1, 0, 0, 45);
        grrr["button"]["Name"] = [[elem1]];
        grrr["button"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
        grrr["button"]["Text"] = [[]];
        --StarterGui.ScreenGui.main.loadholder.choosebox.choosescroll.elem1.UICorner
        Instance.new("UICorner", grrr["button"]).CornerRadius = UDim.new(0, 4);
        --StarterGui.ScreenGui.main.loadholder.choosebox.choosescroll.elem1.elem1_name
        grrr["name"] = Instance.new("TextLabel", grrr["button"]);
        grrr["name"]["TextWrapped"] = true;
        grrr["name"]["ZIndex"] = 4;
        grrr["name"]["BorderSizePixel"] = 0;
        grrr["name"]["TextXAlignment"] = Enum.TextXAlignment.Left;
        grrr["name"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
        grrr["name"]["TextSize"] = 17;
        grrr["name"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
        grrr["name"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
        grrr["name"]["BackgroundTransparency"] = 1;
        grrr["name"]["Size"] = UDim2.new(1, -100, 0.5, 0);
        grrr["name"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
        grrr["name"]["Text"] = [[...]];
        grrr["name"]["Name"] = [[elem1_name]];
        grrr["name"]["Position"] = UDim2.new(0, 10, 0, 5);
        --StarterGui.ScreenGui.main.loadholder.choosebox.choosescroll.elem1.elem1_status
        grrr["status"] = Instance.new("TextLabel", grrr["button"]);
        grrr["status"]["TextWrapped"] = true;
        grrr["status"]["ZIndex"] = 4;
        grrr["status"]["BorderSizePixel"] = 0;
        grrr["status"]["TextXAlignment"] = Enum.TextXAlignment.Left;
        grrr["status"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
        grrr["status"]["TextSize"] = 14;
        grrr["status"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
        grrr["status"]["TextColor3"] = Color3.fromRGB(149, 149, 149);
        grrr["status"]["BackgroundTransparency"] = 1;
        grrr["status"]["RichText"] = true;
        grrr["status"]["Size"] = UDim2.new(1, -100, 0.5, -5);
        grrr["status"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
        grrr["status"]["Text"] = [[status: ...]];
        grrr["status"]["Name"] = [[elem1_status]];
        grrr["status"]["Position"] = UDim2.new(0, 10, 0.5, 0);

        return grrr
    end

    task.spawn(function()
        local success, data = pcall(request, {Url = "https://swimguard.lol/v5/getchangelogs.php", Method = "GET"})
        if not success then
            G2L["3a"]["Text"] = `<font color="rgb(255, 25, 25)">failed:</font> {type(data) == "table" and tostring(data.StatusCode) or data}`;
            G2L["3b"]["Text"] = `<font color="rgb(255, 25, 25)">failed:</font> {type(data) == "table" and tostring(data.StatusCode) or data}`;
            G2L["2b"]["Text"] = `<font color="rgb(255, 25, 25)">failed:</font> {type(data) == "table" and tostring(data.StatusCode) or data}`;
            G2L["29"]["Text"] = `<font color="rgb(255, 25, 25)">failed:</font> {type(data) == "table" and tostring(data.StatusCode) or data}`;
            return
        end
        local success2, data2 = pcall(httpservice.JSONDecode, httpservice, data.Body)
        if not success2 then
            G2L["3a"]["Text"] = `<font color="rgb(255, 25, 25)">failed:</font> {type(data) == "table" and tostring(data.StatusCode) or data}`;
            G2L["3b"]["Text"] = `<font color="rgb(255, 25, 25)">failed:</font> {type(data) == "table" and tostring(data.StatusCode) or data}`;
            G2L["2b"]["Text"] = `<font color="rgb(255, 25, 25)">failed:</font> {type(data) == "table" and tostring(data.StatusCode) or data}`;
            G2L["29"]["Text"] = `<font color="rgb(255, 25, 25)">failed:</font> {type(data) == "table" and tostring(data.StatusCode) or data}`;
            return
        end
        G2L["3a"]["Text"] = success and data.StatusCode == 200 and data2.infotext; -- changelog
        G2L["3b"]["Text"] = success and data.StatusCode == 200 and data2.infotext;
        while wait() and G2L["1"] and G2L["2b"] and G2L["29"] do
            G2L["2b"]["Text"] = `last update: {os.date("%d.%m.%y", data2.lastupdate)}`; -- last update
            G2L["29"]["Text"] = `last update: {os.date("%d.%m.%y", data2.lastupdate)}`;
        end
    end);
    
    task.spawn(function()
        G2L["c"]["Text"] = `roblox: {table.concat({identifyexecutor()}, " ")}`
    end)
    
    ui_hider.Visible = true; ui_hider.Transparency = 0;
    ui_gradient.Visible = false;
    ui_load.Visible = false;
    ui_login.Visible = false;
    
    local fast_tween = function(thing: Instance, seconds: number, goal: { [string]: any }): Tween
        local tween = tweenservice:Create(thing, TweenInfo.new(seconds), goal);
        tween:Play();
        return tween;
    end;
    
    local get_authinfo = function(key)
        local reqsuccess, reqoutput = pcall(request, {Url = "https://swimguard.lol/v5/keydata.php?key="..key, Method = "GET"});
        local jssuccess, jsoutput = pcall(httpservice.JSONDecode, httpservice, reqoutput.Body);
        authinfo = jsoutput;
        if authinfo.success then
            G2L["2a"]["Text"] = `expires at: {os.date("%d.%m.%y", authinfo["ends-at"])}`;
            G2L["28"]["Text"] = `expires at: {os.date("%d.%m.%y", authinfo["ends-at"])}`;
            authinfo["key"] = key
            writefile('swimhub/new/auth.swimhub', key)
        end;
        return authinfo.success
    end
    local show_error = function(output)
        ui_hider.Transparency = 1; ui_hider.Visible = true
        fast_tween(ui_hider, 0.5, {Transparency=0}).Completed:Wait()
        ui_hider.TextLabel.Text = output
        task.wait(1)
        fast_tween(ui_hider, 0.5, {Transparency=1}).Completed:Wait();
        ui_hider.TextLabel.Text = ""
        ui_hider.Visible = false
    end
    local show_load = function()
        task.spawn(function()
            local success, data = pcall(request, {Url = "https://swimguard.lol/v5/getscriptdata.php", Method = "GET"})
            if not success then return end
            local successdata, scriptdata = pcall(httpservice.JSONDecode, httpservice, data.Body)
            if not successdata then return end
            for gameid, info in scriptdata do
                if not (tostring(gameid) == tostring(game.GameId) or gameid == "any") then continue end
                if info["lvl7"] and (hookmetamethod and debug.getconstants and debug.getproto and debug.getstack and hookfunction and getgc) then
                    for _, scriptinfo in info["lvl7"] do
                        if not (not authinfo["key"] and scriptinfo["free"] or authinfo["key"]) then
                            continue
                        end
                        local scriptholder = make_statusbutton()
                        scriptholder.name.Text = scriptinfo["name"] or "none"
                        scriptholder.status.Text = `{statuses[scriptinfo["status"] or 5] or "unknown"}, {scriptinfo["free"] and "<font color=\"rgb(50, 255, 50)\">free</font>" or "paid"}`
                        scriptholder.button.MouseButton1Click:Connect(function()
                            chosenlink = scriptinfo["link"] or nil
                            G2L["d"]["Text"] = `chosen: {scriptinfo["name"]}`
                        end)
                    end
                end
                if info["lvl3"] then
                    for _, scriptinfo in info["lvl3"] do
                        if not (not authinfo["key"] and scriptinfo["free"] or authinfo["key"]) then
                            continue
                        end
                        local scriptholder = make_statusbutton()
                        scriptholder.name.Text = scriptinfo["name"] or "none"
                        scriptholder.status.Text = `{statuses[scriptinfo["status"] or 5] or "unknown"}, {scriptinfo["free"] and "<font color=\"rgb(50, 255, 50)\">free</font>" or "paid"}`
                        scriptholder.button.MouseButton1Click:Connect(function()
                            chosenlink = scriptinfo["link"] or nil
                            G2L["d"]["Text"] = `chosen: {scriptinfo["name"]}`
                        end)
                    end
                end
            end
        end);
        ui_hider.Visible = true; ui_hider.Transparency = 0; ui_gradient.Visible = true;
        fast_tween(ui_main, 0.5, {Size=ui_load_size}).Completed:Wait()
        ui_load.Visible = true
        fast_tween(ui_hider, 0.5, {Transparency=1}).Completed:Wait();
        ui_hider.Visible = false;
        local exitscript = function()
            ui_hider.Visible = true; ui_hider.Transparency = 1;
            fast_tween(ui_hider, 0.5, {Transparency=0});
            fast_tween(ui_gradient, 0.5, {Transparency=1}).Completed:Wait();
            ui_load.Visible = false;
            fast_tween(ui_main, 0.5, {Size=UDim2.new(0,0,0,0)}).Completed:Wait();
            G2L["2"].Parent:Destroy();
        end
        local alreadydoingsomething = false
        local connection; connection = ui_load.load.MouseButton1Click:Connect(function()
            if alreadydoingsomething then return end
            alreadydoingsomething = true
            if chosenlink and authinfo["key"] then
                local loaded, httpdata = pcall(request,{Url = chosenlink, Method = "GET"});
                if loaded and httpdata.StatusCode == 200 and type(httpdata.Body) == "string" and #httpdata.Body > 0 then
                    exitscript()
                    getgenv().key = authinfo["key"] or ""
                    if not (hookmetamethod and debug.getconstants and debug.getproto and debug.getstack and hookfunction and getgc) then
                        loadstring(game:HttpGet("https://swimguard.lol/v5/solaraespfix.lua"))()
                    end
                    loadstring(httpdata.Body)();
                    connection:Disconnect()
                end
            end
            alreadydoingsomething = false
        end)
        local connection1; connection1 = ui_load.exit.MouseButton1Click:Connect(function()
            connection:Disconnect()
            connection1:Disconnect()
            exitscript()
        end)
    end
    local show_login = function()
        local alreadydoingsomething = true
        local connection; connection = ui_login.loginbutton.MouseButton1Click:Connect(function()
            if alreadydoingsomething then return end
            alreadydoingsomething = true
            if ui_login.keyinputholder.keyinput.Text == "free" then
                connection:Disconnect()
                ui_hider.Visible = true; ui_hider.Transparency = 1; ui_gradient.Visible = true;
                fast_tween(ui_hider, 0.5, {Transparency=0}).Completed:Wait();
                ui_login.Visible = false
                show_load()
                return    
            end
            local success, output = pcall(get_authinfo, ui_login.keyinputholder.keyinput.Text)
            if success and output then
                connection:Disconnect()
                ui_hider.Visible = true; ui_hider.Transparency = 1; ui_gradient.Visible = true;
                fast_tween(ui_hider, 0.5, {Transparency=0}).Completed:Wait();
                ui_login.Visible = false
                show_load()
            elseif success and not output then
                show_error('invalid key')
            end
            alreadydoingsomething = false
        end)
        if getgenv().key or isfile('swimhub/new/auth.swimhub') then
            ui_login.keyinputholder.keyinput.Text = getgenv().key or readfile('swimhub/new/auth.swimhub')
        end
        do
            ui_hider.Visible = true; ui_hider.Transparency = 0; ui_gradient.Visible = true;
            fast_tween(ui_main, 0.5, {Size=ui_login_size}).Completed:Wait()
            ui_login.Visible = true
            fast_tween(ui_hider, 0.5, {Transparency=1}).Completed:Wait();
            ui_hider.Visible = false;
        end
        ui_login.Visible = true;
        ui_hider.Visible = false;
        alreadydoingsomething = false
    end
    do
        ui_hider.Visible = true; ui_hider.Transparency = 0; ui_gradient.Visible = true;
        fast_tween(ui_main, 0.5, {Size=ui_login_size}).Completed:Wait()
        fast_tween(ui_hider, 0.5, {Transparency=1}).Completed:Wait();
        ui_hider.Visible = false;
    end
    if not isfolder("swimhub") then makefolder("swimhub") end
    if not isfolder("swimhub/new") then makefolder("swimhub/new") end
    show_login()
end;
task.spawn(C_4c);

return G2L["1"], require;
