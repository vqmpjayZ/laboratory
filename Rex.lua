--[[
    RayUI Library
    A lightweight, customizable UI library for Roblox
]]

local RayUI = {}
RayUI.__index = RayUI

-- Services
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local TextService = game:GetService("TextService")
local HttpService = game:GetService("HttpService")

-- Constants
local PLAYER = Players.LocalPlayer
local MOUSE = PLAYER:GetMouse()

-- Lucide Icons Support
local Icons = loadstring(game:HttpGet('https://raw.githubusercontent.com/SiriusSoftwareLtd/Rayfield/refs/heads/main/icons.lua'))()

local function getIcon(name)
    name = string.match(string.lower(name), "^%s*(.*)%s*$")
    local sizedicons = Icons['48px']
    local r = sizedicons[name]
    if not r then
        warn("RayUI: Failed to find icon by the name of \"" .. name .. "\".")
        return nil
    end
    
    local rirs = r[2]
    local riro = r[3]
    if type(r[1]) ~= "number" or type(rirs) ~= "table" or type(riro) ~= "table" then
        warn("RayUI: Internal error: Invalid auto-generated asset entry")
        return nil
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

-- Utility Functions
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

local function setupButtonHover(button, normalColor, hoverColor, clickColor)
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
            BackgroundColor3 = clickColor
        }):Play()
    end)
    
    button.MouseButton1Up:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.1), {
            BackgroundColor3 = hoverColor
        }):Play()
    end)
end

local function setupImageButtonHover(button, normalColor, hoverColor)
    button.MouseEnter:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2), {
            ImageColor3 = hoverColor
        }):Play()
    end)
    
    button.MouseLeave:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2), {
            ImageColor3 = normalColor
        }):Play()
    end)
end

local function makeDraggable(frame, handle)
    local dragging = false
    local dragInput
    local dragStart
    local startPos
    
    local function update(input)
        local delta = input.Position - dragStart
        frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
    
    handle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    
    handle.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            update(input)
        end
    end)
end

-- Create a new window
function RayUI.new(config)
    config = config or {}
    local title = config.Title or "RayUI Window"
    local size = config.Size or UDim2.new(0, 550, 0, 400)
    local position = config.Position or UDim2.new(0.5, -275, 0.5, -200)
    local theme = config.Theme or {
        Background = Color3.fromRGB(25, 25, 35),
        Accent = Color3.fromRGB(60, 60, 90),
        LightAccent = Color3.fromRGB(70, 70, 100),
        DarkAccent = Color3.fromRGB(40, 40, 60),
        TextColor = Color3.fromRGB(255, 255, 255),
        SubTextColor = Color3.fromRGB(200, 200, 200)
    }
    
    local window = setmetatable({
        Title = title,
        Size = size,
        Position = position,
        Theme = theme,
        Tabs = {},
        ActiveTab = nil,
        Minimized = false,
        Visible = true
    }, RayUI)
    
    -- Create ScreenGui
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "RayUI_" .. title:gsub("%s+", "_")
    screenGui.Parent = PLAYER.PlayerGui
    screenGui.ResetOnSpawn = false
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    window.ScreenGui = screenGui
    
    -- Main container
    local mainFrame = Instance.new("Frame")
    mainFrame.Name = "MainFrame"
    mainFrame.Size = size
    mainFrame.Position = position
    mainFrame.BackgroundColor3 = theme.Background
    mainFrame.BorderSizePixel = 0
    mainFrame.Parent = screenGui
    window.MainFrame = mainFrame
    
    -- Shadow effect
    local shadow = Instance.new("ImageLabel")
    shadow.Name = "Shadow"
    shadow.AnchorPoint = Vector2.new(0.5, 0.5)
    shadow.BackgroundTransparency = 1
    shadow.Position = UDim2.new(0.5, 0, 0.5, 0)
    shadow.Size = UDim2.new(1, 30, 1, 30)
    shadow.ZIndex = 0
    shadow.Image = "rbxassetid://6014261993"
    shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
    shadow.ImageTransparency = 0.5
    shadow.ScaleType = Enum.ScaleType.Slice
    shadow.SliceCenter = Rect.new(49, 49, 450, 450)
    shadow.Parent = mainFrame
    
    -- Rounded corners
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 8)
    UICorner.Parent = mainFrame
    
    -- UI Stroke
    local UIStroke = Instance.new("UIStroke")
    UIStroke.Color = theme.Accent
    UIStroke.Thickness = 1.5
    UIStroke.Parent = mainFrame
    
    -- Title bar
    local titleBar = Instance.new("Frame")
    titleBar.Name = "TitleBar"
    titleBar.Size = UDim2.new(1, 0, 0, 40)
    titleBar.BackgroundColor3 = theme.DarkAccent
    titleBar.BorderSizePixel = 0
    titleBar.Parent = mainFrame
    window.TitleBar = titleBar
    
    local titleCorner = Instance.new("UICorner")
    titleCorner.CornerRadius = UDim.new(0, 8)
    titleCorner.Parent = titleBar
    
    -- Fix the bottom corners of title bar
    local bottomFix = Instance.new("Frame")
    bottomFix.Name = "BottomFix"
    bottomFix.Size = UDim2.new(1, 0, 0, 10)
    bottomFix.Position = UDim2.new(0, 0, 1, -10)
    bottomFix.BackgroundColor3 = theme.DarkAccent
    bottomFix.BorderSizePixel = 0
    bottomFix.ZIndex = 0
    bottomFix.Parent = titleBar
    
    -- Title text
    local titleText = Instance.new("TextLabel")
    titleText.Name = "TitleText"
    titleText.Size = UDim2.new(1, -120, 1, 0)
    titleText.Position = UDim2.new(0, 15, 0, 0)
    titleText.BackgroundTransparency = 1
    titleText.Text = title
    titleText.TextColor3 = theme.TextColor
    titleText.Font = Enum.Font.GothamBold
    titleText.TextSize = 16
    titleText.TextXAlignment = Enum.TextXAlignment.Left
    titleText.Parent = titleBar
    
    -- Search bar
    local searchContainer = Instance.new("Frame")
    searchContainer.Name = "SearchContainer"
    searchContainer.Size = UDim2.new(0, 150, 0, 26)
    searchContainer.Position = UDim2.new(1, -220, 0.5, -13)
    searchContainer.BackgroundColor3 = theme.Background
    searchContainer.BorderSizePixel = 0
    searchContainer.Parent = titleBar
    
    local searchCorner = Instance.new("UICorner")
    searchCorner.CornerRadius = UDim.new(0, 6)
    searchCorner.Parent = searchContainer
    
    local searchStroke = Instance.new("UIStroke")
    searchStroke.Color = theme.Accent
    searchStroke.Thickness = 1
    searchStroke.Parent = searchContainer
    
    local searchIcon = Instance.new("ImageLabel")
    searchIcon.Name = "SearchIcon"
    searchIcon.Size = UDim2.new(0, 16, 0, 16)
    searchIcon.Position = UDim2.new(0, 8, 0.5, -8)
    searchIcon.BackgroundTransparency = 1
    searchIcon.Image = "rbxassetid://3605509925"
    searchIcon.ImageColor3 = theme.SubTextColor
    searchIcon.Parent = searchContainer
    
    local searchBox = Instance.new("TextBox")
    searchBox.Name = "SearchBox"
    searchBox.Size = UDim2.new(1, -35, 1, 0)
    searchBox.Position = UDim2.new(0, 30, 0, 0)
    searchBox.BackgroundTransparency = 1
    searchBox.Text = ""
    searchBox.PlaceholderText = "Search..."
    searchBox.TextColor3 = theme.TextColor
    searchBox.PlaceholderColor3 = theme.SubTextColor
    searchBox.Font = Enum.Font.Gotham
    searchBox.TextSize = 14
    searchBox.TextXAlignment = Enum.TextXAlignment.Left
    searchBox.ClearTextOnFocus = false
    searchBox.Parent = searchContainer
    window.SearchBox = searchBox
    
    -- Minimize button
    local minimizeButton = Instance.new("ImageButton")
    minimizeButton.Name = "MinimizeButton"
    minimizeButton.Size = UDim2.new(0, 16, 0, 16)
    minimizeButton.Position = UDim2.new(1, -60, 0.5, -8)
    minimizeButton.BackgroundTransparency = 1
    minimizeButton.Image = "rbxassetid://6026568240"
    minimizeButton.ImageColor3 = theme.TextColor
    minimizeButton.Parent = titleBar
    window.MinimizeButton = minimizeButton
    
    -- Close button
    local closeButton = Instance.new("ImageButton")
    closeButton.Name = "CloseButton"
    closeButton.Size = UDim2.new(0, 16, 0, 16)
    closeButton.Position = UDim2.new(1, -30, 0.5, -8)
    closeButton.BackgroundTransparency = 1
    closeButton.Image = "rbxassetid://6031094678"
    closeButton.ImageColor3 = theme.TextColor
    closeButton.Parent = titleBar
    window.CloseButton = closeButton
    
    -- Content container
    local contentFrame = Instance.new("Frame")
    contentFrame.Name = "ContentFrame"
    contentFrame.Size = UDim2.new(1, 0, 1, -40)
    contentFrame.Position = UDim2.new(0, 0, 0, 40)
    contentFrame.BackgroundTransparency = 1
    contentFrame.ClipsDescendants = true
    contentFrame.Parent = mainFrame
    window.ContentFrame = contentFrame
    
    -- Tab container
    local tabContainer = Instance.new("Frame")
    tabContainer.Name = "TabContainer"
    tabContainer.Size = UDim2.new(0, 140, 1, 0)
    tabContainer.BackgroundColor3 = theme.DarkAccent
    tabContainer.BorderSizePixel = 0
    tabContainer.Parent = contentFrame
    window.TabContainer = tabContainer
    
    local tabContainerCorner = Instance.new("UICorner")
    tabContainerCorner.CornerRadius = UDim.new(0, 8)
    tabContainerCorner.Parent = tabContainer
    
    -- Fix the right corners of tab container
    local rightFix = Instance.new("Frame")
    rightFix.Name = "RightFix"
    rightFix.Size = UDim2.new(0, 10, 1, 0)
    rightFix.Position = UDim2.new(1, -10, 0, 0)
    rightFix.BackgroundColor3 = theme.DarkAccent
    rightFix.BorderSizePixel = 0
    rightFix.ZIndex = 0
    rightFix.Parent = tabContainer
    
    -- Tab scroll frame
    local tabScrollFrame = Instance.new("ScrollingFrame")
    tabScrollFrame.Name = "TabScrollFrame"
    tabScrollFrame.Size = UDim2.new(1, 0, 1, -10)
    tabScrollFrame.Position = UDim2.new(0, 0, 0, 5)
    tabScrollFrame.BackgroundTransparency = 1
    tabScrollFrame.BorderSizePixel = 0
    tabScrollFrame.ScrollBarThickness = 2
    tabScrollFrame.ScrollBarImageColor3 = theme.Accent
    tabScrollFrame.ScrollingDirection = Enum.ScrollingDirection.Y
    tabScrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
    tabScrollFrame.Parent = tabContainer
    window.TabScrollFrame = tabScrollFrame
    
    local tabListLayout = Instance.new("UIListLayout")
    tabListLayout.Name = "TabListLayout"
    tabListLayout.Padding = UDim.new(0, 5)
    tabListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    tabListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    tabListLayout.Parent = tabScrollFrame
    
    local tabPadding = Instance.new("UIPadding")
    tabPadding.PaddingTop = UDim.new(0, 5)
    tabPadding.PaddingBottom = UDim.new(0, 5)
    tabPadding.Parent = tabScrollFrame
    
    -- Section container
    local sectionContainer = Instance.new("Frame")
    sectionContainer.Name = "SectionContainer"
    sectionContainer.Size = UDim2.new(1, -150, 1, -10)
    sectionContainer.Position = UDim2.new(0, 145, 0, 5)
    sectionContainer.BackgroundTransparency = 1
    sectionContainer.BorderSizePixel = 0
    sectionContainer.Parent = contentFrame
    window.SectionContainer = sectionContainer
    
    local sectionScrollFrame = Instance.new("ScrollingFrame")
    sectionScrollFrame.Name = "SectionScrollFrame"
    sectionScrollFrame.Size = UDim2.new(1, 0, 1, 0)
    sectionScrollFrame.BackgroundTransparency = 1
    sectionScrollFrame.BorderSizePixel = 0
    sectionScrollFrame.ScrollBarThickness = 3
    sectionScrollFrame.ScrollBarImageColor3 = theme.Accent
    sectionScrollFrame.ScrollingDirection = Enum.ScrollingDirection.Y
    sectionScrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
    sectionScrollFrame.Parent = sectionContainer
    window.SectionScrollFrame = sectionScrollFrame
    
    local sectionListLayout = Instance.new("UIListLayout")
    sectionListLayout.Name = "SectionListLayout"
    sectionListLayout.Padding = UDim.new(0, 10)
    sectionListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    sectionListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    sectionListLayout.Parent = sectionScrollFrame
    
    local sectionPadding = Instance.new("UIPadding")
    sectionPadding.PaddingTop = UDim.new(0, 5)
    sectionPadding.PaddingBottom = UDim.new(0, 5)
    sectionPadding.PaddingLeft = UDim.new(0, 5)
    sectionPadding.PaddingRight = UDim.new(0, 5)
    sectionPadding.Parent = sectionScrollFrame
    
    -- Set up button hover effects
    setupImageButtonHover(minimizeButton, theme.TextColor, Color3.fromRGB(100, 200, 255))
    setupImageButtonHover(closeButton, theme.TextColor, Color3.fromRGB(255, 100, 100))
    
    -- Make window draggable
    makeDraggable(mainFrame, titleBar)
    
    -- Minimize functionality
    minimizeButton.MouseButton1Click:Connect(function()
        window.Minimized = not window.Minimized
        
        local targetSize
        if window.Minimized then
            targetSize = UDim2.new(1, 0, 0, 0)
            minimizeButton.Image = "rbxassetid://6031090990" -- Maximize icon
        else
            targetSize = UDim2.new(1, 0, 1, -40)
            minimizeButton.Image = "rbxassetid://6026568240" -- Minimize icon
        end
        
        TweenService:Create(contentFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
            Size = targetSize
        }):Play()
        
        TweenService:Create(mainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
            Size = window.Minimized and UDim2.new(window.Size.X.Scale, window.Size.X.Offset, 0, 40) or window.Size
        }):Play()
    end)
    
    -- Close functionality
    closeButton.MouseButton1Click:Connect(function()
        screenGui:Destroy()
    end)
    
    -- Search functionality
    searchBox.Changed:Connect(function(prop)
        if prop == "Text" then
            local searchText = searchBox.Text:lower()
            window:UpdateSearch(searchText)
        end
    end)
    
    -- Auto-update tab list layout
    tabListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        tabScrollFrame.CanvasSize = UDim2.new(0, 0, 0, tabListLayout.AbsoluteContentSize.Y + 10)
    end)
    
    -- Auto-update section list layout
    sectionListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        sectionScrollFrame.CanvasSize = UDim2.new(0, 0, 0, sectionListLayout.AbsoluteContentSize.Y + 10)
    end)
    
    return window
