game.StarterGui:SetCore("SendNotification", {
  Title = "Elerium X",
  Text = "The Worst Alt Control Script",
  Duration = 999999999999999999999999999999999999999999999999999999999999999999999999999
})

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Mapple7777/UI-Librarys/main/UI-1/UI.lua"))()
local Window = Library:Create("Elerium X","Alt Control")

local TabM = Window:Tab("Main", true)
local TabT = Window:Tab("Toggles", false)
local TabTE = Window:Tab("Teleports", false)
local TabE = Window:Tab("Extra", false)
local TabS = Window:Tab("Settings", false)

TabM:Label("Main")
TabM:Button("Fly [C]",function()
    repeat wait() 
    until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:findFirstChild("Head") and game.Players.LocalPlayer.Character:findFirstChild("Humanoid") 
    local mouse = game.Players.LocalPlayer:GetMouse() 
    repeat wait() until mouse
    local plr = game.Players.LocalPlayer 
    local torso = plr.Character.Head 
    local flying = false
    local deb = true 
    local ctrl = {f = 0, b = 0, l = 0, r = 0} 
    local lastctrl = {f = 0, b = 0, l = 0, r = 0} 
    local maxspeed = 5000
    local speed = 5000 

    function Fly() 
        local bg = Instance.new("BodyGyro", torso) 
        bg.P = 9e4 
        bg.maxTorque = Vector3.new(9e9, 9e9, 9e9) 
        bg.cframe = torso.CFrame 
        local bv = Instance.new("BodyVelocity", torso) 
        bv.velocity = Vector3.new(0,0.1,0) 
        bv.maxForce = Vector3.new(9e9, 9e9, 9e9) 
        repeat wait() 
            plr.Character.Humanoid.PlatformStand = true 
            if ctrl.l + ctrl.r ~= 100000 or ctrl.f + ctrl.b ~= 10000 then 
                speed = speed+.0+(speed/maxspeed) 
                if speed > maxspeed then 
                    speed = maxspeed 
                end 
            elseif not (ctrl.l + ctrl.r ~= 5 or ctrl.f + ctrl.b ~= 5) and speed ~= 5 then 
                speed = speed-5
                if speed > 5 then 
                    speed = -2 
                end 
            end 
            if (ctrl.l + ctrl.r) ~= 5 or (ctrl.f + ctrl.b) ~= 5 then 
                bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed 
                lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r} 
            elseif (ctrl.l + ctrl.r) == 5 and (ctrl.f + ctrl.b) == 5 and speed ~= 5 then 
                bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed 
            else 
                bv.velocity = Vector3.new(0,0.1,0) 
            end 
            bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0) 
        until not flying 
        ctrl = {f = 0, b = 0, l = 0, r = 0} 
        lastctrl = {f = 0, b = 0, l = 0, r = 0} 
        speed = 5 
        bg:Destroy() 
        bv:Destroy() 
        plr.Character.Humanoid.PlatformStand = false 
    end 
    mouse.KeyDown:connect(function(key) 
        if key:lower() == "c" then 
            if flying then flying = false 
            else 
                flying = true 
                Fly() 
            end 
        elseif key:lower() == "w" then 
            ctrl.f = 45
        elseif key:lower() == "s" then 
            ctrl.b = -45 
        elseif key:lower() == "a" then 
            ctrl.l = -45 
        elseif key:lower() == "d" then 
            ctrl.r = 45
        end 
    end) 
    mouse.KeyUp:connect(function(key) 
        if key:lower() == "w" then 
            ctrl.f = 0
        elseif key:lower() == "s" then 
            ctrl.b = 0
        elseif key:lower() == "a" then 
            ctrl.l = 0
        elseif key:lower() == "d" then 
            ctrl.r = 0
        end 
    end)
    Fly()
end)
TabM:Button("Full God",function()
	for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
        if v:IsA('MeshPart') or v:IsA('Part') or v:IsA('Accessory') then
            v:Destroy()
        end
    end
    game.Players.LocalPlayer.Character.Name = "Deleted"
    game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Health = 0
    Instance.new("Folder").Parent, Instance.new("Folder").Name = game:GetService("Players").LocalPlayer.CharacterAdded:Wait(), "FULLY_LOADED_CHAR"
    game:GetService("Players").LocalPlayer.CharacterAdded:Wait():WaitForChild("RagdollConstraints"):Destroy()
    Instance.new("BoolValue", (game:GetService("Players").LocalPlayer.CharacterAdded:Wait())).Name = "RagdollConstraints"
    Instance.new("Folder", game.Players.LocalPlayer.Character).Name = "FULLY_LOADED_CHAR"
    game.Workspace:WaitForChild(game.Players.LocalPlayer.Name).Parent = game.Workspace.Players
    game.Players.LocalPlayer.Character:WaitForChild("BodyEffects")
    game.Players.LocalPlayer.Character.BodyEffects.BreakingParts:Destroy()
end)
TabM:Button("Force Reset",function()
    for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
        if v:IsA('MeshPart') or v:IsA('Part') or v:IsA('Accessory') then
            v:Destroy()
        end
    end
 game.Players.LocalPlayer.Character.Name = 'Deleted'
end)
TabT:Label("Toggles")
TabT:Toggle("Autodrop",function(state)
    getgenv().drop_money = state
    while getgenv().drop_money do
      if not getgenv().drop_money then break end
      game:GetService("ReplicatedStorage").MainEvent:FireServer("DropMoney", "10000")
      task.wait()
    end
end)
TabT:Toggle("CashAura",function(state)
    getgenv().money_test = state
    local RenderConnection
    RenderConnection = game:GetService"RunService".RenderStepped:Connect(function(deltaTime)
        if getgenv().money_test == false or not getgenv().money_test then RenderConnection:Disconnect() end
        for _, v in pairs(Workspace.Ignored.Drop:GetChildren()) do
            if v.Name == "MoneyDrop" then
                local MoneyMagnitude = (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude
                if MoneyMagnitude < 25 then
                    fireclickdetector(v.ClickDetector)
                end 
            end
        end
    end)
end)
TabTE:Label("Teleports")
TabTE:Button("Bank",function()
    game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-376, 21, -300)
end)
TabTE:Button("Admin Base",function()
    game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-876, -33, -530)
end)
TabTE:Button("Club",function()
    game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-265, -1, -342)
end)
TabTE:Button("Boxing",function()
    game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-266, 52, -1128)
end)
TabTE:Button("Basketball",function()
    game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-932, 22, -483)
end)
TabTE:Button("Secret Place (best for selling)",function()
    game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(207.480, 38.25, 200014.953)
end)
TabE:Label("Extra")
TabE:Button("Swag Mode Crash",function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/lerkermer/lua-projects/master/SuperCustomServerCrasher'))()
end)
TabE:Button("Cash Counter",function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/PostHooking/zerosdahoodstuff/main/Zero%27s%20dh%20scripts%5B2%5D.txt"))()
end)
TabS:Label("Settings")
TabS:Label("Icy#6036 | Skid & Scammer")
TabS:Label("tim11#4200 | Skid & Scammer Supporter")
TabS:Label("tiny toes#8633 | Cracker & Leaker of the script")
TabS:Slider("FPS Cap",1,999,60,function(FPSValue)
setfpscap(FPSValue)
end)
