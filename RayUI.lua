--[[BETA]]

--[[
    RayUI Library
    A comprehensive UI library for Roblox with modern design elements
    
    Features:
    - Window with draggable title bar and minimize/close buttons
    - Tabs system for organizing content
    - Sections for grouping related elements
    - Various input elements: buttons, toggles, sliders, dropdowns
    - Information displays: labels, paragraphs
    - Notification system
    - Smooth animations and visual effects
]]

local RayUI = {}
RayUI.__index = RayUI

-- Services
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local TextService = game:GetService("TextService")

-- Constants
local ELEMENT_HEIGHT = 36
local ELEMENT_MARGIN = 8
local SECTION_PADDING = 10
local TAB_HEIGHT = 32
local WINDOW_WIDTH = 500

-- Utility Functions
local function createTween(instance, duration, properties, style, direction)
    style = style or Enum.EasingStyle.Quart
    direction = direction or Enum.EasingDirection.Out
    
    local tween = TweenService:Create(
        instance,
        TweenInfo.new(duration, style, direction),
        properties
    )
    
    return tween
end

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
    
    local tween = createTween(ripple, 0.5, {
        Size = UDim2.new(0, size, 0, size),
        BackgroundTransparency = 1
    })
    tween:Play()
    
    tween.Completed:Connect(function()
        ripple:Destroy()
    end)
end

local function calculateTextSize(text, font, size, frameWidth)
    return TextService:GetTextSize(text, size, font, Vector2.new(frameWidth, math.huge))
end

