--[[
    Minimalist UI Library
    A clean, lightweight UI library with a focus on simplicity and functionality
]]

local MinimalistUI = {}
MinimalistUI.__index = MinimalistUI

-- Services
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local TextService = game:GetService("TextService")

-- Variables
local Player = Players.LocalPlayer
local Mouse = Player:GetMouse()
local useStudio = RunService:IsStudio()

-- Icon System
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
    
    local function updateDrag(input)
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
            updateDrag(input)
        end
    end)
end

local Themes = {
    Dark = {
        -- Main colors
        Primary = Color3.fromRGB(30, 30, 35),
        Secondary = Color3.fromRGB(40, 40, 45),
        Accent = Color3.fromRGB(100, 100, 255),
        LightAccent = Color3.fromRGB(60, 60, 70),
        DarkAccent = Color3.fromRGB(25, 25, 30),
        
        -- Text colors
        TextColor = Color3.fromRGB(240, 240, 240),
        SubTextColor = Color3.fromRGB(180, 180, 180),
        
        -- UI element colors
        Background = Color3.fromRGB(30, 30, 35),
        ButtonColor = Color3.fromRGB(50, 50, 55),
        ButtonHover = Color3.fromRGB(60, 60, 65),
        ButtonClick = Color3.fromRGB(45, 45, 50),
        ToggleOn = Color3.fromRGB(100, 100, 255),
        ToggleOff = Color3.fromRGB(60, 60, 70),
        SliderBackground = Color3.fromRGB(40, 40, 45),
        SliderFill = Color3.fromRGB(100, 100, 255),
        DropdownBackground = Color3.fromRGB(45, 45, 50),
        InputBackground = Color3.fromRGB(35, 35, 40),
        NotificationBackground = Color3.fromRGB(35, 35, 40)
    },
    Light = {
        -- Main colors
        Primary = Color3.fromRGB(240, 240, 245),
        Secondary = Color3.fromRGB(230, 230, 235),
        Accent = Color3.fromRGB(70, 70, 220),
        LightAccent = Color3.fromRGB(200, 200, 210),
        DarkAccent = Color3.fromRGB(220, 220, 225),
        
        -- Text colors
        TextColor = Color3.fromRGB(30, 30, 35),
        SubTextColor = Color3.fromRGB(100, 100, 110),
        
        -- UI element colors
        Background = Color3.fromRGB(240, 240, 245),
        ButtonColor = Color3.fromRGB(220, 220, 225),
        ButtonHover = Color3.fromRGB(210, 210, 215),
        ButtonClick = Color3.fromRGB(200, 200, 205),
        ToggleOn = Color3.fromRGB(70, 70, 220),
        ToggleOff = Color3.fromRGB(180, 180, 190),
        SliderBackground = Color3.fromRGB(200, 200, 210),
        SliderFill = Color3.fromRGB(70, 70, 220),
        DropdownBackground = Color3.fromRGB(225, 225, 230),
        InputBackground = Color3.fromRGB(215, 215, 220),
        NotificationBackground = Color3.fromRGB(235, 235, 240)
    },
    Discord = {
        -- Main colors
        Primary = Color3.fromRGB(54, 57, 63),
        Secondary = Color3.fromRGB(47, 49, 54),
        Accent = Color3.fromRGB(114, 137, 218),
        LightAccent = Color3.fromRGB(66, 69, 74),
        DarkAccent = Color3.fromRGB(41, 43, 47),
        
        -- Text colors
        TextColor = Color3.fromRGB(255, 255, 255),
        SubTextColor = Color3.fromRGB(185, 187, 190),
        
        -- UI element colors
        Background = Color3.fromRGB(54, 57, 63),
        ButtonColor = Color3.fromRGB(64, 68, 75),
        ButtonHover = Color3.fromRGB(71, 75, 82),
        ButtonClick = Color3.fromRGB(58, 62, 69),
        ToggleOn = Color3.fromRGB(114, 137, 218),
        ToggleOff = Color3.fromRGB(66, 69, 74),
        SliderBackground = Color3.fromRGB(66, 69, 74),
        SliderFill = Color3.fromRGB(114, 137, 218),
        DropdownBackground = Color3.fromRGB(64, 68, 75),
        InputBackground = Color3.fromRGB(48, 51, 57),
        NotificationBackground = Color3.fromRGB(47, 49, 54)
    },
    Spotify = {
        -- Main colors
        Primary = Color3.fromRGB(24, 24, 24),
        Secondary = Color3.fromRGB(18, 18, 18),
        Accent = Color3.fromRGB(30, 215, 96),
        LightAccent = Color3.fromRGB(40, 40, 40),
        DarkAccent = Color3.fromRGB(16, 16, 16),
        
        -- Text colors
        TextColor = Color3.fromRGB(255, 255, 255),
        SubTextColor = Color3.fromRGB(170, 170, 170),
        
        -- UI element colors
        Background = Color3.fromRGB(24, 24, 24),
        ButtonColor = Color3.fromRGB(40, 40, 40),
        ButtonHover = Color3.fromRGB(50, 50, 50),
        ButtonClick = Color3.fromRGB(35, 35, 35),
        ToggleOn = Color3.fromRGB(30, 215, 96),
        ToggleOff = Color3.fromRGB(80, 80, 80),
        SliderBackground = Color3.fromRGB(80, 80, 80),
        SliderFill = Color3.fromRGB(30, 215, 96),
        DropdownBackground = Color3.fromRGB(40, 40, 40),
        InputBackground = Color3.fromRGB(30, 30, 30),
        NotificationBackground = Color3.fromRGB(24, 24, 24)
    }
}

function MinimalistUI.new(config)
    local self = setmetatable({}, MinimalistUI)
    
    -- Default configuration
    config = config or {}
    self.Title = config.Title or "MinimalistUI"

    if typeof(config.Size) == "UDim2" then
        self.Size = config.Size
    else
        print("Invalid Size provided, using default")
        self.Size = UDim2.new(0, 600, 0, 400)
    end
    self.Subtitle = config.Subtitle or ""
    self.Size = config.Size or UDim2.new(0, 600, 0, 400)
    self.Position = config.Position or UDim2.new(0.5, -300, 0.5, -200)
    self.Draggable = config.Draggable ~= false
    self.Resizable = config.Resizable ~= false
    self.MinSize = config.MinSize or Vector2.new(400, 300)
    self.MaxSize = config.MaxSize or Vector2.new(800, 600)
    
    -- self.Theme initialization
    local ThemeName = config.Theme or "Dark"
    if self.ThemeName == "Adaptive" then
        -- Determine self.Theme based on system self.Theme
        local isDark = (settings().Studio.self.Theme == Enum.UIself.Theme.Dark)
        self.Theme = isDark and self.Themes.Dark or self.Themes.Light
    else
        -- Use specified self.Theme or default to Dark if invalid
        self.Theme = Themes[ThemeName] or Themes.Dark
    end
    
    -- Initialize other properties
    self.Tabs = {}
    self.ActiveTab = nil
    self.Minimized = false
    self.Visible = true
    self.SearchActive = false

    -- Create ScreenGui
    self.ScreenGui = Instance.new("ScreenGui")
    self.ScreenGui.Name = "MinimalistUI"
    self.ScreenGui.Parent = Player.PlayerGui
    self.ScreenGui.ResetOnSpawn = false
    self.ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    -- Create loading screen
    self:CreateLoadingScreen()
    
    -- Create main container
    self.MainFrame = Instance.new("Frame")
    self.MainFrame.Name = "MainFrame"
    self.MainFrame.Size = self.Size
    self.MainFrame.Position = self.Position  -- Changed from position to self.Position
    self.MainFrame.BackgroundColor3 = self.Theme.Background  -- Changed from self.Theme.Background to self.Theme.Background
    self.MainFrame.BorderSizePixel = 0
    self.MainFrame.Parent = self.ScreenGui
    self.MainFrame.Visible = false -- Hidden until loading is complete
    
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
    shadow.Parent = self.MainFrame
    
    -- Rounded corners
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 8)
    UICorner.Parent = self.MainFrame
    
-- UI Stroke
local UIStroke = Instance.new("UIStroke")
UIStroke.Color = self.Theme.Accent  -- Changed from self.Theme.Accent to self.Theme.Accent
UIStroke.Thickness = 1.5
UIStroke.Parent = self.MainFrame
    
