--[[
 __   __   ______     _____     ______     __     ______   ______   ______    
/\ \ / /  /\  __ \   /\  __-.  /\  == \   /\ \   /\  ___\ /\__  _\ /\  ___\   
\ \ \'/   \ \  __ \  \ \ \/\ \ \ \  __<   \ \ \  \ \  __\ \/_/\ \/ \ \___  \  
 \ \__|    \ \_\ \_\  \ \____-  \ \_\ \_\  \ \_\  \ \_\      \ \_\  \/\_____\ 
  \/_/      \/_/\/_/   \/____/   \/_/ /_/   \/_/   \/_/       \/_/   \/_____/ 

 QuantumGuard Key System by Vadrifts 100% uncrackable and 25ms will be so nice that they wont crack it (somehow), right? 1
]]
return function()
    local player = game.Players.LocalPlayer
    local UserInputService = game:GetService("UserInputService")
    local TweenService = game:GetService("TweenService")
    local HttpService = game:GetService("HttpService")

local KeySystemConfig = {
    Title = "Key System",
    NoteTitle = "How to get a key",
    Note = "To access this script, you need to get a key.",
    ActionText = "Click here to copy key link",
    ActionLink = "",
    Key = "Hello",
    SaveKey = true,
    FileName = "KeySystemSave.txt",
    VipWhitelistUrl = "",
    CheckVip = false,
    KeyApiUrl = "",
    UseKeyApi = false
}

local function getKeyFromApi(hwid)
    if not KeySystemConfig.UseKeyApi or KeySystemConfig.KeyApiUrl == "" then
        return nil
    end
    
    local success, response = pcall(function()
        if syn and syn.request then
            return syn.request({
                Url = KeySystemConfig.KeyApiUrl .. "?hwid=" .. hwid,
                Method = "GET"
            })
        elseif request then
            return request({
                Url = KeySystemConfig.KeyApiUrl .. "?hwid=" .. hwid,
                Method = "GET"
            })
        end
    end)
    
    if not success or not response then return nil end
    
    local parseSuccess, data = pcall(function()
        return HttpService:JSONDecode(response.Body)
    end)
    
    if not parseSuccess then return nil end
    
    return data.key, data.expires
end

    local function secureHash(input)
        if not input then return "0" end
        local hash = 0
        for i = 1, #input do
            hash = (hash * 31 + string.byte(input, i)) % 2147483647
        end
        return tostring(hash)
    end
    
    local function getUniqueIdentifier()
        local hwid = ""
        pcall(function()
            hwid = game:GetService("RbxAnalyticsService"):GetClientId()
        end)
        local userId = player.UserId
        return secureHash(hwid .. "-" .. tostring(userId))
    end
    
    local function getHWID()
        local hwid = ""
        if syn and syn.request then
            local success, response = pcall(function()
                return syn.request({Url = "https://httpbin.org/get"})
            end)
            if success and response and response.Headers then
                hwid = response.Headers["Syn-Fingerprint"]
            end
        end
        
        if not hwid or hwid == "" then
            pcall(function()
                hwid = game:GetService("RbxAnalyticsService"):GetClientId()
            end)
        end
        
        return hwid or ""
    end
    
local function checkVipStatus()
    if not KeySystemConfig.CheckVip or KeySystemConfig.VipWhitelistUrl == "" then
        return false
    end
    
    local hwid = getHWID()
    if hwid == "" then
        return false
    end
    
    local success, response = pcall(function()
        if syn and syn.request then
            return syn.request({
                Url = KeySystemConfig.VipWhitelistUrl,
                Method = "GET"
            })
        elseif request then
            return request({
                Url = KeySystemConfig.VipWhitelistUrl,
                Method = "GET"
            })
        else
            return nil
        end
    end)
    
    if not success or not response or response.StatusCode ~= 200 then
        return false
    end
    
    local parseSuccess, data = pcall(function()
        return HttpService:JSONDecode(response.Body)
    end)
    
    if not parseSuccess or not data then
        return false
    end
    
    if type(data) == "table" then
        for _, vipId in ipairs(data) do
            if tostring(vipId) == tostring(hwid) then
                return true
            end
        end
    end
    
    return false