-- Create the main UI
function RayUI.new(title)
    local self = setmetatable({}, RayUI)
    title = title or "RayUI Library"
    
    -- Create ScreenGui
    self.ScreenGui = Instance.new("ScreenGui")
    self.ScreenGui.Name = "RayUI"
    self.ScreenGui.ResetOnSpawn = false
    self.ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    -- Parent the ScreenGui appropriately
    if RunService:IsStudio() then
        self.ScreenGui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")
    else
        self.ScreenGui.Parent = game:GetService("CoreGui")
    end
    
    -- Main window
    self.MainFrame = Instance.new("Frame")
    self.MainFrame.Name = "MainFrame"
    self.MainFrame.Size = UDim2.new(0, WINDOW_WIDTH, 0, 400)
    self.MainFrame.Position = UDim2.new(0.5, -WINDOW_WIDTH/2, 0.5, -200)
    self.MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
    self.MainFrame.BorderSizePixel = 0
    self.MainFrame.ClipsDescendants = true
    self.MainFrame.Parent = self.ScreenGui
    
    -- Shadow
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
    shadow.Parent = self.MainFrame
    
    -- Rounded corners
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 8)
    UICorner.Parent = self.MainFrame
    
    -- UI Stroke
    local UIStroke = Instance.new("UIStroke")
    UIStroke.Color = Color3.fromRGB(60, 60, 80)
    UIStroke.Thickness = 1.5
    UIStroke.Parent = self.MainFrame
    
    -- Title bar
    self.TitleBar = Instance.new("Frame")
    self.TitleBar.Name = "TitleBar"
    self.TitleBar.Size = UDim2.new(1, 0, 0, 40)
    self.TitleBar.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    self.TitleBar.BorderSizePixel = 0
    self.TitleBar.Parent = self.MainFrame
    
    local titleCorner = Instance.new("UICorner")
    titleCorner.CornerRadius = UDim.new(0, 8)
    titleCorner.Parent = self.TitleBar
    
    -- Fix the bottom corners of title bar
    local bottomFix = Instance.new("Frame")
    bottomFix.Name = "BottomFix"
    bottomFix.Size = UDim2.new(1, 0, 0, 10)
    bottomFix.Position = UDim2.new(0, 0, 1, -10)
    bottomFix.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    bottomFix.BorderSizePixel = 0
    bottomFix.ZIndex = 0
    bottomFix.Parent = self.TitleBar
    
    -- Title text
    local titleText = Instance.new("TextLabel")
    titleText.Name = "TitleText"
    titleText.Size = UDim2.new(1, -100, 1, 0)
    titleText.Position = UDim2.new(0, 15, 0, 0)
    titleText.BackgroundTransparency = 1
    titleText.Text = title
    titleText.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleText.Font = Enum.Font.GothamBold
    titleText.TextSize = 16
    titleText.TextXAlignment = Enum.TextXAlignment.Left
    titleText.Parent = self.TitleBar
    
    -- Minimize button
    local minimizeButton = Instance.new("ImageButton")
    minimizeButton.Name = "MinimizeButton"
    minimizeButton.Size = UDim2.new(0, 18, 0, 18)
    minimizeButton.Position = UDim2.new(1, -50, 0.5, -9)
    minimizeButton.BackgroundTransparency = 1
    minimizeButton.Image = "rbxassetid://6026568240"
    minimizeButton.ImageColor3 = Color3.fromRGB(255, 255, 255)
    minimizeButton.Parent = self.TitleBar
    
    -- Close button
    local closeButton = Instance.new("ImageButton")
    closeButton.Name = "CloseButton"
    closeButton.Size = UDim2.new(0, 18, 0, 18)
    closeButton.Position = UDim2.new(1, -25, 0.5, -9)
    closeButton.BackgroundTransparency = 1
    closeButton.Image = "rbxassetid://6031094678"
    closeButton.ImageColor3 = Color3.fromRGB(255, 255, 255)
    closeButton.Parent = self.TitleBar
    
    -- Content container
    self.ContentFrame = Instance.new("Frame")
    self.ContentFrame.Name = "ContentFrame"
    self.ContentFrame.Size = UDim2.new(1, 0, 1, -40)
    self.ContentFrame.Position = UDim2.new(0, 0, 0, 40)
    self.ContentFrame.BackgroundTransparency = 1
    self.ContentFrame.ClipsDescendants = true
    self.ContentFrame.Parent = self.MainFrame
    
    -- Tab container
    self.TabContainer = Instance.new("Frame")
    self.TabContainer.Name = "TabContainer"
    self.TabContainer.Size = UDim2.new(1, 0, 0, TAB_HEIGHT)
    self.TabContainer.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
    self.TabContainer.BorderSizePixel = 0
    self.TabContainer.Parent = self.ContentFrame
    
    -- Tab scroll frame
    self.TabScroll = Instance.new("ScrollingFrame")
    self.TabScroll.Name = "TabScroll"
    self.TabScroll.Size = UDim2.new(1, 0, 1, 0)
    self.TabScroll.BackgroundTransparency = 1
    self.TabScroll.BorderSizePixel = 0
    self.TabScroll.ScrollBarThickness = 0
    self.TabScroll.ScrollingDirection = Enum.ScrollingDirection.X
    self.TabScroll.AutomaticCanvasSize = Enum.AutomaticSize.X
    self.TabScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
    self.TabScroll.Parent = self.TabContainer
    
    -- Tab layout
    local tabLayout = Instance.new("UIListLayout")
    tabLayout.Name = "TabLayout"
    tabLayout.FillDirection = Enum.FillDirection.Horizontal
    tabLayout.SortOrder = Enum.SortOrder.LayoutOrder
    tabLayout.Padding = UDim.new(0, 5)
    tabLayout.Parent = self.TabScroll
    
    local tabPadding = Instance.new("UIPadding")
    tabPadding.PaddingLeft = UDim.new(0, 10)
    tabPadding.PaddingRight = UDim.new(0, 10)
    tabPadding.Parent = self.TabScroll
    
    -- Tab content container
    self.TabContent = Instance.new("Frame")
    self.TabContent.Name = "TabContent"
    self.TabContent.Size = UDim2.new(1, 0, 1, -TAB_HEIGHT)
    self.TabContent.Position = UDim2.new(0, 0, 0, TAB_HEIGHT)
    self.TabContent.BackgroundTransparency = 1
    self.TabContent.Parent = self.ContentFrame
    
    -- Make UI draggable
    local dragging = false
    local dragInput
    local dragStart
    local startPos
    
    local function updateDrag(input)
        local delta = input.Position - dragStart
        self.MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
    
    self.TitleBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = self.MainFrame.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    
    self.TitleBar.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            updateDrag(input)
        end
    end)
    
    -- Minimize functionality
    local minimized = false
    minimizeButton.MouseButton1Click:Connect(function()
        minimized = not minimized
        
        local targetSize
        if minimized then
            targetSize = UDim2.new(1, 0, 0, 0)
            minimizeButton.Image = "rbxassetid://6031090990" -- Maximize icon
        else
            targetSize = UDim2.new(1, 0, 1, -40)
            minimizeButton.Image = "rbxassetid://6026568240" -- Minimize icon
        end
        
        createTween(self.ContentFrame, 0.3, {
            Size = targetSize
        }):Play()
    end)
    
    -- Close functionality
    closeButton.MouseButton1Click:Connect(function()
        createTween(self.MainFrame, 0.3, {
            Size = UDim2.new(0, WINDOW_WIDTH, 0, 0),
            Position = UDim2.new(self.MainFrame.Position.X.Scale, self.MainFrame.Position.X.Offset, 
                                 self.MainFrame.Position.Y.Scale, self.MainFrame.Position.Y.Offset + 200)
        }):Play()
        
        wait(0.3)
        self.ScreenGui:Destroy()
    end)
    
    -- Button hover effects
    local function setupButtonHover(button, normalColor, hoverColor)
        button.MouseEnter:Connect(function()
            createTween(button, 0.2, {
                ImageColor3 = hoverColor
            }):Play()
        end)
        
        button.MouseLeave:Connect(function()
            createTween(button, 0.2, {
                ImageColor3 = normalColor
            }):Play()
        end)
    end
    
    setupButtonHover(closeButton, Color3.fromRGB(255, 255, 255), Color3.fromRGB(255, 100, 100))
    setupButtonHover(minimizeButton, Color3.fromRGB(255, 255, 255), Color3.fromRGB(100, 200, 255))
    
    -- Initialize tabs
    self.Tabs = {}
    self.ActiveTab = nil
    
    return self
end

