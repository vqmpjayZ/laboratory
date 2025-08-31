--[[
ArrayField's Open Sourced Standalone Key System
by Meta

Original by Sirius
Optimized for better performance

-------------------------------
Brought to you by vqmpjay 
]]

local KeySystem = {}

local UserInputService = game:GetService('UserInputService')
local TweenService = game:GetService('TweenService')
local HttpService = game:GetService('HttpService')
local Players = game:GetService('Players')
local CoreGui = game:GetService('CoreGui')
local RunService = game:GetService('RunService')
local LocalPlayer = Players.LocalPlayer

local AllClipboards = setclipboard or toclipboard or set_clipboard or (Clipboard and Clipboard.set)

local KeyUI = game:GetObjects('rbxassetid://11695805160')[1]
KeyUI.Enabled = true

local actionExecuting = false
local activeConnections = {} -- Track connections for cleanup

-- Performance optimization: Cache frequently used values
local cachedHWID = nil
local lastHWIDTime = 0
local HWID_CACHE_DURATION = 300 -- 5 minutes cache

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
    local currentTime = tick()
    
    -- Use cached HWID if available and not expired
    if cachedHWID and (currentTime - lastHWIDTime) < HWID_CACHE_DURATION then
        return cachedHWID
    end
    
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

    -- Cache the result
    cachedHWID = result
    lastHWIDTime = currentTime
    
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

-- Optimized animation function with fewer simultaneous tweens
local function BatchTweenElements(elements, duration, properties, delay)
    delay = delay or 0
    
    if delay > 0 then
        RunService.Heartbeat:Wait() -- Use RunService instead of wait()
        task.wait(delay)
    end
    
    for _, element in ipairs(elements) do
        if element.element then
            TweenService:Create(element.element, TweenInfo.new(duration, Enum.EasingStyle.Quint), element.properties or properties):Play()
        end
    end
end

-- Cleanup function
local function CleanupConnections()
    for _, connection in ipairs(activeConnections) do
        if connection and connection.Connected then
            connection:Disconnect()
        end
    end
    activeConnections = {}
end

