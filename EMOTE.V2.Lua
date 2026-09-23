-- RudzHub V4.3 [INTRO FOLLOW + AUTO RESPAWN FIX]
pcall(function() game.CoreGui.RudzAnimV4:Destroy() end)
pcall(function() game.CoreGui.RudzIntro:Destroy() end)
pcall(function() game.CoreGui["7yd7Emotes"]:Destroy() end)

local Players = game:GetService("Players")
local plr = Players.LocalPlayer
local TweenService = game:GetService("TweenService")

local function showIntro(callback)
    local introGui = Instance.new("ScreenGui", game.CoreGui)
    introGui.Name = "RudzIntro"
    introGui.IgnoreGuiInset = true
    
    local bg = Instance.new("Frame", introGui)
    bg.Size = UDim2.new(1,0,1,0)
    bg.BackgroundColor3 = Color3.fromRGB(0,0,0)
    bg.BackgroundTransparency = 1

    local text = Instance.new("TextLabel", bg)
    text.Size = UDim2.new(1,0,0,100)
    text.Position = UDim2.new(0,0,0.5,-50)
    text.Text = "Follow me rudha_620\nfor more updates 🤑🤑"
    text.BackgroundTransparency = 1
    text.TextColor3 = Color3.fromRGB(255,255,255)
    text.Font = Enum.Font.GothamBlack
    text.TextSize = 28
    text.TextTransparency = 1

    -- Animasi Fade In
    TweenService:Create(bg, TweenInfo.new(0.5), {BackgroundTransparency = 0}):Play()
    TweenService:Create(text, TweenInfo.new(0.5), {TextTransparency = 0}):Play()
    
    wait(3)
    
    -- Animasi Fade Out
    TweenService:Create(bg, TweenInfo.new(0.5), {BackgroundTransparency = 1}):Play()
    TweenService:Create(text, TweenInfo.new(0.5), {TextTransparency = 1}):Play()
    wait(0.5)
    introGui:Destroy()
    if callback then callback() end
end

local function createMainGui()
    local gui = Instance.new("ScreenGui", game.CoreGui)
    gui.Name = "RudzAnimV4"
    local f = Instance.new("Frame", gui)
    f.Size = UDim2.new(0, 260, 0, 80)
    f.Position = UDim2.new(1, -270, 0.5, -40)
    f.BackgroundColor3 = Color3.fromRGB(15,15,15)
    f.Active = true f.Draggable = true
    Instance.new("UICorner", f).CornerRadius = UDim.new(0,14)
    local st = Instance.new("UIStroke", f) st.Color = Color3.fromRGB(255,0,0) st.Thickness = 2.5

    local title = Instance.new("TextLabel", f)
    title.Size = UDim2.new(1, -40, 0, 40) title.Position = UDim2.new(0,10,0,0)
    title.Text = "RUDZHUB V4.3" title.BackgroundTransparency = 1
    title.TextColor3 = Color3.new(1,1,1) title.Font = Enum.Font.GothamBlack title.TextSize = 14
    title.TextXAlignment = Enum.TextXAlignment.Left

    local close = Instance.new("TextButton", f)
    close.Size = UDim2.new(0, 30, 0, 30) close.Position = UDim2.new(1, -35, 0, 5)
    close.Text = "❌" close.BackgroundColor3 = Color3.fromRGB(255,0,0)
    close.TextColor3 = Color3.new(1,1,1) close.Font = Enum.Font.GothamBold close.TextSize = 16
    Instance.new("UICorner", close).CornerRadius = UDim.new(0,8)
    close.MouseButton1Click:Connect(function() gui:Destroy() end)

    local info = Instance.new("TextLabel", f)
    info.Size = UDim2.new(1,0,0,30) info.Position = UDim2.new(0,0,0,40)
    info.Text = "by rudha_620 🤑" info.BackgroundTransparency = 1
    info.TextColor3 = Color3.fromRGB(0,255,0) info.Font = Enum.Font.GothamBold info.TextSize = 11

    loadstring(game:HttpGet("https://raw.githubusercontent.com/7yd7/Emotes/main/emotes.lua"))()
end

-- JALANKAN: INTRO DULU 3 DETIK, BARU LOAD EMOTE + AUTO RESPAWN
showIntro(function()
    createMainGui()
    plr.CharacterAdded:Connect(function()
        wait(1)
        createMainGui()
    end)
end)