-- Title bar
self.TitleBar = Instance.new("Frame")
self.TitleBar.Name = "TitleBar"
self.TitleBar.Size = UDim2.new(1, 0, 0, 40)
self.TitleBar.BackgroundColor3 = self.Theme.DarkAccent  -- Changed from self.Theme.DarkAccent
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
    bottomFix.BackgroundColor3 = self.Theme.DarkAccent
    bottomFix.BorderSizePixel = 0
    bottomFix.ZIndex = 0
    bottomFix.Parent = self.TitleBar
    
    -- Title text
    local titleText = Instance.new("TextLabel")
    titleText.Name = "TitleText"
    titleText.Size = UDim2.new(1, -150, 0, 20)
    titleText.Position = UDim2.new(0, 15, 0, 5)
    titleText.BackgroundTransparency = 1
    titleText.Text = self.Title
    titleText.TextColor3 = self.Theme.TextColor
    titleText.Font = Enum.Font.GothamBold
    titleText.TextSize = 16
    titleText.TextXAlignment = Enum.TextXAlignment.Left
    titleText.Parent = self.TitleBar
    
    -- Subtitle text
    local subtitleText = Instance.new("TextLabel")
    subtitleText.Name = "SubtitleText"
    subtitleText.Size = UDim2.new(1, -150, 0, 16)
    subtitleText.Position = UDim2.new(0, 15, 0, 22)
    subtitleText.BackgroundTransparency = 1
    subtitleText.Text = self.Subtitle
    subtitleText.TextColor3 = self.Theme.SubTextColor
    subtitleText.Font = Enum.Font.Gotham
    subtitleText.TextSize = 12
    subtitleText.TextXAlignment = Enum.TextXAlignment.Left
    subtitleText.Parent = self.TitleBar
    
    -- Search button
    self.SearchButton = Instance.new("ImageButton")
    self.SearchButton.Name = "SearchButton"
    self.SearchButton.Size = UDim2.new(0, 20, 0, 20)
    self.SearchButton.Position = UDim2.new(1, -100, 0.5, -10)
    self.SearchButton.BackgroundTransparency = 1
    self.SearchButton.Image = "rbxassetid://3926305904"
    self.SearchButton.ImageRectSize = Vector2.new(36, 36)
    self.SearchButton.ImageRectOffset = Vector2.new(964, 324)
    self.SearchButton.ImageColor3 = self.Theme.TextColor
    self.SearchButton.Parent = self.TitleBar
    
    -- Search box (hidden by default)
    self.SearchBox = Instance.new("Frame")
    self.SearchBox.Name = "SearchBox"
    self.SearchBox.Size = UDim2.new(1, -40, 0, 40)
    self.SearchBox.Position = UDim2.new(0, 20, 0, 40)
    self.SearchBox.BackgroundColor3 = self.Theme.Accent
    self.SearchBox.BorderSizePixel = 0
    self.SearchBox.Visible = false
    self.SearchBox.ZIndex = 10
    self.SearchBox.Parent = self.MainFrame
    
    local searchBoxCorner = Instance.new("UICorner")
    searchBoxCorner.CornerRadius = UDim.new(0, 6)
    searchBoxCorner.Parent = self.SearchBox
    
    local searchIcon = Instance.new("ImageLabel")
    searchIcon.Name = "SearchIcon"
    searchIcon.Size = UDim2.new(0, 16, 0, 16)
    searchIcon.Position = UDim2.new(0, 10, 0.5, -8)
    searchIcon.BackgroundTransparency = 1
    searchIcon.Image = "rbxassetid://3926305904"
    searchIcon.ImageRectSize = Vector2.new(36, 36)
    searchIcon.ImageRectOffset = Vector2.new(964, 324)
    searchIcon.ImageColor3 = self.Theme.SubTextColor
    searchIcon.ZIndex = 10
    searchIcon.Parent = self.SearchBox
    
    self.SearchInput = Instance.new("TextBox")
    self.SearchInput.Name = "SearchInput"
    self.SearchInput.Size = UDim2.new(1, -60, 1, -10)
    self.SearchInput.Position = UDim2.new(0, 35, 0, 5)
    self.SearchInput.BackgroundTransparency = 1
    self.SearchInput.Text = ""
    self.SearchInput.PlaceholderText = "Search..."
    self.SearchInput.TextColor3 = self.Theme.TextColor
    self.SearchInput.PlaceholderColor3 = self.Theme.SubTextColor
    self.SearchInput.Font = Enum.Font.Gotham
    self.SearchInput.TextSize = 14
    self.SearchInput.TextXAlignment = Enum.TextXAlignment.Left
    self.SearchInput.ClearTextOnFocus = false
    self.SearchInput.ZIndex = 10
    self.SearchInput.Parent = self.SearchBox
    
    local closeSearchButton = Instance.new("ImageButton")
    closeSearchButton.Name = "CloseSearchButton"
    closeSearchButton.Size = UDim2.new(0, 16, 0, 16)
    closeSearchButton.Position = UDim2.new(1, -25, 0.5, -8)
    closeSearchButton.BackgroundTransparency = 1
    closeSearchButton.Image = "rbxassetid://6031094678"
    closeSearchButton.ImageColor3 = self.Theme.SubTextColor
    closeSearchButton.ZIndex = 10
    closeSearchButton.Parent = self.SearchBox
    
    -- Minimize button
    self.MinimizeButton = Instance.new("ImageButton")
    self.MinimizeButton.Name = "MinimizeButton"
    self.MinimizeButton.Size = UDim2.new(0, 20, 0, 20)
    self.MinimizeButton.Position = UDim2.new(1, -70, 0.5, -10)
    self.MinimizeButton.BackgroundTransparency = 1
    self.MinimizeButton.Image = "rbxassetid://6026568240"
    self.MinimizeButton.ImageColor3 = self.Theme.TextColor
    self.MinimizeButton.Parent = self.TitleBar
    
    -- Close button
    self.CloseButton = Instance.new("ImageButton")
    self.CloseButton.Name = "CloseButton"
    self.CloseButton.Size = UDim2.new(0, 20, 0, 20)
    self.CloseButton.Position = UDim2.new(1, -30, 0.5, -10)
    self.CloseButton.BackgroundTransparency = 1
    self.CloseButton.Image = "rbxassetid://6031094678"
    self.CloseButton.ImageColor3 = self.Theme.TextColor
    self.CloseButton.Parent = self.TitleBar
    
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
    self.TabContainer.Size = UDim2.new(0, 150, 1, 0)
    self.TabContainer.BackgroundColor3 = self.Theme.Accent
    self.TabContainer.BorderSizePixel = 0
    self.TabContainer.Parent = self.ContentFrame
    
    local tabContainerCorner = Instance.new("UICorner")
    tabContainerCorner.CornerRadius = UDim.new(0, 8)
    tabContainerCorner.Parent = self.TabContainer
    
    -- Fix the right corners of tab container
    local rightFix = Instance.new("Frame")
    rightFix.Name = "RightFix"
    rightFix.Size = UDim2.new(0, 10, 1, 0)
    rightFix.Position = UDim2.new(1, -10, 0, 0)
    rightFix.BackgroundColor3 = self.Theme.Accent
    rightFix.BorderSizePixel = 0
    rightFix.Parent = self.TabContainer
    
    -- Tab scroll frame
    self.TabScroll = Instance.new("ScrollingFrame")
    self.TabScroll.Name = "TabScroll"
    self.TabScroll.Size = UDim2.new(1, 0, 1, 0)
    self.TabScroll.BackgroundTransparency = 1
    self.TabScroll.BorderSizePixel = 0
    self.TabScroll.ScrollBarThickness = 2
    self.TabScroll.ScrollBarImageColor3 = self.Theme.LightAccent
    self.TabScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
    self.TabScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
    self.TabScroll.Parent = self.TabContainer
    
    local tabListLayout = Instance.new("UIListLayout")
    tabListLayout.Name = "TabListLayout"
    tabListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    tabListLayout.Padding = UDim.new(0, 5)
    tabListLayout.Parent = self.TabScroll
    
    local tabPadding = Instance.new("UIPadding")
    tabPadding.Name = "TabPadding"
    tabPadding.PaddingTop = UDim.new(0, 10)
    tabPadding.PaddingLeft = UDim.new(0, 10)
    tabPadding.PaddingRight = UDim.new(0, 10)
    tabPadding.PaddingBottom = UDim.new(0, 10)
    tabPadding.Parent = self.TabScroll
    
    -- Content area
    self.ContentArea = Instance.new("Frame")
    self.ContentArea.Name = "ContentArea"
    self.ContentArea.Size = UDim2.new(1, -160, 1, -10)
    self.ContentArea.Position = UDim2.new(0, 155, 0, 5)
    self.ContentArea.BackgroundTransparency = 1
    self.ContentArea.Parent = self.ContentFrame
    
    -- Make UI draggable
    makeDraggable(self.MainFrame, self.TitleBar)
    
    -- Setup button interactions
    setupImageButtonHover(self.CloseButton, self.Theme.TextColor, Color3.fromRGB(255, 100, 100))
    setupImageButtonHover(self.MinimizeButton, self.Theme.TextColor, Color3.fromRGB(100, 200, 255))
    setupImageButtonHover(self.SearchButton, self.Theme.TextColor, Color3.fromRGB(100, 200, 255))
    setupImageButtonHover(closeSearchButton, self.Theme.SubTextColor, Color3.fromRGB(255, 100, 100))
    
    -- Button functionality
    self.CloseButton.MouseButton1Click:Connect(function()
        self:Destroy()
    end)
    
    self.MinimizeButton.MouseButton1Click:Connect(function()
        self:ToggleMinimize()
    end)
    
    self.SearchButton.MouseButton1Click:Connect(function()
        self:ToggleSearch()
    end)
    
    closeSearchButton.MouseButton1Click:Connect(function()
        self:ToggleSearch()
    end)
    
    self.SearchInput:GetPropertyChangedSignal("Text"):Connect(function()
        self:UpdateSearch(self.SearchInput.Text)
    end)
    
    return self
end