function KeySystem:CreateKeyUI(Settings)
    if not Settings then
        error('KeySystem: Settings table required')
    end
    
    -- Cleanup any existing connections
    CleanupConnections()
    
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
                    -- Use cached HWID to avoid repeated computation
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

    -- Removed the anti-HTTP logger as it could cause performance issues
    -- If needed, load it conditionally or optimize it separately

    if Settings.GrabKeyFromSite.Enabled then
        -- Use cached HWID to avoid repeated computation
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
    end

    ParentGUI(KeyUI)

    local KeyMain = KeyUI.Main
    KeyMain.Title.Text = Settings.Title
    KeyMain.Subtitle.Text = Settings.Subtitle
    KeyMain.NoteMessage.Text = Settings.Note

    -- Set initial properties more efficiently
    local elementsToHide = {
        KeyMain, KeyMain.EShadow, KeyMain.Title, KeyMain.Subtitle, KeyMain.KeyNote,
        KeyMain.Input, KeyMain.Input.UIStroke, KeyMain.Input.InputBox, KeyMain.Input.HidenInput,
        KeyMain.NoteTitle, KeyMain.NoteMessage, KeyMain.Hide, KeyMain.HideP, KeyMain.Actions.Template
    }
    
    -- Set initial transparency states
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

        if Settings.GrabKeyFromSite and Settings.GrabKeyFromSite.Enabled then
            local HWIDButton = Action:Clone()
            HWIDButton.Name = "CopyHWID"
            HWIDButton.Text = "Click here to copy your HWID"
            HWIDButton.TextTransparency = 1
            HWIDButton.Parent = KeyMain.Actions

            HWIDButton.Font = Action.Font
            HWIDButton.ZIndex = Action.ZIndex
            HWIDButton.TextStrokeTransparency = Action.TextStrokeTransparency
            HWIDButton.TextStrokeColor3 = Action.TextStrokeColor3
            HWIDButton.TextScaled = Action.TextScaled
            HWIDButton.BackgroundTransparency = Action.BackgroundTransparency

            local hwidConnection = HWIDButton.MouseButton1Click:Connect(function()
                if AllClipboards then
                    -- Use cached HWID
                    local hwid = GetCustomHWID()
                    AllClipboards(hwid)

                    local original = HWIDButton.Text
                    HWIDButton.Text = "Copied!"
                    task.wait(0.45)
                    HWIDButton.Text = original
                end
            end)
            table.insert(activeConnections, hwidConnection)

            local hwidEnterConnection = HWIDButton.MouseEnter:Connect(function()
                TweenService:Create(HWIDButton, TweenInfo.new(0.25), {
                    TextColor3 = Color3.fromRGB(185, 185, 185)
                }):Play()
            end)
            table.insert(activeConnections, hwidEnterConnection)

            local hwidLeaveConnection = HWIDButton.MouseLeave:Connect(function()
                TweenService:Create(HWIDButton, TweenInfo.new(0.25), {
                    TextColor3 = Color3.fromRGB(105, 105, 105)
                }):Play()
            end)
            table.insert(activeConnections, hwidLeaveConnection)
        end

        local actionConnection = Action.MouseButton1Click:Connect(function()
            if actionExecuting then
                return
            end
            actionExecuting = true

            if AllClipboards and Settings.Action.Link then
                AllClipboards(Settings.Action.Link)
            end

            local originalText = Action.Text
            Action.Text = 'Copied!'
            
            task.wait(0.45)
            Action.Text = originalText
            actionExecuting = false
        end)
        table.insert(activeConnections, actionConnection)

        local actionEnterConnection = Action.MouseEnter:Connect(function()
            if actionExecuting then
                return
            end
            TweenService:Create(Action, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{TextColor3 = Color3.fromRGB(185, 185, 185)}):Play()
        end)
        table.insert(activeConnections, actionEnterConnection)

        local actionLeaveConnection = Action.MouseLeave:Connect(function()
            if actionExecuting then
                return
            end
            TweenService:Create(Action, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{TextColor3 = Color3.fromRGB(105, 105, 105)}):Play()
        end)
        table.insert(activeConnections, actionLeaveConnection)
    end

    self:AnimateIn(KeyMain, Settings)
    self:SetupInputHandlers(KeyMain, Settings)
end