-- Create a new tab
function RayUI:AddTab(name, icon)
    local tab = {}
    
    -- Tab button
    tab.Button = Instance.new("TextButton")
    tab.Button.Name = name .. "Tab"
    tab.Button.Size = UDim2.new(0, 0, 1, 0) -- Auto-size based on text
    tab.Button.AutomaticSize = Enum.AutomaticSize.X
    tab.Button.BackgroundTransparency = 1
    tab.Button.Text = name
    tab.Button.TextColor3 = Color3.fromRGB(200, 200, 200)
    tab.Button.Font = Enum.Font.GothamSemibold
    tab.Button.TextSize = 14
    tab.Button.Parent = self.TabScroll
    
    -- Tab indicator
    tab.Indicator = Instance.new("Frame")
    tab.Indicator.Name = "Indicator"
    tab.Indicator.Size = UDim2.new(1, 0, 0, 2)
    tab.Indicator.Position = UDim2.new(0, 0, 1, -2)
    tab.Indicator.BackgroundColor3 = Color3.fromRGB(80, 120, 255)
    tab.Indicator.BorderSizePixel = 0
    tab.Indicator.Transparency = 1
    tab.Indicator.Parent = tab.Button
    
    -- Tab content
    tab.Container = Instance.new("ScrollingFrame")
    tab.Container.Name = name .. "Container"
    tab.Container.Size = UDim2.new(1, 0, 1, 0)
    tab.Container.BackgroundTransparency = 1
    tab.Container.BorderSizePixel = 0
    tab.Container.ScrollBarThickness = 4
    tab.Container.ScrollBarImageColor3 = Color3.fromRGB(80, 80, 120)
    tab.Container.VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Right
    tab.Container.AutomaticCanvasSize = Enum.AutomaticSize.Y
    tab.Container.CanvasSize = UDim2.new(0, 0, 0, 0)
    tab.Container.Visible = false
    tab.Container.Parent = self.TabContent
    
    -- Layout for tab content
    local contentLayout = Instance.new("UIListLayout")
    contentLayout.Name = "ContentLayout"
    contentLayout.SortOrder = Enum.SortOrder.LayoutOrder
    contentLayout.Padding = UDim.new(0, 10)
    contentLayout.Parent = tab.Container
    
    local contentPadding = Instance.new("UIPadding")
    contentPadding.PaddingLeft = UDim.new(0, 15)
    contentPadding.PaddingRight = UDim.new(0, 15)
    contentPadding.PaddingTop = UDim.new(0, 15)
    contentPadding.PaddingBottom = UDim.new(0, 15)
    contentPadding.Parent = tab.Container
    
    -- Tab selection
    tab.Button.MouseButton1Click:Connect(function()
        self:SelectTab(name)
    end)
    
    -- Add icon if provided
    if icon then
        local iconImage = Instance.new("ImageLabel")
        iconImage.Name = "Icon"
        iconImage.Size = UDim2.new(0, 16, 0, 16)
        iconImage.Position = UDim2.new(0, 0, 0.5, -8)
        iconImage.BackgroundTransparency = 1
        iconImage.Image = icon
        iconImage.Parent = tab.Button
        
        tab.Button.TextXAlignment = Enum.TextXAlignment.Right
        tab.Button.AutomaticSize = Enum.AutomaticSize.X
        tab.Button.Padding = UDim.new(0, 20)
    end
    
    -- Store tab
    self.Tabs[name] = tab
    
    -- Select first tab automatically
    if not self.ActiveTab then
        self:SelectTab(name)
    end
    
    -- Return tab for chaining
    return {
        AddSection = function(sectionName)
            return self:AddSection(name, sectionName)
        end
    }
end

-- Select a tab
function RayUI:SelectTab(name)
    local tab = self.Tabs[name]
    if not tab then return end
    
    -- Deselect current tab
    if self.ActiveTab then
        local currentTab = self.Tabs[self.ActiveTab]
        createTween(currentTab.Button, 0.2, {
            TextColor3 = Color3.fromRGB(200, 200, 200)
        }):Play()
        createTween(currentTab.Indicator, 0.2, {
            Transparency = 1
        }):Play()
        currentTab.Container.Visible = false
    end
    
    -- Select new tab
    createTween(tab.Button, 0.2, {
        TextColor3 = Color3.fromRGB(255, 255, 255)
    }):Play()
    createTween(tab.Indicator, 0.2, {
        Transparency = 0
    }):Play()
    tab.Container.Visible = true
    
    self.ActiveTab = name
end

-- Add a section to a tab
function RayUI:AddSection(tabName, sectionName)
    local tab = self.Tabs[tabName]
    if not tab then return end
    
    local section = {}
    
    -- Section container
    section.Container = Instance.new("Frame")
    section.Container.Name = sectionName .. "Section"
    section.Container.Size = UDim2.new(1, 0, 0, 0)
    section.Container.AutomaticSize = Enum.AutomaticSize.Y
    section.Container.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
    section.Container.BorderSizePixel = 0
    section.Container.Parent = tab.Container
    
    -- Section corner
    local sectionCorner = Instance.new("UICorner")
    sectionCorner.CornerRadius = UDim.new(0, 6)
    sectionCorner.Parent = section.Container
    
    -- Section stroke
    local sectionStroke = Instance.new("UIStroke")
    sectionStroke.Color = Color3.fromRGB(60, 60, 80)
    sectionStroke.Thickness = 1
    sectionStroke.Parent = section.Container
    
    -- Section title
    local sectionTitle = Instance.new("TextLabel")
    sectionTitle.Name = "Title"
    sectionTitle.Size = UDim2.new(1, -20, 0, 30)
    sectionTitle.Position = UDim2.new(0, 10, 0, 0)
    sectionTitle.BackgroundTransparency = 1
    sectionTitle.Text = sectionName
    sectionTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    sectionTitle.Font = Enum.Font.GothamBold
    sectionTitle.TextSize = 14
    sectionTitle.TextXAlignment = Enum.TextXAlignment.Left
    sectionTitle.Parent = section.Container
    
    -- Section content
    local sectionContent = Instance.new("Frame")
    sectionContent.Name = "Content"
    sectionContent.Size = UDim2.new(1, -20, 0, 0)
    sectionContent.Position = UDim2.new(0, 10, 0, 30)
    sectionContent.BackgroundTransparency = 1
    sectionContent.AutomaticSize = Enum.AutomaticSize.Y
    sectionContent.Parent = section.Container
    
    -- Section layout
    local sectionLayout = Instance.new("UIListLayout")
    sectionLayout.Name = "Layout"
    sectionLayout.SortOrder = Enum.SortOrder.LayoutOrder
    sectionLayout.Padding = UDim.new(0, ELEMENT_MARGIN)
    sectionLayout.Parent = sectionContent
    
    -- Add padding at the bottom
    local sectionPadding = Instance.new("UIPadding")
    sectionPadding.PaddingBottom = UDim.new(0, 10)
    sectionPadding.Parent = sectionContent
    
    -- Return section methods
    return {
        AddButton = function(text, callback)
            return self:AddButton(section, text, callback)
        end,
        AddToggle = function(text, default, callback)
            return self:AddToggle(section, text, default, callback)
        end,
        AddSlider = function(text, min, max, default, callback)
            return self:AddSlider(section, text, min, max, default, callback)
        end,
        AddDropdown = function(text, options, default, callback)
            return self:AddDropdown(section, text, options, default, callback)
        end,
        AddLabel = function(text)
            return self:AddLabel(section, text)
        end,
        AddParagraph = function(title, description, color)
            return self:AddParagraph(section, title, description, color)
        end
    }