-- Create loading screen
function MinimalistUI:CreateLoadingScreen()
    local Theme = self.Theme
    
    -- Loading container
    self.LoadingFrame = Instance.new("Frame")
    self.LoadingFrame.Name = "LoadingFrame"
    self.LoadingFrame.Size = UDim2.new(0, 240, 0, 120)
    self.LoadingFrame.Position = UDim2.new(0.5, -120, 0.5, -60)
    self.LoadingFrame.BackgroundColor3 = self.Theme.Background
    self.LoadingFrame.BorderSizePixel = 0
    self.LoadingFrame.Parent = self.ScreenGui
    
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
    shadow.Parent = self.LoadingFrame
    
    -- Rounded corners
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 8)
    UICorner.Parent = self.LoadingFrame
    
    -- UI Stroke
    local UIStroke = Instance.new("UIStroke")
    UIStroke.Color = self.Theme.Accent
    UIStroke.Thickness = 1.5
    UIStroke.Parent = self.LoadingFrame
    
    -- Title text
    local titleText = Instance.new("TextLabel")
    titleText.Name = "TitleText"
    titleText.Size = UDim2.new(1, 0, 0, 30)
    titleText.Position = UDim2.new(0, 0, 0, 15)
    titleText.BackgroundTransparency = 1
    titleText.Text = self.Title
    titleText.TextColor3 = self.Theme.TextColor
    titleText.Font = Enum.Font.GothamBold
    titleText.TextSize = 18
    titleText.Parent = self.LoadingFrame
    
    -- Loading bar container
    local loadingBarContainer = Instance.new("Frame")
    loadingBarContainer.Name = "LoadingBarContainer"
    loadingBarContainer.Size = UDim2.new(0.8, 0, 0, 10)
    loadingBarContainer.Position = UDim2.new(0.1, 0, 0.5, 5)
    loadingBarContainer.BackgroundColor3 = self.Theme.Accent
    loadingBarContainer.BorderSizePixel = 0
    loadingBarContainer.Parent = self.LoadingFrame
    
    local loadingBarCorner = Instance.new("UICorner")
    loadingBarCorner.CornerRadius = UDim.new(0, 5)
    loadingBarCorner.Parent = loadingBarContainer
    
    -- Loading bar
    self.LoadingBar = Instance.new("Frame")
    self.LoadingBar.Name = "LoadingBar"
    self.LoadingBar.Size = UDim2.new(0, 0, 1, 0)
    self.LoadingBar.BackgroundColor3 = self.Theme.ToggleOn
    self.LoadingBar.BorderSizePixel = 0
    self.LoadingBar.Parent = loadingBarContainer
    
    local loadingFillCorner = Instance.new("UICorner")
    loadingFillCorner.CornerRadius = UDim.new(0, 5)
    loadingFillCorner.Parent = self.LoadingBar
    
    -- Loading text
    self.LoadingText = Instance.new("TextLabel")
    self.LoadingText.Name = "LoadingText"
    self.LoadingText.Size = UDim2.new(1, 0, 0, 20)
    self.LoadingText.Position = UDim2.new(0, 0, 0.7, 5)
    self.LoadingText.BackgroundTransparency = 1
    self.LoadingText.Text = "Loading..."
    self.LoadingText.TextColor3 = self.Theme.SubTextColor
    self.LoadingText.Font = Enum.Font.Gotham
    self.LoadingText.TextSize = 14
    self.LoadingText.Parent = self.LoadingFrame
end

-- Update loading progress
function MinimalistUI:UpdateLoading(progress, text)
    progress = math.clamp(progress, 0, 1)
    
    if text then
        self.LoadingText.Text = text
    end
    
    TweenService:Create(self.LoadingBar, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
        Size = UDim2.new(progress, 0, 1, 0)
    }):Play()
    
    if progress >= 1 then
        wait(0.5)
        TweenService:Create(self.LoadingFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quad), {
            Position = UDim2.new(0.5, -120, 0, -150)
        }):Play()
        
        wait(0.3)
        self.MainFrame.Visible = true
        TweenService:Create(self.MainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quad), {
            Position = self.Position
        }):Play()
        
        wait(0.5)
        self.LoadingFrame:Destroy()
    end
end

-- Toggle minimize
function MinimalistUI:ToggleMinimize()
    self.Minimized = not self.Minimized
    
    local targetSize, targetImage
    if self.Minimized then
        targetSize = UDim2.new(1, 0, 0, 40)
        targetImage = "rbxassetid://6031090990" -- Maximize icon
    else
        targetSize = self.Size
        targetImage = "rbxassetid://6026568240" -- Minimize icon
    end
    
    TweenService:Create(self.MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quart), {
        Size = targetSize
    }):Play()
    
    self.MinimizeButton.Image = targetImage
end

-- Toggle search
function MinimalistUI:ToggleSearch()
    self.SearchActive = not self.SearchActive
    self.SearchBox.Visible = self.SearchActive
    
    if self.SearchActive then
        self.SearchInput:CaptureFocus()
    else
        self.SearchInput.Text = ""
        self.SearchInput:ReleaseFocus()
    end
end

-- Update search results
function MinimalistUI:UpdateSearch(query)
    if query == "" then
        -- Reset all elements to visible
        for _, tab in pairs(self.Tabs) do
            for _, section in pairs(tab.Sections) do
                section.Frame.Visible = true
                
                for _, element in pairs(section.Elements) do
                    if element.Frame then
                        element.Frame.Visible = true
                    end
                end
            end
        end
        return
    end
    
    query = string.lower(query)
    
    -- Search through all elements
    for _, tab in pairs(self.Tabs) do
        for _, section in pairs(tab.Sections) do
            local sectionVisible = false
            
            -- Check if section title matches
            if string.find(string.lower(section.Title), query) then
                section.Frame.Visible = true
                sectionVisible = true
                
                -- Show all elements in this section
                for _, element in pairs(section.Elements) do
                    if element.Frame then
                        element.Frame.Visible = true
                    end
                end
            else
                -- Check each element in the section
                for _, element in pairs(section.Elements) do
                    local elementVisible = false
                    
                    -- Check element title
                    if element.Title and string.find(string.lower(element.Title), query) then
                        elementVisible = true
                    end
                    
                    -- Check element description
                    if element.Description and string.find(string.lower(element.Description), query) then
                        elementVisible = true
                    end
                    
                    -- Update element visibility
                    if element.Frame then
                        element.Frame.Visible = elementVisible
                    end
                    
                    -- If any element is visible, section should be visible
                    if elementVisible then
                        sectionVisible = true
                    end
                end
            end
            
            -- Update section visibility
            section.Frame.Visible = sectionVisible
        end
    end
end

function MinimalistUI:CreateTab(title, icon)
    -- Ensure ContentArea exists
    if not self.ContentArea then
        warn("ContentArea not initialized. Creating it now.")
        self.ContentArea = Instance.new("Frame")
        self.ContentArea.Name = "ContentArea"
        self.ContentArea.Size = UDim2.new(1, -150, 1, -50)
        self.ContentArea.Position = UDim2.new(0, 150, 0, 50)
        self.ContentArea.BackgroundTransparency = 1
        self.ContentArea.Parent = self.MainFrame
    end
    
    local tabIndex = #self.Tabs + 1
    
    -- Create tab button
    local tabButton = Instance.new("TextButton")
    tabButton.Name = "Tab_" .. title
    tabButton.Size = UDim2.new(1, 0, 0, 36)
    tabButton.Position = UDim2.new(0, 0, 0, (tabIndex - 1) * 36)
    tabButton.BackgroundTransparency = 1
    tabButton.Text = ""
    tabButton.Parent = self.TabContainer -- Make sure TabContainer exists
    
    -- Tab icon (if provided)
    local tabIcon
    if icon then
        tabIcon = Instance.new("ImageLabel")
        tabIcon.Name = "TabIcon"
        tabIcon.Size = UDim2.new(0, 20, 0, 20)
        tabIcon.Position = UDim2.new(0, 8, 0.5, -10)
        tabIcon.BackgroundTransparency = 1
        tabIcon.Image = "rbxassetid://" .. icon -- Make sure icon is a valid asset ID
        tabIcon.Parent = tabButton
    end
    
    -- Tab text
    local tabText = Instance.new("TextLabel")
    tabText.Name = "TabText"
    tabText.Size = UDim2.new(1, icon and -36 or -16, 1, 0)
    tabText.Position = UDim2.new(0, icon and 36 or 8, 0, 0)
    tabText.BackgroundTransparency = 1
    tabText.Text = title
    tabText.TextColor3 = self.Theme.TextColor
    tabText.Font = Enum.Font.Gotham
    tabText.TextSize = 14
    tabText.TextXAlignment = Enum.TextXAlignment.Left
    tabText.Parent = tabButton
    
    -- Tab indicator
    local tabIndicator = Instance.new("Frame")
    tabIndicator.Name = "TabIndicator"
    tabIndicator.Size = UDim2.new(0, 3, 0, 20)
    tabIndicator.Position = UDim2.new(0, 0, 0.5, -10)
    tabIndicator.BackgroundColor3 = self.Theme.ToggleOn
    tabIndicator.BorderSizePixel = 0
    tabIndicator.Visible = false
    tabIndicator.Parent = tabButton
    
    local indicatorCorner = Instance.new("UICorner")
    indicatorCorner.CornerRadius = UDim.new(0, 2)
    indicatorCorner.Parent = tabIndicator
    
    -- Tab content container
    local tabContainer = Instance.new("ScrollingFrame")
    tabContainer.Name = "TabContainer_" .. title
    tabContainer.Size = UDim2.new(1, 0, 1, 0)
    tabContainer.BackgroundTransparency = 1
    tabContainer.BorderSizePixel = 0
    tabContainer.ScrollBarThickness = 4
    tabContainer.ScrollBarImageColor3 = self.Theme.LightAccent
    tabContainer.CanvasSize = UDim2.new(0, 0, 0, 0)
    tabContainer.AutomaticCanvasSize = Enum.AutomaticSize.Y
    tabContainer.Visible = false
    tabContainer.Parent = self.ContentArea
    
    local contentListLayout = Instance.new("UIListLayout")
    contentListLayout.Name = "ContentListLayout"
    contentListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    contentListLayout.Padding = UDim.new(0, 10)
    contentListLayout.Parent = tabContainer
    
    local contentPadding = Instance.new("UIPadding")
    contentPadding.Name = "ContentPadding"
    contentPadding.PaddingTop = UDim.new(0, 5)
    contentPadding.PaddingLeft = UDim.new(0, 5)
    contentPadding.PaddingRight = UDim.new(0, 5)
    contentPadding.PaddingBottom = UDim.new(0, 5)
    contentPadding.Parent = tabContainer
    
    -- Create tab object
    local tab = {
        Title = title,
        Button = tabButton,
        Container = tabContainer,
        Indicator = tabIndicator,
        Icon = tabIcon,
        Sections = {},
        Index = tabIndex
    }
    
    -- Tab button functionality
    tabButton.MouseButton1Click:Connect(function()
        self:SelectTab(tab)
    end)
    
    -- Add hover effect
    tabButton.MouseEnter:Connect(function()
        if self.ActiveTab ~= tab then
            TweenService:Create(tabButton, TweenInfo.new(0.2), {
                BackgroundTransparency = 0.8
            }):Play()
        end
    end)
    
    tabButton.MouseLeave:Connect(function()
        if self.ActiveTab ~= tab then
            TweenService:Create(tabButton, TweenInfo.new(0.2), {
                BackgroundTransparency = 1
            }):Play()
        end
    end)
    
    -- Add tab to tabs table
    table.insert(self.Tabs, tab)
    
    -- If this is the first tab, select it
    if #self.Tabs == 1 then
        self:SelectTab(tab)
    end
    
    -- Return tab object with methods
    return setmetatable({
        -- Create a section within this tab
        CreateSection = function(_, sectionTitle)
            return self:CreateSection(tab, sectionTitle)
        end
    }, {
        __index = tab
    })