end

-- Create a notification
function RayUI:Notify(config)
    config = config or {}
    local title = config.Title or "Notification"
    local content = config.Content or ""
    local duration = config.Duration or 3
    local icon = config.Icon
    local color = config.Color or self.Theme.Accent
    
    local notification = Instance.new("Frame")
    notification.Name = "Notification"
    notification.Size = UDim2.new(0, 280, 0, 80)
    notification.Position = UDim2.new(1, 20, 1, -100)
    notification.BackgroundColor3 = self.Theme.Background
    notification.BorderSizePixel = 0
    notification.Parent = self.ScreenGui
    notification.AnchorPoint = Vector2.new(1, 1)
    
    local notifCorner = Instance.new("UICorner")
    notifCorner.CornerRadius = UDim.new(0, 8)
    notifCorner.Parent = notification
    
    local notifStroke = Instance.new("UIStroke")
    notifStroke.Color = color
    notifStroke.Thickness = 1.5
    notifStroke.Parent = notification
    
    -- Notification header
    local notifHeader = Instance.new("Frame")
    notifHeader.Name = "NotifHeader"
    notifHeader.Size = UDim2.new(1, 0, 0, 30)
    notifHeader.BackgroundColor3 = color
    notifHeader.BorderSizePixel = 0
    notifHeader.Parent = notification
    
    local headerCorner = Instance.new("UICorner")
    headerCorner.CornerRadius = UDim.new(0, 8)
    headerCorner.Parent = notifHeader
    
    -- Fix the bottom corners of header
    local headerBottomFix = Instance.new("Frame")
    headerBottomFix.Name = "BottomFix"
    headerBottomFix.Size = UDim2.new(1, 0, 0, 10)
    headerBottomFix.Position = UDim2.new(0, 0, 1, -10)
    headerBottomFix.BackgroundColor3 = color
    headerBottomFix.BorderSizePixel = 0
    headerBottomFix.ZIndex = 0
    headerBottomFix.Parent = notifHeader
    
    -- Icon (if provided)
    if icon then
        local iconAsset = getIcon(icon)
        if iconAsset then
            local iconImage = Instance.new("ImageLabel")
            iconImage.Name = "IconImage"
            iconImage.Size = UDim2.new(0, 20, 0, 20)
            iconImage.Position = UDim2.new(0, 10, 0.5, -10)
            iconImage.BackgroundTransparency = 1
            iconImage.Image = "rbxassetid://" .. iconAsset.id
            iconImage.ImageRectSize = iconAsset.imageRectSize
            iconImage.ImageRectOffset = iconAsset.imageRectOffset
            iconImage.ImageColor3 = self.Theme.TextColor
            iconImage.Parent = notifHeader
            
            -- Adjust title position
            local titleLabel = Instance.new("TextLabel")
            titleLabel.Name = "TitleLabel"
            titleLabel.Size = UDim2.new(1, -40, 1, 0)
            titleLabel.Position = UDim2.new(0, 35, 0, 0)
            titleLabel.BackgroundTransparency = 1
            titleLabel.Text = title
            titleLabel.TextColor3 = self.Theme.TextColor
            titleLabel.Font = Enum.Font.GothamBold
            titleLabel.TextSize = 14
            titleLabel.TextXAlignment = Enum.TextXAlignment.Left
            titleLabel.Parent = notifHeader
        else
            local titleLabel = Instance.new("TextLabel")
            titleLabel.Name = "TitleLabel"
            titleLabel.Size = UDim2.new(1, -20, 1, 0)
            titleLabel.Position = UDim2.new(0, 10, 0, 0)
            titleLabel.BackgroundTransparency = 1
            titleLabel.Text = title
            titleLabel.TextColor3 = self.Theme.TextColor
            titleLabel.Font = Enum.Font.GothamBold
            titleLabel.TextSize = 14
            titleLabel.TextXAlignment = Enum.TextXAlignment.Left
            titleLabel.Parent = notifHeader
        end
    else
        local titleLabel = Instance.new("TextLabel")
        titleLabel.Name = "TitleLabel"
        titleLabel.Size = UDim2.new(1, -20, 1, 0)
        titleLabel.Position = UDim2.new(0, 10, 0, 0)
        titleLabel.BackgroundTransparency = 1
        titleLabel.Text = title
        titleLabel.TextColor3 = self.Theme.TextColor
        titleLabel.Font = Enum.Font.GothamBold
        titleLabel.TextSize = 14
        titleLabel.TextXAlignment = Enum.TextXAlignment.Left
        titleLabel.Parent = notifHeader
    end
    
    -- Close button
    local closeBtn = Instance.new("ImageButton")
    closeBtn.Name = "CloseButton"
    closeBtn.Size = UDim2.new(0, 16, 0, 16)
    closeBtn.Position = UDim2.new(1, -25, 0.5, -8)
    closeBtn.BackgroundTransparency = 1
    closeBtn.Image = "rbxassetid://6031094678"
    closeBtn.ImageColor3 = self.Theme.TextColor
    closeBtn.Parent = notifHeader
    
    setupImageButtonHover(closeBtn, self.Theme.TextColor, Color3.fromRGB(255, 100, 100))
    
    -- Content
    local contentLabel = Instance.new("TextLabel")
    contentLabel.Name = "ContentLabel"
    contentLabel.Size = UDim2.new(1, -20, 0, 40)
    contentLabel.Position = UDim2.new(0, 10, 0, 35)
    contentLabel.BackgroundTransparency = 1
    contentLabel.Text = content
    contentLabel.TextColor3 = self.Theme.SubTextColor
    contentLabel.Font = Enum.Font.Gotham
    contentLabel.TextSize = 14
    contentLabel.TextWrapped = true
    contentLabel.TextXAlignment = Enum.TextXAlignment.Left
    contentLabel.TextYAlignment = Enum.TextYAlignment.Top
    contentLabel.Parent = notification
    
    -- Calculate text size and adjust notification height
    local textSize = TextService:GetTextSize(
        content,
        14,
        Enum.Font.Gotham,
        Vector2.new(notification.Size.X.Offset - 20, math.huge)
    )
    
    local newHeight = math.max(80, textSize.Y + 45)
    notification.Size = UDim2.new(0, 280, 0, newHeight)
    contentLabel.Size = UDim2.new(1, -20, 0, newHeight - 40)
    
    -- Animate in
    notification.Position = UDim2.new(1, 20, 1, -100)
    TweenService:Create(notification, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
        Position = UDim2.new(1, -20, 1, -100)
    }):Play()
    
    -- Close button functionality
    closeBtn.MouseButton1Click:Connect(function()
        TweenService:Create(notification, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {
            Position = UDim2.new(1, 20, 1, -100)
        }):Play()
        wait(0.5)
        notification:Destroy()
    end)
    
    -- Auto close after duration
    spawn(function()
        wait(duration)
        if notification and notification.Parent then
            TweenService:Create(notification, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {
                Position = UDim2.new(1, 20, 1, -100)
            }):Play()
            wait(0.5)
            if notification and notification.Parent then
                notification:Destroy()
            end
        end
    end)
    
    return notification