end

-- Add a button
function RayUI:AddButton(section, text, callback)
    callback = callback or function() end
    
    -- Button container
    local button = Instance.new("TextButton")
    button.Name = text .. "Button"
    button.Size = UDim2.new(1, 0, 0, ELEMENT_HEIGHT)
    button.BackgroundColor3 = Color3.fromRGB(45, 45, 65)
    button.Text = text
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Font = Enum.Font.GothamSemibold
    button.TextSize = 14
    button.ClipsDescendants = true
    button.AutoButtonColor = false
    button.Parent = section.Container.Content
    
    -- Button corner
    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0, 4)
    buttonCorner.Parent = button
    
    -- Button gradient
    local buttonGradient = Instance.new("UIGradient")
    buttonGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(60, 60, 90)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(50, 50, 75))
    })
    buttonGradient.Rotation = 90
    buttonGradient.Parent = button
    
    -- Button effects
    button.MouseEnter:Connect(function()
        createTween(button, 0.2, {
            BackgroundColor3 = Color3.fromRGB(55, 55, 80)
        }):Play()
    end)
    
    button.MouseLeave:Connect(function()
        createTween(button, 0.2, {
            BackgroundColor3 = Color3.fromRGB(45, 45, 65)
        }):Play()
    end)
    
    button.MouseButton1Down:Connect(function()
        createRipple(button)
        createTween(button, 0.1, {
            BackgroundColor3 = Color3.fromRGB(40, 40, 60)
        }):Play()
    end)
    
    button.MouseButton1Up:Connect(function()
        createTween(button, 0.1, {
            BackgroundColor3 = Color3.fromRGB(55, 55, 80)
        }):Play()
    end)
    
    button.MouseButton1Click:Connect(function()
        callback()
    end)
    
    return button
end

-- Add a toggle
function RayUI:AddToggle(section, text, default, callback)
    default = default or false
    callback = callback or function() end
    
    local toggled = default
    
    -- Toggle container
    local toggleContainer = Instance.new("Frame")
    toggleContainer.Name = text .. "Toggle"
    toggleContainer.Size = UDim2.new(1, 0, 0, ELEMENT_HEIGHT)
    toggleContainer.BackgroundTransparency = 1
    toggleContainer.Parent = section.Container.Content
    
    -- Toggle text
    local toggleText = Instance.new("TextLabel")
    toggleText.Name = "Text"
    toggleText.Size = UDim2.new(1, -50, 1, 0)
    toggleText.BackgroundTransparency = 1
    toggleText.Text = text
    toggleText.TextColor3 = Color3.fromRGB(255, 255, 255)
    toggleText.Font = Enum.Font.Gotham
    toggleText.TextSize = 14
    toggleText.TextXAlignment = Enum.TextXAlignment.Left
    toggleText.Parent = toggleContainer
    
    -- Toggle button
    local toggleButton = Instance.new("Frame")
    toggleButton.Name = "Button"
    toggleButton.Size = UDim2.new(0, 40, 0, 20)
    toggleButton.Position = UDim2.new(1, -45, 0.5, -10)
    toggleButton.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
    toggleButton.Parent = toggleContainer
    
    local toggleCorner = Instance.new("UICorner")
    toggleCorner.CornerRadius = UDim.new(1, 0)
    toggleCorner.Parent = toggleButton
    
    -- Toggle indicator
    local toggleIndicator = Instance.new("Frame")
    toggleIndicator.Name = "Indicator"
    toggleIndicator.Size = UDim2.new(0, 16, 0, 16)
    toggleIndicator.Position = UDim2.new(0, 2, 0.5, -8)
    toggleIndicator.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    toggleIndicator.Parent = toggleButton
    
    local indicatorCorner = Instance.new("UICorner")
    indicatorCorner.CornerRadius = UDim.new(1, 0)
    indicatorCorner.Parent = toggleIndicator
    
    -- Hitbox for toggle
    local toggleHitbox = Instance.new("TextButton")
    toggleHitbox.Name = "Hitbox"
    toggleHitbox.Size = UDim2.new(1, 0, 1, 0)
    toggleHitbox.BackgroundTransparency = 1
    toggleHitbox.Text = ""
    toggleHitbox.Parent = toggleContainer
    
    -- Set initial state
    if toggled then
        toggleButton.BackgroundColor3 = Color3.fromRGB(60, 120, 255)
        toggleIndicator.Position = UDim2.new(0, 22, 0.5, -8)
    end
    
    -- Toggle functionality
    local function updateToggle()
        toggled = not toggled
        
        local targetPosition = toggled and UDim2.new(0, 22, 0.5, -8) or UDim2.new(0, 2, 0.5, -8)
        local targetColor = toggled and Color3.fromRGB(60, 120, 255) or Color3.fromRGB(40, 40, 60)
        
        createTween(toggleIndicator, 0.2, {
            Position = targetPosition
        }):Play()
        
        createTween(toggleButton, 0.2, {
            BackgroundColor3 = targetColor
        }):Play()
        
        callback(toggled)
    end
    
    toggleHitbox.MouseButton1Click:Connect(updateToggle)
    
    -- Return toggle object with methods
    return {
        Set = function(value)
            if toggled ~= value then
                updateToggle()
            end
        end,
        Get = function()
            return toggled
        end
    }