end

    local function saveKey(key)
        if not KeySystemConfig.SaveKey then return end
        
        ensureFolderExists()
        
        local identifier = getUniqueIdentifier()
        local data = {
            key = key,
            identifier = identifier,
            hash = secureHash(key .. identifier .. KeySystemConfig.Title),
            scriptName = KeySystemConfig.Title,
            saveTime = os.time()
        }
        
        local fileName = "QuantumGuard/" .. KeySystemConfig.Title .. " Key.txt"
        
        pcall(function()
            writefile(fileName, HttpService:JSONEncode(data))
        end)
    end
    
    local function getSavedKeys()
        local keys = {}
        
        pcall(function()
            if isfolder("QuantumGuard") then
                local files = listfiles("QuantumGuard")
                
                for _, file in ipairs(files) do
                    if string.match(file, "%.txt$") then
                        local success, fileContent = pcall(function()
                            return readfile(file)
                        end)
                        
                        if success then
                            local success2, data = pcall(function()
                                return HttpService:JSONDecode(fileContent)
                            end)
                            
                            if success2 and data.key and data.hash then
                                local identifier = getUniqueIdentifier()
                                if data.hash == secureHash(data.key .. data.identifier .. data.scriptName) then
                                    table.insert(keys, data.key)
                                end
                            end
                        end
                    end
                end
            end
        end)
        
        return keys
    end
    
local function verifyKey(inputKey)
    if KeySystemConfig.UseKeyApi and KeySystemConfig.KeyApiUrl ~= "" then
        local identifier = getUniqueIdentifier()

        local now = os.date("*t")
        local firstDayOfYear = os.time({year = now.year, month = 1, day = 1})
        local dayOfYear = math.floor((os.time() - firstDayOfYear) / 86400) + 1
        local week = math.ceil((dayOfYear + os.date("*t", firstDayOfYear).wday - 1) / 7)
        local weekString = week .. "-" .. now.year
        
        local secret = "your_secret_salt_change_this"
        local combined = identifier .. weekString .. secret

        local hash = 0
        for i = 1, #combined do
            hash = (hash * 31 + string.byte(combined, i)) % 2147483647
        end
        local expectedKey = string.sub(string.format("%x", hash), 1, 12)
        
        print("Debug - HWID:", identifier)
        print("Debug - Week:", weekString)
        print("Debug - Expected key:", expectedKey)
        print("Debug - Input key:", inputKey)
        
        return inputKey == expectedKey
    else
        if type(KeySystemConfig.Key) == "string" then
            return inputKey == KeySystemConfig.Key
        elseif type(KeySystemConfig.Key) == "table" then
            for _, validKey in ipairs(KeySystemConfig.Key) do
                if inputKey == validKey then
                    return true
                end
            end
        end
        return false
    end