end

-- Select a tab
function MinimalistUI:SelectTab(tab)
    if not tab then
        warn("Attempted to select nil tab")
        return
    end
    
    if not tab.Indicator then
        warn("Tab has no Indicator property")
        return
    end
    
    if not tab.Container then
        warn("Tab has no Container property")
        return
    end
    
    if not tab.Button then
        warn("Tab has no Button property")
        return
    end
    
    -- Deselect current tab
    if self.ActiveTab then
        if self.ActiveTab.Indicator then
            self.ActiveTab.Indicator.Visible = false
        end
        
        if self.ActiveTab.Container then
            self.ActiveTab.Container.Visible = false
        end
        
        if self.ActiveTab.Button then
            TweenService:Create(self.ActiveTab.Button, TweenInfo.new(0.2), {
                BackgroundTransparency = 1
            }):Play()
        end
    end
    
    -- Select new tab
    self.ActiveTab = tab
    tab.Indicator.Visible = true
    tab.Container.Visible = true
    
    TweenService:Create(tab.Button, TweenInfo.new(0.2), {
        BackgroundTransparency = 0.5
    }):Play()
end

-- Create a section
function MinimalistUI:CreateSection(tab, title)
    local Theme = self.Theme
    local sectionIndex = #tab.Sections + 1
    
    -- Section container
    local sectionFrame = Instance.new("Frame")
    sectionFrame.Name = "Section_" .. title
    sectionFrame.Size = UDim2.new(1, -10, 0, 40) -- Will be resized based on content
    sectionFrame.BackgroundColor3 = self.Theme.Accent
    sectionFrame.BorderSizePixel = 0
    sectionFrame.AutomaticSize = Enum.AutomaticSize.Y
    sectionFrame.Parent = tab.Container
    
    local sectionCorner = Instance.new("UICorner")
    sectionCorner.CornerRadius = UDim.new(0, 6)
    sectionCorner.Parent = sectionFrame
    
    -- Section title
    local sectionTitle = Instance.new("TextLabel")
    sectionTitle.Name = "SectionTitle"
    sectionTitle.Size = UDim2.new(1, -20, 0, 30)
    sectionTitle.Position = UDim2.new(0, 10, 0, 5)
    sectionTitle.BackgroundTransparency = 1
    sectionTitle.Text = title
    sectionTitle.TextColor3 = self.Theme.TextColor
    sectionTitle.Font = Enum.Font.GothamBold
    sectionTitle.TextSize = 14
    sectionTitle.TextXAlignment = Enum.TextXAlignment.Left
    sectionTitle.Parent = sectionFrame
    
    -- Section content
    local sectionContent = Instance.new("Frame")
    sectionContent.Name = "SectionContent"
    sectionContent.Size = UDim2.new(1, -20, 0, 0)
    sectionContent.Position = UDim2.new(0, 10, 0, 35)
    sectionContent.BackgroundTransparency = 1
    sectionContent.AutomaticSize = Enum.AutomaticSize.Y
    sectionContent.Parent = sectionFrame
    
    local contentListLayout = Instance.new("UIListLayout")
    contentListLayout.Name = "ContentListLayout"
    contentListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    contentListLayout.Padding = UDim.new(0, 8)
    contentListLayout.Parent = sectionContent
    
    -- Add padding at the bottom
    local bottomPadding = Instance.new("Frame")
    bottomPadding.Name = "BottomPadding"
    bottomPadding.Size = UDim2.new(1, 0, 0, 5)
    bottomPadding.BackgroundTransparency = 1
    bottomPadding.LayoutOrder = 999999 -- Ensure it's at the bottom
    bottomPadding.Parent = sectionContent
    
    -- Create section object
    local section = {
        Title = title,
        Frame = sectionFrame,
        Content = sectionContent,
        Elements = {},
        Index = sectionIndex
    }
    
    -- Add section to tab's sections table
    table.insert(tab.Sections, section)
    
    -- Return section object with methods
    return setmetatable({
        -- Create a button
        CreateButton = function(_, buttonConfig)
            return self:CreateButton(section, buttonConfig)
        end,
        
        -- Create a toggle
        CreateToggle = function(_, toggleConfig)
            return self:CreateToggle(section, toggleConfig)
        end,
        
        -- Create a slider
        CreateSlider = function(_, sliderConfig)
            return self:CreateSlider(section, sliderConfig)
        end,
        
        -- Create a dropdown
        CreateDropdown = function(_, dropdownConfig)
            return self:CreateDropdown(section, dropdownConfig)
        end,
        
        -- Create a label
        CreateLabel = function(_, labelConfig)
            return self:CreateLabel(section, labelConfig)
        end,
        
        -- Create a paragraph
        CreateParagraph = function(_, paragraphConfig)
            return self:CreateParagraph(section, paragraphConfig)
        end,
        
        -- Create a divider
        CreateDivider = function(_)
            return self:CreateDivider(section)
        end
    }, {
        __index = section
    })
end

-- Create a button
function MinimalistUI:CreateButton(section, config)
    local Theme = self.Theme
    local title = config.Title or "Button"
    local description = config.Description
    local icon = config.Icon
    local callback = config.Callback or function() end
    
    -- Button container
    local buttonFrame = Instance.new("Frame")
    buttonFrame.Name = "Button_" .. title
    buttonFrame.Size = UDim2.new(1, 0, 0, description and 60 or 36)
    buttonFrame.BackgroundTransparency = 1
    buttonFrame.LayoutOrder = #section.Elements
    buttonFrame.Parent = section.Content
    
    -- Button
    local button = Instance.new("TextButton")
    button.Name = "Button"
    button.Size = UDim2.new(1, 0, 0, 36)
    button.BackgroundColor3 = self.Theme.ButtonColor
    button.Text = ""
    button.AutoButtonColor = false
    button.ClipsDescendants = true
    button.Parent = buttonFrame
    
    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0, 6)
    buttonCorner.Parent = button
    
    local buttonStroke = Instance.new("UIStroke")
    buttonStroke.Color = self.Theme.LightAccent
    buttonStroke.Thickness = 1
    buttonStroke.Parent = button
    
    -- Button gradient
    local buttonGradient = Instance.new("UIGradient")
    buttonGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(220, 220, 220))
    })
    buttonGradient.Rotation = 90
    buttonGradient.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.94),
        NumberSequenceKeypoint.new(1, 0.96)
    })
    buttonGradient.Parent = button
    
    -- Button icon
    local buttonIcon
    if icon then
        buttonIcon = Instance.new("ImageLabel")
        buttonIcon.Name = "ButtonIcon"
        buttonIcon.Size = UDim2.new(0, 20, 0, 20)
        buttonIcon.Position = UDim2.new(0, 8, 0.5, -10)
        buttonIcon.BackgroundTransparency = 1
        
        if typeof(icon) == "string" then
            -- Use Lucide icon
            local iconData = getIcon(icon)
            buttonIcon.Image = "rbxassetid://" .. iconData.id
            buttonIcon.ImageRectSize = iconData.imageRectSize
            buttonIcon.ImageRectOffset = iconData.imageRectOffset
        else
            -- Use custom icon
            buttonIcon.Image = icon
        end
        
        buttonIcon.ImageColor3 = self.Theme.TextColor
        buttonIcon.Parent = button
    end
    
    -- Button text
    local buttonText = Instance.new("TextLabel")
    buttonText.Name = "ButtonText"
    buttonText.Size = UDim2.new(1, icon and -36 or -16, 1, 0)
    buttonText.Position = UDim2.new(0, icon and 36 or 8, 0, 0)
    buttonText.BackgroundTransparency = 1
    buttonText.Text = title
    buttonText.TextColor3 = self.Theme.TextColor
    buttonText.Font = Enum.Font.GothamSemibold
    buttonText.TextSize = 14
    buttonText.TextXAlignment = Enum.TextXAlignment.Left
    buttonText.Parent = button
    
    -- Description (if provided)
    if description then
        local descriptionText = Instance.new("TextLabel")
        descriptionText.Name = "Description"
        descriptionText.Size = UDim2.new(1, 0, 0, 20)
        descriptionText.Position = UDim2.new(0, 0, 0, 40)
        descriptionText.BackgroundTransparency = 1
        descriptionText.Text = description
        descriptionText.TextColor3 = self.Theme.SubTextColor
        descriptionText.Font = Enum.Font.Gotham
        descriptionText.TextSize = 12
        descriptionText.TextWrapped = true
        descriptionText.TextXAlignment = Enum.TextXAlignment.Left
        descriptionText.Parent = buttonFrame
    end
    
    -- Button functionality
    setupButtonHover(button, self.Theme.ButtonColor, self.Theme.ButtonHover, self.Theme.ButtonClick)
    
    button.MouseButton1Click:Connect(function()
        createRipple(button)
        callback()
    end)
    
    -- Create button object
    local buttonObj = {
        Title = title,
        Description = description,
        Frame = buttonFrame,
        Button = button,
        Icon = buttonIcon,
        Callback = callback
    }
    
    -- Add to section elements
    table.insert(section.Elements, buttonObj)
    
    -- Return button object with methods
    return setmetatable({
        -- Update button text
        SetText = function(_, newText)
            buttonText.Text = newText
            buttonObj.Title = newText
        end,
        
        -- Update button callback
        SetCallback = function(_, newCallback)
            buttonObj.Callback = newCallback
            callback = newCallback
        end,
        
        -- Trigger button click
        Click = function(_)
            callback()
        end
    }, {
        __index = buttonObj
    })
