
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
frame.Size = UDim2.fromOffset(400, 250)
frame.Position = UDim2.new(0, 30, 0.3, 0)
frame.BackgroundColor3 = Color3.fromRGB(17, 16, 25)
frame.BorderSizePixel = 0
frame.Parent = gui

local frameCorner = Instance.new("UICorner")
frameCorner.CornerRadius = UDim.new(0, 12)
frameCorner.Parent = frame

local frameStroke = Instance.new("UIStroke")
frameStroke.Color = Color3.fromRGB(67, 48, 91)
frameStroke.Thickness = 1
frameStroke.Transparency = 0.25
frameStroke.Parent = frame
local sidebar = Instance.new("Frame")
sidebar.Name = "Sidebar"
sidebar.Size = UDim2.new(0, 115, 1, -58)
sidebar.Position = UDim2.fromOffset(10, 48)
sidebar.BackgroundColor3 = Color3.fromRGB(25, 20, 34)
sidebar.BorderSizePixel = 0
sidebar.Parent = frame
local function criarBotaoSidebar(nome, texto, ordem)
	local botao = Instance.new("TextButton")
    botao.Name = nome
    botao.Size = UDim2.new(1, -12, 0, 34)
    botao.Position = UDim2.fromOffset(6, 8 + (ordem - 1) * 40)
    botao.BackgroundColor3 = Color3.fromRGB(43, 32, 58)
    botao.BorderSizePixel = 0
    botao.Text = texto
    botao.TextColor3 = Color3.fromRGB(225, 211, 240)
    botao.TextSize = 13
    botao.Font = Enum.Font.GothamMedium
    botao.Parent = sidebar

    local canto = Instance.new("UICorner")
    canto.CornerRadius = UDim.new(0, 7)
    canto.Parent = botao

    return botao
end

local botaoInicio = criarBotaoSidebar("Inicio", "⌂ Inicio", 1)
local botaoVisual = criarBotaoSidebar("Visual", "◉ Visual", 2)
local botaoAjustes = criarBotaoSidebar("Ajustes", "⚙ Ajustes", 3)
local conteudo = Instance.new("Frame")
conteudo.Name = "Conteudo"
conteudo.Size = UDim2.new(1, -145, 1, -58)
conteudo.Position = UDim2.fromOffset(135, 48)
conteudo.BackgroundColor3 = Color3.fromRGB(25, 20 ,34)
conteudo.BorderSizePixel = 0
conteudo.Parent = frame
conteudo.ZIndex = 2

local conteudoCorner = Instance.new("UICorner")
conteudoCorner.CornerRadius = UDim.new(0, 8)
conteudoCorner.Parent = conteudo

local tituloPagina = Instance.new("TextLabel")
tituloPagina.Name = "TituloPagina"
tituloPagina.Size = UDim2.new(1, -24, 0, 32)
tituloPagina.Position = UDim2.fromOffset(12, 10)
tituloPagina.BackgroundTransparency = 1
tituloPagina.Text = "Inicio"
tituloPagina.TextColor3 = Color3.fromRGB(240, 230, 255)
tituloPagina.TextSize = 18
tituloPagina.Font = Enum.Font.GothamBold
tituloPagina.TextXAlignment = Enum.TextXAlignment.Left
tituloPagina.Parent = conteudo
tituloPagina.ZIndex = 3
tituloPagina.Visible = true
tituloPagina.TextTransparency = 0
tituloPagina.TextColor3 = Color3.fromRGB(240, 230, 255)

local descricaoPagina = Instance.new("TextLabel")
descricaoPagina.Name = "DescricaoPagina"
descricaoPagina.Size = UDim2.new(1, -24, 0, 40)
descricaoPagina.Position = UDim2.fromOffset(12, 45)
descricaoPagina.BackgroundTransparency = 1
descricaoPagina.Text = "🍬 Bem-vindo ao Candy Panel 🍬"
descricaoPagina.TextColor3 = Color3.fromRGB(177, 163, 194)
descricaoPagina.TextSize = 12
descricaoPagina.Font = Enum.Font.Gotham
descricaoPagina.TextWrapped = true
descricaoPagina.TextXAlignment = Enum.TextXAlignment.Left
descricaoPagina.TextYAlignment = Enum.TextYAlignment.Top
descricaoPagina.Parent = conteudo
descricaoPagina.ZIndex = 3
descricaoPagina.Visible = true
descricaoPagina.TextTransparency = 0
local areaInicio = Instance.new("Frame")
areaInicio.Name = "AreaInicio"
areaInicio.Size = UDim2.new(1, -24, 1, -100)
areaInicio.Position = UDim2.fromOffset(12, 88)
areaInicio.BackgroundTransparency = 1
areaInicio.Parent = conteudo

