local Config = {
    WindowName = "V.G Hub",
	Color = Color3.fromRGB(255,128,64),
	Keybind = Enum.KeyCode.RightControl
}

local RunService = game:GetService('RunService')
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Player = game:GetService("Players").LocalPlayer
local Remotes = ReplicatedStorage.Remotes
local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")
repeat wait() until game:IsLoaded() wait()
Player.Idled:connect(function()
game:GetService("VirtualUser"):ClickButton2(Vector2.new())
end)

-- this doesnt work since it was never backed up anywhere so i cant restore this one (i dont even know what its supposed to do anyways)
-- loadstring(game:HttpGet("https://raw.githubusercontent.com/1201for/V.G_Hub_Extras/main/Universal_Client_Bypass"))()

for i,v in pairs(getconnections(Player.Idled)) do
    v:Disable()
end 

RunService.Stepped:connect(
    function()
        sethiddenproperty(Player, "SimulationRadius", 1000)
    end
)

local function Float(v)
    if v:FindFirstChild("BodyForce") then
        return
    end
    local BodyForce = Instance.new("BodyForce")
    BodyForce.Force = v:GetMass() * Vector3.new(0, workspace.Gravity, 0)
    BodyForce.Parent = v
end

local Name = "Super Bomb Survival.json"

Des = {}
if makefolder then
    makefolder("V.G Hub")
end

local Settings

if
    not pcall(
        function()
            readfile("V.G Hub//" .. Name)
        end
    )
 then
    writefile("V.G Hub//" .. Name, HttpService:JSONEncode(Des))
end
if readfile("V.G Hub//" .. Name) then
Settings = HttpService:JSONDecode(readfile("V.G Hub//" .. Name))
end
local function Save()
    writefile("V.G Hub//" .. Name, HttpService:JSONEncode(Settings))
end


local OldNameCall = nil
OldNameCall = hookmetamethod(game, "__namecall", function(self, ...)
    local Args = {...}
    if  self.Name =="SendData" then
            return nil
    end
    if getnamecallmethod()=="BreakJoints" then
            return false
    end
    return OldNameCall(self, ...)
end)


RunService.Stepped:connect(function()
pcall(function()
Player.Character:FindFirstChild("Move")
Player.Character.Move:remove()
end) end) 


local LP = game:GetService("Players").LocalPlayer
local ts = game:GetService("TweenService")
local function Tween(A, B, C)
    if A and B then
        local Time = (B.Position - A.Position).magnitude/C
        local Info = TweenInfo.new(Time, Enum.EasingStyle.Linear)
        local Tween = ts:Create(A,Info,{CFrame = B})
        Tween:Play()
        wait(Time)
    end
end

local Invis = function()
local Clone = Player.Character.LowerTorso.Root:Clone()
Player.Character.LowerTorso.Root:Destroy()
Clone.Parent = Player.Character.LowerTorso
end 

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Zivixian/vg-hub-revival/main/library.lua"))()
local Window = Library:CreateWindow(Config, game:GetService("CoreGui"))

local Tab1 = Window:CreateTab("Super Bomb Survival")
local Tab2 = Window:CreateTab("UI Settings")

local Section1 = Tab1:CreateSection("")
local Section2 = Tab1:CreateSection("")
local Section3 = Tab2:CreateSection("Menu")
local Section4 = Tab2:CreateSection("Background")

