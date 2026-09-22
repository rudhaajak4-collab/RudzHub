-- RudzHub FINAL ADMIN 3D - by rudhaajak4-collab
local plr = game.Players.LocalPlayer
local enabled = false
local mode = "ADMIN"

local function clear(c)
    local h = c:FindFirstChild("Head")
    if h then for _,v in pairs(h:GetChildren()) do if v.Name=="RudzHubReal" then v:Destroy() end end end
end

local function make(char)
    if not enabled then return end
    local head = char:WaitForChild("Head")
    clear(char)
    local bg = Instance.new("BillboardGui", head)
    bg.Name = "RudzHubReal"
    bg.Size = UDim2.new(0, 300, 0, 65)
    bg.StudsOffset = Vector3.new(0, 4.8, 0)
    bg.AlwaysOnTop = true
    
    if mode == "CREATOR" then
        local s = Instance.new("TextLabel", bg)
        s.Size = UDim2.new(1,0,1,0) s.Position = UDim2.new(0,2,0,2)
        s.BackgroundTransparency = 1 s.TextScaled = true
        s.Font = Enum.Font.FredokaOne s.Text = "CREATOR"
        s.TextColor3 = Color3.new(0,0,0) s.TextTransparency = 0.3
        
        local m = Instance.new("TextLabel", bg)
        m.Size = UDim2.new(1,0,1,0) m.BackgroundTransparency = 1
        m.TextScaled = true m.Font = Enum.Font.FredokaOne
        m.Text = "CREATOR" m.TextColor3 = Color3.fromRGB(255,0,0)
        m.TextStrokeTransparency = 0 m.TextStrokeColor3 = Color3.new(0,0,0)
    else
        -- ADMIN BLACK 3D PUTIH ABU-ABU
        local shadow1 = Instance.new("TextLabel", bg)
        shadow1.Size = UDim2.new(1,0,1,0) shadow1.Position = UDim2.new(0,3,0,3)
        shadow1.BackgroundTransparency = 1 shadow1.TextScaled = true
        shadow1.Font = Enum.Font.FredokaOne shadow1.Text = "👑ADMIN👑"
        shadow1.TextColor3 = Color3.fromRGB(150,150,150) -- ABU-ABU

        local shadow2 = Instance.new("TextLabel", bg)
        shadow2.Size = UDim2.new(1,0,1,0) shadow2.Position = UDim2.new(0,1.5,0,1.5)
        shadow2.BackgroundTransparency = 1 shadow2.TextScaled = true
        shadow2.Font = Enum.Font.FredokaOne shadow2.Text = "👑ADMIN👑"
        shadow2.TextColor3 = Color3.fromRGB(255,255,255) -- PUTIH
        
        local main = Instance.new("TextLabel", bg)
        main.Size = UDim2.new(1,0,1,0) main.BackgroundTransparency = 1
        main.TextScaled = true main.Font = Enum.Font.FredokaOne
        main.Text = "👑ADMIN👑" main.TextColor3 = Color3.fromRGB(0,0,0) -- HITAM
        main.TextStrokeTransparency = 0
        main.TextStrokeColor3 = Color3.fromRGB(255,255,255)
    end
end

pcall(function() game.CoreGui.RudzHub:Destroy() end)
local gui = Instance.new("ScreenGui", game.CoreGui) gui.Name = "RudzHub"
local f = Instance.new("Frame", gui)
f.Size = UDim2.new(0,215,0,150) f.Position = UDim2.new(0.6,0,0.25,0)
f.BackgroundColor3 = Color3.fromRGB(15,15,15) f.BorderSizePixel = 0
f.Active = true f.Draggable = true
Instance.new("UICorner", f).CornerRadius = UDim.new(0,14)
local stroke = Instance.new("UIStroke", f) stroke.Color = Color3.fromRGB(255,255,255) stroke.Thickness = 2

local title = Instance.new("TextLabel", f)
title.Size = UDim2.new(1,0,0,35) title.Text = "RudzHub [FINAL]"
title.BackgroundTransparency = 1 title.TextColor3 = Color3.new(1,1,1)
title.Font = Enum.Font.GothamBlack title.TextSize = 18

local function btn(txt,y,col)
    local b = Instance.new("TextButton", f)
    b.Size = UDim2.new(0.9,0,0,30) b.Position = UDim2.new(0.05,0,0,y)
    b.Text = txt b.BackgroundColor3 = col b.TextColor3 = Color3.new(1,1,1)
    b.Font = Enum.Font.GothamBold b.TextSize = 14
    Instance.new("UICorner", b).CornerRadius = UDim.new(0,8) return b
end

local onBtn = btn("OFF", 40, Color3.fromRGB(100,0,0))
local cBtn = btn("CREATOR", 75, Color3.fromRGB(50,50,50))
local aBtn = btn("👑ADMIN👑", 110, Color3.fromRGB(0,0,0))

onBtn.MouseButton1Click:Connect(function()
    enabled = not enabled
    if enabled then onBtn.Text="ON ✓" onBtn.BackgroundColor3=Color3.fromRGB(0,170,0) if plr.Character then make(plr.Character) end
    else onBtn.Text="OFF" onBtn.BackgroundColor3=Color3.fromRGB(100,0,0) if plr.Character then clear(plr.Character) end end
end)
cBtn.MouseButton1Click:Connect(function() mode="CREATOR" cBtn.BackgroundColor3=Color3.fromRGB(255,0,0) aBtn.BackgroundColor3=Color3.fromRGB(50,50,50) if enabled and plr.Character then make(plr.Character) end end)
aBtn.MouseButton1Click:Connect(function() mode="ADMIN" aBtn.BackgroundColor3=Color3.fromRGB(20,20,20) cBtn.BackgroundColor3=Color3.fromRGB(50,50,50) if enabled and plr.Character then make(plr.Character) end end)
plr.CharacterAdded:Connect(function(c) task.wait(1) if enabled then make(c) end end)