local areaVisual = Instance.new("Frame")
areaVisual.Name = "AreaVisual"
areaVisual.Size = areaInicio.Size
areaVisual.Position = areaInicio.Position
areaVisual.BackgroundTransparency = 1
areaVisual.Visible = false
areaVisual.Parent = conteudo
local areaAjustes = Instance.new("Frame")
areaAjustes.Name = "AreaAjustes"
areaAjustes.Size = areaInicio.Size
areaAjustes.Position = areaInicio.Position
areaAjustes.BackgroundTransparency = 1
areaAjustes.Visible = false
areaAjustes.Parent = conteudo
local botaoTema = Instance.new("TextButton")
botaoTema.Name = "BotaoTema"
botaoTema.Size = UDim2.new(1, 0, 0, 38)
botaoTema.Position = UDim2.fromOffset(0, 0)
botaoTema.BackgroundColor3 = Color3.fromRGB(48, 35, 66)
botaoTema.BorderSizePixel = 0
botaoTema.Text = "Tema escuro: OFF"
botaoTema.TextColor3 = Color3.fromRGB(255, 255, 255)
botaoTema.TextSize = 13
botaoTema.Font = Enum.Font.GothamBold
botaoTema.Parent = areaAjustes
botaoTema.Visible = true
botaoTema.ZIndex = 4

local cantoTema = Instance.new("UICorner")
cantoTema.CornerRadius = UDim.new(0, 8)
cantoTema.Parent = botaoTema

local temaEscuro = false

botaoTema.Activated:Connect(function()
    temaEscuro = not temaEscuro

    if temaEscuro then
        conteudo.BackgroundColor3 = Color3.fromRGB(12, 10, 17)
        sidebar.BackgroundColor3 = Color3.fromRGB(18, 15, 24)
        botaoTema.Text = "Tema escuro: ON"
        botaoTema.BackgroundColor3 = Color3.fromRGB(105, 67, 150)
    else
        conteudo.BackgroundColor3 = Color3.fromRGB(25, 20, 34)
        sidebar.BackgroundColor3 = Color3.fromRGB(25, 20, 34)
        botaoTema.Text = "Tema escuro: OFF"
        botaoTema.BackgroundColor3 = Color3.fromRGB(48, 35, 66)
    end
end)



local function trocarPagina(nome, descricao, botaoSelecionado)
    tituloPagina.Text = nome
    descricaoPagina.Text = descricao

    areaInicio.Visible = nome == "Início" or nome == "Inicio"
    areaVisual.Visible = nome == "Visual"
    areaAjustes.Visible = nome == "Ajustes"

    local botoes = {
        botaoInicio,
        botaoVisual,
        botaoAjustes
    }

    for _, botao in ipairs(botoes) do
        botao.BackgroundColor3 = Color3.fromRGB(43, 32, 58)
        botao.TextColor3 = Color3.fromRGB(225, 211, 240)
    end

    botaoSelecionado.BackgroundColor3 = Color3.fromRGB(105, 67, 150)
    botaoSelecionado.TextColor3 = Color3.fromRGB(255, 255, 255)
end


botaoInicio.Activated:Connect(function()
    trocarPagina(
        "Início",
        "Bem-vindo ao Candy Panel!",
        botaoInicio
    )
end)

botaoVisual.Activated:Connect(function()
    trocarPagina(
        "Visual",
        "O tal do ESP de Doces.",
        botaoVisual
    )
end)

botaoAjustes.Activated:Connect(function()
    trocarPagina(
        "Ajustes",
        "Só se você quiser deixar mais escuro.",
        botaoAjustes
    )
end)

trocarPagina(
    "Início",
    "AutoFarm pra você seu preguiçoso",
    botaoInicio
)