end

-- Create a toggle
function MinimalistUI:CreateToggle(section, config)
    local Theme = self.Theme
    local title = config.Title or "Toggle"
    local description = config.Description
    local default = config.Default or false
    local callback = config.Callback or function() end
    
    -- Toggle container
    local toggleFrame = Instance.new("Frame")
    toggleFrame.Name = "Toggle_" .. title
    toggleFrame.Size = UDim2.new(1, 0, 0, description and 60 or 36)
    toggleFrame.BackgroundTransparency = 1
    toggleFrame.LayoutOrder = #section.Elements
    toggleFrame.Parent = section.Content
    
    -- Toggle button
    local toggleButton = Instance.new("TextButton")
    toggleButton.Name = "ToggleButton"
    toggleButton.Size = UDim2.new(1, 0, 0, 36)
    toggleButton.BackgroundColor3 = self.Theme.ButtonColor
    toggleButton.BackgroundTransparency = 0.9
    toggleButton.Text = ""
    toggleButton.AutoButtonColor = false
    toggleButton.Parent = toggleFrame
    
    local toggleCorner = Instance.new("UICorner")
    toggleCorner.CornerRadius = UDim.new(0, 6)
    toggleCorner.Parent = toggleButton
    
    -- Toggle text
    local toggleText = Instance.new("TextLabel")
    toggleText.Name = "ToggleText"
    toggleText.Size = UDim2.new(1, -60, 1, 0)
    toggleText.Position = UDim2.new(0, 8, 0, 0)
    toggleText.BackgroundTransparency = 1
    toggleText.Text = title
    toggleText.TextColor3 = self.Theme.TextColor
    toggleText.Font = Enum.Font.GothamSemibold
    toggleText.TextSize = 14
    toggleText.TextXAlignment = Enum.TextXAlignment.Left
    toggleText.Parent = toggleButton
    
    -- Toggle switch background
    local toggleBackground = Instance.new("Frame")
    toggleBackground.Name = "ToggleBackground"
    toggleBackground.Size = UDim2.new(0, 40, 0, 20)
    toggleBackground.Position = UDim2.new(1, -48, 0.5, -10)
    toggleBackground.BackgroundColor3 = self.Theme.ToggleOff
    toggleBackground.BorderSizePixel = 0
    toggleBackground.Parent = toggleButton
    
    local backgroundCorner = Instance.new("UICorner")
    backgroundCorner.CornerRadius = UDim.new(1, 0)
    backgroundCorner.Parent = toggleBackground
    
    -- Toggle switch indicator
    local toggleIndicator = Instance.new("Frame")
    toggleIndicator.Name = "ToggleIndicator"
    toggleIndicator.Size = UDim2.new(0, 16, 0, 16)
    toggleIndicator.Position = UDim2.new(0, 2, 0.5, -8)
    toggleIndicator.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    toggleIndicator.BorderSizePixel = 0
    toggleIndicator.Parent = toggleBackground
    
    local indicatorCorner = Instance.new("UICorner")
    indicatorCorner.CornerRadius = UDim.new(1, 0)
    indicatorCorner.Parent = toggleIndicator
    
    -- Description (if provided)
    if description then
        local descriptionText = Instance.new("TextLabel")
        descriptionText.Name = "Description"
        descriptionText.Size = UDim2.new(1, 0, 0, 20)
        descriptionText.Position = UDim2.new(0, 0, 0, 40)
        descriptionText.BackgroundTransparency = 1
        descriptionText.Text = description
        descriptionText.TextColor3 = self.Theme.SubTextColor
        descriptionText.Font = Enum.Font.Gotham
        descriptionText.TextSize = 12
        descriptionText.TextWrapped = true
        descriptionText.TextXAlignment = Enum.TextXAlignment.Left
        descriptionText.Parent = toggleFrame
    end
    
    -- Toggle state
    local enabled = default
    
    -- Function to update toggle state
    local function updateToggle(value)
        enabled = value
        
        local targetColor = enabled and self.Theme.ToggleOn or self.Theme.ToggleOff
        local targetPosition = enabled and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 2, 0.5, -8)
        
        TweenService:Create(toggleBackground, TweenInfo.new(0.2), {
            BackgroundColor3 = targetColor
        }):Play()
        
        TweenService:Create(toggleIndicator, TweenInfo.new(0.2), {
            Position = targetPosition
        }):Play()
        
        callback(enabled)
    end
    
    -- Set initial state
    updateToggle(enabled)
    
    -- Toggle functionality
    toggleButton.MouseButton1Click:Connect(function()
        updateToggle(not enabled)
    end)
    
    -- Hover effect
    toggleButton.MouseEnter:Connect(function()
        TweenService:Create(toggleButton, TweenInfo.new(0.2), {
            BackgroundTransparency = 0.8
        }):Play()
    end)
    
    toggleButton.MouseLeave:Connect(function()
        TweenService:Create(toggleButton, TweenInfo.new(0.2), {
            BackgroundTransparency = 0.9
        }):Play()
    end)
    
    -- Create toggle object
    local toggleObj = {
        Title = title,
        Description = description,
        Frame = toggleFrame,
        Button = toggleButton,
        Enabled = enabled,
        Callback = callback
    }
    
    -- Add to section elements
    table.insert(section.Elements, toggleObj)
    
    -- Return toggle object with methods
    return setmetatable({
        -- Get toggle state
        GetState = function(_)
            return enabled
        end,
        
        -- Set toggle state
        SetState = function(_, value)
            updateToggle(value)
        end,
        
        -- Toggle the state
        Toggle = function(_)
            updateToggle(not enabled)
        end,
        
        -- Update toggle callback
        SetCallback = function(_, newCallback)
            toggleObj.Callback = newCallback
            callback = newCallback
        end
    }, {
        __index = toggleObj
    })
end