end

-- Create a new tab
function RayUI:CreateTab(config)
    config = config or {}
    local name = config.Name or "Tab"
    local icon = config.Icon
    
    local tab = {
        Name = name,
        Icon = icon,
        Window = self,
        Sections = {},
        Elements = {},
        Visible = false
    }
    
    -- Tab button
    local tabButton = Instance.new("TextButton")
    tabButton.Name = name .. "Button"
    tabButton.Size = UDim2.new(0, 120, 0, 36)
    tabButton.BackgroundColor3 = self.Theme.Background
    tabButton.BorderSizePixel = 0
    tabButton.Text = ""
    tabButton.AutoButtonColor = false
    tabButton.Parent = self.TabScrollFrame
    tab.Button = tabButton
    
    local tabCorner = Instance.new("UICorner")
    tabCorner.CornerRadius = UDim.new(0, 6)
    tabCorner.Parent = tabButton
    
    local tabStroke = Instance.new("UIStroke")
    tabStroke.Color = self.Theme.Accent
    tabStroke.Thickness = 1
    tabStroke.Transparency = 0.5
    tabStroke.Parent = tabButton
    
    -- Icon (if provided)
    if icon then
        local iconAsset = getIcon(icon)
        if iconAsset then
            local iconImage = Instance.new("ImageLabel")
            iconImage.Name = "IconImage"
            iconImage.Size = UDim2.new(0, 20, 0, 20)
            iconImage.Position = UDim2.new(0, 10, 0.5, -10)
            iconImage.BackgroundTransparency = 1
            iconImage.Image = "rbxassetid://" .. iconAsset.id
            iconImage.ImageRectSize = iconAsset.imageRectSize
            iconImage.ImageRectOffset = iconAsset.imageRectOffset
            iconImage.ImageColor3 = self.Theme.SubTextColor
            iconImage.Parent = tabButton
            tab.IconImage = iconImage
            
            -- Adjust label position
            local tabLabel = Instance.new("TextLabel")
            tabLabel.Name = "TabLabel"
            tabLabel.Size = UDim2.new(1, -40, 1, 0)
            tabLabel.Position = UDim2.new(0, 35, 0, 0)
            tabLabel.BackgroundTransparency = 1
            tabLabel.Text = name
            tabLabel.TextColor3 = self.Theme.SubTextColor
            tabLabel.Font = Enum.Font.GothamSemibold
            tabLabel.TextSize = 14
            tabLabel.TextXAlignment = Enum.TextXAlignment.Left
            tabLabel.Parent = tabButton
            tab.Label = tabLabel
        else
            local tabLabel = Instance.new("TextLabel")
            tabLabel.Name = "TabLabel"
            tabLabel.Size = UDim2.new(1, -20, 1, 0)
            tabLabel.Position = UDim2.new(0, 10, 0, 0)
            tabLabel.BackgroundTransparency = 1
            tabLabel.Text = name
            tabLabel.TextColor3 = self.Theme.SubTextColor
            tabLabel.Font = Enum.Font.GothamSemibold
            tabLabel.TextSize = 14
            tabLabel.TextXAlignment = Enum.TextXAlignment.Left
            tabLabel.Parent = tabButton
            tab.Label = tabLabel
        end
    else
        local tabLabel = Instance.new("TextLabel")
        tabLabel.Name = "TabLabel"
        tabLabel.Size = UDim2.new(1, -20, 1, 0)
        tabLabel.Position = UDim2.new(0, 10, 0, 0)
        tabLabel.BackgroundTransparency = 1
        tabLabel.Text = name
        tabLabel.TextColor3 = self.Theme.SubTextColor
        tabLabel.Font = Enum.Font.GothamSemibold
        tabLabel.TextSize = 14
        tabLabel.TextXAlignment = Enum.TextXAlignment.Left
        tabLabel.Parent = tabButton
        tab.Label = tabLabel
    end
    
    -- Tab container for sections
    local tabContainer = Instance.new("Frame")
    tabContainer.Name = name .. "Container"
    tabContainer.Size = UDim2.new(1, 0, 1, 0)
    tabContainer.BackgroundTransparency = 1
    tabContainer.Visible = false
    tabContainer.Parent = self.SectionScrollFrame
    tab.Container = tabContainer
    
    local tabListLayout = Instance.new("UIListLayout")
    tabListLayout.Name = "TabListLayout"
    tabListLayout.Padding = UDim.new(0, 10)
    tabListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    tabListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    tabListLayout.Parent = tabContainer
    
    local tabPadding = Instance.new("UIPadding")
    tabPadding.PaddingTop = UDim.new(0, 5)
    tabPadding.PaddingBottom = UDim.new(0, 5)
    tabPadding.PaddingLeft = UDim.new(0, 5)
    tabPadding.PaddingRight = UDim.new(0, 5)
    tabPadding.Parent = tabContainer
    
    -- Tab selection
    tabButton.MouseButton1Click:Connect(function()
        self:SelectTab(tab)
    end)
    
    -- Button hover effects
    tabButton.MouseEnter:Connect(function()
        if not tab.Visible then
            TweenService:Create(tabButton, TweenInfo.new(0.2), {
                BackgroundColor3 = self.Theme.DarkAccent
            }):Play()
            
            if tab.IconImage then
                TweenService:Create(tab.IconImage, TweenInfo.new(0.2), {
                    ImageColor3 = self.Theme.TextColor
                }):Play()
            end
            
            TweenService:Create(tab.Label, TweenInfo.new(0.2), {
                TextColor3 = self.Theme.TextColor
            }):Play()
        end
    end)
    
    tabButton.MouseLeave:Connect(function()
        if not tab.Visible then
            TweenService:Create(tabButton, TweenInfo.new(0.2), {
                BackgroundColor3 = self.Theme.Background
            }):Play()
            
            if tab.IconImage then
                TweenService:Create(tab.IconImage, TweenInfo.new(0.2), {
                    ImageColor3 = self.Theme.SubTextColor
                }):Play()
            end
            
            TweenService:Create(tab.Label, TweenInfo.new(0.2), {
                TextColor3 = self.Theme.SubTextColor
            }):Play()
        end
    end)
    
    -- Auto-update tab list layout
    tabListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        self.SectionScrollFrame.CanvasSize = UDim2.new(0, 0, 0, tabListLayout.AbsoluteContentSize.Y + 10)
    end)
    
    -- Add tab to window
    table.insert(self.Tabs, tab)
    
    -- Select this tab if it's the first one
    if #self.Tabs == 1 then
        self:SelectTab(tab)
    end
    
    -- Tab methods
    function tab:CreateSection(config)
        return self.Window:CreateSection(self, config)
    end
    
    return tab
end

-- Select a tab
function RayUI:SelectTab(tab)
    -- Deselect current tab
    if self.ActiveTab then
        self.ActiveTab.Visible = false
        self.ActiveTab.Container.Visible = false
        
        TweenService:Create(self.ActiveTab.Button, TweenInfo.new(0.2), {
            BackgroundColor3 = self.Theme.Background
        }):Play()
        
        if self.ActiveTab.IconImage then
            TweenService:Create(self.ActiveTab.IconImage, TweenInfo.new(0.2), {
                ImageColor3 = self.Theme.SubTextColor
            }):Play()
        end
        
        TweenService:Create(self.ActiveTab.Label, TweenInfo.new(0.2), {
            TextColor3 = self.Theme.SubTextColor
        }):Play()
    end
    
    -- Select new tab
    self.ActiveTab = tab
    tab.Visible = true
    tab.Container.Visible = true
    
    TweenService:Create(tab.Button, TweenInfo.new(0.2), {
        BackgroundColor3 = self.Theme.Accent
    }):Play()
    
    if tab.IconImage then
        TweenService:Create(tab.IconImage, TweenInfo.new(0.2), {
            ImageColor3 = self.Theme.TextColor
        }):Play()
    end
    
    TweenService:Create(tab.Label, TweenInfo.new(0.2), {
        TextColor3 = self.Theme.TextColor
    }):Play()
    
    -- Reset scroll position
    self.SectionScrollFrame.CanvasPosition = Vector2.new(0, 0)
