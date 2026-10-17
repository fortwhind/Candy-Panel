
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")

local ativo = false
local minimizado = false

local gui = Instance.new("ScreenGui")
gui.Name = "CandyPanel"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.fromOffset(300, 200)
frame.Position = UDim2.new(0, 30, 0.35, 0)
frame.BackgroundColor3 = Color3.fromRGB(24, 25, 35)
frame.Parent = gui


Instance.new("UICorner", frame).CornerRadius =
    UDim.new(0, 12)

local titulo = Instance.new("TextLabel")
titulo.Parent = frame
local dragging = false
local dragStart
local startPosition
local dragInput

titulo.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then

        dragging = true
        dragStart = input.Position
        startPosition = frame.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)
titulo.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement
        or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)
UserInputService.InputChanged:Connect(function(input)
    if dragging and (
        input == dragInput
        or input.UserInputType == Enum.UserInputType.MouseMovement
    ) then
        local delta = input.Position - dragStart

        frame.Position = UDim2.new(
            startPosition.X.Scale,
            startPosition.X.Offset + delta.X,
            startPosition.Y.Scale,
            startPosition.Y.Offset + delta.Y
        )
    end
end)
titulo.Size = UDim2.new(1, -50, 0, 45)
titulo.Position = UDim2.fromOffset(14, 0)
titulo.BackgroundTransparency = 1
titulo.Text = "🍬 Candy Panel"
titulo.TextColor3 = Color3.new(1, 1, 1)
titulo.TextSize = 20
titulo.Font = Enum.Font.GothamBold
titulo.TextXAlignment = Enum.TextXAlignment.Left
titulo.Parent = frame

local minimizar = Instance.new("TextButton")
minimizar.Size = UDim2.fromOffset(35, 32)
minimizar.Position = UDim2.new(1, -42, 0, 7)
minimizar.Text = "—"
minimizar.TextSize = 20
minimizar.BackgroundColor3 =
    Color3.fromRGB(48, 49, 64)
minimizar.TextColor3 = Color3.new(1, 1, 1)
minimizar.Parent = frame

local toggle = Instance.new("TextButton")
toggle.Size = UDim2.new(1, -28, 0, 42)
toggle.Position = UDim2.fromOffset(14, 58)
toggle.Text = "Auto Farm: OFF"
toggle.TextSize = 15
toggle.Font = Enum.Font.GothamBold
toggle.TextColor3 = Color3.new(1, 1, 1)
toggle.BackgroundColor3 =
    Color3.fromRGB(65, 67, 85)
toggle.Parent = frame

local status = Instance.new("TextLabel")
status.Size = UDim2.new(1, -28, 0, 32)
status.Position = UDim2.fromOffset(14, 110)
status.BackgroundTransparency = 1
status.Text = "Status: Desativado"
status.TextColor3 = Color3.fromRGB(220, 220, 230)
status.TextSize = 14
status.Font = Enum.Font.Gotham
status.TextXAlignment = Enum.TextXAlignment.Left
status.Parent = frame

local espButton = Instance.new("TextButton")
espButton.Name = "ESPButton"
espButton.Size = UDim2.new(1, -28, 0, 36)
espButton.Position = UDim2.fromOffset(14, 150)
espButton.Text = "ESP: OFF"
espButton.TextSize = 15
espButton.Font = Enum.Font.GothamBold
espButton.TextColor3 = Color3.new(1, 1, 1)
espButton.BackgroundColor3 = Color3.fromRGB(65, 67, 85)
espButton.Parent = frame

local espCorner = Instance.new("UICorner")
espCorner.CornerRadius = UDim.new(0, 8)
espCorner.Parent = espButton

local RunService = game:GetService("RunService")

local pastaDoces = workspace:WaitForChild("LocalCandy2026")
local espAtivo = false
local objetosESP = {}

local function encontrarParte(objeto)
    if objeto:IsA("BasePart") then
        return objeto
    end

    if objeto:IsA("Model") then
        return objeto.PrimaryPart
            or objeto:FindFirstChildWhichIsA("BasePart", true)
    end

    return nil
end

