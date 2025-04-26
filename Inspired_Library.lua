--[[
    Rayfield-Inspired UI Library
    A clean, modern UI library with support for various components
]]

local UILibrary = {}
--local Version = 1
-- Services
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local TextService = game:GetService("TextService")
local HttpService = game:GetService("HttpService")

-- Variables
local Player = Players.LocalPlayer
local Mouse = Player:GetMouse()
local Library = {
    Flags = {},
    Theme = {
        Main = Color3.fromRGB(25, 25, 35),
        Secondary = Color3.fromRGB(30, 30, 40),
        Accent = Color3.fromRGB(90, 100, 240),
        StrongText = Color3.fromRGB(255, 255, 255),
        WeakText = Color3.fromRGB(180, 180, 190),
        TabBackground = Color3.fromRGB(35, 35, 45),
        SectionBackground = Color3.fromRGB(30, 30, 40),
        ElementBackground = Color3.fromRGB(40, 40, 55),
        ElementBackgroundHover = Color3.fromRGB(50, 50, 65),
        InElementBackground = Color3.fromRGB(35, 35, 45),
        Stroke = Color3.fromRGB(60, 60, 80),
        Success = Color3.fromRGB(50, 200, 100),
        Warning = Color3.fromRGB(255, 180, 40),
        Error = Color3.fromRGB(255, 80, 80),
        Information = Color3.fromRGB(80, 180, 255),
    },
    Fonts = {
        Regular = Enum.Font.Gotham,
        SemiBold = Enum.Font.GothamSemibold,
        Bold = Enum.Font.GothamBold,
        Medium = Enum.Font.GothamMedium,
    },
    WindowCount = 0,
    Windows = {},
    OpenedWindow = nil,
    OpenedDropdown = nil,
    Notifications = {},
}

-- Utility Functions
local function tween(instance, properties, duration, style, direction)
    style = style or Enum.EasingStyle.Quart
    direction = direction or Enum.EasingDirection.Out
    
    local tweenInfo = TweenInfo.new(duration, style, direction)
    local tween = TweenService:Create(instance, tweenInfo, properties)
    tween:Play()
    
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
    
    local tweenInfo = TweenInfo.new(0.5)
    local tween = TweenService:Create(ripple, tweenInfo, {
        Size = UDim2.new(0, size, 0, size),
        BackgroundTransparency = 1
    })
    tween:Play()
    
    tween.Completed:Connect(function()
        ripple:Destroy()
    end)
end

local function getTextBounds(text, font, size)
    return TextService:GetTextSize(text, size, font, Vector2.new(math.huge, math.huge))
end

-- Lucide Icons Support
local Icons = loadstring(game:HttpGet('https://raw.githubusercontent.com/SiriusSoftwareLtd/Rayfield/refs/heads/main/icons.lua'))()

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