if isnetworkowner then
local Toggle1 = Section1:CreateToggle("Push Away Bombs", Settings.AutoFarm2, function(State)
Settings.AutoFarm2 = State
RunService.Stepped:connect(
    function()
        for i, v in pairs(game:GetService("Workspace").Bombs:GetChildren()) do
            if not v:FindFirstChild("itemarrow") and v:IsA("BasePart") and isnetworkowner(v) and Settings.AutoFarm2 then
                v.CFrame = CFrame.new(9e9, 9e9, 9e9)
            elseif
                v:IsA("Model") and v:FindFirstChildWhichIsA("BasePart") and
                    isnetworkowner(v:FindFirstChildWhichIsA("BasePart")) and
                    Settings.AutoFarm2
             then
                v:MoveTo(Vector3.new(9e9, 9e9, 9e9))
            end
        end
    end
)
end)
end 
local Toggle1 = Section1:CreateToggle("AutoFarm", Settings.AutoFarm, function(State)
Settings.AutoFarm = State
RunService.Stepped:connect(
    function()
        pcall(
            function()
                if Settings.AutoFarm then
                    Player.Character:FindFirstChildWhichIsA("Humanoid"):ChangeState(11)
                end
            end
        )
    end
)
while Settings.AutoFarm do
    wait()
    pcall(
        function()
            Remotes.chooseOption:FireServer("afk", false)
            if Player.Character:FindFirstChild("Humanoid") then
                Player.Character.HumanoidRootPart.CFrame = CFrame.new(121, 272, 181)
                Tween(Player.Character.HumanoidRootPart,CFrame.new(120, 272, 28),100)
                Tween(Player.Character.HumanoidRootPart,CFrame.new(-34, 272, 29),100)
                Tween(Player.Character.HumanoidRootPart,CFrame.new(-34, 272, 183),100)
            end
        end
    )
end

end)


local Toggle1 = Section1:CreateToggle("Anti RagDoll", Settings.Rag, function(State)
Settings.Rag = State
local OldNameCall = nil
OldNameCall =
    hookmetamethod(
    game,
    "__namecall",
    function(...)
        local Args = {...}
        local Self = Args[1]
        if getnamecallmethod() == "FireServer" and tostring(Self) == "Ragdoll" and Args[2] == "on" and Settings.Rag then
            return Args[2] == "off"
        end
        return OldNameCall(...)
    end
)

end)
local Button1 = Section1:CreateButton("Bring All Balls to you", function()
for i,v in pairs(game:GetService("Workspace").lobby2:GetChildren()) do
if v.Name == "Ball" then
v.CFrame = Player.Character.HumanoidRootPart.CFrame 
end end end)


local Button1 = Section1:CreateButton("Bomb head", function()
Remotes.buyBombHead:InvokeServer()
end)

local Toggle1 = Section1:CreateToggle("FE BELL SPAM", nil, function(State)
fe = State
while fe do wait(0.5)
if game.SoundService.RespectFilteringEnabled == false then
for i,v in pairs(game.Workspace:GetDescendants()) do
if v:IsA("Sound") and v.SoundId == "rbxassetid://412988158" then
v:Play()
end
end
end
end

end)
local Toggle1 = Section1:CreateToggle("GodMode", nil, function(State)
ttt = State
while wait(5) and ttt do pcall(function()
if Player.Character:FindFirstChildWhichIsA("Humanoid") and not Player.Character:FindFirstChild("GodMode") then

local L = {}

    if Player.Character then
        if Player.Character:FindFirstChild("Humanoid") then
            for _, accessory in pairs(Player.Character.Humanoid:GetAccessories()) do
                table.insert(L, accessory:Clone())
            end
            Player.Character.Humanoid.Name = "1"
        end
        local l = Player.Character["1"]:Clone()
        l.Parent = Player.Character
        l.Name = "Humanoid"
        wait(0.1)
        Player.Character["1"]:Destroy()
        workspace.CurrentCamera.CameraSubject = Player.Character.Humanoid
        for _, accessory in pairs(L) do
            Player.Character.Humanoid:AddAccessory(accessory)
        end
        Player.Character.Animate.Disabled = true
        wait(0.1)
        Player.Character.Animate.Disabled = false
        --Tag:
        local Tag = Instance.new("BoolValue", Player.Character)
        Tag.Name = "GodMode"
        Tag.Value = true
        spawn(
            function()
                local Jumping = false
                local Died = false
                Player.Character.Humanoid.Died:connect(
                    function()
                        Died = true
                    end
                )
                UserInputService.InputBegan:connect(
                    function(i, v)
                        if not v and not Died then
                            Jumping = false
                            spawn(
                                function()
                                    repeat
                                        game:GetService("RunService").RenderStepped:Wait()
                                    until not Jumping or Died
                                end
                            )
                        else
                            repeat
                                game:GetService("RunService").RenderStepped:Wait()
                            until not Jumping
                        end
                    end
                )
                UserInputService.InputEnded:connect(
                    function(i, v)
                        if not v and not Died then
                            Jumping = false
                        end
                    end
                )
            end
        )
    end
end
 end) end  end)


