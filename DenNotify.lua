--[[
 __   __   ______     _____     ______     __     ______   ______   ______    
/\ \ / /  /\  __ \   /\  __-.  /\  == \   /\ \   /\  ___\ /\__  _\ /\  ___\   
\ \ \'/   \ \  __ \  \ \ \/\ \ \ \  __<   \ \ \  \ \  __\ \/_/\ \/ \ \___  \  
 \ \__|    \ \_\ \_\  \ \____-  \ \_\ \_\  \ \_\  \ \_\      \ \_\  \/\_____\ 
  \/_/      \/_/\/_/   \/____/   \/_/ /_/   \/_/   \/_/       \/_/   \/_____/ 

                               dsc.gg/vadriftz
                Notification System in the Rayfield Style (kind of)
]]

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")

local NotificationSystem = {}

local function createScreenGui()
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "NotificationSystem"
    screenGui.ResetOnSpawn = false
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    pcall(function()
        screenGui.Parent = CoreGui
    end)
    
    if not screenGui.Parent then
        screenGui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")
    end
    
    return screenGui
end

local screenGui = createScreenGui()
local notifications = {}

local function createNotification(config)
    local notification = Instance.new("Frame")
    notification.Name = "Notification"
    notification.Size = UDim2.new(0, 350, 0, 80)
    notification.Position = UDim2.new(1, 400, 0, 20 + (#notifications * 90))
    notification.BackgroundTransparency = 1
    notification.Parent = screenGui
    
    local blur = Instance.new("Frame")
    blur.Name = "Blur"
    blur.Size = UDim2.new(1, 0, 1, 0)
    blur.Position = UDim2.new(0, 0, 0, 0)
    blur.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
    blur.BackgroundTransparency = 0.15
    blur.BorderSizePixel = 0
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
    shadow.ImageTransparency = 0.5
    shadow.ScaleType = Enum.ScaleType.Slice
    shadow.SliceCenter = Rect.new(12, 12, 12, 12)
    shadow.ZIndex = blur.ZIndex - 1
    shadow.Parent = notification
    
    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(40, 40, 50)
    stroke.Thickness = 1
    stroke.Transparency = 0.3
    stroke.Parent = blur
    
    local imageLabel
    if config.Image then
        imageLabel = Instance.new("ImageLabel")
        imageLabel.Name = "Icon"
        imageLabel.Size = UDim2.new(0, 24, 0, 24)
        imageLabel.Position = UDim2.new(0, 12, 0, 12)
        imageLabel.BackgroundTransparency = 1
        imageLabel.Image = config.Image
        imageLabel.ImageColor3 = Color3.fromRGB(255, 255, 255)
        imageLabel.Parent = blur
        
        local iconCorner = Instance.new("UICorner")
        iconCorner.CornerRadius = UDim.new(0, 4)
        iconCorner.Parent = imageLabel
    end
    
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "Title"
    titleLabel.Size = UDim2.new(1, config.Actions and -120 or -50, 0, 20)
    titleLabel.Position = UDim2.new(0, imageLabel and 45 or 12, 0, 8)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = config.Title or "Notification"
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.TextSize = 14
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.TextYAlignment = Enum.TextYAlignment.Top
    titleLabel.Parent = blur
    
    local contentLabel = Instance.new("TextLabel")
    contentLabel.Name = "Content"
    contentLabel.Size = UDim2.new(1, config.Actions and -120 or -50, 0, 40)
    contentLabel.Position = UDim2.new(0, imageLabel and 45 or 12, 0, 28)
    contentLabel.BackgroundTransparency = 1
    contentLabel.Text = config.Content or ""
    contentLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    contentLabel.TextSize = 12
    contentLabel.Font = Enum.Font.Gotham
    contentLabel.TextXAlignment = Enum.TextXAlignment.Left
    contentLabel.TextYAlignment = Enum.TextYAlignment.Top
    contentLabel.TextWrapped = true
    contentLabel.Parent = blur
    
    if config.Actions then
        for i, action in ipairs(config.Actions) do
            if i > 2 then break end
            
            local button = Instance.new("TextButton")
            button.Name = "Action" .. i
            button.Size = UDim2.new(0, 50, 0, 25)
            button.Position = UDim2.new(1, -60 - ((i-1) * 55), 0.5, -12.5)
            button.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
            button.BackgroundTransparency = 0.2
            button.BorderSizePixel = 0
            button.Text = action.Name or "Action"
            button.TextColor3 = Color3.fromRGB(255, 255, 255)
            button.TextSize = 11
            button.Font = Enum.Font.GothamMedium
            button.Parent = blur
            
            local buttonCorner = Instance.new("UICorner")
            buttonCorner.CornerRadius = UDim.new(0, 4)
            buttonCorner.Parent = button
            
            local buttonStroke = Instance.new("UIStroke")
            buttonStroke.Color = Color3.fromRGB(60, 60, 70)
            buttonStroke.Thickness = 1
            buttonStroke.Transparency = 0.5
            buttonStroke.Parent = button
            
            button.MouseButton1Click:Connect(function()
                if action.Callback then
                    action.Callback()
                end
                NotificationSystem:Remove(notification)
            end)
            
            button.MouseEnter:Connect(function()
                TweenService:Create(button, TweenInfo.new(0.2), {BackgroundTransparency = 0}):Play()
            end)
            
            button.MouseLeave:Connect(function()
                TweenService:Create(button, TweenInfo.new(0.2), {BackgroundTransparency = 0.2}):Play()
            end)
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
    closeButton.Parent = blur
    
    closeButton.MouseButton1Click:Connect(function()
        NotificationSystem:Remove(notification)
    end)
    
    closeButton.MouseEnter:Connect(function()
        TweenService:Create(closeButton, TweenInfo.new(0.2), {TextColor3 = Color3.fromRGB(255, 100, 100)}):Play()
    end)
    
    closeButton.MouseLeave:Connect(function()
        TweenService:Create(closeButton, TweenInfo.new(0.2), {TextColor3 = Color3.fromRGB(180, 180, 180)}):Play()
    end)
    
    table.insert(notifications, notification)
    
    notification.Rotation = 5
    blur.BackgroundTransparency = 1
    shadow.ImageTransparency = 1
    stroke.Transparency = 1
    titleLabel.TextTransparency = 1
    contentLabel.TextTransparency = 1
    closeButton.TextTransparency = 1
    
    if imageLabel then
        imageLabel.ImageTransparency = 1
    end
    
    if config.Actions then
        for i, action in ipairs(config.Actions) do
            if i > 2 then break end
            local button = blur:FindFirstChild("Action" .. i)
            if button then
                button.BackgroundTransparency = 1
                button.TextTransparency = 1
                local buttonStroke = button:FindFirstChild("UIStroke")
                if buttonStroke then
                    buttonStroke.Transparency = 1
                end
            end
        end
    end
    
    local slideIn = TweenService:Create(notification, TweenInfo.new(0.6, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
        Position = UDim2.new(1, -370, 0, 20 + ((#notifications - 1) * 90)),
        Rotation = 0
    })
    
    local fadeIn = TweenService:Create(blur, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        BackgroundTransparency = 0.15
    })
    
    local shadowFade = TweenService:Create(shadow, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        ImageTransparency = 0.5
    })
    
    local strokeFade = TweenService:Create(stroke, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Transparency = 0.3
    })
    
    local titleFade = TweenService:Create(titleLabel, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        TextTransparency = 0
    })
    
    local contentFade = TweenService:Create(contentLabel, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        TextTransparency = 0
    })
    
    local closeFade = TweenService:Create(closeButton, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        TextTransparency = 0
    })
    
    slideIn:Play()
    task.wait(0.1)
    fadeIn:Play()
    shadowFade:Play()
    strokeFade:Play()
    task.wait(0.1)
    titleFade:Play()
    contentFade:Play()
    closeFade:Play()
    
    if imageLabel then
        local imageFade = TweenService:Create(imageLabel, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            ImageTransparency = 0
        })
        imageFade:Play()
    end
    
    if config.Actions then
        for i, action in ipairs(config.Actions) do
            if i > 2 then break end
            local button = blur:FindFirstChild("Action" .. i)
            if button then
                task.wait(0.05)
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
        
        local slideOut = TweenService:Create(notification, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
            Position = UDim2.new(1, 50, 0, notification.Position.Y.Offset),
            Rotation = -3
        })
        
        if blur then
            TweenService:Create(blur, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                BackgroundTransparency = 1
            }):Play()
        end
        
        if shadow then
            TweenService:Create(shadow, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                ImageTransparency = 1
            }):Play()
        end
        
        if stroke then
            TweenService:Create(stroke, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                Transparency = 1
            }):Play()
        end
        
        if titleLabel then
            TweenService:Create(titleLabel, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                TextTransparency = 1
            }):Play()
        end
        
        if contentLabel then
            TweenService:Create(contentLabel, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                TextTransparency = 1
            }):Play()
        end
        
        if closeButton then
            TweenService:Create(closeButton, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                TextTransparency = 1
            }):Play()
        end
        
        if imageLabel then
            TweenService:Create(imageLabel, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                ImageTransparency = 1
            }):Play()
        end
        
        if blur then
            for i = 1, 2 do
                local button = blur:FindFirstChild("Action" .. i)
                if button then
                    TweenService:Create(button, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                        BackgroundTransparency = 1,
                        TextTransparency = 1
                    }):Play()
                    local buttonStroke = button:FindFirstChild("UIStroke")
                    if buttonStroke then
                        TweenService:Create(buttonStroke, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                            Transparency = 1
                        }):Play()
                    end
                end
            end
        end
        
        slideOut:Play()
        
        task.wait(0.4)
        notification:Destroy()
        
        for i, notif in ipairs(notifications) do
            TweenService:Create(notif, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                Position = UDim2.new(1, -370, 0, 20 + ((i - 1) * 90))
            }):Play()
        end
    end
end

return NotificationSystem