end

    local function hasValidSavedKey()
        if not KeySystemConfig.SaveKey then return false end
        
        local savedKeys = getSavedKeys()
        for _, key in ipairs(savedKeys) do
            if verifyKey(key) then
                return key
            end
        end
        
        return false
    end
    
    local successCallback = function() end
    
    local KeySystemAPI = {}
    
    function KeySystemAPI:Configure(config)
        if config.Title then
            KeySystemConfig.Title = config.Title
        end
        
        if config.NoteTitle then
            KeySystemConfig.NoteTitle = config.NoteTitle
        end
        
        if config.Note then
            KeySystemConfig.Note = config.Note
        end
        
        if config.ActionText then
            KeySystemConfig.ActionText = config.ActionText
        end
        
        if config.ActionLink then
            KeySystemConfig.ActionLink = config.ActionLink
        end
        
        if config.Key then
            KeySystemConfig.Key = config.Key
        end
        
        if config.SaveKey ~= nil then
            KeySystemConfig.SaveKey = config.SaveKey
        end
        
        if config.FileName then
            KeySystemConfig.FileName = config.FileName
        end
        
        if config.VipWhitelistUrl then
            KeySystemConfig.VipWhitelistUrl = config.VipWhitelistUrl
            KeySystemConfig.CheckVip = true
        end
        
        if config.KeyApiUrl then
            KeySystemConfig.KeyApiUrl = config.KeyApiUrl
            KeySystemConfig.UseKeyApi = true
        end

        return self
    end
    
    function KeySystemAPI:OnSuccess(callback)
        if type(callback) == "function" then
            successCallback = callback
        end
        return self
    end
    
    function KeySystemAPI:SkipIfVip()
        if checkVipStatus() then
            successCallback()
            return true
        end
        return false
    end
    
    function KeySystemAPI:CheckVipAndSkip()
        if checkVipStatus() then
            print("VIP user detected! Skipping key system.")
            successCallback()
            return true
        end
        
        local validKey = hasValidSavedKey()
        if validKey and KeySystemConfig.SaveKey then
            print("Valid saved key found! Skipping key system.")
            successCallback()
            return true
        end
        
        return false
    end
    
    function KeySystemAPI:Initialize()
        if self:CheckVipAndSkip() then
            return self
        end
        
        local keySystemGui = Instance.new("ScreenGui")
        keySystemGui.Name = "KeySystemGui"
        keySystemGui.ResetOnSpawn = false
        keySystemGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        keySystemGui.DisplayOrder = 2147483647
        keySystemGui.IgnoreGuiInset = true

        local function placeInCoreGui()
            local success = false

            if not success then
                pcall(function()
                    if gethui then
                        keySystemGui.Parent = gethui()
                        success = true
                    end
                end)
            end

            if not success then
                pcall(function()
                    if syn and syn.protect_gui then
                        syn.protect_gui(keySystemGui)
                        keySystemGui.Parent = game:GetService("CoreGui")
                        success = true
                    end
                end)
            end

            if not success then
                pcall(function()
                    keySystemGui.Parent = game:GetService("CoreGui")
                    success = true
                end)
            end
        
            if not success then
                pcall(function()
                    keySystemGui.Parent = player:WaitForChild("PlayerGui")
                end)
            end
        end
        
        placeInCoreGui()
        
        local mainFrame = Instance.new("Frame")
        mainFrame.Name = "MainFrame"
        mainFrame.Size = UDim2.new(0, 320, 0, 0)
        mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
        mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
        mainFrame.BorderSizePixel = 0
        mainFrame.ClipsDescendants = true
        mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
        mainFrame.ZIndex = 1000
        mainFrame.Parent = keySystemGui
        
        local shadow = Instance.new("ImageLabel")
        shadow.Name = "Shadow"
        shadow.AnchorPoint = Vector2.new(0.5, 0.5)
        shadow.BackgroundTransparency = 1
        shadow.Position = UDim2.new(0.5, 0, 0.5, 0)
        shadow.Size = UDim2.new(1, 40, 1, 40)
        shadow.ZIndex = 999
        shadow.Image = "rbxassetid://6014261993"
        shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
        shadow.ImageTransparency = 0.5
        shadow.ScaleType = Enum.ScaleType.Slice
        shadow.SliceCenter = Rect.new(49, 49, 450, 450)
        shadow.Parent = mainFrame
        
        local UICorner = Instance.new("UICorner")
        UICorner.CornerRadius = UDim.new(0, 8)
        UICorner.Parent = mainFrame
        
        local UIStroke = Instance.new("UIStroke")
        UIStroke.Color = Color3.fromRGB(60, 60, 80)
        UIStroke.Thickness = 1.5
        UIStroke.Parent = mainFrame
        
        local titleBar = Instance.new("Frame")
        titleBar.Name = "TitleBar"
        titleBar.Size = UDim2.new(1, 0, 0, 40)
        titleBar.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
        titleBar.BorderSizePixel = 0
        titleBar.ZIndex = 1001
        titleBar.Parent = mainFrame
        
        local titleCorner = Instance.new("UICorner")
        titleCorner.CornerRadius = UDim.new(0, 8)
        titleCorner.Parent = titleBar
        
        local bottomFix = Instance.new("Frame")
        bottomFix.Name = "BottomFix"
        bottomFix.Size = UDim2.new(1, 0, 0, 10)
        bottomFix.Position = UDim2.new(0, 0, 1, -10)
        bottomFix.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
        bottomFix.BorderSizePixel = 0
        bottomFix.ZIndex = 1000
        bottomFix.Parent = titleBar
        
        local titleText = Instance.new("TextLabel")
        titleText.Name = "TitleText"
        titleText.Size = UDim2.new(1, -20, 1, 0)
        titleText.Position = UDim2.new(0, 10, 0, 0)
        titleText.BackgroundTransparency = 1
        titleText.Text = KeySystemConfig.Title
        titleText.TextColor3 = Color3.fromRGB(255, 255, 255)
        titleText.Font = Enum.Font.GothamBold
        titleText.TextSize = 16
        titleText.TextXAlignment = Enum.TextXAlignment.Left
        titleText.ZIndex = 1002
        titleText.Parent = titleBar
        
        local closeButton = Instance.new("TextButton")
        closeButton.Name = "CloseButton"
        closeButton.Size = UDim2.new(0, 24, 0, 24)
        closeButton.Position = UDim2.new(1, -30, 0.5, -12)
        closeButton.BackgroundTransparency = 1
        closeButton.Text = "x"
        closeButton.TextColor3 = Color3.fromRGB(200, 200, 200)
        closeButton.Font = Enum.Font.GothamBold
        closeButton.TextSize = 18
        closeButton.ZIndex = 1002
        closeButton.Parent = titleBar
        
        local contentFrame = Instance.new("Frame")
        contentFrame.Name = "ContentFrame"
        contentFrame.Size = UDim2.new(1, 0, 1, -40)
        contentFrame.Position = UDim2.new(0, 0, 0, 40)
        contentFrame.BackgroundTransparency = 1
        contentFrame.ZIndex = 1001
        contentFrame.Parent = mainFrame
        
        local noteTitle = Instance.new("TextLabel")
        noteTitle.Name = "NoteTitle"
        noteTitle.Size = UDim2.new(1, -40, 0, 20)
        noteTitle.Position = UDim2.new(0, 20, 0, 15)
        noteTitle.BackgroundTransparency = 1
        noteTitle.Text = KeySystemConfig.NoteTitle
        noteTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
        noteTitle.Font = Enum.Font.GothamBold
        noteTitle.TextSize = 14
        noteTitle.TextXAlignment = Enum.TextXAlignment.Left
        noteTitle.ZIndex = 1002
        noteTitle.Parent = contentFrame
        
        local noteText = Instance.new("TextLabel")
        noteText.Name = "NoteText"
        noteText.Size = UDim2.new(1, -40, 0, 40)
        noteText.Position = UDim2.new(0, 20, 0, 35)
        noteText.BackgroundTransparency = 1
        noteText.Text = KeySystemConfig.Note
        noteText.TextColor3 = Color3.fromRGB(200, 200, 200)
        noteText.Font = Enum.Font.Gotham
        noteText.TextSize = 13
        noteText.TextWrapped = true
        noteText.TextXAlignment = Enum.TextXAlignment.Left
        noteText.ZIndex = 1002
        noteText.Parent = contentFrame
        
        local actionText = Instance.new("TextButton")
        actionText.Name = "ActionText"
        actionText.Size = UDim2.new(1, -40, 0, 20)
        actionText.Position = UDim2.new(0, 20, 0, 85)
        actionText.BackgroundTransparency = 1
        actionText.Text = KeySystemConfig.ActionText
        actionText.TextColor3 = Color3.fromRGB(240, 240, 240)
        actionText.Font = Enum.Font.GothamSemibold
        actionText.TextSize = 14
        actionText.TextXAlignment = Enum.TextXAlignment.Left
        actionText.AutoButtonColor = false
        actionText.ZIndex = 1002
        actionText.Parent = contentFrame
        
        local underline = Instance.new("Frame")
        underline.Name = "Underline"
        underline.Size = UDim2.new(1, 0, 0, 1)
        underline.Position = UDim2.new(0, 0, 1, 0)
        underline.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
        underline.BorderSizePixel = 0
        underline.ZIndex = 1002
        underline.Parent = actionText
        
        local keyContainer = Instance.new("Frame")
        keyContainer.Name = "KeyContainer"
        keyContainer.Size = UDim2.new(1, -40, 0, 40)
        keyContainer.Position = UDim2.new(0, 20, 0, 115)
        keyContainer.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
        keyContainer.BorderSizePixel = 0
        keyContainer.ZIndex = 1002
        keyContainer.Parent = contentFrame
        
        local keyContainerCorner = Instance.new("UICorner")
        keyContainerCorner.CornerRadius = UDim.new(0, 6)
        keyContainerCorner.Parent = keyContainer
        
        local keyContainerStroke = Instance.new("UIStroke")
        keyContainerStroke.Color = Color3.fromRGB(60, 60, 80)
        keyContainerStroke.Thickness = 1
        keyContainerStroke.Parent = keyContainer
        
        local keyInput = Instance.new("TextBox")
        keyInput.Name = "KeyInput"
        keyInput.Size = UDim2.new(1, -20, 1, 0)
        keyInput.Position = UDim2.new(0, 10, 0, 0)
        keyInput.BackgroundTransparency = 1
        keyInput.Text = ""
        keyInput.PlaceholderText = "Enter key here..."
        keyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
        keyInput.PlaceholderColor3 = Color3.fromRGB(120, 120, 140)
        keyInput.Font = Enum.Font.Gotham
        keyInput.TextSize = 14
        keyInput.TextXAlignment = Enum.TextXAlignment.Left
        keyInput.ClearTextOnFocus = false
        keyInput.ZIndex = 1003
        keyInput.Parent = keyContainer
        
        local verifyButton = Instance.new("TextButton")
        verifyButton.Name = "VerifyButton"
        verifyButton.Size = UDim2.new(1, -40, 0, 40)
        verifyButton.Position = UDim2.new(0, 20, 0, 165)
        verifyButton.BackgroundColor3 = Color3.fromRGB(70, 120, 220)
        verifyButton.Text = "Verify Key"
        verifyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        verifyButton.Font = Enum.Font.GothamBold
        verifyButton.TextSize = 15
        verifyButton.AutoButtonColor = false
        verifyButton.ClipsDescendants = true
        verifyButton.ZIndex = 1002
        verifyButton.Parent = contentFrame
        
        local verifyCorner = Instance.new("UICorner")
        verifyCorner.CornerRadius = UDim.new(0, 6)
        verifyCorner.Parent = verifyButton
        
        local verifyGradient = Instance.new("UIGradient")
        verifyGradient.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(90, 140, 240)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(70, 120, 220))
        })
        verifyGradient.Rotation = 90
        verifyGradient.Parent = verifyButton
        
        local statusText = Instance.new("TextLabel")
        statusText.Name = "StatusText"
        statusText.Size = UDim2.new(1, -40, 0, 20)
        statusText.Position = UDim2.new(0, 20, 0, 215)
        statusText.BackgroundTransparency = 1
        statusText.Text = ""
        statusText.TextColor3 = Color3.fromRGB(200, 200, 200)
        statusText.Font = Enum.Font.Gotham
        statusText.TextSize = 13
        statusText.ZIndex = 1002
        statusText.Parent = contentFrame
        
        local notificationFrame = Instance.new("Frame")
        notificationFrame.Name = "NotificationFrame"
        notificationFrame.Size = UDim2.new(0, 240, 0, 60)
        notificationFrame.Position = UDim2.new(0.5, 0, -0.1, 0)
        notificationFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
        notificationFrame.BorderSizePixel = 0
        notificationFrame.AnchorPoint = Vector2.new(0.5, 0)
        notificationFrame.Visible = false
        notificationFrame.ZIndex = 1100
        notificationFrame.Parent = keySystemGui
        
        local notifCorner = Instance.new("UICorner")
        notifCorner.CornerRadius = UDim.new(0, 8)
        notifCorner.Parent = notificationFrame
        
        local notifStroke = Instance.new("UIStroke")
        notifStroke.Color = Color3.fromRGB(70, 70, 90)
        notifStroke.Thickness = 1.5
        notifStroke.Parent = notificationFrame
        
        local notifShadow = Instance.new("ImageLabel")
        notifShadow.Name = "Shadow"
        notifShadow.AnchorPoint = Vector2.new(0.5, 0.5)
        notifShadow.BackgroundTransparency = 1
        notifShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
        notifShadow.Size = UDim2.new(1, 40, 1, 40)
        notifShadow.ZIndex = 1099
        notifShadow.Image = "rbxassetid://6014261993"
        notifShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
        notifShadow.ImageTransparency = 0.5
        notifShadow.ScaleType = Enum.ScaleType.Slice
        notifShadow.SliceCenter = Rect.new(49, 49, 450, 450)
        notifShadow.Parent = notificationFrame
        
        local notifTitle = Instance.new("TextLabel")
        notifTitle.Name = "Title"
        notifTitle.Size = UDim2.new(1, -20, 0, 20)
        notifTitle.Position = UDim2.new(0, 10, 0, 10)
        notifTitle.BackgroundTransparency = 1
        notifTitle.Text = "Link Copied"
        notifTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
        notifTitle.Font = Enum.Font.GothamBold
        notifTitle.TextSize = 14
        notifTitle.TextXAlignment = Enum.TextXAlignment.Left
        notifTitle.ZIndex = 1101
        notifTitle.Parent = notificationFrame
        
        local notifText = Instance.new("TextLabel")
        notifText.Name = "Text"
        notifText.Size = UDim2.new(1, -20, 0, 20)
        notifText.Position = UDim2.new(0, 10, 0, 30)
        notifText.BackgroundTransparency = 1
        notifText.Text = "Link copied to clipboard!"
        notifText.TextColor3 = Color3.fromRGB(200, 200, 200)
        notifText.Font = Enum.Font.Gotham
        notifText.TextSize = 13
        notifText.TextXAlignment = Enum.TextXAlignment.Left
        notifText.ZIndex = 1101
        notifText.Parent = notificationFrame
        
        local function createRipple(button)
            local ripple = Instance.new("Frame")
            ripple.Name = "Ripple"
            ripple.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ripple.BackgroundTransparency = 0.8
            ripple.BorderSizePixel = 0
            ripple.ZIndex = button.ZIndex + 1
            ripple.Parent = button
            
            local rippleCorner = Instance.new("UICorner")
            rippleCorner.CornerRadius = UDim.new(1, 0)
            rippleCorner.Parent = ripple
            
            local mousePos = UserInputService:GetMouseLocation() - Vector2.new(button.AbsolutePosition.X, button.AbsolutePosition.Y)
            local size = math.max(button.AbsoluteSize.X, button.AbsoluteSize.Y) * 2
            
            ripple.Position = UDim2.new(0, mousePos.X - size/2, 0, mousePos.Y - size/2)
            ripple.Size = UDim2.new(0, 0, 0, 0)
            
            local tween = TweenService:Create(ripple, TweenInfo.new(0.5), {
                Size = UDim2.new(0, size, 0, size),
                BackgroundTransparency = 1
            })
            tween:Play()
            
            tween.Completed:Connect(function()
                ripple:Destroy()
            end)
        end
        
        local function setupButtonHover(button, normalColor, hoverColor, pressColor)
            button.MouseEnter:Connect(function()
                TweenService:Create(button, TweenInfo.new(0.2), {
                    BackgroundColor3 = hoverColor
                }):Play()
            end)
            
            button.MouseLeave:Connect(function()
                TweenService:Create(button, TweenInfo.new(0.2), {
                    BackgroundColor3 = normalColor
                }):Play()
            end)
            
            button.MouseButton1Down:Connect(function()
                createRipple(button)
                TweenService:Create(button, TweenInfo.new(0.1), {
                    BackgroundColor3 = pressColor
                }):Play()
            end)
            
            button.MouseButton1Up:Connect(function()
                TweenService:Create(button, TweenInfo.new(0.1), {
                    BackgroundColor3 = hoverColor
                }):Play()
            end)
        end
        
        setupButtonHover(
            verifyButton, 
            Color3.fromRGB(70, 120, 220), 
            Color3.fromRGB(90, 140, 240), 
            Color3.fromRGB(60, 110, 200)
        )
        
        actionText.MouseEnter:Connect(function()
            TweenService:Create(actionText, TweenInfo.new(0.2), {
                TextColor3 = Color3.fromRGB(255, 255, 255)
            }):Play()
            TweenService:Create(underline, TweenInfo.new(0.2), {
                BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            }):Play()
        end)
        
        actionText.MouseLeave:Connect(function()
            TweenService:Create(actionText, TweenInfo.new(0.2), {
                TextColor3 = Color3.fromRGB(240, 240, 240)
            }):Play()
            TweenService:Create(underline, TweenInfo.new(0.2), {
                BackgroundColor3 = Color3.fromRGB(240, 240, 240)
            }):Play()
        end)
        
        local function showNotification(title, text)
            notifTitle.Text = title
            notifText.Text = text
            notificationFrame.Visible = true
            notificationFrame.Position = UDim2.new(0.5, 0, -0.1, 0)
            notificationFrame.BackgroundTransparency = 0
            
            TweenService:Create(notificationFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                Position = UDim2.new(0.5, 0, 0.05, 0)
            }):Play()
            
            delay(3, function()
                local fadeTween = TweenService:Create(notificationFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {
                    Position = UDim2.new(0.5, 0, -0.1, 0),
                    BackgroundTransparency = 1
                })
                fadeTween:Play()
                
                fadeTween.Completed:Connect(function()
                    notificationFrame.Visible = false
                end)
            end)
        end
        
        actionText.MouseButton1Click:Connect(function()
            pcall(function()
                setclipboard(KeySystemConfig.ActionLink)
            end)
            
            local linkText = KeySystemConfig.ActionLink
            if #linkText > 30 then
                linkText = string.sub(linkText, 1, 27) .. "..."
            end
            showNotification("Link Copied", linkText)
            
            statusText.Text = "Link copied to clipboard!"
            statusText.TextColor3 = Color3.fromRGB(100, 255, 100)
            
            delay(3, function()
                statusText.Text = ""
            end)
        end)
        
        local function onVerifyClick()
            local inputKey = keyInput.Text
            
            if inputKey == "" then
                statusText.Text = "Please enter a key!"
                statusText.TextColor3 = Color3.fromRGB(255, 100, 100)
                return
            end
            
            local originalText = verifyButton.Text
            verifyButton.Text = "Verifying..."
            
            delay(math.random(0.5, 1.5), function()
                if verifyKey(inputKey) then
                    statusText.Text = "Key verified successfully!"
                    statusText.TextColor3 = Color3.fromRGB(100, 255, 100)
                    
                    if KeySystemConfig.SaveKey then
                        saveKey(inputKey)
                    end
                    
                    delay(1, function()
                        local fadeTween = TweenService:Create(mainFrame, TweenInfo.new(0.5), {
                            Size = UDim2.new(0, 320, 0, 0)
                        })
                        fadeTween:Play()
                        
                        fadeTween.Completed:Connect(function()
                            keySystemGui:Destroy()
                            successCallback()
                        end)
                    end)
                else
                    statusText.Text = "Invalid key! Please try again."
                    statusText.TextColor3 = Color3.fromRGB(255, 100, 100)
                    verifyButton.Text = originalText
                    
                    local originalPosition = mainFrame.Position
                    for i = 1, 5 do
                        mainFrame.Position = originalPosition + UDim2.new(0, math.random(-5, 5), 0, 0)
                        wait(0.05)
                    end
                    mainFrame.Position = originalPosition
                end
            end)
        end
        
        verifyButton.MouseButton1Click:Connect(onVerifyClick)
        
        keyInput.FocusLost:Connect(function(enterPressed)
            if enterPressed then
                onVerifyClick()
            end
        end)
        
        closeButton.MouseEnter:Connect(function()
            TweenService:Create(closeButton, TweenInfo.new(0.2), {
                TextColor3 = Color3.fromRGB(255, 255, 255)
            }):Play()
        end)
        
        closeButton.MouseLeave:Connect(function()
            TweenService:Create(closeButton, TweenInfo.new(0.2), {
                TextColor3 = Color3.fromRGB(200, 200, 200)
            }):Play()
        end)
        
        closeButton.MouseButton1Click:Connect(function()
            local fadeTween = TweenService:Create(mainFrame, TweenInfo.new(0.5), {
                Size = UDim2.new(0, 320, 0, 0)
            })
            fadeTween:Play()
            
            fadeTween.Completed:Connect(function()
                keySystemGui:Destroy()
            end)
        end)
        
        delay(0.1, function()
            TweenService:Create(mainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                Size = UDim2.new(0, 320, 0, 260)
            }):Play()
        end)
        
        local validSavedKey = hasValidSavedKey()
        if validSavedKey and KeySystemConfig.SaveKey then
            keyInput.Text = validSavedKey
            
            delay(0.5, function()
                onVerifyClick()
            end)
        end
        
        return self
    end
    
    function KeySystemAPI:AddKey(key)
        if type(KeySystemConfig.Key) == "string" then
            KeySystemConfig.Key = {KeySystemConfig.Key}
        end
        
        if type(KeySystemConfig.Key) == "table" then
            table.insert(KeySystemConfig.Key, key)
        end
        
        return self
    end
    
    function KeySystemAPI:VerifyKey(key)
        return verifyKey(key)
    end
    
    function KeySystemAPI:Destroy()
        if keySystemGui then
            keySystemGui:Destroy()
        end
    end
    
    function KeySystemAPI:HasValidKey()
        return hasValidSavedKey() ~= false
    end
    
    function KeySystemAPI:SkipIfValidKey()
        local validKey = hasValidSavedKey()
        if validKey and KeySystemConfig.SaveKey then
            successCallback()
            return true
        end
        return false
    end
    
    function KeySystemAPI:AllowClose(callback)
        closeButton.MouseButton1Click:Connect(function()
            local fadeTween = TweenService:Create(mainFrame, TweenInfo.new(0.5), {
                Size = UDim2.new(0, 320, 0, 0)
            })
            fadeTween:Play()
            
            fadeTween.Completed:Connect(function()
                keySystemGui:Destroy()
                
                if type(callback) == "function" then
                    callback()
                end
            end)
        end)
        
        return self
    end
    
    function KeySystemAPI:ClearSavedKeys()
        pcall(function()
            if isfolder("QuantumGuard") then
                local files = listfiles("QuantumGuard")
                
                for _, file in ipairs(files) do
                    if string.match(file, "%.txt$") then
                        pcall(function()
                            delfile(file)
                        end)
                    end
                end
            end
        end)
        
        return self
    end
    
    return KeySystemAPI
end
