--[[
 __   __   ______     _____     ______     __     ______   ______   ______    
/\ \ / /  /\  __ \   /\  __-.  /\  == \   /\ \   /\  ___\ /\__  _\ /\  ___\   
\ \ \'/   \ \  __ \  \ \ \/\ \ \ \  __<   \ \ \  \ \  __\ \/_/\ \/ \ \___  \  
 \ \__|    \ \_\ \_\  \ \____-  \ \_\ \_\  \ \_\  \ \_\      \ \_\  \/\_____\ 
  \/_/      \/_/\/_/   \/____/   \/_/ /_/   \/_/   \/_/       \/_/   \/_____/ 

                               dsc.gg/vadriftz
                Notification System in the Rayfield Style (kind of)
]]

-- [+] Lucide icon support
-- [+] Fixed General Bugs and improved animations
-- [+] Enhanced CoreGui placement
-- [+] Dynamic button sizing with collision prevention
-- [+] Enhanced text collision prevention

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local TextService = game:GetService("TextService")

local NotificationSystem = {}

local useStudio = false
local Icons = useStudio and require(script.Parent.icons) or loadstring(game:HttpGet('https://raw.githubusercontent.com/SiriusSoftwareLtd/Rayfield/refs/heads/main/icons.lua'))()

local function getIcon(name)
    name = string.match(string.lower(name), "^%s*(.*)%s*$")
    local sizedicons = Icons['48px']
    local r = sizedicons[name]
    if not r then
        error("Lucide Icons: Failed to find icon by the name of \"" .. name .. "\".", 2)
    end
    local rirs = r[2]
    local riro = r[3]
    if type(r[1]) ~= "number" or type(rirs) ~= "table" or type(riro) ~= "table" then
        error("Lucide Icons: Internal error: Invalid auto-generated asset entry")
    end
    local irs = Vector2.new(rirs[1], rirs[2])
    local iro = Vector2.new(riro[1], riro[2])
    local asset = {
        id = r[1],
        imageRectSize = irs,
        imageRectOffset = iro,
    }
    return asset
end

local function createScreenGui()
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "NotificationSystem"
    screenGui.ResetOnSpawn = false
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    screenGui.DisplayOrder = 2147483647
    screenGui.IgnoreGuiInset = true

    local function placeInCoreGui()
        local success = false

        if not success then
            pcall(function()
                if gethui then
                    screenGui.Parent = gethui()
                    success = true
                end
            end)
        end

        if not success then
            pcall(function()
                if syn and syn.protect_gui then
                    syn.protect_gui(screenGui)
                    screenGui.Parent = CoreGui
                    success = true
                end
            end)
        end

        if not success then
            pcall(function()
                screenGui.Parent = CoreGui
                success = true
            end)
        end

        if not success then
            pcall(function()
                screenGui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")
            end)
        end
    end
    
    placeInCoreGui()
    
    return screenGui
end

local screenGui = createScreenGui()
local notifications = {}

local function calculateTextSize(text, font, textSize, maxWidth)
    local textBounds = TextService:GetTextSize(text, textSize, font, Vector2.new(maxWidth, math.huge))
    return textBounds
end

