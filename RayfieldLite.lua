--guess who came with anotha one??? (another ripoff)
local RayfieldLite = {}

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

function RayfieldLite.new(title)
    local library = {}
    library.windows = {}
    library.flags = {}
    library.destroyed = false
    
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "RayfieldLiteGui"
    screenGui.Parent = player.PlayerGui
    screenGui.ResetOnSpawn = false
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    screenGui.DisplayOrder = 9999999
    
    library.screenGui = screenGui
    
    function library:Window(options)
        options = options or {}
        options.title = options.title or title or "RayfieldLite"
        options.size = options.size or UDim2.new(0, 220, 0, 100)
        options.position = options.position or UDim2.new(1, -240, 0, 20)
        
        local window = {}
        window.minimized = false
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
        
        local contentFrame = Instance.new("Frame")
        contentFrame.Name = "ContentFrame"
        contentFrame.Size = UDim2.new(1, 0, 1, -30)
        contentFrame.Position = UDim2.new(0, 0, 0, 30)
        contentFrame.BackgroundTransparency = 1
        contentFrame.ClipsDescendants = true
        contentFrame.ZIndex = 11
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
        
        function window:Button(options)
            options = options or {}
            options.text = options.text or "Button"
            options.callback = options.callback or function() end
            
            local buttonElement = {}
            
            local yOffset = 0
            for _, element in ipairs(window.elements) do
                yOffset = yOffset + element.size.Y.Offset + 5
            end
            
            local button = Instance.new("TextButton")
            button.Name = "Button"
            button.Size = UDim2.new(1, -20, 0, 36)
            button.Position = UDim2.new(0, 10, 0, 10 + yOffset)
            button.BackgroundColor3 = Color3.fromRGB(45, 45, 65)
            button.Text = options.text
            button.TextColor3 = Color3.fromRGB(255, 255, 255)
            button.Font = Enum.Font.GothamSemibold
            button.TextSize = 14
            button.AutoButtonColor = false
            button.ClipsDescendants = true
            button.ZIndex = 12
            button.Parent = contentFrame
            
            buttonElement.instance = button
            buttonElement.size = UDim2.new(1, -20, 0, 36)
            
            local buttonCorner = Instance.new("UICorner")
            buttonCorner.CornerRadius = UDim.new(0, 6)
            buttonCorner.Parent = button
            
            local buttonStroke = Instance.new("UIStroke")
            buttonStroke.Color = Color3.fromRGB(70, 70, 120)
            buttonStroke.Thickness = 2
            buttonStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            buttonStroke.Parent = button
            
            local buttonGradient = Instance.new("UIGradient")
            buttonGradient.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(70, 70, 110)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(60, 60, 90))
            })
            buttonGradient.Rotation = 90
            buttonGradient.Parent = button
            
            local function createRipple(btn)
                local ripple = Instance.new("Frame")
                ripple.Name = "Ripple"
                ripple.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ripple.BackgroundTransparency = 0.8
                ripple.BorderSizePixel = 0
                ripple.ZIndex = btn.ZIndex + 1
                ripple.Parent = btn
                
                local rippleCorner = Instance.new("UICorner")
                rippleCorner.CornerRadius = UDim.new(1, 0)
                rippleCorner.Parent = ripple
                
                local mousePos = UserInputService:GetMouseLocation() - Vector2.new(btn.AbsolutePosition.X, btn.AbsolutePosition.Y)
                local size = math.max(btn.AbsoluteSize.X, btn.AbsoluteSize.Y) * 2
                
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
            
            button.MouseButton1Down:Connect(function()
                createRipple(button)
                TweenService:Create(button, TweenInfo.new(0.1), {
                    BackgroundColor3 = Color3.fromRGB(55, 55, 85)
                }):Play()
            end)
            
            button.MouseButton1Up:Connect(function()
                TweenService:Create(button, TweenInfo.new(0.1), {
                    BackgroundColor3 = Color3.fromRGB(70, 70, 110)
                }):Play()
            end)
            button.MouseButton1Click:Connect(function()
                options.callback()
            end)
            
            table.insert(window.elements, buttonElement)
            
            function buttonElement:SetText(text)
                button.Text = text
            end
            
            return buttonElement
        end
        
        function window:Toggle(options)
            options = options or {}
            options.text = options.text or "Toggle"
            options.default = options.default or false
            options.flag = options.flag or options.text
            options.callback = options.callback or function() end
            
            local toggleElement = {}
            local toggled = options.default
            
            local yOffset = 0
            for _, element in ipairs(window.elements) do
                yOffset = yOffset + element.size.Y.Offset + 5
            end
            
            local toggleContainer = Instance.new("Frame")
            toggleContainer.Name = "ToggleContainer"
            toggleContainer.Size = UDim2.new(1, -20, 0, 36)
            toggleContainer.Position = UDim2.new(0, 10, 0, 10 + yOffset)
            toggleContainer.BackgroundColor3 = Color3.fromRGB(45, 45, 65)
            toggleContainer.ZIndex = 12
            toggleContainer.Parent = contentFrame
            
            toggleElement.instance = toggleContainer
            toggleElement.size = UDim2.new(1, -20, 0, 36)
            
            local containerCorner = Instance.new("UICorner")
            containerCorner.CornerRadius = UDim.new(0, 6)
            containerCorner.Parent = toggleContainer
            
            local containerStroke = Instance.new("UIStroke")
            containerStroke.Color = Color3.fromRGB(70, 70, 120)
            containerStroke.Thickness = 2
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
            toggleLabel.Size = UDim2.new(1, -50, 1, 0)
            toggleLabel.Position = UDim2.new(0, 10, 0, 0)
            toggleLabel.BackgroundTransparency = 1
            toggleLabel.Text = options.text
            toggleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            toggleLabel.Font = Enum.Font.GothamSemibold
            toggleLabel.TextSize = 14
            toggleLabel.TextXAlignment = Enum.TextXAlignment.Left
            toggleLabel.ZIndex = 13
            toggleLabel.Parent = toggleContainer
            
            local toggleButton = Instance.new("Frame")
            toggleButton.Name = "ToggleButton"
            toggleButton.Size = UDim2.new(0, 36, 0, 18)
            toggleButton.Position = UDim2.new(1, -46, 0.5, -9)
            toggleButton.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
            toggleButton.ZIndex = 13
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
            toggleCircle.ZIndex = 14
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
            
            table.insert(window.elements, toggleElement)
            
            function toggleElement:SetValue(value)
                toggled = value
                updateToggle()
            end
            
            function toggleElement:GetValue()
                return toggled
            end
            
            return toggleElement
        end
        
        function window:Slider(options)
            options = options or {}
            options.text = options.text or "Slider"
            options.min = options.min or 0
            options.max = options.max or 100
            options.default = options.default or options.min
            options.increment = options.increment or 1
            options.flag = options.flag or options.text
            options.callback = options.callback or function() end
            
            local sliderElement = {}
            local value = options.default
            
            local yOffset = 0
            for _, element in ipairs(window.elements) do
                yOffset = yOffset + element.size.Y.Offset + 5
            end
            
            local sliderContainer = Instance.new("Frame")
            sliderContainer.Name = "SliderContainer"
            sliderContainer.Size = UDim2.new(1, -20, 0, 50)
            sliderContainer.Position = UDim2.new(0, 10, 0, 10 + yOffset)
            sliderContainer.BackgroundColor3 = Color3.fromRGB(45, 45, 65)
            sliderContainer.ZIndex = 12
            sliderContainer.Parent = contentFrame
            
            sliderElement.instance = sliderContainer
            sliderElement.size = UDim2.new(1, -20, 0, 50)
            
            local containerCorner = Instance.new("UICorner")
            containerCorner.CornerRadius = UDim.new(0, 6)
            containerCorner.Parent = sliderContainer
            
            local containerStroke = Instance.new("UIStroke")
            containerStroke.Color = Color3.fromRGB(70, 70, 120)
            containerStroke.Thickness = 2
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
            sliderLabel.Position = UDim2.new(0, 10, 0, 5)
            sliderLabel.BackgroundTransparency = 1
            sliderLabel.Text = options.text
            sliderLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            sliderLabel.Font = Enum.Font.GothamSemibold
            sliderLabel.TextSize = 14
            sliderLabel.TextXAlignment = Enum.TextXAlignment.Left
            sliderLabel.ZIndex = 13
            sliderLabel.Parent = sliderContainer
            
            local valueLabel = Instance.new("TextLabel")
            valueLabel.Name = "ValueLabel"
            valueLabel.Size = UDim2.new(0, 50, 0, 20)
            valueLabel.Position = UDim2.new(1, -60, 0, 5)
            valueLabel.BackgroundTransparency = 1
            valueLabel.Text = tostring(value)
            valueLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            valueLabel.Font = Enum.Font.GothamSemibold
            valueLabel.TextSize = 14
            valueLabel.TextXAlignment = Enum.TextXAlignment.Right
            valueLabel.ZIndex = 13
            valueLabel.Parent = sliderContainer
            
            local sliderTrack = Instance.new("Frame")
            sliderTrack.Name = "SliderTrack"
            sliderTrack.Size = UDim2.new(1, -20, 0, 6)
            sliderTrack.Position = UDim2.new(0, 10, 0, 30)
            sliderTrack.BackgroundColor3 = Color3.fromRGB(30, 30, 50)
            sliderTrack.ZIndex = 13
            sliderTrack.Parent = sliderContainer
            
            local trackCorner = Instance.new("UICorner")
            trackCorner.CornerRadius = UDim.new(1, 0)
            trackCorner.Parent = sliderTrack
            
            local sliderFill = Instance.new("Frame")
            sliderFill.Name = "SliderFill"
            sliderFill.Size = UDim2.new(0, 0, 1, 0)
            sliderFill.BackgroundColor3 = Color3.fromRGB(80, 120, 200)
            sliderFill.ZIndex = 14
            sliderFill.Parent = sliderTrack
            
            local fillCorner = Instance.new("UICorner")
            fillCorner.CornerRadius = UDim.new(1, 0)
            fillCorner.Parent = sliderFill
            
            local sliderButton = Instance.new("TextButton")
            sliderButton.Name = "SliderButton"
            sliderButton.Size = UDim2.new(1, 0, 1, 0)
            sliderButton.BackgroundTransparency = 1
            sliderButton.Text = ""
            sliderButton.ZIndex = 15
            sliderButton.Parent = sliderTrack
            
            local function updateSlider(input)
                local sizeX = math.clamp((input.Position.X - sliderTrack.AbsolutePosition.X) / sliderTrack.AbsoluteSize.X, 0, 1)
                
                local newValue = options.min + ((options.max - options.min) * sizeX)
                newValue = math.floor(newValue / options.increment + 0.5) * options.increment
                newValue = math.clamp(newValue, options.min, options.max)
                
                if newValue ~= value then
                    value = newValue
                    valueLabel.Text = tostring(value)
                    
                    TweenService:Create(sliderFill, TweenInfo.new(0.1), {
                        Size = UDim2.new(sizeX, 0, 1, 0)
                    }):Play()
                    
                    library.flags[options.flag] = value
                    options.callback(value)
                end
            end
            
            sliderButton.MouseButton1Down:Connect(function(input)
                updateSlider({Position = input})
                
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
            
            local initialValue = (value - options.min) / (options.max - options.min)
            sliderFill.Size = UDim2.new(initialValue, 0, 1, 0)
            valueLabel.Text = tostring(value)
            library.flags[options.flag] = value
            
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
                
                table.insert(window.elements, sliderElement)
                
                function sliderElement:SetValue(newValue)
                    newValue = math.clamp(newValue, options.min, options.max)
                    value = newValue
                    
                    local sizeX = (value - options.min) / (options.max - options.min)
                    TweenService:Create(sliderFill, TweenInfo.new(0.1), {
                        Size = UDim2.new(sizeX, 0, 1, 0)
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
            
            function window:Label(options)
                options = options or {}
                options.text = options.text or "Label"
                
                local labelElement = {}
                
                local yOffset = 0
                for _, element in ipairs(window.elements) do
                    yOffset = yOffset + element.size.Y.Offset + 5
                end
                
                local label = Instance.new("TextLabel")
                label.Name = "Label"
                label.Size = UDim2.new(1, -20, 0, 25)
                label.Position = UDim2.new(0, 10, 0, 10 + yOffset)
                label.BackgroundTransparency = 1
                label.Text = options.text
                label.TextColor3 = Color3.fromRGB(220, 220, 220)
                label.Font = Enum.Font.GothamSemibold
                label.TextSize = 14
                label.TextXAlignment = Enum.TextXAlignment.Left
                label.TextWrapped = true
                label.ZIndex = 12
                label.Parent = contentFrame
                
                labelElement.instance = label
                labelElement.size = UDim2.new(1, -20, 0, 25)
                
                table.insert(window.elements, labelElement)
                
                function labelElement:SetText(text)
                    label.Text = text
                end
                
                return labelElement
            end
            
            function window:Dropdown(options)
                options = options or {}
                options.text = options.text or "Dropdown"
                options.items = options.items or {}
                options.default = options.default or nil
                options.flag = options.flag or options.text
                options.callback = options.callback or function() end
                
                local dropdownElement = {}
                local selectedItem = options.default
                local isOpen = false
                
                local yOffset = 0
                for _, element in ipairs(window.elements) do
                    yOffset = yOffset + element.size.Y.Offset + 5
                end
                
                local dropdownContainer = Instance.new("Frame")
                dropdownContainer.Name = "DropdownContainer"
                dropdownContainer.Size = UDim2.new(1, -20, 0, 36)
                dropdownContainer.Position = UDim2.new(0, 10, 0, 10 + yOffset)
                dropdownContainer.BackgroundColor3 = Color3.fromRGB(45, 45, 65)
                dropdownContainer.ZIndex = 12
                dropdownContainer.ClipsDescendants = true
                dropdownContainer.Parent = contentFrame
                
                dropdownElement.instance = dropdownContainer
                dropdownElement.size = UDim2.new(1, -20, 0, 36)
                
                local containerCorner = Instance.new("UICorner")
                containerCorner.CornerRadius = UDim.new(0, 6)
                containerCorner.Parent = dropdownContainer
                
                local containerStroke = Instance.new("UIStroke")
                containerStroke.Color = Color3.fromRGB(70, 70, 120)
                containerStroke.Thickness = 2
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
                dropdownLabel.Size = UDim2.new(1, -40, 0, 36)
                dropdownLabel.Position = UDim2.new(0, 10, 0, 0)
                dropdownLabel.BackgroundTransparency = 1
                dropdownLabel.Text = options.text
                dropdownLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                dropdownLabel.Font = Enum.Font.GothamSemibold
                dropdownLabel.TextSize = 14
                dropdownLabel.TextXAlignment = Enum.TextXAlignment.Left
                dropdownLabel.ZIndex = 13
                dropdownLabel.Parent = dropdownContainer
                
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
                selectedLabel.ZIndex = 13
                selectedLabel.Parent = dropdownContainer
                
                local dropdownArrow = Instance.new("ImageLabel")
                dropdownArrow.Name = "DropdownArrow"
                dropdownArrow.Size = UDim2.new(0, 16, 0, 16)
                dropdownArrow.Position = UDim2.new(1, -30, 0.5, -8)
                dropdownArrow.BackgroundTransparency = 1
                dropdownArrow.Image = "rbxassetid://6031091004"
                dropdownArrow.ImageColor3 = Color3.fromRGB(180, 180, 180)
                dropdownArrow.ZIndex = 13
                dropdownArrow.Parent = dropdownContainer
                
                local itemsContainer = Instance.new("Frame")
                itemsContainer.Name = "ItemsContainer"
                itemsContainer.Size = UDim2.new(1, -10, 0, 0)
                itemsContainer.Position = UDim2.new(0, 5, 0, 36)
                itemsContainer.BackgroundTransparency = 1
                itemsContainer.ZIndex = 14
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
                    itemButton.ZIndex = 15
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
                        TweenService:Create(dropdownContainer, TweenInfo.new(0.3), {
                            Size = UDim2.new(1, -20, 0, 36)
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
                
                dropdownContainer.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        isOpen = not isOpen
                        
                        local itemsHeight = #options.items * 35
                        local targetSize = isOpen and UDim2.new(1, -20, 0, 36 + itemsHeight) or UDim2.new(1, -20, 0, 36)
                        
                        TweenService:Create(dropdownContainer, TweenInfo.new(0.3), {
                            Size = targetSize
                        }):Play()
                        
                        TweenService:Create(dropdownArrow, TweenInfo.new(0.3), {
                            Rotation = isOpen and 180 or 0
                        }):Play()
                    end
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
                
                table.insert(window.elements, dropdownElement)
                
                function dropdownElement:SetValue(value)
                    if table.find(options.items, value) then
                        selectedItem = value
                        updateDropdown()
                    end
                end
                
                function dropdownElement:GetValue()
                    return selectedItem
                end
                
                function dropdownElement:Refresh(items)
                    options.items = items
                    
                    for _, child in ipairs(itemsContainer:GetChildren()) do
                        if child:IsA("TextButton") then
                            child:Destroy()
                        end
                    end
                    
                    for _, item in ipairs(items) do
                        createDropdownItem(item)
                    end
                    
                    if not table.find(items, selectedItem) then
                        selectedItem = nil
                        updateDropdown()
                    end
                end
                
                return dropdownElement
            end
            
            function window:Notification(options)
                options = options or {}
                options.text = options.text or "Notification"
                options.duration = options.duration or 3
                
                local notification = Instance.new("Frame")
                notification.Name = "Notification"
                notification.Size = UDim2.new(0, 220, 0, 40)
                notification.Position = UDim2.new(0.5, -110, 0, -50)
                notification.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
                notification.BorderSizePixel = 0
                notification.ZIndex = 10000000
                notification.Parent = screenGui
                
                local notifCorner = Instance.new("UICorner")
                notifCorner.CornerRadius = UDim.new(0, 8)
                notifCorner.Parent = notification
                
                local notifStroke = Instance.new("UIStroke")
                notifStroke.Color = Color3.fromRGB(80, 80, 120)
                notifStroke.Thickness = 1.5
                notifStroke.Parent = notification
                
                local notifText = Instance.new("TextLabel")
                notifText.Size = UDim2.new(1, -20, 1, 0)
                notifText.Position = UDim2.new(0, 10, 0, 0)
                notifText.BackgroundTransparency = 1
                notifText.Text = options.text
                notifText.TextColor3 = Color3.fromRGB(255, 255, 255)
                notifText.Font = Enum.Font.GothamSemibold
                notifText.TextSize = 14
                notifText.TextWrapped = true
                notifText.ZIndex = 10000001
                notifText.Parent = notification
                
                TweenService:Create(notification, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                    Position = UDim2.new(0.5, -110, 0, 20)
                }):Play()
                
                delay(options.duration, function()
                    if library.destroyed then return end
                    
                    local outTween = TweenService:Create(notification, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {
                        Position = UDim2.new(0.5, -110, 0, -50)
                })
                outTween:Play()
                
                outTween.Completed:Connect(function()
                    notification:Destroy()
                end)
            end)
        end
        
        function window:UpdateSize()
            local totalHeight = 0
            for _, element in ipairs(window.elements) do
                totalHeight = totalHeight + element.size.Y.Offset + 5
            end
            
            totalHeight = totalHeight + 15
            
            if not window.minimized then
                mainFrame.Size = UDim2.new(options.size.X.Scale, options.size.X.Offset, 0, totalHeight + 30)
            end
        end
        
        table.insert(library.windows, window)
        return window
    end
    
    function library:Notification(text, duration)
        duration = duration or 3
        
        local notification = Instance.new("Frame")
        notification.Name = "Notification"
        notification.Size = UDim2.new(0, 220, 0, 40)
        notification.Position = UDim2.new(0.5, -110, 0, -50)
        notification.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
        notification.BorderSizePixel = 0
        notification.ZIndex = 10000000
        notification.Parent = screenGui
        
        local notifCorner = Instance.new("UICorner")
        notifCorner.CornerRadius = UDim.new(0, 8)
        notifCorner.Parent = notification
        
        local notifStroke = Instance.new("UIStroke")
        notifStroke.Color = Color3.fromRGB(80, 80, 120)
        notifStroke.Thickness = 1.5
        notifStroke.Parent = notification
        
        local notifText = Instance.new("TextLabel")
        notifText.Size = UDim2.new(1, -20, 1, 0)
        notifText.Position = UDim2.new(0, 10, 0, 0)
        notifText.BackgroundTransparency = 1
        notifText.Text = text
        notifText.TextColor3 = Color3.fromRGB(255, 255, 255)
        notifText.Font = Enum.Font.GothamSemibold
        notifText.TextSize = 14
        notifText.TextWrapped = true
        notifText.ZIndex = 10000001
        notifText.Parent = notification
        
        TweenService:Create(notification, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
            Position = UDim2.new(0.5, -110, 0, 20)
        }):Play()
        
        delay(duration, function()
            if library.destroyed then return end
            
            local outTween = TweenService:Create(notification, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {
                Position = UDim2.new(0.5, -110, 0, -50)
            })
            outTween:Play()
            
            outTween.Completed:Connect(function()
                notification:Destroy()
            end)
        end)
    end
    
    function library:Destroy()
        library.destroyed = true
        screenGui:Destroy()
    end
    
    return library
end

return RayfieldLite