local sidebarCorner = Instance.new("UICorner")
sidebarCorner.CornerRadius = UDim.new(0, 8)
sidebarCorner.Parent = sidebar

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
minimizar.BackgroundColor3 = Color3.fromRGB(43, 32, 58)
minimizar.TextColor3 = Color3.new(1, 1, 1)
minimizar.Parent = frame
minimizar.BorderSizePixel = 0
minimizar.AutoButtonColor = true

local minimizarCorner = Instance.new("UICorner")
minimizarCorner.CornerRadius = UDim.new(0, 8)
minimizarCorner.Parent = minimizar

local toggle = Instance.new("TextButton")
toggle.Size = UDim2.new(1, 0, 0, 38)
toggle.Position = UDim2.fromOffset(0, 0)
toggle.ZIndex = 4
toggle.Text = "Auto Farm: OFF"
toggle.TextSize = 15
toggle.Font = Enum.Font.GothamBold
toggle.TextColor3 = Color3.new(1, 1, 1)
toggle.BackgroundColor3 = Color3.fromRGB(48, 35, 66)
toggle.Parent = areaInicio
toggle.BorderSizePixel = 0

local toggleCorner = Instance.new("UICorner")
toggleCorner.CornerRadius = UDim.new(0, 8)
toggleCorner.Parent = toggle

local status = Instance.new("TextLabel")
status.Size = UDim2.new(1, 0, 0, 32)
status.Position = UDim2.fromOffset(0, 45)
status.Parent = areaInicio
status.ZIndex = 4
status.BackgroundTransparency = 1
status.Text = "Status: Desativado"
status.TextColor3 = Color3.fromRGB(220, 220, 230)
status.TextSize = 14
status.Font = Enum.Font.Gotham
status.TextXAlignment = Enum.TextXAlignment.Left
status.Parent = areaInicio

local espButton = Instance.new("TextButton")
espButton.Name = "ESPButton"
espButton.Size = UDim2.new(1, 0, 0, 38)
espButton.Position = UDim2.fromOffset(0, 0)
espButton.Text = "ESP: OFF"
espButton.TextSize = 15
espButton.Visible = true
espButton.ZIndex = 5
espButton.Font = Enum.Font.GothamBold
espButton.TextColor3 = Color3.new(1, 1, 1)
espButton.BackgroundColor3 = Color3.fromRGB(48, 35, 66)
espButton.Parent = areaVisual

local espCorner = Instance.new("UICorner")
espCorner.CornerRadius = UDim.new(0, 8)
espCorner.Parent = espButton
toggle.Visible = true
status.Visible = true
espButton.Visible = true

local function estilizarBotao(botao)
    botao.AutoButtonColor = true
    botao.BorderSizePixel = 0

    local gradiente = Instance.new("UIGradient")
    gradiente.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(65, 47, 88)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(37, 27, 51))
    })
    gradiente.Rotation = 90
    gradiente.Parent = botao

    local borda = Instance.new("UIStroke")
    borda.Color = Color3.fromRGB(91, 66, 119)
    borda.Thickness = 1
    borda.Transparency = 0.45
    borda.Parent = botao
end

estilizarBotao(toggle)
estilizarBotao(espButton)



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

    for _, objeto in ipairs(pastaDoces:GetChildren()) do
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
        espButton.BackgroundColor3 = Color3.fromRGB(105, 67, 150)
        atualizarESP()
    else
        espButton.Text = "ESP: OFF"
        espButton.BackgroundColor3 = Color3.fromRGB(48, 35, 66)
        limparESP()
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
            Color3.fromRGB(105, 67, 150)
        status.Text = "Status: Ativado"
        while ativo do
        AutoFarm()
        task.wait(1)
        end
    else
        toggle.Text = "Auto Farm: OFF"
        toggle.BackgroundColor3 =
            Color3.fromRGB(48, 35, 66)
        status.Text = "Status: Desativado"
    end
end)

minimizar.Activated:Connect(function()
    minimizado = not minimizado

    sidebar.Visible = not minimizado
    conteudo.Visible = not minimizado

    frame.Size = minimizado
        and UDim2.fromOffset(400, 45)
        or UDim2.fromOffset(400, 250)

    minimizar.Text = minimizado and "+" or "—"
end)
