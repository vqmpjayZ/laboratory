--[[
ArrayField's Standalone Key System
by Meta

Original by Sirius

-------------------------------
Brought to you by vqmpjay 

]]

local KeySystem = {}

local UserInputService = game:GetService('UserInputService')
local TweenService = game:GetService('TweenService')
local HttpService = game:GetService('HttpService')
local Players = game:GetService('Players')
local CoreGui = game:GetService('CoreGui')
local LocalPlayer = Players.LocalPlayer

local AllClipboards = setclipboard or toclipboard or set_clipboard or (Clipboard and Clipboard.set)

local KeyUI = game:GetObjects('rbxassetid://11695805160')[1]
KeyUI.Enabled = true

local actionExecuting = false

if game:GetService('RunService'):IsStudio() then
    function gethui() return KeyUI end
    function writefile() end
    function isfolder() return false end
    function makefolder() end
    function isfile() return false end
    function readfile() return '' end
    function setclipboard(text)  print("Clipboard set to: " .. tostring(text)) end
end

local function ParentGUI(Gui)
    local success = pcall(function()
        if get_hidden_gui or gethui then
            local hiddenUI = get_hidden_gui or gethui
            Gui.Parent = hiddenUI()
        elseif syn and syn.protect_gui then
            syn.protect_gui(Gui)
            Gui.Parent = CoreGui
        else
            Gui.Parent = CoreGui
        end
    end)

    if not success then
        Gui.Parent = LocalPlayer:FindFirstChildWhichIsA('PlayerGui')
    end
end

local ArrayFieldFolder = 'ArrayField'
local ConfigurationExtension = '.rfld'

function KeySystem:CreateKeyUI(Settings)
    if not Settings then
        error('KeySystem: Settings table required')
    end
    if not Settings.Keys then
        error('KeySystem: Keys array required')
    end
    if not Settings.Callback then
        error('KeySystem: Callback function required')
    end

    Settings.Title = Settings.Title or 'Key System'
    Settings.Subtitle = Settings.Subtitle or 'Enter Key'
    Settings.Note = Settings.Note or 'No instructions provided'
    Settings.SaveKey = Settings.SaveKey or false
    Settings.FileName = Settings.FileName or 'DefaultKey'
    Settings.GrabKeyFromSite = Settings.GrabKeyFromSite or false

    if Settings.SaveKey then
        if not isfolder(ArrayFieldFolder) then
            makefolder(ArrayFieldFolder)
        end
        if not isfolder(ArrayFieldFolder .. '/Key System') then
            makefolder(ArrayFieldFolder .. '/Key System')
        end
    end

    if Settings.SaveKey then
        local keyFilePath = ArrayFieldFolder .. '/Key System' .. '/' .. Settings.FileName .. ConfigurationExtension
        if isfile(keyFilePath) then
            local savedKey = readfile(keyFilePath)
            for _, key in ipairs(Settings.Keys) do
                if savedKey == key then
                    Settings.Callback()
                    return
                end
            end
        end
    end

    if Settings.GrabKeyFromSite then
        for i, key in ipairs(Settings.Keys) do
            local success, response = pcall(function()
                return game:HttpGet(key):gsub('[\n\r]', ' '):gsub(' ', '')
            end)
            if success then
                Settings.Keys[i] = response
            else
                warn('KeySystem: Failed to fetch key from ' .. key)
            end
        end
    end

    ParentGUI(KeyUI)

    local KeyMain = KeyUI.Main
    KeyMain.Title.Text = Settings.Title
    KeyMain.Subtitle.Text = Settings.Subtitle
    KeyMain.NoteMessage.Text = Settings.Note

    KeyMain.Size = UDim2.new(0, 467, 0, 175)
    KeyMain.BackgroundTransparency = 1
    KeyMain.EShadow.ImageTransparency = 1
    KeyMain.Title.TextTransparency = 1
    KeyMain.Subtitle.TextTransparency = 1
    KeyMain.KeyNote.TextTransparency = 1
    KeyMain.Input.BackgroundTransparency = 1
    KeyMain.Input.UIStroke.Transparency = 1
    KeyMain.Input.InputBox.TextTransparency = 1
    KeyMain.Input.HidenInput.TextTransparency = 1
    KeyMain.NoteTitle.TextTransparency = 1
    KeyMain.NoteMessage.TextTransparency = 1
    KeyMain.Hide.ImageTransparency = 1
    KeyMain.HideP.ImageTransparency = 1
    KeyMain.Actions.Template.TextTransparency = 1

    if Settings.Action then
        local Action = KeyMain.Actions.Template
        Action.Text = 'Click here to copy key link'
        Action.Visible = true
        Action.Parent = KeyMain.Actions

        Action.TextStrokeTransparency = 0.5
        Action.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
        Action.ZIndex = 15 
        Action.Font = Enum.Font.GothamBold
        Action.TextScaled = true
        Action.BackgroundTransparency = 1

        local connection
        connection = Action.MouseButton1Click:Connect(function()
            if actionExecuting then
                return
            end
            actionExecuting = true

            if AllClipboards and Settings.Action.Link then
                AllClipboards(Settings.Action.Link)
            end

            local originalText = Action.Text
            Action.Text = 'Copied!'
            
            wait(0.45)
            Action.Text = originalText
            actionExecuting = false
        end)

        Action.MouseEnter:Connect(function()
            if actionExecuting then
                return
            end
            TweenService:Create(Action, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{TextColor3 = Color3.fromRGB(185, 185, 185)}):Play()
        end)

        Action.MouseLeave:Connect(function()
            if actionExecuting then
                return
            end
            TweenService:Create(Action, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{TextColor3 = Color3.fromRGB(105, 105, 105)}):Play()
        end)
    end

    self:AnimateIn(KeyMain, Settings)
    self:SetupInputHandlers(KeyMain, Settings)