-- Create Window
function UILibrary:CreateWindow(options)
    options = options or {}
    options.Name = options.Name or "UI Library"
    options.LoadingTitle = options.LoadingTitle or "Loading UI"
    options.LoadingSubtitle = options.LoadingSubtitle or "by Cody"
    options.ConfigurationSaving = options.ConfigurationSaving or {
        Enabled = false,
        FolderName = nil,
        FileName = "Config"
    }
    options.LoadAnimation = options.LoadAnimation or true
    options.KeySystem = options.KeySystem or false
    options.KeySettings = options.KeySettings or {
        Title = "Key System",
        Subtitle = "Key Required",
        Note = "No method of obtaining the key is provided",
        Key = {"Hello", "World"}
    }
    
    Library.WindowCount = Library.WindowCount + 1
    
    -- Create ScreenGui
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = HttpService:GenerateGUID(false)
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.Parent = Player.PlayerGui
    
    -- Create Main Container
    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Size = UDim2.new(0, 600, 0, 400)
    MainFrame.Position = UDim2.new(0.5, -300, 0.5, -200)
    MainFrame.BackgroundColor3 = Library.Theme.Main
    MainFrame.BorderSizePixel = 0
    MainFrame.ClipsDescendants = true
    MainFrame.Parent = ScreenGui
    
    -- Shadow
    local Shadow = Instance.new("ImageLabel")
    Shadow.Name = "Shadow"
    Shadow.AnchorPoint = Vector2.new(0.5, 0.5)
    Shadow.BackgroundTransparency = 1
    Shadow.Position = UDim2.new(0.5, 0, 0.5, 0)
    Shadow.Size = UDim2.new(1, 40, 1, 40)
    Shadow.ZIndex = 0
    Shadow.Image = "rbxassetid://6014261993"
    Shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
    Shadow.ImageTransparency = 0.5
    Shadow.ScaleType = Enum.ScaleType.Slice
    Shadow.SliceCenter = Rect.new(49, 49, 450, 450)
    Shadow.Parent = MainFrame
    
    -- Rounded Corners
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 8)
    UICorner.Parent = MainFrame
    
    -- UI Stroke
    local UIStroke = Instance.new("UIStroke")
    UIStroke.Color = Library.Theme.Stroke
    UIStroke.Thickness = 1.5
    UIStroke.Parent = MainFrame
    
    -- Title Bar
    local TitleBar = Instance.new("Frame")
    TitleBar.Name = "TitleBar"
    TitleBar.Size = UDim2.new(1, 0, 0, 40)
    TitleBar.BackgroundColor3 = Library.Theme.Secondary
    TitleBar.BorderSizePixel = 0
    TitleBar.Parent = MainFrame
    
    local TitleCorner = Instance.new("UICorner")
    TitleCorner.CornerRadius = UDim.new(0, 8)
    TitleCorner.Parent = TitleBar
    
    -- Fix the bottom corners of title bar
    local BottomFix = Instance.new("Frame")
    BottomFix.Name = "BottomFix"
    BottomFix.Size = UDim2.new(1, 0, 0, 10)
    BottomFix.Position = UDim2.new(0, 0, 1, -10)
    BottomFix.BackgroundColor3 = Library.Theme.Secondary
    BottomFix.BorderSizePixel = 0
    BottomFix.ZIndex = 0
    BottomFix.Parent = TitleBar
    
    -- Title Text
    local TitleText = Instance.new("TextLabel")
    TitleText.Name = "TitleText"
    TitleText.Size = UDim2.new(1, -80, 1, 0)
    TitleText.Position = UDim2.new(0, 15, 0, 0)
    TitleText.BackgroundTransparency = 1
    TitleText.Text = options.Name
    TitleText.TextColor3 = Library.Theme.StrongText
    TitleText.Font = Library.Fonts.Bold
    TitleText.TextSize = 16
    TitleText.TextXAlignment = Enum.TextXAlignment.Left
    TitleText.Parent = TitleBar
    
    -- Minimize Button
    local MinimizeButton = Instance.new("ImageButton")
    MinimizeButton.Name = "MinimizeButton"
    MinimizeButton.Size = UDim2.new(0, 20, 0, 20)
    MinimizeButton.Position = UDim2.new(1, -75, 0.5, -10)
    MinimizeButton.BackgroundTransparency = 1
    MinimizeButton.Image = "rbxassetid://6026568240"
    MinimizeButton.ImageColor3 = Library.Theme.StrongText
    MinimizeButton.Parent = TitleBar
    
    -- Close Button
    local CloseButton = Instance.new("ImageButton")
    CloseButton.Name = "CloseButton"
    CloseButton.Size = UDim2.new(0, 20, 0, 20)
    CloseButton.Position = UDim2.new(1, -40, 0.5, -10)
    CloseButton.BackgroundTransparency = 1
    CloseButton.Image = "rbxassetid://6031094678"
    CloseButton.ImageColor3 = Library.Theme.StrongText
    CloseButton.Parent = TitleBar
    
    -- Content Container
    local ContentFrame = Instance.new("Frame")
    ContentFrame.Name = "ContentFrame"
    ContentFrame.Size = UDim2.new(1, 0, 1, -40)
    ContentFrame.Position = UDim2.new(0, 0, 0, 40)
    ContentFrame.BackgroundTransparency = 1
    ContentFrame.ClipsDescendants = true
    ContentFrame.Parent = MainFrame
    
    -- Tab Container
    local TabContainer = Instance.new("Frame")
    TabContainer.Name = "TabContainer"
    TabContainer.Size = UDim2.new(0, 150, 1, 0)
    TabContainer.BackgroundColor3 = Library.Theme.TabBackground
    TabContainer.BorderSizePixel = 0
    TabContainer.Parent = ContentFrame
    
    -- Tab List
    local TabList = Instance.new("ScrollingFrame")
    TabList.Name = "TabList"
    TabList.Size = UDim2.new(1, 0, 1, -50) -- Leave space for search
    TabList.Position = UDim2.new(0, 0, 0, 50)
    TabList.BackgroundTransparency = 1
    TabList.BorderSizePixel = 0
    TabList.ScrollBarThickness = 2
    TabList.ScrollBarImageColor3 = Library.Theme.Accent
    TabList.CanvasSize = UDim2.new(0, 0, 0, 0)
    TabList.AutomaticCanvasSize = Enum.AutomaticSize.Y
    TabList.Parent = TabContainer
    
    local TabListLayout = Instance.new("UIListLayout")
    TabListLayout.Padding = UDim.new(0, 5)
    TabListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    TabListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    TabListLayout.Parent = TabList
    
    local TabListPadding = Instance.new("UIPadding")
    TabListPadding.PaddingTop = UDim.new(0, 5)
    TabListPadding.PaddingBottom = UDim.new(0, 5)
    TabListPadding.Parent = TabList
    
    -- Search Bar
    local SearchContainer = Instance.new("Frame")
    SearchContainer.Name = "SearchContainer"
    SearchContainer.Size = UDim2.new(1, -20, 0, 35)
    SearchContainer.Position = UDim2.new(0, 10, 0, 10)
    SearchContainer.BackgroundColor3 = Library.Theme.ElementBackground
    SearchContainer.BorderSizePixel = 0
    SearchContainer.Parent = TabContainer
    
    local SearchCorner = Instance.new("UICorner")
    SearchCorner.CornerRadius = UDim.new(0, 6)
    SearchCorner.Parent = SearchContainer
    
    local SearchIcon = Instance.new("ImageLabel")
    SearchIcon.Name = "SearchIcon"
    SearchIcon.Size = UDim2.new(0, 16, 0, 16)
    SearchIcon.Position = UDim2.new(0, 10, 0.5, -8)
    SearchIcon.BackgroundTransparency = 1
    
    local searchIconData = getIcon("search")
    SearchIcon.Image = "rbxassetid://" .. searchIconData.id
    SearchIcon.ImageRectSize = searchIconData.imageRectSize
    SearchIcon.ImageRectOffset = searchIconData.imageRectOffset
    SearchIcon.ImageColor3 = Library.Theme.WeakText
    SearchIcon.Parent = SearchContainer
    
    local SearchBox = Instance.new("TextBox")
    SearchBox.Name = "SearchBox"
    SearchBox.Size = UDim2.new(1, -40, 1, 0)
    SearchBox.Position = UDim2.new(0, 35, 0, 0)
    SearchBox.BackgroundTransparency = 1
    SearchBox.Text = ""
    SearchBox.PlaceholderText = "Search..."
    SearchBox.TextColor3 = Library.Theme.StrongText
    SearchBox.PlaceholderColor3 = Library.Theme.WeakText
    SearchBox.Font = Library.Fonts.Regular
    SearchBox.TextSize = 14
    SearchBox.TextXAlignment = Enum.TextXAlignment.Left
    SearchBox.Parent = SearchContainer
    
    -- Tab Content Container
    local TabContentContainer = Instance.new("Frame")
    TabContentContainer.Name = "TabContentContainer"
    TabContentContainer.Size = UDim2.new(1, -150, 1, 0)
    TabContentContainer.Position = UDim2.new(0, 150, 0, 0)
    TabContentContainer.BackgroundTransparency = 1
    TabContentContainer.Parent = ContentFrame
    
    -- Loading Screen
    local LoadingScreen = Instance.new("Frame")
    LoadingScreen.Name = "LoadingScreen"
    LoadingScreen.Size = UDim2.new(1, 0, 1, 0)
    LoadingScreen.BackgroundColor3 = Library.Theme.Main
    LoadingScreen.BorderSizePixel = 0
    LoadingScreen.ZIndex = 10
    LoadingScreen.Parent = MainFrame
    
    local LoadingCorner = Instance.new("UICorner")
    LoadingCorner.CornerRadius = UDim.new(0, 8)
    LoadingCorner.Parent = LoadingScreen
    
    local LoadingIcon = Instance.new("ImageLabel")
    LoadingIcon.Name = "LoadingIcon"
    LoadingIcon.Size = UDim2.new(0, 80, 0, 80)
    LoadingIcon.Position = UDim2.new(0.5, -40, 0.5, -70)
    LoadingIcon.BackgroundTransparency = 1
    LoadingIcon.Image = "rbxassetid://8666601749"
    LoadingIcon.ImageColor3 = Library.Theme.Accent
    LoadingIcon.ZIndex = 11
    LoadingIcon.Parent = LoadingScreen
    
    local LoadingTitle = Instance.new("TextLabel")
    LoadingTitle.Name = "LoadingTitle"
    LoadingTitle.Size = UDim2.new(1, 0, 0, 30)
    LoadingTitle.Position = UDim2.new(0, 0, 0.5, 20)
    LoadingTitle.BackgroundTransparency = 1
    LoadingTitle.Text = options.LoadingTitle
    LoadingTitle.TextColor3 = Library.Theme.StrongText
    LoadingTitle.Font = Library.Fonts.Bold
    LoadingTitle.TextSize = 24
    LoadingTitle.ZIndex = 11
    LoadingTitle.Parent = LoadingScreen
    
    local LoadingSubtitle = Instance.new("TextLabel")
    LoadingSubtitle.Name = "LoadingSubtitle"
    LoadingSubtitle.Size = UDim2.new(1, 0, 0, 20)
    LoadingSubtitle.Position = UDim2.new(0, 0, 0.5, 50)
    LoadingSubtitle.BackgroundTransparency = 1
    LoadingSubtitle.Text = options.LoadingSubtitle
    LoadingSubtitle.TextColor3 = Library.Theme.WeakText
    LoadingSubtitle.Font = Library.Fonts.SemiBold
    LoadingSubtitle.TextSize = 16
    LoadingSubtitle.ZIndex = 11
    LoadingSubtitle.Parent = LoadingScreen
    
    -- Make UI draggable from title bar
    local dragging = false
    local dragInput
    local dragStart
    local startPos
    
    local function updateDrag(input)
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
    
    TitleBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = MainFrame.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    
    TitleBar.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            updateDrag(input)
        end
    end)
    
    -- Button hover effects
    local function setupButtonHover(button, normalColor, hoverColor)
        button.MouseEnter:Connect(function()
            tween(button, {ImageColor3 = hoverColor}, 0.2)
        end)
        
        button.MouseLeave:Connect(function()
            tween(button, {ImageColor3 = normalColor}, 0.2)
        end)
    end
    
    setupButtonHover(CloseButton, Library.Theme.StrongText, Library.Theme.Error)
    setupButtonHover(MinimizeButton, Library.Theme.StrongText, Library.Theme.Information)
    
    -- Minimize functionality
    local minimized = false
    MinimizeButton.MouseButton1Click:Connect(function()
        minimized = not minimized
        
        if minimized then
            tween(MainFrame, {Size = UDim2.new(0, 600, 0, 40)}, 0.3)
            MinimizeButton.Image = "rbxassetid://6031090990" -- Maximize icon
        else
            tween(MainFrame, {Size = UDim2.new(0, 600, 0, 400)}, 0.3)
            MinimizeButton.Image = "rbxassetid://6026568240" -- Minimize icon
        end
    end)
    
    -- Close functionality
    CloseButton.MouseButton1Click:Connect(function()
        tween(MainFrame, {Size = UDim2.new(0, 0, 0, 0), Position = UDim2.new(0.5, 0, 0.5, 0)}, 0.3)
        wait(0.3)
        ScreenGui:Destroy()
    end)
    
    -- Search functionality
    local function updateSearch()
        local searchText = string.lower(SearchBox.Text)
        for _, tabButton in pairs(TabList:GetChildren()) do
            if tabButton:IsA("TextButton") then
                if searchText == "" then
                    tabButton.Visible = true
                else
                    local tabName = string.lower(tabButton.Name)
                    tabButton.Visible = string.find(tabName, searchText) ~= nil
                end
            end
        end
    end
    
    SearchBox:GetPropertyChangedSignal("Text"):Connect(updateSearch)
    
    -- Window object
    local Window = {
        Tabs = {},
        ActiveTab = nil
    }
    
    -- Create Tab
    function Window:CreateTab(options)
        options = options or {}
        options.Name = options.Name or "Tab"
        options.Icon = options.Icon or "home"
        
        -- Create Tab Button
        local TabButton = Instance.new("TextButton")
        TabButton.Name = options.Name
        TabButton.Size = UDim2.new(1, -20, 0, 36)
        TabButton.BackgroundColor3 = Library.Theme.ElementBackground
        TabButton.BackgroundTransparency = 1
        TabButton.Text = ""
        TabButton.AutoButtonColor = false
        TabButton.Parent = TabList
        
        local TabButtonCorner = Instance.new("UICorner")
        TabButtonCorner.CornerRadius = UDim.new(0, 6)
        TabButtonCorner.Parent = TabButton
        
        local TabIcon = Instance.new("ImageLabel")
        TabIcon.Name = "TabIcon"
        TabIcon.Size = UDim2.new(0, 20, 0, 20)
        TabIcon.Position = UDim2.new(0, 10, 0.5, -10)
        TabIcon.BackgroundTransparency = 1
        
        local iconData = getIcon(options.Icon)
        TabIcon.Image = "rbxassetid://" .. iconData.id
        TabIcon.ImageRectSize = iconData.imageRectSize
        TabIcon.ImageRectOffset = iconData.imageRectOffset
        TabIcon.ImageColor3 = Library.Theme.WeakText
        TabIcon.Parent = TabButton
        
        local TabText = Instance.new("TextLabel")
        TabText.Name = "TabText"
        TabText.Size = UDim2.new(1, -40, 1, 0)
        TabText.Position = UDim2.new(0, 40, 0, 0)
        TabText.BackgroundTransparency = 1
        TabText.Text = options.Name
        TabText.TextColor3 = Library.Theme.WeakText
        TabText.Font = Library.Fonts.SemiBold
        TabText.TextSize = 14
        TabText.TextXAlignment = Enum.TextXAlignment.Left
        TabText.Parent = TabButton
        
        -- Create Tab Content
        local TabContent = Instance.new("ScrollingFrame")
        TabContent.Name = options.Name .. "Content"
        TabContent.Size = UDim2.new(1, 0, 1, 0)
        TabContent.BackgroundTransparency = 1
        TabContent.BorderSizePixel = 0
        TabContent.ScrollBarThickness = 2
        TabContent.ScrollBarImageColor3 = Library.Theme.Accent
        TabContent.Visible = false
        TabContent.Parent = TabContentContainer
        
        local TabContentLayout = Instance.new("UIListLayout")
        TabContentLayout.Padding = UDim.new(0, 10)
        TabContentLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
        TabContentLayout.SortOrder = Enum.SortOrder.LayoutOrder
        TabContentLayout.Parent = TabContent
        
        local TabContentPadding = Instance.new("UIPadding")
        TabContentPadding.PaddingTop = UDim.new(0, 10)
        TabContentPadding.PaddingBottom = UDim.new(0, 10)
        TabContentPadding.PaddingLeft = UDim.new(0, 10)
        TabContentPadding.PaddingRight = UDim.new(0, 10)
        TabContentPadding.Parent = TabContent
        
        -- Tab Button Functionality
        TabButton.MouseEnter:Connect(function()
            if Window.ActiveTab ~= TabButton then
                tween(TabButton, {BackgroundTransparency = 0.7}, 0.2)
            end
        end)
        
        TabButton.MouseLeave:Connect(function()
            if Window.ActiveTab ~= TabButton then
                tween(TabButton, {BackgroundTransparency = 1}, 0.2)
            end
        end)
        
        TabButton.MouseButton1Click:Connect(function()
            if Window.ActiveTab ~= TabButton then
                -- Deactivate current tab
                if Window.ActiveTab then
                    tween(Window.ActiveTab, {BackgroundTransparency = 1}, 0.2)
                    tween(Window.ActiveTab.TabIcon, {ImageColor3 = Library.Theme.WeakText}, 0.2)
                    tween(Window.ActiveTab.TabText, {TextColor3 = Library.Theme.WeakText}, 0.2)
                    
                    for _, tabContent in pairs(TabContentContainer:GetChildren()) do
                        if tabContent:IsA("ScrollingFrame") and tabContent.Visible then
                            tabContent.Visible = false
                        end
                    end
                end
                
                -- Activate new tab
                Window.ActiveTab = TabButton
                tween(TabButton, {BackgroundTransparency = 0}, 0.2)
                tween(TabIcon, {ImageColor3 = Library.Theme.StrongText}, 0.2)
                tween(TabText, {TextColor3 = Library.Theme.StrongText}, 0.2)
                TabContent.Visible = true
                
                -- Update canvas size
                TabContent.CanvasSize = UDim2.new(0, 0, 0, TabContentLayout.AbsoluteContentSize.Y + 20)
            end
        end)
        
        -- Tab object
        local Tab = {
            Button = TabButton,
            Content = TabContent
        }
        
        -- Create Section
        function Tab:CreateSection(options)
            options = options or {}
            options.Name = options.Name or "Section"
            
            local Section = Instance.new("Frame")
            Section.Name = options.Name .. "Section"
            Section.Size = UDim2.new(1, 0, 0, 36) -- Will be auto-sized
            Section.BackgroundColor3 = Library.Theme.SectionBackground
            Section.BorderSizePixel = 0
            Section.AutomaticSize = Enum.AutomaticSize.Y
            Section.Parent = TabContent
            
            local SectionCorner = Instance.new("UICorner")
            SectionCorner.CornerRadius = UDim.new(0, 8)
            SectionCorner.Parent = Section
            
            local SectionStroke = Instance.new("UIStroke")
            SectionStroke.Color = Library.Theme.Stroke
            SectionStroke.Thickness = 1
            SectionStroke.Parent = Section
            
            local SectionTitle = Instance.new("TextLabel")
            SectionTitle.Name = "SectionTitle"
            SectionTitle.Size = UDim2.new(1, -20, 0, 30)
            SectionTitle.Position = UDim2.new(0, 10, 0, 0)
            SectionTitle.BackgroundTransparency = 1
            SectionTitle.Text = options.Name
            SectionTitle.TextColor3 = Library.Theme.StrongText
            SectionTitle.Font = Library.Fonts.SemiBold
            SectionTitle.TextSize = 16
            SectionTitle.TextXAlignment = Enum.TextXAlignment.Left
            SectionTitle.Parent = Section
            
            local SectionContent = Instance.new("Frame")
            SectionContent.Name = "SectionContent"
            SectionContent.Size = UDim2.new(1, -20, 0, 0)
            SectionContent.Position = UDim2.new(0, 10, 0, 30)
            SectionContent.BackgroundTransparency = 1
            SectionContent.AutomaticSize = Enum.AutomaticSize.Y
            SectionContent.Parent = Section
            local SectionLayout = Instance.new("UIListLayout")
            SectionLayout.Padding = UDim.new(0, 8)
            SectionLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
            SectionLayout.SortOrder = Enum.SortOrder.LayoutOrder
            SectionLayout.Parent = SectionContent
            
            local SectionPadding = Instance.new("UIPadding")
            SectionPadding.PaddingBottom = UDim.new(0, 10)
            SectionPadding.Parent = SectionContent
            
            -- Section object
            local SectionObj = {}
            
            -- Create Button
            function SectionObj:AddButton(options)
                options = options or {}
                options.Name = options.Name or "Button"
                options.Description = options.Description or ""
                options.Icon = options.Icon or nil
                options.Callback = options.Callback or function() end
                
                local Button = Instance.new("Frame")
                Button.Name = options.Name .. "Button"
                Button.Size = UDim2.new(1, 0, 0, options.Description ~= "" and 60 or 36)
                Button.BackgroundTransparency = 1
                Button.Parent = SectionContent
                
                local ButtonInner = Instance.new("TextButton")
                ButtonInner.Name = "ButtonInner"
                ButtonInner.Size = UDim2.new(1, 0, 0, 36)
                ButtonInner.BackgroundColor3 = Library.Theme.ElementBackground
                ButtonInner.Text = ""
                ButtonInner.AutoButtonColor = false
                ButtonInner.ClipsDescendants = true
                ButtonInner.Parent = Button
                
                local ButtonCorner = Instance.new("UICorner")
                ButtonCorner.CornerRadius = UDim.new(0, 6)
                ButtonCorner.Parent = ButtonInner
                
                local ButtonTitle = Instance.new("TextLabel")
                ButtonTitle.Name = "ButtonTitle"
                ButtonTitle.Size = options.Icon and UDim2.new(1, -40, 1, 0) or UDim2.new(1, -16, 1, 0)
                ButtonTitle.Position = options.Icon and UDim2.new(0, 36, 0, 0) or UDim2.new(0, 12, 0, 0)
                ButtonTitle.BackgroundTransparency = 1
                ButtonTitle.Text = options.Name
                ButtonTitle.TextColor3 = Library.Theme.StrongText
                ButtonTitle.Font = Library.Fonts.SemiBold
                ButtonTitle.TextSize = 14
                ButtonTitle.TextXAlignment = Enum.TextXAlignment.Left
                ButtonTitle.Parent = ButtonInner
                
                if options.Icon then
                    local ButtonIcon = Instance.new("ImageLabel")
                    ButtonIcon.Name = "ButtonIcon"
                    ButtonIcon.Size = UDim2.new(0, 20, 0, 20)
                    ButtonIcon.Position = UDim2.new(0, 8, 0.5, -10)
                    ButtonIcon.BackgroundTransparency = 1
                    
                    local iconData = getIcon(options.Icon)
                    ButtonIcon.Image = "rbxassetid://" .. iconData.id
                    ButtonIcon.ImageRectSize = iconData.imageRectSize
                    ButtonIcon.ImageRectOffset = iconData.imageRectOffset
                    ButtonIcon.ImageColor3 = Library.Theme.StrongText
                    ButtonIcon.Parent = ButtonInner
                end
                
                if options.Description ~= "" then
                    local ButtonDescription = Instance.new("TextLabel")
                    ButtonDescription.Name = "ButtonDescription"
                    ButtonDescription.Size = UDim2.new(1, -16, 0, 20)
                    ButtonDescription.Position = UDim2.new(0, 12, 0, 36)
                    ButtonDescription.BackgroundTransparency = 1
                    ButtonDescription.Text = options.Description
                    ButtonDescription.TextColor3 = Library.Theme.WeakText
                    ButtonDescription.Font = Library.Fonts.Regular
                    ButtonDescription.TextSize = 12
                    ButtonDescription.TextWrapped = true
                    ButtonDescription.TextXAlignment = Enum.TextXAlignment.Left
                    ButtonDescription.Parent = Button
                end
                
                -- Button functionality
                ButtonInner.MouseEnter:Connect(function()
                    tween(ButtonInner, {BackgroundColor3 = Library.Theme.ElementBackgroundHover}, 0.2)
                end)
                
                ButtonInner.MouseLeave:Connect(function()
                    tween(ButtonInner, {BackgroundColor3 = Library.Theme.ElementBackground}, 0.2)
                end)
                
                ButtonInner.MouseButton1Down:Connect(function()
                    createRipple(ButtonInner)
                    tween(ButtonInner, {BackgroundColor3 = Library.Theme.ElementBackgroundHover}, 0.1)
                end)
                
                ButtonInner.MouseButton1Up:Connect(function()
                    tween(ButtonInner, {BackgroundColor3 = Library.Theme.ElementBackground}, 0.1)
                end)
                
                ButtonInner.MouseButton1Click:Connect(function()
                    options.Callback()
                end)
                
                return Button
            end
            
            -- Create Toggle
            function SectionObj:AddToggle(options)
                options = options or {}
                options.Name = options.Name or "Toggle"
                options.Description = options.Description or ""
                options.Default = options.Default or false
                options.Flag = options.Flag or options.Name
                options.Callback = options.Callback or function() end
                
                local Toggle = Instance.new("Frame")
                Toggle.Name = options.Name .. "Toggle"
                Toggle.Size = UDim2.new(1, 0, 0, options.Description ~= "" and 60 or 36)
                Toggle.BackgroundTransparency = 1
                Toggle.Parent = SectionContent
                
                local ToggleInner = Instance.new("TextButton")
                ToggleInner.Name = "ToggleInner"
                ToggleInner.Size = UDim2.new(1, 0, 0, 36)
                ToggleInner.BackgroundColor3 = Library.Theme.ElementBackground
                ToggleInner.Text = ""
                ToggleInner.AutoButtonColor = false
                ToggleInner.ClipsDescendants = true
                ToggleInner.Parent = Toggle
                
                local ToggleCorner = Instance.new("UICorner")
                ToggleCorner.CornerRadius = UDim.new(0, 6)
                ToggleCorner.Parent = ToggleInner
                
                local ToggleTitle = Instance.new("TextLabel")
                ToggleTitle.Name = "ToggleTitle"
                ToggleTitle.Size = UDim2.new(1, -64, 1, 0)
                ToggleTitle.Position = UDim2.new(0, 12, 0, 0)
                ToggleTitle.BackgroundTransparency = 1
                ToggleTitle.Text = options.Name
                ToggleTitle.TextColor3 = Library.Theme.StrongText
                ToggleTitle.Font = Library.Fonts.SemiBold
                ToggleTitle.TextSize = 14
                ToggleTitle.TextXAlignment = Enum.TextXAlignment.Left
                ToggleTitle.Parent = ToggleInner
                
                local ToggleIndicator = Instance.new("Frame")
                ToggleIndicator.Name = "ToggleIndicator"
                ToggleIndicator.Size = UDim2.new(0, 40, 0, 20)
                ToggleIndicator.Position = UDim2.new(1, -52, 0.5, -10)
                ToggleIndicator.BackgroundColor3 = Library.Theme.InElementBackground
                ToggleIndicator.Parent = ToggleInner
                
                local ToggleIndicatorCorner = Instance.new("UICorner")
                ToggleIndicatorCorner.CornerRadius = UDim.new(1, 0)
                ToggleIndicatorCorner.Parent = ToggleIndicator
                
                local ToggleIndicatorCircle = Instance.new("Frame")
                ToggleIndicatorCircle.Name = "ToggleIndicatorCircle"
                ToggleIndicatorCircle.Size = UDim2.new(0, 16, 0, 16)
                ToggleIndicatorCircle.Position = UDim2.new(0, 2, 0.5, -8)
                ToggleIndicatorCircle.BackgroundColor3 = Library.Theme.StrongText
                ToggleIndicatorCircle.Parent = ToggleIndicator
                
                local ToggleIndicatorCircleCorner = Instance.new("UICorner")
                ToggleIndicatorCircleCorner.CornerRadius = UDim.new(1, 0)
                ToggleIndicatorCircleCorner.Parent = ToggleIndicatorCircle
                
                if options.Description ~= "" then
                    local ToggleDescription = Instance.new("TextLabel")
                    ToggleDescription.Name = "ToggleDescription"
                    ToggleDescription.Size = UDim2.new(1, -16, 0, 20)
                    ToggleDescription.Position = UDim2.new(0, 12, 0, 36)
                    ToggleDescription.BackgroundTransparency = 1
                    ToggleDescription.Text = options.Description
                    ToggleDescription.TextColor3 = Library.Theme.WeakText
                    ToggleDescription.Font = Library.Fonts.Regular
                    ToggleDescription.TextSize = 12
                    ToggleDescription.TextWrapped = true
                    ToggleDescription.TextXAlignment = Enum.TextXAlignment.Left
                    ToggleDescription.Parent = Toggle
                end
                
                -- Toggle state
                local Toggled = options.Default
                Library.Flags[options.Flag] = Toggled
                
                local function UpdateToggle()
                    if Toggled then
                        tween(ToggleIndicator, {BackgroundColor3 = Library.Theme.Accent}, 0.2)
                        tween(ToggleIndicatorCircle, {Position = UDim2.new(0, 22, 0.5, -8)}, 0.2)
                    else
                        tween(ToggleIndicator, {BackgroundColor3 = Library.Theme.InElementBackground}, 0.2)
                        tween(ToggleIndicatorCircle, {Position = UDim2.new(0, 2, 0.5, -8)}, 0.2)
                    end
                    
                    options.Callback(Toggled)
                    Library.Flags[options.Flag] = Toggled
                end
                
                -- Initial state
                if Toggled then
                    ToggleIndicator.BackgroundColor3 = Library.Theme.Accent
                    ToggleIndicatorCircle.Position = UDim2.new(0, 22, 0.5, -8)
                end
                
                -- Toggle functionality
                ToggleInner.MouseEnter:Connect(function()
                    tween(ToggleInner, {BackgroundColor3 = Library.Theme.ElementBackgroundHover}, 0.2)
                end)
                
                ToggleInner.MouseLeave:Connect(function()
                    tween(ToggleInner, {BackgroundColor3 = Library.Theme.ElementBackground}, 0.2)
                end)
                
                ToggleInner.MouseButton1Down:Connect(function()
                    createRipple(ToggleInner)
                end)
                
                ToggleInner.MouseButton1Click:Connect(function()
                    Toggled = not Toggled
                    UpdateToggle()
                end)
                
                -- Toggle object
                local ToggleObj = {
                    Value = Toggled,
                    Toggle = function(newValue)
                        if type(newValue) == "boolean" then
                            Toggled = newValue
                        else
                            Toggled = not Toggled
                        end
                        UpdateToggle()
                    end
                }
                
                return ToggleObj
            end
            
            -- Create Slider
            function SectionObj:AddSlider(options)
                options = options or {}
                options.Name = options.Name or "Slider"
                options.Description = options.Description or ""
                options.Min = options.Min or 0
                options.Max = options.Max or 100
                options.Default = options.Default or options.Min
                options.Increment = options.Increment or 1
                options.Flag = options.Flag or options.Name
                options.Callback = options.Callback or function() end
                
                -- Validate default value
                options.Default = math.clamp(options.Default, options.Min, options.Max)
                options.Default = options.Min + (math.floor((options.Default - options.Min) / options.Increment + 0.5) * options.Increment)
                
                local Slider = Instance.new("Frame")
                Slider.Name = options.Name .. "Slider"
                Slider.Size = UDim2.new(1, 0, 0, options.Description ~= "" and 70 or 50)
                Slider.BackgroundTransparency = 1
                Slider.Parent = SectionContent
                
                local SliderInner = Instance.new("Frame")
                SliderInner.Name = "SliderInner"
                SliderInner.Size = UDim2.new(1, 0, 0, 36)
                SliderInner.BackgroundColor3 = Library.Theme.ElementBackground
                SliderInner.Parent = Slider
                
                local SliderCorner = Instance.new("UICorner")
                SliderCorner.CornerRadius = UDim.new(0, 6)
                SliderCorner.Parent = SliderInner
                
                local SliderTitle = Instance.new("TextLabel")
                SliderTitle.Name = "SliderTitle"
                SliderTitle.Size = UDim2.new(1, -16, 0, 20)
                SliderTitle.Position = UDim2.new(0, 12, 0, 0)
                SliderTitle.BackgroundTransparency = 1
                SliderTitle.Text = options.Name
                SliderTitle.TextColor3 = Library.Theme.StrongText
                SliderTitle.Font = Library.Fonts.SemiBold
                SliderTitle.TextSize = 14
                SliderTitle.TextXAlignment = Enum.TextXAlignment.Left
                SliderTitle.Parent = SliderInner
                
                local SliderValue = Instance.new("TextLabel")
                SliderValue.Name = "SliderValue"
                SliderValue.Size = UDim2.new(0, 50, 0, 20)
                SliderValue.Position = UDim2.new(1, -62, 0, 0)
                SliderValue.BackgroundTransparency = 1
                SliderValue.Text = tostring(options.Default)
                SliderValue.TextColor3 = Library.Theme.WeakText
                SliderValue.Font = Library.Fonts.SemiBold
                SliderValue.TextSize = 14
                SliderValue.TextXAlignment = Enum.TextXAlignment.Right
                SliderValue.Parent = SliderInner
                
                local SliderTrack = Instance.new("Frame")
                SliderTrack.Name = "SliderTrack"
                SliderTrack.Size = UDim2.new(1, -24, 0, 6)
                SliderTrack.Position = UDim2.new(0, 12, 0, 25)
                SliderTrack.BackgroundColor3 = Library.Theme.InElementBackground
                SliderTrack.Parent = SliderInner
                
                local SliderTrackCorner = Instance.new("UICorner")
                SliderTrackCorner.CornerRadius = UDim.new(1, 0)
                SliderTrackCorner.Parent = SliderTrack
                
                local SliderFill = Instance.new("Frame")
                SliderFill.Name = "SliderFill"
                SliderFill.BackgroundColor3 = Library.Theme.Accent
                SliderFill.Parent = SliderTrack
                
                local SliderFillCorner = Instance.new("UICorner")
                SliderFillCorner.CornerRadius = UDim.new(1, 0)
                SliderFillCorner.Parent = SliderFill
                
                local SliderDot = Instance.new("Frame")
                SliderDot.Name = "SliderDot"
                SliderDot.Size = UDim2.new(0, 12, 0, 12)
                SliderDot.BackgroundColor3 = Library.Theme.StrongText
                SliderDot.Position = UDim2.new(0, 0, 0.5, -6)
                SliderDot.Parent = SliderFill
                
                local SliderDotCorner = Instance.new("UICorner")
                SliderDotCorner.CornerRadius = UDim.new(1, 0)
                SliderDotCorner.Parent = SliderDot
                
                if options.Description ~= "" then
                    local SliderDescription = Instance.new("TextLabel")
                    SliderDescription.Name = "SliderDescription"
                    SliderDescription.Size = UDim2.new(1, -16, 0, 20)
                    SliderDescription.Position = UDim2.new(0, 12, 0, 36)
                    SliderDescription.BackgroundTransparency = 1
                    SliderDescription.Text = options.Description
                    SliderDescription.TextColor3 = Library.Theme.WeakText
                    SliderDescription.Font = Library.Fonts.Regular
                    SliderDescription.TextSize = 12
                    SliderDescription.TextWrapped = true
                    SliderDescription.TextXAlignment = Enum.TextXAlignment.Left
                    SliderDescription.Parent = Slider
                end
                
                -- Slider state
                local Value = options.Default
                Library.Flags[options.Flag] = Value
                
                -- Calculate slider fill based on value
                local function UpdateSlider(value, updateValue)
                    -- Calculate the percentage of the slider
                    local percent = (value - options.Min) / (options.Max - options.Min)
                    
                    -- Update the slider fill and dot position
                    SliderFill.Size = UDim2.new(percent, 0, 1, 0)
                    SliderDot.Position = UDim2.new(1, -6, 0.5, -6)
                    
                    -- Update the value text
                    SliderValue.Text = tostring(value)
                    
                    -- Update the value and callback if needed
                    if updateValue then
                        Value = value
                        Library.Flags[options.Flag] = Value
                        options.Callback(Value)
                    end
                end
                
                -- Initial state
                UpdateSlider(Value, false)
                
                -- Slider functionality
                local isDragging = false
                
                SliderInner.MouseEnter:Connect(function()
                    tween(SliderInner, {BackgroundColor3 = Library.Theme.ElementBackgroundHover}, 0.2)
                end)
                
                SliderInner.MouseLeave:Connect(function()
                    tween(SliderInner, {BackgroundColor3 = Library.Theme.ElementBackground}, 0.2)
                end)
                
                SliderTrack.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        isDragging = true
                    end
                end)
                
                SliderTrack.InputEnded:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        isDragging = false
                    end
                end)
                
                UserInputService.InputChanged:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseMovement and isDragging then
                        -- Calculate the mouse position relative to the track
                        local mousePos = UserInputService:GetMouseLocation().X
                        local trackPos = SliderTrack.AbsolutePosition.X
                        local trackWidth = SliderTrack.AbsoluteSize.X
                        local relativePos = math.clamp((mousePos - trackPos) / trackWidth, 0, 1)
                        
                        -- Calculate the value based on the position
                        local newValue = options.Min + ((options.Max - options.Min) * relativePos)
                        
                        -- Apply increment
                        newValue = options.Min + (math.floor((newValue - options.Min) / options.Increment + 0.5) * options.Increment)
                        
                        -- Update the slider
                        UpdateSlider(newValue, true)
                    end
                end)
                
                -- Slider object
                local SliderObj = {
                    Value = Value,
                    SetValue = function(self, value)
                        value = math.clamp(value, options.Min, options.Max)
                        value = options.Min + (math.floor((value - options.Min) / options.Increment + 0.5) * options.Increment)
                        UpdateSlider(value, true)
                    end
                }
                
                return SliderObj
            end
            
            -- Create Dropdown
            function SectionObj:AddDropdown(options)
                options = options or {}
                options.Name = options.Name or "Dropdown"
                options.Description = options.Description or ""
                options.Options = options.Options or {}
                options.Default = options.Default or nil
                options.Flag = options.Flag or options.Name
                options.Callback = options.Callback or function() end
                
                local Dropdown = Instance.new("Frame")
                Dropdown.Name = options.Name .. "Dropdown"
                Dropdown.Size = UDim2.new(1, 0, 0, options.Description ~= "" and 60 or 36)
                Dropdown.BackgroundTransparency = 1
                Dropdown.Parent = SectionContent
                
                local DropdownInner = Instance.new("TextButton")
                DropdownInner.Name = "DropdownInner"
                DropdownInner.Size = UDim2.new(1, 0, 0, 36)
                DropdownInner.BackgroundColor3 = Library.Theme.ElementBackground
                DropdownInner.Text = ""
                DropdownInner.AutoButtonColor = false
                DropdownInner.ClipsDescendants = true
                DropdownInner.Parent = Dropdown
                
                local DropdownCorner = Instance.new("UICorner")
                DropdownCorner.CornerRadius = UDim.new(0, 6)
                DropdownCorner.Parent = DropdownInner
                
                local DropdownTitle = Instance.new("TextLabel")
                DropdownTitle.Name = "DropdownTitle"
                DropdownTitle.Size = UDim2.new(1, -40, 0, 36)
                DropdownTitle.Position = UDim2.new(0, 12, 0, 0)
                DropdownTitle.BackgroundTransparency = 1
                DropdownTitle.Text = options.Name
                DropdownTitle.TextColor3 = Library.Theme.StrongText
                DropdownTitle.Font = Library.Fonts.SemiBold
                DropdownTitle.TextSize = 14
                DropdownTitle.TextXAlignment = Enum.TextXAlignment.Left
                DropdownTitle.Parent = DropdownInner
                
                local DropdownIcon = Instance.new("ImageLabel")
                DropdownIcon.Name = "DropdownIcon"
                DropdownIcon.Size = UDim2.new(0, 16, 0, 16)
                DropdownIcon.Position = UDim2.new(1, -28, 0.5, -8)
                DropdownIcon.BackgroundTransparency = 1
                DropdownIcon.Image = "rbxassetid://6031091004" -- Chevron down
                DropdownIcon.ImageColor3 = Library.Theme.StrongText
                DropdownIcon.Parent = DropdownInner
                
                if options.Description ~= "" then
                    local DropdownDescription = Instance.new("TextLabel")
                    DropdownDescription.Name = "DropdownDescription"
                    DropdownDescription.Size = UDim2.new(1, -16, 0, 20)
                    DropdownDescription.Position = UDim2.new(0, 12, 0, 36)
                    DropdownDescription.BackgroundTransparency = 1
                    DropdownDescription.Text = options.Description
                    DropdownDescription.TextColor3 = Library.Theme.WeakText
                    DropdownDescription.Font = Library.Fonts.Regular
                    DropdownDescription.TextSize = 12
                    DropdownDescription.TextWrapped = true
                    DropdownDescription.TextXAlignment = Enum.TextXAlignment.Left
                    DropdownDescription.Parent = Dropdown
                end
                
                -- Dropdown menu
                local DropdownMenu = Instance.new("Frame")
                DropdownMenu.Name = "DropdownMenu"
                DropdownMenu.Size = UDim2.new(1, 0, 0, 0) -- Will be auto-sized
                DropdownMenu.Position = UDim2.new(0, 0, 0, 36)
                DropdownMenu.BackgroundColor3 = Library.Theme.ElementBackground
                DropdownMenu.BorderSizePixel = 0
                DropdownMenu.ClipsDescendants = true
                DropdownMenu.Visible = false
                DropdownMenu.Parent = Dropdown
                
                local DropdownMenuCorner = Instance.new("UICorner")
                DropdownMenuCorner.CornerRadius = UDim.new(0, 6)
                DropdownMenuCorner.Parent = DropdownMenu
                
                local DropdownMenuLayout = Instance.new("UIListLayout")
                DropdownMenuLayout.Padding = UDim.new(0, 5)
                DropdownMenuLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
                DropdownMenuLayout.SortOrder = Enum.SortOrder.LayoutOrder
                DropdownMenuLayout.Parent = DropdownMenu
                
                local DropdownMenuPadding = Instance.new("UIPadding")
                DropdownMenuPadding.PaddingTop = UDim.new(0, 5)
                DropdownMenuPadding.PaddingBottom = UDim.new(0, 5)
                DropdownMenuPadding.Parent = DropdownMenu
                
                -- Search bar
                local DropdownSearch = Instance.new("Frame")
                DropdownSearch.Name = "DropdownSearch"
                DropdownSearch.Size = UDim2.new(1, -10, 0, 30)
                DropdownSearch.BackgroundColor3 = Library.Theme.InElementBackground
                DropdownSearch.BorderSizePixel = 0
                DropdownSearch.Parent = DropdownMenu
                
                local DropdownSearchCorner = Instance.new("UICorner")
                DropdownSearchCorner.CornerRadius = UDim.new(0, 6)
                DropdownSearchCorner.Parent = DropdownSearch
                
                local DropdownSearchIcon = Instance.new("ImageLabel")
                DropdownSearchIcon.Name = "DropdownSearchIcon"
                DropdownSearchIcon.Size = UDim2.new(0, 16, 0, 16)
                DropdownSearchIcon.Position = UDim2.new(0, 8, 0.5, -8)
                DropdownSearchIcon.BackgroundTransparency = 1
                
                local searchIconData = getIcon("search")
                DropdownSearchIcon.Image = "rbxassetid://" .. searchIconData.id
                DropdownSearchIcon.ImageRectSize = searchIconData.imageRectSize
                DropdownSearchIcon.ImageRectOffset = searchIconData.imageRectOffset
                DropdownSearchIcon.ImageColor3 = Library.Theme.WeakText
                DropdownSearchIcon.Parent = DropdownSearch
                
                local DropdownSearchBox = Instance.new("TextBox")
                DropdownSearchBox.Name = "DropdownSearchBox"
                DropdownSearchBox.Size = UDim2.new(1, -35, 1, 0)
                DropdownSearchBox.Position = UDim2.new(0, 30, 0, 0)
                DropdownSearchBox.BackgroundTransparency = 1
                DropdownSearchBox.Text = ""
                DropdownSearchBox.PlaceholderText = "Search..."
                DropdownSearchBox.TextColor3 = Library.Theme.StrongText
                DropdownSearchBox.PlaceholderColor3 = Library.Theme.WeakText
                DropdownSearchBox.Font = Library.Fonts.Regular
                DropdownSearchBox.TextSize = 14
                DropdownSearchBox.TextXAlignment = Enum.TextXAlignment.Left
                DropdownSearchBox.Parent = DropdownSearch
                
                -- Dropdown options container
                local DropdownOptions = Instance.new("Frame")
                DropdownOptions.Name = "DropdownOptions"
                DropdownOptions.Size = UDim2.new(1, -10, 0, 0) -- Will be auto-sized
                DropdownOptions.BackgroundTransparency = 1
                DropdownOptions.AutomaticSize = Enum.AutomaticSize.Y
                DropdownOptions.Parent = DropdownMenu
                
                local DropdownOptionsLayout = Instance.new("UIListLayout")
                DropdownOptionsLayout.Padding = UDim.new(0, 5)
                DropdownOptionsLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
                DropdownOptionsLayout.SortOrder = Enum.SortOrder.LayoutOrder
                DropdownOptionsLayout.Parent = DropdownOptions
                
                -- Dropdown state
                local Selected = options.Default
                local IsOpen = false
                Library.Flags[options.Flag] = Selected
                
                -- Create dropdown options
                local OptionButtons = {}
                
                local function CreateOption(option)
                    local OptionButton = Instance.new("TextButton")
                    OptionButton.Name = option .. "Option"
                    OptionButton.Size = UDim2.new(1, 0, 0, 30)
                    OptionButton.BackgroundColor3 = Library.Theme.InElementBackground
                    OptionButton.Text = ""
                    OptionButton.AutoButtonColor = false
                    OptionButton.Parent = DropdownOptions
                    
                    local OptionCorner = Instance.new("UICorner")
                    OptionCorner.CornerRadius = UDim.new(0, 6)
                    OptionCorner.Parent = OptionButton
                    
                    local OptionText = Instance.new("TextLabel")
                    OptionText.Name = "OptionText"
                    OptionText.Size = UDim2.new(1, -16, 1, 0)
                    OptionText.Position = UDim2.new(0, 8, 0, 0)
                    OptionText.BackgroundTransparency = 1
                    OptionText.Text = option
                    OptionText.TextColor3 = Library.Theme.StrongText
                    OptionText.Font = Library.Fonts.Regular
                    OptionText.TextSize = 14
                    OptionText.TextXAlignment = Enum.TextXAlignment.Left
                    OptionText.Parent = OptionButton
                    
                    -- Option functionality
                    OptionButton.MouseEnter:Connect(function()
                        tween(OptionButton, {BackgroundColor3 = Library.Theme.ElementBackgroundHover}, 0.2)
                    end)
                    
                    OptionButton.MouseLeave:Connect(function()
                        tween(OptionButton, {BackgroundColor3 = Library.Theme.InElementBackground}, 0.2)
                    end)
                    
                    OptionButton.MouseButton1Down:Connect(function()
                        createRipple(OptionButton)
                    end)
                    
                    OptionButton.MouseButton1Click:Connect(function()
                        Selected = option
                        Library.Flags[options.Flag] = Selected
                        DropdownTitle.Text = options.Name .. ": " .. Selected
                        options.Callback(Selected)
                        
                        -- Close the dropdown
                        IsOpen = false
                        tween(DropdownIcon, {Rotation = 0}, 0.2)
                        tween(DropdownMenu, {Size = UDim2.new(1, 0, 0, 0)}, 0.2)
                        wait(0.2)
                        DropdownMenu.Visible = false
                        Dropdown.Size = UDim2.new(1, 0, 0, options.Description ~= "" and 60 or 36)
                    end)
                    
                    OptionButtons[option] = OptionButton
                    return OptionButton
                end
                
                for _, option in ipairs(options.Options) do
                    CreateOption(option)
                end
                
                -- Update dropdown height based on content
                local function UpdateDropdownHeight()
                    local visibleOptions = 0
                    for _, button in pairs(OptionButtons) do
                        if button.Visible then
                            visibleOptions = visibleOptions + 1
                        end
                    end
                    
                    local contentHeight = (visibleOptions * 30) + ((visibleOptions - 1) * 5) + 10
                    local searchHeight = 30 + 10 -- Search bar + padding
                    local totalHeight = contentHeight + searchHeight
                    
                    -- Limit height to show at most 5 options
                    local maxOptionsHeight = (5 * 30) + ((5 - 1) * 5) + 10
                    local maxHeight = maxOptionsHeight + searchHeight
                    
                    if IsOpen then
                        DropdownMenu.Size = UDim2.new(1, 0, 0, math.min(totalHeight, maxHeight))
                    end
                end
                
                -- Search functionality
                DropdownSearchBox:GetPropertyChangedSignal("Text"):Connect(function()
                    local searchText = string.lower(DropdownSearchBox.Text)
                    
                    for option, button in pairs(OptionButtons) do
                        if searchText == "" then
                            button.Visible = true
                        else
                            local optionText = string.lower(option)
                            button.Visible = string.find(optionText, searchText) ~= nil
                        end
                    end
                    
                    UpdateDropdownHeight()
                end)
                
                -- Initial state
                if Selected then
                    DropdownTitle.Text = options.Name .. ": " .. Selected
                end
                
                -- Dropdown functionality
                DropdownInner.MouseEnter:Connect(function()
                    tween(DropdownInner, {BackgroundColor3 = Library.Theme.ElementBackgroundHover}, 0.2)
                end)
                
                DropdownInner.MouseLeave:Connect(function()
                    tween(DropdownInner, {BackgroundColor3 = Library.Theme.ElementBackground}, 0.2)
                end)
                
                DropdownInner.MouseButton1Down:Connect(function()
                    createRipple(DropdownInner)
                end)
                
                DropdownInner.MouseButton1Click:Connect(function()
                    IsOpen = not IsOpen
                    
                    if IsOpen then
                        -- Close any other open dropdown
                        if Library.OpenedDropdown and Library.OpenedDropdown ~= Dropdown then
                            Library.OpenedDropdown.DropdownInner.DropdownIcon.Rotation = 0
                            tween(Library.OpenedDropdown.DropdownMenu, {Size = UDim2.new(1, 0, 0, 0)}, 0.2)
                            wait(0.2)
                            Library.OpenedDropdown.DropdownMenu.Visible = false
                            Library.OpenedDropdown.Size = UDim2.new(1, 0, 0, options.Description ~= "" and 60 or 36)
                        end
                        
                        Library.OpenedDropdown = Dropdown
                        
                        -- Reset search
                        DropdownSearchBox.Text = ""
                        for _, button in pairs(OptionButtons) do
                            button.Visible = true
                        end
                        
                        -- Open dropdown
                        DropdownMenu.Visible = true
                        UpdateDropdownHeight()
                        tween(DropdownIcon, {Rotation = 180}, 0.2)
                        
                        -- Adjust section size
                        local newSize = UDim2.new(1, 0, 0, options.Description ~= "" and 60 or 36)
                        newSize = UDim2.new(newSize.X.Scale, newSize.X.Offset, newSize.Y.Scale, newSize.Y.Offset + DropdownMenu.AbsoluteSize.Y)
                        Dropdown.Size = newSize
                    else
                        -- Close dropdown
                        tween(DropdownIcon, {Rotation = 0}, 0.2)
                        tween(DropdownMenu, {Size = UDim2.new(1, 0, 0, 0)}, 0.2)
                        wait(0.2)
                        DropdownMenu.Visible = false
                        Dropdown.Size = UDim2.new(1, 0, 0, options.Description ~= "" and 60 or 36)
                        Library.OpenedDropdown = nil
                    end
                end)
                
                -- Dropdown object
                local DropdownObj = {
                    Value = Selected,
                    Options = options.Options,
                    SetValue = function(self, value)
                        if table.find(options.Options, value) then
                            Selected = value
                            Library.Flags[options.Flag] = Selected
                            DropdownTitle.Text = options.Name .. ": " .. Selected
                            options.Callback(Selected)
                        end
                    end,
                    AddOption = function(self, option)
                        if not table.find(options.Options, option) then
                            table.insert(options.Options, option)
                            CreateOption(option)
                            UpdateDropdownHeight()
                        end
                    end,
                    RemoveOption = function(self, option)
                        if table.find(options.Options, option) then
                            table.remove(options.Options, table.find(options.Options, option))
                            if OptionButtons[option] then
                                OptionButtons[option]:Destroy()
                                OptionButtons[option] = nil
                                UpdateDropdownHeight()
                            end
                            
                            if Selected == option then
                                Selected = nil
                                Library.Flags[options.Flag] = Selected
                                DropdownTitle.Text = options.Name
                                options.Callback(Selected)
                            end
                        end
                    end
                }
                
                return DropdownObj
            end
            
            -- Create Label
            function SectionObj:AddLabel(options)
                options = options or {}
                options.Text = options.Text or "Label"
                options.Color = options.Color or Library.Theme.WeakText
                
                local Label = Instance.new("Frame")
                Label.Name = "Label"
                Label.Size = UDim2.new(1, 0, 0, 20)
                Label.BackgroundTransparency = 1
                Label.Parent = SectionContent
                
                local LabelText = Instance.new("TextLabel")
                LabelText.Name = "LabelText"
                LabelText.Size = UDim2.new(1, -16, 1, 0)
                LabelText.Position = UDim2.new(0, 8, 0, 0)
                LabelText.BackgroundTransparency = 1
                LabelText.Text = options.Text
                LabelText.TextColor3 = options.Color
                LabelText.Font = Library.Fonts.Regular
                LabelText.TextSize = 14
                LabelText.TextWrapped = true
                LabelText.TextXAlignment = Enum.TextXAlignment.Left
                LabelText.Parent = Label
                
                -- Label object
                local LabelObj = {
                    SetText = function(self, text)
                        LabelText.Text = text
                    end,
                    SetColor = function(self, color)
                        LabelText.TextColor3 = color
                    end
                }
                
                return LabelObj
            end
            
            -- Create Paragraph
            function SectionObj:AddParagraph(options)
                options = options or {}
                options.Title = options.Title or "Title"
                options.Content = options.Content or "Content"
                options.Color = options.Color or nil
                
                local Paragraph = Instance.new("Frame")
                Paragraph.Name = "Paragraph"
                Paragraph.Size = UDim2.new(1, 0, 0, 0) -- Auto size
                Paragraph.BackgroundColor3 = options.Color and options.Color or Library.Theme.SectionBackground
                Paragraph.BackgroundTransparency = options.Color and 0.5 or 1
                Paragraph.AutomaticSize = Enum.AutomaticSize.Y
                Paragraph.Parent = SectionContent
                
                if options.Color then
                    local ParagraphCorner = Instance.new("UICorner")
                    ParagraphCorner.CornerRadius = UDim.new(0, 6)
                    ParagraphCorner.Parent = Paragraph
                    
                    local ParagraphPadding = Instance.new("UIPadding")
                    ParagraphPadding.PaddingTop = UDim.new(0, 8)
                    ParagraphPadding.PaddingBottom = UDim.new(0, 8)
                    ParagraphPadding.PaddingLeft = UDim.new(0, 8)
                    ParagraphPadding.PaddingRight = UDim.new(0, 8)
                    ParagraphPadding.Parent = Paragraph
                end
                
                local ParagraphTitle = Instance.new("TextLabel")
                ParagraphTitle.Name = "ParagraphTitle"
                ParagraphTitle.Size = UDim2.new(1, 0, 0, 20)
                ParagraphTitle.BackgroundTransparency = 1
                ParagraphTitle.Text = options.Title
                ParagraphTitle.TextColor3 = Library.Theme.StrongText
                ParagraphTitle.Font = Library.Fonts.SemiBold
                ParagraphTitle.TextSize = 14
                ParagraphTitle.TextWrapped = true
                ParagraphTitle.TextXAlignment = Enum.TextXAlignment.Left
                ParagraphTitle.Parent = Paragraph
                
                local ParagraphContent = Instance.new("TextLabel")
                ParagraphContent.Name = "ParagraphContent"
                ParagraphContent.Size = UDim2.new(1, 0, 0, 0)
                ParagraphContent.Position = UDim2.new(0, 0, 0, 20)
                ParagraphContent.BackgroundTransparency = 1
                ParagraphContent.Text = options.Content
                ParagraphContent.TextColor3 = Library.Theme.WeakText
                ParagraphContent.Font = Library.Fonts.Regular
                ParagraphContent.TextSize = 14
                ParagraphContent.TextWrapped = true
                ParagraphContent.TextXAlignment = Enum.TextXAlignment.Left
                ParagraphContent.AutomaticSize = Enum.AutomaticSize.Y
                ParagraphContent.Parent = Paragraph
                
                -- Paragraph object
                local ParagraphObj = {
                    SetTitle = function(self, title)
                        ParagraphTitle.Text = title
                    end,
                    SetContent = function(self, content)
                        ParagraphContent.Text = content
                    end,
                    SetColor = function(self, color)
                        Paragraph.BackgroundColor3 = color
                        Paragraph.BackgroundTransparency = 0.5
                    end
                }
                
                return ParagraphObj
            end
            
            -- Create Divider
            function SectionObj:AddDivider(options)
                options = options or {}
                options.Text = options.Text or nil
                
                local Divider = Instance.new("Frame")
                Divider.Name = "Divider"
                Divider.Size = UDim2.new(1, 0, 0, options.Text and 30 or 10)
                Divider.BackgroundTransparency = 1
                Divider.Parent = SectionContent
                
                local DividerLine = Instance.new("Frame")
                DividerLine.Name = "DividerLine"
                DividerLine.Size = UDim2.new(1, 0, 0, 1)
                DividerLine.Position = UDim2.new(0, 0, 0.5, 0)
                DividerLine.BackgroundColor3 = Library.Theme.Stroke
                DividerLine.BorderSizePixel = 0
                DividerLine.Parent = Divider
                
                if options.Text then
                    local DividerText = Instance.new("TextLabel")
                    DividerText.Name = "DividerText"
                    DividerText.Size = UDim2.new(0, 0, 1, 0) -- Auto size
                    DividerText.Position = UDim2.new(0.5, 0, 0, 0)
                    DividerText.BackgroundColor3 = Library.Theme.SectionBackground
                    DividerText.BorderSizePixel = 0
                    DividerText.Text = " " .. options.Text .. " "
                    DividerText.TextColor3 = Library.Theme.WeakText
                    DividerText.Font = Library.Fonts.SemiBold
                    DividerText.TextSize = 14
                    DividerText.AutomaticSize = Enum.AutomaticSize.X
                    DividerText.Parent = Divider
                    
                    -- Center the text
                    DividerText.AnchorPoint = Vector2.new(0.5, 0.5)
                    DividerText.Position = UDim2.new(0.5, 0, 0.5, 0)
                end
                
                -- Divider object
                local DividerObj = {
                    SetText = function(self, text)
                        if Divider:FindFirstChild("DividerText") then
                            Divider.DividerText.Text = " " .. text .. " "
                        else
                            local DividerText = Instance.new("TextLabel")
                            DividerText.Name = "DividerText"
                            DividerText.Size = UDim2.new(0, 0, 1, 0) -- Auto size
                            DividerText.Position = UDim2.new(0.5, 0, 0, 0)
                            DividerText.BackgroundColor3 = Library.Theme.SectionBackground
                            DividerText.BorderSizePixel = 0
                            DividerText.Text = " " .. text .. " "
                            DividerText.TextColor3 = Library.Theme.WeakText
                            DividerText.Font = Library.Fonts.SemiBold
                            DividerText.TextSize = 14
                            DividerText.AutomaticSize = Enum.AutomaticSize.X
                            DividerText.Parent = Divider
                            
                            -- Center the text
                            DividerText.AnchorPoint = Vector2.new(0.5, 0.5)
                            DividerText.Position = UDim2.new(0.5, 0, 0.5, 0)
                            
                            -- Adjust divider height
                            Divider.Size = UDim2.new(1, 0, 0, 30)
                        end
                    end
                }
                
                return DividerObj
            end
            
            -- Create Input
            function SectionObj:AddInput(options)
                options = options or {}
                options.Name = options.Name or "Input"
                options.Description = options.Description or ""
                options.PlaceholderText = options.PlaceholderText or "Enter text..."
                options.Default = options.Default or ""
                options.Flag = options.Flag or options.Name
                options.Callback = options.Callback or function() end
                
                local Input = Instance.new("Frame")
                Input.Name = options.Name .. "Input"
                Input.Size = UDim2.new(1, 0, 0, options.Description ~= "" and 70 or 50)
                Input.BackgroundTransparency = 1
                Input.Parent = SectionContent
                
                local InputInner = Instance.new("Frame")
                InputInner.Name = "InputInner"
                InputInner.Size = UDim2.new(1, 0, 0, 36)
                InputInner.BackgroundColor3 = Library.Theme.ElementBackground
                InputInner.Parent = Input
                
                local InputCorner = Instance.new("UICorner")
                InputCorner.CornerRadius = UDim.new(0, 6)
                InputCorner.Parent = InputInner
                
                local InputTitle = Instance.new("TextLabel")
                InputTitle.Name = "InputTitle"
                InputTitle.Size = UDim2.new(1, -16, 0, 20)
                InputTitle.Position = UDim2.new(0, 12, 0, 0)
                InputTitle.BackgroundTransparency = 1
                InputTitle.Text = options.Name
                InputTitle.TextColor3 = Library.Theme.StrongText
                InputTitle.Font = Library.Fonts.SemiBold
                InputTitle.TextSize = 14
                InputTitle.TextXAlignment = Enum.TextXAlignment.Left
                InputTitle.Parent = InputInner
                
                local InputBox = Instance.new("TextBox")
                InputBox.Name = "InputBox"
                InputBox.Size = UDim2.new(1, -24, 0, 20)
                InputBox.Position = UDim2.new(0, 12, 0, 20)
                InputBox.BackgroundTransparency = 1
                InputBox.Text = options.Default
                InputBox.PlaceholderText = options.PlaceholderText
                InputBox.TextColor3 = Library.Theme.StrongText
                InputBox.PlaceholderColor3 = Library.Theme.WeakText
                InputBox.Font = Library.Fonts.Regular
                InputBox.TextSize = 14
                InputBox.TextXAlignment = Enum.TextXAlignment.Left
                InputBox.ClearTextOnFocus = false
                InputBox.Parent = InputInner
                
                if options.Description ~= "" then
                    local InputDescription = Instance.new("TextLabel")
                    InputDescription.Name = "InputDescription"
                    InputDescription.Size = UDim2.new(1, -16, 0, 20)
                    InputDescription.Position = UDim2.new(0, 12, 0, 36)
                    InputDescription.BackgroundTransparency = 1
                    InputDescription.Text = options.Description
                    InputDescription.TextColor3 = Library.Theme.WeakText
                    InputDescription.Font = Library.Fonts.Regular
                    InputDescription.TextSize = 12
                    InputDescription.TextWrapped = true
                    InputDescription.TextXAlignment = Enum.TextXAlignment.Left
                    InputDescription.Parent = Input
                end
                
                -- Input state
                local Value = options.Default
                Library.Flags[options.Flag] = Value
                
                -- Input functionality
                InputInner.MouseEnter:Connect(function()
                    tween(InputInner, {BackgroundColor3 = Library.Theme.ElementBackgroundHover}, 0.2)
                end)
                
                InputInner.MouseLeave:Connect(function()
                    tween(InputInner, {BackgroundColor3 = Library.Theme.ElementBackground}, 0.2)
                end)
                
                InputBox.Focused:Connect(function()
                    tween(InputInner, {BackgroundColor3 = Library.Theme.ElementBackgroundHover}, 0.2)
                end)
                
                InputBox.FocusLost:Connect(function(enterPressed)
                    tween(InputInner, {BackgroundColor3 = Library.Theme.ElementBackground}, 0.2)
                    
                    Value = InputBox.Text
                    Library.Flags[options.Flag] = Value
                    options.Callback(Value)
                end)
                
                -- Input object
                local InputObj = {
                    Value = Value,
                    SetValue = function(self, value)
                        Value = tostring(value)
                        InputBox.Text = Value
                        Library.Flags[options.Flag] = Value
                        options.Callback(Value)
                    end
                }
                
                return InputObj
            end
            
            -- Create ColorPicker
            function SectionObj:AddColorPicker(options)
                options = options or {}
                options.Name = options.Name or "ColorPicker"
                options.Description = options.Description or ""
                options.Default = options.Default or Color3.fromRGB(255, 255, 255)
                options.Flag = options.Flag or options.Name
                options.Callback = options.Callback or function() end
                
                local ColorPicker = Instance.new("Frame")
                ColorPicker.Name = options.Name .. "ColorPicker"
                ColorPicker.Size = UDim2.new(1, 0, 0, options.Description ~= "" and 60 or 36)
                ColorPicker.BackgroundTransparency = 1
                ColorPicker.Parent = SectionContent
                
                local ColorPickerInner = Instance.new("TextButton")
                ColorPickerInner.Name = "ColorPickerInner"
                ColorPickerInner.Size = UDim2.new(1, 0, 0, 36)
                ColorPickerInner.BackgroundColor3 = Library.Theme.ElementBackground
                ColorPickerInner.Text = ""
                ColorPickerInner.AutoButtonColor = false
                ColorPickerInner.ClipsDescendants = true
                ColorPickerInner.Parent = ColorPicker
                
                local ColorPickerCorner = Instance.new("UICorner")
                ColorPickerCorner.CornerRadius = UDim.new(0, 6)
                ColorPickerCorner.Parent = ColorPickerInner
                
                local ColorPickerTitle = Instance.new("TextLabel")
                ColorPickerTitle.Name = "ColorPickerTitle"
                ColorPickerTitle.Size = UDim2.new(1, -64, 1, 0)
                ColorPickerTitle.Position = UDim2.new(0, 12, 0, 0)
                ColorPickerTitle.BackgroundTransparency = 1
                ColorPickerTitle.Text = options.Name
                ColorPickerTitle.TextColor3 = Library.Theme.StrongText
                ColorPickerTitle.Font = Library.Fonts.SemiBold
                ColorPickerTitle.TextSize = 14
                ColorPickerTitle.TextXAlignment = Enum.TextXAlignment.Left
                ColorPickerTitle.Parent = ColorPickerInner
                
                local ColorPickerPreview = Instance.new("Frame")
                ColorPickerPreview.Name = "ColorPickerPreview"
                ColorPickerPreview.Size = UDim2.new(0, 40, 0, 20)
                ColorPickerPreview.Position = UDim2.new(1, -52, 0.5, -10)
                ColorPickerPreview.BackgroundColor3 = options.Default
                ColorPickerPreview.Parent = ColorPickerInner
                
                local ColorPickerPreviewCorner = Instance.new("UICorner")
                ColorPickerPreviewCorner.CornerRadius = UDim.new(0, 4)
                ColorPickerPreviewCorner.Parent = ColorPickerPreview
                
                if options.Description ~= "" then
                    local ColorPickerDescription = Instance.new("TextLabel")
                    ColorPickerDescription.Name = "ColorPickerDescription"
                    ColorPickerDescription.Size = UDim2.new(1, -16, 0, 20)
                    ColorPickerDescription.Position = UDim2.new(0, 12, 0, 36)
                    ColorPickerDescription.BackgroundTransparency = 1
                    ColorPickerDescription.Text = options.Description
                    ColorPickerDescription.TextColor3 = Library.Theme.WeakText
                    ColorPickerDescription.Font = Library.Fonts.Regular
                    ColorPickerDescription.TextSize = 12
                    ColorPickerDescription.TextWrapped = true
                    ColorPickerDescription.TextXAlignment = Enum.TextXAlignment.Left
                    ColorPickerDescription.Parent = ColorPicker
                end
                
                -- Color picker popup
                local ColorPickerPopup = Instance.new("Frame")
                ColorPickerPopup.Name = "ColorPickerPopup"
                ColorPickerPopup.Size = UDim2.new(0, 250, 0, 200)
                ColorPickerPopup.Position = UDim2.new(1, -260, 0, 40)
                ColorPickerPopup.BackgroundColor3 = Library.Theme.ElementBackground
                ColorPickerPopup.Visible = false
                ColorPickerPopup.Parent = ColorPicker
                
                local ColorPickerPopupCorner = Instance.new("UICorner")
                ColorPickerPopupCorner.CornerRadius = UDim.new(0, 6)
                ColorPickerPopupCorner.Parent = ColorPickerPopup
                
                -- Color picker hue and saturation
                local ColorPickerHueSaturation = Instance.new("ImageButton")
                ColorPickerHueSaturation.Name = "ColorPickerHueSaturation"
                ColorPickerHueSaturation.Size = UDim2.new(0, 200, 0, 150)
                ColorPickerHueSaturation.Position = UDim2.new(0, 10, 0, 10)
                ColorPickerHueSaturation.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
                ColorPickerHueSaturation.Image = "rbxassetid://4155801252"
                ColorPickerHueSaturation.AutoButtonColor = false
                ColorPickerHueSaturation.Parent = ColorPickerPopup
                
                local ColorPickerHueSaturationCorner = Instance.new("UICorner")
                ColorPickerHueSaturationCorner.CornerRadius = UDim.new(0, 4)
                ColorPickerHueSaturationCorner.Parent = ColorPickerHueSaturation
                
                local ColorPickerHueSaturationSelector = Instance.new("Frame")
                ColorPickerHueSaturationSelector.Name = "ColorPickerHueSaturationSelector"
                ColorPickerHueSaturationSelector.Size = UDim2.new(0, 10, 0, 10)
                ColorPickerHueSaturationSelector.Position = UDim2.new(1, -5, 0, -5)
                ColorPickerHueSaturationSelector.AnchorPoint = Vector2.new(0.5, 0.5)
                ColorPickerHueSaturationSelector.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ColorPickerHueSaturationSelector.Parent = ColorPickerHueSaturation
                
                local ColorPickerHueSaturationSelectorCorner = Instance.new("UICorner")
                ColorPickerHueSaturationSelectorCorner.CornerRadius = UDim.new(1, 0)
                ColorPickerHueSaturationSelectorCorner.Parent = ColorPickerHueSaturationSelector
                
                -- Color picker value (brightness)
                local ColorPickerValue = Instance.new("ImageButton")
                ColorPickerValue.Name = "ColorPickerValue"
                ColorPickerValue.Size = UDim2.new(0, 20, 0, 150)
                ColorPickerValue.Position = UDim2.new(0, 220, 0, 10)
                ColorPickerValue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ColorPickerValue.AutoButtonColor = false
                ColorPickerValue.Parent = ColorPickerPopup
                
                local ColorPickerValueCorner = Instance.new("UICorner")
                ColorPickerValueCorner.CornerRadius = UDim.new(0, 4)
                ColorPickerValueCorner.Parent = ColorPickerValue
                
                local ColorPickerValueGradient = Instance.new("UIGradient")
                ColorPickerValueGradient.Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)),
                    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))
                })
                ColorPickerValueGradient.Rotation = 90
                ColorPickerValueGradient.Parent = ColorPickerValue
                
                local ColorPickerValueSelector = Instance.new("Frame")
                ColorPickerValueSelector.Name = "ColorPickerValueSelector"
                ColorPickerValueSelector.Size = UDim2.new(1, 0, 0, 2)
                ColorPickerValueSelector.Position = UDim2.new(0, 0, 1, -1)
                ColorPickerValueSelector.AnchorPoint = Vector2.new(0, 0.5)
                ColorPickerValueSelector.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ColorPickerValueSelector.Parent = ColorPickerValue
                
                -- Color picker RGB inputs
                local ColorPickerRGB = Instance.new("Frame")
                ColorPickerRGB.Name = "ColorPickerRGB"
                ColorPickerRGB.Size = UDim2.new(1, -20, 0, 30)
                ColorPickerRGB.Position = UDim2.new(0, 10, 0, 170)
                ColorPickerRGB.BackgroundTransparency = 1
                ColorPickerRGB.Parent = ColorPickerPopup
                
                local ColorPickerRGBLayout = Instance.new("UIListLayout")
                ColorPickerRGBLayout.FillDirection = Enum.FillDirection.Horizontal
                ColorPickerRGBLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
                ColorPickerRGBLayout.SortOrder = Enum.SortOrder.LayoutOrder
                ColorPickerRGBLayout.Padding = UDim.new(0, 10)
                ColorPickerRGBLayout.Parent = ColorPickerRGB
                
                -- Create RGB input boxes
                local function CreateRGBInput(name, layoutOrder)
                    local RGBInput = Instance.new("Frame")
                    RGBInput.Name = name .. "Input"
                    RGBInput.Size = UDim2.new(0, 70, 0, 30)
                    RGBInput.BackgroundColor3 = Library.Theme.InElementBackground
                    RGBInput.LayoutOrder = layoutOrder
                    RGBInput.Parent = ColorPickerRGB
                    
                    local RGBInputCorner = Instance.new("UICorner")
                    RGBInputCorner.CornerRadius = UDim.new(0, 4)
                    RGBInputCorner.Parent = RGBInput
                    
                    local RGBInputLabel = Instance.new("TextLabel")
                    RGBInputLabel.Name = "RGBInputLabel"
                    RGBInputLabel.Size = UDim2.new(0, 20, 1, 0)
                    RGBInputLabel.BackgroundTransparency = 1
                    RGBInputLabel.Text = name
                    RGBInputLabel.TextColor3 = Library.Theme.WeakText
                    RGBInputLabel.Font = Library.Fonts.SemiBold
                    RGBInputLabel.TextSize = 14
                    RGBInputLabel.Parent = RGBInput
                    
                    local RGBInputBox = Instance.new("TextBox")
                    RGBInputBox.Name = "RGBInputBox"
                    RGBInputBox.Size = UDim2.new(0, 50, 1, 0)
                    RGBInputBox.Position = UDim2.new(0, 20, 0, 0)
                    RGBInputBox.BackgroundTransparency = 1
                    RGBInputBox.Text = "255"
                    RGBInputBox.TextColor3 = Library.Theme.StrongText
                    RGBInputBox.Font = Library.Fonts.Regular
                    RGBInputBox.TextSize = 14
                    RGBInputBox.TextXAlignment = Enum.TextXAlignment.Center
                    RGBInputBox.ClipsDescendants = true
                    RGBInputBox.Parent = RGBInput
                    
                    return RGBInputBox
                end
                
                local RInputBox = CreateRGBInput("R", 1)
                local GInputBox = CreateRGBInput("G", 2)
                local BInputBox = CreateRGBInput("B", 3)
                
                -- Color picker state
                local Color = options.Default
                local Hue, Saturation, Value = Color3ToHSV(Color)
                Library.Flags[options.Flag] = Color
                
                -- Update color picker
                local function UpdateColorPicker(noCallback)
                    -- Update color
                    Color = Color3.fromHSV(Hue, Saturation, Value)
                    
                    -- Update preview
                    ColorPickerPreview.BackgroundColor3 = Color
                    ColorPickerHueSaturation.BackgroundColor3 = Color3.fromHSV(Hue, 1, 1)
                    
                    -- Update selectors
                    ColorPickerHueSaturationSelector.Position = UDim2.new(Saturation, 0, 1 - Hue, 0)
                    ColorPickerValueSelector.Position = UDim2.new(0, 0, 1 - Value, 0)
                    
                    -- Update RGB inputs
                    RInputBox.Text = math.floor(Color.R * 255 + 0.5)
                    GInputBox.Text = math.floor(Color.G * 255 + 0.5)
                    BInputBox.Text = math.floor(Color.B * 255 + 0.5)
                    
                    -- Update flag and callback
                    Library.Flags[options.Flag] = Color
                    if not noCallback then
                        options.Callback(Color)
                    end
                end
                
                -- Initial update
                UpdateColorPicker(true)
                
                -- Color picker functionality
                local function UpdateHueSaturation(input)
                    local sizeX = ColorPickerHueSaturation.AbsoluteSize.X
                    local sizeY = ColorPickerHueSaturation.AbsoluteSize.Y
                    local posX = ColorPickerHueSaturation.AbsolutePosition.X
                    local posY = ColorPickerHueSaturation.AbsolutePosition.Y
                    
                    local mouseX = math.clamp(input.Position.X - posX, 0, sizeX)
                    local mouseY = math.clamp(input.Position.Y - posY, 0, sizeY)
                    
                    Saturation = mouseX / sizeX
                    Hue = 1 - (mouseY / sizeY)
                    
                    UpdateColorPicker()
                end
                
                local function UpdateValue(input)
                    local sizeY = ColorPickerValue.AbsoluteSize.Y
                    local posY = ColorPickerValue.AbsolutePosition.Y
                    
                    local mouseY = math.clamp(input.Position.Y - posY, 0, sizeY)
                    
                    Value = 1 - (mouseY / sizeY)
                    
                    UpdateColorPicker()
                end
                
                -- Hue and saturation input
                ColorPickerHueSaturation.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        isDraggingHueSaturation = true
                        UpdateHueSaturation(input)
                    end
                end)
                
                ColorPickerHueSaturation.InputEnded:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        isDraggingHueSaturation = false
                    end
                end)
                
                -- Value input
                ColorPickerValue.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        isDraggingValue = true
                        UpdateValue(input)
                    end
                end)
                
                ColorPickerValue.InputEnded:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        isDraggingValue = false
                    end
                end)
                
                -- Mouse movement
                UserInputService.InputChanged:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseMovement then
                        if isDraggingHueSaturation then
                            UpdateHueSaturation(input)
                        elseif isDraggingValue then
                            UpdateValue(input)
                        end
                    end
                end)
                
                -- RGB input boxes
                local function UpdateFromRGB()
                    local r = tonumber(RInputBox.Text) or 0
                    local g = tonumber(GInputBox.Text) or 0
                    local b = tonumber(BInputBox.Text) or 0
                    
                    r = math.clamp(r, 0, 255) / 255
                    g = math.clamp(g, 0, 255) / 255
                    b = math.clamp(b, 0, 255) / 255
                    
                    Color = Color3.new(r, g, b)
                    Hue, Saturation, Value = Color3ToHSV(Color)
                    
                    UpdateColorPicker()
                end
                
                RInputBox.FocusLost:Connect(UpdateFromRGB)
                GInputBox.FocusLost:Connect(UpdateFromRGB)
                BInputBox.FocusLost:Connect(UpdateFromRGB)
                
                -- Toggle color picker popup
                local IsOpen = false
                
                ColorPickerInner.MouseEnter:Connect(function()
                    tween(ColorPickerInner, {BackgroundColor3 = Library.Theme.ElementBackgroundHover}, 0.2)
                end)
                
                ColorPickerInner.MouseLeave:Connect(function()
                    tween(ColorPickerInner, {BackgroundColor3 = Library.Theme.ElementBackground}, 0.2)
                end)
                
                ColorPickerInner.MouseButton1Down:Connect(function()
                    createRipple(ColorPickerInner)
                end)
                
                ColorPickerInner.MouseButton1Click:Connect(function()
                    IsOpen = not IsOpen
                    ColorPickerPopup.Visible = IsOpen
                end)
                
                -- Close popup when clicking outside
                UserInputService.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        local mousePos = UserInputService:GetMouseLocation()
                        local popupPos = ColorPickerPopup.AbsolutePosition
                        local popupSize = ColorPickerPopup.AbsoluteSize
                        
                        if IsOpen and (mousePos.X < popupPos.X or mousePos.X > popupPos.X + popupSize.X or
                                       mousePos.Y < popupPos.Y or mousePos.Y > popupPos.Y + popupSize.Y) then
                            if not (mousePos.X >= ColorPickerInner.AbsolutePosition.X and
                                   mousePos.X <= ColorPickerInner.AbsolutePosition.X + ColorPickerInner.AbsoluteSize.X and
                                   mousePos.Y >= ColorPickerInner.AbsolutePosition.Y and
                                   mousePos.Y <= ColorPickerInner.AbsolutePosition.Y + ColorPickerInner.AbsoluteSize.Y) then
                                IsOpen = false
                                ColorPickerPopup.Visible = false
                            end
                        end
                    end
                end)
                
                -- ColorPicker object
                local ColorPickerObj = {
                    Value = Color,
                    SetValue = function(self, color)
                        Color = color
                        Hue, Saturation, Value = Color3ToHSV(Color)
                        UpdateColorPicker(true)
                    end
                }
                
                return ColorPickerObj
            end
            
            -- Create Keybind
            function SectionObj:AddKeybind(options)
                options = options or {}
                options.Name = options.Name or "Keybind"
                options.Description = options.Description or ""
                options.Default = options.Default or Enum.KeyCode.Unknown
                options.Flag = options.Flag or options.Name
                options.Callback = options.Callback or function() end
                
                local Keybind = Instance.new("Frame")
                Keybind.Name = options.Name .. "Keybind"
                Keybind.Size = UDim2.new(1, 0, 0, options.Description ~= "" and 60 or 36)
                Keybind.BackgroundTransparency = 1
                Keybind.Parent = SectionContent
                
                local KeybindInner = Instance.new("TextButton")
                KeybindInner.Name = "KeybindInner"
                KeybindInner.Size = UDim2.new(1, 0, 0, 36)
                KeybindInner.BackgroundColor3 = Library.Theme.ElementBackground
                KeybindInner.Text = ""
                KeybindInner.AutoButtonColor = false
                KeybindInner.ClipsDescendants = true
                KeybindInner.Parent = Keybind
                
                local KeybindCorner = Instance.new("UICorner")
                KeybindCorner.CornerRadius = UDim.new(0, 6)
                KeybindCorner.Parent = KeybindInner
                
                local KeybindTitle = Instance.new("TextLabel")
                KeybindTitle.Name = "KeybindTitle"
                KeybindTitle.Size = UDim2.new(1, -120, 1, 0)
                KeybindTitle.Position = UDim2.new(0, 12, 0, 0)
                KeybindTitle.BackgroundTransparency = 1
                KeybindTitle.Text = options.Name
                KeybindTitle.TextColor3 = Library.Theme.StrongText
                KeybindTitle.Font = Library.Fonts.SemiBold
                KeybindTitle.TextSize = 14
                KeybindTitle.TextXAlignment = Enum.TextXAlignment.Left
                KeybindTitle.Parent = KeybindInner
                
                local KeybindButton = Instance.new("TextButton")
                KeybindButton.Name = "KeybindButton"
                KeybindButton.Size = UDim2.new(0, 100, 0, 24)
                KeybindButton.Position = UDim2.new(1, -112, 0.5, -12)
                KeybindButton.BackgroundColor3 = Library.Theme.InElementBackground
                KeybindButton.Text = options.Default ~= Enum.KeyCode.Unknown and options.Default.Name or "None"
                KeybindButton.TextColor3 = Library.Theme.StrongText
                KeybindButton.Font = Library.Fonts.SemiBold
                KeybindButton.TextSize = 14
                KeybindButton.AutoButtonColor = false
                KeybindButton.Parent = KeybindInner
                
                local KeybindButtonCorner = Instance.new("UICorner")
                KeybindButtonCorner.CornerRadius = UDim.new(0, 4)
                KeybindButtonCorner.Parent = KeybindButton
                
                if options.Description ~= "" then
                    local KeybindDescription = Instance.new("TextLabel")
                    KeybindDescription.Name = "KeybindDescription"
                    KeybindDescription.Size = UDim2.new(1, -16, 0, 20)
                    KeybindDescription.Position = UDim2.new(0, 12, 0, 36)
                    KeybindDescription.BackgroundTransparency = 1
                    KeybindDescription.Text = options.Description
                    KeybindDescription.TextColor3 = Library.Theme.WeakText
                    KeybindDescription.Font = Library.Fonts.Regular
                    KeybindDescription.TextSize = 12
                    KeybindDescription.TextWrapped = true
                    KeybindDescription.TextXAlignment = Enum.TextXAlignment.Left
                    KeybindDescription.Parent = Keybind
                end
                
                -- Keybind state
                local Key = options.Default
                local Listening = false
                Library.Flags[options.Flag] = Key
                
                -- Keybind functionality
                KeybindInner.MouseEnter:Connect(function()
                    tween(KeybindInner, {BackgroundColor3 = Library.Theme.ElementBackgroundHover}, 0.2)
                end)
                
                KeybindInner.MouseLeave:Connect(function()
                    tween(KeybindInner, {BackgroundColor3 = Library.Theme.ElementBackground}, 0.2)
                end)
                
                KeybindButton.MouseEnter:Connect(function()
                    tween(KeybindButton, {BackgroundColor3 = Library.Theme.ElementBackgroundHover}, 0.2)
                end)
                
                KeybindButton.MouseLeave:Connect(function()
                    tween(KeybindButton, {BackgroundColor3 = Library.Theme.InElementBackground}, 0.2)
                end)
                
                KeybindButton.MouseButton1Down:Connect(function()
                    createRipple(KeybindButton)
                end)
                
                KeybindButton.MouseButton1Click:Connect(function()
                    if Listening then return end
                    
                    Listening = true
                    KeybindButton.Text = "..."
                    
                    local InputConnection
                    InputConnection = UserInputService.InputBegan:Connect(function(input, gameProcessed)
                        if gameProcessed then return end
                        
                        if input.UserInputType == Enum.UserInputType.Keyboard then
                            Key = input.KeyCode
                            KeybindButton.Text = Key.Name
                            Library.Flags[options.Flag] = Key
                            
                            Listening = false
                            InputConnection:Disconnect()
                        elseif input.UserInputType == Enum.UserInputType.MouseButton1 then
                            -- Cancel if clicked elsewhere
                            local mousePos = UserInputService:GetMouseLocation()
                            local buttonPos = KeybindButton.AbsolutePosition
                            local buttonSize = KeybindButton.AbsoluteSize
                            
                            if not (mousePos.X >= buttonPos.X and mousePos.X <= buttonPos.X + buttonSize.X and
                                   mousePos.Y >= buttonPos.Y and mousePos.Y <= buttonPos.Y + buttonSize.Y) then
                                KeybindButton.Text = Key ~= Enum.KeyCode.Unknown and Key.Name or "None"
                                Listening = false
                                InputConnection:Disconnect()
                            end
                        end
                    end)
                end)
                
                -- Detect key press
                UserInputService.InputBegan:Connect(function(input, gameProcessed)
                    if gameProcessed then return end
                    
                    if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == Key then
                        options.Callback(Key)
                    end
                end)
                
                -- Keybind object
                local KeybindObj = {
                    Value = Key,
                    SetValue = function(self, key)
                        Key = key
                        KeybindButton.Text = Key ~= Enum.KeyCode.Unknown and Key.Name or "None"
                        Library.Flags[options.Flag] = Key
                    end
                }
                
                return KeybindObj
            end
            
            return SectionObj
        end
        
        return TabObj
    end
    
    -- Create notification
    function Library:Notify(options)
        options = options or {}
        options.Title = options.Title or "Notification"
        options.Content = options.Content or "Content"
        options.Duration = options.Duration or 5
        options.Icon = options.Icon or "info"
        options.Actions = options.Actions or {}
        
        -- Create notification container if it doesn't exist
        if not Library.NotificationContainer then
            Library.NotificationContainer = Instance.new("Frame")
            Library.NotificationContainer.Name = "NotificationContainer"
            Library.NotificationContainer.Size = UDim2.new(0, 300, 1, 0)
            Library.NotificationContainer.Position = UDim2.new(1, -310, 0, 0)
            Library.NotificationContainer.BackgroundTransparency = 1
            Library.NotificationContainer.Parent = Library.MainFrame
            
            local NotificationLayout = Instance.new("UIListLayout")
            NotificationLayout.Padding = UDim.new(0, 10)
            NotificationLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
            NotificationLayout.SortOrder = Enum.SortOrder.LayoutOrder
            NotificationLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
            NotificationLayout.Parent = Library.NotificationContainer
            
            local NotificationPadding = Instance.new("UIPadding")
            NotificationPadding.PaddingBottom = UDim.new(0, 10)
            NotificationPadding.Parent = Library.NotificationContainer
        end
        
        -- Create notification
        local Notification = Instance.new("Frame")
        Notification.Name = "Notification"
        Notification.Size = UDim2.new(1, -20, 0, 0) -- Auto size
        Notification.BackgroundColor3 = Library.Theme.ElementBackground
        Notification.BackgroundTransparency = 0.1
        Notification.AutomaticSize = Enum.AutomaticSize.Y
        Notification.ClipsDescendants = true
        Notification.Parent = Library.NotificationContainer
        
        local NotificationCorner = Instance.new("UICorner")
        NotificationCorner.CornerRadius = UDim.new(0, 6)
        NotificationCorner.Parent = Notification
        
        local NotificationPadding = Instance.new("UIPadding")
        NotificationPadding.PaddingTop = UDim.new(0, 12)
        NotificationPadding.PaddingBottom = UDim.new(0, 12)
        NotificationPadding.PaddingLeft = UDim.new(0, 12)
        NotificationPadding.PaddingRight = UDim.new(0, 12)
        NotificationPadding.Parent = Notification
        
        local NotificationLayout = Instance.new("UIListLayout")
        NotificationLayout.Padding = UDim.new(0, 8)
        NotificationLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
        NotificationLayout.SortOrder = Enum.SortOrder.LayoutOrder
        NotificationLayout.Parent = Notification
        
        -- Notification header
        local NotificationHeader = Instance.new("Frame")
        NotificationHeader.Name = "NotificationHeader"
        NotificationHeader.Size = UDim2.new(1, 0, 0, 24)
        NotificationHeader.BackgroundTransparency = 1
        NotificationHeader.LayoutOrder = 1
        NotificationHeader.Parent = Notification
        
        local NotificationIcon = Instance.new("ImageLabel")
        NotificationIcon.Name = "NotificationIcon"
        NotificationIcon.Size = UDim2.new(0, 24, 0, 24)
        NotificationIcon.BackgroundTransparency = 1
        
        local iconData = getIcon(options.Icon)
        NotificationIcon.Image = "rbxassetid://" .. iconData.id
        NotificationIcon.ImageRectSize = iconData.imageRectSize
        NotificationIcon.ImageRectOffset = iconData.imageRectOffset
        NotificationIcon.ImageColor3 = Library.Theme.Accent
        NotificationIcon.Parent = NotificationHeader
        
        local NotificationTitle = Instance.new("TextLabel")
        NotificationTitle.Name = "NotificationTitle"
        NotificationTitle.Size = UDim2.new(1, -30, 1, 0)
        NotificationTitle.Position = UDim2.new(0, 30, 0, 0)
        NotificationTitle.BackgroundTransparency = 1
        NotificationTitle.Text = options.Title
        NotificationTitle.TextColor3 = Library.Theme.StrongText
        NotificationTitle.Font = Library.Fonts.SemiBold
        NotificationTitle.TextSize = 16
        NotificationTitle.TextXAlignment = Enum.TextXAlignment.Left
        NotificationTitle.Parent = NotificationHeader
        
        -- Notification content
        local NotificationContent = Instance.new("TextLabel")
        NotificationContent.Name = "NotificationContent"
        NotificationContent.Size = UDim2.new(1, 0, 0, 0)
        NotificationContent.BackgroundTransparency = 1
        NotificationContent.Text = options.Content
        NotificationContent.TextColor3 = Library.Theme.WeakText
        NotificationContent.Font = Library.Fonts.Regular
        NotificationContent.TextSize = 14
        NotificationContent.TextWrapped = true
        NotificationContent.TextXAlignment = Enum.TextXAlignment.Left
        NotificationContent.TextYAlignment = Enum.TextYAlignment.Top
        NotificationContent.AutomaticSize = Enum.AutomaticSize.Y
        NotificationContent.LayoutOrder = 2
        NotificationContent.Parent = Notification
        
        -- Notification actions
        if #options.Actions > 0 then
            local NotificationActions = Instance.new("Frame")
            NotificationActions.Name = "NotificationActions"
            NotificationActions.Size = UDim2.new(1, 0, 0, 30)
            NotificationActions.BackgroundTransparency = 1
            NotificationActions.LayoutOrder = 3
            NotificationActions.Parent = Notification
            
            local NotificationActionsLayout = Instance.new("UIListLayout")
            NotificationActionsLayout.Padding = UDim.new(0, 8)
            NotificationActionsLayout.FillDirection = Enum.FillDirection.Horizontal
            NotificationActionsLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
            NotificationActionsLayout.SortOrder = Enum.SortOrder.LayoutOrder
            NotificationActionsLayout.Parent = NotificationActions
            
            for i, action in ipairs(options.Actions) do
                local ActionButton = Instance.new("TextButton")
                ActionButton.Name = "ActionButton"
                ActionButton.Size = UDim2.new(0, 0, 1, 0) -- Auto size
                ActionButton.AutomaticSize = Enum.AutomaticSize.X
                ActionButton.BackgroundColor3 = i == 1 and Library.Theme.Accent or Library.Theme.InElementBackground
                ActionButton.Text = " " .. action.Text .. " "
                ActionButton.TextColor3 = i == 1 and Library.Theme.AccentText or Library.Theme.StrongText
                ActionButton.Font = Library.Fonts.SemiBold
                ActionButton.TextSize = 14
                ActionButton.AutoButtonColor = false
                ActionButton.ClipsDescendants = true
                ActionButton.LayoutOrder = i
                ActionButton.Parent = NotificationActions
                
                local ActionButtonCorner = Instance.new("UICorner")
                ActionButtonCorner.CornerRadius = UDim.new(0, 4)
                ActionButtonCorner.Parent = ActionButton
                
                -- Button functionality
                ActionButton.MouseEnter:Connect(function()
                    tween(ActionButton, {BackgroundColor3 = i == 1 and Library.Theme.AccentDark or Library.Theme.ElementBackgroundHover}, 0.2)
                end)
                
                ActionButton.MouseLeave:Connect(function()
                    tween(ActionButton, {BackgroundColor3 = i == 1 and Library.Theme.Accent or Library.Theme.InElementBackground}, 0.2)
                end)
                
                ActionButton.MouseButton1Down:Connect(function()
                    createRipple(ActionButton)
                end)
                
                ActionButton.MouseButton1Click:Connect(function()
                    if action.Callback then
                        action.Callback()
                    end
                    
                    -- Close notification
                    tween(Notification, {Position = UDim2.new(1, 0, 0, Notification.Position.Y.Offset)}, 0.5)
                    wait(0.5)
                    Notification:Destroy()
                end)
            end
        end
        
        -- Animate notification
        Notification.Position = UDim2.new(1, 0, 0, 0)
        tween(Notification, {Position = UDim2.new(0, 0, 0, 0)}, 0.5)
        
        -- Auto close
        if options.Duration > 0 then
            spawn(function()
                wait(options.Duration)
                if Notification and Notification.Parent then
                    tween(Notification, {Position = UDim2.new(1, 0, 0, Notification.Position.Y.Offset)}, 0.5)
                    wait(0.5)
                    Notification:Destroy()
                end
            end)
        end
        
        -- Close on click
        Notification.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 and options.Duration > 0 then
                tween(Notification, {Position = UDim2.new(1, 0, 0, Notification.Position.Y.Offset)}, 0.5)
                wait(0.5)
                Notification:Destroy()
            end
        end)
        
        return Notification
    end
    
    function Library:Init()
        -- Create UI
        self:CreateUI()
        
        -- Connect input events
        UserInputService.InputBegan:Connect(function(input, gameProcessed)
            if input.KeyCode == self.ToggleKey and not gameProcessed then
                self:Toggle()
            end
        end)
        
        -- Return the library
        return self
    end
    
    return Library
end

-- Create the interface
local Interface = {}

function Interface:CreateWindow(options)
    local LibraryInstance = RayfieldInspired()
    LibraryInstance:CreateUI(options)
    return LibraryInstance
end

return Interface