local Toggle1 = Section2:CreateToggle("Enable WalkSpeed/JumpPower", Settings.Go, function(State)
Settings.Go = State
RunService.Stepped:connect(
    function()
        if Settings.Go then
            Player.Character:WaitForChild("Humanoid").WalkSpeed = Settings.WalkSpeed
            Player.Character:WaitForChild("Humanoid").JumpPower = Settings.JumpPower
            if not UserInputService.WindowFocusReleased then
                setfpscap(Settings.Fps)
            end
        end
    end
)

end)

local TextBox1 = Section2:CreateTextBox("Fps Cap", "Only numbers", true, function(Value)
    Settings.Fps = Value
end)

local TextBox1 = Section2:CreateTextBox("WalkSpeed", "Only numbers", true, function(Value)
    Settings.WalkSpeed = Value
end)
local TextBox1 = Section2:CreateTextBox("JumpPower", "Only numbers", true, function(Value)
    Settings.JumpPower = Value
end)

local TextBox1 = Section2:CreateTextBox("Seconds Until ServerHop", "Only numbers", true, function(Value)
    Settings.Seconds = Value
end)



local Toggle1 = Section2:CreateToggle("Infinite Jump", Settings.InfiniteJump, function(State)
Settings.InfiniteJump = State
UserInputService.JumpRequest:connect(
    function()
        if Settings.InfiniteJump then
            game:GetService "Players".LocalPlayer.Character:FindFirstChildOfClass "Humanoid":ChangeState("Jumping")
        end
    end
)
end)

local ESP = loadstring(game:HttpGet("https://raw.githubusercontent.com/1201for/V.G-Hub/main/Karrot-Esp"))()
local Toggle1 = Section1:CreateToggle("Enable Esp", Settings.Esp, function(State)
    Settings.Esp = State
    ESP:Toggle(Settings.Esp)
end)
local Toggle1 = Section1:CreateToggle("PLayer Esp", Settings.PlayerEsp, function(State)
    Settings.PlayerEsp = State
    ESP.Players = Settings.PlayerEsp
end)
local Toggle1 = Section1:CreateToggle("Tracers Esp", Settings.Tracers, function(State)
    Settings.Tracers = State
    ESP.Tracers = Settings.Tracers
end)
local Toggle1 = Section1:CreateToggle("Name Esp", Settings.EspNames, function(State)
    ESP.Names = Settings.EspNames
    Settings.EspNames = State
end)
local Toggle1 = Section1:CreateToggle("Boxes Esp", Settings.Boxes, function(State)
    Settings.Boxes = State
    ESP.Boxes = Settings.Boxes
end)

local Toggle1 = Section2:CreateToggle("Invisicam", Settings.Sorry, function(State)
Settings.Sorry = State
if Settings.Sorry then
    Player.DevCameraOcclusionMode = "Invisicam"
else
    Player.DevCameraOcclusionMode = "Zoom"
end
end)


