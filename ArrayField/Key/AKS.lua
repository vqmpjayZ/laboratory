-- version: 2BC
local KeySystem = {}

local UserInputService = game:GetService('UserInputService')
local TweenService = game:GetService('TweenService')
local HttpService = game:GetService('HttpService')
local Players = game:GetService('Players')
local CoreGui = game:GetService('CoreGui')
local RunService = game:GetService('RunService')
local LocalPlayer = Players.LocalPlayer

local AllClipboards = setclipboard or toclipboard or set_clipboard or (Clipboard and Clipboard.set)

local KeyUI = game:GetObjects('rbxassetid://71264174552423')[1]
KeyUI.Enabled = true

local actionExecuting = false
local activeTweens = {}

if game:GetService('RunService'):IsStudio() then
    function gethui() return KeyUI end
    function writefile() end
    function isfolder() return false end
    function makefolder() end
    function isfile() return false end
    function readfile() return '' end
    function setclipboard(text) print("Clipboard set to: " .. tostring(text)) end
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

local RbxAnalyticsService = game:GetService("RbxAnalyticsService")

local function GetCustomHWID()
    local baseId = RbxAnalyticsService:GetClientId()
    local result = ""

    for i = 1, #baseId do
        local char = baseId:sub(i, i)
    
        if char:match("%d") then
            local replacements = {["0"]="7", ["1"]="3", ["2"]="9", ["3"]="1", ["4"]="8", ["5"]="2", ["6"]="5", ["7"]="4", ["8"]="6", ["9"]="0"}
            result = result .. replacements[char]
        else
            local ascii = string.byte(char)
            if char:match("%a") then
                local shifted = ((ascii - 65 + i * 3) % 26) + 65
                result = result .. string.char(shifted)
            else
                result = result .. char
            end
        end
    end

    return result
end

local function CheckVIPStatus(Settings)
    if not Settings.VIP or not Settings.VIP.Enabled then
        return false
    end
    
    local currentHWID = RbxAnalyticsService:GetClientId()
    
    if Settings.VIP.PastebinURL then
        local success, vipList = pcall(function()
            return game:HttpGet(Settings.VIP.PastebinURL)
        end)
        
        if success and vipList then
            local jsonSuccess, decodedList = pcall(function()
                return HttpService:JSONDecode(vipList)
            end)
            
            if jsonSuccess and type(decodedList) == "table" then
                for _, hwid in ipairs(decodedList) do
                    if tostring(hwid) == currentHWID then
                        return true
                    end
                end
            else
                for hwid in vipList:gmatch("[^\r\n]+") do
                    hwid = hwid:gsub("^%s*(.-)%s*$", "%1")
                    if hwid == currentHWID then
                        return true
                    end
                end
            end
        end
    end
    
    if Settings.VIP.LocalList then
        for _, hwid in ipairs(Settings.VIP.LocalList) do
            if hwid == currentHWID then
                return true
            end
        end
    end
    
    return false
end

local function cleanupTweens()
    for i = #activeTweens, 1, -1 do
        local tween = activeTweens[i]
        if tween then
            tween:Cancel()
        end
        table.remove(activeTweens, i)
    end
end

local function createTween(object, tweenInfo, properties)
    local tween = TweenService:Create(object, tweenInfo, properties)
    table.insert(activeTweens, tween)
    return tween
end