-- Create a slider
function MinimalistUI:CreateSlider(section, config)
    local Theme = self.Theme
    local title = config.Title or "Slider"
    local description = config.Description
    local min = config.Min or 0
    local max = config.Max or 100
    local default = math.clamp(config.Default or min, min, max)
    local increment = config.Increment or 1
    local suffix = config.Suffix or ""
    local callback = config.Callback or function() end
    
    -- Slider container
    local sliderFrame = Instance.new("Frame")
    sliderFrame.Name = "Slider_" .. title
    sliderFrame.Size = UDim2.new(1, 0, 0, description and 80 or 56)
    sliderFrame.BackgroundTransparency = 1
    sliderFrame.LayoutOrder = #section.Elements
    sliderFrame.Parent = section.Content
    
    -- Slider title
    local sliderTitle = Instance.new("TextLabel")
    sliderTitle.Name = "SliderTitle"
    sliderTitle.Size = UDim2.new(1, 0, 0, 20)
    sliderTitle.BackgroundTransparency = 1
    sliderTitle.Text = title
    sliderTitle.TextColor3 = self.Theme.TextColor
    sliderTitle.Font = Enum.Font.GothamSemibold
    sliderTitle.TextSize = 14
    sliderTitle.TextXAlignment = Enum.TextXAlignment.Left
    sliderTitle.Parent = sliderFrame
    
    -- Slider value display
    local valueDisplay = Instance.new("TextLabel")
    valueDisplay.Name = "ValueDisplay"
    valueDisplay.Size = UDim2.new(0, 50, 0, 20)
    valueDisplay.Position = UDim2.new(1, -50, 0, 0)
    valueDisplay.BackgroundTransparency = 1
    valueDisplay.Text = tostring(default) .. suffix
    valueDisplay.TextColor3 = self.Theme.SubTextColor
    valueDisplay.Font = Enum.Font.Gotham
    valueDisplay.TextSize = 14
    valueDisplay.TextXAlignment = Enum.TextXAlignment.Right
    valueDisplay.Parent = sliderFrame
    
    -- Slider background
    local sliderBackground = Instance.new("Frame")
    sliderBackground.Name = "SliderBackground"
    sliderBackground.Size = UDim2.new(1, 0, 0, 8)
    sliderBackground.Position = UDim2.new(0, 0, 0, 30)
    sliderBackground.BackgroundColor3 = self.Theme.SliderBackground
    sliderBackground.BorderSizePixel = 0
    sliderBackground.Parent = sliderFrame
    
    local backgroundCorner = Instance.new("UICorner")
    backgroundCorner.CornerRadius = UDim.new(1, 0)
    backgroundCorner.Parent = sliderBackground
    
    -- Slider fill
    local sliderFill = Instance.new("Frame")
    sliderFill.Name = "SliderFill"
    sliderFill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
    sliderFill.BackgroundColor3 = self.Theme.SliderFill
    sliderFill.BorderSizePixel = 0
    sliderFill.Parent = sliderBackground
    
    local fillCorner = Instance.new("UICorner")
    fillCorner.CornerRadius = UDim.new(1, 0)
    fillCorner.Parent = sliderFill
    
    -- Slider knob
    local sliderKnob = Instance.new("Frame")
    sliderKnob.Name = "SliderKnob"
    sliderKnob.Size = UDim2.new(0, 16, 0, 16)
    sliderKnob.Position = UDim2.new((default - min) / (max - min), -8, 0.5, -8)
    sliderKnob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    sliderKnob.BorderSizePixel = 0
    sliderKnob.ZIndex = 2
    sliderKnob.Parent = sliderBackground
    
    local knobCorner = Instance.new("UICorner")
    knobCorner.CornerRadius = UDim.new(1, 0)
    knobCorner.Parent = sliderKnob
    
    -- Slider input area (larger area for better interaction)
    local sliderInput = Instance.new("TextButton")
    sliderInput.Name = "SliderInput"
    sliderInput.Size = UDim2.new(1, 0, 0, 20)
    sliderInput.Position = UDim2.new(0, 0, 0, 24)
    sliderInput.BackgroundTransparency = 1
    sliderInput.Text = ""
    sliderInput.Parent = sliderFrame
    
    -- Description (if provided)
    if description then
        local descriptionText = Instance.new("TextLabel")
        descriptionText.Name = "Description"
        descriptionText.Size = UDim2.new(1, 0, 0, 20)
        descriptionText.Position = UDim2.new(0, 0, 0, 45)
        descriptionText.BackgroundTransparency = 1
        descriptionText.Text = description
        descriptionText.TextColor3 = self.Theme.SubTextColor
        descriptionText.Font = Enum.Font.Gotham
        descriptionText.TextSize = 12
        descriptionText.TextWrapped = true
        descriptionText.TextXAlignment = Enum.TextXAlignment.Left
        descriptionText.Parent = sliderFrame
    end
    
    -- Current value
    local value = default
    
    -- Function to update slider
    local function updateSlider(newValue)
        -- Clamp and round to increment
        newValue = math.clamp(newValue, min, max)
        newValue = min + (math.round((newValue - min) / increment) * increment)
        
        -- Fix floating point precision issues
        newValue = math.floor(newValue * 1000) / 1000
        
        -- Update value
        value = newValue
        
        -- Calculate position
        local percent = (value - min) / (max - min)
        
        -- Update UI
        sliderFill.Size = UDim2.new(percent, 0, 1, 0)
        sliderKnob.Position = UDim2.new(percent, -8, 0.5, -8)
        valueDisplay.Text = tostring(value) .. suffix
        
        -- Call callback
        callback(value)
    end
    
    -- Slider functionality
    local dragging = false
    
    sliderInput.MouseButton1Down:Connect(function()
        dragging = true
        
        -- Get initial position
        local position = UserInputService:GetMouseLocation().X
        local sliderPosition = sliderBackground.AbsolutePosition.X
        local sliderSize = sliderBackground.AbsoluteSize.X
        
        -- Calculate value
        local percent = math.clamp((position - sliderPosition) / sliderSize, 0, 1)
        local newValue = min + ((max - min) * percent)
        
        updateSlider(newValue)
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            -- Get position
            local position = UserInputService:GetMouseLocation().X
            local sliderPosition = sliderBackground.AbsolutePosition.X
            local sliderSize = sliderBackground.AbsoluteSize.X
            
            -- Calculate value
            local percent = math.clamp((position - sliderPosition) / sliderSize, 0, 1)
            local newValue = min + ((max - min) * percent)
            
            updateSlider(newValue)
        end
    end)
    
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    
    -- Create slider object
    local sliderObj = {
        Title = title,
        Description = description,
        Frame = sliderFrame,
        Min = min,
        Max = max,
        Value = value,
        Callback = callback
    }
    
    -- Add to section elements
    table.insert(section.Elements, sliderObj)
    
    -- Return slider object with methods
    return setmetatable({
        -- Get slider value
        GetValue = function(_)
            return value
        end,
        
        -- Set slider value
        SetValue = function(_, newValue)
            updateSlider(newValue)
        end,
        
        -- Update slider range
        SetRange = function(_, newMin, newMax)
            min = newMin
            max = newMax
            updateSlider(math.clamp(value, min, max))
        end,
        
        -- Update slider callback
        SetCallback = function(_, newCallback)
            sliderObj.Callback = newCallback
            callback = newCallback
        end
    }, {
        __index = sliderObj
    })
end

