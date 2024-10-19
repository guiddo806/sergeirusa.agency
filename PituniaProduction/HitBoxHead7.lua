if (not _G.Flags) then
	_G.Flags = {
		HitboxExpander = {
			Size = 7;
			Enabled = true;
			Transparency = .7; 
			Part = "Head"; 
		};
	};
end

if (not _G.Loaded) then
	_G.Loaded = true;
	local ReplicatedStorage = game:GetService("ReplicatedStorage");
	local RunService = game:GetService("RunService");
	local Items = ReplicatedStorage:WaitForChild("HandModels");
	local CoreGui = game:GetService("CoreGui");
	local CurrentCamera = workspace.CurrentCamera;
	local IgnoreFolder = workspace:WaitForChild("Ignore");
	local OriginalSizes = {};
	local WeaponInfo = {};

	local SleepAnimationId = "rbxassetid://13280887764"
	
	for i,v in pairs(ReplicatedStorage.Shared.entities.Player.Model:GetChildren()) do
		if v:IsA("BasePart") then
			OriginalSizes[v.Name] = v.Size;
		end
	end

	for i,v in pairs(Items:GetChildren()) do
		v:SetAttribute("RealName",v.Name);
	end

	function IsSleeping(Player)
		local Animations = Player.AnimationController:GetPlayingAnimationTracks();
		for i,v in pairs(Animations) do
			if (v.IsPlaying and v.Animation.AnimationId == SleepAnimationId) then
				return true;
			end
		end
		return false;
	end

	function PlayerWeapon(Player)
		local Model = Player:FindFirstChildOfClass("Model");
		return Model and Model:GetAttribute("RealName") or "None";
	end

	function IsPlayer(Model)
		return Model.ClassName == "Model" and Model:FindFirstChild("Head") and Model.PrimaryPart~=nil;
	end

	function HitboxExpander(Model, Size, Hitbox)
		if (Hitbox.Enabled) then
			local Part = Model[Hitbox.Part];
			Part.Size = Vector3.new(Size, Size, Size);
			Part.Transparency = Hitbox.Transparency;
			Part.CanCollide = false;
		else
			local Part = Model[Hitbox.Part];
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
