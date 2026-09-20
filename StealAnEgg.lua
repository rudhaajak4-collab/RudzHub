-- RudzHub V2 Final | Steal an Egg | Anti Hit + Instant Steal ON/OFF
local Players=game:GetService("Players")
local plr=Players.LocalPlayer
local RunService=game:GetService("RunService")
getgenv().RudzHub={AntiHit=true,InstantSteal=true}
local gui=Instance.new("ScreenGui",plr.PlayerGui)
gui.Name="RudzHub"
gui.ResetOnSpawn=false
local frame=Instance.new("Frame",gui)
frame.Size=UDim2.new(0,220,0,150)
frame.Position=UDim2.new(0.5,-110,0.5,-75)
frame.BackgroundColor3=Color3.fromRGB(25,25,25)
frame.BorderSizePixel=0
Instance.new("UICorner",frame).CornerRadius=UDim.new(0,12)
frame.Active=true
frame.Draggable=true
local title=Instance.new("TextLabel",frame)
title.Size=UDim2.new(1,0,0,35)
title.Text="RudzHub - Steal an Egg"
title.TextColor3=Color3.new(1,1,1)
title.BackgroundTransparency=1
title.Font=Enum.Font.GothamBold
title.TextSize=14
local function makeButton(text,posY,stateName)
    local btn=Instance.new("TextButton",frame)
    btn.Size=UDim2.new(0.85,0,0,35)
    btn.Position=UDim2.new(0.075,0,0,posY)
    btn.BackgroundColor3=Color3.fromRGB(45,45,45)
    btn.TextColor3=Color3.new(1,1,1)
    btn.Font=Enum.Font.Gotham
    btn.TextSize=13
    Instance.new("UICorner",btn).CornerRadius=UDim.new(0,8)
    local function update()
        local on=getgenv().RudzHub[stateName]
        btn.Text=text.." : "..(on and "ON" or "OFF")
        btn.BackgroundColor3=on and Color3.fromRGB(0,170,90) or Color3.fromRGB(170,40,40)
    end
    update()
    btn.MouseButton1Click:Connect(function()
        getgenv().RudzHub[stateName]=not getgenv().RudzHub[stateName]
        update()
    end)
end
makeButton("Anti Hit",40,"AntiHit")
makeButton("Instant Steal",85,"InstantSteal")
RunService.Heartbeat:Connect(function()
    local char=plr.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end
    if getgenv().RudzHub.AntiHit then
        for _,v in pairs(char:GetDescendants()) do
            if v:IsA("BasePart") then
                v.CanTouch=false
            end
        end
    end
    if getgenv().RudzHub.InstantSteal then
        for _,v in pairs(workspace:GetDescendants()) do
            local prompt=v:FindFirstChildWhichIsA("ProximityPrompt",true)
            if prompt and prompt.Enabled then
                prompt.HoldDuration=0
                if (char.HumanoidRootPart.Position - v:GetPivot().Position).Magnitude < 18 then
                    fireproximityprompt(prompt)
                end
            end
        end
    end
end)
game.StarterGui:SetCore("SendNotification",{Title="RudzHub Loaded!",Text="Anti Hit & Instant Steal Ready",Duration=3})
