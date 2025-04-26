--[[
  QuantumGuard
  A custom key system with many security features and saveable keys for Roblox scripts.
--]]

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
        FileName = "KeySystemSave.txt"
    }

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

    local function getSavedKey()
        local success, result = pcall(function()
            return readfile(KeySystemConfig.FileName)
        end)
        
        if success then
            local data = HttpService:JSONDecode(result)
            if data.hash == secureHash(data.key .. data.identifier .. KeySystemConfig.Title) then
                return data.key
            end
        end
        return nil
    end

    local function saveKey(key)
        if not KeySystemConfig.SaveKey then return end
        
        local identifier = getUniqueIdentifier()
        local data = {
            key = key,
            identifier = identifier,
            hash = secureHash(key .. identifier .. KeySystemConfig.Title)
        }
        
        pcall(function()
            writefile(KeySystemConfig.FileName, HttpService:JSONEncode(data))
        end)
    end

    local function verifyKey(inputKey)
        return inputKey == KeySystemConfig.Key
    end

    local keySystemGui = Instance.new("ScreenGui")
    keySystemGui.Name = "KeySystemGui"
    keySystemGui.ResetOnSpawn = false
    keySystemGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    keySystemGui.Parent = player.PlayerGui

    local blurEffect = Instance.new("BlurEffect")
    blurEffect.Size = 0
    blurEffect.Parent = game:GetService("Lighting")

    local mainFrame = Instance.new("Frame")
    mainFrame.Name = "MainFrame"
    mainFrame.Size = UDim2.new(0, 320, 0, 0)
    mainFrame.Position = UDim2.new(0.5, -160, 0.5, -130)
    mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
    mainFrame.BorderSizePixel = 0
    mainFrame.ClipsDescendants = true
    mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    mainFrame.Parent = keySystemGui

    local shadow = Instance.new("ImageLabel")
    shadow.Name = "Shadow"
    shadow.AnchorPoint = Vector2.new(0.5, 0.5)
    shadow.BackgroundTransparency = 1
    shadow.Position = UDim2.new(0.5, 0, 0.5, 0)
    shadow.Size = UDim2.new(1, 40, 1, 40)
    shadow.ZIndex = 0
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
    bottomFix.ZIndex = 0
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
    titleText.Parent = titleBar

    local contentFrame = Instance.new("Frame")
    contentFrame.Name = "ContentFrame"
    contentFrame.Size = UDim2.new(1, 0, 1, -40)
    contentFrame.Position = UDim2.new(0, 0, 0, 40)
    contentFrame.BackgroundTransparency = 1
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
    noteText.Parent = contentFrame

    local actionButton = Instance.new("TextButton")
    actionButton.Name = "ActionButton"
    actionButton.Size = UDim2.new(1, -40, 0, 30)
    actionButton.Position = UDim2.new(0, 20, 0, 85)
    actionButton.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
    actionButton.Text = KeySystemConfig.ActionText
    actionButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    actionButton.Font = Enum.Font.GothamSemibold
    actionButton.TextSize = 14
    actionButton.AutoButtonColor = false
    actionButton.ClipsDescendants = true
    actionButton.Parent = contentFrame
    
    local actionCorner = Instance.new("UICorner")
    actionCorner.CornerRadius = UDim.new(0, 6)
    actionCorner.Parent = actionButton
    
    local actionStroke = Instance.new("UIStroke")
    actionStroke.Color = Color3.fromRGB(80, 80, 120)
    actionStroke.Thickness = 1
    actionStroke.Parent = actionButton

    local actionGradient = Instance.new("UIGradient")
    actionGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(60, 60, 90)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(50, 50, 75))
    })
    actionGradient.Rotation = 90
    actionGradient.Parent = actionButton

    local keyContainer = Instance.new("Frame")
    keyContainer.Name = "KeyContainer"
    keyContainer.Size = UDim2.new(1, -40, 0, 40)
    keyContainer.Position = UDim2.new(0, 20, 0, 125)
    keyContainer.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
    keyContainer.BorderSizePixel = 0
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
    keyInput.Size = UDim2.new(1, -50, 1, 0)
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
    keyInput.Parent = keyContainer
    keyInput.Visible = false

    local maskedKeyInput = Instance.new("TextLabel")
    maskedKeyInput.Name = "MaskedKeyInput"
    maskedKeyInput.Size = UDim2.new(1, -50, 1, 0)
    maskedKeyInput.Position = UDim2.new(0, 10, 0, 0)
    maskedKeyInput.BackgroundTransparency = 1
    maskedKeyInput.Text = ""
    maskedKeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
    maskedKeyInput.Font = Enum.Font.Gotham
    maskedKeyInput.TextSize = 14
    maskedKeyInput.TextXAlignment = Enum.TextXAlignment.Left
    maskedKeyInput.Parent = keyContainer
    maskedKeyInput.Visible = true

    local visibilityButton = Instance.new("ImageButton")
    visibilityButton.Name = "VisibilityButton"
    visibilityButton.Size = UDim2.new(0, 20, 0, 20)
    visibilityButton.Position = UDim2.new(1, -30, 0.5, -10)
    visibilityButton.BackgroundTransparency = 1
    visibilityButton.Image = "rbxassetid://3926307971" -- Eye icon
    visibilityButton.ImageRectOffset = Vector2.new(564, 4)
    visibilityButton.ImageRectSize = Vector2.new(36, 36)
    visibilityButton.ImageColor3 = Color3.fromRGB(150, 150, 170)
    visibilityButton.Parent = keyContainer

    local verifyButton = Instance.new("TextButton")
    verifyButton.Name = "VerifyButton"
    verifyButton.Size = UDim2.new(1, -40, 0, 40)
    verifyButton.Position = UDim2.new(0, 20, 0, 175)
    verifyButton.BackgroundColor3 = Color3.fromRGB(60, 80, 150)
    verifyButton.Text = "Verify Key"
    verifyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    verifyButton.Font = Enum.Font.GothamBold
    verifyButton.TextSize = 15
    verifyButton.AutoButtonColor = false
    verifyButton.ClipsDescendants = true
    verifyButton.Parent = contentFrame
    
    local verifyCorner = Instance.new("UICorner")
    verifyCorner.CornerRadius = UDim.new(0, 6)
    verifyCorner.Parent = verifyButton

    local verifyGradient = Instance.new("UIGradient")
    verifyGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(80, 100, 170)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(60, 80, 150))
    })
    verifyGradient.Rotation = 90
    verifyGradient.Parent = verifyButton

    local statusText = Instance.new("TextLabel")
    statusText.Name = "StatusText"
    statusText.Size = UDim2.new(1, -40, 0, 20)
    statusText.Position = UDim2.new(0, 20, 0, 225)
    statusText.BackgroundTransparency = 1
    statusText.Text = ""
    statusText.TextColor3 = Color3.fromRGB(200, 200, 200)
    statusText.Font = Enum.Font.Gotham
    statusText.TextSize = 13
    statusText.Parent = contentFrame

    local function createRipple(button)
        local ripple = Instance.new("Frame")
        ripple.Name = "Ripple"
        ripple.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ripple.BackgroundTransparency = 0.8
        ripple.BorderSizePixel = 0
        ripple.ZIndex = 2
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
        actionButton, 
        Color3.fromRGB(40, 40, 60), 
        Color3.fromRGB(50, 50, 75), 
        Color3.fromRGB(35, 35, 55)
    )

    setupButtonHover(
        verifyButton, 
        Color3.fromRGB(60, 80, 150), 
        Color3.fromRGB(70, 90, 160), 
        Color3.fromRGB(50, 70, 140)
    )
    
    local keyVisible = false
    visibilityButton.MouseButton1Click:Connect(function()
        keyVisible = not keyVisible
        
        if keyVisible then
            visibilityButton.ImageRectOffset = Vector2.new(524, 4)
            keyInput.Visible = true
            maskedKeyInput.Visible = false
        else
            visibilityButton.ImageRectOffset = Vector2.new(564, 4)
            keyInput.Visible = false
            maskedKeyInput.Visible = true

            local maskedText = string.rep("•", #keyInput.Text)
            maskedKeyInput.Text = maskedText
        end
    end)

    keyInput.Changed:Connect(function(prop)
        if prop == "Text" then
            local maskedText = string.rep("•", #keyInput.Text)
            maskedKeyInput.Text = maskedText
        end
    end)

    actionButton.MouseButton1Click:Connect(function()
        pcall(function()
            setclipboard(KeySystemConfig.ActionLink)
        end)
        statusText.Text = "Link copied to clipboard!"
        statusText.TextColor3 = Color3.fromRGB(100, 255, 100)

        delay(3, function()
            statusText.Text = ""
        end)
    end)

    local successCallback = function() end

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

                    TweenService:Create(blurEffect, TweenInfo.new(0.5), {
                        Size = 0
                    }):Play()
                    
                    fadeTween.Completed:Connect(function()
                        keySystemGui:Destroy()
                        blurEffect:Destroy()

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

    TweenService:Create(blurEffect, TweenInfo.new(0.5), {
        Size = 10
    }):Play()

    delay(0.1, function()
        TweenService:Create(mainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
            Size = UDim2.new(0, 320, 0, 260)
        }):Play()
    end)

    local savedKey = getSavedKey()
    if savedKey then
        keyInput.Text = savedKey
        local maskedText = string.rep("•", #savedKey)
        maskedKeyInput.Text = maskedText
    end

    local KeySystemAPI = {}

    function KeySystemAPI:Configure(config)
        if config.Title then
            KeySystemConfig.Title = config.Title
            titleText.Text = config.Title
        end
        
        if config.NoteTitle then
            KeySystemConfig.NoteTitle = config.NoteTitle
            noteTitle.Text = config.NoteTitle
        end
        
        if config.Note then
            KeySystemConfig.Note = config.Note
            noteText.Text = config.Note
        end
        
        if config.ActionText then
            KeySystemConfig.ActionText = config.ActionText
            actionButton.Text = config.ActionText
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
        
        return self
    end

    function KeySystemAPI:OnSuccess(callback)
        if type(callback) == "function" then
            successCallback = callback
        end
        return self
    end

    function KeySystemAPI:VerifyKey(key)
        return verifyKey(key)
    end

    function KeySystemAPI:Destroy()
        keySystemGui:Destroy()
        blurEffect:Destroy()
    end

    function KeySystemAPI:HasValidKey()
        local savedKey = getSavedKey()
        if savedKey then
            return verifyKey(savedKey)
        end
        return false
    end

    function KeySystemAPI:SkipIfValidKey()
        if self:HasValidKey() then
            keySystemGui:Destroy()
            blurEffect:Destroy()
            successCallback()
            return true
        end
        return false
    end
    
    return KeySystemAPI
end
