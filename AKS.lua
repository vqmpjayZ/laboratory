--[[
ArrayField Standalone Key System
Extracted and adapted from ArrayField Interface Suite
Original by Arrays
]]

local KeySystem = {}

local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local LocalPlayer = Players.LocalPlayer

local KeyUI = game:GetObjects("rbxassetid://11695805160")[1]
KeyUI.Enabled = true

if game:GetService("RunService"):IsStudio() then
    function gethui() return KeyUI end
    function writefile() end
    function isfolder() return false end
    function makefolder() end
    function isfile() return false end
    function readfile() return "" end
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
        Gui.Parent = LocalPlayer:FindFirstChildWhichIsA("PlayerGui")
    end
end

local ArrayFieldFolder = "ArrayField"
local ConfigurationExtension = ".rfld"

function KeySystem:CreateKeyUI(Settings)
    if not Settings then
        error("KeySystem: Settings table required")
    end
    if not Settings.Keys then
        error("KeySystem: Keys array required")
    end
    if not Settings.Callback then
        error("KeySystem: Callback function required")
    end

    Settings.Title = Settings.Title or "Key System"
    Settings.Subtitle = Settings.Subtitle or "Enter Key"
    Settings.Note = Settings.Note or "No instructions provided"
    Settings.SaveKey = Settings.SaveKey or false
    Settings.FileName = Settings.FileName or "DefaultKey"
    Settings.GrabKeyFromSite = Settings.GrabKeyFromSite or false

    if Settings.SaveKey then
        if not isfolder(ArrayFieldFolder) then
            makefolder(ArrayFieldFolder)
        end
        if not isfolder(ArrayFieldFolder.."/Key System") then
            makefolder(ArrayFieldFolder.."/Key System")
        end
    end

    if Settings.SaveKey then
        local keyFilePath = ArrayFieldFolder.."/Key System".."/"..Settings.FileName..ConfigurationExtension
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
                return game:HttpGet(key):gsub("[\n\r]", " "):gsub(" ", "")
            end)
            if success then
                Settings.Keys[i] = response
            else
                warn("KeySystem: Failed to fetch key from " .. key)
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

    if Settings.Actions then
        for _, ActionInfo in ipairs(Settings.Actions) do
            local Action = KeyMain.Actions.Template:Clone()
            Action.Text = ActionInfo.Text
            Action.Visible = true
            Action.Parent = KeyMain.Actions
            
            Action.MouseButton1Down:Connect(ActionInfo.OnPress)
            Action.MouseEnter:Connect(function()
                TweenService:Create(Action, TweenInfo.new(.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    TextColor3 = Color3.fromRGB(185, 185, 185)
                }):Play()
            end)
            Action.MouseLeave:Connect(function()
                TweenService:Create(Action, TweenInfo.new(.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    TextColor3 = Color3.fromRGB(105, 105, 105)
                }):Play()
            end)
        end
    end

    self:AnimateIn(KeyMain, Settings)
    self:SetupInputHandlers(KeyMain, Settings)
end

function KeySystem:AnimateIn(KeyMain, Settings)
    TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {
        BackgroundTransparency = 0,
        Size = UDim2.new(0, 500, 0, 187)
    }):Play()
    
    TweenService:Create(KeyMain.EShadow, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {
        ImageTransparency = 0.5
    }):Play()
    
    wait(0.05)

    TweenService:Create(KeyMain.Title, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {
        TextTransparency = 0
    }):Play()
    
    TweenService:Create(KeyMain.Subtitle, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {
        TextTransparency = 0
    }):Play()
    
    wait(0.05)
    
    TweenService:Create(KeyMain.KeyNote, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {
        TextTransparency = 0
    }):Play()
    
    TweenService:Create(KeyMain.Input, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {
        BackgroundTransparency = 0
    }):Play()
    
    TweenService:Create(KeyMain.Input.UIStroke, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {
        Transparency = 0
    }):Play()
    
    TweenService:Create(KeyMain.Input.HidenInput, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {
        TextTransparency = 0
    }):Play()
    
    wait(0.05)

    TweenService:Create(KeyMain.NoteTitle, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {
        TextTransparency = 0
    }):Play()
    
    TweenService:Create(KeyMain.NoteMessage, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {
        TextTransparency = 0
    }):Play()
    
    wait(0.15)

    TweenService:Create(KeyMain.Hide, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {
        ImageTransparency = 0.3
    }):Play()
    
    TweenService:Create(KeyMain.HideP, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {
        ImageTransparency = 0.3
    }):Play()
    
    if Settings.Actions then
        wait(0.2)
        for _, Action in ipairs(KeyMain.Actions:GetChildren()) do
            if Action.ClassName == "TextButton" and Action.Name ~= "Template" then
                TweenService:Create(Action, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {
                    TextTransparency = 0
                }):Play()
                wait(0.05)
            end
        end
    end
end

