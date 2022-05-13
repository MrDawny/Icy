--[[
This is not a exact replica
Reason for that is because the real "Minty X" is not released
So it would be impossible to get the real source
With the screenshots of the script I was able to make a almost exact replica
Dumbass icy decided to use the Vape V4 ui-lib and claimed he paid someone to make it
I know all the sources he has so I was able to replicate what would be in his script
Probably none of the value names will be the same but most the code will

Made/"cracked" by tiny toes#8633
]]
local MintyXLib = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/Vape.txt")()

local MintyX = MintyXLib:Window("Minty X | Selling Menu",Color3.fromRGB(44, 120, 224), Enum.KeyCode.RightControl)


local tab1 = MintyX:Tab("Home")
local tab2 = MintyX:Tab("Teleports")
local tab3 = MintyX:Tab("Tools")
local tab4 = MintyX:Tab("Misc")
local tab5 = MintyX:Tab("Credits")

tab1:Button("Fly [C]", function()
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

tab1:Button("Full God", function()
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

tab1:Button("Force Reset", function()
    for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
        if v:IsA('MeshPart') or v:IsA('Part') or v:IsA('Accessory') then
            v:Destroy()
        end
    end
    game.Players.LocalPlayer.Character.Name = 'Deleted'
end)

tab1:Button("Crash", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/lerkermer/lua-projects/master/SuperCustomServerCrasher'))()
end)

tab1:Toggle("Auto Drop", false, function(t)
    getgenv().drop_money = t
    while getgenv().drop_money do
        if not getgenv().drop_money then break end
        game:GetService("ReplicatedStorage").MainEvent:FireServer("DropMoney", "10000")
        task.wait()
    end
end)

tab1:Toggle("Cash Aura", false, function(state)
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

tab1:Toggle("Loop Destroy Cash", false, function(state)
    getgenv().Get_Anti = state
    while getgenv().Get_Anti do
        if not getgenv().Get_Anti then
            break
        end
        for i, v in pairs(game.Workspace.Ignored.Drop:GetChildren()) do
            if v.Name == "MoneyDrop" then
                v:Destroy()
            end
            task.wait()
        end
    end
end)

tab2:Button("Bank", function()
    game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-376, 21, -300)
end)

tab2:Button("Admin Base", function()
    game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-876, -33, -530)
end)

tab2:Button("Club", function()
    game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-265, -1, -342)
end)

tab2:Button("Boxing", function()
    game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-266, 52, -1128)
end)

tab2:Button("Basketball", function()
    game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-932, 22, -483)
end)

tab2:Button("Secret Place (best for selling)", function()
    game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(207.480, 38.25, 200014.953)
end)

tab3:Button("Cash Counter", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/PostHooking/zerosdahoodstuff/main/Zero%27s%20dh%20scripts%5B2%5D.txt"))()
end)

tab3:Button("Low GFX", function()
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
    for i,v in pairs(g:GetDescendants()) do
        if v:IsA("Part") or v:IsA("Union") or v:IsA("MeshPart") then
            v.Material = "Plastic"
            v.Reflectance = 0
        elseif v:IsA("Decal") and decalsyeeted then
            v.Transparency = 1
        elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
            v.Lifetime = NumberRange.new(0)
        end
    end
end)

