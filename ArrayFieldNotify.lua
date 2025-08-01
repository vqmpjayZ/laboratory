--[[
ArrayField Standalone Notification System
Extracted from ArrayField Interface Suite by Meta/vqmpjay
TESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTEST
Usage:
local Notify = loadstring(game:HttpGet("your-script-url"))()
Notify({
    Title = "Test Notification",
    Content = "This is a test notification",
    Duration = 5,
    Image = "bell", -- Lucide icon name or asset ID
    Actions = {
        {
            Name = "Accept",
            Callback = function()
                print("Accepted!")
            end
        },
        {
            Name = "Decline", 
            Callback = function()
                print("Declined!")
            end
        }
    }
})
]]

-- Services
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local Debris = game:GetService("Debris")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer

-- Configuration
local NotificationDuration = 6.5

-- Theme
local Theme = {
    TextColor = Color3.fromRGB(240, 240, 240),
    Background = Color3.fromRGB(25, 25, 25),
    NotificationBackground = Color3.fromRGB(20, 20, 20),
    NotificationActionsBackground = Color3.fromRGB(230, 230, 230),
}

-- Icons (Lucide Icons subset)
local Icons = {
    ['48px'] = {
        bell = {18474184849, {960, 960}, {0, 0}},
        check = {18474185634, {960, 960}, {0, 0}},
        x = {18474186962, {960, 960}, {0, 0}},
        info = {18474186165, {960, 960}, {0, 0}},
        alert = {18474184218, {960, 960}, {0, 0}},
        ["alert-triangle"] = {18474184218, {960, 960}, {0, 0}},
        ["eye-closed"] = {18474185364, {960, 960}, {0, 0}},
        heart = {18474185896, {960, 960}, {0, 0}},
        star = {18474186648, {960, 960}, {0, 0}},
        ["venetian-mask"] = {18474186859, {960, 960}, {0, 0}},
    }
}

local function getIcon(name)
    name = string.match(string.lower(name), "^%s*(.*)%s*$")
    local sizedicons = Icons['48px']
    
    local r = sizedicons[name]
    if not r then
        -- Return default icon if not found
        return {
            id = 3944680095,
            imageRectOffset = Vector2.new(0, 0),
            imageRectSize = Vector2.new(0, 0),
        }
    end
    
    return {
        id = r[1],
        imageRectOffset = Vector2.new(r[3][1], r[3][2]),
        imageRectSize = Vector2.new(r[2][1], r[2][2]),
    }
end