end

-- Create a section
function RayUI:CreateSection(tab, config)
    config = config or {}
    local name = config.Name or "Section"
    
    local section = {
        Name = name,
        Tab = tab,
        Window = self,
        Elements = {}
    }
    
    -- Section frame
    local sectionFrame = Instance.new("Frame")
    sectionFrame.Name = name .. "Section"
    sectionFrame.Size = UDim2.new(1, -10, 0, 36) -- Initial size, will grow
    sectionFrame.BackgroundColor3 = self.Theme.Background
    sectionFrame.BorderSizePixel = 0
    sectionFrame.Parent = tab.Container
    section.Frame = sectionFrame
    
    local sectionCorner = Instance.new("UICorner")
    sectionCorner.CornerRadius = UDim.new(0, 8)
    sectionCorner.Parent = sectionFrame
    
    local sectionStroke = Instance.new("UIStroke")
    sectionStroke.Color = self.Theme.Accent
    sectionStroke.Thickness = 1
    sectionStroke.Transparency = 0.5
    sectionStroke.Parent = sectionFrame
    
    -- Section header
    local sectionHeader = Instance.new("Frame")
    sectionHeader.Name = "SectionHeader"
    sectionHeader.Size = UDim2.new(1, 0, 0, 36)
    sectionHeader.BackgroundColor3 = self.Theme.DarkAccent
    sectionHeader.BorderSizePixel = 0
    sectionHeader.Parent = sectionFrame
    
    local headerCorner = Instance.new("UICorner")
    headerCorner.CornerRadius = UDim.new(0, 8)
    headerCorner.Parent = sectionHeader
    
    -- Fix the bottom corners of header
    local headerBottomFix = Instance.new("Frame")
    headerBottomFix.Name = "BottomFix"
    headerBottomFix.Size = UDim2.new(1, 0, 0, 10)
    headerBottomFix.Position = UDim2.new(0, 0, 1, -10)
    headerBottomFix.BackgroundColor3 = self.Theme.DarkAccent
    headerBottomFix.BorderSizePixel = 0
    headerBottomFix.ZIndex = 0
    headerBottomFix.Parent = sectionHeader
    
    -- Section title
    local sectionTitle = Instance.new("TextLabel")
    sectionTitle.Name = "SectionTitle"
    sectionTitle.Size = UDim2.new(1, -20, 1, 0)
    sectionTitle.Position = UDim2.new(0, 10, 0, 0)
    sectionTitle.BackgroundTransparency = 1
    sectionTitle.Text = name
    sectionTitle.TextColor3 = self.Theme.TextColor
    sectionTitle.Font = Enum.Font.GothamBold
    sectionTitle.TextSize = 14
    sectionTitle.TextXAlignment = Enum.TextXAlignment.Left
    sectionTitle.Parent = sectionHeader
    
    -- Section content
    local sectionContent = Instance.new("Frame")
    sectionContent.Name = "SectionContent"
    sectionContent.Size = UDim2.new(1, 0, 1, -36)
    sectionContent.Position = UDim2.new(0, 0, 0, 36)
    sectionContent.BackgroundTransparency = 1
    sectionContent.Parent = sectionFrame
    section.Content = sectionContent
    
    local contentListLayout = Instance.new("UIListLayout")
    contentListLayout.Name = "ContentListLayout"
    contentListLayout.Padding = UDim.new(0, 8)
    contentListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    contentListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    contentListLayout.Parent = sectionContent
    
    local contentPadding = Instance.new("UIPadding")
    contentPadding.PaddingTop = UDim.new(0, 8)
    contentPadding.PaddingBottom = UDim.new(0, 8)
    contentPadding.PaddingLeft = UDim.new(0, 10)
    contentPadding.PaddingRight = UDim.new(0, 10)
    contentPadding.Parent = sectionContent
    
    -- Auto-update section size based on content
    contentListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        sectionFrame.Size = UDim2.new(1, -10, 0, contentListLayout.AbsoluteContentSize.Y + 52)
    end)
    
    -- Add section to tab
    table.insert(tab.Sections, section)
    
    -- Section methods
    function section:AddButton(config)
        return self.Window:CreateButton(self, config)
    end
    
    function section:AddToggle(config)
        return self.Window:CreateToggle(self, config)
    end
    
    function section:AddSlider(config)
        return self.Window:CreateSlider(self, config)
    end
    
    function section:AddDropdown(config)
        return self.Window:CreateDropdown(self, config)
    end
    
    function section:AddLabel(config)
        return self.Window:CreateLabel(self, config)
    end
    
    function section:AddParagraph(config)
        return self.Window:CreateParagraph(self, config)
    end
    
    function section:AddDivider(config)
        return self.Window:CreateDivider(self, config)
    end
    
    function section:AddActionButton(config)
        return self.Window:CreateActionButton(self, config)
    end
    
    return section
end

-- Create a button
function RayUI:CreateButton(section, config)
    config = config or {}
    local name = config.Name or "Button"
    local description = config.Description
    local callback = config.Callback or function() end
    
    local button = {
        Name = name,
        Description = description,
        Section = section,
        Window = self,
        Type = "Button"
    }
    
    -- Button container
    local buttonContainer = Instance.new("Frame")
    buttonContainer.Name = name .. "Container"
    buttonContainer.Size = UDim2.new(1, 0, 0, description and 60 or 36)
    buttonContainer.BackgroundTransparency = 1
    buttonContainer.Parent = section.Content
    button.Container = buttonContainer
    
    -- Button
    local buttonFrame = Instance.new("TextButton")
    buttonFrame.Name = name .. "Button"
    buttonFrame.Size = UDim2.new(1, 0, 0, 36)
    buttonFrame.BackgroundColor3 = self.Theme.DarkAccent
    buttonFrame.Text = ""
    buttonFrame.AutoButtonColor = false
    buttonFrame.ClipsDescendants = true
    buttonFrame.Parent = buttonContainer
    button.Frame = buttonFrame
    
    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0, 6)
    buttonCorner.Parent = buttonFrame
    
    local buttonStroke = Instance.new("UIStroke")
    buttonStroke.Color = self.Theme.Accent
    buttonStroke.Thickness = 1
    buttonStroke.Transparency = 0.5
    buttonStroke.Parent = buttonFrame
    
    -- Button gradient
    local buttonGradient = Instance.new("UIGradient")
    buttonGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(200, 200, 200))
    })
    buttonGradient.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.94),
        NumberSequenceKeypoint.new(1, 0.96)
    })
    buttonGradient.Rotation = 90
    buttonGradient.Parent = buttonFrame
    
    -- Button text
    local buttonText = Instance.new("TextLabel")
    buttonText.Name = "ButtonText"
    buttonText.Size = UDim2.new(1, -20, 1, 0)
    buttonText.Position = UDim2.new(0, 10, 0, 0)
    buttonText.BackgroundTransparency = 1
    buttonText.Text = name
    buttonText.TextColor3 = self.Theme.TextColor
    buttonText.Font = Enum.Font.GothamSemibold
    buttonText.TextSize = 14
    buttonText.TextXAlignment = Enum.TextXAlignment.Left
    buttonText.Parent = buttonFrame
    
    -- Description (if provided)
    if description then
        local descriptionText = Instance.new("TextLabel")
        descriptionText.Name = "DescriptionText"
        descriptionText.Size = UDim2.new(1, -20, 0, 20)
        descriptionText.Position = UDim2.new(0, 10, 0, 38)
        descriptionText.BackgroundTransparency = 1
        descriptionText.Text = description
        descriptionText.TextColor3 = self.Theme.SubTextColor
        descriptionText.Font = Enum.Font.Gotham
        descriptionText.TextSize = 12
        descriptionText.TextWrapped = true
        descriptionText.TextXAlignment = Enum.TextXAlignment.Left
        descriptionText.Parent = buttonContainer
        button.Description = descriptionText
    end
    
    -- Button functionality
    buttonFrame.MouseButton1Click:Connect(function()
        createRipple(buttonFrame)
        callback()
    end)
    
    -- Button hover effects
    setupButtonHover(
        buttonFrame, 
        self.Theme.DarkAccent, 
        Color3.fromRGB(
            self.Theme.DarkAccent.R * 1.1, 
            self.Theme.DarkAccent.G * 1.1, 
            self.Theme.DarkAccent.B * 1.1
        ),
        Color3.fromRGB(
            self.Theme.DarkAccent.R * 0.9, 
            self.Theme.DarkAccent.G * 0.9, 
            self.Theme.DarkAccent.B * 0.9
        )
    )
    
    -- Add to section elements
    table.insert(section.Elements, button)
    
    return button
end