function KeySystem:AnimateIn(KeyMain, Settings)
    -- Optimized animation sequence with fewer simultaneous operations
    TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundTransparency = 0, Size = UDim2.new(0, 500, 0, 187)}):Play()
    TweenService:Create(KeyMain.EShadow, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {ImageTransparency = 0.5}):Play()
    
    task.wait(0.05)
    
    -- Batch animate text elements
    TweenService:Create(KeyMain.Title, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
    TweenService:Create(KeyMain.Subtitle, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
    
    task.wait(0.05)
    
    -- Batch animate input elements
    TweenService:Create(KeyMain.KeyNote, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
    TweenService:Create(KeyMain.Input, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
    TweenService:Create(KeyMain.Input.UIStroke, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
    TweenService:Create(KeyMain.Input.HidenInput, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
    
    task.wait(0.05)
    
    -- Batch animate note elements
    TweenService:Create(KeyMain.NoteTitle, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
    TweenService:Create(KeyMain.NoteMessage, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
    TweenService:Create(KeyMain.Actions.Template, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
    
    local CopyHWID = KeyMain.Actions:FindFirstChild("CopyHWID")
    if CopyHWID then
        TweenService:Create(CopyHWID, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
    end
    
    task.wait(0.15)
    
    -- Final elements
    TweenService:Create(KeyMain.Hide, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {ImageTransparency = 0.3}):Play()
    TweenService:Create(KeyMain.HideP, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {ImageTransparency = 0.3}):Play()
end

function KeySystem:AnimateOut(KeyMain, Settings, callback)
    -- Optimized exit animation
    local tweensToPlay = {}
    
    -- Create all tweens but don't play them yet
    table.insert(tweensToPlay, TweenService:Create(KeyMain.Actions.Template, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 1}))
    table.insert(tweensToPlay, TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundTransparency = 1, Size = UDim2.new(0, 467, 0, 175)}))
    table.insert(tweensToPlay, TweenService:Create(KeyMain.EShadow, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {ImageTransparency = 1}))
    table.insert(tweensToPlay, TweenService:Create(KeyMain.Title, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 1}))
    table.insert(tweensToPlay, TweenService:Create(KeyMain.Subtitle, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 1}))
    table.insert(tweensToPlay, TweenService:Create(KeyMain.KeyNote, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 1}))
    table.insert(tweensToPlay, TweenService:Create(KeyMain.Input, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}))
    table.insert(tweensToPlay, TweenService:Create(KeyMain.Input.UIStroke, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Transparency = 1}))
    table.insert(tweensToPlay, TweenService:Create(KeyMain.Input.InputBox, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 1}))
    table.insert(tweensToPlay, TweenService:Create(KeyMain.Input.HidenInput, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 1}))
    table.insert(tweensToPlay, TweenService:Create(KeyMain.NoteTitle, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 1}))
    table.insert(tweensToPlay, TweenService:Create(KeyMain.NoteMessage, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 1}))
    table.insert(tweensToPlay, TweenService:Create(KeyMain.Hide, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {ImageTransparency = 1}))
    table.insert(tweensToPlay, TweenService:Create(KeyMain.HideP, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {ImageTransparency = 1}))
    
    local CopyHWID = KeyMain.Actions:FindFirstChild("CopyHWID")
    if CopyHWID then
        table.insert(tweensToPlay, TweenService:Create(CopyHWID, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 1}))
    end
    
    -- Play all tweens simultaneously
    for _, tween in ipairs(tweensToPlay) do
        tween:Play()
    end
    
    task.wait(0.51)
    
    if callback then
        callback()
    end
    
    KeyMain.Hide.Visible = false
    CleanupConnections() -- Clean up connections before destroying
    KeyUI:Destroy()
end

function KeySystem:SetupInputHandlers(KeyMain, Settings)
    local Hidden = true

    local textChangedConnection = KeyMain.Input.InputBox:GetPropertyChangedSignal('Text'):Connect(function()
        KeyMain.Input.HidenInput.Text = string.rep('•', #KeyMain.Input.InputBox.Text)
    end)
    table.insert(activeConnections, textChangedConnection)

    local focusLostConnection = KeyMain.Input.InputBox.FocusLost:Connect(function(EnterPressed)
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

            -- Optimized shake animation
            local originalPos = KeyMain.Position
            local shakeDistance = 10
            local shakeTween = TweenService:Create(KeyMain, TweenInfo.new(0.5, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out), {Position = originalPos})
            
            -- Single shake animation instead of multiple sequential ones
            KeyMain.Position = UDim2.new(originalPos.X.Scale, originalPos.X.Offset - shakeDistance, originalPos.Y.Scale, originalPos.Y.Offset)
            shakeTween:Play()
        end
    end)
    table.insert(activeConnections, focusLostConnection)

    local hidePConnection = KeyMain.HideP.MouseButton1Click:Connect(function()
        if Hidden then
            TweenService:Create(KeyMain.Input.HidenInput, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
            TweenService:Create(KeyMain.Input.InputBox, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
            Hidden = false
        else
            TweenService:Create(KeyMain.Input.HidenInput, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
            TweenService:Create(KeyMain.Input.InputBox, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
            Hidden = true
        end
    end)
    table.insert(activeConnections, hidePConnection)

    local hideConnection = KeyMain.Hide.MouseButton1Click:Connect(function()
        self:AnimateOut(KeyMain, Settings)
    end)
    table.insert(activeConnections, hideConnection)
end

return KeySystem
