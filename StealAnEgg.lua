-- RudzHub V4 | Fix Guard Bounce + Instant Steal
local Players=game:GetService("Players")
local plr=Players.LocalPlayer
local RS=game:GetService("RunService")
getgenv().RudzHub={AntiHit=true,InstantSteal=true,Range=40,NoBounce=true}
local gui=Instance.new("ScreenGui",plr:WaitForChild("PlayerGui"))
gui.Name="RudzHubV4"
gui.ResetOnSpawn=false
local frame=Instance.new("Frame",gui)
frame.Size=UDim2.new(0,240,0,190)
frame.Position=UDim2.new(0.5,-120,0.5,-95)
frame.BackgroundColor3=Color3.fromRGB(20,20,20)
frame.BorderSizePixel=0
Instance.new("UICorner",frame).CornerRadius=UDim.new(0,12)
frame.Active=true
frame.Draggable=true
local title=Instance.new("TextLabel",frame)
title.Size=UDim2.new(1,0,0,35)
title.Text="RudzHub V4 - NO BOUNCE"
title.TextColor3=Color3.new(1,1,1)
title.BackgroundTransparency=1
title.Font=Enum.Font.GothamBold
title.TextSize=13
local function makeBtn(txt,posY,name)
    local btn=Instance.new("TextButton",frame)
    btn.Size=UDim2.new(0.9,0,0,30)
    btn.Position=UDim2.new(0.05,0,0,posY)
    btn.TextColor3=Color3.new(1,1,1)
    btn.Font=Enum.Font.GothamBold
    btn.TextSize=11
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
makeBtn("Anti Guard No Bounce",40,"AntiHit")
makeBtn("Instant Steal 40 Studs",75,"InstantSteal")
makeBtn("Anti Knock + NoClip",110,"NoBounce")

-- LOGIC V4
RS.Stepped:Connect(function()
    local char=plr.Character
    if not char then return end
    local hrp=char:FindFirstChild("HumanoidRootPart")
    local hum=char:FindFirstChildOfClass("Humanoid")
    if getgenv().RudzHub.NoBounce and hrp and hum then
        -- Anti kepental total
        hrp.CanCollide=false
        hum:SetStateEnabled(Enum.HumanoidStateType.FallingDown,false)
        hrp.Velocity=Vector3.new(0,hrp.Velocity.Y,0)
        -- Noclip buat char sendiri
        for _,v in pairs(char:GetDescendants()) do
            if v:IsA("BasePart") and v.CanCollide then
                v.CanCollide=false
            end
        end
    end
    if getgenv().RudzHub.AntiHit then
        for _,obj in pairs(workspace:GetDescendants()) do
            if obj:IsA("BasePart") then
                local n=obj.Name:lower()
                -- Cari guard
                if n:find("guard") or n:find("police") or obj.Parent.Name:lower():find("guard") then
                    obj.CanTouch=false
                    obj.CanCollide=false
                    obj.CanQuery=false
                    -- Hapus velocity yang bikin kepental
                    if obj:FindFirstChildOfClass("BodyVelocity") then
                        obj:FindFirstChildOfClass("BodyVelocity"):Destroy()
                    end
                end
            end
        end
    end
end)

-- Anti ragdoll / stun
plr.CharacterAdded:Connect(function(char)
    char:WaitForChild("Humanoid").StateChanged:Connect(function(_,new)
        if getgenv().RudzHub.NoBounce and new==Enum.HumanoidStateType.Ragdoll then
            char.Humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
        end
    end)
end)

task.spawn(function()
    while true do task.wait(0.3)
        if not getgenv().RudzHub.InstantSteal then continue end
        local char=plr.Character
        local hrp=char and char:FindFirstChild("HumanoidRootPart")
        if not hrp then continue end
        for _,v in pairs(workspace:GetDescendants()) do
            if v:IsA("ProximityPrompt") then
                local txt=(v.ObjectText..v.ActionText..v.Name):lower()
                if txt:find("egg") or txt:find("steal") then
                    local dist=(hrp.Position - v.Parent:GetPivot().Position).Magnitude
                    if dist <= getgenv().RudzHub.Range then
                        v.HoldDuration=0
                        pcall(function() fireproximityprompt(v,0) end)
                    end
                end
            end
        end
    end
end)

game.StarterGui:SetCore("SendNotification",{Title="RudzHub V4",Text="No Bounce + Auto Steal Active!",Duration=4})