-- Create a dropdown
function MinimalistUI:CreateDropdown(section, config)
    local Theme = self.Theme
    local title = config.Title or "Dropdown"
    local description = config.Description
    local options = config.Options or {}
    local default = config.Default
    local multi = config.Multi or false
    local searchEnabled = config.Search or false
    local callback = config.Callback or function() end
    
    -- Dropdown container
    local dropdownFrame = Instance.new("Frame")
    dropdownFrame.Name = "Dropdown_" .. title
    dropdownFrame.Size = UDim2.new(1, 0, 0, description and 80 or 56)
    dropdownFrame.BackgroundTransparency = 1
    dropdownFrame.LayoutOrder = #section.Elements
    dropdownFrame.Parent = section.Content
    
    -- Dropdown title
    local dropdownTitle = Instance.new("TextLabel")
    dropdownTitle.Name = "DropdownTitle"
    dropdownTitle.Size = UDim2.new(1, 0, 0, 20)
    dropdownTitle.BackgroundTransparency = 1
    dropdownTitle.Text = title
    dropdownTitle.TextColor3 = self.Theme.TextColor
    dropdownTitle.Font = Enum.Font.GothamSemibold
    dropdownTitle.TextSize = 14
    dropdownTitle.TextXAlignment = Enum.TextXAlignment.Left
    dropdownTitle.Parent = dropdownFrame
    
    -- Dropdown button
    local dropdownButton = Instance.new("TextButton")
    dropdownButton.Name = "DropdownButton"
    dropdownButton.Size = UDim2.new(1, 0, 0, 36)
    dropdownButton.Position = UDim2.new(0, 0, 0, 24)
    dropdownButton.BackgroundColor3 = self.Theme.DropdownBackground
    dropdownButton.Text = ""
    dropdownButton.AutoButtonColor = false
    dropdownButton.Parent = dropdownFrame
    
    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0, 6)
    buttonCorner.Parent = dropdownButton
    
    local buttonStroke = Instance.new("UIStroke")
    buttonStroke.Color = self.Theme.LightAccent
    buttonStroke.Thickness = 1
    buttonStroke.Parent = dropdownButton
    
    -- Selected value text
    local selectedText = Instance.new("TextLabel")
    selectedText.Name = "SelectedText"
    selectedText.Size = UDim2.new(1, -40, 1, 0)
    selectedText.Position = UDim2.new(0, 10, 0, 0)
    selectedText.BackgroundTransparency = 1
    selectedText.Text = multi and "Select options..." or "Select an option..."
    selectedText.TextColor3 = self.Theme.SubTextColor
    selectedText.Font = Enum.Font.Gotham
    selectedText.TextSize = 14
    selectedText.TextXAlignment = Enum.TextXAlignment.Left
    selectedText.TextTruncate = Enum.TextTruncate.AtEnd
    selectedText.Parent = dropdownButton
    
    -- Dropdown arrow
    local dropdownArrow = Instance.new("ImageLabel")
    dropdownArrow.Name = "DropdownArrow"
    dropdownArrow.Size = UDim2.new(0, 16, 0, 16)
    dropdownArrow.Position = UDim2.new(1, -26, 0.5, -8)
    dropdownArrow.BackgroundTransparency = 1
    dropdownArrow.Image = "rbxassetid://6031091004"
    dropdownArrow.ImageColor3 = self.Theme.TextColor
    dropdownArrow.Parent = dropdownButton
    
    -- Description (if provided)
    if description then
        local descriptionText = Instance.new("TextLabel")
        descriptionText.Name = "Description"
        descriptionText.Size = UDim2.new(1, 0, 0, 20)
        descriptionText.Position = UDim2.new(0, 0, 0, 64)
        descriptionText.BackgroundTransparency = 1
        descriptionText.Text = description
        descriptionText.TextColor3 = self.Theme.SubTextColor
        descriptionText.Font = Enum.Font.Gotham
        descriptionText.TextSize = 12
        descriptionText.TextWrapped = true
        descriptionText.TextXAlignment = Enum.TextXAlignment.Left
        descriptionText.Parent = dropdownFrame
    end
    
    -- Dropdown menu
    local dropdownMenu = Instance.new("Frame")
    dropdownMenu.Name = "DropdownMenu"
    dropdownMenu.Size = UDim2.new(1, 0, 0, 0)
    dropdownMenu.Position = UDim2.new(0, 0, 1, 4)
    dropdownMenu.BackgroundColor3 = self.Theme.DropdownBackground
    dropdownMenu.BorderSizePixel = 0
    dropdownMenu.ClipsDescendants = true
    dropdownMenu.Visible = false
    dropdownMenu.ZIndex = 10
    dropdownMenu.Parent = dropdownButton
    
    local menuCorner = Instance.new("UICorner")
    menuCorner.CornerRadius = UDim.new(0, 6)
    menuCorner.Parent = dropdownMenu
    
    local menuStroke = Instance.new("UIStroke")
    menuStroke.Color = self.Theme.LightAccent
    menuStroke.Thickness = 1
    menuStroke.Parent = dropdownMenu
    
    -- Search box (if enabled)
    local searchBox
    if searchEnabled then
        searchBox = Instance.new("TextBox")
        searchBox.Name = "SearchBox"
        searchBox.Size = UDim2.new(1, -20, 0, 30)
        searchBox.Position = UDim2.new(0, 10, 0, 5)
        searchBox.BackgroundColor3 = self.Theme.InputBackground
        searchBox.BackgroundTransparency = 0.5
        searchBox.Text = ""
        searchBox.PlaceholderText = "Search..."
        searchBox.TextColor3 = self.Theme.TextColor
        searchBox.PlaceholderColor3 = self.Theme.SubTextColor
        searchBox.Font = Enum.Font.Gotham
        searchBox.TextSize = 14
        searchBox.TextXAlignment = Enum.TextXAlignment.Left
        searchBox.ZIndex = 10
        searchBox.Parent = dropdownMenu
        
        local searchCorner = Instance.new("UICorner")
        searchCorner.CornerRadius = UDim.new(0, 4)
        searchCorner.Parent = searchBox
    end
    
    -- Options container
    local optionsContainer = Instance.new("ScrollingFrame")
    optionsContainer.Name = "OptionsContainer"
    optionsContainer.Size = UDim2.new(1, -10, 1, searchEnabled and -45 or -10)
    optionsContainer.Position = UDim2.new(0, 5, 0, searchEnabled and 40 or 5)
    optionsContainer.BackgroundTransparency = 1
    optionsContainer.BorderSizePixel = 0
    optionsContainer.ScrollBarThickness = 4
    optionsContainer.ScrollBarImageColor3 = self.Theme.LightAccent
    optionsContainer.CanvasSize = UDim2.new(0, 0, 0, 0)
    optionsContainer.AutomaticCanvasSize = Enum.AutomaticSize.Y
    optionsContainer.ZIndex = 10
    optionsContainer.Parent = dropdownMenu
    
    local optionsListLayout = Instance.new("UIListLayout")
    optionsListLayout.Name = "OptionsListLayout"
    optionsListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    optionsListLayout.Padding = UDim.new(0, 2)
    optionsListLayout.Parent = optionsContainer
    
    -- Selected values
    local selectedOptions = multi and {} or nil
    
    -- Function to update selected text
    local function updateSelectedText()
        if multi then
            if #selectedOptions == 0 then
                selectedText.Text = "Select options..."
                selectedText.TextColor3 = self.Theme.SubTextColor
            else
                local displayText = ""
                for i, option in ipairs(selectedOptions) do
                    if i > 1 then
                        displayText = displayText .. ", "
                    end
                    displayText = displayText .. option
                    
                    -- Limit display length
                    if #displayText > 30 and i < #selectedOptions then
                        displayText = displayText .. " (+" .. (#selectedOptions - i) .. " more)"
                        break
                    end
                end
                selectedText.Text = displayText
                selectedText.TextColor3 = self.Theme.TextColor
            end
        else
            if selectedOptions then
                selectedText.Text = selectedOptions
                selectedText.TextColor3 = self.Theme.TextColor
            else
                selectedText.Text = "Select an option..."
                selectedText.TextColor3 = self.Theme.SubTextColor
            end
        end
    end
    
    -- Function to create option buttons
    local optionButtons = {}
    
    local function createOptionButtons(filter)
        -- Clear existing buttons
        for _, button in pairs(optionButtons) do
            button:Destroy()
        end
        optionButtons = {}
        
        -- Create new buttons
        for i, option in ipairs(options) do
            -- Apply filter if provided
            if filter and filter ~= "" and not string.find(string.lower(option), string.lower(filter)) then
                continue
            end
            
            local optionButton = Instance.new("TextButton")
            optionButton.Name = "Option_" .. option
            optionButton.Size = UDim2.new(1, 0, 0, 30)
            optionButton.BackgroundColor3 = self.Theme.ButtonColor
            optionButton.BackgroundTransparency = 0.9
            optionButton.Text = ""
            optionButton.ZIndex = 10
            optionButton.LayoutOrder = i
            optionButton.Parent = optionsContainer
            
            local optionCorner = Instance.new("UICorner")
            optionCorner.CornerRadius = UDim.new(0, 4)
            optionCorner.Parent = optionButton
            
            local optionText = Instance.new("TextLabel")
            optionText.Name = "OptionText"
            optionText.Size = UDim2.new(1, multi and -30 or -10, 1, 0)
            optionText.Position = UDim2.new(0, 10, 0, 0)
            optionText.BackgroundTransparency = 1
            optionText.Text = option
            optionText.TextColor3 = self.Theme.TextColor
            optionText.Font = Enum.Font.Gotham
            optionText.TextSize = 14
            optionText.TextXAlignment = Enum.TextXAlignment.Left
            optionText.ZIndex = 10
            optionText.Parent = optionButton
            
            -- Checkbox for multi-select
            if multi then
                local checkbox = Instance.new("Frame")
                checkbox.Name = "Checkbox"
                checkbox.Size = UDim2.new(0, 16, 0, 16)
                checkbox.Position = UDim2.new(1, -26, 0.5, -8)
                checkbox.BackgroundColor3 = self.Theme.ToggleOff
                checkbox.BorderSizePixel = 0
                checkbox.ZIndex = 10
                checkbox.Parent = optionButton
                
                local checkboxCorner = Instance.new("UICorner")
                checkboxCorner.CornerRadius = UDim.new(0, 4)
                checkboxCorner.Parent = checkbox
                
                local checkmark = Instance.new("ImageLabel")
                checkmark.Name = "Checkmark"
                checkmark.Size = UDim2.new(0, 12, 0, 12)
                checkmark.Position = UDim2.new(0.5, -6, 0.5, -6)
                checkmark.BackgroundTransparency = 1
                checkmark.Image = "rbxassetid://6031094667"
                checkmark.ImageColor3 = Color3.fromRGB(255, 255, 255)
                checkmark.ImageTransparency = 1
                checkmark.ZIndex = 11
                checkmark.Parent = checkbox
                
                -- Update checkbox if option is selected
                if table.find(selectedOptions, option) then
                    checkbox.BackgroundColor3 = self.Theme.ToggleOn
                    checkmark.ImageTransparency = 0
                end
            end
            
            -- Hover effect
            optionButton.MouseEnter:Connect(function()
                TweenService:Create(optionButton, TweenInfo.new(0.2), {
                    BackgroundTransparency = 0.7
                }):Play()
            end)
            
            optionButton.MouseLeave:Connect(function()
                TweenService:Create(optionButton, TweenInfo.new(0.2), {
                    BackgroundTransparency = 0.9
                }):Play()
            end)
            
            -- Click functionality
            optionButton.MouseButton1Click:Connect(function()
                if multi then
                    local index = table.find(selectedOptions, option)
                    local checkbox = optionButton.Checkbox
                    local checkmark = checkbox.Checkmark
                    
                    if index then
                        -- Remove option
                        table.remove(selectedOptions, index)
                        
                        -- Update checkbox
                        TweenService:Create(checkbox, TweenInfo.new(0.2), {
                            BackgroundColor3 = self.Theme.ToggleOff
                        }):Play()
                        
                        TweenService:Create(checkmark, TweenInfo.new(0.2), {
                            ImageTransparency = 1
                        }):Play()
                    else
                        -- Add option
                        table.insert(selectedOptions, option)
                        
                        -- Update checkbox
                        TweenService:Create(checkbox, TweenInfo.new(0.2), {
                            BackgroundColor3 = self.Theme.ToggleOn
                        }):Play()
                        
                        TweenService:Create(checkmark, TweenInfo.new(0.2), {
                            ImageTransparency = 0
                        }):Play()
                    end
                    
                    -- Update display text
                    updateSelectedText()
                    
                    -- Call callback
                    callback(selectedOptions)
                else
                    -- Set selected option
                    selectedOptions = option
                    
                    -- Update display text
                    updateSelectedText()
                    
                    -- Call callback
                    callback(option)
                    
                    -- Close dropdown
                    toggleDropdown(false)
                end
            end)
            
            table.insert(optionButtons, optionButton)
        end
    end
    
    -- Create initial option buttons
    createOptionButtons()
    
    -- Set default value(s)
    if default then
        if multi then
            if typeof(default) == "table" then
                for _, option in ipairs(default) do
                    if table.find(options, option) and not table.find(selectedOptions, option) then
                        table.insert(selectedOptions, option)
                    end
                end
            elseif table.find(options, default) then
                table.insert(selectedOptions, default)
            end
        else
            if table.find(options, default) then
                selectedOptions = default
            end
        end
        
        updateSelectedText()
        callback(selectedOptions)
    end
    
    -- Search functionality
    if searchEnabled and searchBox then
        searchBox:GetPropertyChangedSignal("Text"):Connect(function()
            createOptionButtons(searchBox.Text)
        end)
    end
    
    -- Dropdown state
    local dropdownOpen = false
    
    -- Function to toggle dropdown
    function toggleDropdown(state)
        dropdownOpen = state ~= nil and state or not dropdownOpen
        
        -- Rotate arrow
        local rotation = dropdownOpen and 180 or 0
        TweenService:Create(dropdownArrow, TweenInfo.new(0.3), {
            Rotation = rotation
        }):Play()
        
        -- Show/hide menu
        if dropdownOpen then
            dropdownMenu.Visible = true
            
            -- Calculate height based on options
            local maxHeight = 200
            local contentHeight = math.min(#options * 32 + (searchEnabled and 45 or 10), maxHeight)
            
            TweenService:Create(dropdownMenu, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                Size = UDim2.new(1, 0, 0, contentHeight)
            }):Play()
            
            -- Focus search box if enabled
            if searchEnabled and searchBox then
                searchBox:CaptureFocus()
            end
        else
            TweenService:Create(dropdownMenu, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {
                Size = UDim2.new(1, 0, 0, 0)
            }):Play()
            
            -- Wait for animation to complete before hiding
            delay(0.3, function()
                if not dropdownOpen then
                    dropdownMenu.Visible = false
                end
            end)
            
            -- Clear search if enabled
            if searchEnabled and searchBox then
                searchBox.Text = ""
                searchBox:ReleaseFocus()
            end
        end
    end
    
    -- Button functionality
    dropdownButton.MouseButton1Click:Connect(function()
        toggleDropdown()
    end)
    
    -- Close dropdown when clicking outside
    UserInputService.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            local mousePosition = UserInputService:GetMouseLocation()
            local buttonPosition = dropdownButton.AbsolutePosition
            local buttonSize = dropdownButton.AbsoluteSize
            
            -- Check if click is outside the dropdown
            if dropdownOpen and 
               (mousePosition.X < buttonPosition.X or
                mousePosition.X > buttonPosition.X + buttonSize.X or
                mousePosition.Y < buttonPosition.Y or
                mousePosition.Y > buttonPosition.Y + buttonSize.Y + dropdownMenu.AbsoluteSize.Y) then
                toggleDropdown(false)
            end
        end
    end)
    
    -- Create dropdown object
    local dropdownObj = {
        Title = title,
        Description = description,
        Frame = dropdownFrame,
        Options = options,
        Selected = selectedOptions,
        Callback = callback
    }
    
    -- Add to section elements
    table.insert(section.Elements, dropdownObj)
    
    -- Return dropdown object with methods
    return setmetatable({
        -- Get selected value(s)
        GetValue = function(_)
            return selectedOptions
        end,
        
        -- Set selected value(s)
        SetValue = function(_, value)
            if multi then
                -- Clear current selection
                selectedOptions = {}
                
                -- Add new values
                if typeof(value) == "table" then
                    for _, option in ipairs(value) do
                        if table.find(options, option) then
                            table.insert(selectedOptions, option)
                        end
                    end
                elseif table.find(options, value) then
                    table.insert(selectedOptions, value)
                end
            else
                -- Set single value
                if table.find(options, value) then
                    selectedOptions = value
                else
                    selectedOptions = nil
                end
            end
            
            -- Update display text
            updateSelectedText()
            
            -- Recreate option buttons to update checkboxes
            createOptionButtons()
            
            -- Call callback
            callback(selectedOptions)
        end,
        
        -- Refresh options
        RefreshOptions = function(_, newOptions)
            options = newOptions or options
            
            -- Update selected values to remove any that are no longer in options
            if multi then
                for i = #selectedOptions, 1, -1 do
                    if not table.find(options, selectedOptions[i]) then
                        table.remove(selectedOptions, i)
                    end
                end
            else
                if selectedOptions and not table.find(options, selectedOptions) then
                    selectedOptions = nil
                end
            end
            
            -- Update display text
            updateSelectedText()
            
            -- Recreate option buttons
            createOptionButtons()
            
            -- Call callback with updated selection
            callback(selectedOptions)
        end,
        
        -- Update dropdown callback
        SetCallback = function(_, newCallback)
            dropdownObj.Callback = newCallback
            callback = newCallback
        end
    }, {
        __index = dropdownObj
    })
