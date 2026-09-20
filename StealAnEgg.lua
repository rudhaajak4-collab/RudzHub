-- RudzHub V3 | Fix Instant Steal + True Anti Hit
local Players=game:GetService("Players")
local plr=Players.LocalPlayer
local RS=game:GetService("RunService")
getgenv().RudzHub={AntiHit=true,InstantSteal=true,Range=30}
local gui=Instance.new("ScreenGui",plr:WaitForChild("PlayerGui"))
gui.Name="RudzHubV3"
gui.ResetOnSpawn=false
local frame=Instance.new("Frame",gui)
frame.Size=UDim2.new(0,240,0,170)
frame.Position=UDim2.new(0.5,-120,0.5,-85)
frame.BackgroundColor3=Color3.fromRGB(20,20,20)
frame.BorderSizePixel=0
Instance.new("UICorner",frame).CornerRadius=UDim.new(0,12)
frame.Active=true
frame.Draggable=true
local title=Instance.new("TextLabel",frame)
title.Size=UDim2.new(1,0,0,35)
title.Text="RudzHub V3 - OP"
title.TextColor3=Color3.new(1,1,1)
title.BackgroundTransparency=1
title.Font=Enum.Font.GothamBold
title.TextSize=14
local function makeBtn(txt,posY,name)
    local btn=Instance.new("TextButton",frame)
    btn.Size=UDim2.new(0.9,0,0,32)
    btn.Position=UDim2.new(0.05,0,0,posY)
    btn.TextColor3=Color3.new(1,1,1)
    btn.Font=Enum.Font.GothamBold
    btn.TextSize=12
    Instance.new("UICorner",btn).CornerRadius=UDim.new(0,8)
    local function upd()
        local on=getgenv().RudzHub[name]
        btn.Text=txt.." : "..(on and "ON" or "OFF")
        btn.BackgroundColor3=on and Color3.fromRGB(0,200,100) or Color3.fromRGB(200,40,40)
    end
    upd()
    btn.MouseButton1Click:Connect(function()
        getgenv().RudzHub[name]=not getgenv().RudzHub[name]
        upd()
    end)
end
makeBtn("Anti Hit (Guard & Player)",40,"AntiHit")
makeBtn("Instant Steal 1s Auto",80,"InstantSteal")
local info=Instance.new("TextLabel",frame)
info.Size=UDim2.new(0.9,0,0,30)
info.Position=UDim2.new(0.05,0,0,125)
info.Text="Range: 30 studs | Auto Fire"
info.TextColor3=Color3.fromRGB(180,180,180)
info.BackgroundTransparency=1
info.Font=Enum.Font.Gotham
info.TextSize=11

-- LOGIC
RS.Stepped:Connect(function()
    local char=plr.Character
    if not char then return end
    if getgenv().RudzHub.AntiHit then
        -- Anti hit dari penjaga & player lain
        for _,v in pairs(char:GetDescendants()) do
            if v:IsA("BasePart") then
                v.CanTouch=false
            end
        end
        -- Bikin hitbox musuh gak ngaruh
        for _,p in pairs(Players:GetPlayers()) do
            if p~=plr and p.Character then
                for _,part in pairs(p.Character:GetDescendants()) do
                    if part:IsA("BasePart") and part.CanTouch then
                        part.CanTouch=false
                    end
                    if part:IsA("TouchTransmitter") then
                        part:Destroy()
                    end
                end
            end
        end
        -- Hapus guard touch
        for _,m in pairs(workspace:GetDescendants()) do
            if m:IsA("BasePart") and (m.Name:lower():find("guard") or m.Name:lower():find("hit")) then
                if m.CanTouch then m.CanTouch=false end
            end
        end
    end
end)

task.spawn(function()
    while true do task.wait(0.5)
        if not getgenv().RudzHub.InstantSteal then continue end
        local char=plr.Character
        local hrp=char and char:FindFirstChild("HumanoidRootPart")
        if not hrp then continue end
        for _,v in pairs(workspace:GetDescendants()) do
            if v:IsA("ProximityPrompt") then
                local model=v.Parent
                if not model then continue end
                -- cari yang egg
                local txt=v.ObjectText:lower()..v.ActionText:lower()
                if txt:find("egg") or txt:find("steal") or v.Name:lower():find("egg") then
                    local dist=(hrp.Position - model:GetPivot().Position).Magnitude
                    if dist <= getgenv().RudzHub.Range then
                        v.HoldDuration=0
                        v.Enabled=true
                        pcall(function()
                            fireproximityprompt(v,1)
                        end)
                    end
                end
            end
        end
    end
end)

game.StarterGui:SetCore("SendNotification",{Title="RudzHub V3 Loaded",Text="Anti Hit + Auto Steal 1s Active!",Duration=4})