end

function KeySystem:AnimateIn(KeyMain, Settings)
    TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundTransparency = 0,Size = UDim2.new(0, 500, 0, 187)}):Play()
    TweenService:Create(KeyMain.EShadow, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {ImageTransparency = 0.5}):Play()
    wait(0.05)
    TweenService:Create(KeyMain.Title, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
    TweenService:Create(KeyMain.Subtitle, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
    wait(0.05)
    TweenService:Create(KeyMain.KeyNote, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
    TweenService:Create(KeyMain.Input, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
    TweenService:Create(KeyMain.Input.UIStroke, TweenInfo.new(0.5, Enum.EasingStyle.Quint),{Transparency = 0}):Play()
    TweenService:Create(KeyMain.Input.HidenInput, TweenInfo.new(0.5, Enum.EasingStyle.Quint),{TextTransparency = 0}):Play()
    wait(0.05)
    TweenService:Create(KeyMain.NoteTitle, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
    TweenService:Create(KeyMain.NoteMessage, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
    TweenService:Create(KeyMain.Actions.Template, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
    wait(0.15)
    TweenService:Create(KeyMain.Hide, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {ImageTransparency = 0.3}):Play()
    TweenService:Create(KeyMain.HideP, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {ImageTransparency = 0.3}):Play()
    end

function KeySystem:AnimateOut(KeyMain, Settings, callback)
    TweenService:Create(KeyMain.Actions.Template, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
    TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundTransparency = 1, Size = UDim2.new(0, 467, 0, 175)}):Play()
    TweenService:Create(KeyMain.EShadow, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
    TweenService:Create(KeyMain.Title, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
    TweenService:Create(KeyMain.Subtitle, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
    TweenService:Create(KeyMain.KeyNote, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
    TweenService:Create(KeyMain.Input, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
    TweenService:Create(KeyMain.Input.UIStroke, TweenInfo.new(0.5, Enum.EasingStyle.Quint),{Transparency = 1}):Play()
    TweenService:Create(KeyMain.Input.InputBox, TweenInfo.new(0.5, Enum.EasingStyle.Quint),{TextTransparency = 1}):Play()
    TweenService:Create(KeyMain.Input.HidenInput, TweenInfo.new(0.5, Enum.EasingStyle.Quint),{TextTransparency = 1}):Play()
    TweenService:Create(KeyMain.NoteTitle, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
    TweenService:Create(KeyMain.NoteMessage, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
    TweenService:Create(KeyMain.Hide, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
    TweenService:Create(KeyMain.HideP, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
    wait(0.51)
    if callback then
        callback()
    end
    KeyMain.Hide.Visible = false
    KeyUI:Destroy()
end

function KeySystem:SetupInputHandlers(KeyMain, Settings)
    local Hidden = true

    KeyMain.Input.InputBox:GetPropertyChangedSignal('Text'):Connect(function()
        KeyMain.Input.HidenInput.Text = string.rep('•', #KeyMain.Input.InputBox.Text)
    end)

    KeyMain.Input.InputBox.FocusLost:Connect(function(EnterPressed)
        if not EnterPressed or #KeyMain.Input.InputBox.Text == 0 then
            return
        end

        local KeyFound = false
        local EnteredKey = KeyMain.Input.InputBox.Text

        for _, ValidKey in ipairs(Settings.Keys) do
            if EnteredKey == ValidKey then
                KeyFound = true
                break
            end
        end

        if KeyFound then
            self:AnimateOut(KeyMain, Settings, function()
                if Settings.SaveKey then
                    local keyFilePath = ArrayFieldFolder .. '/Key System' .. '/' .. Settings.FileName .. ConfigurationExtension
                    writefile(keyFilePath, EnteredKey)
                end

                Settings.Callback()
            end)
        else
            KeyMain.Input.InputBox.Text = ''

            local originalPos = KeyMain.Position
            local shakeDistance = 10

            local shakeSequence = {
                {pos = UDim2.new(originalPos.X.Scale, originalPos.X.Offset - shakeDistance, originalPos.Y.Scale,originalPos.Y.Offset), time = 0.05},
                {pos = UDim2.new(originalPos.X.Scale, originalPos.X.Offset + shakeDistance, originalPos.Y.Scale, originalPos.Y.Offset), time = 0.05},
                {pos = UDim2.new(originalPos.X.Scale, originalPos.X.Offset - shakeDistance / 2, originalPos.Y.Scale, originalPos.Y.Offset), time = 0.05},
                {pos = UDim2.new(originalPos.X.Scale, originalPos.X.Offset + shakeDistance / 2, originalPos.Y.Scale, originalPos.Y.Offset),time = 0.05},
                {pos = originalPos, time = 0.1},
            }

            for _, shake in ipairs(shakeSequence) do
                TweenService:Create(KeyMain, TweenInfo.new(shake.time, Enum.EasingStyle.Quad),{Position = shake.pos}):Play()
                wait(shake.time)
            end
        end
    end)

    KeyMain.HideP.MouseButton1Click:Connect(function()
        if Hidden then
            TweenService:Create(KeyMain.Input.HidenInput, TweenInfo.new(0.5, Enum.EasingStyle.Quint),{TextTransparency = 1}):Play()
            TweenService:Create(KeyMain.Input.InputBox, TweenInfo.new(0.5, Enum.EasingStyle.Quint),{TextTransparency = 0}):Play()
            Hidden = false
        else
            TweenService:Create(KeyMain.Input.HidenInput, TweenInfo.new(0.5, Enum.EasingStyle.Quint),{TextTransparency = 0}):Play()
            TweenService:Create(KeyMain.Input.InputBox, TweenInfo.new(0.5, Enum.EasingStyle.Quint),{TextTransparency = 1}):Play()
            Hidden = true
        end
    end)

    KeyMain.Hide.MouseButton1Click:Connect(function()
        self:AnimateOut(KeyMain, Settings)
    end)
end

function KeySystem:Template()
    self:CreateKeyUI({
        Title = "My Script",
        Subtitle = "Key System",
        Note = "Join our discord server for the key!",
        Keys = {"Hello", "example456"},
        --SaveKey = true,
        FileName = "MyScriptKey",
        GrabKeyFromSite = false,
        Action = {
            Link = "https://discord.gg/example"
        },
        Callback = function()
            print("Script loaded successfully!")
        end
    })
end
--KeySystem:Template()
--[[-- ]]return KeySystem