local function criarESP(objeto)
    if objetosESP[objeto] then
        return
    end

    local parte = encontrarParte(objeto)

    if not parte then
        return
    end

    -- Contorno colorido
    local destaque = Instance.new("Highlight")
    destaque.Name = "CandyHighlight"
    destaque.Adornee = objeto
    destaque.FillColor = Color3.fromRGB(255, 90, 190)
    destaque.OutlineColor = Color3.fromRGB(255, 255, 255)
    destaque.FillTransparency = 0.75
    destaque.OutlineTransparency = 0
    destaque.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    destaque.Parent = objeto

    -- Etiqueta acima do doce
    local etiqueta = Instance.new("BillboardGui")
    etiqueta.Name = "CandyLabel"
    etiqueta.Adornee = parte
    etiqueta.Size = UDim2.fromOffset(180, 42)
    etiqueta.StudsOffsetWorldSpace = Vector3.new(0, 2.5, 0)
    etiqueta.AlwaysOnTop = true
    etiqueta.Enabled = true
    etiqueta.Parent = objeto

    local texto = Instance.new("TextLabel")
    texto.Name = "Info"
    texto.Size = UDim2.fromScale(1, 1)
    texto.BackgroundTransparency = 1
    texto.TextColor3 = Color3.new(1, 1, 1)
    texto.TextStrokeTransparency = 0.25
    texto.Font = Enum.Font.GothamBold
    texto.TextSize = 14
    texto.Text = objeto.Name
    texto.Parent = etiqueta

    objetosESP[objeto] = {
        highlight = destaque,
        label = etiqueta,
        texto = texto,
        parte = parte
    }
end

local function removerESP(objeto)
    local dados = objetosESP[objeto]

    if not dados then
        return
    end

    dados.highlight:Destroy()
    dados.label:Destroy()
    objetosESP[objeto] = nil
end

local function limparESP()
    for objeto in pairs(objetosESP) do
        removerESP(objeto)
    end
end

local function atualizarESP()
    if not espAtivo then
        return
    end

    local personagem = Players.LocalPlayer.Character
    local raiz = personagem
        and personagem:FindFirstChild("HumanoidRootPart")

    for _, objeto in ipairs(Workspace.LocalCandy2026:GetChildren()) do
        criarESP(objeto)
    end

    for objeto, dados in pairs(objetosESP) do
        if not objeto:IsDescendantOf(pastaDoces) then
            removerESP(objeto)
        elseif raiz and dados.parte.Parent then
            local distancia = (raiz.Position - dados.parte.Position).Magnitude
            dados.texto.Text = objeto.Name
                .. "\n" .. math.floor(distancia) .. " studs"
        end
    end
end

espButton.Activated:Connect(function()
    espAtivo = not espAtivo

    if espAtivo then
        espButton.Text = "ESP: ON"
        espButton.BackgroundColor3 = Color3.fromRGB(35, 150, 95)
        atualizarESP()
    else
        espButton.Text = "ESP: OFF"
        espButton.BackgroundColor3 = Color3.fromRGB(65, 67, 85)
        limparESP()
    end
end)

-- Atualiza as distâncias e detecta novos doces.
task.spawn(function()
    while gui.Parent do
        if espAtivo then
            atualizarESP()
        end

        task.wait(0.5)
    end
end)


    local function AutoFarm()
        local endpos = Vector3.new(729, 44, -100)
        local CandyCrate = Workspace.LocalCandy2026

        local plr = game:getService("Players").LocalPlayer
        local char = plr.Character

        char:MoveTo(endpos)
        task.wait(1)
        for _, v in pairs(CandyCrate:GetChildren()) do
	    char:MoveTo(v.PrimaryPart.Position)
        end
end
toggle.Activated:Connect(function()
    ativo = not ativo

    if ativo then
        toggle.Text = "Auto Farm: ON"
        toggle.BackgroundColor3 =
            Color3.fromRGB(35, 150, 95)
        status.Text = "Status: Ativado"
        while ativo do
        AutoFarm()
        task.wait(1)
        end
    else
        toggle.Text = "Auto Farm: OFF"
        toggle.BackgroundColor3 =
            Color3.fromRGB(65, 67, 85)
        status.Text = "Status: Desativado"
    end
end)

minimizar.Activated:Connect(function()
    minimizado = not minimizado

    toggle.Visible = not minimizado
    status.Visible = not minimizado
    espButton.Visible = not minimizado

    frame.Size = minimizado
        and UDim2.fromOffset(300, 45)
        or UDim2.fromOffset(300, 200)

    minimizar.Text = minimizado and "+" or "—"
end)
