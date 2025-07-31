-- Enhanced Button function with Description support
-- Replace your existing Tab:CreateButton function with this one

function Tab:CreateButton(ButtonSettings)
    local ButtonValue = {Locked = false}

    local Button = Elements.Template.Button:Clone()
    ButtonValue.Button = Button
    Tab.Elements[Button.Name] = {
        type = 'button',
        section = ButtonSettings.SectionParent,
        element = Button
    }

    Button.Name = ButtonSettings.Name
    Button.Title.Text = ButtonSettings.Name
    Button.ElementIndicator.Text = ButtonSettings.Interact or 'button'
    Button.Visible = true

    Button.BackgroundTransparency = 1
    Button.UIStroke.Transparency = 1
    Button.Title.TextTransparency = 1
    
    if ButtonSettings.SectionParent then
        Button.Parent = ButtonSettings.SectionParent.Holder
    else
        Button.Parent = TabPage
    end
    
    TweenService:Create(Button, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
    TweenService:Create(Button.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
    TweenService:Create(Button.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()    

    -- Description hover functionality
    local DescriptionFrame = nil
    local DescriptionVisible = false
    
    local function CreateDescriptionFrame()
        if not ButtonSettings.Description then return end
        
        DescriptionFrame = Instance.new("Frame")
        DescriptionFrame.Name = "DescriptionTooltip"
        DescriptionFrame.Size = UDim2.new(0, 200, 0, 25)
        DescriptionFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
        DescriptionFrame.BorderSizePixel = 0
        DescriptionFrame.BackgroundTransparency = 0
        DescriptionFrame.ZIndex = 1000
        DescriptionFrame.Visible = false
        DescriptionFrame.Parent = Button
        
        local DescriptionCorner = Instance.new("UICorner")
        DescriptionCorner.CornerRadius = UDim.new(0, 4)
        DescriptionCorner.Parent = DescriptionFrame
        
        local DescriptionStroke = Instance.new("UIStroke")
        DescriptionStroke.Color = Color3.fromRGB(70, 70, 70)
        DescriptionStroke.Thickness = 1
        DescriptionStroke.Parent = DescriptionFrame
        
        local DescriptionLabel = Instance.new("TextLabel")
        DescriptionLabel.Name = "DescriptionText"
        DescriptionLabel.Size = UDim2.new(1, -8, 1, -4)
        DescriptionLabel.Position = UDim2.new(0, 4, 0, 2)
        DescriptionLabel.BackgroundTransparency = 1
        DescriptionLabel.Text = ButtonSettings.Description
        DescriptionLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
        DescriptionLabel.TextSize = 12
        DescriptionLabel.Font = Enum.Font.Gotham
        DescriptionLabel.TextXAlignment = Enum.TextXAlignment.Left
        DescriptionLabel.TextYAlignment = Enum.TextYAlignment.Center
        DescriptionLabel.Parent = DescriptionFrame
        
        -- Adjust frame size based on text
        local textService = game:GetService("TextService")
        local textSize = textService:GetTextSize(ButtonSettings.Description, 12, Enum.Font.Gotham, Vector2.new(400, math.huge))
        DescriptionFrame.Size = UDim2.new(0, math.max(textSize.X + 16, 120), 0, math.max(textSize.Y + 8, 25))
    end
    
    if ButtonSettings.Description then
        CreateDescriptionFrame()
    end

    Button.Interact.MouseButton1Click:Connect(function()
        if ButtonValue.Locked then return end
        local Success, Response = pcall(ButtonSettings.Callback)
        if not Success then
            TweenService:Create(Button, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = Color3.fromRGB(85, 0, 0)}):Play()
            TweenService:Create(Button.ElementIndicator, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
            TweenService:Create(Button.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
            Button.Title.Text = "Callback Error"
            print("ArrayField | "..ButtonSettings.Name.." Callback Error " ..tostring(Response))
            wait(0.5)
            Button.Title.Text = ButtonSettings.Name
            TweenService:Create(Button, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
            TweenService:Create(Button.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
            TweenService:Create(Button.ElementIndicator, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {TextTransparency = 0.9}):Play()
        else
            SaveConfiguration()
            TweenService:Create(Button, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
            TweenService:Create(Button.ElementIndicator, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
            TweenService:Create(Button.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
            wait(0.2)
            TweenService:Create(Button, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
            TweenService:Create(Button.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
            TweenService:Create(Button.ElementIndicator, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {TextTransparency = 0.9}):Play()
        end
    end)

    Button.MouseEnter:Connect(function()
        TweenService:Create(Button, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
        TweenService:Create(Button.ElementIndicator, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {TextTransparency = 0.7}):Play()
        
        -- Show description on hover
        if ButtonSettings.Description and DescriptionFrame and not DescriptionVisible then
            DescriptionVisible = true
            DescriptionFrame.Visible = true
            DescriptionFrame.Position = UDim2.new(0, 10, 1, 5)
            DescriptionFrame.BackgroundTransparency = 1
            DescriptionFrame.DescriptionText.TextTransparency = 1
            
            -- Move title up slightly (but keep it centered)
            TweenService:Create(Button.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {
                Position = UDim2.new(0, 10, 0, 5)
            }):Play()
            TweenService:Create(Button, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {
                Size = UDim2.new(0, 465, 0, Button.AbsoluteSize.Y + DescriptionFrame.AbsoluteSize.Y + 10)
            }):Play()
            
            -- Animate description appearance
            TweenService:Create(DescriptionFrame, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
            TweenService:Create(DescriptionFrame.DescriptionText, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
        end
    end)

    Button.MouseLeave:Connect(function()
        TweenService:Create(Button, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
        TweenService:Create(Button.ElementIndicator, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {TextTransparency = 0.9}):Play()
        
        -- Hide description on mouse leave
        if ButtonSettings.Description and DescriptionFrame and DescriptionVisible then
            DescriptionVisible = false
            
            -- Move title back to original position (centered vertically)
            TweenService:Create(Button.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {
                Position = UDim2.new(0, 10, 0.5, -8)
            }):Play()
            
            -- Animate description disappearance
            TweenService:Create(DescriptionFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
            TweenService:Create(DescriptionFrame.DescriptionText, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
            
            -- Animate button size back to normal
            TweenService:Create(Button, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {
                Size = UDim2.new(0, 465, 0, 40)
            }):Play()
            
            wait(0.3)
            if not DescriptionVisible then
                DescriptionFrame.Visible = false
            end
        end
    end)

    function ButtonValue:Set(NewButton, Interaction)
        Button.Title.Text = NewButton or Button.Title.Text
        Button.Name = NewButton or Button.Name
        Button.ElementIndicator.Text = Interaction or Button.ElementIndicator.Text
    end
    
    function ButtonValue:SetDescription(NewDescription)
        ButtonSettings.Description = NewDescription
        if DescriptionFrame then
            DescriptionFrame.DescriptionText.Text = NewDescription
            -- Recalculate frame size
            local textService = game:GetService("TextService")
            local textSize = textService:GetTextSize(NewDescription, 12, Enum.Font.Gotham, Vector2.new(400, math.huge))
            DescriptionFrame.Size = UDim2.new(0, math.max(textSize.X + 16, 120), 0, math.max(textSize.Y + 8, 25))
        elseif NewDescription then
            CreateDescriptionFrame()
        end
    end
    
    function ButtonValue:Destroy()
        if DescriptionFrame then
            DescriptionFrame:Destroy()
        end
        Button:Destroy()
    end
    
    function ButtonValue:Lock(Reason)
        if ButtonValue.Locked then return end
        ButtonValue.Locked = true
        Button.Lock.Reason.Text = Reason or 'Locked'
        TweenService:Create(Button.Lock, TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundTransparency = 0}):Play()
        TweenService:Create(Button.Lock.Reason, TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {TextTransparency = 0}):Play()
        wait(0.2)
        if not ButtonValue.Locked then return end --no icon bug
        TweenService:Create(Button.Lock.Reason.Icon, TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {ImageTransparency = 0}):Play()
    end
    
    function ButtonValue:Unlock()
        if not ButtonValue.Locked then return end
        ButtonValue.Locked = false
        wait(0.2)
        TweenService:Create(Button.Lock.Reason.Icon, TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {ImageTransparency = 1}):Play()
        if ButtonValue.Locked then return end --no icon bug
        TweenService:Create(Button.Lock, TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
        TweenService:Create(Button.Lock.Reason, TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {TextTransparency = 1}):Play()
    end
    
    function ButtonValue:Visible(bool)
        Button.Visible = bool
    end

    return ButtonValue
end