end

-- Add a slider
function RayUI:AddSlider(section, text, min, max, default, callback)
    min = min or 0
    max = max or 100
    default = math.clamp(default or min, min, max)
    callback = callback or function() end
    
    local value = default
    
    -- Slider container
    local sliderContainer = Instance.new("Frame")
    sliderContainer.Name = text .. "Slider"
    sliderContainer.Size = UDim2.new(1, 0, 0, ELEMENT_HEIGHT + 15)
    sliderContainer.BackgroundTransparency = 1
    sliderContainer.Parent = section.Container.Content
    
    -- Slider text
    local sliderText = Instance.new("TextLabel")
    sliderText.Name = "Text"
    sliderText.Size = UDim2.new(1, 0, 0, 20)
    sliderText.BackgroundTransparency = 1
    sliderText.Text = text
    sliderText.TextColor3 = Color3.fromRGB(255, 255, 255)
    sliderText.Font = Enum.Font.Gotham
    sliderText.TextSize = 14
    sliderText.TextXAlignment = Enum.TextXAlignment.Left
    sliderText.Parent = sliderContainer
    
    -- Value display
    local valueDisplay = Instance.new("TextLabel")
    valueDisplay.Name = "Value"
    valueDisplay.Size = UDim2.new(0, 50, 0, 20)
    valueDisplay.Position = UDim2.new(1, -50, 0, 0)
    valueDisplay.BackgroundTransparency = 1
    valueDisplay.Text = tostring(default)
    valueDisplay.TextColor3 = Color3.fromRGB(200, 200, 200)
    valueDisplay.Font = Enum.Font.GothamSemibold
    valueDisplay.TextSize = 14
    valueDisplay.TextXAlignment = Enum.TextXAlignment.Right
    valueDisplay.Parent = sliderContainer
    
    -- Slider track
    local sliderTrack = Instance.new("Frame")
    sliderTrack.Name = "Track"
    sliderTrack.Size = UDim2.new(1, 0, 0, 6)
    sliderTrack.Position = UDim2.new(0, 0, 0, 25)
    sliderTrack.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
    sliderTrack.BorderSizePixel = 0
    sliderTrack.Parent = sliderContainer
    
    local trackCorner = Instance.new("UICorner")
    trackCorner.CornerRadius = UDim.new(1, 0)
    trackCorner.Parent = sliderTrack
    
    -- Slider fill
    local sliderFill = Instance.new("Frame")
    sliderFill.Name = "Fill"
    sliderFill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
    sliderFill.BackgroundColor3 = Color3.fromRGB(60, 120, 255)
    sliderFill.BorderSizePixel = 0
    sliderFill.Parent = sliderTrack
    
    local fillCorner = Instance.new("UICorner")
    fillCorner.CornerRadius = UDim.new(1, 0)
    fillCorner.Parent = sliderFill
    
    -- Slider thumb
    local sliderThumb = Instance.new("Frame")
    sliderThumb.Name = "Thumb"
    sliderThumb.Size = UDim2.new(0, 14, 0, 14)
    sliderThumb.Position = UDim2.new((default - min) / (max - min), -7, 0.5, -7)
    sliderThumb.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    sliderThumb.BorderSizePixel = 0
    sliderThumb.ZIndex = 2
    sliderThumb.Parent = sliderTrack
    
    local thumbCorner = Instance.new("UICorner")
    thumbCorner.CornerRadius = UDim.new(1, 0)
    thumbCorner.Parent = sliderThumb
    
    -- Slider hitbox
    local sliderHitbox = Instance.new("TextButton")
    sliderHitbox.Name = "Hitbox"
    sliderHitbox.Size = UDim2.new(1, 0, 1, 10)
    sliderHitbox.Position = UDim2.new(0, 0, 0, -5)
    sliderHitbox.BackgroundTransparency = 1
    sliderHitbox.Text = ""
    sliderHitbox.Parent = sliderTrack
    
    -- Update slider function
    local function updateSlider(input)
        local sizeX = math.clamp((input.Position.X - sliderTrack.AbsolutePosition.X) / sliderTrack.AbsoluteSize.X, 0, 1)
        local newValue = math.floor(min + ((max - min) * sizeX))
        
        if newValue ~= value then
            value = newValue
            valueDisplay.Text = tostring(value)
            
            createTween(sliderFill, 0.1, {
                Size = UDim2.new(sizeX, 0, 1, 0)
            }):Play()
            
            createTween(sliderThumb, 0.1, {
                Position = UDim2.new(sizeX, -7, 0.5, -7)
            }):Play()
            
            callback(value)
        end
    end
    
    -- Slider interaction
    local sliding = false
    
    sliderHitbox.MouseButton1Down:Connect(function(input)
        sliding = true
        updateSlider({Position = UserInputService:GetMouseLocation()})
    end)
    
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            sliding = false
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement and sliding then
            updateSlider({Position = UserInputService:GetMouseLocation()})
        end
    end)
    
    -- Return slider object with methods
    return {
        Set = function(newValue)
            newValue = math.clamp(newValue, min, max)
            if value ~= newValue then
                value = newValue
                valueDisplay.Text = tostring(value)
                
                local sizeX = (value - min) / (max - min)
                
                createTween(sliderFill, 0.1, {
                    Size = UDim2.new(sizeX, 0, 1, 0)
                }):Play()
                
                createTween(sliderThumb, 0.1, {
                    Position = UDim2.new(sizeX, -7, 0.5, -7)
                }):Play()
                
                callback(value)
            end
        end,
        Get = function()
            return value
        end
    }