local Toggle1 = Section2:CreateToggle("N Noclip", Settings.Sex1, function(State)
noclips = false
Settings.Sex1 = State
Player:GetMouse().KeyDown:connect(
    function(v)
        if v == "n" then
            if Settings.Sex1 then
                noclips = not noclips
                for i, v in pairs(Player.Character:GetChildren()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = false
                    end
                end
            end
        end
    end
)
RunService.Stepped:connect(
    function()
        if noclips then
            for i, v in pairs(Player.Character:GetChildren()) do
                if v:IsA("BasePart") then
                    v.CanCollide = false
                end
            end
        end
    end
)

end)

local Toggle1 = Section2:CreateToggle("G Noclip", Settings.Sex, function(State)
Settings.Sex = State
noclip = false
RunService.Stepped:connect(
    function()
        if noclip then
            Player.Character.Humanoid:ChangeState(11)
        end
    end
)
mouse = Player:GetMouse()
Player:GetMouse().KeyDown:connect(
    function(v)
        if v == "g" then
            if Settings.Sex then
                noclip = not noclip
                Player.Character.Humanoid:ChangeState(11)
            end
        end
    end
)
end)
local Toggle1 = Section2:CreateToggle("H Fly", Settings.Sex2, function(State)
Settings.Sex2 = State
local Max = 0
local Players = game.Players
local LP = Players.LocalPlayer
local Mouse = LP:GetMouse()
Mouse.KeyDown:connect(
    function(k)
        if k:lower() == "h" then
            Max = Max + 1
            getgenv().Fly = false
            if Settings.Sex2 then
                local T = LP.Character:FindFirstChild("HumanoidRootPart") 
                local S = {
                    F = 0,
                    B = 0,
                    L = 0,
                    R = 0
                }
                local S2 = {
                    F = 0,
                    B = 0,
                    L = 0,
                    R = 0
                }
                local SPEED = 5
                local function FLY()
                    getgenv().Fly = true
                    local BodyGyro = Instance.new("BodyGyro", T)
                    local BodyVelocity = Instance.new("BodyVelocity", T)
                    BodyGyro.P = 9e4
                    BodyGyro.maxTorque = Vector3.new(9e9, 9e9, 9e9)
                    BodyGyro.cframe = T.CFrame
                    BodyVelocity.velocity = Vector3.new(0, 0.1, 0)
                    BodyVelocity.maxForce = Vector3.new(9e9, 9e9, 9e9)
                    spawn(
                        function()
                            repeat
                                wait()
                                LP.Character.Humanoid.PlatformStand = false
                                if S.L + S.R ~= 0 or S.F + S.B ~= 0 then
                                    SPEED = 200
                                elseif not (S.L + S.R ~= 0 or S.F + S.B ~= 0) and SPEED ~= 0 then
                                    SPEED = 0
                                end
                                if (S.L + S.R) ~= 0 or (S.F + S.B) ~= 0 then
                                    BodyVelocity.velocity =
                                        ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (S.F + S.B)) +
                                        ((game.Workspace.CurrentCamera.CoordinateFrame *
                                            CFrame.new(S.L + S.R, (S.F + S.B) * 0.2, 0).p) -
                                            game.Workspace.CurrentCamera.CoordinateFrame.p)) *
                                        SPEED
                                    S2 = {
                                        F = S.F,
                                        B = S.B,
                                        L = S.L,
                                        R = S.R
                                    }
                                elseif (S.L + S.R) == 0 and (S.F + S.B) == 0 and SPEED ~= 0 then
                                    BodyVelocity.velocity =
                                        ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (S2.F + S2.B)) +
                                        ((game.Workspace.CurrentCamera.CoordinateFrame *
                                            CFrame.new(S2.L + S2.R, (S2.F + S2.B) * 0.2, 0).p) -
                                            game.Workspace.CurrentCamera.CoordinateFrame.p)) *
                                        SPEED
                                else
                                    BodyVelocity.velocity = Vector3.new(0, 0.1, 0)
                                end
                                BodyGyro.cframe = game.Workspace.CurrentCamera.CoordinateFrame
                            until not getgenv().Fly
                            S = {
                                F = 0,
                                B = 0,
                                L = 0,
                                R = 0
                            }
                            S2 = {
                                F = 0,
                                B = 0,
                                L = 0,
                                R = 0
                            }
                            SPEED = 0
                            BodyGyro:destroy()
                            BodyVelocity:destroy()
                            LP.Character.Humanoid.PlatformStand = false
                        end
                    )
                end
                Mouse.KeyDown:connect(
                    function(k)
                        if k:lower() == "w" then
                            S.F = 1
                        elseif k:lower() == "s" then
                            S.B = -1
                        elseif k:lower() == "a" then
                            S.L = -1
                        elseif k:lower() == "d" then
                            S.R = 1
                        end
                    end
                )
                Mouse.KeyUp:connect(
                    function(k)
                        if k:lower() == "w" then
                            S.F = 0
                        elseif k:lower() == "s" then
                            S.B = 0
                        elseif k:lower() == "a" then
                            S.L = 0
                        elseif k:lower() == "d" then
                            S.R = 0
                        end
                    end
                )
                FLY()
                if Max == 2 then
                    getgenv().Fly = false
                    Max = 0
                end
            end
        end
    end
)
end)
local Toggle1 = Section2:CreateToggle("AutoServerHop", Settings.ServerHop, function(State)
Settings.ServerHop = State
spawn(function()
while Settings.ServerHop do wait(Settings.Seconds)
local PlaceID = game.PlaceId
local AllIDs = {}
local foundAnything = ""
local actualHour = os.date("!*t").hour
local Deleted = false
local File = pcall(function()
    AllIDs = HttpService:JSONDecode(readfile("NotSameServers.json"))
end)
if not File then
    table.insert(AllIDs, actualHour)
    writefile("NotSameServers.json", HttpService:JSONEncode(AllIDs))
end
function TPReturner()
    local Site;
    if foundAnything == "" then
        Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
    else
        Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
    end
    local ID = ""
    if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
        foundAnything = Site.nextPageCursor
    end
    local num = 0;
    for i,v in pairs(Site.data) do
        local Possible = true
        ID = tostring(v.id)
        if tonumber(v.maxPlayers) > tonumber(v.playing) then
            for _,Existing in pairs(AllIDs) do
                if num ~= 0 then
                    if ID == tostring(Existing) then
                        Possible = false
                    end
                else
                    if tonumber(actualHour) ~= tonumber(Existing) then
                        local delFile = pcall(function()
                            delfile("NotSameServers.json")
                            AllIDs = {}
                            table.insert(AllIDs, actualHour)
                        end)
                    end
                end
                num = num + 1
            end
            if Possible == true then
                table.insert(AllIDs, ID)
                wait()
                pcall(function()
                    writefile("NotSameServers.json", HttpService:JSONEncode(AllIDs))
                    wait()
                    game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, Player)
                end)
                wait(4)
            end
        end
    end
end

function Teleport()
    while wait() do
        pcall(function()
            TPReturner()
            if foundAnything ~= "" then
                TPReturner()
            end
        end)
    end
end

-- If you'd like to use a script before server hopping (Like a Automatic Chest collector you can put the Teleport() after it collected everything.
Teleport() 
end 
end)
end)
local Button1 = Section2:CreateButton("Anti Lag", function()
for _, v in pairs(Workspace:GetDescendants()) do
    if v:IsA("BasePart") and not v.Parent:FindFirstChild("Humanoid") then
        v.Material = Enum.Material.SmoothPlastic
        if v:IsA("Texture") then
            v:Destroy()
        end
    end
end
end)

