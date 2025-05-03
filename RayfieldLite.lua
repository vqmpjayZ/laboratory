local RayfieldLite = {}

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- Load Lucide Icons
local Icons = loadstring(game:HttpGet('https://raw.githubusercontent.com/SiriusSoftwareLtd/Rayfield/refs/heads/main/icons.lua'))()

local function getIcon(name)
    if not name then return nil end
    
    name = string.match(string.lower(name), "^%s*(.*)%s*$")
    local sizedicons = Icons['48px']
    local r = sizedicons[name]
    
    if not r then
        warn("RayfieldLite: Failed to find icon by the name of \"" .. name .. "\".")
        return nil
    end
    
    local rirs = r[2]
    local riro = r[3]
    
    if type(r[1]) ~= "number" or type(rirs) ~= "table" or type(riro) ~= "table" then
        warn("RayfieldLite: Internal error: Invalid auto-generated asset entry")
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

function RayfieldLite.new(title)
    local library = {}
    library.windows = {}
    library.tabs = {}
    library.flags = {}
    library.destroyed = false
    
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "RayfieldLiteGui"
    screenGui.Parent = player.PlayerGui
    screenGui.ResetOnSpawn = false
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    screenGui.DisplayOrder = 9999999
    
    -- Create loading screen
    local loadingFrame = Instance.new("Frame")
    loadingFrame.Name = "LoadingFrame"
    loadingFrame.Size = UDim2.new(1, 0, 1, 0)
    loadingFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
    loadingFrame.BackgroundTransparency = 0
    loadingFrame.ZIndex = 10000000
    loadingFrame.Parent = screenGui
    
    local loadingContainer = Instance.new("Frame")
    loadingContainer.Name = "LoadingContainer"
    loadingContainer.Size = UDim2.new(0, 300, 0, 180)
    loadingContainer.Position = UDim2.new(0.5, -150, 0.5, -90)
    loadingContainer.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    loadingContainer.ZIndex = 10000001
    loadingContainer.Parent = loadingFrame
    
    local loadingCorner = Instance.new("UICorner")
    loadingCorner.CornerRadius = UDim.new(0, 10)
    loadingCorner.Parent = loadingContainer
    
    local loadingStroke = Instance.new("UIStroke")
    loadingStroke.Color = Color3.fromRGB(80, 80, 120)
    loadingStroke.Thickness = 2
    loadingStroke.Parent = loadingContainer
    
    local loadingTitle = Instance.new("TextLabel")
    loadingTitle.Name = "LoadingTitle"
    loadingTitle.Size = UDim2.new(1, 0, 0, 30)
    loadingTitle.Position = UDim2.new(0, 0, 0, 20)
    loadingTitle.BackgroundTransparency = 1
    loadingTitle.Text = title or "RayfieldLite"
    loadingTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    loadingTitle.Font = Enum.Font.GothamBold
    loadingTitle.TextSize = 24
    loadingTitle.ZIndex = 10000002
    loadingTitle.Parent = loadingContainer
    
    local loadingSubtitle = Instance.new("TextLabel")
    loadingSubtitle.Name = "LoadingSubtitle"
    loadingSubtitle.Size = UDim2.new(1, 0, 0, 20)
    loadingSubtitle.Position = UDim2.new(0, 0, 0, 55)
    loadingSubtitle.BackgroundTransparency = 1
    loadingSubtitle.Text = "Loading interface..."
    loadingSubtitle.TextColor3 = Color3.fromRGB(180, 180, 180)
    loadingSubtitle.Font = Enum.Font.Gotham
    loadingSubtitle.TextSize = 16
    loadingSubtitle.ZIndex = 10000002
    loadingSubtitle.Parent = loadingContainer
    
    local loadingBar = Instance.new("Frame")
    loadingBar.Name = "LoadingBar"
    loadingBar.Size = UDim2.new(0.8, 0, 0, 6)
    loadingBar.Position = UDim2.new(0.1, 0, 0, 100)
    loadingBar.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
    loadingBar.ZIndex = 10000002
    loadingBar.Parent = loadingContainer
    
    local loadingBarCorner = Instance.new("UICorner")
    loadingBarCorner.CornerRadius = UDim.new(1, 0)
    loadingBarCorner.Parent = loadingBar
    
    local loadingFill = Instance.new("Frame")
    loadingFill.Name = "LoadingFill"
    loadingFill.Size = UDim2.new(0, 0, 1, 0)
    loadingFill.BackgroundColor3 = Color3.fromRGB(80, 120, 200)
    loadingFill.ZIndex = 10000003
    loadingFill.Parent = loadingBar
    
    local loadingFillCorner = Instance.new("UICorner")
    loadingFillCorner.CornerRadius = UDim.new(1, 0)
    loadingFillCorner.Parent = loadingFill
    
    local loadingStatus = Instance.new("TextLabel")
    loadingStatus.Name = "LoadingStatus"
    loadingStatus.Size = UDim2.new(1, 0, 0, 20)
    loadingStatus.Position = UDim2.new(0, 0, 0, 120)
    loadingStatus.BackgroundTransparency = 1
    loadingStatus.Text = "Preparing..."
    loadingStatus.TextColor3 = Color3.fromRGB(150, 150, 150)
    loadingStatus.Font = Enum.Font.Gotham
    loadingStatus.TextSize = 14
    loadingStatus.ZIndex = 10000002
    loadingStatus.Parent = loadingContainer
    
    -- Animate loading screen
    TweenService:Create(loadingContainer, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
        Position = UDim2.new(0.5, -150, 0.5, -90),
        BackgroundTransparency = 0
    }):Play()
    
    local loadingSteps = {
        "Initializing interface...",
        "Loading components...",
        "Preparing elements...",
        "Setting up windows...",
        "Almost ready..."
    }
    
    local function updateLoadingStatus(step, percentage)
        loadingStatus.Text = loadingSteps[step] or "Loading..."
        TweenService:Create(loadingFill, TweenInfo.new(0.3, Enum.EasingStyle.Quart), {
            Size = UDim2.new(percentage, 0, 1, 0)
        }):Play()
    end
    
    -- Simulate loading process
    for i = 1, #loadingSteps do
        updateLoadingStatus(i, i / #loadingSteps)
        wait(0.3)
    end
    
    -- Finish loading
    TweenService:Create(loadingFill, TweenInfo.new(0.3, Enum.EasingStyle.Quart), {
        Size = UDim2.new(1, 0, 1, 0)
    }):Play()
    
    loadingStatus.Text = "Ready!"
    wait(0.5)
    
    -- Fade out loading screen
    TweenService:Create(loadingFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quart), {
        BackgroundTransparency = 1
    }):Play()
    
    TweenService:Create(loadingContainer, TweenInfo.new(0.5, Enum.EasingStyle.Quart), {
        Position = UDim2.new(0.5, -150, 0.6, -90),
        BackgroundTransparency = 1
    }):Play()
    
    for _, child in pairs(loadingContainer:GetDescendants()) do
        if child:IsA("TextLabel") or child:IsA("Frame") or child:IsA("UIStroke") then
            TweenService:Create(child, TweenInfo.new(0.5, Enum.EasingStyle.Quart), {
                BackgroundTransparency = 1,
                TextTransparency = 1,
                Transparency = 1
            }):Play()
        end
    end
    
    wait(0.5)
    loadingFrame:Destroy()
    
    library.screenGui = screenGui
    
    -- Create tab container
    local tabContainer = Instance.new("Frame")
    tabContainer.Name = "TabContainer"
    tabContainer.Size = UDim2.new(1, 0, 0, 40)
    tabContainer.Position = UDim2.new(0, 0, 0, 0)
    tabContainer.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
    tabContainer.BorderSizePixel = 0
    tabContainer.ZIndex = 10
    tabContainer.Visible = false
    tabContainer.Parent = screenGui
    
    local tabContainerStroke = Instance.new("UIStroke")
    tabContainerStroke.Color = Color3.fromRGB(60, 60, 90)
    tabContainerStroke.Thickness = 1
    tabContainerStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    tabContainerStroke.Parent = tabContainer
    
    local tabList = Instance.new("Frame")
    tabList.Name = "TabList"
    tabList.Size = UDim2.new(1, -20, 1, 0)
    tabList.Position = UDim2.new(0, 10, 0, 0)
    tabList.BackgroundTransparency = 1
    tabList.ZIndex = 11
    tabList.Parent = tabContainer
    
    local tabListLayout = Instance.new("UIListLayout")
    tabListLayout.FillDirection = Enum.FillDirection.Horizontal
    tabListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
    tabListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    tabListLayout.Padding = UDim.new(0, 10)
    tabListLayout.Parent = tabList
    
    function library:Window(options)
        options = options or {}
        options.title = options.title or title or "RayfieldLite"
        options.size = options.size or UDim2.new(0, 300, 0, 350)
        options.position = options.position or UDim2.new(0.5, -150, 0.5, -175)
        
        local window = {}
        window.minimized = false
        window.sections = {}
        window.elements = {}
        
        local mainFrame = Instance.new("Frame")
        mainFrame.Name = "MainFrame"
        mainFrame.Size = options.size
        mainFrame.Position = options.position
        mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
        mainFrame.BorderSizePixel = 0
        mainFrame.ZIndex = 10
        mainFrame.Parent = screenGui
        
        window.mainFrame = mainFrame
        
        local shadow = Instance.new("ImageLabel")
        shadow.Name = "Shadow"
        shadow.AnchorPoint = Vector2.new(0.5, 0.5)
        shadow.BackgroundTransparency = 1
        shadow.Position = UDim2.new(0.5, 0, 0.5, 0)
        shadow.Size = UDim2.new(1, 30, 1, 30)
        shadow.ZIndex = 9
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
        UIStroke.Color = Color3.fromRGB(80, 80, 120)
        UIStroke.Thickness = 1.5
        UIStroke.Parent = mainFrame
        
        local titleBar = Instance.new("Frame")
        titleBar.Name = "TitleBar"
        titleBar.Size = UDim2.new(1, 0, 0, 30)
        titleBar.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
        titleBar.BorderSizePixel = 0
        titleBar.ZIndex = 11
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
        bottomFix.ZIndex = 11
        bottomFix.Parent = titleBar
        
        local titleText = Instance.new("TextLabel")
        titleText.Name = "TitleText"
        titleText.Size = UDim2.new(1, -80, 1, 0)
        titleText.Position = UDim2.new(0, 10, 0, 0)
        titleText.BackgroundTransparency = 1
        titleText.Text = options.title
        titleText.TextColor3 = Color3.fromRGB(255, 255, 255)
        titleText.Font = Enum.Font.GothamBold
        titleText.TextSize = 14
        titleText.TextXAlignment = Enum.TextXAlignment.Left
        titleText.ZIndex = 12
        titleText.Parent = titleBar
        
        local contentFrame = Instance.new("ScrollingFrame")
        contentFrame.Name = "ContentFrame"
        contentFrame.Size = UDim2.new(1, 0, 1, -30)
        contentFrame.Position = UDim2.new(0, 0, 0, 30)
        contentFrame.BackgroundTransparency = 1
        contentFrame.ClipsDescendants = true
        contentFrame.ZIndex = 11
        contentFrame.ScrollBarThickness = 3
        contentFrame.ScrollBarImageColor3 = Color3.fromRGB(80, 80, 120)
        contentFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
        contentFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
        contentFrame.Parent = mainFrame
        
        window.contentFrame = contentFrame
        
        local minimizeButton = Instance.new("ImageButton")
        minimizeButton.Name = "MinimizeButton"
        minimizeButton.Size = UDim2.new(0, 16, 0, 16)
        minimizeButton.Position = UDim2.new(1, -50, 0.5, -8)
        minimizeButton.BackgroundTransparency = 1
        minimizeButton.Image = "rbxassetid://6026568240"
        minimizeButton.ImageColor3 = Color3.fromRGB(255, 255, 255)
        minimizeButton.ZIndex = 12
        minimizeButton.Parent = titleBar
        
        local closeButton = Instance.new("ImageButton")
        closeButton.Name = "CloseButton"
        closeButton.Size = UDim2.new(0, 16, 0, 16)
        closeButton.Position = UDim2.new(1, -25, 0.5, -8)
        closeButton.BackgroundTransparency = 1
        closeButton.Image = "rbxassetid://6031094678"
        closeButton.ImageColor3 = Color3.fromRGB(255, 255, 255)
        closeButton.ZIndex = 12
        closeButton.Parent = titleBar
        
        local function setupButtonHover(button, normalColor, hoverColor)
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
        
        setupButtonHover(closeButton, Color3.fromRGB(255, 255, 255), Color3.fromRGB(255, 100, 100))
        setupButtonHover(minimizeButton, Color3.fromRGB(255, 255, 255), Color3.fromRGB(100, 200, 255))
        
        local dragging = false
        local dragInput
        local dragStart
        local startPos
        
        local function updateDrag(input)
            local delta = input.Position - dragStart
            mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
        
        titleBar.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                dragging = true
                dragStart = input.Position
                startPos = mainFrame.Position
                
                input.Changed:Connect(function()
                    if input.UserInputState == Enum.UserInputState.End then
                        dragging = false
                    end
                end)
            end
        end)
        
        titleBar.InputChanged:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement then
                dragInput = input
            end
        end)
        
        UserInputService.InputChanged:Connect(function(input)
            if input == dragInput and dragging and not library.destroyed then
                updateDrag(input)
            end
        end)
        
        minimizeButton.MouseButton1Click:Connect(function()
            window.minimized = not window.minimized
            
            local targetSize
            if window.minimized then
                targetSize = UDim2.new(1, 0, 0, 0)
                minimizeButton.Image = "rbxassetid://6031090990"
            else
                targetSize = UDim2.new(1, 0, 1, -30)
                minimizeButton.Image = "rbxassetid://6026568240"
            end
            
            TweenService:Create(contentFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                Size = targetSize
            }):Play()
            
            TweenService:Create(mainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                Size = window.minimized and UDim2.new(options.size.X.Scale, options.size.X.Offset, 0, 30) or options.size
            }):Play()
        end)
        
        closeButton.MouseButton1Click:Connect(function()
            library:Destroy()
        end)
        
        function window:Section(options)
            options = options or {}
            options.title = options.title or "Section"
            
            local section = {}
            section.elements = {}
            section.expanded = true
            
            local yOffset = 0
            for _, existingSection in ipairs(window.sections) do
                yOffset = yOffset + existingSection.container.Size.Y.Offset + 10
            end
            
            local sectionContainer = Instance.new("Frame")
            sectionContainer.Name = "SectionContainer"
            sectionContainer.Size = UDim2.new(1, -20, 0, 30)
            sectionContainer.Position = UDim2.new(0, 10, 0, 10 + yOffset)
            sectionContainer.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
            sectionContainer.ZIndex = 12
            sectionContainer.Parent = contentFrame
            
            section.container = sectionContainer
            
            local sectionCorner = Instance.new("UICorner")
            sectionCorner.CornerRadius = UDim.new(0, 6)
            sectionCorner.Parent = sectionContainer
            
            local sectionStroke = Instance.new("UIStroke")
            sectionStroke.Color = Color3.fromRGB(60, 60, 90)
            sectionStroke.Thickness = 1
            sectionStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            sectionStroke.Parent = sectionContainer
            
            local sectionHeader = Instance.new("Frame")
            sectionHeader.Name = "SectionHeader"
            sectionHeader.Size = UDim2.new(1, 0, 0, 30)
            sectionHeader.BackgroundTransparency = 1
            sectionHeader.ZIndex = 13
            sectionHeader.Parent = sectionContainer
            
            local sectionTitle = Instance.new("TextLabel")
            sectionTitle.Name = "SectionTitle"
            sectionTitle.Size = UDim2.new(1, -40, 1, 0)
            sectionTitle.Position = UDim2.new(0, 10, 0, 0)
            sectionTitle.BackgroundTransparency = 1
            sectionTitle.Text = options.title
            sectionTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
            sectionTitle.Font = Enum.Font.GothamSemibold
            sectionTitle.TextSize = 14
            sectionTitle.TextXAlignment = Enum.TextXAlignment.Left
            sectionTitle.ZIndex = 14
            sectionTitle.Parent = sectionHeader
            
            local sectionToggle = Instance.new("ImageButton")
            sectionToggle.Name = "SectionToggle"
            sectionToggle.Size = UDim2.new(0, 16, 0, 16)
            sectionToggle.Position = UDim2.new(1, -26, 0.5, -8)
            sectionToggle.BackgroundTransparency = 1
            sectionToggle.Image = "rbxassetid://6031091004"
            sectionToggle.Rotation = 180
            sectionToggle.ImageColor3 = Color3.fromRGB(200, 200, 200)
            sectionToggle.ZIndex = 14
            sectionToggle.Parent = sectionHeader
            
            local sectionContent = Instance.new("Frame")
            sectionContent.Name = "SectionContent"
            sectionContent.Size = UDim2.new(1, 0, 0, 0)
            sectionContent.Position = UDim2.new(0, 0, 0, 30)
            sectionContent.BackgroundTransparency = 1
            sectionContent.ClipsDescendants = true
            sectionContent.ZIndex = 13
            sectionContent.Parent = sectionContainer
            
            local contentList = Instance.new("UIListLayout")
            contentList.SortOrder = Enum.SortOrder.LayoutOrder
            contentList.Padding = UDim.new(0, 8)
            contentList.Parent = sectionContent
            
            local contentPadding = Instance.new("UIPadding")
            contentPadding.PaddingLeft = UDim.new(0, 10)
            contentPadding.PaddingRight = UDim.new(0, 10)
            contentPadding.PaddingTop = UDim.new(0, 8)
            contentPadding.PaddingBottom = UDim.new(0, 8)
            contentPadding.Parent = sectionContent
            
            sectionHeader.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    section.expanded = not section.expanded
                    
                    local contentSize = 0
                    if section.expanded then
                        for _, element in ipairs(section.elements) do
                            contentSize = contentSize + element.size.Y.Offset + 8
                        end
                        if #section.elements > 0 then
                            contentSize = contentSize + 8 -- Add padding
                        end
                    end
                    
                    TweenService:Create(sectionToggle, TweenInfo.new(0.3), {
                        Rotation = section.expanded and 180 or 0
                    }):Play()
                    
                    TweenService:Create(sectionContent, TweenInfo.new(0.3, Enum.EasingStyle.Quart), {
                        Size = UDim2.new(1, 0, 0, contentSize)
                    }):Play()
                    
                    TweenService:Create(sectionContainer, TweenInfo.new(0.3, Enum.EasingStyle.Quart), {
                        Size = UDim2.new(1, -20, 0, 30 + contentSize)
                    }):Play()
                    
                    window:UpdateSections()
                end
            end)
            
            function section:Button(options)
                options = options or {}
                options.text = options.text or "Button"
                options.description = options.description or nil
                options.callback = options.callback or function() end
                
                local buttonElement = {}
                local buttonHeight = options.description and 50 or 36
                
                local button = Instance.new("Frame")
                button.Name = "Button"
                button.Size = UDim2.new(1, 0, 0, buttonHeight)
                button.BackgroundColor3 = Color3.fromRGB(45, 45, 65)
                button.ZIndex = 14
                button.Parent = sectionContent
                
                buttonElement.instance = button
                buttonElement.size = UDim2.new(1, 0, 0, buttonHeight)
                
                local buttonCorner = Instance.new("UICorner")
                buttonCorner.CornerRadius = UDim.new(0, 6)
                buttonCorner.Parent = button
                
                local buttonStroke = Instance.new("UIStroke")
                buttonStroke.Color = Color3.fromRGB(70, 70, 120)
                buttonStroke.Thickness = 1
                buttonStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                buttonStroke.Parent = button
                
                local buttonGradient = Instance.new("UIGradient")
                buttonGradient.Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(70, 70, 110)),
                    ColorSequenceKeypoint.new(1, Color3.fromRGB(60, 60, 90))
                })
                buttonGradient.Rotation = 90
                buttonGradient.Parent = button
                
                local buttonLabel = Instance.new("TextLabel")
                buttonLabel.Name = "ButtonLabel"
                buttonLabel.Size = UDim2.new(1, -20, 0, options.description and 20 or 36)
                buttonLabel.Position = UDim2.new(0, 10, 0, options.description and 8 or 0)
                buttonLabel.BackgroundTransparency = 1
                buttonLabel.Text = options.text
                buttonLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                buttonLabel.Font = Enum.Font.GothamSemibold
                buttonLabel.TextSize = 14
                buttonLabel.TextXAlignment = Enum.TextXAlignment.Left
                buttonLabel.ZIndex = 15
                buttonLabel.Parent = button
                
                if options.description then
                    local descriptionLabel = Instance.new("TextLabel")
                    descriptionLabel.Name = "DescriptionLabel"
                    descriptionLabel.Size = UDim2.new(1, -20, 0, 20)
                    descriptionLabel.Position = UDim2.new(0, 10, 0, 28)
                    descriptionLabel.BackgroundTransparency = 1
                    descriptionLabel.Text = options.description
                    descriptionLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
                    descriptionLabel.Font = Enum.Font.Gotham
                    descriptionLabel.TextSize = 12
                    descriptionLabel.TextXAlignment = Enum.TextXAlignment.Left
                    descriptionLabel.TextWrapped = true
                    descriptionLabel.ZIndex = 15
                    descriptionLabel.Parent = button
                end
                
                local buttonClick = Instance.new("TextButton")
                buttonClick.Name = "ButtonClick"
                buttonClick.Size = UDim2.new(1, 0, 1, 0)
                buttonClick.BackgroundTransparency = 1
                buttonClick.Text = ""
                buttonClick.ZIndex = 16
                buttonClick.Parent = button
                
                local rippleEffect = Instance.new("Frame")
                rippleEffect.Name = "RippleEffect"
                rippleEffect.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                rippleEffect.BackgroundTransparency = 0.8
                rippleEffect.BorderSizePixel = 0
                rippleEffect.ZIndex = 15
                rippleEffect.AnchorPoint = Vector2.new(0.5, 0.5)
                rippleEffect.Size = UDim2.new(0, 0, 0, 0)
                rippleEffect.Position = UDim2.new(0.5, 0, 0.5, 0)
                rippleEffect.Parent = button
                
                local rippleCorner = Instance.new("UICorner")
                rippleCorner.CornerRadius = UDim.new(1, 0)
                rippleCorner.Parent = rippleEffect
                
                button.MouseEnter:Connect(function()
                    TweenService:Create(button, TweenInfo.new(0.2), {
                        BackgroundColor3 = Color3.fromRGB(70, 70, 110)
                    }):Play()
                    
                    TweenService:Create(buttonStroke, TweenInfo.new(0.2), {
                        Color = Color3.fromRGB(100, 100, 150)
                    }):Play()
                end)
                
                button.MouseLeave:Connect(function()
                    TweenService:Create(button, TweenInfo.new(0.2), {
                        BackgroundColor3 = Color3.fromRGB(45, 45, 65)
                    }):Play()
                    
                    TweenService:Create(buttonStroke, TweenInfo.new(0.2), {
                        Color = Color3.fromRGB(70, 70, 120)
                    }):Play()
                end)
                
                buttonClick.MouseButton1Down:Connect(function(x, y)
                    local buttonAbsoluteSize = button.AbsoluteSize
                    local buttonAbsolutePosition = button.AbsolutePosition
                    
                    local relativeX = x - buttonAbsolutePosition.X
                    local relativeY = y - buttonAbsolutePosition.Y
                    
                    rippleEffect.Position = UDim2.new(0, relativeX, 0, relativeY)
                    rippleEffect.Size = UDim2.new(0, 0, 0, 0)
                    
                    TweenService:Create(rippleEffect, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                        Size = UDim2.new(0, buttonAbsoluteSize.X * 2, 0, buttonAbsoluteSize.X * 2),
                        BackgroundTransparency = 1
                    }):Play()
                end)
                
                buttonClick.MouseButton1Click:Connect(function()
                    options.callback()
                end)
                
                table.insert(section.elements, buttonElement)
                
                function buttonElement:SetText(text)
                    buttonLabel.Text = text
                end
                
                return buttonElement
            end
            
            function section:Toggle(options)
                options = options or {}
                options.text = options.text or "Toggle"
                options.description = options.description or nil
                options.default = options.default or false
                options.flag = options.flag or options.text
                options.callback = options.callback or function() end
                
                local toggleElement = {}
                local toggled = options.default
                local toggleHeight = options.description and 50 or 36
                
                local toggleContainer = Instance.new("Frame")
                toggleContainer.Name = "ToggleContainer"
                toggleContainer.Size = UDim2.new(1, 0, 0, toggleHeight)
                toggleContainer.BackgroundColor3 = Color3.fromRGB(45, 45, 65)
                toggleContainer.ZIndex = 14
                toggleContainer.Parent = sectionContent
                
                toggleElement.instance = toggleContainer
                toggleElement.size = UDim2.new(1, 0, 0, toggleHeight)
                
                local containerCorner = Instance.new("UICorner")
                containerCorner.CornerRadius = UDim.new(0, 6)
                containerCorner.Parent = toggleContainer
                
                local containerStroke = Instance.new("UIStroke")
                containerStroke.Color = Color3.fromRGB(70, 70, 120)
                containerStroke.Thickness = 1
                containerStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                containerStroke.Parent = toggleContainer
                
                local containerGradient = Instance.new("UIGradient")
                containerGradient.Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(70, 70, 110)),
                    ColorSequenceKeypoint.new(1, Color3.fromRGB(60, 60, 90))
                })
                containerGradient.Rotation = 90
                containerGradient.Parent = toggleContainer
                
                local toggleLabel = Instance.new("TextLabel")
                toggleLabel.Name = "ToggleLabel"
                toggleLabel.Size = UDim2.new(1, -50, 0, options.description and 20 or 36)
                toggleLabel.Position = UDim2.new(0, 10, 0, options.description and 8 or 0)
                toggleLabel.BackgroundTransparency = 1
                toggleLabel.Text = options.text
                toggleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                toggleLabel.Font = Enum.Font.GothamSemibold
                toggleLabel.TextSize = 14
                toggleLabel.TextXAlignment = Enum.TextXAlignment.Left
                toggleLabel.ZIndex = 15
                toggleLabel.Parent = toggleContainer
                
                if options.description then
                    local descriptionLabel = Instance.new("TextLabel")
                    descriptionLabel.Name = "DescriptionLabel"
                    descriptionLabel.Size = UDim2.new(1, -50, 0, 20)
                    descriptionLabel.Position = UDim2.new(0, 10, 0, 28)
                    descriptionLabel.BackgroundTransparency = 1
                    descriptionLabel.Text = options.description
                    descriptionLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
                    descriptionLabel.Font = Enum.Font.Gotham
                    descriptionLabel.TextSize = 12
                    descriptionLabel.TextXAlignment = Enum.TextXAlignment.Left
                    descriptionLabel.TextWrapped = true
                    descriptionLabel.ZIndex = 15
                    descriptionLabel.Parent = toggleContainer
                end
                
                local toggleButton = Instance.new("Frame")
                toggleButton.Name = "ToggleButton"
                toggleButton.Size = UDim2.new(0, 36, 0, 18)
                toggleButton.Position = UDim2.new(1, -46, 0.5, -9)
                toggleButton.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
                toggleButton.ZIndex = 15
                toggleButton.Parent = toggleContainer
                
                local toggleButtonCorner = Instance.new("UICorner")
                toggleButtonCorner.CornerRadius = UDim.new(1, 0)
                toggleButtonCorner.Parent = toggleButton
                
                local toggleButtonStroke = Instance.new("UIStroke")
                toggleButtonStroke.Color = Color3.fromRGB(70, 70, 120)
                toggleButtonStroke.Thickness = 1
                toggleButtonStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                toggleButtonStroke.Parent = toggleButton
                
                local toggleCircle = Instance.new("Frame")
                toggleCircle.Name = "ToggleCircle"
                toggleCircle.Size = UDim2.new(0, 14, 0, 14)
                toggleCircle.Position = UDim2.new(0, 2, 0.5, -7)
                toggleCircle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                toggleCircle.ZIndex = 16
                toggleCircle.Parent = toggleButton
                
                local toggleCircleCorner = Instance.new("UICorner")
                toggleCircleCorner.CornerRadius = UDim.new(1, 0)
                toggleCircleCorner.Parent = toggleCircle
                
                local function updateToggle()
                    library.flags[options.flag] = toggled
                    
                    local toggleColor = toggled and Color3.fromRGB(80, 120, 200) or Color3.fromRGB(40, 40, 60)
                    local togglePosition = toggled and UDim2.new(1, -16, 0.5, -7) or UDim2.new(0, 2, 0.5, -7)
                    
                    TweenService:Create(toggleButton, TweenInfo.new(0.2), {
                        BackgroundColor3 = toggleColor
                    }):Play()
                    
                    TweenService:Create(toggleCircle, TweenInfo.new(0.2), {
                        Position = togglePosition
                    }):Play()
                    
                    options.callback(toggled)
                end
                
                if toggled then
                    updateToggle()
                end
                
                toggleContainer.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        toggled = not toggled
                        updateToggle()
                    end
                end)
                
                toggleContainer.MouseEnter:Connect(function()
                    TweenService:Create(toggleContainer, TweenInfo.new(0.2), {
                        BackgroundColor3 = Color3.fromRGB(70, 70, 110)
                    }):Play()
                    
                    TweenService:Create(containerStroke, TweenInfo.new(0.2), {
                        Color = Color3.fromRGB(100, 100, 150)
                    }):Play()
                end)
                
                toggleContainer.MouseLeave:Connect(function()
                    TweenService:Create(toggleContainer, TweenInfo.new(0.2), {
                        BackgroundColor3 = Color3.fromRGB(45, 45, 65)
                    }):Play()
                    
                    TweenService:Create(containerStroke, TweenInfo.new(0.2), {
                        Color = Color3.fromRGB(70, 70, 120)
                    }):Play()
                end)
                
                table.insert(section.elements, toggleElement)
                
                function toggleElement:SetValue(value)
                    toggled = value
                    updateToggle()
                end
                
                function toggleElement:GetValue()
                    return toggled
                end
                
                return toggleElement
            end
            
            function section:Slider(options)
                options = options or {}
                options.text = options.text or "Slider"
                options.description = options.description or nil
                options.min = options.min or 0
                options.max = options.max or 100
                options.default = options.default or options.min
                options.increment = options.increment or 1
                options.flag = options.flag or options.text
                options.callback = options.callback or function() end
                
                local sliderElement = {}
                local value = options.default
                local sliderHeight = options.description and 64 or 50
                
                local sliderContainer = Instance.new("Frame")
                sliderContainer.Name = "SliderContainer"
                sliderContainer.Size = UDim2.new(1, 0, 0, sliderHeight)
                sliderContainer.BackgroundColor3 = Color3.fromRGB(45, 45, 65)
                sliderContainer.ZIndex = 14
                sliderContainer.Parent = sectionContent
                
                sliderElement.instance = sliderContainer
                sliderElement.size = UDim2.new(1, 0, 0, sliderHeight)
                
                local containerCorner = Instance.new("UICorner")
                containerCorner.CornerRadius = UDim.new(0, 6)
                containerCorner.Parent = sliderContainer
                
                local containerStroke = Instance.new("UIStroke")
                containerStroke.Color = Color3.fromRGB(70, 70, 120)
                containerStroke.Thickness = 1
                containerStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                containerStroke.Parent = sliderContainer
                
                local containerGradient = Instance.new("UIGradient")
                containerGradient.Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(70, 70, 110)),
                    ColorSequenceKeypoint.new(1, Color3.fromRGB(60, 60, 90))
                })
                containerGradient.Rotation = 90
                containerGradient.Parent = sliderContainer
                
                local sliderLabel = Instance.new("TextLabel")
                sliderLabel.Name = "SliderLabel"
                sliderLabel.Size = UDim2.new(1, -20, 0, 20)
                sliderLabel.Position = UDim2.new(0, 10, 0, 8)
                sliderLabel.BackgroundTransparency = 1
                sliderLabel.Text = options.text
                sliderLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                sliderLabel.Font = Enum.Font.GothamSemibold
                sliderLabel.TextSize = 14
                sliderLabel.TextXAlignment = Enum.TextXAlignment.Left
                sliderLabel.ZIndex = 15
                sliderLabel.Parent = sliderContainer
                
                if options.description then
                    local descriptionLabel = Instance.new("TextLabel")
                    descriptionLabel.Name = "DescriptionLabel"
                    descriptionLabel.Size = UDim2.new(1, -20, 0, 20)
                    descriptionLabel.Position = UDim2.new(0, 10, 0, 28)
                    descriptionLabel.BackgroundTransparency = 1
                    descriptionLabel.Text = options.description
                    descriptionLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
                    descriptionLabel.Font = Enum.Font.Gotham
                    descriptionLabel.TextSize = 12
                    descriptionLabel.TextXAlignment = Enum.TextXAlignment.Left
                    descriptionLabel.TextWrapped = true
                    descriptionLabel.ZIndex = 15
                    descriptionLabel.Parent = sliderContainer
                end
                
                local valueLabel = Instance.new("TextLabel")
                valueLabel.Name = "ValueLabel"
                valueLabel.Size = UDim2.new(0, 50, 0, 20)
                valueLabel.Position = UDim2.new(1, -60, 0, 8)
                valueLabel.BackgroundTransparency = 1
                valueLabel.Text = tostring(value)
                valueLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                valueLabel.Font = Enum.Font.GothamSemibold
                valueLabel.TextSize = 14
                valueLabel.TextXAlignment = Enum.TextXAlignment.Right
                valueLabel.ZIndex = 15
                valueLabel.Parent = sliderContainer
                
                local sliderTrack = Instance.new("Frame")
                sliderTrack.Name = "SliderTrack"
                sliderTrack.Size = UDim2.new(1, -20, 0, 6)
                sliderTrack.Position = UDim2.new(0, 10, 0, options.description and 48 or 34)
                sliderTrack.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
                sliderTrack.ZIndex = 15
                sliderTrack.Parent = sliderContainer
                
                local trackCorner = Instance.new("UICorner")
                trackCorner.CornerRadius = UDim.new(1, 0)
                trackCorner.Parent = sliderTrack
                
                local sliderFill = Instance.new("Frame")
                sliderFill.Name = "SliderFill"
                sliderFill.Size = UDim2.new((value - options.min) / (options.max - options.min), 0, 1, 0)
                sliderFill.BackgroundColor3 = Color3.fromRGB(80, 120, 200)
                sliderFill.ZIndex = 16
                sliderFill.Parent = sliderTrack
                
                local fillCorner = Instance.new("UICorner")
                fillCorner.CornerRadius = UDim.new(1, 0)
                fillCorner.Parent = sliderFill
                
                local sliderButton = Instance.new("TextButton")
                sliderButton.Name = "SliderButton"
                sliderButton.Size = UDim2.new(1, 0, 1, 0)
                sliderButton.BackgroundTransparency = 1
                sliderButton.Text = ""
                sliderButton.ZIndex = 17
                sliderButton.Parent = sliderTrack
                
                local function updateSlider(input)
                    local sizeX = math.clamp((input.Position.X - sliderTrack.AbsolutePosition.X) / sliderTrack.AbsoluteSize.X, 0, 1)
                    local newValue = options.min + ((options.max - options.min) * sizeX)
                    
                    -- Apply increment
                    newValue = math.floor(newValue / options.increment + 0.5) * options.increment
                    newValue = math.clamp(newValue, options.min, options.max)
                    
                    -- Format to avoid floating point issues
                    if options.increment < 1 then
                        local decimalPlaces = math.max(0, -math.floor(math.log10(options.increment)))
                        newValue = string.format("%." .. decimalPlaces .. "f", newValue)
                        newValue = tonumber(newValue)
                    else
                        newValue = math.floor(newValue)
                    end
                    
                    value = newValue
                    
                    TweenService:Create(sliderFill, TweenInfo.new(0.1), {
                        Size = UDim2.new((value - options.min) / (options.max - options.min), 0, 1, 0)
                    }):Play()
                    
                    valueLabel.Text = tostring(value)
                    library.flags[options.flag] = value
                    options.callback(value)
                end
                
                sliderButton.MouseButton1Down:Connect(function()
                    local connection
                    connection = UserInputService.InputChanged:Connect(function(input)
                        if input.UserInputType == Enum.UserInputType.MouseMovement then
                            updateSlider(input)
                        end
                    end)
                    
                    UserInputService.InputEnded:Connect(function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            if connection then
                                connection:Disconnect()
                            end
                        end
                    end)
                end)
                
                sliderContainer.MouseEnter:Connect(function()
                    TweenService:Create(sliderContainer, TweenInfo.new(0.2), {
                        BackgroundColor3 = Color3.fromRGB(70, 70, 110)
                    }):Play()
                    
                    TweenService:Create(containerStroke, TweenInfo.new(0.2), {
                        Color = Color3.fromRGB(100, 100, 150)
                    }):Play()
                end)
                
                sliderContainer.MouseLeave:Connect(function()
                    TweenService:Create(sliderContainer, TweenInfo.new(0.2), {
                        BackgroundColor3 = Color3.fromRGB(45, 45, 65)
                    }):Play()
                    
                    TweenService:Create(containerStroke, TweenInfo.new(0.2), {
                        Color = Color3.fromRGB(70, 70, 120)
                    }):Play()
                end)
                
                table.insert(section.elements, sliderElement)
                
                function sliderElement:SetValue(newValue)
                    newValue = math.clamp(newValue, options.min, options.max)
                    value = newValue
                    
                    TweenService:Create(sliderFill, TweenInfo.new(0.1), {
                        Size = UDim2.new((value - options.min) / (options.max - options.min), 0, 1, 0)
                    }):Play()
                    
                    valueLabel.Text = tostring(value)
                    library.flags[options.flag] = value
                    options.callback(value)
                end
                
                function sliderElement:GetValue()
                    return value
                end
                
                return sliderElement
            end
            
            function section:Label(options)
                options = options or {}
                options.text = options.text or "Label"
                
                local labelElement = {}
                
                local label = Instance.new("TextLabel")
                label.Name = "Label"
                label.Size = UDim2.new(1, 0, 0, 25)
                label.BackgroundTransparency = 1
                label.Text = options.text
                label.TextColor3 = Color3.fromRGB(220, 220, 220)
                label.Font = Enum.Font.GothamSemibold
                label.TextSize = 14
                label.TextXAlignment = Enum.TextXAlignment.Left
                label.TextWrapped = true
                label.ZIndex = 15
                label.Parent = sectionContent
                
                labelElement.instance = label
                labelElement.size = UDim2.new(1, 0, 0, 25)
                
                table.insert(section.elements, labelElement)
                
                function labelElement:SetText(text)
                    label.Text = text
                end
                
                return labelElement
            end
            
            function section:Dropdown(options)
                options = options or {}
                options.text = options.text or "Dropdown"
                options.description = options.description or nil
                options.items = options.items or {}
                options.default = options.default or nil
                options.flag = options.flag or options.text
                options.callback = options.callback or function() end
                
                local dropdownElement = {}
                local selectedItem = options.default
                local isOpen = false
                local dropdownHeight = options.description and 50 or 36
                
                local dropdownContainer = Instance.new("Frame")
                dropdownContainer.Name = "DropdownContainer"
                dropdownContainer.Size = UDim2.new(1, 0, 0, dropdownHeight)
                dropdownContainer.BackgroundColor3 = Color3.fromRGB(45, 45, 65)
                dropdownContainer.ZIndex = 14
                dropdownContainer.ClipsDescendants = true
                dropdownContainer.Parent = sectionContent
                
                dropdownElement.instance = dropdownContainer
                dropdownElement.size = UDim2.new(1, 0, 0, dropdownHeight)
                
                local containerCorner = Instance.new("UICorner")
                containerCorner.CornerRadius = UDim.new(0, 6)
                containerCorner.Parent = dropdownContainer
                
                local containerStroke = Instance.new("UIStroke")
                containerStroke.Color = Color3.fromRGB(70, 70, 120)
                containerStroke.Thickness = 1
                containerStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                containerStroke.Parent = dropdownContainer
                
                local containerGradient = Instance.new("UIGradient")
                containerGradient.Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(70, 70, 110)),
                    ColorSequenceKeypoint.new(1, Color3.fromRGB(60, 60, 90))
                })
                containerGradient.Rotation = 90
                containerGradient.Parent = dropdownContainer
                
                local dropdownLabel = Instance.new("TextLabel")
                dropdownLabel.Name = "DropdownLabel"
                dropdownLabel.Size = UDim2.new(1, -40, 0, options.description and 20 or 36)
                dropdownLabel.Position = UDim2.new(0, 10, 0, options.description and 8 or 0)
                dropdownLabel.BackgroundTransparency = 1
                dropdownLabel.Text = options.text
                dropdownLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                dropdownLabel.Font = Enum.Font.GothamSemibold
                dropdownLabel.TextSize = 14
                dropdownLabel.TextXAlignment = Enum.TextXAlignment.Left
                dropdownLabel.ZIndex = 15
                dropdownLabel.Parent = dropdownContainer
                
                if options.description then
                    local descriptionLabel = Instance.new("TextLabel")
                    descriptionLabel.Name = "DescriptionLabel"
                    descriptionLabel.Size = UDim2.new(1, -40, 0, 20)
                    descriptionLabel.Position = UDim2.new(0, 10, 0, 28)
                    descriptionLabel.BackgroundTransparency = 1
                    descriptionLabel.Text = options.description
                    descriptionLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
                    descriptionLabel.Font = Enum.Font.Gotham
                    descriptionLabel.TextSize = 12
                    descriptionLabel.TextXAlignment = Enum.TextXAlignment.Left
                    descriptionLabel.TextWrapped = true
                    descriptionLabel.ZIndex = 15
                    descriptionLabel.Parent = dropdownContainer
                end
                
                local selectedLabel = Instance.new("TextLabel")
                selectedLabel.Name = "SelectedLabel"
                selectedLabel.Size = UDim2.new(1, -40, 0, 36)
                selectedLabel.Position = UDim2.new(0, 10, 0, 0)
                selectedLabel.BackgroundTransparency = 1
                selectedLabel.Text = selectedItem or "None"
                selectedLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
                selectedLabel.Font = Enum.Font.Gotham
                selectedLabel.TextSize = 14
                selectedLabel.TextXAlignment = Enum.TextXAlignment.Right
                selectedLabel.ZIndex = 15
                selectedLabel.Parent = dropdownContainer
                
                local dropdownArrow = Instance.new("ImageLabel")
                dropdownArrow.Name = "DropdownArrow"
                dropdownArrow.Size = UDim2.new(0, 16, 0, 16)
                dropdownArrow.Position = UDim2.new(1, -30, 0, 10)
                dropdownArrow.BackgroundTransparency = 1
                dropdownArrow.Image = "rbxassetid://6031091004"
                dropdownArrow.ImageColor3 = Color3.fromRGB(180, 180, 180)
                dropdownArrow.ZIndex = 15
                dropdownArrow.Parent = dropdownContainer
                
                local itemsContainer = Instance.new("ScrollingFrame")
                itemsContainer.Name = "ItemsContainer"
                itemsContainer.Size = UDim2.new(1, -10, 0, 0)
                itemsContainer.Position = UDim2.new(0, 5, 0, dropdownHeight)
                itemsContainer.BackgroundTransparency = 1
                itemsContainer.BorderSizePixel = 0
                itemsContainer.ScrollBarThickness = 3
                itemsContainer.ScrollBarImageColor3 = Color3.fromRGB(80, 80, 120)
                itemsContainer.ZIndex = 16
                itemsContainer.Parent = dropdownContainer
                
                local itemsList = Instance.new("UIListLayout")
                itemsList.SortOrder = Enum.SortOrder.LayoutOrder
                itemsList.Padding = UDim.new(0, 5)
                itemsList.Parent = itemsContainer
                
                local function updateDropdown()
                    library.flags[options.flag] = selectedItem
                    selectedLabel.Text = selectedItem or "None"
                    options.callback(selectedItem)
                end
                
                local function createDropdownItem(itemText)
                    local itemButton = Instance.new("TextButton")
                    itemButton.Name = "Item"
                    itemButton.Size = UDim2.new(1, 0, 0, 30)
                    itemButton.BackgroundColor3 = Color3.fromRGB(55, 55, 75)
                    itemButton.Text = itemText
                    itemButton.TextColor3 = Color3.fromRGB(220, 220, 220)
                    itemButton.Font = Enum.Font.Gotham
                    itemButton.TextSize = 14
                    itemButton.ZIndex = 17
                    itemButton.Parent = itemsContainer
                    
                    local itemCorner = Instance.new("UICorner")
                    itemCorner.CornerRadius = UDim.new(0, 4)
                    itemCorner.Parent = itemButton
                    
                    itemButton.MouseEnter:Connect(function()
                        TweenService:Create(itemButton, TweenInfo.new(0.2), {
                            BackgroundColor3 = Color3.fromRGB(70, 70, 100)
                        }):Play()
                    end)
                    
                    itemButton.MouseLeave:Connect(function()
                        TweenService:Create(itemButton, TweenInfo.new(0.2), {
                            BackgroundColor3 = Color3.fromRGB(55, 55, 75)
                        }):Play()
                    end)
                    
                    itemButton.MouseButton1Click:Connect(function()
                        selectedItem = itemText
                        updateDropdown()
                        
                        isOpen = false
                        TweenService:Create(dropdownContainer, TweenInfo.new(0.3, Enum.EasingStyle.Quart), {
                            Size = UDim2.new(1, 0, 0, dropdownHeight)
                        }):Play()
                        
                        TweenService:Create(itemsContainer, TweenInfo.new(0.3, Enum.EasingStyle.Quart), {
                            Size = UDim2.new(1, -10, 0, 0)
                        }):Play()
                        
                        TweenService:Create(dropdownArrow, TweenInfo.new(0.3), {
                            Rotation = 0
                        }):Play()
                    end)
                    
                    return itemButton
                end
                
                for _, item in ipairs(options.items) do
                    createDropdownItem(item)
                end
                
                -- Update canvas size
                itemsContainer.CanvasSize = UDim2.new(0, 0, 0, itemsList.AbsoluteContentSize.Y)
                
                local dropdownButton = Instance.new("TextButton")
                dropdownButton.Name = "DropdownButton"
                dropdownButton.Size = UDim2.new(1, 0, 0, dropdownHeight)
                dropdownButton.BackgroundTransparency = 1
                dropdownButton.Text = ""
                dropdownButton.ZIndex = 16
                dropdownButton.Parent = dropdownContainer
                
                dropdownButton.MouseButton1Click:Connect(function()
                    isOpen = not isOpen
                    
                    local itemsHeight = math.min(120, itemsList.AbsoluteContentSize.Y)
                    
                    if isOpen then
                        TweenService:Create(dropdownContainer, TweenInfo.new(0.3, Enum.EasingStyle.Quart), {
                            Size = UDim2.new(1, 0, 0, dropdownHeight + itemsHeight + 10)
                        }):Play()
                        
                        TweenService:Create(itemsContainer, TweenInfo.new(0.3, Enum.EasingStyle.Quart), {
                            Size = UDim2.new(1, -10, 0, itemsHeight)
                        }):Play()
                        
                        TweenService:Create(dropdownArrow, TweenInfo.new(0.3), {
                            Rotation = 180
                        }):Play()
                    else
                        TweenService:Create(dropdownContainer, TweenInfo.new(0.3, Enum.EasingStyle.Quart), {
                            Size = UDim2.new(1, 0, 0, dropdownHeight)
                        }):Play()
                        
                        TweenService:Create(itemsContainer, TweenInfo.new(0.3, Enum.EasingStyle.Quart), {
                            Size = UDim2.new(1, -10, 0, 0)
                        }):Play()
                        
                        TweenService:Create(dropdownArrow, TweenInfo.new(0.3), {
                            Rotation = 0
                        }):Play()
                    end
                    
                    window:UpdateSections()
                end)
                
                dropdownContainer.MouseEnter:Connect(function()
                    TweenService:Create(dropdownContainer, TweenInfo.new(0.2), {
                        BackgroundColor3 = Color3.fromRGB(70, 70, 110)
                    }):Play()
                    
                    TweenService:Create(containerStroke, TweenInfo.new(0.2), {
                        Color = Color3.fromRGB(100, 100, 150)
                    }):Play()
                end)
                
                dropdownContainer.MouseLeave:Connect(function()
                    TweenService:Create(dropdownContainer, TweenInfo.new(0.2), {
                        BackgroundColor3 = Color3.fromRGB(45, 45, 65)
                    }):Play()
                    
                    TweenService:Create(containerStroke, TweenInfo.new(0.2), {
                        Color = Color3.fromRGB(70, 70, 120)
                    }):Play()
                end)
                
                if selectedItem then
                    updateDropdown()
                end
                
                table.insert(section.elements, dropdownElement)
                
                function dropdownElement:SetValue(value)
                    if table.find(options.items, value) then
                        selectedItem = value
                        updateDropdown()
                    end
                end
                
                function dropdownElement:GetValue()
                    return selectedItem
                end
                
                function dropdownElement:SetItems(items)
                    options.items = items
                    
                    -- Clear existing items
                    for _, child in pairs(itemsContainer:GetChildren()) do
                        if child:IsA("TextButton") then
                            child:Destroy()
                        end
                    end
                    
                    -- Create new items
                    for _, item in ipairs(items) do
                        createDropdownItem(item)
                    end
                    
                    -- Update canvas size
                    itemsContainer.CanvasSize = UDim2.new(0, 0, 0, itemsList.AbsoluteContentSize.Y)
                    
                    -- Reset selection if needed
                    if not table.find(items, selectedItem) then
                        selectedItem = nil
                        updateDropdown()
                    end
                end
                
                return dropdownElement
            end
            
            table.insert(window.sections, section)
            return section
        end
        
        function window:UpdateSections()
            local yOffset = 0
            for i, section in ipairs(window.sections) do
                local sectionHeight = 30
                
                if section.expanded then
                    for _, element in ipairs(section.elements) do
                        sectionHeight = sectionHeight + element.size.Y.Offset + 8
                    end
                    if #section.elements > 0 then
                        sectionHeight = sectionHeight + 8 -- Add padding
                    end
                end
                
                TweenService:Create(section.container, TweenInfo.new(0.3, Enum.EasingStyle.Quart), {
                    Size = UDim2.new(1, -20, 0, sectionHeight),
                    Position = UDim2.new(0, 10, 0, 10 + yOffset)
                }):Play()
                
                yOffset = yOffset + sectionHeight + 10
            end
        end
        
        function window:Button(options)
            local section = window:Section({title = "General"})
            return section:Button(options)
        end
        
        function window:Toggle(options)
            local section = window:Section({title = "General"})
            return section:Toggle(options)
        end
        
        function window:Slider(options)
            local section = window:Section({title = "General"})
            return section:Slider(options)
        end
        
        function window:Label(options)
            local section = window:Section({title = "General"})
            return section:Label(options)
        end
        
        function window:Dropdown(options)
            local section = window:Section({title = "General"})
            return section:Dropdown(options)
        end
        
        table.insert(library.windows, window)
        return window
    end
    
    function library:Tab(options)
        options = options or {}
        options.title = options.title or "Tab"
        options.icon = options.icon or nil
        
        local tab = {}
        tab.windows = {}
        
        -- Make tab container visible if this is the first tab
        if #library.tabs == 0 then
            local tabContainer = library.screenGui:FindFirstChild("TabContainer")
            if tabContainer then
                tabContainer.Visible = true
            end
        end
        
        local tabButton = Instance.new("TextButton")
        tabButton.Name = "TabButton"
        tabButton.Size = UDim2.new(0, 100, 1, 0)
        tabButton.BackgroundTransparency = 1
        tabButton.Text = options.title
        tabButton.TextColor3 = Color3.fromRGB(180, 180, 180)
        tabButton.Font = Enum.Font.GothamSemibold
        tabButton.TextSize = 14
        tabButton.ZIndex = 12
        tabButton.Parent = library.screenGui:FindFirstChild("TabContainer").TabList
        
        if options.icon then
            local iconAsset = getIcon(options.icon)
            if iconAsset then
                local iconImage = Instance.new("ImageLabel")
                iconImage.Name = "IconImage"
                iconImage.Size = UDim2.new(0, 16, 0, 16)
                iconImage.Position = UDim2.new(0, 10, 0.5, -8)
                iconImage.BackgroundTransparency = 1
                iconImage.Image = "rbxassetid://" .. iconAsset.id
                iconImage.ImageRectSize = iconAsset.imageRectSize
                iconImage.ImageRectOffset = iconAsset.imageRectOffset
                iconImage.ImageColor3 = Color3.fromRGB(180, 180, 180)
                iconImage.ZIndex = 13
                iconImage.Parent = tabButton
                
                tabButton.Text = "   " .. options.title
                tabButton.TextXAlignment = Enum.TextXAlignment.Left
                tabButton.Size = UDim2.new(0, 130, 1, 0)
            end
        end
        
        local tabIndicator = Instance.new("Frame")
        tabIndicator.Name = "TabIndicator"
        tabIndicator.Size = UDim2.new(1, 0, 0, 2)
        tabIndicator.Position = UDim2.new(0, 0, 1, -2)
        tabIndicator.BackgroundColor3 = Color3.fromRGB(80, 120, 200)
        tabIndicator.ZIndex = 13
        tabIndicator.Visible = false
        tabIndicator.Parent = tabButton
        
        local function showTab()
            for _, otherTab in ipairs(library.tabs) do
                for _, window in ipairs(otherTab.windows) do
                    window.mainFrame.Visible = false
                end
                
                local otherTabButton = library.screenGui:FindFirstChild("TabContainer").TabList:FindFirstChild(otherTab.title .. "Button")
                if otherTabButton then
                    otherTabButton.TextColor3 = Color3.fromRGB(180, 180, 180)
                    otherTabButton.TabIndicator.Visible = false
                    
                    local iconImage = otherTabButton:FindFirstChild("IconImage")
                    if iconImage then
                        iconImage.ImageColor3 = Color3.fromRGB(180, 180, 180)
                    end
                end
            end
            
            for _, window in ipairs(tab.windows) do
                window.mainFrame.Visible = true
            end
            
            tabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            tabIndicator.Visible = true
            
            local iconImage = tabButton:FindFirstChild("IconImage")
            if iconImage then
                iconImage.ImageColor3 = Color3.fromRGB(255, 255, 255)
            end
        end
        
        tabButton.MouseButton1Click:Connect(showTab)
        
        function tab:Window(options)
            options = options or {}
            options.title = options.title or "Window"
            
            -- Calculate position based on existing windows
            local xOffset = 0
            for _, existingWindow in ipairs(tab.windows) do
                xOffset = xOffset + existingWindow.mainFrame.Size.X.Offset + 10
            end
            
            options.position = UDim2.new(0, 20 + xOffset, 0.5, -175)
            
            local window = library:Window(options)
            window.mainFrame.Visible = #library.tabs == 0 -- Only visible if this is the first tab
            
            table.insert(tab.windows, window)
            return window
        end
        
        tab.title = options.title
        table.insert(library.tabs, tab)
        
        -- If this is the first tab, show it
        if #library.tabs == 1 then
            showTab()
        end
        
        return tab
    end
    
    function library:Notification(options)
        if type(options) == "string" then
            options = {text = options}
        end
        
        options = options or {}
        options.text = options.text or "Notification"
        options.duration = options.duration or 3
        options.icon = options.icon or nil
        
        local textSize = game:GetService("TextService"):GetTextSize(
            options.text,
            14,
            Enum.Font.GothamSemibold,
            Vector2.new(220, 1000)
        )
        
        local notifHeight = math.clamp(textSize.Y + 30, 40, 120)
        
        local notification = Instance.new("Frame")
        notification.Name = "Notification"
        notification.Size = UDim2.new(0, 250, 0, notifHeight)
        notification.Position = UDim2.new(0.5, -125, 0, -notifHeight - 10)
        notification.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
        notification.BorderSizePixel = 0
        notification.ZIndex = 10000000
        notification.Parent = library.screenGui
        
        local notifCorner = Instance.new("UICorner")
        notifCorner.CornerRadius = UDim.new(0, 8)
        notifCorner.Parent = notification
        
        local notifStroke = Instance.new("UIStroke")
        notifStroke.Color = Color3.fromRGB(80, 80, 120)
        notifStroke.Thickness = 1.5
        notifStroke.Parent = notification
        
        local iconSize = 0
        if options.icon then
            local iconAsset = getIcon(options.icon)
            if iconAsset then
                local iconImage = Instance.new("ImageLabel")
                iconImage.Name = "IconImage"
                iconImage.Size = UDim2.new(0, 20, 0, 20)
                iconImage.Position = UDim2.new(0, 15, 0, notifHeight/2 - 10)
                iconImage.BackgroundTransparency = 1
                iconImage.Image = "rbxassetid://" .. iconAsset.id
                iconImage.ImageRectSize = iconAsset.imageRectSize
                iconImage.ImageRectOffset = iconAsset.imageRectOffset
                iconImage.ImageColor3 = Color3.fromRGB(255, 255, 255)
                iconImage.ZIndex = 10000001
                iconImage.Parent = notification
                
                iconSize = 35
            end
        end
        
        local notifText = Instance.new("TextLabel")
        notifText.Size = UDim2.new(1, -(30 + iconSize), 1, -20)
        notifText.Position = UDim2.new(0, 15 + iconSize, 0, 10)
        notifText.BackgroundTransparency = 1
        notifText.Text = options.text
        notifText.TextColor3 = Color3.fromRGB(255, 255, 255)
        notifText.Font = Enum.Font.GothamSemibold
        notifText.TextSize = 14
        notifText.TextWrapped = true
        notifText.TextXAlignment = Enum.TextXAlignment.Left
        notifText.TextYAlignment = Enum.TextYAlignment.Top
        notifText.ZIndex = 10000001
        notifText.Parent = notification
        
        -- Animate in
        TweenService:Create(notification, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
            Position = UDim2.new(0.5, -125, 0, 20)
        }):Play()
        
        -- Animate out after duration
        task.delay(options.duration, function()
            if notification and notification.Parent then
                local outTween = TweenService:Create(notification, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {
                    Position = UDim2.new(0.5, -125, 0, -notifHeight - 10)
                })
                
                outTween.Completed:Connect(function()
                    notification:Destroy()
                end)
                
                outTween:Play()
            end
        end)
        
        return notification
    end
    
    function library:Destroy()
        if library.destroyed then return end
        library.destroyed = true
        
        for _, connection in pairs(library.connections) do
            connection:Disconnect()
        end
        
        if library.screenGui then
            library.screenGui:Destroy()
        end
    end
    
    -- Initialize the library
    library:Init()
    
    return library
end

return RayfieldLite
