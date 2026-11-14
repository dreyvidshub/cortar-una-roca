-- ==========================================================
--  DREY HUB · COORD TP · v8.5
--  Versión estable: sin emojis, logo comprimido, bucle manual.
-- ==========================================================

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")

local LP = Players.LocalPlayer
if not LP then
	repeat
		task.wait(0.1)
		LP = Players.LocalPlayer
	until LP ~= nil
end
local PG = LP:WaitForChild("PlayerGui")

--==============================================================
--  LOGO COMPRIMIDO
--==============================================================
local B64 = [[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]]

local function b64Decode(texto)
	if not bit32 then
		return ""
	end
	local alfa = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
	local look = {}
	for i = 1, #alfa do
		look[alfa:byte(i)] = i - 1
	end
	local out = {}
	local acc, nbits = 0, 0
	for i = 1, #texto do
		local b = texto:byte(i)
		local v = look[b]
		if v then
			acc = bit32.bor(bit32.lshift(acc, 6), v)
			nbits = nbits + 6
			if nbits >= 8 then
				nbits = nbits - 8
				out[#out + 1] = string.char(bit32.band(bit32.rshift(acc, nbits), 255))
				acc = bit32.band(acc, bit32.lshift(1, nbits) - 1)
			end
		elseif b == 61 then
			break
		end
	end
	return table.concat(out)
end

local logoUrl = nil
pcall(function()
	local env = (getgenv and getgenv()) or _G
	local assetFn
	for _, nome in ipairs({ "getcustomasset", "getsynasset", "get_syn_asset", "getasset" }) do
		local f = env[nome] or rawget(_G, nome)
		if type(f) == "function" then
			assetFn = f
			break
		end
	end
	if assetFn and type(writefile) == "function" then
		local arquivo = "dreyvid_logo.png"
		local precisa = true
		if type(isfile) == "function" and type(readfile) == "function" then
			local okFile, existe = pcall(isfile, arquivo)
			if okFile and existe then
				local okRead, conteudo = pcall(readfile, arquivo)
				if okRead and type(conteudo) == "string" and #conteudo > 1000 then
					precisa = false
				end
			end
		end
		if precisa then
			writefile(arquivo, b64Decode(B64))
		end
		local url = assetFn(arquivo)
		if type(url) == "string" and url ~= "" then
			logoUrl = url
		end
	end
end)

--==============================================================
--  PALETA
--==============================================================
local CREAM    = Color3.fromRGB(245, 232, 218)
local LATTE    = Color3.fromRGB(216, 178, 140)
local ESPRESSO = Color3.fromRGB(24, 19, 15)
local PANEL    = Color3.fromRGB(36, 30, 25)
local PANEL_L  = Color3.fromRGB(54, 45, 37)
local MUTED    = Color3.fromRGB(165, 154, 142)
local OKC      = Color3.fromRGB(146, 208, 148)
local ERR      = Color3.fromRGB(220, 112, 96)

local ARCHIVO = "DreyHub_V8_2.json"

--==============================================================
--  DATOS
--==============================================================
local defaultData = {
	{ name = "Rompe una roca", coords = {} },
	{
		name = "Motocicletas",
		coords = {
			{ name = "Mundo 1", pos = Vector3.new(-8486.3, 2605.3, -480.2), loop = false },
			{ name = "Mundo 2", pos = Vector3.new(-8483.5, 2605.1, -2469.9), loop = false },
		},
	},
}

local hubData = {}
local tabActual = 1

local function copiarTab(dados)
	local coords = {}
	for _, c in ipairs(dados.coords or {}) do
		table.insert(coords, {
			name = tostring(c.name or "Punto"),
			pos = Vector3.new(tonumber(c.x) or 0, tonumber(c.y) or 0, tonumber(c.z) or 0),
			loop = c.loop == true,
		})
	end
	return { name = tostring(dados.name or "Juego"), coords = coords }
end

local function guardarDatos()
	pcall(function()
		local saida = {}
		for _, tab in ipairs(hubData) do
			local coords = {}
			for _, c in ipairs(tab.coords) do
				table.insert(coords, {
					name = c.name, x = c.pos.X, y = c.pos.Y, z = c.pos.Z, loop = c.loop == true,
				})
			end
			table.insert(saida, { name = tab.name, coords = coords })
		end
		if type(writefile) == "function" then
			writefile(ARCHIVO, HttpService:JSONEncode({ tabs = saida, actual = tabActual }))
		end
	end)
end

local function cargarDatos()
	local ok = pcall(function()
		if type(isfile) ~= "function" or type(readfile) ~= "function" then
			return
		end
		if not isfile(ARCHIVO) then
			return
		end
		local raw = readfile(ARCHIVO)
		if type(raw) ~= "string" or raw == "" then
			return
		end
		local datos = HttpService:JSONDecode(raw)
		if type(datos) ~= "table" then
			return
		end
		local tabs = datos.tabs or datos
		if type(tabs) ~= "table" or #tabs == 0 then
			return
		end
		hubData = {}
		for _, t in ipairs(tabs) do
			if type(t) == "table" then
				table.insert(hubData, copiarTab(t))
			end
		end
		tabActual = tonumber(datos.actual) or 1
	end)
	if not ok or #hubData == 0 then
		hubData = {}
		for _, t in ipairs(defaultData) do
			table.insert(hubData, copiarTab(t))
		end
	end
	if tabActual < 1 or tabActual > #hubData then
		tabActual = 1
	end
end

local function asegurarDefaults()
	local nomes = {}
	for _, tab in ipairs(hubData) do
		nomes[tab.name] = true
	end
	for _, tab in ipairs(defaultData) do
		if not nomes[tab.name] then
			table.insert(hubData, copiarTab(tab))
		end
	end
end

local function repararCoords()
	local conhecidas = {
		{ name = "Mundo 1", pos = Vector3.new(-8486.3, 2605.3, -480.2) },
		{ name = "Mundo 2", pos = Vector3.new(-8483.5, 2605.1, -2469.9) },
	}
	for _, tab in ipairs(hubData) do
		if tab.name == "Motocicletas" then
			if #tab.coords == 0 then
				for _, m in ipairs(conhecidas) do
					table.insert(tab.coords, { name = m.name, pos = m.pos, loop = false })
				end
			else
				for i, c in ipairs(tab.coords) do
					if (not c.pos) or c.pos.Magnitude < 1 then
						local m = conhecidas[i] or conhecidas[#conhecidas]
						c.pos = m.pos
						if c.name == nil or c.name == "" then
							c.name = m.name
						end
					end
				end
			end
		end
	end
end

cargarDatos()
asegurarDefaults()
repararCoords()
guardarDatos()

--==============================================================
--  ARRANQUE
--==============================================================
local function iniciar()
	local SG = Instance.new("ScreenGui")
	SG.Name = "DreyHubV8"
	SG.ResetOnSpawn = false
	SG.IgnoreGuiInset = true
	SG.DisplayOrder = 430
	SG.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	SG.Parent = PG

	local ref = {}
	ref.SG = SG

	local function novo(tipo, props, pai)
		local obj = Instance.new(tipo)
		for k, v in pairs(props or {}) do
			obj[k] = v
		end
		if pai then
			obj.Parent = pai
		end
		return obj
	end

	local function canto(pai, r)
		local c = Instance.new("UICorner")
		c.CornerRadius = UDim.new(0, r or 8)
		c.Parent = pai
	end

	local function borda(pai, cor, esp, trans)
		local s = Instance.new("UIStroke")
		s.Color = cor or LATTE
		s.Thickness = esp or 1
		s.Transparency = trans or 0.45
		s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		s.Parent = pai
	end

	-- ===== ventana =====
	local win = novo("Frame", {
		Position = UDim2.fromScale(0.66, 0.03),
		Size = UDim2.fromOffset(396, 620),
		BackgroundColor3 = ESPRESSO,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		Active = true,
	}, SG)
	canto(win, 20)
	borda(win, LATTE, 1, 0.6)
	ref.win = win

	novo("UIGradient", {
		Rotation = 90,
		Color = ColorSequence.new({
			ColorSequenceKeypoint.new(0, Color3.fromRGB(32, 26, 20)),
			ColorSequenceKeypoint.new(1, ESPRESSO),
		}),
	}, win)

	local acento = novo("Frame", {
		Size = UDim2.new(1, 0, 0, 2),
		BackgroundColor3 = LATTE,
		BorderSizePixel = 0,
		ZIndex = 5,
	}, win)
	novo("UIGradient", {
		Color = ColorSequence.new({
			ColorSequenceKeypoint.new(0, LATTE),
			ColorSequenceKeypoint.new(0.5, CREAM),
			ColorSequenceKeypoint.new(1, LATTE),
		}),
	}, acento)

	-- ===== header =====
	local header = novo("Frame", {
		Size = UDim2.new(1, 0, 0, 62),
		BackgroundColor3 = PANEL,
		BackgroundTransparency = 0.25,
		BorderSizePixel = 0,
	}, win)
	canto(header, 20)
	ref.header = header

	novo("Frame", {
		Size = UDim2.new(1, 0, 0, 20),
		Position = UDim2.new(0, 0, 1, -20),
		BackgroundColor3 = PANEL,
		BackgroundTransparency = 0.25,
		BorderSizePixel = 0,
	}, header)

	local caixaLogo = novo("Frame", {
		Size = UDim2.fromOffset(38, 38),
		Position = UDim2.fromOffset(14, 12),
		BackgroundColor3 = PANEL_L,
		BorderSizePixel = 0,
	}, header)
	canto(caixaLogo, 12)
	borda(caixaLogo, LATTE, 1, 0.35)

	novo("ImageLabel", {
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = 1,
		Image = logoUrl or "",
		ScaleType = Enum.ScaleType.Fit,
		Visible = logoUrl ~= nil,
	}, caixaLogo)

	novo("TextLabel", {
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = 1,
		Font = Enum.Font.GothamBlack,
		Text = "D",
		TextColor3 = LATTE,
		TextSize = 20,
		Visible = logoUrl == nil,
	}, caixaLogo)

	novo("TextLabel", {
		Position = UDim2.fromOffset(62, 10),
		Size = UDim2.new(1, -150, 0, 20),
		BackgroundTransparency = 1,
		Font = Enum.Font.GothamBlack,
		Text = "DREY HUB",
		TextColor3 = CREAM,
		TextSize = 17,
		TextXAlignment = Enum.TextXAlignment.Left,
	}, header)

	novo("TextLabel", {
		Position = UDim2.fromOffset(62, 31),
		Size = UDim2.new(1, -150, 0, 14),
		BackgroundTransparency = 1,
		Font = Enum.Font.Gotham,
		Text = "COORD TP  ·  V8.5",
		TextColor3 = LATTE,
		TextSize = 9,
		TextXAlignment = Enum.TextXAlignment.Left,
	}, header)

	local btnMin = novo("TextButton", {
		AnchorPoint = Vector2.new(1, 0),
		Position = UDim2.new(1, -12, 0, 14),
		Size = UDim2.fromOffset(30, 30),
		BackgroundColor3 = PANEL_L,
		BorderSizePixel = 0,
		Font = Enum.Font.GothamBold,
		Text = "-",
		TextColor3 = CREAM,
		TextSize = 16,
		AutoButtonColor = false,
	}, header)
	canto(btnMin, 10)
	borda(btnMin, LATTE, 1, 0.4)
	ref.btnMin = btnMin

	-- ===== pestañas =====
	local tabScroll = novo("ScrollingFrame", {
		Position = UDim2.fromOffset(14, 72),
		Size = UDim2.new(1, -28, 0, 32),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ScrollBarThickness = 2,
		ScrollBarImageColor3 = LATTE,
		CanvasSize = UDim2.new(0, 0, 0, 0),
		ScrollingDirection = Enum.ScrollingDirection.X,
	}, win)
	ref.tabScroll = tabScroll

	novo("UIListLayout", {
		FillDirection = Enum.FillDirection.Horizontal,
		SortOrder = Enum.SortOrder.LayoutOrder,
		Padding = UDim.new(0, 6),
	}, tabScroll)

	-- ===== posición =====
	local liveCard = novo("Frame", {
		Position = UDim2.fromOffset(14, 112),
		Size = UDim2.new(1, -28, 0, 66),
		BackgroundColor3 = PANEL,
		BackgroundTransparency = 0.2,
		BorderSizePixel = 0,
	}, win)
	canto(liveCard, 12)
	borda(liveCard, PANEL_L, 1, 0.1)

	novo("Frame", {
		Size = UDim2.new(0, 3, 1, -16),
		Position = UDim2.fromOffset(0, 8),
		BackgroundColor3 = OKC,
		BorderSizePixel = 0,
	}, liveCard)

	novo("TextLabel", {
		Position = UDim2.fromOffset(14, 8),
		Size = UDim2.new(1, -110, 0, 14),
		BackgroundTransparency = 1,
		Font = Enum.Font.GothamBold,
		Text = "TU POSICIÓN",
		TextColor3 = LATTE,
		TextSize = 9,
		TextXAlignment = Enum.TextXAlignment.Left,
	}, liveCard)

	local liveLabel = novo("TextLabel", {
		Position = UDim2.fromOffset(14, 24),
		Size = UDim2.new(1, -120, 0, 24),
		BackgroundTransparency = 1,
		Font = Enum.Font.Code,
		Text = "esperando personaje...",
		TextColor3 = CREAM,
		TextSize = 13,
		TextXAlignment = Enum.TextXAlignment.Left,
	}, liveCard)
	ref.liveLabel = liveLabel

	local btnCopiar = novo("TextButton", {
		AnchorPoint = Vector2.new(1, 0),
		Position = UDim2.new(1, -12, 0, 20),
		Size = UDim2.fromOffset(84, 26),
		BackgroundColor3 = PANEL_L,
		BorderSizePixel = 0,
		Font = Enum.Font.GothamBold,
		Text = "COPIAR",
		TextColor3 = CREAM,
		TextSize = 9,
		AutoButtonColor = false,
	}, liveCard)
	canto(btnCopiar, 8)
	borda(btnCopiar, LATTE, 1, 0.5)
	ref.btnCopiar = btnCopiar

	-- ===== formulario =====
	local form = novo("Frame", {
		Position = UDim2.fromOffset(14, 186),
		Size = UDim2.new(1, -28, 0, 110),
		BackgroundColor3 = PANEL,
		BackgroundTransparency = 0.2,
		BorderSizePixel = 0,
	}, win)
	canto(form, 12)
	borda(form, PANEL_L, 1, 0.1)

	novo("TextLabel", {
		Position = UDim2.fromOffset(14, 8),
		Size = UDim2.new(1, -28, 0, 14),
		BackgroundTransparency = 1,
		Font = Enum.Font.GothamBold,
		Text = "AGREGAR COORDENADA",
		TextColor3 = LATTE,
		TextSize = 9,
		TextXAlignment = Enum.TextXAlignment.Left,
	}, form)

	local inputNombre = novo("TextBox", {
		Position = UDim2.fromOffset(14, 26),
		Size = UDim2.new(0.5, -18, 0, 26),
		BackgroundColor3 = PANEL_L,
		BorderSizePixel = 0,
		Font = Enum.Font.Gotham,
		Text = "",
		PlaceholderText = "Nombre (ej: Base)",
		PlaceholderColor3 = MUTED,
		TextColor3 = CREAM,
		TextSize = 11,
		TextXAlignment = Enum.TextXAlignment.Left,
		ClearTextOnFocus = false,
	}, form)
	canto(inputNombre, 8)
	borda(inputNombre, LATTE, 1, 0.6)
	ref.inputNombre = inputNombre

	local inputCoords = novo("TextBox", {
		Position = UDim2.new(0.5, 0, 0, 26),
		Size = UDim2.new(0.5, -14, 0, 26),
		BackgroundColor3 = PANEL_L,
		BorderSizePixel = 0,
		Font = Enum.Font.Code,
		Text = "",
		PlaceholderText = "X, Y, Z",
		PlaceholderColor3 = MUTED,
		TextColor3 = CREAM,
		TextSize = 11,
		TextXAlignment = Enum.TextXAlignment.Left,
		ClearTextOnFocus = false,
	}, form)
	canto(inputCoords, 8)
	borda(inputCoords, LATTE, 1, 0.6)
	ref.inputCoords = inputCoords

	local switchLoop = novo("TextButton", {
		Position = UDim2.fromOffset(14, 62),
		Size = UDim2.fromOffset(40, 20),
		BackgroundColor3 = Color3.fromRGB(70, 62, 58),
		BorderSizePixel = 0,
		Text = "",
		AutoButtonColor = false,
	}, form)
	canto(switchLoop, 10)
	ref.switchLoop = switchLoop

	local knob = novo("Frame", {
		Position = UDim2.fromOffset(2, 2),
		Size = UDim2.fromOffset(16, 16),
		BackgroundColor3 = CREAM,
		BorderSizePixel = 0,
	}, switchLoop)
	canto(knob, 8)
	ref.knob = knob

	local loopTexto = novo("TextLabel", {
		Position = UDim2.fromOffset(60, 64),
		Size = UDim2.new(0, 90, 0, 16),
		BackgroundTransparency = 1,
		Font = Enum.Font.GothamBold,
		Text = "BUCLE: OFF",
		TextColor3 = MUTED,
		TextSize = 9,
		TextXAlignment = Enum.TextXAlignment.Left,
	}, form)
	ref.loopTexto = loopTexto

	local btnMiPos = novo("TextButton", {
		Position = UDim2.fromOffset(14, 82),
		Size = UDim2.new(0.5, -20, 0, 22),
		BackgroundColor3 = OKC,
		BorderSizePixel = 0,
		Font = Enum.Font.GothamBold,
		Text = "MI POSICIÓN",
		TextColor3 = ESPRESSO,
		TextSize = 9,
		AutoButtonColor = false,
	}, form)
	canto(btnMiPos, 7)
	ref.btnMiPos = btnMiPos

	local btnManual = novo("TextButton", {
		Position = UDim2.new(0.5, 0, 0, 82),
		Size = UDim2.new(0.5, -14, 0, 22),
		BackgroundColor3 = LATTE,
		BorderSizePixel = 0,
		Font = Enum.Font.GothamBold,
		Text = "+ MANUAL",
		TextColor3 = ESPRESSO,
		TextSize = 9,
		AutoButtonColor = false,
	}, form)
	canto(btnManual, 7)
	ref.btnManual = btnManual

	-- ===== lista =====
	local lista = novo("ScrollingFrame", {
		Position = UDim2.fromOffset(14, 304),
		Size = UDim2.new(1, -28, 1, -368),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ScrollBarThickness = 4,
		ScrollBarImageColor3 = LATTE,
		CanvasSize = UDim2.new(0, 0, 0, 0),
	}, win)
	ref.lista = lista
	novo("UIListLayout", {
		SortOrder = Enum.SortOrder.LayoutOrder,
		Padding = UDim.new(0, 6),
	}, lista)

	-- ===== barra inferior =====
	local barra = novo("Frame", {
		Position = UDim2.new(0, 14, 1, -58),
		Size = UDim2.new(1, -28, 0, 48),
		BackgroundColor3 = PANEL,
		BackgroundTransparency = 0.2,
		BorderSizePixel = 0,
	}, win)
	canto(barra, 12)

	local estado = novo("TextLabel", {
		Position = UDim2.fromOffset(12, 7),
		Size = UDim2.new(1, -24, 0, 14),
		BackgroundTransparency = 1,
		Font = Enum.Font.Gotham,
		Text = "listo · guardado automático",
		TextColor3 = MUTED,
		TextSize = 9,
		TextXAlignment = Enum.TextXAlignment.Left,
	}, barra)
	ref.estado = estado

	local btnReset = novo("TextButton", {
		Position = UDim2.fromOffset(12, 25),
		Size = UDim2.fromOffset(92, 17),
		BackgroundColor3 = PANEL_L,
		BorderSizePixel = 0,
		Font = Enum.Font.GothamBold,
		Text = "RESET HUB",
		TextColor3 = ERR,
		TextSize = 8,
		AutoButtonColor = false,
	}, barra)
	canto(btnReset, 5)
	ref.btnReset = btnReset

	local contador = novo("TextLabel", {
		AnchorPoint = Vector2.new(1, 0),
		Position = UDim2.new(1, -12, 0, 25),
		Size = UDim2.fromOffset(160, 17),
		BackgroundTransparency = 1,
		Font = Enum.Font.Gotham,
		Text = "",
		TextColor3 = MUTED,
		TextSize = 8,
		TextXAlignment = Enum.TextXAlignment.Right,
	}, barra)
	ref.contador = contador

	-- ===== toast =====
	local toast = novo("TextLabel", {
		AnchorPoint = Vector2.new(1, 0),
		Position = UDim2.new(1, -14, 0, 14),
		Size = UDim2.fromOffset(160, 24),
		BackgroundColor3 = PANEL_L,
		BorderSizePixel = 0,
		Font = Enum.Font.GothamBold,
		Text = "",
		TextColor3 = OKC,
		TextSize = 9,
		Visible = false,
		ZIndex = 200,
	}, win)
	canto(toast, 8)
	borda(toast, LATTE, 1, 0.5)

	local toastToken = 0
	local function avisar(texto, cor)
		toastToken = toastToken + 1
		local token = toastToken
		toast.Text = tostring(texto)
		toast.TextColor3 = cor or OKC
		toast.Visible = true
		task.delay(1.6, function()
			if toastToken == token then
				toast.Visible = false
			end
		end)
	end

	-- ===== arrastrar ventana =====
	local arrastando, dragInicio, posInicio = false, nil, nil
	header.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1
			or input.UserInputType == Enum.UserInputType.Touch then
			arrastando = true
			dragInicio = input.Position
			posInicio = win.Position
		end
	end)
	UserInputService.InputChanged:Connect(function(input)
		if not arrastando or not dragInicio then
			return
		end
		if input.UserInputType == Enum.UserInputType.MouseMovement
			or input.UserInputType == Enum.UserInputType.Touch then
			local delta = input.Position - dragInicio
			win.Position = UDim2.new(
				posInicio.X.Scale, posInicio.X.Offset + delta.X,
				posInicio.Y.Scale, posInicio.Y.Offset + delta.Y
			)
		end
	end)
	UserInputService.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1
			or input.UserInputType == Enum.UserInputType.Touch then
			arrastando = false
			dragInicio = nil
		end
	end)

	-- ===== minimizado movible =====
	local mini = novo("TextButton", {
		Position = UDim2.fromOffset(80, 320),
		Size = UDim2.fromOffset(56, 56),
		BackgroundColor3 = PANEL,
		BorderSizePixel = 0,
		Text = "",
		AutoButtonColor = false,
		Visible = false,
		ZIndex = 70,
	}, SG)
	canto(mini, 28)
	borda(mini, LATTE, 1.5, 0.35)
	ref.mini = mini

	novo("ImageLabel", {
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = 1,
		Image = logoUrl or "",
		ScaleType = Enum.ScaleType.Fit,
		Visible = logoUrl ~= nil,
		ZIndex = 71,
	}, mini)

	novo("TextLabel", {
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = 1,
		Font = Enum.Font.GothamBlack,
		Text = "D",
		TextColor3 = LATTE,
		TextSize = 22,
		Visible = logoUrl == nil,
		ZIndex = 71,
	}, mini)

	btnMin.MouseButton1Click:Connect(function()
		win.Visible = false
		mini.Visible = true
		mini.Size = UDim2.fromOffset(0, 0)
		TweenService:Create(mini, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
			Size = UDim2.fromOffset(56, 56),
		}):Play()
	end)

	local miniArrastrando, miniInicio, miniPos, miniMovido = false, nil, nil, false
	mini.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1
			or input.UserInputType == Enum.UserInputType.Touch then
			miniArrastrando = true
			miniInicio = input.Position
			miniPos = mini.Position
			miniMovido = false
		end
	end)
	UserInputService.InputChanged:Connect(function(input)
		if not miniArrastrando or not miniInicio then
			return
		end
		if input.UserInputType == Enum.UserInputType.MouseMovement
			or input.UserInputType == Enum.UserInputType.Touch then
			local delta = input.Position - miniInicio
			if delta.Magnitude > 4 then
				miniMovido = true
			end
			if miniMovido then
				mini.Position = UDim2.new(
					miniPos.X.Scale, miniPos.X.Offset + delta.X,
					miniPos.Y.Scale, miniPos.Y.Offset + delta.Y
				)
			end
		end
	end)
	UserInputService.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1
			or input.UserInputType == Enum.UserInputType.Touch then
			miniArrastrando = false
			miniInicio = nil
		end
	end)
	mini.MouseButton1Click:Connect(function()
		if miniMovido then
			miniMovido = false
			return
		end
		mini.Visible = false
		win.Visible = true
	end)

	-- ===== estado de bucle =====
	local loopAtivo = false
	local loopConexion = nil
	local loopCoord = nil
	local loopUltimo = 0

	local function pintarSwitch()
		if loopAtivo then
			switchLoop.BackgroundColor3 = OKC
			knob.Position = UDim2.fromOffset(22, 2)
			loopTexto.Text = "BUCLE: ON"
			loopTexto.TextColor3 = OKC
		else
			switchLoop.BackgroundColor3 = Color3.fromRGB(70, 62, 58)
			knob.Position = UDim2.fromOffset(2, 2)
			loopTexto.Text = "BUCLE: OFF"
			loopTexto.TextColor3 = MUTED
		end
	end
	switchLoop.MouseButton1Click:Connect(function()
		loopAtivo = not loopAtivo
		pintarSwitch()
	end)
	pintarSwitch()

	local function detenerLoop()
		if loopConexion then
			loopConexion:Disconnect()
			loopConexion = nil
		end
		loopCoord = nil
	end

	local function irA(pos)
		local char = LP.Character
		local hrp = char and char:FindFirstChild("HumanoidRootPart")
		if not hrp then
			return false
		end
		local hum = char:FindFirstChildOfClass("Humanoid")
		return pcall(function()
			if hum then
				hum.Sit = false
				hum.PlatformStand = false
			end
			hrp.CFrame = CFrame.new(pos + Vector3.new(0, 3.5, 0))
			hrp.AssemblyLinearVelocity = Vector3.zero
			hrp.AssemblyAngularVelocity = Vector3.zero
		end)
	end

	local function posActual()
		local char = LP.Character
		local hrp = char and char:FindFirstChild("HumanoidRootPart")
		return hrp and hrp.Position or nil
	end

	local function actualizarContador()
		local tab = hubData[tabActual]
		if tab then
			local loops = 0
			for _, c in ipairs(tab.coords) do
				if c.loop then
					loops = loops + 1
				end
			end
			contador.Text = #tab.coords .. " puntos · " .. loops .. " en bucle"
		end
	end

	-- ===== modales =====
	local modalJuego, inputJuego
	local modalEditar, inputEditar
	local coordEditando = nil

	local function crearModal(titulo, placeholder, textoBotao)
		local fundo = novo("Frame", {
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Size = UDim2.fromOffset(310, 146),
			BackgroundColor3 = PANEL,
			BorderSizePixel = 0,
			Visible = false,
			ZIndex = 300,
		}, SG)
		canto(fundo, 16)
		borda(fundo, LATTE, 1, 0.35)

		novo("TextLabel", {
			Position = UDim2.fromOffset(16, 14),
			Size = UDim2.new(1, -32, 0, 18),
			BackgroundTransparency = 1,
			Font = Enum.Font.GothamBold,
			Text = titulo,
			TextColor3 = CREAM,
			TextSize = 11,
			TextXAlignment = Enum.TextXAlignment.Left,
			ZIndex = 301,
		}, fundo)

		local caixa = novo("TextBox", {
			Position = UDim2.fromOffset(16, 40),
			Size = UDim2.new(1, -32, 0, 30),
			BackgroundColor3 = PANEL_L,
			BorderSizePixel = 0,
			Font = Enum.Font.Gotham,
			Text = "",
			PlaceholderText = placeholder,
			PlaceholderColor3 = MUTED,
			TextColor3 = CREAM,
			TextSize = 11,
			ClearTextOnFocus = false,
			ZIndex = 301,
		}, fundo)
		canto(caixa, 8)
		borda(caixa, LATTE, 1, 0.55)

		local okBtn = novo("TextButton", {
			Position = UDim2.fromOffset(16, 84),
			Size = UDim2.new(0.5, -24, 0, 28),
			BackgroundColor3 = OKC,
			BorderSizePixel = 0,
			Font = Enum.Font.GothamBold,
			Text = textoBotao,
			TextColor3 = ESPRESSO,
			TextSize = 10,
			ZIndex = 301,
			AutoButtonColor = false,
		}, fundo)
		canto(okBtn, 8)

		local noBtn = novo("TextButton", {
			Position = UDim2.new(0.5, 8, 0, 84),
			Size = UDim2.new(0.5, -24, 0, 28),
			BackgroundColor3 = PANEL_L,
			BorderSizePixel = 0,
			Font = Enum.Font.GothamBold,
			Text = "CANCELAR",
			TextColor3 = CREAM,
			TextSize = 10,
			ZIndex = 301,
			AutoButtonColor = false,
		}, fundo)
		canto(noBtn, 8)

		noBtn.MouseButton1Click:Connect(function()
			fundo.Visible = false
		end)

		return fundo, caixa, okBtn
	end

	local okJuego, okEditar
	modalJuego, inputJuego, okJuego = crearModal("NUEVO JUEGO", "Nombre del juego", "CREAR")
	modalEditar, inputEditar, okEditar = crearModal("EDITAR NOMBRE", "Nuevo nombre", "GUARDAR")

	-- ===== pestañas =====
	local function recargarTabs()
		for _, filho in ipairs(tabScroll:GetChildren()) do
			if filho:IsA("TextButton") then
				filho:Destroy()
			end
		end
		for i, tab in ipairs(hubData) do
			local ativo = (i == tabActual)
			local btn = novo("TextButton", {
				Size = UDim2.fromOffset(112, 32),
				BackgroundColor3 = ativo and LATTE or PANEL_L,
				BorderSizePixel = 0,
				Font = Enum.Font.GothamBold,
				Text = tab.name,
				TextColor3 = ativo and ESPRESSO or CREAM,
				TextSize = 9,
				LayoutOrder = i,
				AutoButtonColor = false,
			}, tabScroll)
			canto(btn, 9)
			if ativo then
				borda(btn, CREAM, 1, 0.7)
			end
			btn.MouseButton1Click:Connect(function()
				tabActual = i
				detenerLoop()
				recargarTabs()
				recargarLista()
				guardarDatos()
			end)
		end
		local btnAdd = novo("TextButton", {
			Size = UDim2.fromOffset(36, 32),
			BackgroundColor3 = OKC,
			BorderSizePixel = 0,
			Font = Enum.Font.GothamBlack,
			Text = "+",
			TextColor3 = ESPRESSO,
			TextSize = 17,
			LayoutOrder = #hubData + 1,
			AutoButtonColor = false,
		}, tabScroll)
		canto(btnAdd, 9)
		tabScroll.CanvasSize = UDim2.new(0, (#hubData + 1) * 120, 0, 0)
		btnAdd.MouseButton1Click:Connect(function()
			modalJuego.Visible = true
			inputJuego.Text = ""
		end)
	end

	okJuego.MouseButton1Click:Connect(function()
		local nome = inputJuego.Text
		if not nome:match("%S") then
			avisar("Escribí un nombre", ERR)
			return
		end
		table.insert(hubData, { name = nome, coords = {} })
		tabActual = #hubData
		modalJuego.Visible = false
		guardarDatos()
		recargarTabs()
		recargarLista()
		avisar("juego creado")
	end)

	okEditar.MouseButton1Click:Connect(function()
		if not coordEditando then
			return
		end
		local nome = inputEditar.Text
		if not nome:match("%S") then
			avisar("Escribí un nombre", ERR)
			return
		end
		coordEditando.name = nome
		modalEditar.Visible = false
		coordEditando = nil
		guardarDatos()
		recargarLista()
		avisar("nombre actualizado")
	end)

	local function abrirEditar(coord)
		coordEditando = coord
		inputEditar.Text = coord.name
		modalEditar.Visible = true
	end

	-- ===== lista =====
	local function agregarCoord(nome, pos, ehLoop)
		local tab = hubData[tabActual]
		if not tab then
			return
		end
		if not nome or not nome:match("%S") then
			nome = "Punto " .. tostring(#tab.coords + 1)
		end
		table.insert(tab.coords, { name = nome, pos = pos, loop = ehLoop == true })
		guardarDatos()
		recargarLista()
	end

	function recargarLista()
		for _, filho in ipairs(lista:GetChildren()) do
			if filho:IsA("Frame") then
				filho:Destroy()
			end
		end
		local tab = hubData[tabActual]
		if not tab then
			return
		end

		if #tab.coords == 0 then
			local vazio = novo("Frame", {
				Size = UDim2.new(1, -6, 0, 74),
				BackgroundColor3 = PANEL,
				BackgroundTransparency = 0.4,
				BorderSizePixel = 0,
			}, lista)
			canto(vazio, 10)
			novo("TextLabel", {
				Position = UDim2.fromOffset(0, 22),
				Size = UDim2.new(1, 0, 0, 16),
				BackgroundTransparency = 1,
				Font = Enum.Font.GothamBold,
				Text = "Todavía no hay coordenadas",
				TextColor3 = CREAM,
				TextSize = 10,
			}, vazio)
			novo("TextLabel", {
				Position = UDim2.fromOffset(0, 40),
				Size = UDim2.new(1, 0, 0, 16),
				BackgroundTransparency = 1,
				Font = Enum.Font.Gotham,
				Text = "usá MI POSICIÓN para guardar donde estás",
				TextColor3 = MUTED,
				TextSize = 9,
			}, vazio)
			lista.CanvasSize = UDim2.new(0, 0, 0, 90)
			actualizarContador()
			return
		end

		for i, coord in ipairs(tab.coords) do
			local card = novo("Frame", {
				Size = UDim2.new(1, -6, 0, 68),
				BackgroundColor3 = PANEL,
				BackgroundTransparency = 0.18,
				BorderSizePixel = 0,
				LayoutOrder = i,
			}, lista)
			canto(card, 10)
			borda(card, PANEL_L, 1, 0.15)

			local faixa = novo("Frame", {
				Size = UDim2.new(0, 3, 1, -14),
				Position = UDim2.fromOffset(0, 7),
				BackgroundColor3 = coord.loop and OKC or PANEL_L,
				BorderSizePixel = 0,
			}, card)
			canto(faixa, 2)

			novo("TextLabel", {
				Position = UDim2.fromOffset(12, 8),
				Size = UDim2.new(1, -160, 0, 15),
				BackgroundTransparency = 1,
				Font = Enum.Font.GothamBold,
				Text = coord.name,
				TextColor3 = CREAM,
				TextSize = 11,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextTruncate = Enum.TextTruncate.AtEnd,
			}, card)

			novo("TextLabel", {
				Position = UDim2.fromOffset(12, 25),
				Size = UDim2.new(1, -160, 0, 14),
				BackgroundTransparency = 1,
				Font = Enum.Font.Code,
				Text = string.format("%.1f, %.1f, %.1f", coord.pos.X, coord.pos.Y, coord.pos.Z),
				TextColor3 = MUTED,
				TextSize = 9,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextTruncate = Enum.TextTruncate.AtEnd,
			}, card)

			local btnTP = novo("TextButton", {
				Position = UDim2.fromOffset(12, 44),
				Size = UDim2.fromOffset(74, 18),
				BackgroundColor3 = LATTE,
				BorderSizePixel = 0,
				Font = Enum.Font.GothamBold,
				Text = "IR",
				TextColor3 = ESPRESSO,
				TextSize = 9,
				AutoButtonColor = false,
			}, card)
			canto(btnTP, 6)

			local btnLoop = novo("TextButton", {
				Position = UDim2.fromOffset(92, 44),
				Size = UDim2.fromOffset(76, 18),
				BackgroundColor3 = coord.loop and OKC or PANEL_L,
				BorderSizePixel = 0,
				Font = Enum.Font.GothamBold,
				Text = coord.loop and "BUCLE: ON" or "BUCLE: OFF",
				TextColor3 = coord.loop and ESPRESSO or MUTED,
				TextSize = 8,
				AutoButtonColor = false,
			}, card)
			canto(btnLoop, 6)

			local btnEdit = novo("TextButton", {
				AnchorPoint = Vector2.new(1, 0),
				Position = UDim2.new(1, -62, 0, 8),
				Size = UDim2.fromOffset(24, 22),
				BackgroundColor3 = PANEL_L,
				BorderSizePixel = 0,
				Font = Enum.Font.GothamBold,
				Text = "E",
				TextColor3 = CREAM,
				TextSize = 10,
				AutoButtonColor = false,
			}, card)
			canto(btnEdit, 6)

			local btnDel = novo("TextButton", {
				AnchorPoint = Vector2.new(1, 0),
				Position = UDim2.new(1, -32, 0, 8),
				Size = UDim2.fromOffset(24, 22),
				BackgroundColor3 = Color3.fromRGB(88, 42, 38),
				BorderSizePixel = 0,
				Font = Enum.Font.GothamBold,
				Text = "X",
				TextColor3 = CREAM,
				TextSize = 10,
				AutoButtonColor = false,
			}, card)
			canto(btnDel, 6)

			btnTP.MouseButton1Click:Connect(function()
				if irA(coord.pos) then
					avisar("TP: " .. coord.name)
					estado.Text = "TP a " .. coord.name
				else
					avisar("no pude teleportar", ERR)
				end
			end)

			btnLoop.MouseButton1Click:Connect(function()
				coord.loop = not coord.loop
				if coord.loop then
					btnLoop.BackgroundColor3 = OKC
					btnLoop.TextColor3 = ESPRESSO
					btnLoop.Text = "BUCLE: ON"
					faixa.BackgroundColor3 = OKC
					detenerLoop()
					loopCoord = coord
					loopUltimo = 0
					loopConexion = RunService.Heartbeat:Connect(function()
						if not loopCoord then
							return
						end
						local agora = os.clock()
						if agora - loopUltimo < 0.35 then
							return
						end
						loopUltimo = agora
						irA(loopCoord.pos)
					end)
					avisar("bucle activo: " .. coord.name)
				else
					btnLoop.BackgroundColor3 = PANEL_L
					btnLoop.TextColor3 = MUTED
					btnLoop.Text = "BUCLE: OFF"
					faixa.BackgroundColor3 = PANEL_L
					if loopCoord == coord then
						detenerLoop()
					end
					avisar("bucle apagado")
				end
				guardarDatos()
				actualizarContador()
			end)

			btnEdit.MouseButton1Click:Connect(function()
				abrirEditar(coord)
			end)

			btnDel.MouseButton1Click:Connect(function()
				if loopCoord == coord then
					detenerLoop()
				end
				table.remove(tab.coords, i)
				guardarDatos()
				recargarLista()
				avisar("coordenada borrada")
			end)
		end

		lista.CanvasSize = UDim2.new(0, 0, 0, #tab.coords * 74 + 6)
		actualizarContador()
	end

	-- ===== acciones =====
	btnMiPos.MouseButton1Click:Connect(function()
		local pos = posActual()
		if not pos then
			avisar("sin personaje", ERR)
			return
		end
		agregarCoord(inputNombre.Text, pos, loopAtivo)
		inputNombre.Text = ""
		avisar("guardado: " .. string.format("%.1f, %.1f, %.1f", pos.X, pos.Y, pos.Z))
	end)

	btnManual.MouseButton1Click:Connect(function()
		local x, y, z = inputCoords.Text:match("(-?%d+%.?%d*)%s*,%s*(-?%d+%.?%d*)%s*,%s*(-?%d+%.?%d*)")
		if not x then
			avisar("formato: X, Y, Z", ERR)
			return
		end
		agregarCoord(inputNombre.Text, Vector3.new(tonumber(x), tonumber(y), tonumber(z)), loopAtivo)
		inputCoords.Text = ""
		inputNombre.Text = ""
		avisar("coordenada agregada")
	end)

	btnCopiar.MouseButton1Click:Connect(function()
		local pos = posActual()
		if not pos then
			return
		end
		if type(setclipboard) == "function" then
			pcall(setclipboard, string.format("%.1f, %.1f, %.1f", pos.X, pos.Y, pos.Z))
		end
		avisar("copiado")
	end)

	btnReset.MouseButton1Click:Connect(function()
		detenerLoop()
		hubData = {}
		for _, t in ipairs(defaultData) do
			table.insert(hubData, copiarTab(t))
		end
		tabActual = 1
		guardarDatos()
		recargarTabs()
		recargarLista()
		avisar("hub reseteado")
	end)

	-- ===== posición en vivo =====
	task.spawn(function()
		while SG.Parent do
			task.wait(0.15)
			local pos = posActual()
			if pos then
				liveLabel.Text = string.format("X: %.1f    Y: %.1f    Z: %.1f", pos.X, pos.Y, pos.Z)
			end
		end
	end)

	recargarTabs()
	recargarLista()

	if getgenv then
		getgenv().DreyHubV8 = SG
	end
end

local okInicio, erroInicio = pcall(iniciar)
if not okInicio then
	pcall(warn, "[Drey Hub V8] error al iniciar: " .. tostring(erroInicio))
end

print("Drey Hub V8")
