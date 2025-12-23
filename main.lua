--// GT COMMUNITY - SAVE LOC + TWEEN + KEY + SNOW
--// Natal Edition ❄️🎄

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local humanoid = char:WaitForChild("Humanoid")
local hrp = char:WaitForChild("HumanoidRootPart")

local savedCFrame = nil

--==============================
-- FUNÇÃO NEVE
--==============================
local function createSnow(parent)
    local snowHolder = Instance.new("Frame", parent)
    snowHolder.Size = UDim2.new(1,0,1,0)
    snowHolder.BackgroundTransparency = 1
    snowHolder.ZIndex = 2

    for i = 1,18 do
        local snow = Instance.new("Frame", snowHolder)
        local size = math.random(4,7)
        snow.Size = UDim2.new(0,size,0,size)
        snow.Position = UDim2.new(math.random(),0,-0.1,0)
        snow.BackgroundColor3 = Color3.fromRGB(255,255,255)
        snow.BackgroundTransparency = 0.3
        snow.BorderSizePixel = 0
        Instance.new("UICorner", snow).CornerRadius = UDim.new(1,0)

        task.spawn(function()
            while snow.Parent do
                snow.Position = UDim2.new(math.random(),0,-0.1,0)
                local t = math.random(6,10)
                TweenService:Create(
                    snow,
                    TweenInfo.new(t, Enum.EasingStyle.Linear),
                    {Position = UDim2.new(snow.Position.X.Scale,0,1.1,0)}
                ):Play()
                task.wait(t)
            end
        end)
    end
end

--==============================
-- GUI BASE
--==============================
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "GTCommunityGui"
gui.ResetOnSpawn = false

--==============================
-- TEXTO RGB CENTRAL
--==============================
local rgbFrame = Instance.new("Frame", gui)
rgbFrame.Size = UDim2.new(1,0,0,120)
rgbFrame.Position = UDim2.new(0,0,0.4,0)
rgbFrame.BackgroundTransparency = 1

local rgbTitle = Instance.new("TextLabel", rgbFrame)
rgbTitle.Size = UDim2.new(1,0,0,45)
rgbTitle.BackgroundTransparency = 1
rgbTitle.Text = "Este Script É pago Apenas em"
rgbTitle.Font = Enum.Font.GothamBold
rgbTitle.TextScaled = true

local rgbDisc = Instance.new("TextLabel", rgbFrame)
rgbDisc.Size = UDim2.new(1,0,0,35)
rgbDisc.Position = UDim2.new(0,0,0,50)
rgbDisc.BackgroundTransparency = 1
rgbDisc.Text = "https://discord.gg/gtcommunity"
rgbDisc.Font = Enum.Font.Gotham
rgbDisc.TextScaled = true

task.spawn(function()
    local h = 0
    while true do
        h = (h + 1) % 360
        local c = Color3.fromHSV(h/360,1,1)
        rgbTitle.TextColor3 = c
        rgbDisc.TextColor3 = c
        task.wait(0.03)
    end
end)

--==============================
-- KEY MENU
--==============================
local keyFrame = Instance.new("Frame", gui)
keyFrame.Size = UDim2.new(0,320,0,220)
keyFrame.Position = UDim2.new(0.5,-160,0.5,-110)
keyFrame.BackgroundColor3 = Color3.fromRGB(25,30,35)
keyFrame.BorderSizePixel = 0
keyFrame.Active = true
keyFrame.Draggable = true
Instance.new("UICorner", keyFrame).CornerRadius = UDim.new(0,18)
Instance.new("UIStroke", keyFrame).Color = Color3.fromRGB(0,255,120)

createSnow(keyFrame)

local keyTitle = Instance.new("TextLabel", keyFrame)
keyTitle.Size = UDim2.new(1,0,0,45)
keyTitle.BackgroundTransparency = 1
keyTitle.Text = "GT COMMUNITY"
keyTitle.Font = Enum.Font.GothamBold
keyTitle.TextSize = 22
keyTitle.TextColor3 = Color3.fromRGB(0,255,120)

local keySub = Instance.new("TextLabel", keyFrame)
keySub.Size = UDim2.new(1,-30,0,30)
keySub.Position = UDim2.new(0,15,0,45)
keySub.BackgroundTransparency = 1
keySub.Text = "Para acessar o Painel Digite a Key Abaixo"
keySub.Font = Enum.Font.Gotham
keySub.TextSize = 12
keySub.TextColor3 = Color3.fromRGB(200,200,200)

local keyBox = Instance.new("TextBox", keyFrame)
keyBox.Size = UDim2.new(1,-40,0,40)
keyBox.Position = UDim2.new(0,20,0,85)
keyBox.PlaceholderText = "Digite a Key"
keyBox.Font = Enum.Font.GothamBold
keyBox.TextSize = 14
keyBox.BackgroundColor3 = Color3.fromRGB(35,40,45)
keyBox.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", keyBox)

local keyBtn = Instance.new("TextButton", keyFrame)
keyBtn.Size = UDim2.new(1,-40,0,40)
keyBtn.Position = UDim2.new(0,20,0,140)
keyBtn.Text = "VERIFICAR KEY"
keyBtn.Font = Enum.Font.GothamBold
keyBtn.TextSize = 14
keyBtn.BackgroundColor3 = Color3.fromRGB(0,180,120)
keyBtn.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", keyBtn)

