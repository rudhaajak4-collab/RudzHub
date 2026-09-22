-- RudzHub - Creator & Verified System
-- by rudhaajak4-collab

local plr = game.Players.LocalPlayer
local enabled = false
local mode = "CREATOR"

local function clear(char)
    local head = char:FindFirstChild("Head")
    if head then
        for _,v in pairs(head:GetChildren()) do
            if v:IsA("BillboardGui") then v:Destroy() end
        end
    end
end

local function make(char)
    if not enabled then return end
    local head = char:WaitForChild("Head")
    clear(char)
    local bg = Instance.new("BillboardGui", head)
    bg.Name = "RudzHubTag"
    bg.Size = UDim2.new(0,200,0,50)
    bg.StudsOffset = Vector3.new(0,4,0)
    bg.AlwaysOnTop = true
    local t = Instance.new("TextLabel", bg)
    t.Size = UDim2.new(1,0,1,0)
    t.BackgroundTransparency = 1
    t.TextScaled = true
    t.Font = Enum.Font.GothamBlack
    t.TextStrokeTransparency = 0
    t.TextStrokeColor3 = Color3.new(0,0,0)
    if mode == "CREATOR" then
        t.Text = "CREATOR"
        t.TextColor3 = Color3.fromRGB(255,0,0)
    else
        t.Text = "✓ VERIFIED"
        t.TextColor3 = Color3.fromRGB(0,162,255)
    end
end

pcall(function() game.CoreGui.RudzHub:Destroy() end)
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "RudzHub"
gui.ResetOnSpawn = false

local f = Instance.new("Frame", gui)
f.Size = UDim2.new(0,210,0,145)
f.Position = UDim2.new(0.35,0,0.3,0)
f.BackgroundColor3 = Color3.fromRGB(22,22,22)
f.BorderSizePixel = 0
f.Active = true
f.Draggable = true
Instance.new("UICorner", f).CornerRadius = UDim.new(0,12)

local title = Instance.new("TextLabel", f)
title.Size = UDim2.new(1,0,0,35)
title.Text = "RudzHub"
title.BackgroundTransparency = 1
title.TextColor3 = Color3.new(1,1,1)
title.Font = Enum.Font.GothamBlack
title.TextScaled = true

local function button(txt, y, col)
    local b = Instance.new("TextButton", f)
    b.Size = UDim2.new(0.9,0,0,30)
    b.Position = UDim2.new(0.05,0,0,y)
    b.Text = txt
    b.BackgroundColor3 = col
    b.TextColor3 = Color3.new(1,1,1)
    b.Font = Enum.Font.GothamBold
    b.TextScaled = true
    Instance.new("UICorner", b).CornerRadius = UDim.new(0,8)
    return b
end

local onBtn = button("OFF", 40, Color3.fromRGB(120,0,0))
local cBtn = button("CREATOR", 75, Color3.fromRGB(60,60,60))
local vBtn = button("CENTANG BIRU", 110, Color3.fromRGB(60,60,60))

onBtn.MouseButton1Click:Connect(function()
    enabled = not enabled
    if enabled then
        onBtn.Text = "ON ✓"
        onBtn.BackgroundColor3 = Color3.fromRGB(0,170,0)
        if plr.Character then make(plr.Character) end
    else
        onBtn.Text = "OFF"
        onBtn.BackgroundColor3 = Color3.fromRGB(120,0,0)
        if plr.Character then clear(plr.Character) end
    end
end)

cBtn.MouseButton1Click:Connect(function()
    mode = "CREATOR"
    cBtn.BackgroundColor3 = Color3.fromRGB(255,0,0)
    vBtn.BackgroundColor3 = Color3.fromRGB(60,60,60)
    if enabled and plr.Character then make(plr.Character) end
end)

vBtn.MouseButton1Click:Connect(function()
    mode = "VERIFIED"
    vBtn.BackgroundColor3 = Color3.fromRGB(0,140,255)
    cBtn.BackgroundColor3 = Color3.fromRGB(60,60,60)
    if enabled and plr.Character then make(plr.Character) end
end)

plr.CharacterAdded:Connect(function(c)
    task.wait(1)
    if enabled then make(c) end
end) 