local function createNotification(config)
    local notification = Instance.new("Frame")
    notification.Name = "Notification"
    notification.Size = UDim2.new(0, 0, 0, 0)
    notification.Position = UDim2.new(1, -370, 0, 20 + (#notifications * 90))
    notification.BackgroundTransparency = 1
    notification.ZIndex = 1000
    notification.Parent = screenGui
    
    local blur = Instance.new("Frame")
    blur.Name = "Blur"
    blur.Size = UDim2.new(1, 0, 1, 0)
    blur.Position = UDim2.new(0, 0, 0, 0)
    blur.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
    blur.BackgroundTransparency = 1
    blur.BorderSizePixel = 0
    blur.ZIndex = 1001
    blur.Parent = notification
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = blur
    
    local gradient = Instance.new("UIGradient")
    gradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(25, 25, 35)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(10, 10, 15))
    }
    gradient.Rotation = 45
    gradient.Parent = blur
    
    local shadow = Instance.new("ImageLabel")
    shadow.Name = "Shadow"
    shadow.Size = UDim2.new(1, 20, 1, 20)
    shadow.Position = UDim2.new(0, -10, 0, -10)
    shadow.BackgroundTransparency = 1
    shadow.Image = "rbxasset://textures/ui/Controls/DropShadow.png"
    shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
    shadow.ImageTransparency = 1
    shadow.ScaleType = Enum.ScaleType.Slice
    shadow.SliceCenter = Rect.new(12, 12, 12, 12)
    shadow.ZIndex = 999
    shadow.Parent = notification
    
    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(40, 40, 50)
    stroke.Thickness = 1
    stroke.Transparency = 1
    stroke.Parent = blur
    
    local imageLabel
    if config.Image then
        imageLabel = Instance.new("ImageLabel")
        imageLabel.Name = "Icon"
        imageLabel.Size = UDim2.new(0, 24, 0, 24)
        imageLabel.Position = UDim2.new(0, 12, 0, 12)
        imageLabel.BackgroundTransparency = 1
        imageLabel.ImageColor3 = Color3.fromRGB(255, 255, 255)
        imageLabel.ImageTransparency = 1
        imageLabel.ZIndex = 1002
        imageLabel.Parent = blur
        
        pcall(function()
            if type(config.Image) == "string" and not tonumber(config.Image) then
                local asset = getIcon(config.Image)
                imageLabel.Image = "rbxassetid://" .. asset.id
                imageLabel.ImageRectOffset = asset.imageRectOffset
                imageLabel.ImageRectSize = asset.imageRectSize
            else
                imageLabel.Image = "rbxassetid://" .. tostring(config.Image)
                imageLabel.ImageRectOffset = Vector2.new(0, 0)
                imageLabel.ImageRectSize = Vector2.new(0, 0)
            end
        end)
        
        local iconCorner = Instance.new("UICorner")
        iconCorner.CornerRadius = UDim.new(0, 4)
        iconCorner.Parent = imageLabel
    else
        imageLabel = Instance.new("ImageLabel")
        imageLabel.Name = "Icon"
        imageLabel.Size = UDim2.new(0, 24, 0, 24)
        imageLabel.Position = UDim2.new(0, 12, 0, 12)
        imageLabel.BackgroundTransparency = 1
        imageLabel.Image = "rbxassetid://3944680095"
        imageLabel.ImageColor3 = Color3.fromRGB(255, 255, 255)
        imageLabel.ImageTransparency = 1
        imageLabel.ImageRectOffset = Vector2.new(0, 0)
        imageLabel.ImageRectSize = Vector2.new(0, 0)
        imageLabel.ZIndex = 1002
        imageLabel.Parent = blur
        
        local iconCorner = Instance.new("UICorner")
        iconCorner.CornerRadius = UDim.new(0, 4)
        iconCorner.Parent = imageLabel
    end

    local buttonData = {}
    local totalButtonWidth = 0
    local buttonSpacing = 8
    local minButtonWidth = 40
    local maxButtonWidth = 100
    local maxTextLength = 12
    local buttonAreaPadding = 15
    
    if config.Actions then
        for i, action in ipairs(config.Actions) do
            if i > 2 then break end

            local buttonText = action.Name or "Action"
            if #buttonText > maxTextLength then
                buttonText = string.sub(buttonText, 1, maxTextLength - 3) .. "..."
            end

            local textBounds = calculateTextSize(buttonText, Enum.Font.GothamMedium, 11, maxButtonWidth)
            local buttonWidth = math.max(minButtonWidth, math.min(maxButtonWidth, textBounds.X + 20))
            
            buttonData[i] = {
                text = buttonText,
                width = buttonWidth,
                callback = action.Callback
            }
            
            totalButtonWidth = totalButtonWidth + buttonWidth
            if i > 1 then
                totalButtonWidth = totalButtonWidth + buttonSpacing
            end
        end
    end

    local closeButtonWidth = 30
    local buttonAreaWidth = config.Actions and (totalButtonWidth + buttonAreaPadding + closeButtonWidth) or closeButtonWidth

    local notificationWidth = 350
    local iconAndPadding = 45
    local availableTextWidth = notificationWidth - iconAndPadding - buttonAreaWidth

    local minTextWidth = 150
    if availableTextWidth < minTextWidth then
        availableTextWidth = minTextWidth
        notificationWidth = iconAndPadding + minTextWidth + buttonAreaWidth
    end
    
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "Title"
    titleLabel.Size = UDim2.new(0, availableTextWidth, 0, 20)
    titleLabel.Position = UDim2.new(0, 45, 0, 8)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = config.Title or "Notification"
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.TextSize = 14
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.TextYAlignment = Enum.TextYAlignment.Top
    titleLabel.TextTransparency = 1
    titleLabel.TextWrapped = true
    titleLabel.TextTruncate = Enum.TextTruncate.AtEnd
    titleLabel.ZIndex = 1002
    titleLabel.Parent = blur
    
    local contentLabel = Instance.new("TextLabel")
    contentLabel.Name = "Content"
    contentLabel.Size = UDim2.new(0, availableTextWidth, 0, 40)
    contentLabel.Position = UDim2.new(0, 45, 0, 28)
    contentLabel.BackgroundTransparency = 1
    contentLabel.Text = config.Content or ""
    contentLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    contentLabel.TextSize = 12
    contentLabel.Font = Enum.Font.Gotham
    contentLabel.TextXAlignment = Enum.TextXAlignment.Left
    contentLabel.TextYAlignment = Enum.TextYAlignment.Top
    contentLabel.TextWrapped = true
    contentLabel.TextTruncate = Enum.TextTruncate.AtEnd
    contentLabel.TextTransparency = 1
    contentLabel.ZIndex = 1002
    contentLabel.Parent = blur

    if config.Actions then
        local currentX = 0
        for i, data in ipairs(buttonData) do
            local button = Instance.new("TextButton")
            button.Name = "Action" .. i
            button.Size = UDim2.new(0, data.width, 0, 25)
            button.Position = UDim2.new(1, -(totalButtonWidth + closeButtonWidth) + currentX, 0.5, -12.5)
            button.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
            button.BackgroundTransparency = 1
            button.BorderSizePixel = 0
            button.Text = data.text
            button.TextColor3 = Color3.fromRGB(255, 255, 255)
            button.TextSize = 11
            button.Font = Enum.Font.GothamMedium
            button.TextTransparency = 1
            button.TextTruncate = Enum.TextTruncate.AtEnd
            button.ZIndex = 1003
            button.Parent = blur
            
            local buttonCorner = Instance.new("UICorner")
            buttonCorner.CornerRadius = UDim.new(0, 4)
            buttonCorner.Parent = button
            
            local buttonStroke = Instance.new("UIStroke")
            buttonStroke.Color = Color3.fromRGB(60, 60, 70)
            buttonStroke.Thickness = 1
            buttonStroke.Transparency = 1
            buttonStroke.Parent = button
            
            button.MouseButton1Click:Connect(function()
                if data.callback then
                    data.callback()
                end
                NotificationSystem:Remove(notification)
            end)
            
            button.MouseEnter:Connect(function()
                if button.BackgroundTransparency < 1 then
                    TweenService:Create(button, TweenInfo.new(0.2), {BackgroundTransparency = 0}):Play()
                end
            end)
            
            button.MouseLeave:Connect(function()
                if button.BackgroundTransparency < 1 then
                    TweenService:Create(button, TweenInfo.new(0.2), {BackgroundTransparency = 0.2}):Play()
                end
            end)
            
            currentX = currentX + data.width + buttonSpacing
        end
    end
    
    local closeButton = Instance.new("TextButton")
    closeButton.Name = "Close"
    closeButton.Size = UDim2.new(0, 20, 0, 20)
    closeButton.Position = UDim2.new(1, -25, 0, 5)
    closeButton.BackgroundTransparency = 1
    closeButton.Text = "×"
    closeButton.TextColor3 = Color3.fromRGB(180, 180, 180)
    closeButton.TextSize = 16
    closeButton.Font = Enum.Font.GothamBold
    closeButton.TextTransparency = 1
    closeButton.ZIndex = 1003
    closeButton.Parent = blur
    
    closeButton.MouseButton1Click:Connect(function()
        NotificationSystem:Remove(notification)
    end)
    
    closeButton.MouseEnter:Connect(function()
        if closeButton.TextTransparency < 1 then
            TweenService:Create(closeButton, TweenInfo.new(0.2), {TextColor3 = Color3.fromRGB(255, 100, 100)}):Play()
        end
    end)
    
    closeButton.MouseLeave:Connect(function()
        if closeButton.TextTransparency < 1 then
            TweenService:Create(closeButton, TweenInfo.new(0.2), {TextColor3 = Color3.fromRGB(180, 180, 180)}):Play()
        end
    end)
    
    table.insert(notifications, notification)

    local sizeExpand = TweenService:Create(notification, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, notificationWidth, 0, 80)
    })
    
    local blurFade = TweenService:Create(blur, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        BackgroundTransparency = 0.15
    })
    
    local shadowFade = TweenService:Create(shadow, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        ImageTransparency = 0.5
    })
    
    local strokeFade = TweenService:Create(stroke, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Transparency = 0.3
    })
    
    sizeExpand:Play()
    task.wait(0.15)
    
    blurFade:Play()
    shadowFade:Play()
    strokeFade:Play()
    
    task.wait(0.1)
    
    local iconFade = TweenService:Create(imageLabel, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        ImageTransparency = 0
    })
    iconFade:Play()
    
    task.wait(0.05)
    
    local titleFade = TweenService:Create(titleLabel, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        TextTransparency = 0
    })
    titleFade:Play()
    
    task.wait(0.05)
    
    local contentFade = TweenService:Create(contentLabel, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        TextTransparency = 0
    })
    contentFade:Play()
    
    task.wait(0.05)
    
    local closeFade = TweenService:Create(closeButton, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        TextTransparency = 0
    })
    closeFade:Play()
    
    if config.Actions then
        for i, action in ipairs(config.Actions) do
            if i > 2 then break end
            local button = blur:FindFirstChild("Action" .. i)
            if button then
                task.wait(0.03)
                local buttonFade = TweenService:Create(button, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    BackgroundTransparency = 0.2,
                    TextTransparency = 0
                })
                local buttonStroke = button:FindFirstChild("UIStroke")
                if buttonStroke then
                    local strokeFadeBtn = TweenService:Create(buttonStroke, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        Transparency = 0.5
                    })
                    strokeFadeBtn:Play()
                end
                buttonFade:Play()
            end
        end
    end
    
    if config.Duration and config.Duration > 0 and not config.Actions then
        task.wait(config.Duration)
        NotificationSystem:Remove(notification)
    end
    
    return notification
