-- RudzHub EMOTE.V2 [FE Visible]
pcall(function() game.CoreGui.RudzEmoteV2:Destroy() end)
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "RudzEmoteV2"
local f = Instance.new("Frame", gui)
f.Size = UDim2.new(0, 240, 0, 380)
f.Position = UDim2.new(0.65,0,0.2,0)
f.BackgroundColor3 = Color3.fromRGB(15,15,15)
f.Active = true f.Draggable = true
Instance.new("UICorner", f).CornerRadius = UDim.new(0,14)
local st = Instance.new("UIStroke", f)
st.Color = Color3.fromRGB(255,0,0) st.Thickness = 2.5
local title = Instance.new("TextLabel", f)
title.Size = UDim2.new(1,0,0,40)
title.Text = "RUDZHUB EMOTE.V2 [FE]"
title.BackgroundTransparency = 1
title.TextColor3 = Color3.new(1,1,1)
title.Font = Enum.Font.GothamBlack title.TextSize = 16
local Players = game:GetService("Players")
local plr = Players.LocalPlayer
local function play(id)
    local char = plr.Character
    if not char then return end
    local hum = char:FindFirstChild("Humanoid")
    if not hum then return end
    for _,t in pairs(hum:GetPlayingAnimationTracks()) do t:Stop() end
    local anim = Instance.new("Animation")
    anim.AnimationId = "rbxassetid://"..id
    local track = hum:LoadAnimation(anim)
    track:Play()
end
local function btn(name, y, id, color)
    local b = Instance.new("TextButton", f)
    b.Size = UDim2.new(0.9,0,0,34) b.Position = UDim2.new(0.05,0,0,y)
    b.Text = name b.BackgroundColor3 = color or Color3.fromRGB(35,35,35)
    b.TextColor3 = Color3.new(1,1,1) b.Font = Enum.Font.GothamBold b.TextSize = 13
    Instance.new("UICorner", b).CornerRadius = UDim.new(0,8)
    b.MouseButton1Click:Connect(function() play(id) end)
    return b
end
btn("MONKEY TROLL", 45, 3333499508)
btn("STYLISH SPIN", 85, 3360686498)
btn("HYPE / FLOSS", 125, 3695333486)
btn("GOOFY RUN", 165, 3570018934)
btn("BALLET", 205, 3338049715)
btn("ROBOT DANCE", 245, 3333851423)
btn("ZOMBIE SHUFFLE", 285, 3541118490)
local stop = btn("STOP EMOTE", 330, 0, Color3.fromRGB(150,0,0))
stop.MouseButton1Click:Connect(function()
    local hum = plr.Character and plr.Character:FindFirstChild("Humanoid")
    if hum then for _,t in pairs(hum:GetPlayingAnimationTracks()) do t:Stop() end end
end)
