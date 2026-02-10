--ffs
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

local NotificationsModuleGui = nil
local Notifications = nil

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

local function LoadUI()
    local objects = game:GetObjects("rbxassetid://122378503168013")
    NotificationsModuleGui = objects[1]
    NotificationsModuleGui.Parent = (gethui and gethui()) or PlayerGui

    if NotificationsModuleGui:IsA("ScreenGui") then
        NotificationsModuleGui.ResetOnSpawn = false
        NotificationsModuleGui.Enabled = true
    end

    Notifications = NotificationsModuleGui:FindFirstChild("Notifications")

    if not Notifications then
        for _, v in pairs(NotificationsModuleGui:GetChildren()) do
            if v:IsA("Frame") then
                Notifications = v
                break
            end
        end
    end

    if not Notifications then
        for _, v in pairs(NotificationsModuleGui:GetDescendants()) do
            if v:IsA("Frame") and v:FindFirstChild("Template") then
                Notifications = v
                break
            end
        end
    end

    if Notifications then
        Notifications.Visible = true
    end
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
    if not NotificationsModuleGui then
        LoadUI()
    end
    return self
end

function NotificationModule:Notify(NotificationSettings)
    spawn(function()
        if not NotificationsModuleGui then
            LoadUI()
        end

        if not Notifications then return end

        local Template = nil
        for _, v in pairs(Notifications:GetChildren()) do
            if v.Name == "Template" then
                Template = v
                break
            end
        end

        if not Template then return end

        local ActionCompleted = true
        local Notification = Template:Clone()
        Notification.Parent = Notifications
        Notification.Name = NotificationSettings.Title or "Unknown Title"
        Notification.Visible = true

        local blurlight = Instance.new("DepthOfFieldEffect", Lighting)
        blurlight.Enabled = true
        blurlight.FarIntensity = 0
        blurlight.FocusDistance = 51.6
        blurlight.InFocusRadius = 50
        blurlight.NearIntensity = 1
        Debris:AddItem(blurlight, 10)

        local ActionsHolder = nil
        local ActionTemplate = nil
        for _, v in pairs(Notification:GetDescendants()) do
            if v.Name == "Actions" then
                ActionsHolder = v
            end
        end

        if ActionsHolder then
            for _, v in pairs(ActionsHolder:GetChildren()) do
                if v.Name == "Template" then
                    ActionTemplate = v
                    break
                end
            end
        end

        if ActionsHolder and ActionTemplate then
            ActionTemplate.Visible = false

            if NotificationSettings.Actions then
                for _, Action in pairs(NotificationSettings.Actions) do
                    ActionCompleted = false
                    local NewAction = ActionTemplate:Clone()
                    NewAction.BackgroundColor3 = SelectedTheme.NotificationActionsBackground
                    NewAction.TextColor3 = SelectedTheme.TextColor
                    NewAction.Name = Action.Name
                    NewAction.Visible = true
                    NewAction.Parent = ActionsHolder
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

        local TitleLabel = nil
        local DescriptionLabel = nil
        local IconImage = nil
        local BlurModule = nil

        for _, v in pairs(Notification:GetChildren()) do
            if v.Name == "Title" then
                TitleLabel = v
            elseif v.Name == "Description" then
                DescriptionLabel = v
            elseif v.Name == "Icon" then
                IconImage = v
            elseif v.Name == "BlurModule" then
                BlurModule = v
            end
        end

        if TitleLabel then
            TitleLabel.Text = NotificationSettings.Title or "Unknown"
            TitleLabel.TextTransparency = 1
            TitleLabel.TextColor3 = SelectedTheme.TextColor
            TitleLabel.TextScaled = true
            TitleLabel.Size = UDim2.new(0, 250, 0, 15)
            TitleLabel.Position = UDim2.new(0, 165, 0, 21)
        end

        if DescriptionLabel then
            DescriptionLabel.Text = NotificationSettings.Content or "Unknown"
            DescriptionLabel.TextTransparency = 1
            DescriptionLabel.TextColor3 = SelectedTheme.TextColor
            DescriptionLabel.TextWrapped = true
            DescriptionLabel.Size = UDim2.new(0, 260, 0, 55)
            DescriptionLabel.Position = UDim2.new(0, 147, 0, 60)
        end

        if IconImage then
            IconImage.ImageColor3 = SelectedTheme.TextColor
        end

        if NotificationSettings.Image and IconImage then
            pcall(function()
                IconImage.Image = "rbxassetid://" .. tostring(NotificationSettings.Image)
                IconImage.ImageRectOffset = Vector2.new(0, 0)
                IconImage.ImageRectSize = Vector2.new(0, 0)
            end)
        else
            if IconImage then
                IconImage.Image = "rbxassetid://3944680095"
                IconImage.ImageRectOffset = Vector2.new(0, 0)
                IconImage.ImageRectSize = Vector2.new(0, 0)
            end
        end

        if IconImage then
            IconImage.ImageTransparency = 1
        end

        Notification.Size = UDim2.new(0, 260, 0, 80)
        Notification.BackgroundTransparency = 1

        TweenService:Create(Notification, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 295, 0, 91)}):Play()
        TweenService:Create(Notification, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0.1}):Play()
        Notification:TweenPosition(UDim2.new(0.5, 0, 0.915, 0), 'Out', 'Quint', 0.8, true)

        wait(0.3)

        if IconImage then
            TweenService:Create(IconImage, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {ImageTransparency = 0}):Play()
        end
        if TitleLabel then
            TweenService:Create(TitleLabel, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
        end
        if DescriptionLabel then
            TweenService:Create(DescriptionLabel, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {TextTransparency = 0.2}):Play()
        end
        wait(0.2)

        TweenService:Create(Notification, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 0.4}):Play()

        if neon and BlurModule then
            neon:BindFrame(BlurModule, {
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
            if ActionsHolder then
                for _, Action in ipairs(ActionsHolder:GetChildren()) do
                    if Action:IsA("TextButton") and Action.Name ~= "Template" then
                        TweenService:Create(Action, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 0.2}):Play()
                        TweenService:Create(Action, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
                        wait(0.05)
                    end
                end
            end
        end

        repeat wait(0.001) until ActionCompleted

        if Notification and Notification.Parent then
            if ActionsHolder then
                for _, Action in ipairs(ActionsHolder:GetChildren()) do
                    if Action:IsA("TextButton") and Action.Name ~= "Template" then
                        TweenService:Create(Action, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
                        TweenService:Create(Action, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
                    end
                end
            end

            if TitleLabel then
                TweenService:Create(TitleLabel, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Position = UDim2.new(0.47, 0, 0.234, 0)}):Play()
            end
            if DescriptionLabel then
                TweenService:Create(DescriptionLabel, TweenInfo.new(0.8, Enum.EasingStyle.Quint), {Position = UDim2.new(0.528, 0, 0.637, 0)}):Play()
            end

            TweenService:Create(Notification, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 280, 0, 83)}):Play()
            if IconImage then
                TweenService:Create(IconImage, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
            end
            TweenService:Create(Notification, TweenInfo.new(0.8, Enum.EasingStyle.Quint), {BackgroundTransparency = 0.6}):Play()

            wait(0.3)

            if TitleLabel then
                TweenService:Create(TitleLabel, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {TextTransparency = 0.4}):Play()
            end
            if DescriptionLabel then
                TweenService:Create(DescriptionLabel, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {TextTransparency = 0.5}):Play()
            end

            wait(0.4)

            TweenService:Create(Notification, TweenInfo.new(0.9, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 260, 0, 0)}):Play()
            TweenService:Create(Notification, TweenInfo.new(0.8, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
            if TitleLabel then
                TweenService:Create(TitleLabel, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
            end
            if DescriptionLabel then
                TweenService:Create(DescriptionLabel, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
            end

            wait(0.2)

            if neon and BlurModule then
                neon:UnbindFrame(BlurModule)
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
    if NotificationsModuleGui then
        NotificationsModuleGui:Destroy()
        NotificationsModuleGui = nil
        Notifications = nil
    end
end

return NotificationModule