end

function NotificationSystem:Notify(config)
    task.spawn(function()
        createNotification(config)
    end)
end

function NotificationSystem:Remove(notification)
    local index = table.find(notifications, notification)
    if index then
        table.remove(notifications, index)
        
        local blur = notification:FindFirstChild("Blur")
        local shadow = notification:FindFirstChild("Shadow")
        local titleLabel = blur and blur:FindFirstChild("Title")
        local contentLabel = blur and blur:FindFirstChild("Content")
        local closeButton = blur and blur:FindFirstChild("Close")
        local imageLabel = blur and blur:FindFirstChild("Icon")
        local stroke = blur and blur:FindFirstChild("UIStroke")
        
        if titleLabel then
            TweenService:Create(titleLabel, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                TextTransparency = 1
            }):Play()
        end
        
        if contentLabel then
            TweenService:Create(contentLabel, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                TextTransparency = 1
            }):Play()
        end
        
        if closeButton then
            TweenService:Create(closeButton, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                TextTransparency = 1
            }):Play()
        end
        
        if imageLabel then
            TweenService:Create(imageLabel, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                ImageTransparency = 1
            }):Play()
        end
        
        if blur then
            for i = 1, 2 do
                local button = blur:FindFirstChild("Action" .. i)
                if button then
                    TweenService:Create(button, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                        BackgroundTransparency = 1,
                        TextTransparency = 1
                    }):Play()
                    local buttonStroke = button:FindFirstChild("UIStroke")
                    if buttonStroke then
                        TweenService:Create(buttonStroke, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                            Transparency = 1
                        }):Play()
                    end
                end
            end
        end
        
        task.wait(0.1)
        
        if stroke then
            TweenService:Create(stroke, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                Transparency = 1
            }):Play()
        end
        
        if blur then
            TweenService:Create(blur, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                BackgroundTransparency = 1
            }):Play()
        end
        
        if shadow then
            TweenService:Create(shadow, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                ImageTransparency = 1
            }):Play()
        end
        
        task.wait(0.15)
        
        local sizeCollapse = TweenService:Create(notification, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
            Size = UDim2.new(0, 0, 0, 0)
        })
        sizeCollapse:Play()
        
        task.wait(0.3)
        notification:Destroy()
        
        for i, notif in ipairs(notifications) do
            TweenService:Create(notif, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                Position = UDim2.new(1, -370, 0, 20 + ((i - 1) * 90))
            }):Play()
        end
    end
end

function NotificationSystem:Clear()
    for i = #notifications, 1, -1 do
        self:Remove(notifications[i])
    end
end

function NotificationSystem:GetNotificationCount()
    return #notifications
end

function NotificationSystem:SetMaxNotifications(max)
    while #notifications > max do
        self:Remove(notifications[1])
    end
end

return NotificationSystem
