if (not _G.Flags) then
	_G.Flags = {
		HitboxExpander = {
			Size = 10;
			Enabled = true;
			Transparency = .7; 
			Part = "Head"; 
		};
	};
end

if (not _G.Loaded) then
	_G.Loaded = true;
	local RunService = game:GetService("RunService");
	local OriginalSizes = {};

	for i, v in pairs(game:GetService("ReplicatedStorage").Shared.entities.Player.Model:GetChildren()) do
		if v:IsA("BasePart") then
			OriginalSizes[v.Name] = v.Size;
		end
	end

	function IsPlayer(Model)
		return Model.ClassName == "Model" and Model:FindFirstChild("Head") and Model.PrimaryPart ~= nil;
	end

	function HitboxExpander(Model, Size, Hitbox)
		local Part = Model[Hitbox.Part];
		if (Hitbox.Enabled) then
			Part.Size = Vector3.new(Size, Size, Size); 
			Part.Transparency = Hitbox.Transparency; 
			Part.CanCollide = false; 
		else
			Part.Size = OriginalSizes[Hitbox.Part]; 
			Part.Transparency = 0; 
			Part.CanCollide = true; 
		end
	end

	RunService.Heartbeat:Connect(function()
		local Hitbox = _G.Flags.HitboxExpander;

		for i, v in pairs(workspace:GetChildren()) do
			if IsPlayer(v) then
				HitboxExpander(v, Hitbox.Size, Hitbox);
			end
		end
	end)
end