tab3:Button("3D Rendering", function()
    local c = Instance.new("ScreenGui")
    local d = Instance.new("Frame")
    local e = Instance.new("TextLabel")
    local f = Instance.new("TextLabel")
    c.Name = "AltControl"
    c.Parent = game.CoreGui
    c.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    d.Parent = c
    d.AnchorPoint = Vector2.new(0.5, 0.5)
    d.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    d.BorderColor3 = Color3.fromRGB(0, 0, 0)
    d.BorderSizePixel = 100
    d.Position = UDim2.new(0.5, 0, 0.5, 0)
    d.Size = UDim2.new(1, 0, 1, 0)
    e.Parent = d
    e.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    e.BackgroundTransparency = 1.000
    e.Position = UDim2.new(0.437655866, 0, 0.380451113, 0)
    e.Size = UDim2.new(0, 200, 0, 50)
    e.Font = Enum.Font.SourceSans
    e.Text = "3D rendering off"
    e.TextColor3 = Color3.fromRGB(255, 255, 255)
    e.TextSize = 50.000
    f.Parent = d
    f.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    f.BackgroundTransparency = 1.000
    f.Position = UDim2.new(0.437655866, 0, 0.455639064, 0)
    f.Size = UDim2.new(0, 200, 0, 50)
    f.Font = Enum.Font.SourceSans
    f.Text = "Name"
    f.TextColor3 = Color3.fromRGB(255, 255, 255)
    f.TextSize = 50.000
    local function g()
        local h = Instance.new("LocalScript", f)
        h.Parent.Text = game.Players.LocalPlayer.Name
    end
    coroutine.wrap(g)()
end)

tab3:Toggle("Anchor/Freeze", false,  function(t)
    if t == true then
        game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
    end
    if t == false then
        game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
    end
end)

local kiriot22ESP = loadstring(game:HttpGet("https://raw.githubusercontent.com/NighterEpic/KiriotESP/main/YesEpic"))()
kiriot22ESP:Toggle(true)
kiriot22ESP.Boxes = false
kiriot22ESP.Tracers = false
kiriot22ESP.Names = false

tab4:Toggle("ESP", false, function(t) --idk how he did this but im assuming this is how. also dont know what esp he used, this is js the one from dimag
    getgenv().toggle1 = t
    while getgenv().toggle1 do wait()
        kiriot22ESP.Boxes = true
        kiriot22ESP.Tracers = true
        kiriot22ESP.Names = true
        if not getgenv().toggle1 then
            kiriot22ESP.Boxes = false
            kiriot22ESP.Tracers = false
            kiriot22ESP.Names = false
        end
    end
end)

tab4:Toggle("Hide Name", false, function(t)
    getgenv().toggle1 = t
    while getgenv().toggle1 do wait()
        if game.Players.LocalPlayer.Character:FindFirstChild("In-gameMask") then
            game.Players.LocalPlayer.Character:FindFirstChild("In-gameMask"):FindFirstChildWhichIsA("Model"):Destroy()
            game.Players.LocalPlayer.Character:FindFirstChild("In-gameMask"):FindFirstChild('Handle'):Destroy()
        end
    end
end)

tab4:Button("Vibe", function()
    local y = Instance.new("Folder", game.Workspace)
    local z = Instance.new("Animation", y)
    z.AnimationId = "rbxassetid://3189773368"
    local A = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(z)
    A:Play()
end)

tab4:Button("UnVibe", function()
    for r, s in pairs(game.Players.LocalPlayer.Character.Humanoid:GetPlayingAnimationTracks()) do
        if s.Name == "Animation" or s.Name == "Animation1" then
            s:Stop()
        end
    end
end)

tab4:Button("Chuckle", function()
    local y = Instance.new("Folder", game.Workspace)
    local z = Instance.new("Animation", y)
    z.AnimationId = "rbxassetid://3189776546"
    local A = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(z)
    A:Play()
end)

tab4:Button("UnChuckle", function()
    for r, s in pairs(game.Players.LocalPlayer.Character.Humanoid:GetPlayingAnimationTracks()) do
        if s.Name == "Animation" or s.Name == "Animation1" then
            s:Stop()
        end
    end
end)

tab5:Label("Icy#6036 Skid | Scammer")
tab5:Label("tim#4200 Skid & Scammer Supporter")
tab5:Label("Minty X Productions All Rights Reserved")
tab5:Label("Not sure wtf that means ^^^, its not copyrighted")
tab5:Label("Leaked/\"cracked\" by tiny toes#8633")

game.StarterGui:SetCore("SendNotification", {Title = "Minty X", Text = "The Worst Selling Menu", Duration = math.huge})
game.StarterGui:SetCore("SendNotification", {Title = "V0.1", Text = "Last Updated 5/12/22 Minty X Production ❄️🥶", Duration = math.huge})