-- Create a toggle
function RayUI:CreateToggle(section, config)
    config = config or {}
    local name = config.Name or "Toggle"
    local description = config.Description
    local default = config.Default or false
    local callback = config.Callback or function() end
    
    local toggle = {
        Name = name,
        Description = description,
        Section = section,
        Window = self,
        Value = default,
        Type = "Toggle"
    }
    
    -- Toggle container
    local toggleContainer = Instance.new("Frame")
    toggleContainer.Name = name .. "Container"
    toggleContainer.Size = UDim2.new(1, 0, 0, description and 60 or 36)
    toggleContainer.BackgroundTransparency = 1
    toggleContainer.Parent = section.Content
    toggle.Container = toggleContainer
    
    -- Toggle frame
    local toggleFrame = Instance.new("Frame")
    toggleFrame.Name = name .. "Toggle"
    toggleFrame.Size = UDim2.new(1, 0, 0, 36)
    toggleFrame.BackgroundColor3 = self.Theme.DarkAccent
    toggleFrame.BorderSizePixel = 0
    toggleFrame.Parent = toggleContainer
    toggle.Frame = toggleFrame
    
    local toggleCorner = Instance.new("UICorner")
    toggleCorner.CornerRadius = UDim.new(0, 6)
    toggleCorner.Parent = toggleFrame
    
    local toggleStroke = Instance.new("UIStroke")
    toggleStroke.Color = self.Theme.Accent
    toggleStroke.Thickness = 1
    toggleStroke.Transparency = 0.5
    toggleStroke.Parent = toggleFrame
    
    -- Toggle text
    local toggleText = Instance.new("TextLabel")
    toggleText.Name = "ToggleText"
    toggleText.Size = UDim2.new(1, -60, 1, 0)
    toggleText.Position = UDim2.new(0, 10, 0, 0)
    toggleText.BackgroundTransparency = 1
    toggleText.Text = name
    toggleText.TextColor3 = self.Theme.TextColor
    toggleText.Font = Enum.Font.GothamSemibold
    toggleText.TextSize = 14
    toggleText.TextXAlignment = Enum.TextXAlignment.Left
    toggleText.Parent = toggleFrame
    
    -- Toggle indicator
    local toggleIndicator = Instance.new("Frame")
    toggleIndicator.Name = "ToggleIndicator"
    toggleIndicator.Size = UDim2.new(0, 40, 0, 20)
    toggleIndicator.Position = UDim2.new(1, -50, 0.5, -10)
    toggleIndicator.BackgroundColor3 = self.Theme.Background
    toggleIndicator.BorderSizePixel = 0
    toggleIndicator.Parent = toggleFrame
    toggle.Indicator = toggleIndicator
    
    local indicatorCorner = Instance.new("UICorner")
    indicatorCorner.CornerRadius = UDim.new(1, 0)
    indicatorCorner.Parent = toggleIndicator
    
    local indicatorStroke = Instance.new("UIStroke")
    indicatorStroke.Color = self.Theme.Accent
    indicatorStroke.Thickness = 1
    indicatorStroke.Transparency = 0.5
    indicatorStroke.Parent = toggleIndicator
    
    -- Toggle knob
    local toggleKnob = Instance.new("Frame")
    toggleKnob.Name = "ToggleKnob"
    toggleKnob.Size = UDim2.new(0, 16, 0, 16)
    toggleKnob.Position = UDim2.new(0, 2, 0.5, -8)
    toggleKnob.BackgroundColor3 = self.Theme.SubTextColor
    toggleKnob.BorderSizePixel = 0
    toggleKnob.Parent = toggleIndicator
    toggle.Knob = toggleKnob
    
    local knobCorner = Instance.new("UICorner")
    knobCorner.CornerRadius = UDim.new(1, 0)
    knobCorner.Parent = toggleKnob
    
    -- Description (if provided)
    if description then
        local descriptionText = Instance.new("TextLabel")
        descriptionText.Name = "DescriptionText"
        descriptionText.Size = UDim2.new(1, -20, 0, 20)
        descriptionText.Position = UDim2.new(0, 10, 0, 38)
        descriptionText.BackgroundTransparency = 1
        descriptionText.Text = description
        descriptionText.TextColor3 = self.Theme.SubTextColor
        descriptionText.Font = Enum.Font.Gotham
        descriptionText.TextSize = 12
        descriptionText.TextWrapped = true
        descriptionText.TextXAlignment = Enum.TextXAlignment.Left
        descriptionText.Parent = toggleContainer
        toggle.Description = descriptionText
    end
    
    -- Set initial state
    function toggle:Set(value)
        self.Value = value
        
        if value then
            TweenService:Create(toggleIndicator, TweenInfo.new(0.2), {
                BackgroundColor3 = self.Window.Theme.Accent
            }):Play()
            
            TweenService:Create(toggleKnob, TweenInfo.new(0.2), {
                Position = UDim2.new(0, 22, 0.5, -8),
                BackgroundColor3 = self.Window.Theme.TextColor
            }):Play()
        else
            TweenService:Create(toggleIndicator, TweenInfo.new(0.2), {
                BackgroundColor3 = self.Window.Theme.Background
            }):Play()
            
            TweenService:Create(toggleKnob, TweenInfo.new(0.2), {
                Position = UDim2.new(0, 2, 0.5, -8),
                BackgroundColor3 = self.Window.Theme.SubTextColor
            }):Play()
        end
        
        callback(value)
    end
    
    -- Toggle functionality
    toggleFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            toggle:Set(not toggle.Value)
        end
    end)
    
    -- Set default value
    toggle:Set(default)
    
    -- Add to section elements
    table.insert(section.Elements, toggle)
    
    return toggle
end

-- Create a slider
function RayUI:CreateSlider(section, config)
    config = config or {}
    local name = config.Name or "Slider"
    local description = config.Description
    local min = config.Min or 0
    local max = config.Max or 100
    local default = math.clamp(config.Default or min, min, max)
    local increment = config.Increment or 1
    local suffix = config.Suffix or ""
    local callback = config.Callback or function() end
    
    local slider = {
        Name = name,
        Description = description,
        Section = section,
        Window = self,
        Value = default,
        Min = min,
        Max = max,
        Increment = increment,
        Suffix = suffix,
        Type = "Slider"
    }
    
    -- Slider container
    local sliderContainer = Instance.new("Frame")
    sliderContainer.Name = name .. "Container"
    sliderContainer.Size = UDim2.new(1, 0, 0, description and 80 or 56)
    sliderContainer.BackgroundTransparency = 1
    sliderContainer.Parent = section.Content
    slider.Container = sliderContainer
    
    -- Slider frame
    local sliderFrame = Instance.new("Frame")
    sliderFrame.Name = name .. "Slider"
    sliderFrame.Size = UDim2.new(1, 0, 0, 36)
    sliderFrame.BackgroundColor3 = self.Theme.DarkAccent
    sliderFrame.BorderSizePixel = 0
    sliderFrame.Parent = sliderContainer
    slider.Frame = sliderFrame
    
    local sliderCorner = Instance.new("UICorner")
    sliderCorner.CornerRadius = UDim.new(0, 6)
    sliderCorner.Parent = sliderFrame
    
    local sliderStroke = Instance.new("UIStroke")
    sliderStroke.Color = self.Theme.Accent
    sliderStroke.Thickness = 1
    sliderStroke.Transparency = 0.5
    sliderStroke.Parent = sliderFrame
    
    -- Slider text
    local sliderText = Instance.new("TextLabel")
    sliderText.Name = "SliderText"
    sliderText.Size = UDim2.new(1, -20, 1, 0)
    sliderText.Position = UDim2.new(0, 10, 0, 0)
    sliderText.BackgroundTransparency = 1
    sliderText.Text = name
    sliderText.TextColor3 = self.Theme.TextColor
    sliderText.Font = Enum.Font.GothamSemibold
    sliderText.TextSize = 14
    sliderText.TextXAlignment = Enum.TextXAlignment.Left
    sliderText.Parent = sliderFrame
    
    -- Slider value
    local sliderValue = Instance.new("TextLabel")
    sliderValue.Name = "SliderValue"
    sliderValue.Size = UDim2.new(0, 60, 1, 0)
    sliderValue.Position = UDim2.new(1, -70, 0, 0)
    sliderValue.BackgroundTransparency = 1
    sliderValue.Text = tostring(default) .. suffix
    sliderValue.TextColor3 = self.Theme.TextColor
    sliderValue.Font = Enum.Font.GothamSemibold
    sliderValue.TextSize = 14
    sliderValue.TextXAlignment = Enum.TextXAlignment.Right
    sliderValue.Parent = sliderFrame
    slider.ValueLabel = sliderValue
    
    -- Slider bar container
    local sliderBarContainer = Instance.new("Frame")
    sliderBarContainer.Name = "SliderBarContainer"
    sliderBarContainer.Size = UDim2.new(1, -20, 0, 10)
    sliderBarContainer.Position = UDim2.new(0, 10, 0, 40)
    sliderBarContainer.BackgroundColor3 = self.Theme.Background
    sliderBarContainer.BorderSizePixel = 0
    sliderBarContainer.Parent = sliderContainer
    
    local barContainerCorner = Instance.new("UICorner")
    barContainerCorner.CornerRadius = UDim.new(1, 0)
    barContainerCorner.Parent = sliderBarContainer
    
    local barContainerStroke = Instance.new("UIStroke")
    barContainerStroke.Color = self.Theme.Accent
    barContainerStroke.Thickness = 1
    barContainerStroke.Transparency = 0.5
    barContainerStroke.Parent = sliderBarContainer
    
    -- Slider fill
    local sliderFill = Instance.new("Frame")
    sliderFill.Name = "SliderFill"
    sliderFill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
    sliderFill.BackgroundColor3 = self.Theme.Accent
    sliderFill.BorderSizePixel = 0
    sliderFill.Parent = sliderBarContainer
    slider.Fill = sliderFill
    
    local fillCorner = Instance.new("UICorner")
    fillCorner.CornerRadius = UDim.new(1, 0)
    fillCorner.Parent = sliderFill
    
    -- Slider knob
    local sliderKnob = Instance.new("Frame")
    sliderKnob.Name = "SliderKnob"
    sliderKnob.Size = UDim2.new(0, 16, 0, 16)
    sliderKnob.Position = UDim2.new((default - min) / (max - min), 0, 0.5, -8)
    sliderKnob.AnchorPoint = Vector2.new(0.5, 0)
    sliderKnob.BackgroundColor3 = self.Theme.TextColor
    sliderKnob.BorderSizePixel = 0
    sliderKnob.Parent = sliderBarContainer
    slider.Knob = sliderKnob
    
    local knobCorner = Instance.new("UICorner")
    knobCorner.CornerRadius = UDim.new(1, 0)
    knobCorner.Parent = sliderKnob
    
    -- Description (if provided)
    if description then
        local descriptionText = Instance.new("TextLabel")
        descriptionText.Name = "DescriptionText"
        descriptionText.Size = UDim2.new(1, -20, 0, 20)
        descriptionText.Position = UDim2.new(0, 10, 0, 58)
        descriptionText.BackgroundTransparency = 1
        descriptionText.Text = description
        descriptionText.TextColor3 = self.Theme.SubTextColor
        descriptionText.Font = Enum.Font.Gotham
        descriptionText.TextSize = 12
        descriptionText.TextWrapped = true
        descriptionText.TextXAlignment = Enum.TextXAlignment.Left
        descriptionText.Parent = sliderContainer
        slider.Description = descriptionText
    end
    
    -- Slider functionality
    local function updateSlider(input)
        local sizeX = math.clamp((input.Position.X - sliderBarContainer.AbsolutePosition.X) / sliderBarContainer.AbsoluteSize.X, 0, 1)
        local value = min + ((max - min) * sizeX)
        
        -- Apply increment
        value = min + (math.floor((value - min) / increment + 0.5) * increment)
        value = math.clamp(value, min, max)
        
        -- Update slider
        slider:Set(value)
    end
    
    sliderBarContainer.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            updateSlider(input)
            
            local dragging = true
            local connection
            
            connection = UserInputService.InputChanged:Connect(function(newInput)
                if dragging and newInput.UserInputType == Enum.UserInputType.MouseMovement then
                    updateSlider(newInput)
                end
            end)
            
            UserInputService.InputEnded:Connect(function(newInput)
                if newInput.UserInputType == Enum.UserInputType.MouseButton1 then
                    dragging = false
                    if connection then
                        connection:Disconnect()
                    end
                end
            end)
        end
    end)
    
    -- Set slider value
    function slider:Set(value)
        value = math.clamp(value, self.Min, self.Max)
        self.Value = value
        
        local percent = (value - self.Min) / (self.Max - self.Min)
        
        TweenService:Create(self.Fill, TweenInfo.new(0.1), {
            Size = UDim2.new(percent, 0, 1, 0)
        }):Play()
        
        TweenService:Create(self.Knob, TweenInfo.new(0.1), {
            Position = UDim2.new(percent, 0, 0.5, -8)
        }):Play()
        
        self.ValueLabel.Text = tostring(math.floor(value * 100) / 100) .. self.Suffix
        
        callback(value)
    end
    
    -- Add to section elements
    table.insert(section.Elements, slider)
    
    return slider