function KeySystem:CreateKeyUI(Settings)
    if not Settings then
        error('KeySystem: Settings table required')
    end
    
    if CheckVIPStatus(Settings) then
        Settings.Callback()
        return
    end
    
    if not Settings.Keys and not (Settings.GrabKeyFromSite and Settings.GrabKeyFromSite.Enabled) then
        error('KeySystem: Keys array required (unless GrabKeyFromSite is enabled)')
    end

    Settings.Keys = Settings.Keys or {}

    if not Settings.Callback then
        error('KeySystem: Callback function required')
    end

    Settings.Title = Settings.Title or 'Key System'
    Settings.Subtitle = Settings.Subtitle or 'Enter Key'
    Settings.Note = Settings.Note or 'No instructions provided'
    Settings.SaveKey = Settings.SaveKey or false
    Settings.FileName = Settings.FileName or 'DefaultKey'

    if type(Settings.GrabKeyFromSite) == "table" then
        Settings.GrabKeyFromSite.Enabled = Settings.GrabKeyFromSite.Enabled ~= false
        Settings.GrabKeyFromSite.KeyDestination = Settings.GrabKeyFromSite.KeyDestination or ""
    else
        Settings.GrabKeyFromSite = {
            Enabled = Settings.GrabKeyFromSite == true,
            KeyDestination = ""
        }
    end

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
            if savedKey and #savedKey > 0 then
                if Settings.GrabKeyFromSite.Enabled then
                    local hwid = GetCustomHWID()
                    local encodedHWID = HttpService:UrlEncode(hwid)
                    local createURL = Settings.GrabKeyFromSite.KeyDestination .. encodedHWID

                    local success, keyLink = pcall(function()
                        return game:HttpGet(createURL)
                    end)

                    if success and type(keyLink) == "string" then
                        local keySuccess, currentKey = pcall(function()
                            return game:HttpGet(keyLink):gsub("[%c%s]", "")
                        end)

                        if keySuccess and currentKey and #currentKey > 5 and savedKey == currentKey then
                            Settings.Callback()
                            return
                        end
                    end
                else
                    for _, key in ipairs(Settings.Keys) do
                        if savedKey == key then
                            Settings.Callback()
                            return
                        end
                    end
                end
            end
        end
    end

    if Settings.GrabKeyFromSite.Enabled then
        spawn(function()
            local hwid = GetCustomHWID()
            local encodedHWID = HttpService:UrlEncode(hwid)
            local createURL = Settings.GrabKeyFromSite.KeyDestination .. encodedHWID

            local success, keyLink = pcall(function()
                return game:HttpGet(createURL)
            end)

            if success and type(keyLink) == "string" then
                local keySuccess, key = pcall(function()
                    return game:HttpGet(keyLink):gsub("[%c%s]", "")
                end)

                if keySuccess and key and #key > 5 then
                    Settings.Keys = { key }
                else
                    warn("KeySystem: Invalid key content from: " .. tostring(keyLink))
               end
            else
                warn("KeySystem: Failed to fetch key link from destination.")
            end
        end)
    end

    ParentGUI(KeyUI)

    local KeyMain = KeyUI.Main
    KeyMain.Title.Text = Settings.Title
    KeyMain.Subtitle.Text = Settings.Subtitle
    KeyMain.NoteMessage.Text = Settings.Note

    local originalEyeImage = KeyMain.HideP.Image
    local originalEyeRectSize = KeyMain.HideP.ImageRectSize
    local originalEyeRectOffset = KeyMain.HideP.ImageRectOffset
    
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
    KeyMain.Input.HidenInput.Position = UDim2.new(0.517499566, 0, 0.5, 0)
    KeyMain.NoteTitle.TextTransparency = 1
    KeyMain.NoteMessage.TextTransparency = 1
    KeyMain.Hide.ImageTransparency = 1
    KeyMain.HideP.ImageTransparency = 1
    KeyMain.Actions.Template.Visible = false
    KeyMain.Actions.TemplateH.Visible = false
    KeyMain.Input.Reset.ImageTransparency = 1
    
    KeyMain.Input.InputBox.PlaceholderText = "Enter Key Here"
    KeyMain.Input.InputBox.TextYAlignment = Enum.TextYAlignment.Center
    KeyMain.Input.InputBox.Size = UDim2.new(1, -40, 1, 0)
    KeyMain.Input.InputBox.Position = UDim2.new(0.450499594, 0, 0.5, 0)
    KeyMain.Input.InputBox.TextScaled = false
    KeyMain.Input.InputBox.TextSize = 14
    KeyMain.Input.HidenInput.Size = UDim2.new(1, -40, 1, 0)
    KeyMain.Input.HidenInput.Position = UDim2.new(0.450499594, 0, 0.5, 0)
    KeyMain.Input.HidenInput.TextScaled = false
    KeyMain.Input.HidenInput.TextSize = 14

    local CaretLabel = Instance.new("TextLabel")
    CaretLabel.Name = "Caret"
    CaretLabel.Parent = KeyMain.Input
    CaretLabel.AnchorPoint = Vector2.new(0, 0.5)
    CaretLabel.BackgroundTransparency = 1
    CaretLabel.Position = UDim2.new(0, 5, 0.48, 0)
    CaretLabel.Size = UDim2.new(0, 20, 1, 0)
    CaretLabel.Font = Enum.Font.Gotham
    CaretLabel.Text = "|"
    CaretLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    CaretLabel.TextScaled = false
    CaretLabel.TextSize = 18
    CaretLabel.TextTransparency = 1
    CaretLabel.TextXAlignment = Enum.TextXAlignment.Left
    CaretLabel.Visible = false
    CaretLabel.ZIndex = 10
    
    local ResetButtonWrapper = Instance.new("TextButton")
    ResetButtonWrapper.Name = "ResetWrapper"
    ResetButtonWrapper.Parent = KeyMain.Input
    ResetButtonWrapper.BackgroundTransparency = 1
    ResetButtonWrapper.AnchorPoint = KeyMain.Input.Reset.AnchorPoint
    ResetButtonWrapper.Position = KeyMain.Input.Reset.Position
    ResetButtonWrapper.Size = UDim2.new(0, 30, 0, 30)
    ResetButtonWrapper.Text = ""
    ResetButtonWrapper.ZIndex = 15
    ResetButtonWrapper.Visible = false
    ResetButtonWrapper.AutoButtonColor = false
    
    KeyMain.Input.Reset.ZIndex = 14
    
    local VisibilityNotification = Instance.new("TextLabel")
    VisibilityNotification.Name = "VisibilityNotification"
    VisibilityNotification.Parent = KeyMain.Input
    VisibilityNotification.AnchorPoint = Vector2.new(0, 0)
    VisibilityNotification.Position = UDim2.new(0, 50, 0, -23)
    VisibilityNotification.Size = UDim2.new(0, 120, 0, 20)
    VisibilityNotification.BackgroundTransparency = 1
    VisibilityNotification.Font = Enum.Font.Gotham
    VisibilityNotification.Text = ""
    VisibilityNotification.TextColor3 = Color3.fromRGB(160, 160, 160)
    VisibilityNotification.TextScaled = false
    VisibilityNotification.TextSize = 10
    VisibilityNotification.TextTransparency = 1
    VisibilityNotification.TextXAlignment = Enum.TextXAlignment.Left
    VisibilityNotification.Visible = false

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

    if Settings.GrabKeyFromSite and Settings.GrabKeyFromSite.Enabled then
        local HWIDButton = KeyMain.Actions.TemplateH
        HWIDButton.Text = 'Click here to copy your HWID'
        HWIDButton.Visible = true

        HWIDButton.Parent = KeyMain.Actions

        HWIDButton.Font = Action.Font
        HWIDButton.ZIndex = Action.ZIndex
        HWIDButton.TextStrokeTransparency = Action.TextStrokeTransparency
        HWIDButton.TextStrokeColor3 = Action.TextStrokeColor3
        HWIDButton.TextScaled = Action.TextScaled
        HWIDButton.BackgroundTransparency = Action.BackgroundTransparency

        HWIDButton.MouseButton1Click:Connect(function()
            if AllClipboards then
                local hwid = GetCustomHWID()
                AllClipboards(hwid)

                local original = HWIDButton.Text
                HWIDButton.Text = "Copied!"
                spawn(function()
                    task.wait(0.45)
                    HWIDButton.Text = original
                end)
            end
        end)

        HWIDButton.MouseEnter:Connect(function()
            createTween(HWIDButton, TweenInfo.new(0.25), {
                TextColor3 = Color3.fromRGB(185, 185, 185)
            }):Play()
        end)

        HWIDButton.MouseLeave:Connect(function()
            createTween(HWIDButton, TweenInfo.new(0.25), {
                TextColor3 = Color3.fromRGB(105, 105, 105)
            }):Play()
        end)
    end
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
            
            spawn(function()
                task.wait(0.45)
                Action.Text = originalText
                actionExecuting = false
            end)
        end)

        Action.MouseEnter:Connect(function()
            if actionExecuting then
                return
            end
            createTween(Action, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{TextColor3 = Color3.fromRGB(185, 185, 185)}):Play()
        end)

        Action.MouseLeave:Connect(function()
            if actionExecuting then
                return
            end
            createTween(Action, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{TextColor3 = Color3.fromRGB(105, 105, 105)}):Play()
        end)
    end

    self:AnimateIn(KeyMain, Settings, originalEyeImage, originalEyeRectSize, originalEyeRectOffset)
    self:SetupInputHandlers(KeyMain, Settings, originalEyeImage, originalEyeRectSize, originalEyeRectOffset, ResetButtonWrapper)