-- GUI Creation
local function createNotificationGui()
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "ArrayFieldNotifications"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.DisplayOrder = 100
    
    -- Parent to appropriate location
    local success = pcall(function()
        if get_hidden_gui or gethui then
            local hiddenUI = get_hidden_gui or gethui
            ScreenGui.Parent = hiddenUI()
        elseif (not is_sirhurt_closure) and (syn and syn.protect_gui) then
            syn.protect_gui(ScreenGui)
            ScreenGui.Parent = CoreGui
        elseif CoreGui then
            ScreenGui.Parent = CoreGui
        end
    end)
    
    if not success then
        ScreenGui.Parent = LocalPlayer:FindFirstChildWhichIsA("PlayerGui")
    end
    
    -- Notifications container
    local Notifications = Instance.new("Frame")
    Notifications.Name = "Notifications"
    Notifications.BackgroundTransparency = 1
    Notifications.Position = UDim2.new(1, -320, 1, -20)
    Notifications.Size = UDim2.new(0, 300, 1, 0)
    Notifications.Parent = ScreenGui
    
    -- Template notification
    local Template = Instance.new("Frame")
    Template.Name = "Template"
    Template.BackgroundColor3 = Theme.NotificationBackground
    Template.BackgroundTransparency = 1
    Template.BorderSizePixel = 0
    Template.Position = UDim2.new(0.5, 0, 0.915, 0)
    Template.Size = UDim2.new(0, 260, 0, 80)
    Template.Visible = false
    Template.AnchorPoint = Vector2.new(0.5, 0)
    Template.Parent = Notifications
    
    -- Corner
    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 6)
    Corner.Parent = Template
    
    -- Shadow (simplified)
    local Shadow = Instance.new("Frame")
    Shadow.Name = "Shadow"
    Shadow.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Shadow.BackgroundTransparency = 0.8
    Shadow.BorderSizePixel = 0
    Shadow.Position = UDim2.new(0, 2, 0, 2)
    Shadow.Size = UDim2.new(1, 0, 1, 0)
    Shadow.ZIndex = -1
    Shadow.Parent = Template
    
    local ShadowCorner = Instance.new("UICorner")
    ShadowCorner.CornerRadius = UDim.new(0, 6)
    ShadowCorner.Parent = Shadow
    
    -- Icon
    local Icon = Instance.new("ImageLabel")
    Icon.Name = "Icon"
    Icon.BackgroundTransparency = 1
    Icon.Position = UDim2.new(0, 20, 0, 20)
    Icon.Size = UDim2.new(0, 24, 0, 24)
    Icon.Image = "rbxassetid://3944680095"
    Icon.ImageColor3 = Theme.TextColor
    Icon.Parent = Template
    
    -- Title
    local Title = Instance.new("TextLabel")
    Title.Name = "Title"
    Title.BackgroundTransparency = 1
    Title.Position = UDim2.new(0, 55, 0, 18)
    Title.Size = UDim2.new(1, -70, 0, 20)
    Title.Text = "Notification"
    Title.TextColor3 = Theme.TextColor
    Title.TextSize = 14
    Title.Font = Enum.Font.GothamBold
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.Parent = Template
    
    -- Description
    local Description = Instance.new("TextLabel")
    Description.Name = "Description"
    Description.BackgroundTransparency = 1
    Description.Position = UDim2.new(0, 55, 0, 38)
    Description.Size = UDim2.new(1, -70, 0, 32)
    Description.Text = "Description"
    Description.TextColor3 = Theme.TextColor
    Description.TextSize = 12
    Description.Font = Enum.Font.Gotham
    Description.TextXAlignment = Enum.TextXAlignment.Left
    Description.TextYAlignment = Enum.TextYAlignment.Top
    Description.TextWrapped = true
    Description.Parent = Template
    
    -- Actions container
    local Actions = Instance.new("Frame")
    Actions.Name = "Actions"
    Actions.BackgroundTransparency = 1
    Actions.Position = UDim2.new(0, 10, 1, -35)
    Actions.Size = UDim2.new(1, -20, 0, 25)
    Actions.Parent = Template
    
    local ActionsLayout = Instance.new("UIListLayout")
    ActionsLayout.FillDirection = Enum.FillDirection.Horizontal
    ActionsLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
    ActionsLayout.Padding = UDim.new(0, 8)
    ActionsLayout.Parent = Actions
    
    -- Action template
    local ActionTemplate = Instance.new("TextButton")
    ActionTemplate.Name = "Template"
    ActionTemplate.BackgroundColor3 = Theme.NotificationActionsBackground
    ActionTemplate.BackgroundTransparency = 1
    ActionTemplate.BorderSizePixel = 0
    ActionTemplate.Size = UDim2.new(0, 60, 0, 25)
    ActionTemplate.Text = "Action"
    ActionTemplate.TextColor3 = Color3.fromRGB(50, 50, 50)
    ActionTemplate.TextSize = 11
    ActionTemplate.Font = Enum.Font.GothamMedium
    ActionTemplate.Visible = false
    ActionTemplate.Parent = Actions
    
    local ActionCorner = Instance.new("UICorner")
    ActionCorner.CornerRadius = UDim.new(0, 4)
    ActionCorner.Parent = ActionTemplate
    
    -- BlurModule for effects
    local BlurModule = Instance.new("Frame")
    BlurModule.Name = "BlurModule"
    BlurModule.BackgroundTransparency = 1
    BlurModule.Size = UDim2.new(1, 0, 1, 0)
    BlurModule.Parent = Template
    
    return ScreenGui, Notifications, Template