function KeySystem:AnimateOut(KeyMain, Settings, callback)
    if Settings.Actions then
        for _, Action in ipairs(KeyMain.Actions:GetChildren()) do
            if Action.ClassName == "TextButton" and Action.Name ~= "Template" then
                TweenService:Create(Action, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {
                    TextTransparency = 1
                }):Play()
            end
        end
    end

    TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {
        BackgroundTransparency = 1,
        Size = UDim2.new(0, 467, 0, 175)
    }):Play()
    
    TweenService:Create(KeyMain.EShadow, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {
        ImageTransparency = 1
    }):Play()
    
    TweenService:Create(KeyMain.Title, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {
        TextTransparency = 1
    }):Play()
    
    TweenService:Create(KeyMain.Subtitle, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {
        TextTransparency = 1
    }):Play()
    
    TweenService:Create(KeyMain.KeyNote, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {
        TextTransparency = 1
    }):Play()
    
    TweenService:Create(KeyMain.Input, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {
        BackgroundTransparency = 1
    }):Play()
    
    TweenService:Create(KeyMain.Input.UIStroke, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {
        Transparency = 1
    }):Play()
    
    TweenService:Create(KeyMain.Input.InputBox, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {
        TextTransparency = 1
    }):Play()
    
    TweenService:Create(KeyMain.Input.HidenInput, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {
        TextTransparency = 1
    }):Play()
    
    TweenService:Create(KeyMain.NoteTitle, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {
        TextTransparency = 1
    }):Play()
    
    TweenService:Create(KeyMain.NoteMessage, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {
        TextTransparency = 1
    }):Play()
    
    TweenService:Create(KeyMain.Hide, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {
        ImageTransparency = 1
    }):Play()
    
    TweenService:Create(KeyMain.HideP, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {
        ImageTransparency = 1
    }):Play()
    
    wait(0.51)
    if callback then callback() end
    KeyMain.Hide.Visible = false
    KeyUI:Destroy()
end

function KeySystem:SetupInputHandlers(KeyMain, Settings)
    local AttemptsRemaining = math.random(2, 6)
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
                    local keyFilePath = ArrayFieldFolder.."/Key System".."/"..Settings.FileName..ConfigurationExtension
                    writefile(keyFilePath, EnteredKey)
                end
                
                Settings.Callback()
            end)
        else
            AttemptsRemaining = AttemptsRemaining - 1
            
            if AttemptsRemaining <= 0 then
                self:AnimateOut(KeyMain, Settings, function()
                    LocalPlayer:Kick("No Attempts Remaining")
                end)
                return
            end
        
            KeyMain.Input.InputBox.Text = ""
            
            local originalPos = KeyMain.Position
            TweenService:Create(KeyMain, TweenInfo.new(0.1, Enum.EasingStyle.Elastic), {
                Position = UDim2.new(0.495, 0, 0.5, 0)
            }):Play()
            
            wait(0.1)
            TweenService:Create(KeyMain, TweenInfo.new(0.1, Enum.EasingStyle.Elastic), {
                Position = UDim2.new(0.505, 0, 0.5, 0)
            }):Play()
            
            wait(0.1)
            TweenService:Create(KeyMain, TweenInfo.new(0.1, Enum.EasingStyle.Quint), {
                Position = originalPos
            }):Play()
        end
    end)

    KeyMain.HideP.MouseButton1Click:Connect(function()
        if Hidden then
            TweenService:Create(KeyMain.Input.HidenInput, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {
                TextTransparency = 1
            }):Play()
            TweenService:Create(KeyMain.Input.InputBox, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {
                TextTransparency = 0
            }):Play()
            Hidden = false
        else
            TweenService:Create(KeyMain.Input.HidenInput, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {
                TextTransparency = 0
            }):Play()
            TweenService:Create(KeyMain.Input.InputBox, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {
                TextTransparency = 1
            }):Play()
            Hidden = true
        end
    end)

    KeyMain.Hide.MouseButton1Click:Connect(function()
        self:AnimateOut(KeyMain, Settings, function()
            if Settings.KickOnClose ~= false then
                LocalPlayer:Kick("Key System Closed")
            end
        end)
    end)
end

function KeySystem:Notify(title, content, duration)
    duration = duration or 5
    
    local notification = Instance.new("ScreenGui")
    notification.Name = "KeySystemNotification"
    notification.Parent = CoreGui
    
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 300, 0, 80)
    frame.Position = UDim2.new(1, -320, 0, 20)
    frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    frame.BorderSizePixel = 0
    frame.Parent = notification
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = frame
    
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(1, -20, 0, 25)
    titleLabel.Position = UDim2.new(0, 10, 0, 5)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = title
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.TextSize = 16
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Parent = frame
    
    local contentLabel = Instance.new("TextLabel")
    contentLabel.Size = UDim2.new(1, -20, 0, 45)
    contentLabel.Position = UDim2.new(0, 10, 0, 25)
    contentLabel.BackgroundTransparency = 1
    contentLabel.Text = content
    contentLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    contentLabel.TextSize = 14
    contentLabel.Font = Enum.Font.Gotham
    contentLabel.TextXAlignment = Enum.TextXAlignment.Left
    contentLabel.TextYAlignment = Enum.TextYAlignment.Top
    contentLabel.TextWrapped = true
    contentLabel.Parent = frame

    TweenService:Create(frame, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {
        Position = UDim2.new(1, -320, 0, 20)
    }):Play()
    
    game:GetService("Debris"):AddItem(notification, duration)

    wait(duration - 0.5)
    TweenService:Create(frame, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {
        Position = UDim2.new(1, 20, 0, 20)
    }):Play()
end

function KeySystem:Example()
    self:CreateKeyUI({
        Title = "My Script",
        Subtitle = "Key System",
        Note = "Join discord.gg/example to get the key",
        Keys = {"test123", "example456"},
        SaveKey = true,
        FileName = "MyScriptKey",
        GrabKeyFromSite = false,
        Actions = {
            {
                Text = "Get Key (Discord)",
                OnPress = function()
                    setclipboard("https://discord.gg/example")
                    KeySystem:Notify("Key System", "Discord link copied to clipboard!", 3)
                end
            },
            {
                Text = "Get Key (Website)", 
                OnPress = function()
                    setclipboard("https://example.com/key")
                    KeySystem:Notify("Key System", "Website link copied to clipboard!", 3)
                end
            }
        },
        Callback = function()
            KeySystem:Notify("Key System", "Key verified! Loading script...", 3)
            print("Script loaded successfully!")
        end
    })
end

return KeySystem
