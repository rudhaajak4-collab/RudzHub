-- RudzHub V4.1 - WITH CLOSE BUTTON [FIXED]
pcall(function() game.CoreGui.RudzAnimV4:Destroy() end)
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "RudzAnimV4"
local f = Instance.new("Frame", gui)
f.Size = UDim2.new(0, 260, 0, 420)
f.Position = UDim2.new(0.5, -130, 0.5, -210)
f.BackgroundColor3 = Color3.fromRGB(15,15,15)
f.Active = true f.Draggable = true
Instance.new("UICorner", f).CornerRadius = UDim.new(0,14)
local st = Instance.new("UIStroke", f) st.Color = Color3.fromRGB(255,0,0) st.Thickness = 2.5

local title = Instance.new("TextLabel", f)
title.Size = UDim2.new(1, -40, 0, 40) title.Position = UDim2.new(0,10,0,0)
title.Text = "RUDZHUB V4.1" title.BackgroundTransparency = 1
title.TextColor3 = Color3.new(1,1,1) title.Font = Enum.Font.GothamBlack title.TextSize = 16
title.TextXAlignment = Enum.TextXAlignment.Left

-- TOMBOL X CLOSE
local close = Instance.new("TextButton", f)
close.Size = UDim2.new(0, 30, 0, 30) close.Position = UDim2.new(1, -35, 0, 5)
close.Text = "❌" close.BackgroundColor3 = Color3.fromRGB(255,0,0)
close.TextColor3 = Color3.new(1,1,1) close.Font = Enum.Font.GothamBold close.TextSize = 16
Instance.new("UICorner", close).CornerRadius = UDim.new(0,8)
close.MouseButton1Click:Connect(function() gui:Destroy() end)

local Packs = {
    Ninja = {Idle = 658832408, Walk = 658831143, Run = 658830056, Jump = 658832070},
    Robot = {Idle = 619521748, Walk = 619522849, Run = 619522386, Jump = 619522088},
    Zombie = {Idle = 619535834, Walk = 619537468, Run = 619536621, Jump = 619536283},
    Toy = {Idle = 973771666, Walk = 973767371, Run = 973766674, Jump = 973770652},
    Vampire = {Idle = 1113742618, Walk = 1113741192, Run = 1113740510, Jump = 1113742359},
    Cartoony = {Idle = 837011741, Walk = 837010234, Run = 837009922, Jump = 837011171},
    Bubbly = {Idle = 1018553897, Walk = 1018549681, Run = 1018548665, Jump = 1018553240},
    Stylish = {Idle = 619511648, Walk = 619512767, Run = 619512153, Jump = 619511974},
}

local Players = game:GetService("Players")
local plr = Players.LocalPlayer

local function applyPack(pack)
    local char = plr.Character
    if not char then return end
    local animate = char:FindFirstChild("Animate")
    if animate then
        animate.idle.Animation1.AnimationId = "rbxassetid://"..pack.Idle
        animate.walk.WalkAnim.AnimationId = "rbxassetid://"..pack.Walk
        animate.run.RunAnim.AnimationId = "rbxassetid://"..pack.Run
        animate.jump.JumpAnim.AnimationId = "rbxassetid://"..pack.Jump
        animate.climb.ClimbAnim.AnimationId = "rbxassetid://"..pack.Idle
    end
    -- force reset anim
    local hum = char:FindFirstChildOfClass("Humanoid")
    if hum then hum.Jump = true end
end

local function btn(name, y, pack)
    local b = Instance.new("TextButton", f)
    b.Size = UDim2.new(0.9,0,0,32) b.Position = UDim2.new(0.05,0,0,y)
    b.Text = name b.BackgroundColor3 = Color3.fromRGB(35,35,35)
    b.TextColor3 = Color3.new(1,1,1) b.Font = Enum.Font.GothamBold b.TextSize = 12
    Instance.new("UICorner", b).CornerRadius = UDim.new(0,8)
    b.MouseButton1Click:Connect(function() applyPack(pack) end)
end

btn("NINJA PACK", 50, Packs.Ninja)
btn("ROBOT PACK", 85, Packs.Robot)
btn("ZOMBIE PACK", 120, Packs.Zombie)
btn("TOY PACK - KOCAK", 155, Packs.Toy)
btn("VAMPIRE PACK", 190, Packs.Vampire)
btn("CARTOONY PACK", 225, Packs.Cartoony)
btn("BUBBLY PACK", 260, Packs.Bubbly)
btn("STYLISH PACK", 295, Packs.Stylish)

local monkey = Instance.new("TextButton", f)
monkey.Size = UDim2.new(0.9,0,0,34) monkey.Position = UDim2.new(0.05,0,0,335)
monkey.Text = "MONKEY TROLL 🐒" monkey.BackgroundColor3 = Color3.fromRGB(255,0,0)
monkey.TextColor3 = Color3.new(1,1,1) monkey.Font = Enum.Font.GothamBlack
Instance.new("UICorner", monkey).CornerRadius = UDim.new(0,8)
monkey.MouseButton1Click:Connect(function()
    local hum = plr.Character and plr.Character:FindFirstChildOfClass("Humanoid")
    if hum then
        local anim = Instance.new("Animation")
        anim.AnimationId = "rbxassetid://3334409508"
        hum:LoadAnimation(anim):Play()
    end
end)

local reset = Instance.new("TextButton", f)
reset.Size = UDim2.new(0.9,0,0,28) reset.Position = UDim2.new(0.05,0,0,375)
reset.Text = "RESET CHARACTER" reset.BackgroundColor3 = Color3.fromRGB(60,60,60)
reset.TextColor3 = Color3.new(1,1,1) Instance.new("UICorner", reset).CornerRadius = UDim.new(0,8)
reset.MouseButton1Click:Connect(function() plr.Character:BreakJoints() end)