end

-- Create a label
function MinimalistUI:CreateLabel(section, config)
    local Theme = self.Theme
    local title = config.Title or "Label"
    local alignment = config.Alignment or Enum.TextXAlignment.Left
    
    -- Label container
    local labelFrame = Instance.new("Frame")
    labelFrame.Name = "Label_" .. title
    labelFrame.Size = UDim2.new(1, 0, 0, 20)
    labelFrame.BackgroundTransparency = 1
    labelFrame.LayoutOrder = #section.Elements
    labelFrame.Parent = section.Content
    
    -- Label text
    local labelText = Instance.new("TextLabel")
    labelText.Name = "LabelText"
    labelText.Size = UDim2.new(1, 0, 1, 0)
    labelText.BackgroundTransparency = 1
    labelText.Text = title
    labelText.TextColor3 = self.Theme.TextColor
    labelText.Font = Enum.Font.GothamSemibold
    labelText.TextSize = 14
    labelText.TextXAlignment = alignment
    labelText.Parent = labelFrame
    
    -- Create label object
    local labelObj = {
        Title = title,
        Frame = labelFrame,
        Text = labelText
    }
    
    -- Add to section elements
    table.insert(section.Elements, labelObj)
    
    -- Return label object with methods
    return setmetatable({
        -- Set label text
        SetText = function(_, newText)
            labelText.Text = newText
            labelObj.Title = newText
        end,
        
        -- Set text color
        SetColor = function(_, color)
            labelText.TextColor3 = color
        end
    }, {
        __index = labelObj
    })
end

-- Create a paragraph
function MinimalistUI:CreateParagraph(section, config)
    local Theme = self.Theme
    local title = config.Title
    local content = config.Content or "Paragraph content"
    
    -- Paragraph container
    local paragraphFrame = Instance.new("Frame")
    paragraphFrame.Name = "Paragraph"
    paragraphFrame.Size = UDim2.new(1, 0, 0, title and 50 or 30)
    paragraphFrame.BackgroundTransparency = 1
    paragraphFrame.LayoutOrder = #section.Elements
    paragraphFrame.AutomaticSize = Enum.AutomaticSize.Y
    paragraphFrame.Parent = section.Content
    
    -- Title (if provided)
    if title then
        local titleText = Instance.new("TextLabel")
        titleText.Name = "Title"
        titleText.Size = UDim2.new(1, 0, 0, 20)
        titleText.BackgroundTransparency = 1
        titleText.Text = title
        titleText.TextColor3 = self.Theme.TextColor
        titleText.Font = Enum.Font.GothamSemibold
        titleText.TextSize = 14
        titleText.TextXAlignment = Enum.TextXAlignment.Left
        titleText.Parent = paragraphFrame
    end
    
    -- Content
    local contentText = Instance.new("TextLabel")
    contentText.Name = "Content"
    contentText.Size = UDim2.new(1, 0, 0, 0)
    contentText.Position = UDim2.new(0, 0, 0, title and 24 or 0)
    contentText.BackgroundTransparency = 1
    contentText.Text = content
    contentText.TextColor3 = self.Theme.SubTextColor
    contentText.Font = Enum.Font.Gotham
    contentText.TextSize = 14
    contentText.TextWrapped = true
    contentText.TextXAlignment = Enum.TextXAlignment.Left
    contentText.TextYAlignment = Enum.TextYAlignment.Top
    contentText.AutomaticSize = Enum.AutomaticSize.Y
    contentText.Parent = paragraphFrame
    
    -- Create paragraph object
    local paragraphObj = {
        Title = title,
        Content = content,
        Frame = paragraphFrame,
        TitleLabel = title and paragraphFrame.Title or nil,
        ContentLabel = contentText
    }
    
    -- Add to section elements
    table.insert(section.Elements, paragraphObj)
    
    -- Return paragraph object with methods
    return setmetatable({
        -- Set title
        SetTitle = function(_, newTitle)
            if paragraphObj.TitleLabel then
                paragraphObj.TitleLabel.Text = newTitle
                paragraphObj.Title = newTitle
            end
        end,
        
        -- Set content
        SetContent = function(_, newContent)
            contentText.Text = newContent
            paragraphObj.Content = newContent
        end
    }, {
        __index = paragraphObj
    })
end

-- Create a divider
function MinimalistUI:CreateDivider(section)
    local Theme = self.Theme
    
    -- Divider container
    local dividerFrame = Instance.new("Frame")
    dividerFrame.Name = "Divider"
    dividerFrame.Size = UDim2.new(1, 0, 0, 10)
    dividerFrame.BackgroundTransparency = 1
    dividerFrame.LayoutOrder = #section.Elements
    dividerFrame.Parent = section.Content
    
    -- Divider line
    local dividerLine = Instance.new("Frame")
    dividerLine.Name = "DividerLine"
    dividerLine.Size = UDim2.new(1, 0, 0, 1)
    dividerLine.Position = UDim2.new(0, 0, 0.5, 0)
    dividerLine.BackgroundColor3 = self.Theme.LightAccent
    dividerLine.BorderSizePixel = 0
    dividerLine.Parent = dividerFrame
    
    -- Create divider object
    local dividerObj = {
        Frame = dividerFrame,
        Line = dividerLine
    }
    
    -- Add to section elements
    table.insert(section.Elements, dividerObj)
    
    -- Return divider object
    return dividerObj
end

-- Destroy the UI
function MinimalistUI:Destroy()
    if self.ScreenGui then
        self.ScreenGui:Destroy()
        self.ScreenGui = nil
    end
    
    -- Clear all references
    self.Tabs = {}
    self.ActiveTab = nil
    self.Connections = {}
    
    -- Disconnect all connections
    for _, connection in pairs(self.Connections) do
        if typeof(connection) == "RBXScriptConnection" and connection.Connected then
            connection:Disconnect()
        end
    end
end

function MinimalistUI:Ready()
    self:UpdateLoading(1, "Ready!")
end

-- Return the library
return MinimalistUI