end

-- Add a dropdown
function RayUI:AddDropdown(section, text, options, default, callback)
    options = options or {}
    default = default or options[1] or ""
    callback = callback or function() end
    
    local selected = default
    local open = false
    
    -- Dropdown container
    local dropdownContainer = Instance.new("Frame")
    dropdownContainer.Name = text .. "Dropdown"
    dropdownContainer.Size = UDim2.new(1, 0, 0, ELEMENT_HEIGHT)
    dropdownContainer.BackgroundTransparency = 1
    dropdownContainer.ClipsDescendants = true
    dropdownContainer.Parent = section.Container.Content
    
    -- Dropdown text
    local dropdownText = Instance.new("TextLabel")
    dropdownText.Name = "Text"
    dropdownText.Size = UDim2.new(1, 0, 0, 20)
    dropdownText.BackgroundTransparency = 1
    dropdownText.Text = text
    dropdownText.TextColor3 = Color3.fromRGB(255, 255, 255)
    dropdownText.Font = Enum.Font.Gotham
    dropdownText.TextSize = 14
    dropdownText.TextXAlignment = Enum.TextXAlignment.Left
    dropdownText.Parent = dropdownContainer
    
    -- Dropdown button
    local dropdownButton = Instance.new("TextButton")
    dropdownButton.Name = "Button"
    dropdownButton.Size = UDim2.new(1, 0, 0, 30)
    dropdownButton.Position = UDim2.new(0, 0, 0, 20)
    dropdownButton.BackgroundColor3 = Color3.fromRGB(45, 45, 65)
    dropdownButton.Text = selected
    dropdownButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    dropdownButton.Font = Enum.Font.Gotham
    dropdownButton.TextSize = 14
    dropdownButton.TextXAlignment = Enum.TextXAlignment.Left
    dropdownButton.TextTruncate = Enum.TextTruncate.AtEnd
    dropdownButton.ClipsDescendants = true
    dropdownButton.AutoButtonColor = false
    dropdownButton.Parent = dropdownContainer
    
    -- Add padding to text
    local buttonPadding = Instance.new("UIPadding")
    buttonPadding.PaddingLeft = UDim.new(0, 10)
    buttonPadding.Parent = dropdownButton
    
    -- Dropdown button corner
    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0, 4)
    buttonCorner.Parent = dropdownButton
    
    -- Dropdown arrow
    local dropdownArrow = Instance.new("ImageLabel")
    dropdownArrow.Name = "Arrow"
    dropdownArrow.Size = UDim2.new(0, 16, 0, 16)
    dropdownArrow.Position = UDim2.new(1, -25, 0.5, -8)
    dropdownArrow.BackgroundTransparency = 1
    dropdownArrow.Image = "rbxassetid://6031091004"
    dropdownArrow.ImageColor3 = Color3.fromRGB(255, 255, 255)
    dropdownArrow.Parent = dropdownButton
    
    -- Dropdown list
    local dropdownList = Instance.new("Frame")
    dropdownList.Name = "List"
    dropdownList.Size = UDim2.new(1, 0, 0, 0)
    dropdownList.Position = UDim2.new(0, 0, 0, 50)
    dropdownList.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
    dropdownList.BorderSizePixel = 0
    dropdownList.ClipsDescendants = true
    dropdownList.Visible = false
    dropdownList.Parent = dropdownContainer
    
    -- Dropdown list corner
    local listCorner = Instance.new("UICorner")
    listCorner.CornerRadius = UDim.new(0, 4)
    listCorner.Parent = dropdownList
    
    -- Search box
    local searchBox = Instance.new("TextBox")
    searchBox.Name = "SearchBox"
    searchBox.Size = UDim2.new(1, -20, 0, 30)
    searchBox.Position = UDim2.new(0, 10, 0, 5)
    searchBox.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
    searchBox.PlaceholderText = "Search..."
    searchBox.Text = ""
    searchBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    searchBox.PlaceholderColor3 = Color3.fromRGB(180, 180, 180)
    searchBox.Font = Enum.Font.Gotham
    searchBox.TextSize = 14
    searchBox.TextXAlignment = Enum.TextXAlignment.Left
    searchBox.Parent = dropdownList
    
    -- Search box corner
    local searchCorner = Instance.new("UICorner")
    searchCorner.CornerRadius = UDim.new(0, 4)
    searchCorner.Parent = searchBox
    
    -- Search box padding
    local searchPadding = Instance.new("UIPadding")
    searchPadding.PaddingLeft = UDim.new(0, 10)
    searchPadding.Parent = searchBox
    
    -- Options container
    local optionsContainer = Instance.new("ScrollingFrame")
    optionsContainer.Name = "Options"
    optionsContainer.Size = UDim2.new(1, -10, 1, -45)
    optionsContainer.Position = UDim2.new(0, 5, 0, 40)
    optionsContainer.BackgroundTransparency = 1
    optionsContainer.BorderSizePixel = 0
    optionsContainer.ScrollBarThickness = 3
    optionsContainer.ScrollBarImageColor3 = Color3.fromRGB(80, 80, 120)
    optionsContainer.CanvasSize = UDim2.new(0, 0, 0, 0)
    optionsContainer.AutomaticCanvasSize = Enum.AutomaticSize.Y
    optionsContainer.Parent = dropdownList
    
    -- Options layout
    local optionsLayout = Instance.new("UIListLayout")
    optionsLayout.SortOrder = Enum.SortOrder.LayoutOrder
    optionsLayout.Padding = UDim.new(0, 5)
    optionsLayout.Parent = optionsContainer
    
    -- Create option buttons
    local optionButtons = {}
    
    local function createOption(optionText)
        local option = Instance.new("TextButton")
        option.Name = optionText .. "Option"
        option.Size = UDim2.new(1, 0, 0, 30)
        option.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
        option.Text = optionText
        option.TextColor3 = Color3.fromRGB(255, 255, 255)
        option.Font = Enum.Font.Gotham
        option.TextSize = 14
        option.TextXAlignment = Enum.TextXAlignment.Left
        option.AutoButtonColor = false
        option.Parent = optionsContainer
        
        -- Option corner
        local optionCorner = Instance.new("UICorner")
        optionCorner.CornerRadius = UDim.new(0, 4)
        optionCorner.Parent = option
        
        -- Option padding
        local optionPadding = Instance.new("UIPadding")
        optionPadding.PaddingLeft = UDim.new(0, 10)
        optionPadding.Parent = option
        
        -- Option hover effect
        option.MouseEnter:Connect(function()
            createTween(option, 0.2, {
                BackgroundColor3 = Color3.fromRGB(60, 60, 90)
            }):Play()
        end)
        
        option.MouseLeave:Connect(function()
            createTween(option, 0.2, {
                BackgroundColor3 = Color3.fromRGB(50, 50, 70)
            }):Play()
        end)
        
        -- Option selection
        option.MouseButton1Click:Connect(function()
            selected = optionText
            dropdownButton.Text = selected
            
            -- Close dropdown
            toggleDropdown(false)
            
            -- Call callback
            callback(selected)
        end)
        
        return option
    end
    
    -- Populate options
    for _, optionText in ipairs(options) do
        optionButtons[optionText] = createOption(optionText)
    end
    
    -- Toggle dropdown function
    local function toggleDropdown(state)
        open = state
        
        local targetSize
        local targetRotation
        
        if open then
            -- Calculate height based on number of options (max 5 visible)
            local visibleOptions = math.min(#options, 5)
            local listHeight = 45 + (visibleOptions * 35) -- 45 for search box + padding
            targetSize = UDim2.new(1, 0, 0, listHeight)
            targetRotation = 180
            dropdownList.Visible = true
        else
            targetSize = UDim2.new(1, 0, 0, 0)
            targetRotation = 0
            
            -- Hide after animation
            delay(0.2, function()
                if not open then
                    dropdownList.Visible = false
                end
            end)
        end
        
        -- Update container size
        createTween(dropdownContainer, 0.2, {
            Size = UDim2.new(1, 0, 0, open and (ELEMENT_HEIGHT + targetSize.Y.Offset) or ELEMENT_HEIGHT)
        }):Play()
        
        -- Update list size
        createTween(dropdownList, 0.2, {
            Size = targetSize
        }):Play()
        
        -- Rotate arrow
        createTween(dropdownArrow, 0.2, {
            Rotation = targetRotation
        }):Play()
    end
    
    -- Dropdown button click
    dropdownButton.MouseButton1Click:Connect(function()
        toggleDropdown(not open)
    end)
    
    -- Search functionality
    searchBox.Changed:Connect(function(prop)
        if prop == "Text" then
            local searchText = searchBox.Text:lower()
            
            for optionText, button in pairs(optionButtons) do
                if searchText == "" then
                    button.Visible = true
                else
                    button.Visible = optionText:lower():find(searchText, 1, true) ~= nil
                end
            end
        end
    end)
    
    -- Return dropdown object with methods
    return {
        Set = function(newValue)
            if options[table.find(options, newValue)] then
                selected = newValue
                dropdownButton.Text = selected
                callback(selected)
            end
        end,
        Get = function()
            return selected
        end,
        Refresh = function(newOptions, keepSelection)
            options = newOptions or {}
            
            -- Clear existing options
            for _, button in pairs(optionButtons) do
                button:Destroy()
            end
            optionButtons = {}
            
            -- Add new options
            for _, optionText in ipairs(options) do
                optionButtons[optionText] = createOption(optionText)
            end
            
            -- Update selection
            if not keepSelection or not table.find(options, selected) then
                selected = options[1] or ""
                dropdownButton.Text = selected
                callback(selected)
            end
        end
    }
end

-- Add a label
function RayUI:AddLabel(section, text)
    -- Label container
    local label = Instance.new("TextLabel")
    label.Name = "Label"
    label.Size = UDim2.new(1, 0, 0, 25)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = Color3.fromRGB(200, 200, 200)
    label.Font = Enum.Font.Gotham
    label.TextSize = 14
    label.TextWrapped = true
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = section.Container.Content
    
    -- Auto-size based on text
    label:GetPropertyChangedSignal("Text"):Connect(function()
        local textSize = calculateTextSize(label.Text, label.Font, label.TextSize, label.AbsoluteSize.X)
        label.Size = UDim2.new(1, 0, 0, textSize.Y + 5)
    end)
    
    -- Return label object with methods
    return {
        Set = function(newText)
            label.Text = newText
        end,
        Get = function()
            return label.Text
        end
    }
end

-- Add a paragraph
function RayUI:AddParagraph(section, title, description, color)
    color = color or Color3.fromRGB(35, 35, 45)
    
    -- Paragraph container
    local paragraph = Instance.new("Frame")
    paragraph.Name = "Paragraph"
    paragraph.Size = UDim2.new(1, 0, 0, 0)
    paragraph.BackgroundColor3 = color
    paragraph.AutomaticSize = Enum.AutomaticSize.Y
    paragraph.Parent = section.Container.Content
    
    -- Paragraph corner
    local paragraphCorner = Instance.new("UICorner")
    paragraphCorner.CornerRadius = UDim.new(0, 4)
    paragraphCorner.Parent = paragraph
    
    -- Title
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "Title"
    titleLabel.Size = UDim2.new(1, -20, 0, 25)
    titleLabel.Position = UDim2.new(0, 10, 0, 0)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = title
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.TextSize = 14
    titleLabel.TextWrapped = true
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Parent = paragraph
    
    -- Description
    local descriptionLabel = Instance.new("TextLabel")
    descriptionLabel.Name = "Description"
    descriptionLabel.Size = UDim2.new(1, -20, 0, 0)
    descriptionLabel.Position = UDim2.new(0, 10, 0, 25)
    descriptionLabel.BackgroundTransparency = 1
    descriptionLabel.Text = description
    descriptionLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    descriptionLabel.Font = Enum.Font.Gotham
    descriptionLabel.TextSize = 14
    descriptionLabel.TextWrapped = true
    descriptionLabel.TextXAlignment = Enum.TextXAlignment.Left
    descriptionLabel.AutomaticSize = Enum.AutomaticSize.Y
    descriptionLabel.Parent = paragraph
    
    -- Padding at the bottom
    local padding = Instance.new("UIPadding")
    padding.PaddingBottom = UDim.new(0, 10)
    padding.Parent = paragraph
    
    -- Return paragraph object with methods
    return {
        SetTitle = function(newTitle)
            titleLabel.Text = newTitle
        end,
        SetDescription = function(newDescription)
            descriptionLabel.Text = newDescription
        end,
        SetColor = function(newColor)
            paragraph.BackgroundColor3 = newColor
        end
    }
end

-- Notification system
function RayUI:Notify(title, message, duration)
    title = title or "Notification"
    message = message or ""
    duration = duration or 3
    
    -- Calculate text height
    local messageSize = calculateTextSize(message, Enum.Font.Gotham, 14, 220)
    local notifHeight = 45 + messageSize.Y
    
    -- Notification container
    local notification = Instance.new("Frame")
    notification.Name = "Notification"
    notification.Size = UDim2.new(0, 250, 0, notifHeight)
    notification.Position = UDim2.new(1, 20, 1, -20 - notifHeight)
    notification.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    notification.BorderSizePixel = 0
    notification.Parent = self.ScreenGui
    
    -- Notification corner
    local notifCorner = Instance.new("UICorner")
    notifCorner.CornerRadius = UDim.new(0, 6)
    notifCorner.Parent = notification
    
    -- Notification stroke
    local notifStroke = Instance.new("UIStroke")
    notifStroke.Color = Color3.fromRGB(60, 60, 100)
    notifStroke.Thickness = 1.5
    notifStroke.Parent = notification
    
    -- Title
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "Title"
    titleLabel.Size = UDim2.new(1, -20, 0, 25)
    titleLabel.Position = UDim2.new(0, 10, 0, 5)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = title
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.TextSize = 16
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Parent = notification
    
    -- Message
    local messageLabel = Instance.new("TextLabel")
    messageLabel.Name = "Message"
    messageLabel.Size = UDim2.new(1, -20, 0, messageSize.Y)
    messageLabel.Position = UDim2.new(0, 10, 0, 30)
    messageLabel.BackgroundTransparency = 1
    messageLabel.Text = message
    messageLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    messageLabel.Font = Enum.Font.Gotham
    messageLabel.TextSize = 14
    messageLabel.TextWrapped = true
    messageLabel.TextXAlignment = Enum.TextXAlignment.Left
    messageLabel.TextYAlignment = Enum.TextYAlignment.Top
    messageLabel.Parent = notification
    
    -- Animate in
    notification.Position = UDim2.new(1, 20, 1, -20 - notifHeight)
    createTween(notification, 0.5, {
        Position = UDim2.new(1, -270, 1, -20 - notifHeight)
    }, Enum.EasingStyle.Quart):Play()
    
    -- Animate out after duration
    delay(duration, function()
        local outTween = createTween(notification, 0.5, {
            Position = UDim2.new(1, 20, 1, -20 - notifHeight)
        }, Enum.EasingStyle.Quart, Enum.EasingDirection.In)
        outTween:Play()
        
        outTween.Completed:Connect(function()
            notification:Destroy()
        end)
    end)
end

return RayUI