local validKeys = {
    ["GT ADMIN"] = true,
    ["GT FREE"] = true,
    ["GT VIP"] = true
}

--==============================
-- PAINEL PRINCIPAL
--==============================
local panel = Instance.new("Frame", gui)
panel.Size = UDim2.new(0,280,0,210)
panel.Position = UDim2.new(0.05,0,0.32,0)
panel.BackgroundColor3 = Color3.fromRGB(22,22,22)
panel.Visible = false
panel.Active = true
panel.Draggable = true
panel.BorderSizePixel = 0
Instance.new("UICorner", panel).CornerRadius = UDim.new(0,16)

createSnow(panel)

local title = Instance.new("TextLabel", panel)
title.Size = UDim2.new(1,0,0,40)
title.BackgroundTransparency = 1
title.Text = "SAVE LOCATION"
title.Font = Enum.Font.GothamBold
title.TextSize = 16
title.TextColor3 = Color3.new(1,1,1)

local bypass = Instance.new("TextLabel", panel)
bypass.Size = UDim2.new(0,120,0,20)
bypass.Position = UDim2.new(1,-130,0,12)
bypass.BackgroundTransparency = 1
bypass.Text = "bypass : ON"
bypass.Font = Enum.Font.GothamBold
bypass.TextSize = 13
bypass.TextColor3 = Color3.fromRGB(0,255,120)
bypass.TextXAlignment = Enum.TextXAlignment.Right

local status = Instance.new("TextLabel", panel)
status.Size = UDim2.new(1,-20,0,30)
status.Position = UDim2.new(0,10,0,45)
status.BackgroundColor3 = Color3.fromRGB(35,35,35)
status.Text = "Status: Nenhuma loc salva"
status.Font = Enum.Font.Gotham
status.TextSize = 13
status.TextColor3 = Color3.fromRGB(255,90,90)
Instance.new("UICorner", status)

local saveBtn = Instance.new("TextButton", panel)
saveBtn.Size = UDim2.new(1,-20,0,42)
saveBtn.Position = UDim2.new(0,10,0,85)
saveBtn.Text = "Salvar Loc"
saveBtn.Font = Enum.Font.GothamBold
saveBtn.TextSize = 14
saveBtn.BackgroundColor3 = Color3.fromRGB(80,120,255)
saveBtn.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", saveBtn)

local tweenBtn = Instance.new("TextButton", panel)
tweenBtn.Size = UDim2.new(1,-20,0,42)
tweenBtn.Position = UDim2.new(0,10,0,140)
tweenBtn.Text = "Tween"
tweenBtn.Font = Enum.Font.GothamBold
tweenBtn.TextSize = 14
tweenBtn.BackgroundColor3 = Color3.fromRGB(90,200,140)
tweenBtn.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", tweenBtn)

-- BOTÃO FECHAR
local closeBtn = Instance.new("TextButton", panel)
closeBtn.Size = UDim2.new(0,40,0,30)
closeBtn.Position = UDim2.new(1,-45,0,5)
closeBtn.BackgroundTransparency = 1
closeBtn.Text = "--"
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 20
closeBtn.TextColor3 = Color3.new(1,1,1)

-- BOTÃO ABRIR
local openBtn = Instance.new("TextButton", gui)
openBtn.Size = UDim2.new(0,60,0,60)
openBtn.Position = UDim2.new(0,15,0.5,-30)
openBtn.Text = "GT\nCOMMUNITY"
openBtn.Font = Enum.Font.GothamBold
openBtn.TextSize = 10
openBtn.BackgroundColor3 = Color3.fromRGB(20,20,20)
openBtn.TextColor3 = Color3.fromRGB(0,255,120)
openBtn.Active = true
openBtn.Draggable = true
Instance.new("UICorner", openBtn).CornerRadius = UDim.new(1,0)

--==============================
-- FUNÇÕES
--==============================
keyBtn.MouseButton1Click:Connect(function()
    if validKeys[keyBox.Text] then
        keyFrame:Destroy()
        panel.Visible = true
    else
        keyBox.Text = ""
        keyBox.PlaceholderText = "Key inválida"
    end
end)

saveBtn.MouseButton1Click:Connect(function()
    savedCFrame = hrp.CFrame
    status.Text = "Status: Localização salva"
    status.TextColor3 = Color3.fromRGB(90,255,140)
end)

tweenBtn.MouseButton1Click:Connect(function()
    if not savedCFrame then return end

    humanoid:ChangeState(Enum.HumanoidStateType.Physics)
    humanoid.AutoRotate = false
    hrp.Anchored = true

    local dist = (hrp.Position - savedCFrame.Position).Magnitude
    local time = dist / 40

    local tween = TweenService:Create(
        hrp,
        TweenInfo.new(time, Enum.EasingStyle.Linear),
        {CFrame = savedCFrame}
    )
    tween:Play()
    tween.Completed:Wait()

    hrp.Anchored = false
    humanoid.AutoRotate = true
    humanoid:ChangeState(Enum.HumanoidStateType.Running)
end)

openBtn.MouseButton1Click:Connect(function()
    panel.Visible = true
end)

closeBtn.MouseButton1Click:Connect(function()
    panel.Visible = false
end)