end

-- Create a dropdown
function RayUI:CreateDropdown(section, config)
    config = config or {}
    local name = config.Name or "Dropdown"
    local description = config.Description
    local options = config.Options or {}
    local default = config.Default
    local callback = config.Callback or function() end
    local multiSelect = config.MultiSelect or false
    
    local dropdown = {
        Name = name,
        Description = description,
        Section = section,
        Window = self,
        Options = options,
        Value = multiSelect and {} or nil,
        MultiSelect = multiSelect,
        Open = false,
        Type = "Dropdown"
    }
    
    -- Dropdown container
    local dropdownContainer = Instance.new("Frame")
    dropdownContainer.Name = name .. "Container"
    dropdownContainer.Size = UDim2.new(1, 0, 0, description and 80 or 56)
    dropdownContainer.BackgroundTransparency = 1
    dropdownContainer.ClipsDescendants = true
    dropdownContainer.Parent = section.Content
    dropdown.Container = dropdownContainer
    
    -- Dropdown frame
    local dropdownFrame = Instance.new("Frame")
    dropdownFrame.Name = name .. "Dropdown"
    dropdownFrame.Size = UDim2.new(1, 0, 0, 36)
    dropdownFrame.BackgroundColor3 = self.Theme.DarkAccent
    dropdownFrame.BorderSizePixel = 0
    dropdownFrame.Parent = dropdownContainer
    dropdown.Frame = dropdownFrame
    
    local dropdownCorner = Instance.new("UICorner")
    dropdownCorner.CornerRadius = UDim.new(0, 6)
    dropdownCorner.Parent = dropdownFrame
    
    local dropdownStroke = Instance.new("UIStroke")
    dropdownStroke.Color = self.Theme.Accent
    dropdownStroke.Thickness = 1
    dropdownStroke.Transparency = 0.5
    dropdownStroke.Parent = dropdownFrame
    
    -- Dropdown text
    local dropdownText = Instance.new("TextLabel")
    dropdownText.Name = "DropdownText"
    dropdownText.Size = UDim2.new(1, -40, 1, 0)
    dropdownText.Position = UDim2.new(0, 10, 0, 0)
    dropdownText.BackgroundTransparency = 1
    dropdownText.Text = name
    dropdownText.TextColor3 = self.Theme.TextColor
    dropdownText.Font = Enum.Font.GothamSemibold
    dropdownText.TextSize = 14
    dropdownText.TextXAlignment = Enum.TextXAlignment.Left
    dropdownText.Parent = dropdownFrame
    
    -- Dropdown arrow
    local dropdownArrow = Instance.new("ImageLabel")
    dropdownArrow.Name = "DropdownArrow"
    dropdownArrow.Size = UDim2.new(0, 16, 0, 16)
    dropdownArrow.Position = UDim2.new(1, -26, 0.5, -8)
    dropdownArrow.BackgroundTransparency = 1
    dropdownArrow.Image = "rbxassetid://6031091004"
    dropdownArrow.ImageColor3 = self.Theme.TextColor
    dropdownArrow.Parent = dropdownFrame
    dropdown.Arrow = dropdownArrow
    
    -- Selected value
    local selectedValue = Instance.new("TextLabel")
    selectedValue.Name = "SelectedValue"
    selectedValue.Size = UDim2.new(1, -20, 0, 20)
    selectedValue.Position = UDim2.new(0, 10, 0, 40)
    selectedValue.BackgroundTransparency = 1
    selectedValue.Text = "None"
    selectedValue.TextColor3 = self.Theme.SubTextColor
    selectedValue.Font = Enum.Font.Gotham
    selectedValue.TextSize = 12
    selectedValue.TextXAlignment = Enum.TextXAlignment.Left
    selectedValue.Parent = dropdownContainer
    dropdown.SelectedLabel = selectedValue
    
    -- Description (if provided)
    if description then
        local descriptionText = Instance.new("TextLabel")
        descriptionText.Name = "DescriptionText"
        descriptionText.Size = UDim2.new(1, -20, 0, 20)
        descriptionText.Position = UDim2.new(0, 10, 0, 60)
        descriptionText.BackgroundTransparency = 1
        descriptionText.Text = description
        descriptionText.TextColor3 = self.Theme.SubTextColor
        descriptionText.Font = Enum.Font.Gotham
        descriptionText.TextSize = 12
        descriptionText.TextWrapped = true
        descriptionText.TextXAlignment = Enum.TextXAlignment.Left
        descriptionText.Parent = dropdownContainer
        dropdown.Description = descriptionText
        
        -- Adjust container size
        dropdownContainer.Size = UDim2.new(1, 0, 0, 80)
    end
    
    -- Options container
    local optionsContainer = Instance.new("Frame")
    optionsContainer.Name = "OptionsContainer"
    optionsContainer.Size = UDim2.new(1, 0, 0, 0) -- Will be resized based on options
    optionsContainer.Position = UDim2.new(0, 0, 0, description and 80 or 60)
    optionsContainer.BackgroundColor3 = self.Theme.Background
    optionsContainer.BorderSizePixel = 0
    optionsContainer.Visible = false
    optionsContainer.Parent = dropdownContainer
    dropdown.OptionsFrame = optionsContainer
    
    local optionsCorner = Instance.new("UICorner")
    optionsCorner.CornerRadius = UDim.new(0, 6)
    optionsCorner.Parent = optionsContainer
    
    local optionsStroke = Instance.new("UIStroke")
    optionsStroke.Color = self.Theme.Accent
    optionsStroke.Thickness = 1
    optionsStroke.Transparency = 0.5
    optionsStroke.Parent = optionsContainer
    
    -- Search box
    local searchBox = Instance.new("TextBox")
    searchBox.Name = "SearchBox"
    searchBox.Size = UDim2.new(1, -20, 0, 30)
    searchBox.Position = UDim2.new(0, 10, 0, 5)
    searchBox.BackgroundColor3 = self.Theme.DarkAccent
    searchBox.BorderSizePixel = 0
    searchBox.Text = ""
    searchBox.PlaceholderText = "Search..."
    searchBox.TextColor3 = self.Theme.TextColor
    searchBox.PlaceholderColor3 = self.Theme.SubTextColor
    searchBox.Font = Enum.Font.Gotham
    searchBox.TextSize = 14
    searchBox.TextXAlignment = Enum.TextXAlignment.Left
    searchBox.ClearTextOnFocus = false
    searchBox.Parent = optionsContainer
    dropdown.SearchBox = searchBox
    
    local searchCorner = Instance.new("UICorner")
    searchCorner.CornerRadius = UDim.new(0, 6)
    searchCorner.Parent = searchBox
    
    -- Options scroll frame
    local optionsScrollFrame = Instance.new("ScrollingFrame")
    optionsScrollFrame.Name = "OptionsScrollFrame"
    optionsScrollFrame.Size = UDim2.new(1, -10, 1, -45)
    optionsScrollFrame.Position = UDim2.new(0, 5, 0, 40)
    optionsScrollFrame.BackgroundTransparency = 1
    optionsScrollFrame.BorderSizePixel = 0
    optionsScrollFrame.ScrollBarThickness = 3
    optionsScrollFrame.ScrollBarImageColor3 = self.Theme.Accent
    optionsScrollFrame.ScrollingDirection = Enum.ScrollingDirection.Y
    optionsScrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
    optionsScrollFrame.Parent = optionsContainer
    dropdown.OptionsScrollFrame = optionsScrollFrame
    
    local optionsListLayout = Instance.new("UIListLayout")
    optionsListLayout.Name = "OptionsListLayout"
    optionsListLayout.Padding = UDim.new(0, 5)
    optionsListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    optionsListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    optionsListLayout.Parent = optionsScrollFrame
    
    local optionsPadding = Instance.new("UIPadding")
    optionsPadding.PaddingTop = UDim.new(0, 5)
    optionsPadding.PaddingBottom = UDim.new(0, 5)
    optionsPadding.Parent = optionsScrollFrame
    
    -- Create option buttons
    local function createOptions()
        -- Clear existing options
        for _, child in pairs(optionsScrollFrame:GetChildren()) do
            if child:IsA("TextButton") then
                child:Destroy()
            end
        end
        
        local searchText = searchBox.Text:lower()
        local visibleOptions = {}
        
        -- Filter options based on search
        for _, option in pairs(dropdown.Options) do
            if searchText == "" or string.find(string.lower(tostring(option)), searchText, 1, true) then
                table.insert(visibleOptions, option)
            end
        end
        
        -- Create option buttons
        for i, option in ipairs(visibleOptions) do
            local optionButton = Instance.new("TextButton")
            optionButton.Name = "Option_" .. tostring(option)
            optionButton.Size = UDim2.new(1, -10, 0, 30)
            optionButton.BackgroundColor3 = self.Theme.DarkAccent
            optionButton.BorderSizePixel = 0
            optionButton.Text = tostring(option)
            optionButton.TextColor3 = self.Theme.TextColor
            optionButton.Font = Enum.Font.Gotham
            optionButton.TextSize = 14
            optionButton.Parent = optionsScrollFrame
            
            local optionCorner = Instance.new("UICorner")
            optionCorner.CornerRadius = UDim.new(0, 6)
            optionCorner.Parent = optionButton
            
            -- Check if option is selected
            if dropdown.MultiSelect then
                if table.find(dropdown.Value, option) then
                    optionButton.BackgroundColor3 = self.Theme.Accent
                end
            else
                if dropdown.Value == option then
                    optionButton.BackgroundColor3 = self.Theme.Accent
                end
            end
            
            -- Option button functionality
            optionButton.MouseButton1Click:Connect(function()
                if dropdown.MultiSelect then
                    -- Toggle selection for multi-select
                    local found = table.find(dropdown.Value, option)
                    if found then
                        table.remove(dropdown.Value, found)
                        optionButton.BackgroundColor3 = self.Theme.DarkAccent
                    else
                        table.insert(dropdown.Value, option)
                        optionButton.BackgroundColor3 = self.Theme.Accent
                    end
                    
                    -- Update selected text
                    if #dropdown.Value == 0 then
                        dropdown.SelectedLabel.Text = "None"
                    elseif #dropdown.Value == 1 then
                        dropdown.SelectedLabel.Text = tostring(dropdown.Value[1])
                    else
                        dropdown.SelectedLabel.Text = tostring(#dropdown.Value) .. " selected"
                    end
                    
                    callback(dropdown.Value)
                else
                    -- Single selection
                    dropdown.Value = option
                    dropdown.SelectedLabel.Text = tostring(option)
                    
                    -- Update all option buttons
                    for _, child in pairs(optionsScrollFrame:GetChildren()) do
                        if child:IsA("TextButton") then
                            child.BackgroundColor3 = child.Name == "Option_" .. tostring(option) 
                                and self.Theme.Accent 
                                or self.Theme.DarkAccent
                        end
                    end
                    
                    callback(option)
                    dropdown:Toggle() -- Close dropdown after selection for single select
                end
            end)
            
            -- Button hover effects
            setupButtonHover(
                optionButton, 
                optionButton.BackgroundColor3, 
                Color3.fromRGB(
                    optionButton.BackgroundColor3.R * 1.1, 
                    optionButton.BackgroundColor3.G * 1.1, 
                    optionButton.BackgroundColor3.B * 1.1
                )
            )
        end
        
        -- Update canvas size
        optionsScrollFrame.CanvasSize = UDim2.new(0, 0, 0, optionsListLayout.AbsoluteContentSize.Y + 10)
    end
    
    -- Toggle dropdown
    function dropdown:Toggle()
        self.Open = not self.Open
        
        -- Rotate arrow
        TweenService:Create(self.Arrow, TweenInfo.new(0.2), {
            Rotation = self.Open and 180 or 0
        }):Play()
        
        -- Resize container and show options
        if self.Open then
            self.OptionsFrame.Visible = true
            
            -- Calculate height based on number of options (max 200)
            local optionsHeight = math.min(200, #self.Options * 35 + 50)
            
            -- Resize container
            TweenService:Create(self.Container, TweenInfo.new(0.2), {
                Size = UDim2.new(1, 0, 0, (self.Description and 80 or 60) + optionsHeight)
            }):Play()
            
            -- Resize options container
            TweenService:Create(self.OptionsFrame, TweenInfo.new(0.2), {
                Size = UDim2.new(1, 0, 0, optionsHeight)
            }):Play()
            
            -- Focus search box
            self.SearchBox:CaptureFocus()
        else
            -- Resize container
            TweenService:Create(self.Container, TweenInfo.new(0.2), {
                Size = UDim2.new(1, 0, 0, self.Description and 80 or 60)
            }):Play()
            
            -- Resize options container
            TweenService:Create(self.OptionsFrame, TweenInfo.new(0.2), {
                Size = UDim2.new(1, 0, 0, 0)
            }):Play()
            
            -- Hide options after animation
            delay(0.2, function()
                if not self.Open then
                    self.OptionsFrame.Visible = false
                end
            end)
        end
    end
    
    -- Set dropdown value
    function dropdown:Set(value)
        if self.MultiSelect then
            -- Ensure value is a table
            if type(value) ~= "table" then
                value = {value}
            end
            
            self.Value = value
            
            -- Update selected text
            if #self.Value == 0 then
                self.SelectedLabel.Text = "None"
            elseif #self.Value == 1 then
                self.SelectedLabel.Text = tostring(self.Value[1])
            else
                self.SelectedLabel.Text = tostring(#self.Value) .. " selected"
            end
        else
            self.Value = value
            self.SelectedLabel.Text = tostring(value)
        end
        
        -- Recreate options to update visuals
        createOptions()
        
        callback(self.Value)
    end
    
    -- Dropdown functionality
    dropdownFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dropdown:Toggle()
        end
    end)
    
    -- Search functionality
    searchBox:GetPropertyChangedSignal("Text"):Connect(function()
        createOptions()
    end)
    
    -- Close dropdown when clicking outside
    UserInputService.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            local mousePos = UserInputService:GetMouseLocation()
            local inBounds = mousePos.X >= dropdownContainer.AbsolutePosition.X and
                             mousePos.X <= dropdownContainer.AbsolutePosition.X + dropdownContainer.AbsoluteSize.X and
                             mousePos.Y >= dropdownContainer.AbsolutePosition.Y and
                             mousePos.Y <= dropdownContainer.AbsolutePosition.Y + dropdownContainer.AbsoluteSize.Y
            
            if not inBounds and dropdown.Open then
                dropdown:Toggle()
            end
        end
    end)
    
    -- Create initial options
    createOptions()
    
    -- Set default value if provided
    if default ~= nil then
        dropdown:Set(default)
    end
    
    -- Add to section elements
    table.insert(section.Elements, dropdown)
    
    return dropdown
end

-- Create a label
function RayUI:CreateLabel(section, config)
    config = config or {}
    local text = config.Text or "Label"
    local alignment = config.Alignment or Enum.TextXAlignment.Left
    
    local label = {
        Text = text,
        Section = section,
        Window = self,
        Type = "Label"
    }
    
    -- Label container
    local labelContainer = Instance.new("Frame")
    labelContainer.Name = "LabelContainer"
    labelContainer.Size = UDim2.new(1, 0, 0, 30)
    labelContainer.BackgroundTransparency = 1
    labelContainer.Parent = section.Content
    label.Container = labelContainer
    
    -- Label text
    local labelText = Instance.new("TextLabel")
    labelText.Name = "LabelText"
    labelText.Size = UDim2.new(1, -20, 1, 0)
    labelText.Position = UDim2.new(0, 10, 0, 0)
    labelText.BackgroundTransparency = 1
    labelText.Text = text
    labelText.TextColor3 = self.Theme.TextColor
    labelText.Font = Enum.Font.GothamSemibold
    labelText.TextSize = 14
    labelText.TextWrapped = true
    labelText.TextXAlignment = alignment
    labelText.Parent = labelContainer
    label.Label = labelText
    
    -- Set text function
    function label:SetText(newText)
        self.Text = newText
        self.Label.Text = newText
    end
    
    -- Add to section elements
    table.insert(section.Elements, label)
    
    return label
end

-- Create a paragraph
function RayUI:CreateParagraph(section, config)
    config = config or {}
    local title = config.Title or "Title"
    local content = config.Content or "Content"
    
    local paragraph = {
        Title = title,
        Content = content,
        Section = section,
        Window = self,
        Type = "Paragraph"
    }
    
    -- Paragraph container
    local paragraphContainer = Instance.new("Frame")
    paragraphContainer.Name = "ParagraphContainer"
    paragraphContainer.Size = UDim2.new(1, 0, 0, 60) -- Initial size, will adjust
    paragraphContainer.BackgroundColor3 = self.Theme.DarkAccent
    paragraphContainer.BorderSizePixel = 0
    paragraphContainer.Parent = section.Content
    paragraph.Container = paragraphContainer
    
    local paragraphCorner = Instance.new("UICorner")
    paragraphCorner.CornerRadius = UDim.new(0, 6)
    paragraphCorner.Parent = paragraphContainer
    
    -- Title
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "TitleLabel"
    titleLabel.Size = UDim2.new(1, -20, 0, 20)
    titleLabel.Position = UDim2.new(0, 10, 0, 5)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = title
    titleLabel.TextColor3 = self.Theme.TextColor
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.TextSize = 14
    titleLabel.TextWrapped = true
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Parent = paragraphContainer
    paragraph.TitleLabel = titleLabel
    
    -- Content
    local contentLabel = Instance.new("TextLabel")
    contentLabel.Name = "ContentLabel"
    contentLabel.Size = UDim2.new(1, -20, 0, 0) -- Height will be adjusted
    contentLabel.Position = UDim2.new(0, 10, 0, 30)
    contentLabel.BackgroundTransparency = 1
    contentLabel.Text = content
    contentLabel.TextColor3 = self.Theme.SubTextColor
    contentLabel.Font = Enum.Font.Gotham
    contentLabel.TextSize = 14
    contentLabel.TextWrapped = true
    contentLabel.TextXAlignment = Enum.TextXAlignment.Left
    contentLabel.TextYAlignment = Enum.TextYAlignment.Top
    contentLabel.Parent = paragraphContainer
    paragraph.ContentLabel = contentLabel
    
    -- Calculate text size and adjust container height
    local textSize = TextService:GetTextSize(
        content,
        14,
        Enum.Font.Gotham,
        Vector2.new(paragraphContainer.AbsoluteSize.X - 20, math.huge)
    )
    
    contentLabel.Size = UDim2.new(1, -20, 0, textSize.Y)
    paragraphContainer.Size = UDim2.new(1, 0, 0, textSize.Y + 40)
    
    -- Set content function
    function paragraph:SetContent(newTitle, newContent)
        self.Title = newTitle or self.Title
        self.Content = newContent or self.Content
        
        self.TitleLabel.Text = self.Title
        self.ContentLabel.Text = self.Content
        
        -- Recalculate size
        local newTextSize = TextService:GetTextSize(
            self.Content,
            14,
            Enum.Font.Gotham,
            Vector2.new(self.Container.AbsoluteSize.X - 20, math.huge)
        )
        
        self.ContentLabel.Size = UDim2.new(1, -20, 0, newTextSize.Y)
        self.Container.Size = UDim2.new(1, 0, 0, newTextSize.Y + 40)
    end
    
    -- Add to section elements
    table.insert(section.Elements, paragraph)
    
    return paragraph
end

-- Create a divider
function RayUI:CreateDivider(section, config)
    config = config or {}
    local text = config.Text
    
    local divider = {
        Text = text,
        Section = section,
        Window = self,
        Type = "Divider"
    }
    
    -- Divider container
    local dividerContainer = Instance.new("Frame")
    dividerContainer.Name = "DividerContainer"
    dividerContainer.Size = UDim2.new(1, 0, 0, text and 30 or 10)
    dividerContainer.BackgroundTransparency = 1
    dividerContainer.Parent = section.Content
    divider.Container = dividerContainer
    
    if text then
        -- Divider with text
        local leftLine = Instance.new("Frame")
        leftLine.Name = "LeftLine"
        leftLine.Size = UDim2.new(0.5, -50, 0, 1)
        leftLine.Position = UDim2.new(0, 0, 0.5, 0)
        leftLine.BackgroundColor3 = self.Theme.Accent
        leftLine.BorderSizePixel = 0
        leftLine.Parent = dividerContainer
        
        local rightLine = Instance.new("Frame")
        rightLine.Name = "RightLine"
        rightLine.Size = UDim2.new(0.5, -50, 0, 1)
        rightLine.Position = UDim2.new(0.5, 50, 0.5, 0)
        rightLine.BackgroundColor3 = self.Theme.Accent
        rightLine.BorderSizePixel = 0
        rightLine.Parent = dividerContainer
        
        local textLabel = Instance.new("TextLabel")
        textLabel.Name = "DividerText"
        textLabel.Size = UDim2.new(0, 100, 1, 0)
        textLabel.Position = UDim2.new(0.5, -50, 0, 0)
        textLabel.BackgroundTransparency = 1
        textLabel.Text = text
        textLabel.TextColor3 = self.Theme.SubTextColor
        textLabel.Font = Enum.Font.GothamSemibold
        textLabel.TextSize = 12
        textLabel.Parent = dividerContainer
        divider.TextLabel = textLabel
    else
        -- Simple line divider
        local line = Instance.new("Frame")
        line.Name = "Line"
        line.Size = UDim2.new(1, 0, 0, 1)
        line.Position = UDim2.new(0, 0, 0.5, 0)
        line.BackgroundColor3 = self.Theme.Accent
        line.BorderSizePixel = 0
        line.Parent = dividerContainer
    end
    
    -- Set text function
    function divider:SetText(newText)
        if self.TextLabel then
            self.Text = newText
            self.TextLabel.Text = newText
        end
    end
    
    -- Add to section elements
    table.insert(section.Elements, divider)
    
    return divider
end

-- Create an action button (small button for actions like copy/paste)
function RayUI:CreateActionButton(section, config)
    config = config or {}
    local name = config.Name or "Action"
    local icon = config.Icon
    local callback = config.Callback or function() end
    
    local actionButton = {
        Name = name,
        Section = section,
        Window = self,
        Type = "ActionButton"
    }
    
    -- Action button container
    local buttonContainer = Instance.new("Frame")
    buttonContainer.Name = name .. "Container"
    buttonContainer.Size = UDim2.new(0, 36, 0, 36)
    buttonContainer.BackgroundTransparency = 1
    buttonContainer.Parent = section.Content
    actionButton.Container = buttonContainer
    
    -- Button
    local buttonFrame = Instance.new("TextButton")
    buttonFrame.Name = name .. "Button"
    buttonFrame.Size = UDim2.new(1, 0, 1, 0)
    buttonFrame.BackgroundColor3 = self.Theme.DarkAccent
    buttonFrame.Text = ""
    buttonFrame.AutoButtonColor = false
    buttonFrame.ClipsDescendants = true
    buttonFrame.Parent = buttonContainer
    actionButton.Frame = buttonFrame
    
    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0, 6)
    buttonCorner.Parent = buttonFrame
    
    local buttonStroke = Instance.new("UIStroke")
    buttonStroke.Color = self.Theme.Accent
    buttonStroke.Thickness = 1
    buttonStroke.Transparency = 0.5
    buttonStroke.Parent = buttonFrame
    
    -- Icon (if provided)
    if icon then
        local iconAsset = getIcon(icon)
        if iconAsset then
            local iconImage = Instance.new("ImageLabel")
            iconImage.Name = "IconImage"
            iconImage.Size = UDim2.new(0, 20, 0, 20)
            iconImage.Position = UDim2.new(0.5, -10, 0.5, -10)
            iconImage.BackgroundTransparency = 1
            iconImage.Image = "rbxassetid://" .. iconAsset.id
            iconImage.ImageRectSize = iconAsset.imageRectSize
            iconImage.ImageRectOffset = iconAsset.imageRectOffset
            iconImage.ImageColor3 = self.Theme.TextColor
            iconImage.Parent = buttonFrame
            actionButton.Icon = iconImage
        else
            -- Fallback to text if icon not found
            local buttonText = Instance.new("TextLabel")
            buttonText.Name = "ButtonText"
            buttonText.Size = UDim2.new(1, 0, 1, 0)
            buttonText.BackgroundTransparency = 1
            buttonText.Text = string.sub(name, 1, 1)
            buttonText.TextColor3 = self.Theme.TextColor
            buttonText.Font = Enum.Font.GothamBold
            buttonText.TextSize = 14
            buttonText.Parent = buttonFrame
        end
    else
        -- Use first letter as fallback
        local buttonText = Instance.new("TextLabel")
        buttonText.Name = "ButtonText"
        buttonText.Size = UDim2.new(1, 0, 1, 0)
        buttonText.BackgroundTransparency = 1
        buttonText.Text = string.sub(name, 1, 1)
        buttonText.TextColor3 = self.Theme.TextColor
        buttonText.Font = Enum.Font.GothamBold
        buttonText.TextSize = 14
        buttonText.Parent = buttonFrame
    end
    
    -- Button functionality
    buttonFrame.MouseButton1Click:Connect(function()
        createRipple(buttonFrame)
        callback()
    end)
    
    -- Button hover effects
    setupButtonHover(
        buttonFrame, 
        self.Theme.DarkAccent, 
        Color3.fromRGB(
            self.Theme.DarkAccent.R * 1.1, 
            self.Theme.DarkAccent.G * 1.1, 
            self.Theme.DarkAccent.B * 1.1
        ),
        Color3.fromRGB(
            self.Theme.DarkAccent.R * 0.9, 
            self.Theme.DarkAccent.G * 0.9, 
            self.Theme.DarkAccent.B * 0.9
        )
    )
    
    -- Add to section elements
    table.insert(section.Elements, actionButton)
    
    return actionButton