end

-- Neon effect (simplified version)
local neonEffects = {}
local function createNeonEffect(frame)
    local id = tostring(frame)
    neonEffects[id] = frame
    -- This is a simplified version - the original neon module is quite complex
    -- For now, we'll just store the reference
end

local function removeNeonEffect(frame)
    local id = tostring(frame)
    neonEffects[id] = nil
end

-- Main notification function
local function Notify(NotificationSettings)
    -- Get or create GUI
    local existingGui = CoreGui:FindFirstChild("ArrayFieldNotifications") or (LocalPlayer.PlayerGui and LocalPlayer.PlayerGui:FindFirstChild("ArrayFieldNotifications"))
    local ScreenGui, Notifications, Template
    
    if existingGui then
        ScreenGui = existingGui
        Notifications = ScreenGui.Notifications
        Template = Notifications.Template
    else
        ScreenGui, Notifications, Template = createNotificationGui()
    end
    
    -- Create notification instance
    local Notification = Template:Clone()
    Notification.Name = NotificationSettings.Title or "Unknown Title"
    Notification.Visible = true
    Notification.Parent = Notifications
    
    -- Blur effect (simplified)
    local blurlight = nil
    pcall(function()
        blurlight = Instance.new("DepthOfFieldEffect", game:GetService("Lighting"))
        blurlight.Enabled = true
        blurlight.FarIntensity = 0
        blurlight.FocusDistance = 51.6
        blurlight.InFocusRadius = 50
        blurlight.NearIntensity = 1
        Debris:AddItem(blurlight, NotificationDuration + 5)
    end)
    
    -- Setup notification
    local ActionCompleted = true
    Notification.Actions.Template.Visible = false
    
    -- Handle actions
    if NotificationSettings.Actions then
        ActionCompleted = false
        for _, Action in pairs(NotificationSettings.Actions) do
            local NewAction = Notification.Actions.Template:Clone()
            NewAction.BackgroundColor3 = Theme.NotificationActionsBackground
            NewAction.Name = Action.Name
            NewAction.Visible = true
            NewAction.Parent = Notification.Actions
            NewAction.Text = Action.Name
            NewAction.BackgroundTransparency = 1
            NewAction.TextTransparency = 1
            
            -- Auto-size button
            local textBounds = game:GetService("TextService"):GetTextSize(
                Action.Name, 11, Enum.Font.GothamMedium, Vector2.new(400, 25)
            )
            NewAction.Size = UDim2.new(0, textBounds.X + 16, 0, 25)
            
            NewAction.MouseButton1Click:Connect(function()
                local Success, Response = pcall(Action.Callback)
                if not Success then
                    warn("ArrayField Notification Action Error: " .. tostring(Response))
                end
                ActionCompleted = true
            end)
        end
    end
    
    -- Set content
    Notification.BackgroundColor3 = Theme.Background
    Notification.Title.Text = NotificationSettings.Title or "Unknown"
    Notification.Title.TextTransparency = 1
    Notification.Title.TextColor3 = Theme.TextColor
    Notification.Description.Text = NotificationSettings.Content or "Unknown"
    Notification.Description.TextTransparency = 1
    Notification.Description.TextColor3 = Theme.TextColor
    Notification.Icon.ImageColor3 = Theme.TextColor
    
    -- Handle icon
    if NotificationSettings.Image then
        pcall(function()
            if type(NotificationSettings.Image) == "string" and not tonumber(NotificationSettings.Image) then
                local asset = getIcon(NotificationSettings.Image)
                Notification.Icon.Image = "rbxassetid://" .. asset.id
                Notification.Icon.ImageRectOffset = asset.imageRectOffset
                Notification.Icon.ImageRectSize = asset.imageRectSize
            else
                Notification.Icon.Image = "rbxassetid://" .. tostring(NotificationSettings.Image)
                Notification.Icon.ImageRectOffset = Vector2.new(0, 0)
                Notification.Icon.ImageRectSize = Vector2.new(0, 0)
            end
        end)
    else
        Notification.Icon.Image = "rbxassetid://3944680095"
        Notification.Icon.ImageRectOffset = Vector2.new(0, 0)
        Notification.Icon.ImageRectSize = Vector2.new(0, 0)
    end
    
    Notification.Icon.ImageTransparency = 1
    
    -- Initial setup
    Notification.Size = UDim2.new(0, 260, 0, 80)
    Notification.BackgroundTransparency = 1
    
    -- Position notifications properly
    local notificationCount = 0
    for _, child in pairs(Notifications:GetChildren()) do
        if child.Name ~= "Template" and child.Visible then
            notificationCount = notificationCount + 1
        end
    end
    
    Notification.Position = UDim2.new(0.5, 0, 1, -20 - (notificationCount * 100))
    
    -- Animate in
    spawn(function()
        TweenService:Create(Notification, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 295, 0, 91)}):Play()
        TweenService:Create(Notification, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0.1}):Play()
        
        wait(0.3)
        TweenService:Create(Notification.Icon, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {ImageTransparency = 0}):Play()
        TweenService:Create(Notification.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
        TweenService:Create(Notification.Description, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {TextTransparency = 0.2}):Play()
        wait(0.2)
        
        -- Neon effect
        createNeonEffect(Notification.BlurModule)
        
        if not NotificationSettings.Actions then
            wait(NotificationSettings.Duration or NotificationDuration - 0.5)
        else
            wait(0.8)
            TweenService:Create(Notification, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 295, 0, 132)}):Play()
            wait(0.3)
            for _, Action in ipairs(Notification.Actions:GetChildren()) do
                if Action.ClassName == "TextButton" and Action.Name ~= "Template" then
                    TweenService:Create(Action, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 0.2}):Play()
                    TweenService:Create(Action, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
                    wait(0.05)
                end
            end
        end
        
        repeat wait(0.001) until ActionCompleted
        
        -- Animate out
        for _, Action in ipairs(Notification.Actions:GetChildren()) do
            if Action.ClassName == "TextButton" and Action.Name ~= "Template" then
                TweenService:Create(Action, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
                TweenService:Create(Action, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
            end
        end
        
        TweenService:Create(Notification.Title, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Position = UDim2.new(0.47, 0, 0.234, 0)}):Play()
        TweenService:Create(Notification.Description, TweenInfo.new(0.8, Enum.EasingStyle.Quint), {Position = UDim2.new(0.528, 0, 0.637, 0)}):Play()
        TweenService:Create(Notification, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 280, 0, 83)}):Play()
        TweenService:Create(Notification.Icon, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
        TweenService:Create(Notification, TweenInfo.new(0.8, Enum.EasingStyle.Quint), {BackgroundTransparency = 0.6}):Play()
        
        wait(0.3)
        TweenService:Create(Notification.Title, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {TextTransparency = 0.4}):Play()
        TweenService:Create(Notification.Description, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {TextTransparency = 0.5}):Play()
        wait(0.4)
        TweenService:Create(Notification, TweenInfo.new(0.9, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 260, 0, 0)}):Play()
        TweenService:Create(Notification, TweenInfo.new(0.8, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
        TweenService:Create(Notification.Title, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
        TweenService:Create(Notification.Description, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
        wait(0.2)
        
        -- Cleanup
        removeNeonEffect(Notification.BlurModule)
        if blurlight then
            blurlight:Destroy()
        end
        
        wait(0.9)
        Notification:Destroy()
    end)
end

return Notify