local Button1 = Section2:CreateButton("Teleport to RandomPlayer", function()
local randomPlayer = game.Players:GetPlayers()[math.random(1, #game.Players:GetPlayers())]

Player.Character.HumanoidRootPart.CFrame =
    CFrame.new(
    Vector3.new(
        randomPlayer.Character.Head.Position.X,
        randomPlayer.Character.Head.Position.Y,
        randomPlayer.Character.Head.Position.Z
    )
)
end)
local Button1 = Section2:CreateButton("Lag Switch F3", function()
local ass = false
local bitch = settings()

game:service "UserInputService".InputEnded:connect(
    function(i)
        if i.KeyCode == Enum.KeyCode.F3 then
            ass = not ass
            bitch.Network.IncomingReplicationLag = ass and 10 or 0
        end
    end
)
end) 

local Button1 = Section2:CreateButton("ServerHop", function()
local PlaceID = game.PlaceId
local AllIDs = {}
local foundAnything = ""
local actualHour = os.date("!*t").hour
local Deleted = false
local File = pcall(function()
    AllIDs = HttpService:JSONDecode(readfile("NotSameServers.json"))
end)
if not File then
    table.insert(AllIDs, actualHour)
    writefile("NotSameServers.json", HttpService:JSONEncode(AllIDs))
end
function TPReturner()
    local Site;
    if foundAnything == "" then
        Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
    else
        Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
    end
    local ID = ""
    if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
        foundAnything = Site.nextPageCursor
    end
    local num = 0;
    for i,v in pairs(Site.data) do
        local Possible = true
        ID = tostring(v.id)
        if tonumber(v.maxPlayers) > tonumber(v.playing) then
            for _,Existing in pairs(AllIDs) do
                if num ~= 0 then
                    if ID == tostring(Existing) then
                        Possible = false
                    end
                else
                    if tonumber(actualHour) ~= tonumber(Existing) then
                        local delFile = pcall(function()
                            delfile("NotSameServers.json")
                            AllIDs = {}
                            table.insert(AllIDs, actualHour)
                        end)
                    end
                end
                num = num + 1
            end
            if Possible == true then
                table.insert(AllIDs, ID)
                wait()
                pcall(function()
                    writefile("NotSameServers.json", HttpService:JSONEncode(AllIDs))
                    wait()
                    game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, Player)
                end)
                wait(4)
            end
        end
    end
end

function Teleport()
    while wait() do
        pcall(function()
            TPReturner()
            if foundAnything ~= "" then
                TPReturner()
            end
        end)
    end
end

-- If you'd like to use a script before server hopping (Like a Automatic Chest collector you can put the Teleport() after it collected everything.
Teleport() 
end)
local Button1 = Section2:CreateButton("Rejoin", function()
game:GetService("TeleportService"):Teleport(game.PlaceId, Player) end)


local Button1 = Section2:CreateButton("Save Settings", function()
Save()
end)
local Toggle3 = Section3:CreateToggle("UI Toggle", nil, function(State)
	Window:Toggle(State)
end)
Toggle3:CreateKeybind(tostring(Config.Keybind):gsub("Enum.KeyCode.", ""), function(Key)
	Config.Keybind = Enum.KeyCode[Key]
end)
Toggle3:SetState(true)
Section3:CreateLabel("Credits DekuDimz#7960")
Section3:CreateLabel("Credits AlexR32#3232 Ui")
Section3:CreateLabel("Credits The3Bakers")
local Colorpicker3 = Section3:CreateColorpicker("UI Color", function(Color)
	Window:ChangeColor(Color)
end)
Colorpicker3:UpdateColor(Config.Color)

-- credits to jan for patterns
local Dropdown3 = Section4:CreateDropdown("Image", {"Default","Hearts","Abstract","Hexagon","Circles","Lace With Flowers","Floral"}, function(Name)
	if Name == "Default" then
		Window:SetBackground("2151741365")
	elseif Name == "Hearts" then
		Window:SetBackground("6073763717")
	elseif Name == "Abstract" then
		Window:SetBackground("6073743871")
	elseif Name == "Hexagon" then
		Window:SetBackground("6073628839")
	elseif Name == "Circles" then
		Window:SetBackground("6071579801")
	elseif Name == "Lace With Flowers" then
		Window:SetBackground("6071575925")
	elseif Name == "Floral" then
		Window:SetBackground("5553946656")
	end
end)
Dropdown3:SetOption("Default")

local Colorpicker4 = Section4:CreateColorpicker("Color", function(Color)
	Window:SetBackgroundColor(Color)
end)
Colorpicker4:UpdateColor(Color3.new(1,1,1))

local Slider3 = Section4:CreateSlider("Transparency",0,1,nil,false, function(Value)
	Window:SetBackgroundTransparency(Value)
end)
Slider3:SetValue(0)

local Slider4 = Section4:CreateSlider("Tile Scale",0,1,nil,false, function(Value)
	Window:SetTileScale(Value)
end)
Slider4:SetValue(0.5)

game.StarterGui:SetCore("SendNotification", {Title = "Warning", Text = "RightControl to toggle if the gui does not show up then the game is not supported please try again later or never if the game is supported the gui will pop up reguardless GOOD DAY!",Duration = 15})
game.StarterGui:SetCore(
    "SendNotification",
    {
        Title = "Credis",
        Text = "CharWar Serverhops Toxic Mods screen thingy And Kiriot22 esp,IY for fly script inspiration,Staylin Save Settings,Felix for being sexy, E621 Anticheat bypasses"
    }
)