end

-- Update search results
function RayUI:UpdateSearch(searchText)
    if searchText == "" then
        -- Show all tabs
        for _, tab in pairs(self.Tabs) do
            tab.Button.Visible = true
        end
        return
    end
    
    searchText = searchText:lower()
    
    -- Search through tabs and their elements
    for _, tab in pairs(self.Tabs) do
        local tabVisible = string.find(tab.Name:lower(), searchText, 1, true) ~= nil
        local elementsVisible = false
        
        -- Search through sections and their elements
        for _, section in pairs(tab.Sections) do
            local sectionVisible = string.find(section.Name:lower(), searchText, 1, true) ~= nil
            
            -- Search through elements
            for _, element in pairs(section.Elements) do
                local elementVisible = false
                
                if element.Name and string.find(element.Name:lower(), searchText, 1, true) then
                    elementVisible = true
                elseif element.Text and string.find(element.Text:lower(), searchText, 1, true) then
                    elementVisible = true
                elseif element.Title and string.find(element.Title:lower(), searchText, 1, true) then
                    elementVisible = true
                elseif element.Content and string.find(element.Content:lower(), searchText, 1, true) then
                    elementVisible = true
                end
                
                if elementVisible then
                    elementsVisible = true
                    break
                end
            end
            
            if sectionVisible or elementsVisible then
                tabVisible = true
                break
            end
        end
        
        -- Set tab visibility
        tab.Button.Visible = tabVisible
    end
end

-- Return the library
local Module = {}

-- Directly copy the CreateWindow function to the module
Module.CreateWindow = function(self, config)
    return RayUI:CreateWindow(config)
end

-- Directly copy the Notify function to the module
Module.Notify = function(self, config)
    return RayUI:Notify(config)
end

return Module