end

function KeySystem:AnimateIn(KeyMain, Settings, originalEyeImage, originalEyeRectSize, originalEyeRectOffset)
    local visibilityPrefPath = ArrayFieldFolder .. '/Key System' .. '/visibility_pref' .. ConfigurationExtension
    local savedVisibility = true
    
    if isfile(visibilityPrefPath) then
        local savedPref = readfile(visibilityPrefPath)
        savedVisibility = savedPref == "true"
    end
    
    if savedVisibility then
        KeyMain.HideP.Image = "rbxassetid://16898613353"
        KeyMain.HideP.ImageRectSize = Vector2.new(48, 48)
        KeyMain.HideP.ImageRectOffset = Vector2.new(820, 514)
    else
        KeyMain.HideP.Image = originalEyeImage
        KeyMain.HideP.ImageRectSize = originalEyeRectSize
        KeyMain.HideP.ImageRectOffset = originalEyeRectOffset
    end
    
    spawn(function()
        createTween(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundTransparency = 0,Size = UDim2.new(0, 500, 0, 187)}):Play()
        createTween(KeyMain.EShadow, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {ImageTransparency = 0.5}):Play()
        task.wait(0.05)
        createTween(KeyMain.Title, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
        createTween(KeyMain.Subtitle, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
        task.wait(0.05)
        createTween(KeyMain.KeyNote, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
        createTween(KeyMain.Input, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
        createTween(KeyMain.Input.UIStroke, TweenInfo.new(0.5, Enum.EasingStyle.Quint),{Transparency = 0}):Play()
        
        if savedVisibility then
            createTween(KeyMain.Input.HidenInput, TweenInfo.new(0.5, Enum.EasingStyle.Quint),{TextTransparency = 0}):Play()
        else
            createTween(KeyMain.Input.InputBox, TweenInfo.new(0.5, Enum.EasingStyle.Quint),{TextTransparency = 0}):Play()
        end
        
        task.wait(0.05)
        createTween(KeyMain.NoteTitle, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
        createTween(KeyMain.NoteMessage, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
        createTween(KeyMain.Actions.Template, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
        local TemplateH = KeyMain.Actions:FindFirstChild("TemplateH")
        if TemplateH then
            createTween(TemplateH, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
        end
        task.wait(0.15)
        createTween(KeyMain.Hide, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {ImageTransparency = 0.3}):Play()
        createTween(KeyMain.HideP, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {ImageTransparency = 0.3}):Play()
        KeyMain.Input.Reset.Visible = false
        KeyMain.Input.ResetWrapper.Visible = false
    end)
end

function KeySystem:AnimateOut(KeyMain, Settings, callback)
    spawn(function()
        createTween(KeyMain.Actions.Template, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
        createTween(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundTransparency = 1, Size = UDim2.new(0, 467, 0, 175)}):Play()
        createTween(KeyMain.EShadow, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
        createTween(KeyMain.Title, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
        createTween(KeyMain.Subtitle, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
        createTween(KeyMain.KeyNote, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
        createTween(KeyMain.Input, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
        createTween(KeyMain.Input.UIStroke, TweenInfo.new(0.5, Enum.EasingStyle.Quint),{Transparency = 1}):Play()
        createTween(KeyMain.Input.InputBox, TweenInfo.new(0.5, Enum.EasingStyle.Quint),{TextTransparency = 1}):Play()
        createTween(KeyMain.Input.HidenInput, TweenInfo.new(0.5, Enum.EasingStyle.Quint),{TextTransparency = 1}):Play()
        createTween(KeyMain.NoteTitle, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
        createTween(KeyMain.NoteMessage, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
        createTween(KeyMain.Hide, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
        createTween(KeyMain.HideP, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
        createTween(KeyMain.Input.Reset, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
        createTween(KeyMain.Input.Caret, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
        local TemplateH = KeyMain.Actions:FindFirstChild("TemplateH")
        if TemplateH then
            createTween(TemplateH, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
        end
        task.wait(0.51)
        if callback then
            callback()
        end
        KeyMain.Hide.Visible = false
        cleanupTweens()
        KeyUI:Destroy()
    end)
end

function KeySystem:SetupInputHandlers(KeyMain, Settings, originalEyeImage, originalEyeRectSize, originalEyeRectOffset, ResetButtonWrapper)
    local Hidden = true
    
    local visibilityPrefPath = ArrayFieldFolder .. '/Key System' .. '/visibility_pref' .. ConfigurationExtension
    if isfile(visibilityPrefPath) then
        local savedPref = readfile(visibilityPrefPath)
        Hidden = savedPref == "true"
    end

    local resetVisible = false
    local caretConnection = nil

    local function createCaret()
        if not Hidden or #KeyMain.Input.InputBox.Text > 0 then return end
        
        KeyMain.Input.Caret.Visible = true
        createTween(KeyMain.Input.Caret, TweenInfo.new(0.2), {TextTransparency = 0.2}):Play()
        
        caretConnection = RunService.Heartbeat:Connect(function()
            if math.floor(tick() * 2) % 2 == 0 then
                KeyMain.Input.Caret.TextTransparency = 0.2
            else
                KeyMain.Input.Caret.TextTransparency = 1
            end
        end)
    end

    local function removeCaret()
        if caretConnection then
            caretConnection:Disconnect()
            caretConnection = nil
        end
        createTween(KeyMain.Input.Caret, TweenInfo.new(0.2), {TextTransparency = 1}):Play()
        task.wait(0.2)
        KeyMain.Input.Caret.Visible = false
    end

    local function animateResetButton(show)
        if show and not resetVisible then
            resetVisible = true
            KeyMain.Input.Reset.Visible = true
            ResetButtonWrapper.Visible = true
            createTween(KeyMain.Input.Reset, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {
                ImageTransparency = 0.5
            }):Play()
        elseif not show and resetVisible then
            resetVisible = false
            createTween(KeyMain.Input.Reset, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {
                ImageTransparency = 1
            }):Play()
            task.wait(0.6)
            KeyMain.Input.Reset.Visible = false
            ResetButtonWrapper.Visible = false
        end
    end

    KeyMain.Input.InputBox:GetPropertyChangedSignal('Text'):Connect(function()
        KeyMain.Input.HidenInput.Text = string.rep('•', #KeyMain.Input.InputBox.Text)
        animateResetButton(#KeyMain.Input.InputBox.Text > 0)
        
        if #KeyMain.Input.InputBox.Text > 0 then
            removeCaret()
        elseif KeyMain.Input.InputBox:IsFocused() and Hidden then
            createCaret()
        end
    end)

    KeyMain.Input.InputBox.Focused:Connect(function()
        if Hidden and #KeyMain.Input.InputBox.Text == 0 then
            createCaret()
        end
    end)

    KeyMain.Input.InputBox.FocusLost:Connect(function()
        removeCaret()
    end)

    ResetButtonWrapper.MouseButton1Click:Connect(function()
        KeyMain.Input.InputBox.Text = ''
        KeyMain.Input.HidenInput.Text = ''
        animateResetButton(false)
        removeCaret()
    end)
    
    ResetButtonWrapper.MouseEnter:Connect(function()
        if resetVisible then
            createTween(KeyMain.Input.Reset, TweenInfo.new(0.25), {
                ImageTransparency = 0.3
            }):Play()
        end
    end)
    
    ResetButtonWrapper.MouseLeave:Connect(function()
        if resetVisible then
            createTween(KeyMain.Input.Reset, TweenInfo.new(0.25), {
                ImageTransparency = 0.5
            }):Play()
        end
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
                    spawn(function()
                        local keyFilePath = ArrayFieldFolder .. '/Key System' .. '/' .. Settings.FileName .. ConfigurationExtension
                        writefile(keyFilePath, EnteredKey)
                    end)
                end

                Settings.Callback()
            end)
        else
            KeyMain.Input.InputBox.Text = ''

            local originalPos = KeyMain.Position
            local shakeDistance = 10

            spawn(function()
                local shakeSequence = {
                    {pos = UDim2.new(originalPos.X.Scale, originalPos.X.Offset - shakeDistance, originalPos.Y.Scale,originalPos.Y.Offset), time = 0.05},
                    {pos = UDim2.new(originalPos.X.Scale, originalPos.X.Offset + shakeDistance, originalPos.Y.Scale, originalPos.Y.Offset), time = 0.05},
                    {pos = UDim2.new(originalPos.X.Scale, originalPos.X.Offset - shakeDistance / 2, originalPos.Y.Scale, originalPos.Y.Offset), time = 0.05},
                    {pos = UDim2.new(originalPos.X.Scale, originalPos.X.Offset + shakeDistance / 2, originalPos.Y.Scale, originalPos.Y.Offset),time = 0.05},
                    {pos = originalPos, time = 0.1},
                }

                for _, shake in ipairs(shakeSequence) do
                    createTween(KeyMain, TweenInfo.new(shake.time, Enum.EasingStyle.Quad),{Position = shake.pos}):Play()
                    task.wait(shake.time)
                end
            end)
        end
    end)

    KeyMain.HideP.MouseButton1Click:Connect(function()
        removeCaret()
        
        if Hidden then
            createTween(KeyMain.HideP, TweenInfo.new(0.15, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
            task.wait(0.15)
            
            KeyMain.HideP.Image = originalEyeImage
            KeyMain.HideP.ImageRectSize = originalEyeRectSize
            KeyMain.HideP.ImageRectOffset = originalEyeRectOffset
            
            createTween(KeyMain.HideP, TweenInfo.new(0.15, Enum.EasingStyle.Quint), {ImageTransparency = 0.3}):Play()
            
            createTween(KeyMain.Input.HidenInput, TweenInfo.new(0.5, Enum.EasingStyle.Quint),{TextTransparency = 1}):Play()
            createTween(KeyMain.Input.InputBox, TweenInfo.new(0.5, Enum.EasingStyle.Quint),{TextTransparency = 0}):Play()
            Hidden = false
            
            KeyMain.Input.VisibilityNotification.Text = "(key visibility: on)"
        else
            createTween(KeyMain.HideP, TweenInfo.new(0.15, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
            task.wait(0.15)
            
            KeyMain.HideP.Image = "rbxassetid://16898613353"
            KeyMain.HideP.ImageRectSize = Vector2.new(48, 48)
            KeyMain.HideP.ImageRectOffset = Vector2.new(820, 514)
            
            createTween(KeyMain.HideP, TweenInfo.new(0.15, Enum.EasingStyle.Quint), {ImageTransparency = 0.3}):Play()
            
            createTween(KeyMain.Input.HidenInput, TweenInfo.new(0.5, Enum.EasingStyle.Quint),{TextTransparency = 0}):Play()
            createTween(KeyMain.Input.InputBox, TweenInfo.new(0.5, Enum.EasingStyle.Quint),{TextTransparency = 1}):Play()
            Hidden = true
            
            if KeyMain.Input.InputBox:IsFocused() and #KeyMain.Input.InputBox.Text == 0 then
                createCaret()
            end
            
            KeyMain.Input.VisibilityNotification.Text = "(key visibility: hidden)"
        end
        
        KeyMain.Input.VisibilityNotification.Visible = true
        createTween(KeyMain.Input.VisibilityNotification, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
        
        spawn(function()
            task.wait(1.5)
            createTween(KeyMain.Input.VisibilityNotification, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
            task.wait(0.3)
            KeyMain.Input.VisibilityNotification.Visible = false
        end)
        
        spawn(function()
            local visibilityPrefPath = ArrayFieldFolder .. '/Key System' .. '/visibility_pref' .. ConfigurationExtension
            writefile(visibilityPrefPath, tostring(Hidden))
        end)
    end)

    KeyMain.Hide.MouseButton1Click:Connect(function()
        removeCaret()
        self:AnimateOut(KeyMain, Settings)
    end)
end
return KeySystem
