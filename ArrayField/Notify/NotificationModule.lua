-- Version AAAA
local NotificationModule = {}

local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local Camera = workspace.CurrentCamera
local Lighting = game:GetService("Lighting")
local Debris = game:GetService("Debris")

local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

local NotificationDuration = 5

local SelectedTheme = {
    Background = Color3.fromRGB(30, 30, 30),
    TextColor = Color3.fromRGB(255, 255, 255),
    NotificationActionsBackground = Color3.fromRGB(50, 50, 50),
}

local ScreenGui = nil
local NotificationsFolder = nil

local neon = (function()
    local module = {}

    do
        local function IsNotNaN(x)
            return x == x
        end
        local continued = IsNotNaN(Camera:ScreenPointToRay(0,0).Origin.x)
        while not continued do
            RunService.RenderStepped:wait()
            continued = IsNotNaN(Camera:ScreenPointToRay(0,0).Origin.x)
        end
    end
    local RootParent = Camera

    local binds = {}
    local root = Instance.new('Folder', RootParent)
    root.Name = 'neon'

    local GenUid; do
        local id = 0
        function GenUid()
            id = id + 1
            return 'neon::'..tostring(id)
        end
    end

    local DrawQuad; do
        local acos, max, pi, sqrt = math.acos, math.max, math.pi, math.sqrt
        local sz = 0.2

        local function DrawTriangle(v1, v2, v3, p0, p1)
            local s1 = (v1 - v2).magnitude
            local s2 = (v2 - v3).magnitude
            local s3 = (v3 - v1).magnitude
            local smax = max(s1, s2, s3)
            local A, B, C
            if s1 == smax then
                A, B, C = v1, v2, v3
            elseif s2 == smax then
                A, B, C = v2, v3, v1
            elseif s3 == smax then
                A, B, C = v3, v1, v2
            end

            local para = ( (B-A).x*(C-A).x + (B-A).y*(C-A).y + (B-A).z*(C-A).z ) / (A-B).magnitude
            local perp = sqrt((C-A).magnitude^2 - para*para)
            local dif_para = (A - B).magnitude - para

            local st = CFrame.new(B, A)
            local za = CFrame.Angles(pi/2,0,0)

            local cf0 = st

            local Top_Look = (cf0 * za).lookVector
            local Mid_Point = A + CFrame.new(A, B).LookVector * para
            local Needed_Look = CFrame.new(Mid_Point, C).LookVector
            local dot = Top_Look.x*Needed_Look.x + Top_Look.y*Needed_Look.y + Top_Look.z*Needed_Look.z

            local ac = CFrame.Angles(0, 0, acos(dot))

            cf0 = cf0 * ac
            if ((cf0 * za).lookVector - Needed_Look).magnitude > 0.01 then
                cf0 = cf0 * CFrame.Angles(0, 0, -2*acos(dot))
            end
            cf0 = cf0 * CFrame.new(0, perp/2, -(dif_para + para/2))

            local cf1 = st * ac * CFrame.Angles(0, pi, 0)
            if ((cf1 * za).lookVector - Needed_Look).magnitude > 0.01 then
                cf1 = cf1 * CFrame.Angles(0, 0, 2*acos(dot))
            end
            cf1 = cf1 * CFrame.new(0, perp/2, dif_para/2)

            if not p0 then
                p0 = Instance.new('Part')
                p0.FormFactor = 'Custom'
                p0.TopSurface = 0
                p0.BottomSurface = 0
                p0.Anchored = true
                p0.CanCollide = false
                p0.Material = 'Glass'
                p0.Size = Vector3.new(sz, sz, sz)
                local mesh = Instance.new('SpecialMesh', p0)
                mesh.MeshType = 2
                mesh.Name = 'WedgeMesh'
            end
            p0.WedgeMesh.Scale = Vector3.new(0, perp/sz, para/sz)
            p0.CFrame = cf0

            if not p1 then
                p1 = p0:clone()
            end
            p1.WedgeMesh.Scale = Vector3.new(0, perp/sz, dif_para/sz)
            p1.CFrame = cf1

            return p0, p1
        end

        function DrawQuad(v1, v2, v3, v4, parts)
            parts[1], parts[2] = DrawTriangle(v1, v2, v3, parts[1], parts[2])
            parts[3], parts[4] = DrawTriangle(v3, v2, v4, parts[3], parts[4])
        end
    end

    function module:BindFrame(frame, properties)
        if RootParent == nil then return end
        if binds[frame] then
            return binds[frame].parts
        end

        local uid = GenUid()
        local parts = {}
        local f = Instance.new('Folder', root)
        f.Name = frame.Name

        local parents = {}
        do
            local function add(child)
                if child:IsA'GuiObject' then
                    parents[#parents + 1] = child
                    add(child.Parent)
                end
            end
            add(frame)
        end

        local function UpdateOrientation(fetchProps)
            local zIndex = 1 - 0.05*frame.ZIndex
            local tl, br = frame.AbsolutePosition, frame.AbsolutePosition + frame.AbsoluteSize
            local tr, bl = Vector2.new(br.x, tl.y), Vector2.new(tl.x, br.y)
            do
                local rot = 0;
                for _, v in ipairs(parents) do
                    rot = rot + v.Rotation
                end
                if rot ~= 0 and rot%180 ~= 0 then
                    local mid = tl:lerp(br, 0.5)
                    local s, c = math.sin(math.rad(rot)), math.cos(math.rad(rot))
                    tl = Vector2.new(c*(tl.x - mid.x) - s*(tl.y - mid.y), s*(tl.x - mid.x) + c*(tl.y - mid.y)) + mid
                    tr = Vector2.new(c*(tr.x - mid.x) - s*(tr.y - mid.y), s*(tr.x - mid.x) + c*(tr.y - mid.y)) + mid
                    bl = Vector2.new(c*(bl.x - mid.x) - s*(bl.y - mid.y), s*(bl.x - mid.x) + c*(bl.y - mid.y)) + mid
                    br = Vector2.new(c*(br.x - mid.x) - s*(br.y - mid.y), s*(br.x - mid.x) + c*(br.y - mid.y)) + mid
                end
            end
            DrawQuad(
                Camera:ScreenPointToRay(tl.x, tl.y, zIndex).Origin,
                Camera:ScreenPointToRay(tr.x, tr.y, zIndex).Origin,
                Camera:ScreenPointToRay(bl.x, bl.y, zIndex).Origin,
                Camera:ScreenPointToRay(br.x, br.y, zIndex).Origin,
                parts
            )
            if fetchProps then
                for _, pt in pairs(parts) do
                    pt.Parent = f
                end
                for propName, propValue in pairs(properties) do
                    for _, pt in pairs(parts) do
                        pt[propName] = propValue
                    end
                end
            end
        end

        UpdateOrientation(true)
        RunService:BindToRenderStep(uid, 2000, UpdateOrientation)

        binds[frame] = {
            uid = uid;
            parts = parts;
        }
        return binds[frame].parts
    end

    function module:Modify(frame, properties)
        local parts = module:GetBoundParts(frame)
        if parts then
            for propName, propValue in pairs(properties) do
                for _, pt in pairs(parts) do
                    pt[propName] = propValue
                end
            end
        end
    end

    function module:UnbindFrame(frame)
        if RootParent == nil then return end
        local cb = binds[frame]
        if cb then
            RunService:UnbindFromRenderStep(cb.uid)
            for _, v in pairs(cb.parts) do
                v:Destroy()
            end
            binds[frame] = nil
        end
    end

    function module:HasBinding(frame)
        return binds[frame] ~= nil
    end

    function module:GetBoundParts(frame)
        return binds[frame] and binds[frame].parts
    end

    return module
end)()

local function CreateUI()
    ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "ArrayFieldNotifications"
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.ResetOnSpawn = false
    ScreenGui.IgnoreGuiInset = true
    ScreenGui.Parent = (gethui and gethui()) or PlayerGui

    NotificationsFolder = Instance.new("Folder")
    NotificationsFolder.Name = "Notifications"
    NotificationsFolder.Parent = ScreenGui

    local Template = Instance.new("Frame")
    Template.Name = "Template"
    Template.AnchorPoint = Vector2.new(0.5, 0.5)
    Template.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Template.BackgroundTransparency = 1
    Template.BorderSizePixel = 0
    Template.Position = UDim2.new(0.5, 0, 1.1, 0)
    Template.Size = UDim2.new(0, 295, 0, 91)
    Template.ClipsDescendants = true
    Template.Visible = false
    Template.Parent = NotificationsFolder

    local TemplateCorner = Instance.new("UICorner")
    TemplateCorner.CornerRadius = UDim.new(0, 10)
    TemplateCorner.Parent = Template

    local TemplateStroke = Instance.new("UIStroke")
    TemplateStroke.Color = Color3.fromRGB(60, 60, 60)
    TemplateStroke.Thickness = 1
    TemplateStroke.Transparency = 0.5
    TemplateStroke.Parent = Template

    local BlurModule = Instance.new("Frame")
    BlurModule.Name = "BlurModule"
    BlurModule.BackgroundTransparency = 1
    BlurModule.Size = UDim2.new(1, 0, 1, 0)
    BlurModule.ZIndex = 0
    BlurModule.Parent = Template

    local Icon = Instance.new("ImageLabel")
    Icon.Name = "Icon"
    Icon.BackgroundTransparency = 1
    Icon.Position = UDim2.new(0, 15, 0, 18)
    Icon.Size = UDim2.new(0, 40, 0, 40)
    Icon.Image = "rbxassetid://3944680095"
    Icon.ImageTransparency = 1
    Icon.ImageColor3 = Color3.fromRGB(255, 255, 255)
    Icon.ScaleType = Enum.ScaleType.Fit
    Icon.Parent = Template

    local Title = Instance.new("TextLabel")
    Title.Name = "Title"
    Title.BackgroundTransparency = 1
    Title.Position = UDim2.new(0, 65, 0, 21)
    Title.Size = UDim2.new(0, 215, 0, 15)
    Title.Font = Enum.Font.GothamBold
    Title.Text = "Notification"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 14
    Title.TextTransparency = 1
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.TextScaled = true
    Title.Parent = Template

    local Description = Instance.new("TextLabel")
    Description.Name = "Description"
    Description.BackgroundTransparency = 1
    Description.Position = UDim2.new(0, 65, 0, 40)
    Description.Size = UDim2.new(0, 215, 0, 40)
    Description.Font = Enum.Font.Gotham
    Description.Text = "Description"
    Description.TextColor3 = Color3.fromRGB(255, 255, 255)
    Description.TextSize = 12
    Description.TextTransparency = 1
    Description.TextWrapped = true
    Description.TextXAlignment = Enum.TextXAlignment.Left
    Description.TextYAlignment = Enum.TextYAlignment.Top
    Description.Parent = Template

    local Actions = Instance.new("Frame")
    Actions.Name = "Actions"
    Actions.BackgroundTransparency = 1
    Actions.Position = UDim2.new(0, 15, 0, 88)
    Actions.Size = UDim2.new(1, -30, 0, 40)
    Actions.Parent = Template

    local ActionsLayout = Instance.new("UIListLayout")
    ActionsLayout.FillDirection = Enum.FillDirection.Horizontal
    ActionsLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    ActionsLayout.Padding = UDim.new(0, 8)
    ActionsLayout.Parent = Actions

    local ActionTemplate = Instance.new("TextButton")
    ActionTemplate.Name = "Template"
    ActionTemplate.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    ActionTemplate.BackgroundTransparency = 1
    ActionTemplate.Size = UDim2.new(0, 80, 0, 36)
    ActionTemplate.Font = Enum.Font.GothamSemibold
    ActionTemplate.Text = "Action"
    ActionTemplate.TextColor3 = Color3.fromRGB(255, 255, 255)
    ActionTemplate.TextSize = 13
    ActionTemplate.TextTransparency = 1
    ActionTemplate.AutoButtonColor = false
    ActionTemplate.Visible = false
    ActionTemplate.Parent = Actions

    local ActionCorner = Instance.new("UICorner")
    ActionCorner.CornerRadius = UDim.new(0, 7)
    ActionCorner.Parent = ActionTemplate
end

function NotificationModule:SetTheme(theme)
    for key, value in pairs(theme) do
        SelectedTheme[key] = value
    end
end

function NotificationModule:SetDuration(duration)
    NotificationDuration = duration
end

function NotificationModule:Init()
    if not ScreenGui then
        CreateUI()
    end
    return self
end

function NotificationModule:Notify(NotificationSettings)
    spawn(function()
        if not ScreenGui then
            CreateUI()
        end

        if not NotificationsFolder then return end

        local Template = NotificationsFolder:FindFirstChild("Template")
        if not Template then return end

        local ActionCompleted = true
        local Notification = Template:Clone()
        Notification.Parent = NotificationsFolder
        Notification.Name = NotificationSettings.Title or "Unknown Title"
        Notification.Visible = true

        local blurlight = Instance.new("DepthOfFieldEffect", Lighting)
        blurlight.Enabled = true
        blurlight.FarIntensity = 0
        blurlight.FocusDistance = 51.6
        blurlight.InFocusRadius = 50
        blurlight.NearIntensity = 1
        Debris:AddItem(blurlight, 10)

        if Notification:FindFirstChild("Actions") and Notification.Actions:FindFirstChild("Template") then
            Notification.Actions.Template.Visible = false

            if NotificationSettings.Actions then
                for _, Action in pairs(NotificationSettings.Actions) do
                    ActionCompleted = false
                    local NewAction = Notification.Actions.Template:Clone()
                    NewAction.BackgroundColor3 = SelectedTheme.NotificationActionsBackground
                    NewAction.TextColor3 = SelectedTheme.TextColor
                    NewAction.Name = Action.Name
                    NewAction.Visible = true
                    NewAction.Parent = Notification.Actions
                    NewAction.Text = Action.Name
                    NewAction.BackgroundTransparency = 1
                    NewAction.TextTransparency = 1
                    NewAction.Size = UDim2.new(0, NewAction.TextBounds.X + 27, 0, 36)

                    NewAction.MouseButton1Click:Connect(function()
                        local Success, Response = pcall(Action.Callback)
                        if not Success then
                            print("ArrayField Notification | Action: "..Action.Name.." Callback Error " ..tostring(Response))
                        end
                        ActionCompleted = true
                    end)
                end
            end
        end

        Notification.BackgroundColor3 = SelectedTheme.Background

        if Notification:FindFirstChild("Title") then
            Notification.Title.Text = NotificationSettings.Title or "Unknown"
            Notification.Title.TextTransparency = 1
            Notification.Title.TextColor3 = SelectedTheme.TextColor
            Notification.Title.TextScaled = true
            Notification.Title.Size = UDim2.new(0, 215, 0, 15)
            Notification.Title.Position = UDim2.new(0, 65, 0, 21)
        end

        if Notification:FindFirstChild("Description") then
            Notification.Description.Text = NotificationSettings.Content or "Unknown"
            Notification.Description.TextTransparency = 1
            Notification.Description.TextColor3 = SelectedTheme.TextColor
            Notification.Description.TextWrapped = true
            Notification.Description.Size = UDim2.new(0, 215, 0, 40)
            Notification.Description.Position = UDim2.new(0, 65, 0, 40)
        end

        if Notification:FindFirstChild("Icon") then
            Notification.Icon.ImageColor3 = SelectedTheme.TextColor
        end

        if NotificationSettings.Image and Notification:FindFirstChild("Icon") then
            pcall(function()
                Notification.Icon.Image = "rbxassetid://" .. tostring(NotificationSettings.Image)
                Notification.Icon.ImageRectOffset = Vector2.new(0, 0)
                Notification.Icon.ImageRectSize = Vector2.new(0, 0)
            end)
        else
            if Notification:FindFirstChild("Icon") then
                Notification.Icon.Image = "rbxassetid://3944680095"
                Notification.Icon.ImageRectOffset = Vector2.new(0, 0)
                Notification.Icon.ImageRectSize = Vector2.new(0, 0)
            end
        end

        if Notification:FindFirstChild("Icon") then
            Notification.Icon.ImageTransparency = 1
        end

        Notification.Size = UDim2.new(0, 260, 0, 80)
        Notification.BackgroundTransparency = 1

        TweenService:Create(Notification, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 295, 0, 91)}):Play()
        TweenService:Create(Notification, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0.1}):Play()
        Notification:TweenPosition(UDim2.new(0.5, 0, 0.915, 0), 'Out', 'Quint', 0.8, true)

        wait(0.3)

        if Notification:FindFirstChild("Icon") then
            TweenService:Create(Notification.Icon, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {ImageTransparency = 0}):Play()
        end
        if Notification:FindFirstChild("Title") then
            TweenService:Create(Notification.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
        end
        if Notification:FindFirstChild("Description") then
            TweenService:Create(Notification.Description, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {TextTransparency = 0.2}):Play()
        end
        wait(0.2)

        TweenService:Create(Notification, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 0.4}):Play()

        if neon and Notification:FindFirstChild("BlurModule") then
            neon:BindFrame(Notification.BlurModule, {
                Transparency = 0.98;
                BrickColor = BrickColor.new("Institutional white");
            })
        end

        if not NotificationSettings.Actions then
            wait(NotificationSettings.Duration or NotificationDuration - 0.5)
        else
            wait(0.8)
            TweenService:Create(Notification, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 295, 0, 132)}):Play()
            wait(0.3)
            if Notification:FindFirstChild("Actions") then
                for _, Action in ipairs(Notification.Actions:GetChildren()) do
                    if Action.ClassName == "TextButton" and Action.Name ~= "Template" then
                        TweenService:Create(Action, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 0.2}):Play()
                        TweenService:Create(Action, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
                        wait(0.05)
                    end
                end
            end
        end

        repeat wait(0.001) until ActionCompleted

        if Notification and Notification.Parent then
            if Notification:FindFirstChild("Actions") then
                for _, Action in ipairs(Notification.Actions:GetChildren()) do
                    if Action.ClassName == "TextButton" and Action.Name ~= "Template" then
                        TweenService:Create(Action, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
                        TweenService:Create(Action, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
                    end
                end
            end

            if Notification:FindFirstChild("Title") then
                TweenService:Create(Notification.Title, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Position = UDim2.new(0.47, 0, 0.234, 0)}):Play()
            end
            if Notification:FindFirstChild("Description") then
                TweenService:Create(Notification.Description, TweenInfo.new(0.8, Enum.EasingStyle.Quint), {Position = UDim2.new(0.528, 0, 0.637, 0)}):Play()
            end

            TweenService:Create(Notification, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 280, 0, 83)}):Play()
            if Notification:FindFirstChild("Icon") then
                TweenService:Create(Notification.Icon, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
            end
            TweenService:Create(Notification, TweenInfo.new(0.8, Enum.EasingStyle.Quint), {BackgroundTransparency = 0.6}):Play()

            wait(0.3)

            if Notification:FindFirstChild("Title") then
                TweenService:Create(Notification.Title, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {TextTransparency = 0.4}):Play()
            end
            if Notification:FindFirstChild("Description") then
                TweenService:Create(Notification.Description, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {TextTransparency = 0.5}):Play()
            end

            wait(0.4)

            TweenService:Create(Notification, TweenInfo.new(0.9, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 260, 0, 0)}):Play()
            TweenService:Create(Notification, TweenInfo.new(0.8, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
            if Notification:FindFirstChild("Title") then
                TweenService:Create(Notification.Title, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
            end
            if Notification:FindFirstChild("Description") then
                TweenService:Create(Notification.Description, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
            end

            wait(0.2)

            if neon and Notification:FindFirstChild("BlurModule") then
                neon:UnbindFrame(Notification.BlurModule)
            end
            if blurlight then
                blurlight:Destroy()
            end

            wait(0.9)
            if Notification then
                Notification:Destroy()
            end
        end
    end)
end

function NotificationModule:Destroy()
    if ScreenGui then
        ScreenGui:Destroy()
        ScreenGui = nil
        NotificationsFolder = nil
    end
end

return NotificationModule
