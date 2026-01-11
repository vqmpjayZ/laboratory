local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local HttpService = game:GetService("HttpService")
local GuiService = game:GetService("GuiService")

local LocalPlayer = Players.LocalPlayer

local ArrayFieldLibrary = {
    Flags = {},
Theme = {
    Default = nil,
    Dark = {
        TextFont = "Default",
        TextColor = Color3.fromRGB(230, 230, 230),
        Background = Color3.fromRGB(15, 15, 15),
        Topbar = Color3.fromRGB(22, 22, 22),
        Shadow = Color3.fromRGB(8, 8, 8),
        ElementBackground = Color3.fromRGB(20, 20, 20),
        ElementBackgroundHover = Color3.fromRGB(28, 28, 28),
        ElementStroke = Color3.fromRGB(40, 40, 40),
        SidebarBackground = Color3.fromRGB(18, 18, 18),
        NotificationActionsBackground = Color3.fromRGB(220, 220, 220),
        InputBackground = Color3.fromRGB(18, 18, 18),
        InputStroke = Color3.fromRGB(40, 40, 40),
        Accent = Color3.fromRGB(90, 90, 90),
        
        TabBackground = Color3.fromRGB(25, 25, 25),
        TabBackgroundSelected = Color3.fromRGB(90, 90, 90),
        TabTextColor = Color3.fromRGB(200, 200, 200),
        SelectedTabTextColor = Color3.fromRGB(255, 255, 255),
        TabStroke = Color3.fromRGB(40, 40, 40),
        
        ToggleBackground = Color3.fromRGB(30, 30, 30),
        ToggleEnabled = Color3.fromRGB(90, 90, 90),
        ToggleDisabled = Color3.fromRGB(50, 50, 50),
        ToggleEnabledStroke = Color3.fromRGB(100, 100, 100),
        ToggleDisabledStroke = Color3.fromRGB(40, 40, 40),
        ToggleEnabledOuterStroke = Color3.fromRGB(70, 70, 70),
        ToggleDisabledOuterStroke = Color3.fromRGB(35, 35, 35),
        
        SliderBackground = Color3.fromRGB(25, 25, 25),
        SliderStroke = Color3.fromRGB(40, 40, 40),
        SliderProgress = Color3.fromRGB(90, 90, 90),
        
        SecondaryElementBackground = Color3.fromRGB(25, 25, 25),
        SecondaryElementStroke = Color3.fromRGB(35, 35, 35)
    },
    Amethyst = {
        TextFont = "Default",
        TextColor = Color3.fromRGB(240, 240, 240),
        Background = Color3.fromRGB(30, 25, 35),
        Topbar = Color3.fromRGB(40, 32, 50),
        Shadow = Color3.fromRGB(20, 15, 25),
        ElementBackground = Color3.fromRGB(45, 35, 55),
        ElementBackgroundHover = Color3.fromRGB(55, 45, 70),
        ElementStroke = Color3.fromRGB(80, 60, 100),
        SidebarBackground = Color3.fromRGB(35, 28, 45),
        NotificationActionsBackground = Color3.fromRGB(200, 180, 220),
        InputBackground = Color3.fromRGB(38, 30, 48),
        InputStroke = Color3.fromRGB(80, 60, 100),
        Accent = Color3.fromRGB(140, 100, 180),
        
        TabBackground = Color3.fromRGB(40, 32, 50),
        TabBackgroundSelected = Color3.fromRGB(140, 100, 180),
        TabTextColor = Color3.fromRGB(200, 190, 210),
        SelectedTabTextColor = Color3.fromRGB(255, 255, 255),
        TabStroke = Color3.fromRGB(80, 60, 100),
        
        ToggleBackground = Color3.fromRGB(38, 30, 48),
        ToggleEnabled = Color3.fromRGB(140, 100, 180),
        ToggleDisabled = Color3.fromRGB(55, 45, 65),
        ToggleEnabledStroke = Color3.fromRGB(160, 120, 200),
        ToggleDisabledStroke = Color3.fromRGB(70, 55, 85),
        ToggleEnabledOuterStroke = Color3.fromRGB(120, 85, 155),
        ToggleDisabledOuterStroke = Color3.fromRGB(50, 40, 60),
        
        SliderBackground = Color3.fromRGB(38, 30, 48),
        SliderStroke = Color3.fromRGB(80, 60, 100),
        SliderProgress = Color3.fromRGB(140, 100, 180),
        
        SecondaryElementBackground = Color3.fromRGB(38, 30, 48),
        SecondaryElementStroke = Color3.fromRGB(65, 50, 80)
    },
    Aqua = {
        TextFont = "Default",
        TextColor = Color3.fromRGB(240, 250, 255),
        Background = Color3.fromRGB(20, 30, 35),
        Topbar = Color3.fromRGB(25, 40, 50),
        Shadow = Color3.fromRGB(15, 22, 28),
        ElementBackground = Color3.fromRGB(30, 45, 55),
        ElementBackgroundHover = Color3.fromRGB(40, 60, 75),
        ElementStroke = Color3.fromRGB(50, 90, 120),
        SidebarBackground = Color3.fromRGB(22, 35, 42),
        NotificationActionsBackground = Color3.fromRGB(180, 220, 240),
        InputBackground = Color3.fromRGB(25, 38, 48),
        InputStroke = Color3.fromRGB(50, 90, 120),
        Accent = Color3.fromRGB(80, 180, 220),
        
        TabBackground = Color3.fromRGB(25, 40, 50),
        TabBackgroundSelected = Color3.fromRGB(80, 180, 220),
        TabTextColor = Color3.fromRGB(180, 210, 225),
        SelectedTabTextColor = Color3.fromRGB(255, 255, 255),
        TabStroke = Color3.fromRGB(50, 90, 120),
        
        ToggleBackground = Color3.fromRGB(25, 38, 48),
        ToggleEnabled = Color3.fromRGB(80, 180, 220),
        ToggleDisabled = Color3.fromRGB(40, 55, 65),
        ToggleEnabledStroke = Color3.fromRGB(100, 200, 235),
        ToggleDisabledStroke = Color3.fromRGB(50, 75, 90),
        ToggleEnabledOuterStroke = Color3.fromRGB(65, 150, 185),
        ToggleDisabledOuterStroke = Color3.fromRGB(35, 50, 60),
        
        SliderBackground = Color3.fromRGB(25, 38, 48),
        SliderStroke = Color3.fromRGB(50, 90, 120),
        SliderProgress = Color3.fromRGB(80, 180, 220),
        
        SecondaryElementBackground = Color3.fromRGB(25, 38, 48),
        SecondaryElementStroke = Color3.fromRGB(40, 70, 90)
    },
    Rose = {
        TextFont = "Default",
        TextColor = Color3.fromRGB(255, 245, 248),
        Background = Color3.fromRGB(35, 22, 28),
        Topbar = Color3.fromRGB(50, 30, 38),
        Shadow = Color3.fromRGB(25, 15, 20),
        ElementBackground = Color3.fromRGB(55, 35, 42),
        ElementBackgroundHover = Color3.fromRGB(75, 45, 55),
        ElementStroke = Color3.fromRGB(120, 60, 80),
        SidebarBackground = Color3.fromRGB(42, 26, 32),
        NotificationActionsBackground = Color3.fromRGB(255, 200, 215),
        InputBackground = Color3.fromRGB(48, 28, 36),
        InputStroke = Color3.fromRGB(120, 60, 80),
        Accent = Color3.fromRGB(220, 100, 140),
        
        TabBackground = Color3.fromRGB(50, 30, 38),
        TabBackgroundSelected = Color3.fromRGB(220, 100, 140),
        TabTextColor = Color3.fromRGB(225, 200, 210),
        SelectedTabTextColor = Color3.fromRGB(255, 255, 255),
        TabStroke = Color3.fromRGB(120, 60, 80),
        
        ToggleBackground = Color3.fromRGB(48, 28, 36),
        ToggleEnabled = Color3.fromRGB(220, 100, 140),
        ToggleDisabled = Color3.fromRGB(65, 40, 50),
        ToggleEnabledStroke = Color3.fromRGB(240, 120, 160),
        ToggleDisabledStroke = Color3.fromRGB(90, 55, 70),
        ToggleEnabledOuterStroke = Color3.fromRGB(185, 80, 115),
        ToggleDisabledOuterStroke = Color3.fromRGB(55, 35, 42),
        
        SliderBackground = Color3.fromRGB(48, 28, 36),
        SliderStroke = Color3.fromRGB(120, 60, 80),
        SliderProgress = Color3.fromRGB(220, 100, 140),
        
        SecondaryElementBackground = Color3.fromRGB(48, 28, 36),
        SecondaryElementStroke = Color3.fromRGB(90, 50, 65)
    },
    Emerald = {
        TextFont = "Default",
        TextColor = Color3.fromRGB(240, 255, 245),
        Background = Color3.fromRGB(20, 32, 25),
        Topbar = Color3.fromRGB(28, 45, 35),
        Shadow = Color3.fromRGB(15, 24, 18),
        ElementBackground = Color3.fromRGB(32, 52, 40),
        ElementBackgroundHover = Color3.fromRGB(42, 70, 52),
        ElementStroke = Color3.fromRGB(50, 100, 70),
        SidebarBackground = Color3.fromRGB(24, 38, 30),
        NotificationActionsBackground = Color3.fromRGB(180, 240, 200),
        InputBackground = Color3.fromRGB(28, 45, 35),
        InputStroke = Color3.fromRGB(50, 100, 70),
        Accent = Color3.fromRGB(80, 200, 120),
        
        TabBackground = Color3.fromRGB(28, 45, 35),
        TabBackgroundSelected = Color3.fromRGB(80, 200, 120),
        TabTextColor = Color3.fromRGB(200, 225, 210),
        SelectedTabTextColor = Color3.fromRGB(255, 255, 255),
        TabStroke = Color3.fromRGB(50, 100, 70),
        
        ToggleBackground = Color3.fromRGB(28, 45, 35),
        ToggleEnabled = Color3.fromRGB(80, 200, 120),
        ToggleDisabled = Color3.fromRGB(40, 60, 48),
        ToggleEnabledStroke = Color3.fromRGB(100, 220, 140),
        ToggleDisabledStroke = Color3.fromRGB(55, 85, 65),
        ToggleEnabledOuterStroke = Color3.fromRGB(65, 165, 100),
        ToggleDisabledOuterStroke = Color3.fromRGB(35, 55, 42),
        
        SliderBackground = Color3.fromRGB(28, 45, 35),
        SliderStroke = Color3.fromRGB(50, 100, 70),
        SliderProgress = Color3.fromRGB(80, 200, 120),
        
        SecondaryElementBackground = Color3.fromRGB(28, 45, 35),
        SecondaryElementStroke = Color3.fromRGB(42, 80, 55)
    },
    Ocean = {
        TextFont = "Default",
        TextColor = Color3.fromRGB(230, 245, 255),
        Background = Color3.fromRGB(15, 25, 40),
        Topbar = Color3.fromRGB(20, 35, 55),
        Shadow = Color3.fromRGB(10, 18, 30),
        ElementBackground = Color3.fromRGB(25, 42, 65),
        ElementBackgroundHover = Color3.fromRGB(35, 55, 85),
        ElementStroke = Color3.fromRGB(45, 80, 130),
        SidebarBackground = Color3.fromRGB(18, 30, 48),
        NotificationActionsBackground = Color3.fromRGB(170, 200, 240),
        InputBackground = Color3.fromRGB(22, 38, 58),
        InputStroke = Color3.fromRGB(45, 80, 130),
        Accent = Color3.fromRGB(70, 140, 220),
        
        TabBackground = Color3.fromRGB(20, 35, 55),
        TabBackgroundSelected = Color3.fromRGB(70, 140, 220),
        TabTextColor = Color3.fromRGB(180, 200, 230),
        SelectedTabTextColor = Color3.fromRGB(255, 255, 255),
        TabStroke = Color3.fromRGB(45, 80, 130),
        
        ToggleBackground = Color3.fromRGB(22, 38, 58),
        ToggleEnabled = Color3.fromRGB(70, 140, 220),
        ToggleDisabled = Color3.fromRGB(35, 50, 75),
        ToggleEnabledStroke = Color3.fromRGB(90, 160, 235),
        ToggleDisabledStroke = Color3.fromRGB(50, 70, 105),
        ToggleEnabledOuterStroke = Color3.fromRGB(55, 115, 185),
        ToggleDisabledOuterStroke = Color3.fromRGB(30, 45, 65),
        
        SliderBackground = Color3.fromRGB(22, 38, 58),
        SliderStroke = Color3.fromRGB(45, 80, 130),
        SliderProgress = Color3.fromRGB(70, 140, 220),
        
        SecondaryElementBackground = Color3.fromRGB(22, 38, 58),
        SecondaryElementStroke = Color3.fromRGB(38, 65, 105)
    },
    Sunset = {
        TextFont = "Default",
        TextColor = Color3.fromRGB(255, 250, 240),
        Background = Color3.fromRGB(35, 25, 20),
        Topbar = Color3.fromRGB(50, 35, 28),
        Shadow = Color3.fromRGB(28, 18, 14),
        ElementBackground = Color3.fromRGB(60, 42, 32),
        ElementBackgroundHover = Color3.fromRGB(80, 55, 40),
        ElementStroke = Color3.fromRGB(130, 80, 50),
        SidebarBackground = Color3.fromRGB(45, 32, 25),
        NotificationActionsBackground = Color3.fromRGB(255, 210, 180),
        InputBackground = Color3.fromRGB(52, 38, 28),
        InputStroke = Color3.fromRGB(130, 80, 50),
        Accent = Color3.fromRGB(240, 140, 80),
        
        TabBackground = Color3.fromRGB(50, 35, 28),
        TabBackgroundSelected = Color3.fromRGB(240, 140, 80),
        TabTextColor = Color3.fromRGB(225, 210, 195),
        SelectedTabTextColor = Color3.fromRGB(255, 255, 255),
        TabStroke = Color3.fromRGB(130, 80, 50),
        
        ToggleBackground = Color3.fromRGB(52, 38, 28),
        ToggleEnabled = Color3.fromRGB(240, 140, 80),
        ToggleDisabled = Color3.fromRGB(70, 50, 38),
        ToggleEnabledStroke = Color3.fromRGB(255, 160, 100),
        ToggleDisabledStroke = Color3.fromRGB(100, 70, 50),
        ToggleEnabledOuterStroke = Color3.fromRGB(200, 115, 65),
        ToggleDisabledOuterStroke = Color3.fromRGB(60, 42, 32),
        
        SliderBackground = Color3.fromRGB(52, 38, 28),
        SliderStroke = Color3.fromRGB(130, 80, 50),
        SliderProgress = Color3.fromRGB(240, 140, 80),
        
        SecondaryElementBackground = Color3.fromRGB(52, 38, 28),
        SecondaryElementStroke = Color3.fromRGB(100, 65, 42)
    },
    Midnight = {
        TextFont = "Default",
        TextColor = Color3.fromRGB(220, 225, 255),
        Background = Color3.fromRGB(18, 18, 28),
        Topbar = Color3.fromRGB(25, 25, 40),
        Shadow = Color3.fromRGB(12, 12, 20),
        ElementBackground = Color3.fromRGB(30, 30, 48),
        ElementBackgroundHover = Color3.fromRGB(40, 40, 65),
        ElementStroke = Color3.fromRGB(55, 55, 90),
        SidebarBackground = Color3.fromRGB(22, 22, 35),
        NotificationActionsBackground = Color3.fromRGB(190, 195, 230),
        InputBackground = Color3.fromRGB(26, 26, 42),
        InputStroke = Color3.fromRGB(55, 55, 90),
        Accent = Color3.fromRGB(100, 110, 200),
        
        TabBackground = Color3.fromRGB(25, 25, 40),
        TabBackgroundSelected = Color3.fromRGB(100, 110, 200),
        TabTextColor = Color3.fromRGB(190, 195, 220),
        SelectedTabTextColor = Color3.fromRGB(255, 255, 255),
        TabStroke = Color3.fromRGB(55, 55, 90),
        
        ToggleBackground = Color3.fromRGB(26, 26, 42),
        ToggleEnabled = Color3.fromRGB(100, 110, 200),
        ToggleDisabled = Color3.fromRGB(40, 40, 58),
        ToggleEnabledStroke = Color3.fromRGB(120, 130, 220),
        ToggleDisabledStroke = Color3.fromRGB(55, 55, 80),
        ToggleEnabledOuterStroke = Color3.fromRGB(80, 90, 165),
        ToggleDisabledOuterStroke = Color3.fromRGB(35, 35, 52),
        
        SliderBackground = Color3.fromRGB(26, 26, 42),
        SliderStroke = Color3.fromRGB(55, 55, 90),
        SliderProgress = Color3.fromRGB(100, 110, 200),
        
        SecondaryElementBackground = Color3.fromRGB(26, 26, 42),
        SecondaryElementStroke = Color3.fromRGB(45, 45, 72)
    },
    Light = {
        TextFont = "Default",
        TextColor = Color3.fromRGB(30, 30, 35),
        Background = Color3.fromRGB(245, 245, 250),
        Topbar = Color3.fromRGB(235, 235, 242),
        Shadow = Color3.fromRGB(200, 200, 210),
        ElementBackground = Color3.fromRGB(255, 255, 255),
        ElementBackgroundHover = Color3.fromRGB(240, 240, 248),
        ElementStroke = Color3.fromRGB(200, 200, 210),
        SidebarBackground = Color3.fromRGB(250, 250, 255),
        NotificationActionsBackground = Color3.fromRGB(60, 60, 70),
        InputBackground = Color3.fromRGB(250, 250, 255),
        InputStroke = Color3.fromRGB(200, 200, 210),
        Accent = Color3.fromRGB(80, 120, 200),
        
        TabBackground = Color3.fromRGB(240, 240, 248),
        TabBackgroundSelected = Color3.fromRGB(80, 120, 200),
        TabTextColor = Color3.fromRGB(80, 80, 90),
        SelectedTabTextColor = Color3.fromRGB(255, 255, 255),
        TabStroke = Color3.fromRGB(200, 200, 210),
        
        ToggleBackground = Color3.fromRGB(235, 235, 242),
        ToggleEnabled = Color3.fromRGB(80, 120, 200),
        ToggleDisabled = Color3.fromRGB(200, 200, 210),
        ToggleEnabledStroke = Color3.fromRGB(100, 140, 220),
        ToggleDisabledStroke = Color3.fromRGB(180, 180, 190),
        ToggleEnabledOuterStroke = Color3.fromRGB(65, 100, 170),
        ToggleDisabledOuterStroke = Color3.fromRGB(190, 190, 200),
        
        SliderBackground = Color3.fromRGB(235, 235, 242),
        SliderStroke = Color3.fromRGB(200, 200, 210),
        SliderProgress = Color3.fromRGB(80, 120, 200),
        
        SecondaryElementBackground = Color3.fromRGB(240, 240, 248),
        SecondaryElementStroke = Color3.fromRGB(210, 210, 220)
    }
}
}

local SelectedTheme = nil
local DeveloperSelectedTheme = nil
local CurrentThemeName = "ArrayField"
local Hidden = false
local Minimised = false
local Debounce = false
local SideBarClosed = true
local SearchHided = true
local SettingsOpen = false
local SettingsDropdownOpen = false
local dragOffset = 175
local NotificationDuration = 6.5

local UnhideKeybind = Enum.KeyCode.K
local CheckingForKey = false
local SETTINGS_FILE = "ArrayField_Settings.json"

local ConfigurationSettings = {
    Enabled = false,
    FolderName = nil,
    FileName = "ArrayField"
}

local OriginalColors = {}
local OriginalTransparencies = {}
local TweenCache = {}

local Icons = loadstring(game:HttpGet('https://raw.githubusercontent.com/SiriusSoftwareLtd/Rayfield/refs/heads/main/icons.lua'))()

local function getIcon(name)
    name = string.match(string.lower(name), "^%s*(.*)%s*$")
    local sizedicons = Icons['48px']
    local r = sizedicons[name]
    if not r then error("Lucide Icons: Failed to find icon by the name of \"" .. name .. "\".", 2) end
    local rirs, riro = r[2], r[3]
    if type(r[1]) ~= "number" or type(rirs) ~= "table" or type(riro) ~= "table" then
        error("Lucide Icons: Internal error: Invalid auto-generated asset entry")
    end
    return {
        id = r[1],
        imageRectSize = Vector2.new(rirs[1], rirs[2]),
        imageRectOffset = Vector2.new(riro[1], riro[2]),
    }
end

local ArrayField = game:GetObjects("rbxassetid://112500524684222")[1]
ArrayField.Name = "ArrayField"
ArrayField.Enabled = false
ArrayField.DisplayOrder = 100

pcall(function()
    if _G.ArrayFieldInstance then
        _G.ArrayFieldInstance:Destroy()
    end
end)
_G.ArrayFieldInstance = ArrayField

if game:GetService("RunService"):IsStudio() then
    function gethui() return ArrayField end
end

local function ParentUI(Gui)
    local success, failure = pcall(function()
        if get_hidden_gui or gethui then
            local hiddenUI = get_hidden_gui or gethui
            Gui.Parent = hiddenUI()
        elseif (not is_sirhurt_closure) and (syn and syn.protect_gui) then
            syn.protect_gui(Gui)
            Gui.Parent = CoreGui
        elseif CoreGui then
            Gui.Parent = CoreGui
        end
    end)
    if not success and failure then
        Gui.Parent = LocalPlayer:FindFirstChildWhichIsA("PlayerGui")
    end
end

ParentUI(ArrayField)

local Main = ArrayField.Main
local Topbar = Main.Topbar
local Elements = Main.Elements
local LoadingFrame = Main.LoadingFrame
local SideTabList = Main.SideTabList
local SideList = SideTabList.Holder
local TopList = Main.TabList
local TabsList = TopList and SideList
local SearchBar = Main.Searchbar
local Filler = SearchBar.CanvasGroup.Filler
local SettingsFrame = Main.Settings
local Notifications = ArrayField.Notifications
local Drag = ArrayField.Drag
local DragInteract = Drag.Interact
local DragCosmetic = Drag.Drag

local function StoreOriginalColors()
    pcall(function()
        OriginalColors.MainBackground = Main.BackgroundColor3
    end)
    pcall(function()
        OriginalColors.TopbarBackground = Topbar.BackgroundColor3
    end)
    pcall(function()
        OriginalColors.TopbarTitleText = Topbar.Title.TextColor3
    end)
    pcall(function()
        OriginalColors.TopbarDivider = Topbar.Divider.BackgroundColor3
    end)
    pcall(function()
        OriginalColors.TopbarCornerRepair = Topbar.CornerRepair.BackgroundColor3
    end)
    pcall(function()
        OriginalColors.ShadowImage = Main.Shadow.Image.ImageColor3
    end)
    pcall(function()
        OriginalColors.SideTabListBackground = SideTabList.BackgroundColor3
    end)
    pcall(function()
        OriginalColors.ElementsBackground = Elements.BackgroundColor3
    end)
    pcall(function()
        OriginalColors.SearchBarBackground = SearchBar.BackgroundColor3
    end)
    pcall(function()
        OriginalColors.SettingsFrameBackground = SettingsFrame.BackgroundColor3
    end)
    pcall(function()
        OriginalColors.DragCosmetic = DragCosmetic.BackgroundColor3
    end)
    pcall(function()
        OriginalColors.LoadingTitle = LoadingFrame.Title.TextColor3
    end)
    pcall(function()
        OriginalColors.LoadingSubtitle = LoadingFrame.Subtitle.TextColor3
    end)
    pcall(function()
        if SideTabList:FindFirstChild("UIStroke") then
            OriginalColors.SideTabListStroke = SideTabList.UIStroke.Color
        end
    end)
    pcall(function()
        if SideTabList:FindFirstChild("RDMT") then
            OriginalColors.SideTabListRDMT = SideTabList.RDMT.TextColor3
        end
    end)
    pcall(function()
        if SearchBar:FindFirstChild("UIStroke") then
            OriginalColors.SearchBarStroke = SearchBar.UIStroke.Color
        end
    end)
    pcall(function()
        if SearchBar:FindFirstChild("Input") then
            OriginalColors.SearchBarInputText = SearchBar.Input.TextColor3
            OriginalColors.SearchBarInputPlaceholder = SearchBar.Input.PlaceholderColor3
        end
    end)
    pcall(function()
        if SearchBar:FindFirstChild("Icon") then
            OriginalColors.SearchBarIcon = SearchBar.Icon.ImageColor3
        end
    end)
    pcall(function()
        if SearchBar:FindFirstChild("Clear") then
            OriginalColors.SearchBarClear = SearchBar.Clear.ImageColor3
        end
    end)
    pcall(function()
        if SearchBar:FindFirstChild("Filter") then
            OriginalColors.SearchBarFilter = SearchBar.Filter.ImageColor3
        end
    end)
    pcall(function()
        if SettingsFrame:FindFirstChild("UIStroke") then
            OriginalColors.SettingsFrameStroke = SettingsFrame.UIStroke.Color
        end
    end)
    pcall(function()
        if LoadingFrame:FindFirstChild("Version") then
            OriginalColors.LoadingVersion = LoadingFrame.Version.TextColor3
        end
    end)
    
    OriginalColors.TopbarButtons = {}
    pcall(function()
        for _, btn in ipairs(Topbar:GetChildren()) do
            if btn:IsA("ImageButton") then
                OriginalColors.TopbarButtons[btn.Name] = btn.ImageColor3
            end
        end
    end)
    
    OriginalColors.SideListItems = {}
    pcall(function()
        for _, tabbtn in pairs(SideList:GetChildren()) do
            if tabbtn.ClassName == "Frame" and tabbtn.Name ~= "Placeholder" then
                OriginalColors.SideListItems[tabbtn.Name] = {}
                if tabbtn:FindFirstChild("Title") then
                    OriginalColors.SideListItems[tabbtn.Name].Title = tabbtn.Title.TextColor3
                end
                if tabbtn:FindFirstChild("Image") then
                    OriginalColors.SideListItems[tabbtn.Name].Image = tabbtn.Image.ImageColor3
                end
            end
        end
    end)
    
    OriginalColors.TopListItems = {}
    pcall(function()
        for _, tabbtn in ipairs(TopList:GetChildren()) do
            if tabbtn.ClassName == "Frame" and tabbtn.Name ~= "Placeholder" then
                OriginalColors.TopListItems[tabbtn.Name] = {}
                if tabbtn:FindFirstChild("Title") then
                    OriginalColors.TopListItems[tabbtn.Name].Title = tabbtn.Title.TextColor3
                end
                if tabbtn:FindFirstChild("Image") then
                    OriginalColors.TopListItems[tabbtn.Name].Image = tabbtn.Image.ImageColor3
                end
                if tabbtn:FindFirstChild("UIStroke") then
                    OriginalColors.TopListItems[tabbtn.Name].Stroke = tabbtn.UIStroke.Color
                end
            end
        end
    end)
    pcall(function()
    if Elements and Elements.Template and Elements.Template:FindFirstChild("Button") then
        OriginalColors.ButtonBackground = Elements.Template.Button.BackgroundColor3
    end
end)
    pcall(function()
        local Frame = SettingsFrame:FindFirstChild("Frame")
        if Frame then
            OriginalColors.SettingsElements = {}
            for _, child in ipairs(Frame:GetChildren()) do
                if child:IsA("TextLabel") then
                    OriginalColors.SettingsElements[child.Name] = child.TextColor3
                end
            end
            
            local Keybind = Frame:FindFirstChild("Keybind")
            if Keybind then
                OriginalColors.KeybindBackground = Keybind.BackgroundColor3
                if Keybind:FindFirstChild("Title") then
                    OriginalColors.KeybindTitle = Keybind.Title.TextColor3
                end
                if Keybind:FindFirstChild("UIStroke") then
                    OriginalColors.KeybindStroke = Keybind.UIStroke.Color
                end
                local KeybindFrame = Keybind:FindFirstChild("KeybindFrame")
                if KeybindFrame then
                    OriginalColors.KeybindFrameBackground = KeybindFrame.BackgroundColor3
                    if KeybindFrame:FindFirstChild("UIStroke") then
                        OriginalColors.KeybindFrameStroke = KeybindFrame.UIStroke.Color
                    end
                    if KeybindFrame:FindFirstChild("KeybindBox") then
                        OriginalColors.KeybindBoxText = KeybindFrame.KeybindBox.TextColor3
                    end
                end
            end
            
            local Dropdown = Frame:FindFirstChild("Dropdown")
            if Dropdown then
                OriginalColors.DropdownBackground = Dropdown.BackgroundColor3
                if Dropdown:FindFirstChild("Title") then
                    OriginalColors.DropdownTitle = Dropdown.Title.TextColor3
                end
                if Dropdown:FindFirstChild("Selected") then
                    OriginalColors.DropdownSelected = Dropdown.Selected.TextColor3
                end
                if Dropdown:FindFirstChild("Toggle") then
                    OriginalColors.DropdownToggle = Dropdown.Toggle.ImageColor3
                end
                if Dropdown:FindFirstChild("UIStroke") then
                    OriginalColors.DropdownStroke = Dropdown.UIStroke.Color
                end
                if Dropdown:FindFirstChild("List") then
                    OriginalColors.DropdownListBackground = Dropdown.List.BackgroundColor3
                    OriginalColors.DropdownListScrollBar = Dropdown.List.ScrollBarImageColor3
                end
            end
        end
    end)
end

local function RestoreOriginalColors()
    pcall(function()
        if OriginalColors.MainBackground then
            Main.BackgroundColor3 = OriginalColors.MainBackground
        end
    end)
    pcall(function()
        if OriginalColors.TopbarBackground then
            Topbar.BackgroundColor3 = OriginalColors.TopbarBackground
        end
    end)
    pcall(function()
        if OriginalColors.TopbarTitleText then
            Topbar.Title.TextColor3 = OriginalColors.TopbarTitleText
        end
    end)
    pcall(function()
        if OriginalColors.TopbarDivider then
            Topbar.Divider.BackgroundColor3 = OriginalColors.TopbarDivider
        end
    end)
    pcall(function()
        if OriginalColors.TopbarCornerRepair then
            Topbar.CornerRepair.BackgroundColor3 = OriginalColors.TopbarCornerRepair
        end
    end)
    pcall(function()
        if OriginalColors.ShadowImage then
            Main.Shadow.Image.ImageColor3 = OriginalColors.ShadowImage
        end
    end)
    pcall(function()
        if OriginalColors.SideTabListBackground then
            SideTabList.BackgroundColor3 = OriginalColors.SideTabListBackground
        end
    end)
    pcall(function()
        if OriginalColors.ElementsBackground then
            Elements.BackgroundColor3 = OriginalColors.ElementsBackground
        end
    end)
    pcall(function()
        if OriginalColors.SearchBarBackground then
            SearchBar.BackgroundColor3 = OriginalColors.SearchBarBackground
        end
    end)
    pcall(function()
        if OriginalColors.SettingsFrameBackground then
            SettingsFrame.BackgroundColor3 = OriginalColors.SettingsFrameBackground
        end
    end)
    pcall(function()
        if OriginalColors.DragCosmetic then
            DragCosmetic.BackgroundColor3 = OriginalColors.DragCosmetic
        end
    end)
    pcall(function()
        if OriginalColors.LoadingTitle then
            LoadingFrame.Title.TextColor3 = OriginalColors.LoadingTitle
        end
    end)
    pcall(function()
        if OriginalColors.LoadingSubtitle then
            LoadingFrame.Subtitle.TextColor3 = OriginalColors.LoadingSubtitle
        end
    end)
    pcall(function()
        if SideTabList:FindFirstChild("UIStroke") and OriginalColors.SideTabListStroke then
            SideTabList.UIStroke.Color = OriginalColors.SideTabListStroke
        end
    end)
    pcall(function()
        if SideTabList:FindFirstChild("RDMT") and OriginalColors.SideTabListRDMT then
            SideTabList.RDMT.TextColor3 = OriginalColors.SideTabListRDMT
        end
    end)
    pcall(function()
        if SearchBar:FindFirstChild("UIStroke") and OriginalColors.SearchBarStroke then
            SearchBar.UIStroke.Color = OriginalColors.SearchBarStroke
        end
    end)
    pcall(function()
        if SearchBar:FindFirstChild("Input") then
            if OriginalColors.SearchBarInputText then
                SearchBar.Input.TextColor3 = OriginalColors.SearchBarInputText
            end
            if OriginalColors.SearchBarInputPlaceholder then
                SearchBar.Input.PlaceholderColor3 = OriginalColors.SearchBarInputPlaceholder
            end
        end
    end)
    pcall(function()
        if SearchBar:FindFirstChild("Icon") and OriginalColors.SearchBarIcon then
            SearchBar.Icon.ImageColor3 = OriginalColors.SearchBarIcon
        end
    end)
    pcall(function()
        if SearchBar:FindFirstChild("Clear") and OriginalColors.SearchBarClear then
            SearchBar.Clear.ImageColor3 = OriginalColors.SearchBarClear
        end
    end)
    pcall(function()
        if SearchBar:FindFirstChild("Filter") and OriginalColors.SearchBarFilter then
            SearchBar.Filter.ImageColor3 = OriginalColors.SearchBarFilter
        end
    end)
    pcall(function()
        if SettingsFrame:FindFirstChild("UIStroke") and OriginalColors.SettingsFrameStroke then
            SettingsFrame.UIStroke.Color = OriginalColors.SettingsFrameStroke
        end
    end)
    pcall(function()
        if LoadingFrame:FindFirstChild("Version") and OriginalColors.LoadingVersion then
            LoadingFrame.Version.TextColor3 = OriginalColors.LoadingVersion
        end
    end)
    pcall(function()
        for _, btn in ipairs(Topbar:GetChildren()) do
            if btn:IsA("ImageButton") and OriginalColors.TopbarButtons and OriginalColors.TopbarButtons[btn.Name] then
                btn.ImageColor3 = OriginalColors.TopbarButtons[btn.Name]
            end
        end
    end)
    pcall(function()
        for _, tabbtn in pairs(SideList:GetChildren()) do
            if tabbtn.ClassName == "Frame" and tabbtn.Name ~= "Placeholder" then
                local stored = OriginalColors.SideListItems and OriginalColors.SideListItems[tabbtn.Name]
                if stored then
                    if tabbtn:FindFirstChild("Title") and stored.Title then
                        tabbtn.Title.TextColor3 = stored.Title
                    end
                    if tabbtn:FindFirstChild("Image") and stored.Image then
                        tabbtn.Image.ImageColor3 = stored.Image
                    end
                end
            end
        end
    end)
    pcall(function()
        for _, tabbtn in ipairs(TopList:GetChildren()) do
            if tabbtn.ClassName == "Frame" and tabbtn.Name ~= "Placeholder" then
                local stored = OriginalColors.TopListItems and OriginalColors.TopListItems[tabbtn.Name]
                if stored then
                    if tabbtn:FindFirstChild("Title") and stored.Title then
                        tabbtn.Title.TextColor3 = stored.Title
                    end
                    if tabbtn:FindFirstChild("Image") and stored.Image then
                        tabbtn.Image.ImageColor3 = stored.Image
                    end
                    if tabbtn:FindFirstChild("UIStroke") and stored.Stroke then
                        tabbtn.UIStroke.Color = stored.Stroke
                    end
                end
            end
        end
    end)
    pcall(function()
        local Frame = SettingsFrame:FindFirstChild("Frame")
        if Frame then
            if OriginalColors.SettingsElements then
                for _, child in ipairs(Frame:GetChildren()) do
                    if child:IsA("TextLabel") and OriginalColors.SettingsElements[child.Name] then
                        child.TextColor3 = OriginalColors.SettingsElements[child.Name]
                    end
                end
            end
            
            local Keybind = Frame:FindFirstChild("Keybind")
            if Keybind then
                if OriginalColors.KeybindBackground then
                    Keybind.BackgroundColor3 = OriginalColors.KeybindBackground
                end
                if Keybind:FindFirstChild("Title") and OriginalColors.KeybindTitle then
                    Keybind.Title.TextColor3 = OriginalColors.KeybindTitle
                end
                if Keybind:FindFirstChild("UIStroke") and OriginalColors.KeybindStroke then
                    Keybind.UIStroke.Color = OriginalColors.KeybindStroke
                end
                local KeybindFrame = Keybind:FindFirstChild("KeybindFrame")
                if KeybindFrame then
                    if OriginalColors.KeybindFrameBackground then
                        KeybindFrame.BackgroundColor3 = OriginalColors.KeybindFrameBackground
                    end
                    if KeybindFrame:FindFirstChild("UIStroke") and OriginalColors.KeybindFrameStroke then
                        KeybindFrame.UIStroke.Color = OriginalColors.KeybindFrameStroke
                    end
                    if KeybindFrame:FindFirstChild("KeybindBox") and OriginalColors.KeybindBoxText then
                        KeybindFrame.KeybindBox.TextColor3 = OriginalColors.KeybindBoxText
                    end
                end
            end
            
            local Dropdown = Frame:FindFirstChild("Dropdown")
            if Dropdown then
                if OriginalColors.DropdownBackground then
                    Dropdown.BackgroundColor3 = OriginalColors.DropdownBackground
                end
                if Dropdown:FindFirstChild("Title") and OriginalColors.DropdownTitle then
                    Dropdown.Title.TextColor3 = OriginalColors.DropdownTitle
                end
                if Dropdown:FindFirstChild("Selected") and OriginalColors.DropdownSelected then
                    Dropdown.Selected.TextColor3 = OriginalColors.DropdownSelected
                end
                if Dropdown:FindFirstChild("Toggle") and OriginalColors.DropdownToggle then
                    Dropdown.Toggle.ImageColor3 = OriginalColors.DropdownToggle
                end
                if Dropdown:FindFirstChild("UIStroke") and OriginalColors.DropdownStroke then
                    Dropdown.UIStroke.Color = OriginalColors.DropdownStroke
                end
                if Dropdown:FindFirstChild("List") then
                    if OriginalColors.DropdownListBackground then
                        Dropdown.List.BackgroundColor3 = OriginalColors.DropdownListBackground
                    end
                    if OriginalColors.DropdownListScrollBar then
                        Dropdown.List.ScrollBarImageColor3 = OriginalColors.DropdownListScrollBar
                    end
                end
            end
        end
    end)
end

StoreOriginalColors()

local function GetConfigPath()
    if ConfigurationSettings.FolderName then
        return ConfigurationSettings.FolderName .. "/" .. ConfigurationSettings.FileName .. ".json"
    else
        return ConfigurationSettings.FileName .. ".json"
    end
end

local function EnsureConfigFolder()
    if not ConfigurationSettings.FolderName then return end
    if not isfolder then return end
    
    pcall(function()
        if not isfolder(ConfigurationSettings.FolderName) then
            makefolder(ConfigurationSettings.FolderName)
        end
    end)
end

local function SaveConfiguration()
    if not ConfigurationSettings.Enabled then return end
    if not writefile then return end
    
    EnsureConfigFolder()
    
    local configData = {}
    
    for flag, data in pairs(ArrayFieldLibrary.Flags) do
        if data.Type == "Toggle" then
            configData[flag] = {Type = "Toggle", Value = data.CurrentValue}
        elseif data.Type == "Slider" then
            configData[flag] = {Type = "Slider", Value = data.CurrentValue}
        elseif data.Type == "Dropdown" then
            configData[flag] = {Type = "Dropdown", Value = data.CurrentOption}
        elseif data.Type == "Keybind" then
            configData[flag] = {Type = "Keybind", Value = data.CurrentKeybind}
        elseif data.Type == "Input" then
            configData[flag] = {Type = "Input", Value = data.CurrentValue}
        elseif data.Type == "ColorPicker" then
            local color = data.CurrentColor
            configData[flag] = {Type = "ColorPicker", Value = {R = color.R, G = color.G, B = color.B}}
        end
    end
    
    local success, encoded = pcall(function()
        return HttpService:JSONEncode(configData)
    end)
    
    if success then
        pcall(function()
            writefile(GetConfigPath(), encoded)
        end)
    end
end

local function LoadConfiguration()
    if not ConfigurationSettings.Enabled then return end
    if not isfile or not readfile then return end
    
    local path = GetConfigPath()
    
    local success, exists = pcall(function()
        return isfile(path)
    end)
    
    if not success or not exists then return end
    
    local readSuccess, content = pcall(function()
        return readfile(path)
    end)
    
    if not readSuccess or not content then return end
    
    local decodeSuccess, configData = pcall(function()
        return HttpService:JSONDecode(content)
    end)
    
    if not decodeSuccess or type(configData) ~= "table" then return end
    
    for flag, data in pairs(configData) do
        if ArrayFieldLibrary.Flags[flag] then
            local flagData = ArrayFieldLibrary.Flags[flag]
            
            if data.Type == "Toggle" and flagData.Set then
                pcall(function() flagData:Set(data.Value) end)
            elseif data.Type == "Slider" and flagData.Set then
                pcall(function() flagData:Set(data.Value) end)
            elseif data.Type == "Dropdown" and flagData.Set then
                pcall(function() flagData:Set(data.Value) end)
            elseif data.Type == "Keybind" and flagData.Set then
                pcall(function() flagData:Set(data.Value) end)
            elseif data.Type == "Input" and flagData.Set then
                pcall(function() flagData:Set(data.Value) end)
            elseif data.Type == "ColorPicker" and flagData.Set then
                pcall(function() 
                    flagData:Set(Color3.new(data.Value.R, data.Value.G, data.Value.B)) 
                end)
            end
        end
    end
end

ArrayFieldLibrary.SaveConfiguration = SaveConfiguration
ArrayFieldLibrary.LoadConfiguration = LoadConfiguration

local function SaveSettings()
    if not writefile then return end
    local success, encoded = pcall(function()
        return HttpService:JSONEncode({
            UnhideKeybind = UnhideKeybind.Name,
            Theme = CurrentThemeName
        })
    end)
    if success then
        pcall(function()
            writefile(SETTINGS_FILE, encoded)
        end)
    end
end

local function LoadSettings()
    if not isfile or not readfile then return end
    
    local success, exists = pcall(function()
        return isfile(SETTINGS_FILE)
    end)
    
    if not success or not exists then return end
    
    local readSuccess, content = pcall(function()
        return readfile(SETTINGS_FILE)
    end)
    
    if not readSuccess or not content then return end
    
    local decodeSuccess, data = pcall(function()
        return HttpService:JSONDecode(content)
    end)
    
    if decodeSuccess and type(data) == "table" then
        if data.UnhideKeybind then
            local keySuccess, keyCode = pcall(function()
                return Enum.KeyCode[data.UnhideKeybind]
            end)
            if keySuccess and keyCode then
                UnhideKeybind = keyCode
            end
        end
        if data.Theme then
            CurrentThemeName = data.Theme
            if data.Theme ~= "ArrayField" and data.Theme ~= "Developer Selected" and ArrayFieldLibrary.Theme[data.Theme] then
                SelectedTheme = ArrayFieldLibrary.Theme[data.Theme]
            end
        end
    end
end

LoadSettings()

local function Tween(obj, time, props)
    if not obj or not obj.Parent then return end
    
    if TweenCache[obj] then
        TweenCache[obj]:Cancel()
    end
    
    local tween = TweenService:Create(obj, TweenInfo.new(time, Enum.EasingStyle.Quint), props)
    TweenCache[obj] = tween
    tween:Play()
    
    task.spawn(function()
        tween.Completed:Wait()
        if TweenCache[obj] == tween then
            TweenCache[obj] = nil
        end
    end)
end

local function ApplyToDescendants(parent, filter, callback)
    for _, descendant in ipairs(parent:GetDescendants()) do
        if type(filter) == "table" then
            for _, className in ipairs(filter) do
                if descendant:IsA(className) then
                    callback(descendant)
                    break
                end
            end
        elseif type(filter) == "string" then
            if descendant:IsA(filter) then
                callback(descendant)
            end
        elseif filter == nil then
            callback(descendant)
        end
    end
end

local function SetZIndex(parent, zindex)
    if parent:IsA("GuiObject") then
        parent.ZIndex = zindex
    end
    ApplyToDescendants(parent, "GuiObject", function(obj)
        obj.ZIndex = zindex
    end)
end

local function StoreOriginalTransparencies(parent)
    if OriginalTransparencies[parent] then
        return OriginalTransparencies[parent]
    end
    
    local stored = {}
    for _, obj in ipairs(parent:GetDescendants()) do
        local data = {}
        if obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("TextBox") then
            data.TextTransparency = obj.TextTransparency
            data.BackgroundTransparency = obj.BackgroundTransparency
        elseif obj:IsA("ImageLabel") or obj:IsA("ImageButton") then
            data.ImageTransparency = obj.ImageTransparency
            data.BackgroundTransparency = obj.BackgroundTransparency
        elseif obj:IsA("Frame") or obj:IsA("ScrollingFrame") then
            data.BackgroundTransparency = obj.BackgroundTransparency
        elseif obj:IsA("UIStroke") then
            data.Transparency = obj.Transparency
        end
        if next(data) then
            stored[obj] = data
        end
    end
    OriginalTransparencies[parent] = stored
    return stored
end

local function FadeOut(parent, duration, excludeNames)
    excludeNames = excludeNames or {}
    local excludeSet = {}
    for _, name in ipairs(excludeNames) do
        excludeSet[name] = true
    end
    
    for _, obj in ipairs(parent:GetDescendants()) do
        if excludeSet[obj.Name] then continue end
        
        local props = {}
        
        if obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("TextBox") then
            props.TextTransparency = 1
            props.BackgroundTransparency = 1
        elseif obj:IsA("ImageLabel") or obj:IsA("ImageButton") then
            props.ImageTransparency = 1
            props.BackgroundTransparency = 1
        elseif obj:IsA("Frame") or obj:IsA("ScrollingFrame") then
            props.BackgroundTransparency = 1
        elseif obj:IsA("UIStroke") then
            props.Transparency = 1
        end
        
        if next(props) then
            if duration == 0 then
                for prop, value in pairs(props) do
                    pcall(function() obj[prop] = value end)
                end
            else
                Tween(obj, duration, props)
            end
        end
    end
end

local function FadeIn(parent, duration, excludeNames)
    local stored = OriginalTransparencies[parent]
    if not stored then
        return
    end
    
    excludeNames = excludeNames or {}
    local excludeSet = {}
    for _, name in ipairs(excludeNames) do
        excludeSet[name] = true
    end
    
    for obj, data in pairs(stored) do
        if not obj or not obj.Parent then continue end
        if excludeSet[obj.Name] then continue end
        
        if duration == 0 then
            for prop, value in pairs(data) do
                pcall(function() obj[prop] = value end)
            end
        else
            Tween(obj, duration, data)
        end
    end
end

local function SetAllTransparent(parent)
    for _, obj in ipairs(parent:GetDescendants()) do
        if obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("TextBox") then
            obj.TextTransparency = 1
            obj.BackgroundTransparency = 1
        elseif obj:IsA("ImageLabel") or obj:IsA("ImageButton") then
            obj.ImageTransparency = 1
            obj.BackgroundTransparency = 1
        elseif obj:IsA("Frame") or obj:IsA("ScrollingFrame") then
            obj.BackgroundTransparency = 1
        elseif obj:IsA("UIStroke") then
            obj.Transparency = 1
        end
    end
end

local function ApplyTheme()
    if not SelectedTheme then return end
    
    Main.BackgroundColor3 = SelectedTheme.Background
    Topbar.BackgroundColor3 = SelectedTheme.Topbar
    
    if Topbar:FindFirstChild("Title") then
        Topbar.Title.TextColor3 = SelectedTheme.TextColor
    end
    
    if Topbar:FindFirstChild("Divider") then
        Topbar.Divider.BackgroundColor3 = SelectedTheme.ElementStroke
    end
    
    if Topbar:FindFirstChild("CornerRepair") then
        Topbar.CornerRepair.BackgroundColor3 = SelectedTheme.Topbar
    end
    
    if Main:FindFirstChild("Shadow") and Main.Shadow:FindFirstChild("Image") then
        Main.Shadow.Image.ImageColor3 = SelectedTheme.Shadow
    end
    
    SideTabList.BackgroundColor3 = SelectedTheme.SidebarBackground
    if SideTabList:FindFirstChild("UIStroke") then
        SideTabList.UIStroke.Color = SelectedTheme.ElementStroke
    end
    if SideTabList:FindFirstChild("RDMT") then
        SideTabList.RDMT.TextColor3 = SelectedTheme.TextColor
    end
    
    for _, tabbtn in pairs(SideList:GetChildren()) do
        if tabbtn.ClassName == "Frame" and tabbtn.Name ~= "Placeholder" then
            if tabbtn:FindFirstChild("Title") then
                tabbtn.Title.TextColor3 = SelectedTheme.TextColor
            end
            if tabbtn:FindFirstChild("Image") then
                tabbtn.Image.ImageColor3 = SelectedTheme.TextColor
            end
        end
    end
    
    Elements.BackgroundColor3 = SelectedTheme.Background
    
    SearchBar.BackgroundColor3 = SelectedTheme.ElementBackground
    if SearchBar:FindFirstChild("UIStroke") then
        SearchBar.UIStroke.Color = SelectedTheme.ElementStroke
    end
    if SearchBar:FindFirstChild("Input") then
        SearchBar.Input.TextColor3 = SelectedTheme.TextColor
        SearchBar.Input.PlaceholderColor3 = Color3.new(
            SelectedTheme.TextColor.R * 0.5,
            SelectedTheme.TextColor.G * 0.5,
            SelectedTheme.TextColor.B * 0.5
        )
    end
    if SearchBar:FindFirstChild("Icon") then
        SearchBar.Icon.ImageColor3 = SelectedTheme.TextColor
    end
    if SearchBar:FindFirstChild("Clear") then
        SearchBar.Clear.ImageColor3 = SelectedTheme.TextColor
    end
    if SearchBar:FindFirstChild("Filter") then
        SearchBar.Filter.ImageColor3 = SelectedTheme.TextColor
    end
    
    SettingsFrame.BackgroundColor3 = SelectedTheme.ElementBackground
    if SettingsFrame:FindFirstChild("UIStroke") then
        SettingsFrame.UIStroke.Color = SelectedTheme.ElementStroke
    end
    
    local Frame = SettingsFrame:FindFirstChild("Frame")
    if Frame then
        for _, child in ipairs(Frame:GetChildren()) do
            if child:IsA("TextLabel") then
                child.TextColor3 = SelectedTheme.TextColor
            end
        end
        
        local Keybind = Frame:FindFirstChild("Keybind")
        if Keybind then
            Keybind.BackgroundColor3 = SelectedTheme.ElementBackground
            if Keybind:FindFirstChild("Title") then
                Keybind.Title.TextColor3 = SelectedTheme.TextColor
            end
            if Keybind:FindFirstChild("UIStroke") then
                Keybind.UIStroke.Color = SelectedTheme.ElementStroke
            end
            local KeybindFrame = Keybind:FindFirstChild("KeybindFrame")
            if KeybindFrame then
                KeybindFrame.BackgroundColor3 = SelectedTheme.InputBackground
                if KeybindFrame:FindFirstChild("UIStroke") then
                    KeybindFrame.UIStroke.Color = SelectedTheme.InputStroke
                end
                if KeybindFrame:FindFirstChild("KeybindBox") then
                    KeybindFrame.KeybindBox.TextColor3 = SelectedTheme.TextColor
                end
            end
        end
        
        local Dropdown = Frame:FindFirstChild("Dropdown")
        if Dropdown then
            Dropdown.BackgroundColor3 = SelectedTheme.ElementBackground
            if Dropdown:FindFirstChild("Title") then
                Dropdown.Title.TextColor3 = SelectedTheme.TextColor
            end
            if Dropdown:FindFirstChild("Selected") then
                Dropdown.Selected.TextColor3 = SelectedTheme.TextColor
            end
            if Dropdown:FindFirstChild("Toggle") then
                Dropdown.Toggle.ImageColor3 = SelectedTheme.TextColor
            end
            if Dropdown:FindFirstChild("UIStroke") then
                Dropdown.UIStroke.Color = SelectedTheme.ElementStroke
            end
            if Dropdown:FindFirstChild("List") then
                Dropdown.List.BackgroundColor3 = SelectedTheme.ElementBackground
                Dropdown.List.ScrollBarImageColor3 = SelectedTheme.TextColor
                for _, opt in ipairs(Dropdown.List:GetChildren()) do
                    if opt:IsA("Frame") and opt.Name ~= "Template" and opt.Name ~= "PlaceHolder" then
                        opt.BackgroundColor3 = SelectedTheme.ElementBackground
                        if opt:FindFirstChild("Title") then
                            opt.Title.TextColor3 = SelectedTheme.TextColor
                        end
                        if opt:FindFirstChild("UIStroke") then
                            opt.UIStroke.Color = SelectedTheme.ElementStroke
                        end
                    end
                end
            end
        end
    end
    
    for _, btn in ipairs(Topbar:GetChildren()) do
        if btn:IsA("ImageButton") then
            btn.ImageColor3 = SelectedTheme.TextColor
        end
    end
    
    DragCosmetic.BackgroundColor3 = SelectedTheme.TextColor
    
    for _, TabButton in ipairs(TopList:GetChildren()) do
        if TabButton.ClassName == "Frame" and TabButton.Name ~= "Placeholder" then
            if TabButton:FindFirstChild("Title") then
                TabButton.Title.TextColor3 = SelectedTheme.TextColor
            end
            if TabButton:FindFirstChild("Image") then
                TabButton.Image.ImageColor3 = SelectedTheme.TextColor
            end
            if TabButton:FindFirstChild("UIStroke") then
                TabButton.UIStroke.Color = SelectedTheme.ElementStroke
            end
        end
    end
    
    LoadingFrame.Title.TextColor3 = SelectedTheme.TextColor
    LoadingFrame.Subtitle.TextColor3 = SelectedTheme.TextColor
    if LoadingFrame:FindFirstChild("Version") then
        LoadingFrame.Version.TextColor3 = SelectedTheme.TextColor
    end
end

local function AddDraggingFunctionality(DragPoint, MainFrame)
    pcall(function()
        local Dragging = false
        local StartPos
        local FramePos

        DragPoint.InputBegan:Connect(function(Input)
            if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
                Dragging = true
                StartPos = Input.Position
                FramePos = MainFrame.Position

                local InputDoneConnection
                InputDoneConnection = UserInputService.InputEnded:Connect(function(EndInput)
                    if EndInput.UserInputType == Input.UserInputType then
                        Dragging = false
                        InputDoneConnection:Disconnect()
                    end
                end)
            end
        end)
        
        UserInputService.InputChanged:Connect(function(Input)
            if Dragging and (Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch) then
                local Delta = Input.Position - StartPos
                
                Tween(MainFrame, 0.45, {Position = UDim2.new(FramePos.X.Scale, FramePos.X.Offset + Delta.X, FramePos.Y.Scale, FramePos.Y.Offset + Delta.Y)})
                Tween(Drag, 0.45, {Position = UDim2.new(FramePos.X.Scale, FramePos.X.Offset + Delta.X, FramePos.Y.Scale, FramePos.Y.Offset + Delta.Y + dragOffset)})
            end
        end)
    end)
end

local function SetupDragBar()
    local dragging = false
    local relative = nil
    
    local offset = Vector2.zero
    local screenGui = Main:FindFirstAncestorWhichIsA("ScreenGui")
    if screenGui and screenGui.IgnoreGuiInset then
        offset = offset + GuiService:GetGuiInset()
    end

    Drag.MouseEnter:Connect(function()
        if not dragging and not Hidden then
            Tween(DragCosmetic, 0.25, {BackgroundTransparency = 0.2, Size = UDim2.new(0, 267, 0, 4)})
        end
    end)
    
    Drag.MouseLeave:Connect(function()
        if not dragging and not Hidden then
            Tween(DragCosmetic, 0.25, {BackgroundTransparency = 0.4, Size = UDim2.new(0, 247, 0, 4)})
        end
    end)
    
    DragInteract.InputBegan:Connect(function(input, processed)
        if processed then return end
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            relative = Main.AbsolutePosition + Main.AbsoluteSize * Main.AnchorPoint - UserInputService:GetMouseLocation()
            Tween(DragCosmetic, 0.35, {Size = UDim2.new(0, 257, 0, 4), BackgroundTransparency = 0})
        end
    end)

    UserInputService.InputEnded:Connect(function(input)
        if not dragging then return end
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
            Tween(DragCosmetic, 0.35, {Size = UDim2.new(0, 247, 0, 4), BackgroundTransparency = 0.4})
        end
    end)

    RunService.RenderStepped:Connect(function()
        if dragging and not Hidden then
            local position = UserInputService:GetMouseLocation() + relative + offset
            Tween(Main, 0.4, {Position = UDim2.fromOffset(position.X, position.Y)})
            Tween(Drag, 0.05, {Position = UDim2.fromOffset(position.X, position.Y + dragOffset)})
        end
    end)
end

local function CloseSettingsDropdown()
    local Frame = SettingsFrame:FindFirstChild("Frame")
    if not Frame then return end
    
    local Dropdown = Frame:FindFirstChild("Dropdown")
    if not Dropdown then return end
    
    local List = Dropdown:FindFirstChild("List")
    if not List then return end
    
    local Toggle = Dropdown:FindFirstChild("Toggle")
    
    if not SettingsDropdownOpen then return end
    
    Dropdown.Size = UDim2.new(0, 220, 0, 40)
    SettingsFrame.Size = UDim2.new(0, 240, 0, 130)
    
    for _, opt in ipairs(List:GetChildren()) do
        if opt:IsA("Frame") and opt.Name ~= "Template" and opt.Name ~= "PlaceHolder" then
            opt.BackgroundTransparency = 1
            if opt:FindFirstChild("UIStroke") then
                opt.UIStroke.Transparency = 1
            end
            if opt:FindFirstChild("Title") then
                opt.Title.TextTransparency = 1
            end
        end
    end
    
    List.ScrollBarImageTransparency = 1
    if Toggle then
        Toggle.Rotation = 180
    end
    
    List.Visible = false
    SettingsDropdownOpen = false
end

function OpenSideBar(fast)
    Debounce = true
    SideTabList.Visible = true
    Tween(SideTabList, 0.4, {BackgroundTransparency = 0.03})
    if SideTabList:FindFirstChild("UIStroke") then
        Tween(SideTabList.UIStroke, 0.4, {Transparency = 0})
    end
    if SideTabList:FindFirstChild("RDMT") then
        Tween(SideTabList.RDMT, 0.4, {TextTransparency = 0})
    end
    for _, tabbtn in pairs(SideList:GetChildren()) do
        if tabbtn.ClassName == "Frame" and tabbtn.Name ~= "Placeholder" then
            if tabbtn:FindFirstChild("Title") then
                Tween(tabbtn.Title, 0.25, {TextTransparency = 0})
            end
            if tabbtn:FindFirstChild("Image") then
                Tween(tabbtn.Image, 0.25, {ImageTransparency = 0})
            end
            if fast then
                task.wait(0.05)
            else
                task.wait(0.12)
            end
        end
    end
    SideBarClosed = false
    task.wait(0.1)
    Debounce = false
end

function CloseSideBar()
    Debounce = true
    SideBarClosed = true
    for _, tabbtn in pairs(SideList:GetChildren()) do
        if tabbtn.ClassName == "Frame" and tabbtn.Name ~= "Placeholder" then
            Tween(tabbtn.Title, 0.3, {TextTransparency = 1})
            Tween(tabbtn.Image, 0.3, {ImageTransparency = 1})
        end
    end
    Tween(SideTabList, 0.4, {BackgroundTransparency = 1})
    if SideTabList:FindFirstChild("UIStroke") then
        Tween(SideTabList.UIStroke, 0.4, {Transparency = 1})
    end
    if SideTabList:FindFirstChild("RDMT") then
        Tween(SideTabList.RDMT, 0.4, {TextTransparency = 1})
    end
    task.wait(0.4)
    SideTabList.Visible = false
    task.wait(0.2)
    Debounce = false
end

function CloseSearch()
    Debounce = true
    Tween(SearchBar, 0.4, {BackgroundTransparency = 1, Size = UDim2.new(0, 460, 0, 35)})
    Tween(SearchBar.Icon, 0.4, {ImageTransparency = 1})
    Tween(SearchBar.Clear, 0.4, {ImageTransparency = 1})
    Tween(SearchBar.UIStroke, 0.4, {Transparency = 1})
    Tween(SearchBar.Filter, 0.4, {ImageTransparency = 1})
    Tween(SearchBar.Shadow.Image, 0.4, {ImageTransparency = 1})
    Tween(SearchBar.Input, 0.3, {TextTransparency = 1})
    task.delay(0.3, function()
        SearchBar.Input.Visible = false
    end)
    task.wait(0.5)
    SearchBar.Visible = false
    SearchHided = true
    Debounce = false
end

function OpenSearch()
    Debounce = true
    SearchBar.Position = UDim2.new(0.5, 80, 0.150000006, 0)
    SearchBar.Size = UDim2.new(0, 460, 0, 35)
    SearchBar.BackgroundTransparency = 1
    SearchBar.Icon.ImageTransparency = 1
    SearchBar.Clear.ImageTransparency = 1
    SearchBar.UIStroke.Transparency = 1
    SearchBar.Filter.ImageTransparency = 1
    SearchBar.Shadow.Image.ImageTransparency = 1
    SearchBar.Input.TextTransparency = 1
    SearchBar.Visible = true
    SearchBar.Input.Visible = true
    Tween(SearchBar, 0.4, {BackgroundTransparency = 0, Size = UDim2.new(0, 500, 0, 45)})
    Tween(SearchBar.Icon, 0.4, {ImageTransparency = 0.5})
    Tween(SearchBar.Shadow.Image, 0.4, {ImageTransparency = 0.1})
    Tween(SearchBar.UIStroke, 0.4, {Transparency = 0.05})
    Tween(SearchBar.Clear, 0.4, {ImageTransparency = 0.8})
    Tween(SearchBar.Filter, 0.4, {ImageTransparency = 0.8})
    Tween(SearchBar.Input, 0.4, {TextTransparency = 0})
    task.wait(0.5)
    SearchHided = false
    Debounce = false
end

function CloseSettings()
    Debounce = true
    SettingsOpen = false
    
    CloseSettingsDropdown()
    
    Tween(SettingsFrame, 0.4, {BackgroundTransparency = 1, Size = UDim2.new(0, 220, 0, 40)})
    if SettingsFrame:FindFirstChild("UIStroke") then
        Tween(SettingsFrame.UIStroke, 0.4, {Transparency = 1})
    end
    FadeOut(SettingsFrame, 0.3, {})
    task.wait(0.4)
    SettingsFrame.Visible = false
    Debounce = false
end

function OpenSettings()
    Debounce = true
    SettingsOpen = true
    SettingsFrame.Size = UDim2.new(0, 220, 0, 40)
    SettingsFrame.BackgroundTransparency = 1
    if SettingsFrame:FindFirstChild("UIStroke") then
        SettingsFrame.UIStroke.Transparency = 1
    end
    SetAllTransparent(SettingsFrame)
    SettingsFrame.Visible = true
    Tween(SettingsFrame, 0.4, {BackgroundTransparency = 0, Size = UDim2.new(0, 240, 0, 130)})
    if SettingsFrame:FindFirstChild("UIStroke") then
        Tween(SettingsFrame.UIStroke, 0.4, {Transparency = 0})
    end
    task.wait(0.15)
    FadeIn(SettingsFrame, 0.3, {})
    task.wait(0.4)
    Debounce = false
end

function Hide()
    if not SideBarClosed then
        task.spawn(CloseSideBar)
    end
    if not SearchHided then
        task.spawn(CloseSearch)
    end
    if SettingsOpen then
        task.spawn(CloseSettings)
    end

    Debounce = true
    
    for _, tabbtn in ipairs(TopList:GetChildren()) do
        if tabbtn.ClassName == "Frame" and tabbtn.Name ~= "Placeholder" then
            Tween(tabbtn, 0.3, {BackgroundTransparency = 1})
            Tween(tabbtn.Image, 0.3, {ImageTransparency = 1})
            Tween(tabbtn.Title, 0.3, {TextTransparency = 1})
            Tween(tabbtn.Shadow, 0.3, {ImageTransparency = 1})
            Tween(tabbtn.UIStroke, 0.3, {Transparency = 1})
        end
    end

    Tween(Main, 0.5, {Size = UDim2.new(0, 495, 0, 45), BackgroundTransparency = 1})
    Tween(Topbar, 0.5, {Size = UDim2.new(0, 495, 0, 45), BackgroundTransparency = 1})
    Tween(Topbar.Divider, 0.5, {BackgroundTransparency = 1})
    Tween(Topbar.CornerRepair, 0.5, {BackgroundTransparency = 1})
    Tween(Topbar.Title, 0.5, {TextTransparency = 1})
    Tween(Main.Shadow.Image, 0.5, {ImageTransparency = 1})
    
    if Topbar:FindFirstChild("UIStroke") then
        Tween(Topbar.UIStroke, 0.5, {Transparency = 1})
    end

    for _, btn in ipairs(Topbar:GetChildren()) do
        if btn:IsA("ImageButton") then
            Tween(btn, 0.4, {ImageTransparency = 1})
        end
    end

    Tween(DragCosmetic, 0.5, {BackgroundTransparency = 1})

    task.wait(0.3)
    Elements.Visible = false
    Elements.Size = UDim2.new(0.7, 0, 1, -65)
    TabsList.Visible = false
    Drag.Visible = false
    
    task.wait(0.2)
    Main.Visible = false
    Hidden = true
    Minimised = false
    Debounce = false

    ArrayFieldLibrary:Notify({
        Title = "Interface Hidden",
        Content = "Press " .. UnhideKeybind.Name .. " to show the interface again.",
        Duration = 5,
        Image = "eye-closed"
    })
end

function Unhide()
    Debounce = true
    
    Main.Size = UDim2.new(0, 495, 0, 45)
    Main.BackgroundTransparency = 1
    Topbar.Size = UDim2.new(0, 495, 0, 45)
    Topbar.BackgroundTransparency = 1
    Topbar.Divider.BackgroundTransparency = 1
    Topbar.CornerRepair.BackgroundTransparency = 1
    Topbar.Title.TextTransparency = 1
    Main.Shadow.Image.ImageTransparency = 1
    
    for _, btn in ipairs(Topbar:GetChildren()) do
        if btn:IsA("ImageButton") then
            btn.ImageTransparency = 1
        end
    end
    
    for _, tabbtn in ipairs(TopList:GetChildren()) do
        if tabbtn.ClassName == "Frame" and tabbtn.Name ~= "Placeholder" then
            tabbtn.BackgroundTransparency = 1
            tabbtn.Image.ImageTransparency = 1
            tabbtn.Title.TextTransparency = 1
            tabbtn.Shadow.ImageTransparency = 1
            tabbtn.UIStroke.Transparency = 1
        end
    end
    
    Main.Visible = true
    Drag.Visible = true
    TabsList.Visible = true
    Elements.Visible = true
    Elements.Size = UDim2.new(0.7, 0, 1, -65)
    
    Main.Position = UDim2.new(0.5, 0, 0.5, 0)
    
    Tween(Main, 0.5, {Size = UDim2.new(0, 670, 0, 319), BackgroundTransparency = 0.07})
    Tween(Topbar, 0.5, {Size = UDim2.new(1, 0, 0, 45), BackgroundTransparency = 0})
    Tween(Topbar.Divider, 0.5, {BackgroundTransparency = 0})
    Tween(Topbar.CornerRepair, 0.5, {BackgroundTransparency = 0})
    Tween(Topbar.Title, 0.5, {TextTransparency = 0})
    Tween(Main.Shadow.Image, 0.7, {ImageTransparency = 0.4})

    for _, btn in ipairs(Topbar:GetChildren()) do
        if btn:IsA("ImageButton") then
            if btn.Name == "Type" then
                Tween(btn, 0.7, {ImageTransparency = 0})
            else
                Tween(btn, 0.7, {ImageTransparency = 0.8})
            end
        end
    end

    Tween(DragCosmetic, 0.5, {BackgroundTransparency = 0.4})

    Drag.Position = UDim2.fromOffset(Main.AbsolutePosition.X + Main.AbsoluteSize.X / 2, Main.AbsolutePosition.Y + Main.AbsoluteSize.Y / 2 + dragOffset)

    task.wait(0.15)
    
    for _, tabbtn in ipairs(TopList:GetChildren()) do
        if tabbtn.ClassName == "Frame" and tabbtn.Name ~= "Placeholder" then
            Tween(tabbtn, 0.3, {BackgroundTransparency = 0.7})
            Tween(tabbtn.Image, 0.3, {ImageTransparency = 0.2})
            Tween(tabbtn.Title, 0.3, {TextTransparency = 0.2})
            Tween(tabbtn.UIStroke, 0.3, {Transparency = 0})
        end
    end

    if SideBarClosed then
        task.spawn(function()
            OpenSideBar(true)
        end)
    end

    task.wait(0.35)
    Hidden = false
    Minimised = false
    Debounce = false
end

function Minimise()
    Debounce = true
    Topbar.ChangeSize.Image = "rbxassetid://11036884234"
    
    if not SearchHided then
        task.spawn(CloseSearch)
    end
    if not SideBarClosed then
        task.spawn(CloseSideBar)
    end
    if SettingsOpen then
        task.spawn(CloseSettings)
    end

    for _, tabbtn in ipairs(TopList:GetChildren()) do
        if tabbtn.ClassName == "Frame" and tabbtn.Name ~= "Placeholder" then
            Tween(tabbtn, 0.3, {BackgroundTransparency = 1})
            Tween(tabbtn.Image, 0.3, {ImageTransparency = 1})
            Tween(tabbtn.Title, 0.3, {TextTransparency = 1})
            Tween(tabbtn.Shadow, 0.3, {ImageTransparency = 1})
            Tween(tabbtn.UIStroke, 0.3, {Transparency = 1})
        end
    end

    Tween(Topbar.UIStroke, 0.5, {Transparency = 0})
    Tween(Main.Shadow.Image, 0.5, {ImageTransparency = 1})
    Tween(Topbar.CornerRepair, 0.5, {BackgroundTransparency = 1})
    Tween(Topbar.Divider, 0.5, {BackgroundTransparency = 1})
    Tween(Main, 0.5, {Size = UDim2.new(0, 495, 0, 45)})
    Tween(Topbar, 0.5, {Size = UDim2.new(0, 495, 0, 45)})

    Tween(DragCosmetic, 0.5, {BackgroundTransparency = 1})
    
    if Topbar:FindFirstChild("Search") then
        Tween(Topbar.Search, 0.4, {ImageTransparency = 1})
    end
    if Topbar:FindFirstChild("Settings") then
        Tween(Topbar.Settings, 0.4, {ImageTransparency = 1})
    end

    task.wait(0.3)
    Elements.Visible = false
    TabsList.Visible = false
    Drag.Visible = false

    task.wait(0.2)
    Minimised = true
    Debounce = false
end

function Maximise()
    Debounce = true
    Topbar.ChangeSize.Image = "rbxassetid://10137941941"

    Tween(Topbar.UIStroke, 0.5, {Transparency = 1})
    Tween(Main.Shadow.Image, 0.5, {ImageTransparency = 0.4})
    Tween(Topbar.CornerRepair, 0.5, {BackgroundTransparency = 0})
    Tween(Topbar.Divider, 0.5, {BackgroundTransparency = 0})
    Tween(Main, 0.5, {Size = UDim2.new(0, 670, 0, 319)})
    Tween(Topbar, 0.5, {Size = UDim2.new(1, 0, 0, 45)})

    TabsList.Visible = true
    Elements.Visible = true
    Elements.Size = UDim2.new(0.7, 0, 1, -65)
    Drag.Visible = true

    Tween(DragCosmetic, 0.5, {BackgroundTransparency = 0.4})
    
    if Topbar:FindFirstChild("Search") then
        Tween(Topbar.Search, 0.4, {ImageTransparency = 0.8})
    end
    if Topbar:FindFirstChild("Settings") then
        Tween(Topbar.Settings, 0.4, {ImageTransparency = 0.8})
    end

    task.wait(0.2)

    for _, tabbtn in ipairs(TopList:GetChildren()) do
        if tabbtn.ClassName == "Frame" and tabbtn.Name ~= "Placeholder" then
            Tween(tabbtn, 0.3, {BackgroundTransparency = 0.7})
            Tween(tabbtn.Image, 0.3, {ImageTransparency = 0.2})
            Tween(tabbtn.Title, 0.3, {TextTransparency = 0.2})
            Tween(tabbtn.UIStroke, 0.3, {Transparency = 0})
        end
    end

    if SideBarClosed then
        task.spawn(OpenSideBar)
    end

    task.wait(0.5)
    Minimised = false
    Debounce = false
end

function ArrayFieldLibrary:Notify(NotificationSettings)
    spawn(function()
        if not Notifications or not Notifications:FindFirstChild("Template") then return end
        
        local ActionCompleted = true
        local Notification = Notifications.Template:Clone()
        Notification.Parent = Notifications
        Notification.Name = NotificationSettings.Title or "Unknown Title"
        Notification.Visible = true

        if Notification:FindFirstChild("Actions") and Notification.Actions:FindFirstChild("Template") then
            Notification.Actions.Template.Visible = false

            if NotificationSettings.Actions then
                for _, Action in pairs(NotificationSettings.Actions) do
                    ActionCompleted = false
                    local NewAction = Notification.Actions.Template:Clone()
                    if SelectedTheme then
                        NewAction.BackgroundColor3 = SelectedTheme.NotificationActionsBackground
                        NewAction.TextColor3 = SelectedTheme.TextColor
                    end
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
                            print("ArrayField | Action: "..Action.Name.." Callback Error " ..tostring(Response))
                        end
                        ActionCompleted = true
                    end)
                end
            end
        end
        
        if SelectedTheme then
            Notification.BackgroundColor3 = SelectedTheme.Background
        end
        if Notification:FindFirstChild("Title") then
            Notification.Title.Text = NotificationSettings.Title or "Unknown"
            Notification.Title.TextTransparency = 1
            if SelectedTheme then
                Notification.Title.TextColor3 = SelectedTheme.TextColor
            end
        end
        if Notification:FindFirstChild("Description") then
            Notification.Description.Text = NotificationSettings.Content or "Unknown"
            Notification.Description.TextTransparency = 1
            if SelectedTheme then
                Notification.Description.TextColor3 = SelectedTheme.TextColor
            end
        end
        if Notification:FindFirstChild("Icon") then
            if SelectedTheme then
                Notification.Icon.ImageColor3 = SelectedTheme.TextColor
            end
            Notification.Icon.ImageTransparency = 1
        end

        if NotificationSettings.Image and Notification:FindFirstChild("Icon") then
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
            if Notification:FindFirstChild("Icon") then
                Notification.Icon.Image = "rbxassetid://3944680095"
                Notification.Icon.ImageRectOffset = Vector2.new(0, 0)
                Notification.Icon.ImageRectSize = Vector2.new(0, 0)
            end
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
            
            wait(0.9)
            if Notification then
                Notification:Destroy()
            end
        end
    end)
end

local function SetupSettingsKeybind()
    local Frame = SettingsFrame:FindFirstChild("Frame")
    if not Frame then return end
    
    local Keybind = Frame:FindFirstChild("Keybind")
    if not Keybind then return end
    
    local KeybindFrame = Keybind:FindFirstChild("KeybindFrame")
    if not KeybindFrame then return end
    
    local KeybindBox = KeybindFrame:FindFirstChild("KeybindBox")
    if not KeybindBox then return end
    
    KeybindBox.Text = UnhideKeybind.Name
    KeybindFrame.Size = UDim2.new(0, KeybindBox.TextBounds.X + 24, 0, 30)
    
    KeybindBox.Focused:Connect(function()
        CheckingForKey = true
        KeybindBox.Text = ""
    end)
    
    KeybindBox.FocusLost:Connect(function()
        CheckingForKey = false
        if KeybindBox.Text == "" then
            KeybindBox.Text = UnhideKeybind.Name
        end
    end)
    
    KeybindBox:GetPropertyChangedSignal("Text"):Connect(function()
        Tween(KeybindFrame, 0.55, {Size = UDim2.new(0, KeybindBox.TextBounds.X + 24, 0, 30)})
    end)
    
    Keybind.MouseEnter:Connect(function()
        if SelectedTheme then
            Tween(Keybind, 0.6, {BackgroundColor3 = SelectedTheme.ElementBackgroundHover})
        end
    end)
    
    Keybind.MouseLeave:Connect(function()
        if SelectedTheme then
            Tween(Keybind, 0.6, {BackgroundColor3 = SelectedTheme.ElementBackground})
        end
    end)
end

local function SetupSettingsThemeDropdown()
    local Frame = SettingsFrame:FindFirstChild("Frame")
    if not Frame then return end

    local Dropdown = Frame:FindFirstChild("Dropdown")
    if not Dropdown then return end

    local List = Dropdown:FindFirstChild("List")
    if not List then return end

    local Template = List:FindFirstChild("Template")
    if not Template then return end

    local Interact = Dropdown:FindFirstChild("Interact")
    local Toggle = Dropdown:FindFirstChild("Toggle")
    local Selected = Dropdown:FindFirstChild("Selected")

    if Selected then
        Selected.Text = CurrentThemeName
    end

    if Toggle then
        Toggle.Rotation = 180
    end

    List.Visible = false
    List.Size = UDim2.new(1, 0, 0, 135)

    for _, child in ipairs(List:GetChildren()) do
        if child:IsA("Frame") and child.Name ~= "Template" and child.Name ~= "PlaceHolder" then
            child:Destroy()
        end
    end

    local themeNames = {}
    
    if DeveloperSelectedTheme then
        table.insert(themeNames, "Developer Selected")
    end
    
    table.insert(themeNames, "ArrayField")

    for themeName, _ in pairs(ArrayFieldLibrary.Theme) do
        if themeName ~= "Default" then
            table.insert(themeNames, themeName)
        end
    end

    table.sort(themeNames, function(a, b)
        if a == "Developer Selected" then return true end
        if b == "Developer Selected" then return false end
        if a == "ArrayField" then return true end
        if b == "ArrayField" then return false end
        return a < b
    end)

    local function SelectTheme(themeName)
        CurrentThemeName = themeName
        if Selected then
            Selected.Text = themeName
        end

        if themeName == "ArrayField" then
            SelectedTheme = nil
            RestoreOriginalColors()
        elseif themeName == "Developer Selected" then
            SelectedTheme = DeveloperSelectedTheme
            if SelectedTheme then
                ApplyTheme()
            else
                RestoreOriginalColors()
            end
        else
            SelectedTheme = ArrayFieldLibrary.Theme[themeName]
            if SelectedTheme then
                ApplyTheme()
            end
        end

        SaveSettings()

        ArrayFieldLibrary:Notify({
            Title = "Theme Changed",
            Content = "Theme set to " .. themeName,
            Duration = 3,
            Image = "palette"
        })
    end

    for _, themeName in ipairs(themeNames) do
        local Option = Template:Clone()
        Option.Name = themeName
        Option.Visible = true
        Option.Parent = List
        Option.BackgroundTransparency = 1

        if Option:FindFirstChild("Title") then
            Option.Title.Text = themeName
            Option.Title.TextTransparency = 1
            Option.Title.Size = UDim2.new(0, 150, 0, 14)
            Option.Title.TextTruncate = Enum.TextTruncate.AtEnd
        end

        if Option:FindFirstChild("UIStroke") then
            Option.UIStroke.Transparency = 1
        end

        if themeName == CurrentThemeName then
            Option.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        else
            Option.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        end

        local OptionInteract = Option:FindFirstChild("Interact")
        if OptionInteract then
            OptionInteract.ZIndex = 50
            OptionInteract.MouseButton1Click:Connect(function()
                if themeName == CurrentThemeName then return end

                for _, opt in ipairs(List:GetChildren()) do
                    if opt:IsA("Frame") and opt.Name ~= "Template" and opt.Name ~= "PlaceHolder" then
                        TweenService:Create(opt, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundColor3 = Color3.fromRGB(30, 30, 30)}):Play()
                    end
                end

                TweenService:Create(Option, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundColor3 = Color3.fromRGB(40, 40, 40)}):Play()

                SelectTheme(themeName)

                task.wait(0.2)

                TweenService:Create(Dropdown, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 220, 0, 40)}):Play()
                TweenService:Create(SettingsFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 240, 0, 130)}):Play()

                for _, opt in ipairs(List:GetChildren()) do
                    if opt:IsA("Frame") and opt.Name ~= "Template" and opt.Name ~= "PlaceHolder" then
                        TweenService:Create(opt, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
                        if opt:FindFirstChild("UIStroke") then
                            TweenService:Create(opt.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
                        end
                        if opt:FindFirstChild("Title") then
                            TweenService:Create(opt.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
                        end
                    end
                end

                TweenService:Create(List, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ScrollBarImageTransparency = 1}):Play()
                if Toggle then
                    TweenService:Create(Toggle, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Rotation = 180}):Play()
                end

                task.wait(0.35)
                List.Visible = false
                SettingsDropdownOpen = false
            end)
        end

        Option.MouseEnter:Connect(function()
            if themeName ~= CurrentThemeName then
                TweenService:Create(Option, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundColor3 = Color3.fromRGB(35, 35, 35)}):Play()
            end
        end)

        Option.MouseLeave:Connect(function()
            if themeName ~= CurrentThemeName then
                TweenService:Create(Option, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundColor3 = Color3.fromRGB(30, 30, 30)}):Play()
            end
        end)
    end

    if Interact then
        Interact.MouseButton1Click:Connect(function()
            if SettingsDropdownOpen then
                TweenService:Create(Dropdown, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 220, 0, 40)}):Play()
                TweenService:Create(SettingsFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 240, 0, 130)}):Play()

                for _, opt in ipairs(List:GetChildren()) do
                    if opt:IsA("Frame") and opt.Name ~= "Template" and opt.Name ~= "PlaceHolder" then
                        TweenService:Create(opt, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
                        if opt:FindFirstChild("UIStroke") then
                            TweenService:Create(opt.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
                        end
                        if opt:FindFirstChild("Title") then
                            TweenService:Create(opt.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
                        end
                    end
                end

                TweenService:Create(List, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ScrollBarImageTransparency = 1}):Play()
                if Toggle then
                    TweenService:Create(Toggle, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Rotation = 180}):Play()
                end

                task.wait(0.35)
                List.Visible = false
                SettingsDropdownOpen = false
            else
                TweenService:Create(Dropdown, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 220, 0, 180)}):Play()
                TweenService:Create(SettingsFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 240, 0, 270)}):Play()

                List.Visible = true
                TweenService:Create(List, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ScrollBarImageTransparency = 0.7}):Play()
                if Toggle then
                    TweenService:Create(Toggle, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Rotation = 0}):Play()
                end

                for _, opt in ipairs(List:GetChildren()) do
                    if opt:IsA("Frame") and opt.Name ~= "Template" and opt.Name ~= "PlaceHolder" then
                        TweenService:Create(opt, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
                        if opt:FindFirstChild("UIStroke") then
                            TweenService:Create(opt.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
                        end
                        if opt:FindFirstChild("Title") then
                            TweenService:Create(opt.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
                        end
                    end
                end

                SettingsDropdownOpen = true
            end
        end)
    end

    Dropdown.MouseEnter:Connect(function()
        if not SettingsDropdownOpen then
            if SelectedTheme then
                TweenService:Create(Dropdown, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
            end
        end
    end)

    Dropdown.MouseLeave:Connect(function()
        if SelectedTheme then
            TweenService:Create(Dropdown, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
        end
    end)
end

function ArrayFieldLibrary:CreateWindow(Settings)
    local Window = {Tabs = {}}

    if Settings.DefaultTheme then
        if type(Settings.DefaultTheme) == "string" and ArrayFieldLibrary.Theme[Settings.DefaultTheme] then
            DeveloperSelectedTheme = ArrayFieldLibrary.Theme[Settings.DefaultTheme]
            SelectedTheme = DeveloperSelectedTheme
            CurrentThemeName = "Developer Selected"
        elseif type(Settings.DefaultTheme) == "table" then
            DeveloperSelectedTheme = Settings.DefaultTheme
            SelectedTheme = DeveloperSelectedTheme
            CurrentThemeName = "Developer Selected"
        end
    else
        CurrentThemeName = "ArrayField"
    end

    if Settings.ConfigurationSaving then
        ConfigurationSettings.Enabled = Settings.ConfigurationSaving.Enabled or false
        ConfigurationSettings.FolderName = Settings.ConfigurationSaving.FolderName
        ConfigurationSettings.FileName = Settings.ConfigurationSaving.FileName or "ArrayField"
    end

    StoreOriginalTransparencies(SettingsFrame)
    StoreOriginalTransparencies(SideTabList)

    if SelectedTheme then
        ApplyTheme()
    end

    if Settings.Icon then
        if Topbar:FindFirstChild("Type") then
            if tonumber(Settings.Icon) then
                Topbar.Type.Image = "rbxassetid://" .. Settings.Icon
                Topbar.Type.ImageRectOffset = Vector2.new(0, 0)
                Topbar.Type.ImageRectSize = Vector2.new(0, 0)
            else
                local success, iconData = pcall(getIcon, Settings.Icon)
                if success then
                    Topbar.Type.Image = "rbxassetid://" .. iconData.id
                    Topbar.Type.ImageRectOffset = iconData.imageRectOffset
                    Topbar.Type.ImageRectSize = iconData.imageRectSize
                end
            end
            Topbar.Type.Active = false
            Topbar.Type.AutoButtonColor = false
        end
    end

    Topbar.Title.Text = Settings.Name or "ArrayField"
    Main.Size = UDim2.new(0, 250, 0, 260)
    Main.Visible = true
    Main.BackgroundTransparency = 1
    LoadingFrame.Title.TextTransparency = 1
    LoadingFrame.Subtitle.TextTransparency = 1
    Main.Shadow.Image.ImageTransparency = 1
    LoadingFrame.Version.TextTransparency = 1
    LoadingFrame.Version.Position = UDim2.new(0, 100, 0, 230)
    LoadingFrame.Title.Text = Settings.LoadingTitle or "ArrayField Interface Suite"
    LoadingFrame.Subtitle.Text = Settings.LoadingSubtitle or "by Sirius | Meta"
    Topbar.Visible = false
    Elements.Visible = false
    Elements.Size = UDim2.new(0.7, 0, 1, -65)
    LoadingFrame.Visible = true
    Drag.Visible = false
    SearchBar.Visible = false
    SettingsFrame.Visible = false
    Notifications.Visible = true
    Notifications.Template.Visible = false

    SideTabList.Visible = false
    SideTabList.BackgroundTransparency = 1
    if SideTabList:FindFirstChild("UIStroke") then
        SideTabList.UIStroke.Transparency = 1
    end
    if SideTabList:FindFirstChild("RDMT") then
        SideTabList.RDMT.TextTransparency = 1
    end
    for _, tabbtn in pairs(SideList:GetChildren()) do
        if tabbtn.ClassName == "Frame" and tabbtn.Name ~= "Placeholder" and tabbtn.Name ~= "SideTemplate" then
            tabbtn.Title.TextTransparency = 1
            tabbtn.Image.ImageTransparency = 1
        end
    end

    if TopList:FindFirstChild("Template") then
        TopList.Template.Visible = false
    end
    if SideList:FindFirstChild("SideTemplate") then
        SideList.SideTemplate.Visible = false
    end

    for _, TabButton in ipairs(TopList:GetChildren()) do
        if TabButton.ClassName == "Frame" and TabButton.Name ~= "Placeholder" and TabButton.Name ~= "Template" then
            TabButton.BackgroundTransparency = 1
            TabButton.Title.TextTransparency = 1
            TabButton.Shadow.ImageTransparency = 1
            TabButton.Image.ImageTransparency = 1
            TabButton.UIStroke.Transparency = 1
        end
    end

    for _, btn in ipairs(Topbar:GetChildren()) do
        if btn:IsA("ImageButton") then
            btn.ImageTransparency = 1
        end
    end

    SetZIndex(Main, 2)
    SetZIndex(SideTabList, 3)
    SetZIndex(SettingsFrame, 4)
    SetZIndex(SearchBar, 6)
    SetZIndex(Drag, 8)
    SetZIndex(Notifications, 10)

    AddDraggingFunctionality(Topbar, Main)
    SetupSettingsKeybind()
    SetupSettingsThemeDropdown()

    ArrayField.Enabled = true

    task.wait(0.5)
    Tween(Main, 0.7, {BackgroundTransparency = 0})
    Tween(Main.Shadow.Image, 0.7, {ImageTransparency = 0.55})
    task.wait(0.1)
    Tween(LoadingFrame.Title, 0.7, {TextTransparency = 0})
    task.wait(0.05)
    Tween(LoadingFrame.Subtitle, 0.7, {TextTransparency = 0})
    task.wait(0.05)
    Tween(LoadingFrame.Version, 0.7, {TextTransparency = 0})

    Elements.Template.LayoutOrder = 100000
    Elements.Template.Visible = false

    task.wait(1.2)

    Tween(LoadingFrame.Title, 0.5, {TextTransparency = 1})
    Tween(LoadingFrame.Subtitle, 0.5, {TextTransparency = 1})
    Tween(LoadingFrame.Version, 0.5, {TextTransparency = 1})
    task.wait(0.2)
    Tween(Main, 0.7, {Size = UDim2.new(0, 670, 0, 319)})
    Tween(Main.Shadow.Image, 0.7, {ImageTransparency = 0.4})

    task.wait(0.5)
    LoadingFrame.Visible = false

    Tween(Main, 0.5, {BackgroundTransparency = 0.07})

    Topbar.BackgroundTransparency = 1
    Topbar.Divider.Size = UDim2.new(0, 0, 0, 1)
    Topbar.CornerRepair.BackgroundTransparency = 1
    Topbar.Title.TextTransparency = 1

    task.wait(0.3)
    Topbar.Visible = true
    Tween(Topbar, 0.7, {BackgroundTransparency = 0})
    Tween(Topbar.CornerRepair, 0.7, {BackgroundTransparency = 0})
    task.wait(0.1)
    Tween(Topbar.Divider, 1, {Size = UDim2.new(1, 0, 0, 1)})
    task.wait(0.1)
    Tween(Topbar.Title, 0.7, {TextTransparency = 0})
    task.wait(0.1)
    
    local buttons = {}
    for _, btn in ipairs(Topbar:GetChildren()) do
        if btn:IsA("ImageButton") then
            table.insert(buttons, btn)
        end
    end

    table.sort(buttons, function(a, b)
        return a.AbsolutePosition.X > b.AbsolutePosition.X
    end)

    for _, btn in ipairs(buttons) do
        if btn.Name == "Type" then
            Tween(btn, 0.7, {ImageTransparency = 0})
        else
            Tween(btn, 0.7, {ImageTransparency = 0.8})
        end
        task.wait(0.1)
    end

    for _, btn in ipairs(Topbar:GetChildren()) do
        if btn:IsA("ImageButton") and btn.Name ~= "Type" then
            local isHovering = false
            
            btn.MouseEnter:Connect(function()
                isHovering = true
                if not Hidden and not (Minimised and (btn.Name == "Search" or btn.Name == "Settings")) then
                    Tween(btn, 0.7, {ImageTransparency = 0})
                end
            end)
            
            btn.MouseLeave:Connect(function()
                isHovering = false
                if not Hidden and not (Minimised and (btn.Name == "Search" or btn.Name == "Settings")) then
                    Tween(btn, 0.7, {ImageTransparency = 0.8})
                end
            end)
            
            btn.MouseButton1Click:Connect(function()
                if isHovering and btn.Name ~= "Hide" then
                    Tween(btn, 0.1, {ImageTransparency = 0})
                end
            end)
        end
    end

    Topbar.Hide.MouseButton1Click:Connect(function()
        if Debounce then return end
        Hide()
    end)

    Topbar.ChangeSize.MouseButton1Click:Connect(function()
        if Debounce then return end
        if Minimised then
            Maximise()
        else
            Minimise()
        end
    end)

    Topbar.Search.MouseButton1Click:Connect(function()
        if Debounce or Minimised then return end
        if SearchHided then
            OpenSearch()
        else
            CloseSearch()
        end
    end)

    Topbar.Settings.MouseButton1Click:Connect(function()
        if Debounce or Minimised then return end
        if SettingsOpen then
            CloseSettings()
        else
            OpenSettings()
        end
    end)

    if SettingsFrame:FindFirstChild("Hide") then
        SettingsFrame.Hide.MouseButton1Click:Connect(function()
            if Debounce then return end
            CloseSettings()
        end)
    end

    SearchBar.Clear.MouseButton1Down:Connect(function()
        Filler.Position = UDim2.new(0.957, 0, 0.5, 0)
        Filler.Size = UDim2.new(0, 1, 0, 1)
        Filler.BackgroundTransparency = 0.9
        Tween(Filler, 1, {Size = UDim2.new(0, 1000, 0, 500), BackgroundTransparency = 1})
        SearchBar.Input.Text = ''
    end)

    UserInputService.InputBegan:Connect(function(input, processed)
        if CheckingForKey then
            if input.UserInputType == Enum.UserInputType.Keyboard then
                if input.KeyCode ~= Enum.KeyCode.Unknown and input.KeyCode ~= Enum.KeyCode.Escape then
                    local Frame = SettingsFrame:FindFirstChild("Frame")
                    if Frame then
                        local Keybind = Frame:FindFirstChild("Keybind")
                        if Keybind then
                            local KeybindFrame = Keybind:FindFirstChild("KeybindFrame")
                            if KeybindFrame then
                                local KeybindBox = KeybindFrame:FindFirstChild("KeybindBox")
                                if KeybindBox then
                                    UnhideKeybind = input.KeyCode
                                    KeybindBox.Text = input.KeyCode.Name
                                    KeybindBox:ReleaseFocus()
                                    CheckingForKey = false
                                    SaveSettings()
                                    ArrayFieldLibrary:Notify({
                                        Title = "Keybind Updated",
                                        Content = "Toggle UI keybind set to " .. input.KeyCode.Name,
                                        Duration = 3,
                                        Image = "keyboard"
                                    })
                                end
                            end
                        end
                    end
                end
            end
            return
        end
        
        if processed then return end
        
        if input.KeyCode == UnhideKeybind then
            if Debounce then return end
            if Hidden then
                Unhide()
            else
                Hide()
            end
        end
    end)

    Elements.Visible = true
    Elements.Size = UDim2.new(0.7, 0, 1, -65)
    Drag.Visible = true
    Drag.Position = UDim2.fromOffset(Main.AbsolutePosition.X + Main.AbsoluteSize.X / 2, Main.AbsolutePosition.Y + Main.AbsoluteSize.Y / 2 + dragOffset)
    DragCosmetic.Size = UDim2.new(0, 247, 0, 4)
    DragCosmetic.BackgroundTransparency = 0.4

    SetupDragBar()

    task.wait(0.3)
    task.spawn(OpenSideBar)

    if ConfigurationSettings.Enabled then
        task.delay(1, function()
            LoadConfiguration()
        end)
    end

    local FirstTab = false

    -- Tab
    function Window:CreateTab(Name, Image)
        Window.Tabs[Name] = {Elements = {}}
        local Tab = Window.Tabs[Name]
        local SDone = false
        local TopTabButton = TopList.Template:Clone()
        local SideTabButton = SideList.SideTemplate:Clone()

        SideTabButton.Parent = SideList
        TopTabButton.Parent = TopList
        
        TopTabButton.Name = Name
        SideTabButton.Name = Name
        
        TopTabButton.Title.Text = Name
        SideTabButton.Title.Text = Name
        SideTabButton.Title.TextWrapped = false
        TopTabButton.Title.TextWrapped = false
        
        TopTabButton.Size = UDim2.new(0, TopTabButton.Title.TextBounds.X + 30, 0, 30)
        
        if Image then
            if typeof(Image) == 'string' and not tonumber(Image) then
                local success, asset = pcall(getIcon, Image)
                if success then
                    TopTabButton.Image.Image = 'rbxassetid://' .. asset.id
                    TopTabButton.Image.ImageRectOffset = asset.imageRectOffset
                    TopTabButton.Image.ImageRectSize = asset.imageRectSize
                    
                    SideTabButton.Image.Image = 'rbxassetid://' .. asset.id
                    SideTabButton.Image.ImageRectOffset = asset.imageRectOffset
                    SideTabButton.Image.ImageRectSize = asset.imageRectSize
                end
            else
                TopTabButton.Image.Image = "rbxassetid://" .. Image
                SideTabButton.Image.Image = "rbxassetid://" .. Image
            end
            
            TopTabButton.Title.AnchorPoint = Vector2.new(0, 0.5)
            TopTabButton.Title.Position = UDim2.new(0, 37, 0.5, 0)
            TopTabButton.Image.Visible = true
            TopTabButton.Title.TextXAlignment = Enum.TextXAlignment.Left
            TopTabButton.Size = UDim2.new(0, TopTabButton.Title.TextBounds.X + 46, 0, 30)
            
            SideTabButton.Image.Visible = true
        else
            TopTabButton.Image.Visible = false
            SideTabButton.Image.Visible = false
        end

        TopTabButton.BackgroundTransparency = 1
        TopTabButton.Title.TextTransparency = 1
        TopTabButton.Shadow.ImageTransparency = 1
        TopTabButton.Image.ImageTransparency = 1
        TopTabButton.UIStroke.Transparency = 1

        SideTabButton.BackgroundTransparency = 1
        SideTabButton.Title.TextTransparency = 1
        if SideTabButton:FindFirstChild("Shadow") then
            SideTabButton.Shadow.ImageTransparency = 1
        end
        SideTabButton.Image.ImageTransparency = 1
        if SideTabButton:FindFirstChild("UIStroke") then
            SideTabButton.UIStroke.Transparency = 1
        end

        TopTabButton.Visible = true
        SideTabButton.Visible = true

        local TabPage = Elements.Template:Clone()
        TabPage.Name = Name
        TabPage.Visible = true
        TabPage.LayoutOrder = #Elements:GetChildren()

        for _, TemplateElement in ipairs(TabPage:GetChildren()) do
            if TemplateElement.ClassName == "Frame" and TemplateElement.Name ~= "Placeholder" then
                TemplateElement:Destroy()
            end
        end

        TabPage.Parent = Elements
        
        if not FirstTab then
            Elements.UIPageLayout.Animated = false
            Elements.UIPageLayout:JumpTo(TabPage)
            Elements.UIPageLayout.Animated = true
        end

        TopTabButton.UIStroke.Color = SelectedTheme and SelectedTheme.ElementStroke or Color3.fromRGB(40, 40, 40)

        task.wait(0.1)
        if FirstTab then
            TopTabButton.BackgroundColor3 = SelectedTheme and SelectedTheme.ElementBackground or Color3.fromRGB(20, 20, 20)
            TopTabButton.Image.ImageColor3 = SelectedTheme and SelectedTheme.TextColor or Color3.fromRGB(240, 240, 240)
            TopTabButton.Title.TextColor3 = SelectedTheme and SelectedTheme.TextColor or Color3.fromRGB(240, 240, 240)
            TweenService:Create(TopTabButton, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0.7}):Play()
            TweenService:Create(TopTabButton.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0.2}):Play()
            TweenService:Create(TopTabButton.Image, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageTransparency = 0.2}):Play()
            TweenService:Create(TopTabButton.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
            TweenService:Create(TopTabButton.Shadow, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ImageTransparency = 0.7}):Play()

            TweenService:Create(SideTabButton.Image, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageTransparency = 0, ImageColor3 = Color3.fromRGB(205, 205, 205)}):Play()
            TweenService:Create(SideTabButton.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0.2, TextColor3 = Color3.fromRGB(205, 205, 205)}):Play()
        else
            FirstTab = Name

            TopTabButton.BackgroundColor3 = SelectedTheme and SelectedTheme.Accent or Color3.fromRGB(90, 90, 90)
            TopTabButton.Image.ImageColor3 = Color3.fromRGB(255, 255, 255)
            TopTabButton.Title.TextColor3 = Color3.fromRGB(255, 255, 255)
            TweenService:Create(TopTabButton.Shadow, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ImageTransparency = 0.9}):Play()
            TweenService:Create(TopTabButton.Image, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageTransparency = 0}):Play()
            TweenService:Create(TopTabButton, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
            TweenService:Create(TopTabButton.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()

            SideTabButton.Image.ImageColor3 = Color3.fromRGB(255, 255, 255)
            SideTabButton.Title.TextColor3 = Color3.fromRGB(255, 255, 255)
            TweenService:Create(SideTabButton.Image, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageTransparency = 0}):Play()
            TweenService:Create(SideTabButton.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
        end

        local function Pick()
            if Minimised then return end
            
            TweenService:Create(TopTabButton, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
            TweenService:Create(TopTabButton.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
            TweenService:Create(TopTabButton.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
            TweenService:Create(TopTabButton.Image, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageTransparency = 0}):Play()
            TweenService:Create(TopTabButton, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme and SelectedTheme.Accent or Color3.fromRGB(90, 90, 90)}):Play()
            TweenService:Create(TopTabButton.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
            TweenService:Create(TopTabButton.Image, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageColor3 = Color3.fromRGB(255, 255, 255)}):Play()
            TweenService:Create(TopTabButton.Shadow, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ImageTransparency = 0.9}):Play()

            TweenService:Create(SideTabButton.Image, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageTransparency = 0, ImageColor3 = Color3.fromRGB(255, 255, 255)}):Play()
            TweenService:Create(SideTabButton.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0, TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
            
            Elements.UIPageLayout:JumpTo(TabPage)
            
            for _, OtherTabButton in ipairs(TopList:GetChildren()) do
                if OtherTabButton.Name ~= "Template" and OtherTabButton.ClassName == "Frame" and OtherTabButton ~= TopTabButton and OtherTabButton.Name ~= "Placeholder" then
                    TweenService:Create(OtherTabButton, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme and SelectedTheme.ElementBackground or Color3.fromRGB(20, 20, 20), BackgroundTransparency = 0.7}):Play()
                    TweenService:Create(OtherTabButton.Image, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageColor3 = Color3.fromRGB(240, 240, 240)}):Play()
                    TweenService:Create(OtherTabButton.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Transparency = 0, Color = SelectedTheme and SelectedTheme.ElementStroke or Color3.fromRGB(40, 40, 40)}):Play()
                    TweenService:Create(OtherTabButton.Shadow, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageTransparency = 0.85}):Play()
                    TweenService:Create(OtherTabButton.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextColor3 = Color3.fromRGB(240, 240, 240), TextTransparency = 0.2}):Play()
                end
            end
            
            for _, OtherTabButton in ipairs(SideList:GetChildren()) do
                if OtherTabButton.Name ~= "Template" and OtherTabButton.Name ~= "SideTemplate" and OtherTabButton.ClassName == "Frame" and OtherTabButton ~= SideTabButton and OtherTabButton.Name ~= "Placeholder" then
                    TweenService:Create(OtherTabButton.Image, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageTransparency = 0, ImageColor3 = Color3.fromRGB(205, 205, 205)}):Play()
                    TweenService:Create(OtherTabButton.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0.2, TextColor3 = Color3.fromRGB(205, 205, 205)}):Play()
                end
            end
        end

        TopTabButton.Interact.MouseButton1Click:Connect(Pick)
        SideTabButton.Interact.MouseButton1Click:Connect(Pick)

                -- Section
        function Tab:CreateSection(SectionName, Display)
            local SectionValue = {
                Holder = nil,
                Open = true
            }
            local SectionDebounce = false
            local Section = Elements.Template.SectionTitle:Clone()
            SectionValue.Holder = Section.Holder
            Section.Title.Text = SectionName
            Section.Visible = true
            Section.Parent = TabPage

            Section.BackgroundTransparency = 1
            if Section:FindFirstChild("UIStroke") then
                Section.UIStroke.Transparency = 1
            end

            Tab.Elements[SectionName] = {
                type = 'section',
                display = Display,
                sectionholder = Section.Holder,
                element = Section
            }

            Section.Title.TextTransparency = 1
            Section.Title.TextColor3 = SelectedTheme and SelectedTheme.TextColor or Color3.fromRGB(230, 230, 230)
            TweenService:Create(Section.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()

            function SectionValue:Set(NewSection)
                Section.Title.Text = NewSection
            end

            if Display then
                if Section:FindFirstChild("_UIPadding_") then
                    Section._UIPadding_:Destroy()
                end
                Section.Holder.Visible = false
                Section.BackgroundTransparency = 1
                SectionValue.Holder.Parent = ArrayField.Holding
                if Section.Title:FindFirstChild("ImageButton") then
                    Section.Title.ImageButton.Visible = false
                end
            end

            if Section.Title:FindFirstChild("ImageButton") then
                Section.Title.ImageButton.MouseButton1Down:Connect(function()
                    if SectionDebounce then return end
                    if SectionValue.Open then
                        SectionDebounce = true
                        if Section:FindFirstChild("_UIPadding_") then
                            TweenService:Create(Section._UIPadding_, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {PaddingBottom = UDim.new(0, 0)}):Play()
                        end
                        for _, element in ipairs(Section.Holder:GetChildren()) do
                            if element.ClassName == "Frame" then
                                if element.Name ~= "SectionSpacing" and element.Name ~= "Placeholder" and element.Name ~= "Topholder" then
                                    if element.Name == "SectionTitle" then
                                        TweenService:Create(element.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
                                    else
                                        TweenService:Create(element, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
                                        if element:FindFirstChild("UIStroke") then
                                            TweenService:Create(element.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
                                        end
                                        if element:FindFirstChild("Title") then
                                            TweenService:Create(element.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
                                        end
                                    end
                                    for _, child in ipairs(element:GetChildren()) do
                                        if child.ClassName == "Frame" then
                                            child.Visible = false
                                        end
                                    end
                                end
                                element.Visible = false
                            end
                        end
                        TweenService:Create(Section.Title.ImageButton, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Rotation = 180}):Play()
                        SectionValue.Open = false
                        SectionDebounce = false
                    else
                        SectionDebounce = true
                        if Section:FindFirstChild("_UIPadding_") then
                            TweenService:Create(Section._UIPadding_, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {PaddingBottom = UDim.new(0, 8)}):Play()
                        end
                        for _, element in ipairs(Section.Holder:GetChildren()) do
                            if element.ClassName == "Frame" then
                                if element.Name ~= "SectionSpacing" and element.Name ~= "Placeholder" and element.Name ~= "Topholder" and not element:FindFirstChild("ColorPickerIs") then
                                    if element.Name == "SectionTitle" then
                                        TweenService:Create(element.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
                                    else
                                        TweenService:Create(element, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
                                        if element:FindFirstChild("UIStroke") then
                                            TweenService:Create(element.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
                                        end
                                        if element:FindFirstChild("Title") then
                                            TweenService:Create(element.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
                                        end
                                    end
                                    for _, child in ipairs(element:GetChildren()) do
                                        if child.ClassName == "Frame" or child.ClassName == "TextLabel" or child.ClassName == "TextBox" or child.ClassName == "ImageButton" or child.ClassName == "ImageLabel" then
                                            child.Visible = true
                                        end
                                    end
                                elseif element:FindFirstChild("ColorPickerIs") then
                                    TweenService:Create(element, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
                                    if element:FindFirstChild("UIStroke") then
                                        TweenService:Create(element.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
                                    end
                                    if element:FindFirstChild("Title") then
                                        TweenService:Create(element.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
                                    end
                                    if element.ColorPickerIs.Value then
                                        element.ColorSlider.Visible = true
                                        element.HexInput.Visible = true
                                        element.RGB.Visible = true
                                    end
                                    element.CPBackground.Visible = true
                                    element.Lock.Visible = true
                                    element.Interact.Visible = true
                                    element.Title.Visible = true
                                end
                                element.Visible = true
                            end
                        end
                        TweenService:Create(Section.Title.ImageButton, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Rotation = 0}):Play()
                        SectionValue.Open = true
                        task.wait(0.3)
                        SectionDebounce = false
                    end
                end)
            end

            SDone = true

            function SectionValue:Lock(Reason)
            end

            function SectionValue:Unlock(Reason)
            end

            return SectionValue
        end

        -- Spacing
        function Tab:CreateSpacing(SectionParent, Size)
            local Spacing = Elements.Template.SectionSpacing:Clone()
            Spacing.Visible = true
            Spacing.Size = UDim2.fromOffset(475, Size or 6)

            if SectionParent then
                Spacing.Parent = SectionParent.Holder
            else
                Spacing.Parent = TabPage
            end

            return Spacing
        end

        -- Button
        function Tab:CreateButton(ButtonSettings)
            local ButtonValue = {Locked = false}

            local Button = Elements.Template.Button:Clone()
            ButtonValue.Button = Button

            Tab.Elements[ButtonSettings.Name] = {
                type = 'button',
                section = ButtonSettings.SectionParent,
                element = Button
            }

            Button.Name = ButtonSettings.Name
            Button.Title.Text = ButtonSettings.Name
            Button.Visible = true

            Button.BackgroundTransparency = 1
            Button.UIStroke.Transparency = 1
            Button.Title.TextTransparency = 1

            if SelectedTheme then
                Button.BackgroundColor3 = SelectedTheme.ElementBackground
                Button.UIStroke.Color = SelectedTheme.ElementStroke
                Button.Title.TextColor3 = SelectedTheme.TextColor
            end

            if ButtonSettings.SectionParent then
                Button.Parent = ButtonSettings.SectionParent.Holder
            else
                Button.Parent = TabPage
            end

            TweenService:Create(Button, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
            TweenService:Create(Button.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
            TweenService:Create(Button.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()

            local DescriptionLabel = nil
            local DescriptionVisible = false
            local OriginalTitlePosition = Button.Title.Position

            if ButtonSettings.Description then
                DescriptionLabel = Instance.new("TextLabel")
                DescriptionLabel.Name = "DescriptionText"
                DescriptionLabel.ZIndex = 100
                DescriptionLabel.BackgroundTransparency = 1
                DescriptionLabel.Text = ButtonSettings.Description
                DescriptionLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
                DescriptionLabel.TextSize = 13
                DescriptionLabel.Font = Enum.Font.Gotham
                DescriptionLabel.TextXAlignment = Enum.TextXAlignment.Left
                DescriptionLabel.TextYAlignment = Enum.TextYAlignment.Center
                DescriptionLabel.TextWrapped = true
                DescriptionLabel.TextTransparency = 1
                DescriptionLabel.Visible = false
                DescriptionLabel.Parent = Button

                local textSize = game:GetService("TextService"):GetTextSize(ButtonSettings.Description, 13, Enum.Font.Gotham, Vector2.new(400, math.huge))
                DescriptionLabel.Size = UDim2.new(0, math.min(textSize.X + 20, 420), 0, math.max(textSize.Y + 4, 20))
                DescriptionLabel.Position = UDim2.new(0, 15, 0.46, 0)
            end

            Button.Interact.MouseButton1Click:Connect(function()
                if ButtonValue.Locked then return end

                local Success, Response = pcall(ButtonSettings.Callback)

                if not Button.Parent then return end

                if not Success then
                    TweenService:Create(Button, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = Color3.fromRGB(85, 0, 0)}):Play()
                    TweenService:Create(Button.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
                    Button.Title.Text = "Callback Error"
                    print("ArrayField | "..ButtonSettings.Name.." Callback Error " ..tostring(Response))
                    task.wait(0.5)
                    Button.Title.Text = ButtonSettings.Name
                    if SelectedTheme then
                        TweenService:Create(Button, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
                    end
                    TweenService:Create(Button.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
                else
                    SaveConfiguration()
                    if SelectedTheme then
                        TweenService:Create(Button, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
                    end
                    TweenService:Create(Button.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
                    task.wait(0.2)
                    if SelectedTheme then
                        TweenService:Create(Button, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
                    end
                    TweenService:Create(Button.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
                end
            end)

            Button.MouseEnter:Connect(function()
                if SelectedTheme then
                    TweenService:Create(Button, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
                end

                if ButtonSettings.Description and DescriptionLabel and not DescriptionVisible then
                    DescriptionVisible = true
                    DescriptionLabel.Visible = true

                    TweenService:Create(Button.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {
                        Position = UDim2.new(OriginalTitlePosition.X.Scale, OriginalTitlePosition.X.Offset, OriginalTitlePosition.Y.Scale, OriginalTitlePosition.Y.Offset - 15)
                    }):Play()

                    local newHeight = 40 + DescriptionLabel.AbsoluteSize.Y + 12
                    TweenService:Create(Button, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 465, 0, newHeight)}):Play()
                    TweenService:Create(DescriptionLabel, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
                end
            end)

            Button.MouseLeave:Connect(function()
                if SelectedTheme then
                    TweenService:Create(Button, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
                end

                if ButtonSettings.Description and DescriptionLabel and DescriptionVisible then
                    DescriptionVisible = false

                    TweenService:Create(Button.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Position = OriginalTitlePosition}):Play()
                    TweenService:Create(DescriptionLabel, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
                    TweenService:Create(Button, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 465, 0, 40)}):Play()

                    task.delay(0.3, function()
                        if not DescriptionVisible then
                            DescriptionLabel.Visible = false
                        end
                    end)
                end
            end)

            function ButtonValue:Set(NewButton)
                Button.Title.Text = NewButton
                Button.Name = NewButton
            end

            function ButtonValue:Lock(Reason)
                if ButtonValue.Locked then return end
                ButtonValue.Locked = true
                if Button:FindFirstChild("Lock") then
                    Button.Lock.Reason.Text = Reason or "Locked"
                    TweenService:Create(Button.Lock, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
                    TweenService:Create(Button.Lock.Reason, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
                    task.wait(0.2)
                    if ButtonValue.Locked and Button.Lock.Reason:FindFirstChild("Icon") then
                        TweenService:Create(Button.Lock.Reason.Icon, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {ImageTransparency = 0}):Play()
                    end
                end
            end

            function ButtonValue:Unlock()
                if not ButtonValue.Locked then return end
                ButtonValue.Locked = false
                if Button:FindFirstChild("Lock") then
                    task.wait(0.2)
                    if Button.Lock.Reason:FindFirstChild("Icon") then
                        TweenService:Create(Button.Lock.Reason.Icon, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
                    end
                    if not ButtonValue.Locked then
                        TweenService:Create(Button.Lock, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
                        TweenService:Create(Button.Lock.Reason, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
                    end
                end
            end

            function ButtonValue:Destroy()
                if DescriptionLabel then
                    DescriptionLabel:Destroy()
                end
                Button:Destroy()
            end

            function ButtonValue:Visible(bool)
                Button.Visible = bool
            end

            return ButtonValue
        end

        -- Toggle
        function Tab:CreateToggle(ToggleSettings)
            local Toggle = Elements.Template.Toggle:Clone()
            Toggle.Name = ToggleSettings.Name
            Toggle.Title.Text = ToggleSettings.Name
            Toggle.Visible = true

            Toggle.BackgroundTransparency = 1
            Toggle.UIStroke.Transparency = 1
            Toggle.Title.TextTransparency = 1

            if SelectedTheme then
                Toggle.BackgroundColor3 = SelectedTheme.ElementBackground
                Toggle.UIStroke.Color = SelectedTheme.ElementStroke
                Toggle.Title.TextColor3 = SelectedTheme.TextColor
                Toggle.Switch.BackgroundColor3 = SelectedTheme.ToggleBackground
            end

            Tab.Elements[ToggleSettings.Name] = {
                type = 'toggle',
                section = ToggleSettings.SectionParent,
                element = Toggle
            }

            if ToggleSettings.SectionParent then
                Toggle.Parent = ToggleSettings.SectionParent.Holder
            else
                Toggle.Parent = TabPage
            end

            ToggleSettings.Locked = false

            if SelectedTheme and SelectedTheme ~= ArrayFieldLibrary.Theme.Default then
                if Toggle.Switch:FindFirstChild("Shadow") then
                    Toggle.Switch.Shadow.Visible = false
                end
            end

            TweenService:Create(Toggle, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
            TweenService:Create(Toggle.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
            TweenService:Create(Toggle.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()

            local DescriptionLabel = nil
            local DescriptionVisible = false
            local OriginalTitlePosition = Toggle.Title.Position

            if ToggleSettings.Description then
                DescriptionLabel = Instance.new("TextLabel")
                DescriptionLabel.Name = "DescriptionText"
                DescriptionLabel.ZIndex = 100
                DescriptionLabel.BackgroundTransparency = 1
                DescriptionLabel.Text = ToggleSettings.Description
                DescriptionLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
                DescriptionLabel.TextSize = 13
                DescriptionLabel.Font = Enum.Font.Gotham
                DescriptionLabel.TextXAlignment = Enum.TextXAlignment.Left
                DescriptionLabel.TextYAlignment = Enum.TextYAlignment.Center
                DescriptionLabel.TextWrapped = true
                DescriptionLabel.TextTransparency = 1
                DescriptionLabel.Visible = false
                DescriptionLabel.Parent = Toggle

                local textSize = game:GetService("TextService"):GetTextSize(ToggleSettings.Description, 13, Enum.Font.Gotham, Vector2.new(400, math.huge))
                DescriptionLabel.Size = UDim2.new(0, math.min(textSize.X + 20, 420), 0, math.max(textSize.Y + 4, 20))
                DescriptionLabel.Position = UDim2.new(0, 15, 0.46, 0)
            end

            if not ToggleSettings.CurrentValue then
                Toggle.Switch.Indicator.Position = UDim2.new(1, -40, 0.5, 0)
                if SelectedTheme then
                    Toggle.Switch.Indicator.UIStroke.Color = SelectedTheme.ToggleDisabledStroke
                    Toggle.Switch.Indicator.BackgroundColor3 = SelectedTheme.ToggleDisabled
                    Toggle.Switch.UIStroke.Color = SelectedTheme.ToggleDisabledOuterStroke
                end
            else
                Toggle.Switch.Indicator.Position = UDim2.new(1, -20, 0.5, 0)
                if SelectedTheme then
                    Toggle.Switch.Indicator.UIStroke.Color = SelectedTheme.ToggleEnabledStroke
                    Toggle.Switch.Indicator.BackgroundColor3 = SelectedTheme.ToggleEnabled
                    Toggle.Switch.UIStroke.Color = SelectedTheme.ToggleEnabledOuterStroke
                end
            end

            Toggle.MouseEnter:Connect(function()
                if SelectedTheme then
                    TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
                end

                if ToggleSettings.Description and DescriptionLabel and not DescriptionVisible then
                    DescriptionVisible = true
                    DescriptionLabel.Visible = true

                    TweenService:Create(Toggle.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {
                        Position = UDim2.new(OriginalTitlePosition.X.Scale, OriginalTitlePosition.X.Offset, OriginalTitlePosition.Y.Scale, OriginalTitlePosition.Y.Offset - 15)
                    }):Play()

                    local newHeight = 40 + DescriptionLabel.AbsoluteSize.Y + 12
                    TweenService:Create(Toggle, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 465, 0, newHeight)}):Play()
                    TweenService:Create(DescriptionLabel, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
                end
            end)

            Toggle.MouseLeave:Connect(function()
                if SelectedTheme then
                    TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
                end

                if ToggleSettings.Description and DescriptionLabel and DescriptionVisible then
                    DescriptionVisible = false

                    TweenService:Create(Toggle.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Position = OriginalTitlePosition}):Play()
                    TweenService:Create(DescriptionLabel, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
                    TweenService:Create(Toggle, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 465, 0, 40)}):Play()

                    task.delay(0.3, function()
                        if not DescriptionVisible then
                            DescriptionLabel.Visible = false
                        end
                    end)
                end
            end)

            Toggle.Interact.MouseButton1Click:Connect(function()
                if ToggleSettings.Locked then return end

                if ToggleSettings.CurrentValue then
                    ToggleSettings.CurrentValue = false
                    if SelectedTheme then
                        TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
                    end
                    TweenService:Create(Toggle.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
                    TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.45, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2.new(1, -40, 0.5, 0)}):Play()
                    TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0, 12, 0, 12)}):Play()
                    if SelectedTheme then
                        TweenService:Create(Toggle.Switch.Indicator.UIStroke, TweenInfo.new(0.55, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Color = SelectedTheme.ToggleDisabledStroke}):Play()
                        TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.8, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundColor3 = SelectedTheme.ToggleDisabled}):Play()
                        TweenService:Create(Toggle.Switch.UIStroke, TweenInfo.new(0.55, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Color = SelectedTheme.ToggleDisabledOuterStroke}):Play()
                    end
                    task.wait(0.05)
                    TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0, 17, 0, 17)}):Play()
                    task.wait(0.15)
                    if SelectedTheme then
                        TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
                    end
                    TweenService:Create(Toggle.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
                else
                    ToggleSettings.CurrentValue = true
                    if SelectedTheme then
                        TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
                    end
                    TweenService:Create(Toggle.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
                    TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2.new(1, -20, 0.5, 0)}):Play()
                    TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0, 12, 0, 12)}):Play()
                    if SelectedTheme then
                        TweenService:Create(Toggle.Switch.Indicator.UIStroke, TweenInfo.new(0.55, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Color = SelectedTheme.ToggleEnabledStroke}):Play()
                        TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.8, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundColor3 = SelectedTheme.ToggleEnabled}):Play()
                        TweenService:Create(Toggle.Switch.UIStroke, TweenInfo.new(0.55, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Color = SelectedTheme.ToggleEnabledOuterStroke}):Play()
                    end
                    task.wait(0.05)
                    TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.45, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0, 17, 0, 17)}):Play()
                    task.wait(0.15)
                    if SelectedTheme then
                        TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
                    end
                    TweenService:Create(Toggle.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
                end

                local Success, Response = pcall(function()
                    ToggleSettings.Callback(ToggleSettings.CurrentValue)
                end)

                if not Success then
                    TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = Color3.fromRGB(85, 0, 0)}):Play()
                    TweenService:Create(Toggle.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
                    Toggle.Title.Text = "Callback Error"
                    print("ArrayField | "..ToggleSettings.Name.." Callback Error " ..tostring(Response))
                    task.wait(0.5)
                    Toggle.Title.Text = ToggleSettings.Name
                    if SelectedTheme then
                        TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
                    end
                    TweenService:Create(Toggle.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
                end

                SaveConfiguration()
            end)

            function ToggleSettings:Set(NewValue)
                if NewValue then
                    ToggleSettings.CurrentValue = true
                    TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2.new(1, -20, 0.5, 0)}):Play()
                    TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0, 12, 0, 12)}):Play()
                    if SelectedTheme then
                        TweenService:Create(Toggle.Switch.Indicator.UIStroke, TweenInfo.new(0.55, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Color = SelectedTheme.ToggleEnabledStroke}):Play()
                        TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.8, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundColor3 = SelectedTheme.ToggleEnabled}):Play()
                        TweenService:Create(Toggle.Switch.UIStroke, TweenInfo.new(0.55, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Color = SelectedTheme.ToggleEnabledOuterStroke}):Play()
                    end
                    task.wait(0.05)
                    TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.45, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0, 17, 0, 17)}):Play()
                else
                    ToggleSettings.CurrentValue = false
                    TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.45, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2.new(1, -40, 0.5, 0)}):Play()
                    TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0, 12, 0, 12)}):Play()
                    if SelectedTheme then
                        TweenService:Create(Toggle.Switch.Indicator.UIStroke, TweenInfo.new(0.55, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Color = SelectedTheme.ToggleDisabledStroke}):Play()
                        TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.8, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundColor3 = SelectedTheme.ToggleDisabled}):Play()
                        TweenService:Create(Toggle.Switch.UIStroke, TweenInfo.new(0.55, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Color = SelectedTheme.ToggleDisabledOuterStroke}):Play()
                    end
                    task.wait(0.05)
                    TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0, 17, 0, 17)}):Play()
                end

                local Success, Response = pcall(function()
                    ToggleSettings.Callback(ToggleSettings.CurrentValue)
                end)

                if not Success then
                    TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = Color3.fromRGB(85, 0, 0)}):Play()
                    Toggle.Title.Text = "Callback Error"
                    print("ArrayField | "..ToggleSettings.Name.." Callback Error " ..tostring(Response))
                    task.wait(0.5)
                    Toggle.Title.Text = ToggleSettings.Name
                    if SelectedTheme then
                        TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
                    end
                end

                SaveConfiguration()
            end

            function ToggleSettings:Lock(Reason)
                if ToggleSettings.Locked then return end
                ToggleSettings.Locked = true
                if Toggle:FindFirstChild("Lock") then
                    Toggle.Lock.Reason.Text = Reason or "Locked"
                    TweenService:Create(Toggle.Lock, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
                    TweenService:Create(Toggle.Lock.Reason, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
                    task.wait(0.2)
                    if ToggleSettings.Locked and Toggle.Lock.Reason:FindFirstChild("Icon") then
                        TweenService:Create(Toggle.Lock.Reason.Icon, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {ImageTransparency = 0}):Play()
                    end
                end
            end

            function ToggleSettings:Unlock()
                if not ToggleSettings.Locked then return end
                ToggleSettings.Locked = false
                if Toggle:FindFirstChild("Lock") then
                    task.wait(0.2)
                    if Toggle.Lock.Reason:FindFirstChild("Icon") then
                        TweenService:Create(Toggle.Lock.Reason.Icon, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
                    end
                    if not ToggleSettings.Locked then
                        TweenService:Create(Toggle.Lock, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
                        TweenService:Create(Toggle.Lock.Reason, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
                    end
                end
            end

            function ToggleSettings:Destroy()
                if DescriptionLabel then
                    DescriptionLabel:Destroy()
                end
                Toggle:Destroy()
            end

            function ToggleSettings:Visible(bool)
                Toggle.Visible = bool
            end

            if Settings.ConfigurationSaving then
                if Settings.ConfigurationSaving.Enabled and ToggleSettings.Flag then
                    ArrayFieldLibrary.Flags[ToggleSettings.Flag] = ToggleSettings
                end
            end

            return ToggleSettings
        end
        -- Slider
        function Tab:CreateSlider(SliderSettings)
            local Dragging = false
            local Slider = Elements.Template.Slider:Clone()
            Slider.Name = SliderSettings.Name
            Slider.Title.Text = SliderSettings.Name
            Slider.Visible = true

            Tab.Elements[SliderSettings.Name] = {
                type = 'slider',
                section = SliderSettings.SectionParent,
                element = Slider
            }

            if SliderSettings.SectionParent then
                Slider.Parent = SliderSettings.SectionParent.Holder
            else
                Slider.Parent = TabPage
            end

            Slider.BackgroundTransparency = 1
            Slider.UIStroke.Transparency = 1
            Slider.Title.TextTransparency = 1

            if SelectedTheme then
                Slider.BackgroundColor3 = SelectedTheme.ElementBackground
                Slider.UIStroke.Color = SelectedTheme.ElementStroke
                Slider.Title.TextColor3 = SelectedTheme.TextColor
                Slider.Main.BackgroundColor3 = SelectedTheme.SliderBackground
                Slider.Main.UIStroke.Color = SelectedTheme.SliderStroke
                Slider.Main.Progress.BackgroundColor3 = SelectedTheme.SliderProgress or SelectedTheme.Accent
                Slider.Main.Information.TextColor3 = SelectedTheme.TextColor

                if SelectedTheme ~= ArrayFieldLibrary.Theme.Default then
                    if Slider.Main:FindFirstChild("Shadow") then
                        Slider.Main.Shadow.Visible = false
                    end
                end
            end

            local DescriptionLabel = nil
            local DescriptionVisible = false

            if SliderSettings.Description then
                DescriptionLabel = Instance.new("TextLabel")
                DescriptionLabel.Name = "DescriptionText"
                DescriptionLabel.ZIndex = 100
                DescriptionLabel.BackgroundTransparency = 1
                DescriptionLabel.Text = SliderSettings.Description
                DescriptionLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
                DescriptionLabel.TextSize = 13
                DescriptionLabel.Font = Enum.Font.Gotham
                DescriptionLabel.TextXAlignment = Enum.TextXAlignment.Left
                DescriptionLabel.TextWrapped = true
                DescriptionLabel.TextTransparency = 1
                DescriptionLabel.Visible = false
                DescriptionLabel.Parent = Slider

                local textSize = game:GetService("TextService"):GetTextSize(SliderSettings.Description, 13, Enum.Font.Gotham, Vector2.new(400, math.huge))
                DescriptionLabel.Size = UDim2.new(0, math.min(textSize.X + 20, 420), 0, math.max(textSize.Y + 4, 20))
                DescriptionLabel.Position = UDim2.new(0, 15, 0.52, 0)
            end

            TweenService:Create(Slider, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
            TweenService:Create(Slider.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
            TweenService:Create(Slider.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()

            Slider.Main.Progress.Size = UDim2.new(0, Slider.Main.AbsoluteSize.X * ((SliderSettings.CurrentValue - SliderSettings.Range[1]) / (SliderSettings.Range[2] - SliderSettings.Range[1])) > 5 and Slider.Main.AbsoluteSize.X * ((SliderSettings.CurrentValue - SliderSettings.Range[1]) / (SliderSettings.Range[2] - SliderSettings.Range[1])) or 5, 1, 0)

            if SliderSettings.Suffix then
                Slider.Main.Information.Text = tostring(SliderSettings.CurrentValue) .. " " .. SliderSettings.Suffix
            else
                Slider.Main.Information.Text = tostring(SliderSettings.CurrentValue)
            end

            Slider.MouseEnter:Connect(function()
                if SelectedTheme then
                    TweenService:Create(Slider, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
                end

                if SliderSettings.Description and DescriptionLabel and not DescriptionVisible then
                    DescriptionVisible = true
                    DescriptionLabel.Visible = true
                    TweenService:Create(Slider, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 465, 0, 45 + DescriptionLabel.AbsoluteSize.Y + 12)}):Play()
                    TweenService:Create(DescriptionLabel, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
                end
            end)

            Slider.MouseLeave:Connect(function()
                if SelectedTheme then
                    TweenService:Create(Slider, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
                end

                if SliderSettings.Description and DescriptionLabel and DescriptionVisible then
                    DescriptionVisible = false
                    TweenService:Create(DescriptionLabel, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
                    TweenService:Create(Slider, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 465, 0, 45)}):Play()
                    task.delay(0.3, function()
                        if not DescriptionVisible then DescriptionLabel.Visible = false end
                    end)
                end
            end)

            Slider.Main.Interact.MouseLeave:Connect(function()
                Dragging = false
            end)

            local function UpdateSlider(X)
                local Current = Slider.Main.Progress.AbsolutePosition.X + Slider.Main.Progress.AbsoluteSize.X
                local Start = Current
                local Location = X

                Location = UserInputService:GetMouseLocation().X
                Current = Current + 0.025 * (Location - Start)

                if Location < Slider.Main.AbsolutePosition.X then
                    Location = Slider.Main.AbsolutePosition.X
                elseif Location > Slider.Main.AbsolutePosition.X + Slider.Main.AbsoluteSize.X then
                    Location = Slider.Main.AbsolutePosition.X + Slider.Main.AbsoluteSize.X
                end

                if Current < Slider.Main.AbsolutePosition.X + 5 then
                    Current = Slider.Main.AbsolutePosition.X + 5
                elseif Current > Slider.Main.AbsolutePosition.X + Slider.Main.AbsoluteSize.X then
                    Current = Slider.Main.AbsolutePosition.X + Slider.Main.AbsoluteSize.X
                end

                if Current <= Location and (Location - Start) < 0 then
                    Start = Location
                elseif Current >= Location and (Location - Start) > 0 then
                    Start = Location
                end

                TweenService:Create(Slider.Main.Progress, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(0, Location - Slider.Main.AbsolutePosition.X > 5 and Location - Slider.Main.AbsolutePosition.X or 5, 1, 0)}):Play()

                local NewValue = SliderSettings.Range[1] + (Location - Slider.Main.AbsolutePosition.X) / Slider.Main.AbsoluteSize.X * (SliderSettings.Range[2] - SliderSettings.Range[1])
                NewValue = math.floor(NewValue / SliderSettings.Increment + 0.5) * (SliderSettings.Increment * 10000000) / 10000000

                if SliderSettings.Suffix then
                    Slider.Main.Information.Text = tostring(NewValue) .. " " .. SliderSettings.Suffix
                else
                    Slider.Main.Information.Text = tostring(NewValue)
                end

                if SliderSettings.CurrentValue ~= NewValue then
                    local Success, Response = pcall(function()
                        SliderSettings.Callback(NewValue)
                    end)

                    if not Success then
                        TweenService:Create(Slider, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = Color3.fromRGB(85, 0, 0)}):Play()
                        TweenService:Create(Slider.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
                        Slider.Title.Text = "Callback Error"
                        print("ArrayField | "..SliderSettings.Name.." Callback Error " ..tostring(Response))
                        task.wait(0.5)
                        Slider.Title.Text = SliderSettings.Name
                        if SelectedTheme then
                            TweenService:Create(Slider, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
                        end
                        TweenService:Create(Slider.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
                    end

                    SliderSettings.CurrentValue = NewValue
                    SaveConfiguration()
                end
            end

            Slider.Main.Interact.MouseButton1Down:Connect(function(X)
                if not SliderSettings.Locked then
                    UpdateSlider(X)
                    Dragging = true
                end
            end)

            Slider.Main.Interact.MouseButton1Up:Connect(function()
                Dragging = false
            end)

            Slider.Main.Interact.MouseMoved:Connect(function(X)
                if SliderSettings.Locked then return end
                if Dragging then
                    UpdateSlider(X)
                end
            end)

            function SliderSettings:Set(NewVal)
                TweenService:Create(Slider.Main.Progress, TweenInfo.new(0.45, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Size = UDim2.new(0, Slider.Main.AbsoluteSize.X * ((NewVal - SliderSettings.Range[1]) / (SliderSettings.Range[2] - SliderSettings.Range[1])) > 5 and Slider.Main.AbsoluteSize.X * ((NewVal - SliderSettings.Range[1]) / (SliderSettings.Range[2] - SliderSettings.Range[1])) or 5, 1, 0)}):Play()

                if SliderSettings.Suffix then
                    Slider.Main.Information.Text = tostring(NewVal) .. " " .. SliderSettings.Suffix
                else
                    Slider.Main.Information.Text = tostring(NewVal)
                end

                local Success, Response = pcall(function()
                    SliderSettings.Callback(NewVal)
                end)

                if not Success then
                    TweenService:Create(Slider, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = Color3.fromRGB(85, 0, 0)}):Play()
                    TweenService:Create(Slider.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
                    Slider.Title.Text = "Callback Error"
                    print("ArrayField | "..SliderSettings.Name.." Callback Error " ..tostring(Response))
                    task.wait(0.5)
                    Slider.Title.Text = SliderSettings.Name
                    if SelectedTheme then
                        TweenService:Create(Slider, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
                    end
                    TweenService:Create(Slider.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
                end

                SliderSettings.CurrentValue = NewVal
                SaveConfiguration()
            end

            function SliderSettings:Lock(Reason)
                if SliderSettings.Locked then return end
                SliderSettings.Locked = true
                if Slider:FindFirstChild("Lock") then
                    Slider.Lock.Reason.Text = Reason or "Locked"
                    TweenService:Create(Slider.Lock, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
                    TweenService:Create(Slider.Lock.Reason, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
                    task.wait(0.2)
                    if SliderSettings.Locked and Slider.Lock.Reason:FindFirstChild("Icon") then
                        TweenService:Create(Slider.Lock.Reason.Icon, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {ImageTransparency = 0}):Play()
                    end
                end
            end

            function SliderSettings:Unlock()
                if not SliderSettings.Locked then return end
                SliderSettings.Locked = false
                if Slider:FindFirstChild("Lock") then
                    task.wait(0.2)
                    if Slider.Lock.Reason:FindFirstChild("Icon") then
                        TweenService:Create(Slider.Lock.Reason.Icon, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
                    end
                    if not SliderSettings.Locked then
                        TweenService:Create(Slider.Lock, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
                        TweenService:Create(Slider.Lock.Reason, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
                    end
                end
            end

            function SliderSettings:Destroy()
                Slider:Destroy()
            end

            function SliderSettings:Visible(bool)
                Slider.Visible = bool
            end

            if Settings.ConfigurationSaving then
                if Settings.ConfigurationSaving.Enabled and SliderSettings.Flag then
                    ArrayFieldLibrary.Flags[SliderSettings.Flag] = SliderSettings
                end
            end

            return SliderSettings
        end
        -- Input
        function Tab:CreateInput(InputSettings)
            local Input = Elements.Template.Input:Clone()
            Input.Name = InputSettings.Name
            Input.Title.Text = InputSettings.Name
            Input.Visible = true
            InputSettings.Locked = false

            Tab.Elements[InputSettings.Name] = {
                type = 'input',
                section = InputSettings.SectionParent,
                element = Input
            }

            if InputSettings.SectionParent then
                Input.Parent = InputSettings.SectionParent.Holder
            else
                Input.Parent = TabPage
            end

            Input.BackgroundTransparency = 1
            Input.UIStroke.Transparency = 1
            Input.Title.TextTransparency = 1

            if SelectedTheme then
                Input.BackgroundColor3 = SelectedTheme.ElementBackground
                Input.UIStroke.Color = SelectedTheme.ElementStroke
                Input.Title.TextColor3 = SelectedTheme.TextColor
                Input.InputFrame.BackgroundColor3 = SelectedTheme.InputBackground
                Input.InputFrame.UIStroke.Color = SelectedTheme.InputStroke
            end

            local DescriptionLabel = nil
            local DescriptionVisible = false
            local OriginalTitlePosition = Input.Title.Position

            if InputSettings.Description then
                DescriptionLabel = Instance.new("TextLabel")
                DescriptionLabel.Name = "DescriptionText"
                DescriptionLabel.ZIndex = 100
                DescriptionLabel.BackgroundTransparency = 1
                DescriptionLabel.Text = InputSettings.Description
                DescriptionLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
                DescriptionLabel.TextSize = 13
                DescriptionLabel.Font = Enum.Font.Gotham
                DescriptionLabel.TextXAlignment = Enum.TextXAlignment.Left
                DescriptionLabel.TextYAlignment = Enum.TextYAlignment.Center
                DescriptionLabel.TextWrapped = true
                DescriptionLabel.TextTransparency = 1
                DescriptionLabel.Visible = false
                DescriptionLabel.Parent = Input

                local textSize = game:GetService("TextService"):GetTextSize(InputSettings.Description, 13, Enum.Font.Gotham, Vector2.new(400, math.huge))
                DescriptionLabel.Size = UDim2.new(0, math.min(textSize.X + 20, 420), 0, math.max(textSize.Y + 4, 20))
                DescriptionLabel.Position = UDim2.new(0, 15, 0.46, 0)
            end

            TweenService:Create(Input, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
            TweenService:Create(Input.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
            TweenService:Create(Input.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()

            Input.InputFrame.InputBox.PlaceholderText = InputSettings.PlaceholderText or ""
            Input.InputFrame.Size = UDim2.new(0, Input.InputFrame.InputBox.TextBounds.X + 24, 0, 30)

            if InputSettings.NumbersOnly or InputSettings.CharacterLimit then
                Input.InputFrame.InputBox:GetPropertyChangedSignal("Text"):Connect(function()
                    if Input.InputFrame.InputBox.Text == "" then return end
                    if InputSettings.CharacterLimit then
                        Input.InputFrame.InputBox.Text = Input.InputFrame.InputBox.Text:sub(1, InputSettings.CharacterLimit)
                    end
                    if InputSettings.NumbersOnly then
                        Input.InputFrame.InputBox.Text = Input.InputFrame.InputBox.Text:gsub("%D+", "")
                    end
                end)
            end

            Input.InputFrame.InputBox.FocusLost:Connect(function(enter)
                if InputSettings.OnEnter and not enter then
                    if InputSettings.RemoveTextAfterFocusLost then
                        Input.InputFrame.InputBox.Text = ""
                    end
                    return
                end

                local Success, Response = pcall(function()
                    InputSettings.Callback(Input.InputFrame.InputBox.Text)
                end)

                if not Success then
                    TweenService:Create(Input, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = Color3.fromRGB(85, 0, 0)}):Play()
                    TweenService:Create(Input.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
                    Input.Title.Text = "Callback Error"
                    print("ArrayField | "..InputSettings.Name.." Callback Error " ..tostring(Response))
                    task.wait(0.5)
                    Input.Title.Text = InputSettings.Name
                    if SelectedTheme then
                        TweenService:Create(Input, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
                    end
                    TweenService:Create(Input.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
                end

                if InputSettings.RemoveTextAfterFocusLost then
                    Input.InputFrame.InputBox.Text = ""
                end

                SaveConfiguration()
            end)

            Input.MouseEnter:Connect(function()
                if SelectedTheme then
                    TweenService:Create(Input, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
                end

                if InputSettings.Description and DescriptionLabel and not DescriptionVisible then
                    DescriptionVisible = true
                    DescriptionLabel.Visible = true

                    TweenService:Create(Input.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {
                        Position = UDim2.new(OriginalTitlePosition.X.Scale, OriginalTitlePosition.X.Offset, OriginalTitlePosition.Y.Scale, OriginalTitlePosition.Y.Offset - 15)
                    }):Play()

                    local newHeight = 40 + DescriptionLabel.AbsoluteSize.Y + 12
                    TweenService:Create(Input, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 465, 0, newHeight)}):Play()
                    TweenService:Create(DescriptionLabel, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
                end
            end)

            Input.MouseLeave:Connect(function()
                if SelectedTheme then
                    TweenService:Create(Input, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
                end

                if InputSettings.Description and DescriptionLabel and DescriptionVisible then
                    DescriptionVisible = false

                    TweenService:Create(Input.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Position = OriginalTitlePosition}):Play()
                    TweenService:Create(DescriptionLabel, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
                    TweenService:Create(Input, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 465, 0, 40)}):Play()

                    task.delay(0.3, function()
                        if not DescriptionVisible then
                            DescriptionLabel.Visible = false
                        end
                    end)
                end
            end)

            Input.InputFrame.InputBox:GetPropertyChangedSignal("Text"):Connect(function()
                TweenService:Create(Input.InputFrame, TweenInfo.new(0.55, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Size = UDim2.new(0, Input.InputFrame.InputBox.TextBounds.X + 24, 0, 30)}):Play()
            end)

            Input.InputFrame.InputBox.Focused:Connect(function()
                if InputSettings.Locked then
                    Input.InputFrame.InputBox:ReleaseFocus()
                    return
                end
            end)

            function InputSettings:Set(NewText)
                Input.InputFrame.InputBox.Text = NewText
            end

            function InputSettings:Lock(Reason)
                if InputSettings.Locked then return end
                InputSettings.Locked = true
                if Input:FindFirstChild("Lock") then
                    Input.Lock.Reason.Text = Reason or "Locked"
                    TweenService:Create(Input.Lock, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
                    TweenService:Create(Input.Lock.Reason, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
                    task.wait(0.2)
                    if InputSettings.Locked and Input.Lock.Reason:FindFirstChild("Icon") then
                        TweenService:Create(Input.Lock.Reason.Icon, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {ImageTransparency = 0}):Play()
                    end
                end
            end

            function InputSettings:Unlock()
                if not InputSettings.Locked then return end
                InputSettings.Locked = false
                if Input:FindFirstChild("Lock") then
                    task.wait(0.2)
                    if Input.Lock.Reason:FindFirstChild("Icon") then
                        TweenService:Create(Input.Lock.Reason.Icon, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
                    end
                    if not InputSettings.Locked then
                        TweenService:Create(Input.Lock, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
                        TweenService:Create(Input.Lock.Reason, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
                    end
                end
            end

            function InputSettings:Destroy()
                Input:Destroy()
            end

            function InputSettings:Visible(bool)
                Input.Visible = bool
            end

            return InputSettings
        end

        -- Keybind
        function Tab:CreateKeybind(KeybindSettings)
            local CheckingForKey = false
            local Keybind = Elements.Template.Keybind:Clone()
            Keybind.Name = KeybindSettings.Name
            Keybind.Title.Text = KeybindSettings.Name
            Keybind.Visible = true

            Tab.Elements[KeybindSettings.Name] = {
                type = 'keybind',
                section = KeybindSettings.SectionParent,
                element = Keybind
            }

            if KeybindSettings.SectionParent then
                Keybind.Parent = KeybindSettings.SectionParent.Holder
            else
                Keybind.Parent = TabPage
            end

            Keybind.BackgroundTransparency = 1
            Keybind.UIStroke.Transparency = 1
            Keybind.Title.TextTransparency = 1

            if SelectedTheme then
                Keybind.BackgroundColor3 = SelectedTheme.ElementBackground
                Keybind.UIStroke.Color = SelectedTheme.ElementStroke
                Keybind.Title.TextColor3 = SelectedTheme.TextColor
                Keybind.KeybindFrame.BackgroundColor3 = SelectedTheme.InputBackground
                Keybind.KeybindFrame.UIStroke.Color = SelectedTheme.InputStroke
            end

            local DescriptionLabel = nil
            local DescriptionVisible = false
            local OriginalTitlePosition = Keybind.Title.Position

            if KeybindSettings.Description then
                DescriptionLabel = Instance.new("TextLabel")
                DescriptionLabel.Name = "DescriptionText"
                DescriptionLabel.ZIndex = 100
                DescriptionLabel.BackgroundTransparency = 1
                DescriptionLabel.Text = KeybindSettings.Description
                DescriptionLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
                DescriptionLabel.TextSize = 13
                DescriptionLabel.Font = Enum.Font.Gotham
                DescriptionLabel.TextXAlignment = Enum.TextXAlignment.Left
                DescriptionLabel.TextYAlignment = Enum.TextYAlignment.Center
                DescriptionLabel.TextWrapped = true
                DescriptionLabel.TextTransparency = 1
                DescriptionLabel.Visible = false
                DescriptionLabel.Parent = Keybind

                local textSize = game:GetService("TextService"):GetTextSize(KeybindSettings.Description, 13, Enum.Font.Gotham, Vector2.new(400, math.huge))
                DescriptionLabel.Size = UDim2.new(0, math.min(textSize.X + 20, 420), 0, math.max(textSize.Y + 4, 20))
                DescriptionLabel.Position = UDim2.new(0, 15, 0.46, 0)
            end

            TweenService:Create(Keybind, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
            TweenService:Create(Keybind.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
            TweenService:Create(Keybind.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()

            Keybind.KeybindFrame.KeybindBox.Text = KeybindSettings.CurrentKeybind or ""
            Keybind.KeybindFrame.Size = UDim2.new(0, Keybind.KeybindFrame.KeybindBox.TextBounds.X + 24, 0, 30)

            Keybind.KeybindFrame.KeybindBox.Focused:Connect(function()
                if KeybindSettings.Locked then
                    Keybind.KeybindFrame.KeybindBox:ReleaseFocus()
                    return
                end
                CheckingForKey = true
                Keybind.KeybindFrame.KeybindBox.Text = ""
            end)

            Keybind.KeybindFrame.KeybindBox.FocusLost:Connect(function()
                CheckingForKey = false
                if Keybind.KeybindFrame.KeybindBox.Text == nil or Keybind.KeybindFrame.KeybindBox.Text == "" then
                    Keybind.KeybindFrame.KeybindBox.Text = KeybindSettings.CurrentKeybind or ""
                    SaveConfiguration()
                                end
            end)

            Keybind.MouseEnter:Connect(function()
                if SelectedTheme then
                    TweenService:Create(Keybind, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
                end

                if KeybindSettings.Description and DescriptionLabel and not DescriptionVisible then
                    DescriptionVisible = true
                    DescriptionLabel.Visible = true

                    TweenService:Create(Keybind.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {
                        Position = UDim2.new(OriginalTitlePosition.X.Scale, OriginalTitlePosition.X.Offset, OriginalTitlePosition.Y.Scale, OriginalTitlePosition.Y.Offset - 15)
                    }):Play()

                    local newHeight = 40 + DescriptionLabel.AbsoluteSize.Y + 12
                    TweenService:Create(Keybind, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 465, 0, newHeight)}):Play()
                    TweenService:Create(DescriptionLabel, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
                end
            end)

            Keybind.MouseLeave:Connect(function()
                if SelectedTheme then
                    TweenService:Create(Keybind, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
                end

                if KeybindSettings.Description and DescriptionLabel and DescriptionVisible then
                    DescriptionVisible = false

                    TweenService:Create(Keybind.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Position = OriginalTitlePosition}):Play()
                    TweenService:Create(DescriptionLabel, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
                    TweenService:Create(Keybind, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 465, 0, 40)}):Play()

                    task.delay(0.3, function()
                        if not DescriptionVisible then
                            DescriptionLabel.Visible = false
                        end
                    end)
                end
            end)

            UserInputService.InputBegan:Connect(function(input, processed)
                if CheckingForKey then
                    if input.KeyCode ~= Enum.KeyCode.Unknown and input.KeyCode ~= Enum.KeyCode.RightShift then
                        local SplitMessage = string.split(tostring(input.KeyCode), ".")
                        local NewKeyNoEnum = SplitMessage[3]
                        Keybind.KeybindFrame.KeybindBox.Text = tostring(NewKeyNoEnum)
                        KeybindSettings.CurrentKeybind = tostring(NewKeyNoEnum)
                        Keybind.KeybindFrame.KeybindBox:ReleaseFocus()
                        SaveConfiguration()
                    end
                elseif KeybindSettings.CurrentKeybind ~= nil and (input.KeyCode == Enum.KeyCode[KeybindSettings.CurrentKeybind] and not processed) then
                    local Held = true
                    local Connection
                    Connection = input.Changed:Connect(function(prop)
                        if prop == "UserInputState" then
                            Connection:Disconnect()
                            Held = false
                        end
                    end)

                    if not KeybindSettings.HoldToInteract then
                        local Success, Response = pcall(KeybindSettings.Callback)
                        if not Success then
                            TweenService:Create(Keybind, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = Color3.fromRGB(85, 0, 0)}):Play()
                            TweenService:Create(Keybind.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
                            Keybind.Title.Text = "Callback Error"
                            print("ArrayField | "..KeybindSettings.Name.." Callback Error " ..tostring(Response))
                            task.wait(0.5)
                            Keybind.Title.Text = KeybindSettings.Name
                            if SelectedTheme then
                                TweenService:Create(Keybind, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
                            end
                            TweenService:Create(Keybind.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
                        end
                    else
                        task.wait(0.25)
                        if Held then
                            local Loop
                            Loop = RunService.Stepped:Connect(function()
                                if not Held then
                                    KeybindSettings.Callback(false)
                                    Loop:Disconnect()
                                else
                                    KeybindSettings.Callback(true)
                                end
                            end)
                        end
                    end
                end
            end)

            Keybind.KeybindFrame.KeybindBox:GetPropertyChangedSignal("Text"):Connect(function()
                TweenService:Create(Keybind.KeybindFrame, TweenInfo.new(0.55, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Size = UDim2.new(0, Keybind.KeybindFrame.KeybindBox.TextBounds.X + 24, 0, 30)}):Play()
            end)

            function KeybindSettings:Set(NewKeybind)
                Keybind.KeybindFrame.KeybindBox.Text = tostring(NewKeybind)
                KeybindSettings.CurrentKeybind = tostring(NewKeybind)
                Keybind.KeybindFrame.KeybindBox:ReleaseFocus()
                SaveConfiguration()
            end

            function KeybindSettings:Lock(Reason)
                if KeybindSettings.Locked then return end
                KeybindSettings.Locked = true
                if Keybind:FindFirstChild("Lock") then
                    Keybind.Lock.Reason.Text = Reason or "Locked"
                    TweenService:Create(Keybind.Lock, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
                    TweenService:Create(Keybind.Lock.Reason, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
                    task.wait(0.2)
                    if KeybindSettings.Locked and Keybind.Lock.Reason:FindFirstChild("Icon") then
                        TweenService:Create(Keybind.Lock.Reason.Icon, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {ImageTransparency = 0}):Play()
                    end
                end
            end

            function KeybindSettings:Unlock()
                if not KeybindSettings.Locked then return end
                KeybindSettings.Locked = false
                if Keybind:FindFirstChild("Lock") then
                    task.wait(0.2)
                    if Keybind.Lock.Reason:FindFirstChild("Icon") then
                        TweenService:Create(Keybind.Lock.Reason.Icon, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
                    end
                    if not KeybindSettings.Locked then
                        TweenService:Create(Keybind.Lock, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
                        TweenService:Create(Keybind.Lock.Reason, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
                    end
                end
            end

            function KeybindSettings:Destroy()
                Keybind:Destroy()
            end

            function KeybindSettings:Visible(bool)
                Keybind.Visible = bool
            end

            if Settings.ConfigurationSaving then
                if Settings.ConfigurationSaving.Enabled and KeybindSettings.Flag then
                    ArrayFieldLibrary.Flags[KeybindSettings.Flag] = KeybindSettings
                end
            end

            return KeybindSettings
        end

        -- Label
        function Tab:CreateLabel(LabelSettings, SectionParent)
            local LabelValue = {}

            local labelText, iconName, background
            if typeof(LabelSettings) == "table" then
                labelText = LabelSettings.Text or LabelSettings[1] or ""
                iconName = LabelSettings.Icon or LabelSettings[2]
                background = LabelSettings.Background
                SectionParent = LabelSettings.SectionParent or SectionParent
            else
                labelText = LabelSettings or ""
            end

            local Label = Elements.Template.Label:Clone()
            Label.Title.Text = labelText
            Label.Title.RichText = true
            Label.Title.TextWrapped = true
            Label.Visible = true

            local bgColors = {
                warn = {bg = Color3.fromRGB(180, 130, 30), text = Color3.fromRGB(255, 255, 255)},
                success = {bg = Color3.fromRGB(50, 140, 50), text = Color3.fromRGB(255, 255, 255)},
                error = {bg = Color3.fromRGB(160, 50, 50), text = Color3.fromRGB(255, 255, 255)}
            }

            if background then
                if bgColors[background] then
                    Label.BackgroundColor3 = bgColors[background].bg
                    Label.Title.TextColor3 = bgColors[background].text
                elseif string.match(tostring(background), "^#%x%x%x%x%x%x$") then
                    local r, g, b = string.match(background, "^#(%x%x)(%x%x)(%x%x)$")
                    Label.BackgroundColor3 = Color3.fromRGB(tonumber(r, 16), tonumber(g, 16), tonumber(b, 16))
                    Label.Title.TextColor3 = Color3.fromRGB(255, 255, 255)
                end
            elseif SelectedTheme then
                Label.BackgroundColor3 = SelectedTheme.SecondaryElementBackground
                Label.UIStroke.Color = SelectedTheme.SecondaryElementStroke
                Label.Title.TextColor3 = SelectedTheme.TextColor
            end

            local iconLabel = nil
            if iconName then
                iconLabel = Instance.new("ImageLabel")
                iconLabel.Name = "LabelIcon"
                iconLabel.Size = UDim2.new(0, 20, 0, 20)
                iconLabel.Position = UDim2.new(0, 12, 0.5, 0)
                iconLabel.AnchorPoint = Vector2.new(0, 0.5)
                iconLabel.BackgroundTransparency = 1
                iconLabel.ZIndex = 100
                iconLabel.ImageColor3 = background and Color3.fromRGB(255, 255, 255) or (SelectedTheme and SelectedTheme.TextColor or Label.Title.TextColor3)
                iconLabel.Parent = Label

                if typeof(iconName) == "string" and not tonumber(iconName) then
                    local success, asset = pcall(getIcon, iconName)
                    if success then
                        iconLabel.Image = "rbxassetid://" .. asset.id
                        iconLabel.ImageRectOffset = asset.imageRectOffset
                        iconLabel.ImageRectSize = asset.imageRectSize
                    end
                else
                    iconLabel.Image = "rbxassetid://" .. tostring(iconName)
                    iconLabel.ImageRectOffset = Vector2.new(0, 0)
                    iconLabel.ImageRectSize = Vector2.new(0, 0)
                end

                Label.Title.TextXAlignment = Enum.TextXAlignment.Left
                Label.Title.Position = UDim2.new(0, 38, 0.5, 0)
                Label.Title.AnchorPoint = Vector2.new(0, 0.5)
            end

            Tab.Elements[labelText] = {
                type = 'label',
                section = SectionParent,
                element = Label
            }

            if SectionParent then
                Label.Parent = SectionParent.Holder
            else
                Label.Parent = TabPage
            end

            Label.BackgroundTransparency = 1
            Label.UIStroke.Transparency = 1
            Label.Title.TextTransparency = 1

            TweenService:Create(Label, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
            TweenService:Create(Label.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
            TweenService:Create(Label.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()

            function LabelValue:Set(NewSettings)
                local newText, newIcon, newBg
                if typeof(NewSettings) == "table" then
                    newText = NewSettings.Text or NewSettings[1] or ""
                    newIcon = NewSettings.Icon or NewSettings[2]
                    newBg = NewSettings.Background
                else
                    newText = NewSettings or ""
                end

                Label.Title.Text = newText

                if newBg then
                    if bgColors[newBg] then
                        Label.BackgroundColor3 = bgColors[newBg].bg
                        Label.Title.TextColor3 = bgColors[newBg].text
                        if iconLabel then iconLabel.ImageColor3 = Color3.fromRGB(255, 255, 255) end
                    elseif string.match(tostring(newBg), "^#%x%x%x%x%x%x$") then
                        local r, g, b = string.match(newBg, "^#(%x%x)(%x%x)(%x%x)$")
                        Label.BackgroundColor3 = Color3.fromRGB(tonumber(r, 16), tonumber(g, 16), tonumber(b, 16))
                        Label.Title.TextColor3 = Color3.fromRGB(255, 255, 255)
                        if iconLabel then iconLabel.ImageColor3 = Color3.fromRGB(255, 255, 255) end
                    end
                end
            end

            return LabelValue
        end

		function Tab:CreateParagraph(ParagraphSettings, SectionParent)
			local ParagraphValue = {}

			SectionParent = SectionParent or ParagraphSettings.SectionParent

			local Paragraph = Elements.Template.Paragraph:Clone()
			Paragraph.Title.Text = ParagraphSettings.Title or ""
			Paragraph.Title.RichText = true
			Paragraph.Title.TextSize = 13
			Paragraph.Content.Text = ParagraphSettings.Content or ""
			Paragraph.Content.RichText = true
			Paragraph.Content.TextWrapped = true
			Paragraph.Visible = true

			local bgColors = {
				warn = {bg = Color3.fromRGB(180, 130, 30), title = Color3.fromRGB(255, 255, 255), content = Color3.fromRGB(240, 240, 240)},
				success = {bg = Color3.fromRGB(50, 140, 50), title = Color3.fromRGB(255, 255, 255), content = Color3.fromRGB(240, 240, 240)},
				error = {bg = Color3.fromRGB(160, 50, 50), title = Color3.fromRGB(255, 255, 255), content = Color3.fromRGB(240, 240, 240)}
			}

			if SelectedTheme then
				Paragraph.BackgroundColor3 = SelectedTheme.SecondaryElementBackground
				Paragraph.UIStroke.Color = SelectedTheme.SecondaryElementStroke
			end

			local hasCustomBackground = false
			if ParagraphSettings.Background then
				local bg = ParagraphSettings.Background
				if bgColors[bg] then
					Paragraph.BackgroundColor3 = bgColors[bg].bg
					Paragraph.Title.TextColor3 = bgColors[bg].title
					Paragraph.Content.TextColor3 = bgColors[bg].content
					hasCustomBackground = true
				elseif string.match(tostring(bg), "^#%x%x%x%x%x%x$") then
					local r, g, b = string.match(bg, "^#(%x%x)(%x%x)(%x%x)$")
					Paragraph.BackgroundColor3 = Color3.fromRGB(tonumber(r, 16), tonumber(g, 16), tonumber(b, 16))
					Paragraph.Title.TextColor3 = Color3.fromRGB(255, 255, 255)
					Paragraph.Content.TextColor3 = Color3.fromRGB(240, 240, 240)
					hasCustomBackground = true
				end
			end

			local iconLabel = nil
			local hasIcon = ParagraphSettings.Icon ~= nil
			local iconOffset = hasIcon and 15 or 0

			if hasIcon then
				iconLabel = Instance.new("ImageLabel")
				iconLabel.Name = "ParagraphIcon"
				iconLabel.Size = UDim2.new(0, 18, 0, 18)
				iconLabel.Position = UDim2.new(0, 10, 0, 7)
				iconLabel.BackgroundTransparency = 1
				iconLabel.ZIndex = 100
				
				if hasCustomBackground then
					iconLabel.ImageColor3 = Color3.fromRGB(255, 255, 255)
				elseif SelectedTheme and SelectedTheme.TextColor then
					iconLabel.ImageColor3 = SelectedTheme.TextColor
				else
					iconLabel.ImageColor3 = Color3.fromRGB(255, 255, 255)
				end
				
				iconLabel.Parent = Paragraph

				if typeof(ParagraphSettings.Icon) == "string" and not tonumber(ParagraphSettings.Icon) then
					local success, asset = pcall(getIcon, ParagraphSettings.Icon)
					if success then
						iconLabel.Image = "rbxassetid://" .. asset.id
						iconLabel.ImageRectOffset = asset.imageRectOffset
						iconLabel.ImageRectSize = asset.imageRectSize
					end
				else
					iconLabel.Image = "rbxassetid://" .. tostring(ParagraphSettings.Icon)
				end

				local titlePos = Paragraph.Title.Position
				local contentPos = Paragraph.Content.Position
				Paragraph.Title.Position = UDim2.new(titlePos.X.Scale, titlePos.X.Offset + iconOffset, titlePos.Y.Scale, titlePos.Y.Offset - 2)
				Paragraph.Content.Position = UDim2.new(contentPos.X.Scale, contentPos.X.Offset - 3, contentPos.Y.Scale, contentPos.Y.Offset + 4)
			end

			Tab.Elements[ParagraphSettings.Title] = {
				type = 'paragraph',
				section = SectionParent,
				element = Paragraph
			}

			if SectionParent then
				Paragraph.Parent = SectionParent.Holder
			else
				Paragraph.Parent = TabPage
			end

			local function UpdateParagraphSize()
				local currentText = Paragraph.Content.Text
				Paragraph.Content.Text = currentText

				local textHeight = Paragraph.Content.TextBounds.Y + 5

				if Paragraph.Parent == TabPage then
					Paragraph.Content.Size = UDim2.new(0, 438, 0, textHeight)
					Paragraph.Size = UDim2.new(0, 465, 0, textHeight + 40)
				else
					Paragraph.Content.Size = UDim2.new(0, 438, 0, textHeight)
					Paragraph.Size = UDim2.new(1, -12, 0, textHeight + 40)
				end
			end

			UpdateParagraphSize()

			Paragraph.BackgroundTransparency = 1
			Paragraph.UIStroke.Transparency = 1
			Paragraph.Title.TextTransparency = 1
			Paragraph.Content.TextTransparency = 1
			if iconLabel then
				iconLabel.ImageTransparency = 1
			end

			TweenService:Create(Paragraph, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
			TweenService:Create(Paragraph.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
			TweenService:Create(Paragraph.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
			TweenService:Create(Paragraph.Content, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
			if iconLabel then
				TweenService:Create(iconLabel, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageTransparency = 0}):Play()
			end

			function ParagraphValue:Set(NewParagraphSettings)
				Paragraph.Title.Text = NewParagraphSettings.Title or Paragraph.Title.Text
				Paragraph.Content.Text = NewParagraphSettings.Content or Paragraph.Content.Text
				UpdateParagraphSize()
			end

			return ParagraphValue
		end

        -- Dropdown
        function Tab:CreateDropdown(DropdownSettings)
            local Dropdown = Elements.Template.Dropdown:Clone()
            local SearchBar = Dropdown.List["-SearchBar"]
            local DropdownDebounce = false

            DropdownSettings.Locked = false
            DropdownSettings.Items = {Selected = {}}

            local Multi = DropdownSettings.MultiSelection or false

            Dropdown.Name = DropdownSettings.Name
            Dropdown.Title.Text = DropdownSettings.Name
            Dropdown.Visible = true

            Tab.Elements[DropdownSettings.Name] = {
                type = 'dropdown',
                section = DropdownSettings.SectionParent,
                element = Dropdown
            }

            if DropdownSettings.SectionParent then
                Dropdown.Parent = DropdownSettings.SectionParent.Holder
            else
                Dropdown.Parent = TabPage
            end

            Dropdown.List.Visible = false
            Dropdown.BackgroundTransparency = 1
            Dropdown.UIStroke.Transparency = 1
            Dropdown.Title.TextTransparency = 1
            Dropdown.Size = UDim2.new(0, 465, 0, 44)

            if SelectedTheme then
                Dropdown.BackgroundColor3 = SelectedTheme.ElementBackground
                Dropdown.UIStroke.Color = SelectedTheme.ElementStroke
                Dropdown.Title.TextColor3 = SelectedTheme.TextColor
                Dropdown.Selected.TextColor3 = SelectedTheme.TextColor
                Dropdown.Toggle.ImageColor3 = SelectedTheme.TextColor
            end

            TweenService:Create(Dropdown, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
            TweenService:Create(Dropdown.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
            TweenService:Create(Dropdown.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()

            for _, child in ipairs(Dropdown.List:GetChildren()) do
                if child.ClassName == "Frame" and child.Name ~= "PlaceHolder" and child.Name ~= "-SearchBar" and child.Name ~= "Template" then
                    child:Destroy()
                end
            end

            Dropdown.Toggle.Rotation = 180

            local function RefreshSelected()
                if #DropdownSettings.Items.Selected > 1 then
                    local names = {}
                    for _, item in ipairs(DropdownSettings.Items.Selected) do
                        table.insert(names, item.Option.Name)
                    end
                    Dropdown.Selected.Text = table.concat(names, ", ")
                elseif DropdownSettings.Items.Selected[1] then
                    Dropdown.Selected.Text = DropdownSettings.Items.Selected[1].Option.Name
                else
                    Dropdown.Selected.Text = "Select an option"
                end
            end

            Dropdown.Interact.MouseButton1Click:Connect(function()
                if DropdownSettings.Locked then return end

                if SelectedTheme then
                    TweenService:Create(Dropdown, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
                end
                TweenService:Create(Dropdown.UIStroke, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
                task.wait(0.1)
                if SelectedTheme then
                    TweenService:Create(Dropdown, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
                end
                TweenService:Create(Dropdown.UIStroke, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {Transparency = 0}):Play()

                if DropdownDebounce then return end

                if Dropdown.List.Visible then
                    DropdownDebounce = true
                    TweenService:Create(Dropdown, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 465, 0, 44)}):Play()

                    for _, DropdownOpt in ipairs(Dropdown.List:GetChildren()) do
                        if DropdownOpt.ClassName == "Frame" and DropdownOpt.Name ~= "PlaceHolder" and DropdownOpt ~= SearchBar then
                            TweenService:Create(DropdownOpt, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
                            if DropdownOpt:FindFirstChild("UIStroke") then
                                TweenService:Create(DropdownOpt.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
                            end
                            if DropdownOpt:FindFirstChild("Title") then
                                TweenService:Create(DropdownOpt.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
                            end
                        end
                    end

                    TweenService:Create(SearchBar, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
                    TweenService:Create(SearchBar.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
                    TweenService:Create(SearchBar.Input, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()

                    TweenService:Create(Dropdown.List, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ScrollBarImageTransparency = 1}):Play()
                    TweenService:Create(Dropdown.Toggle, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Rotation = 180}):Play()

                    task.wait(0.35)
                    Dropdown.List.Visible = false
                    DropdownDebounce = false
                else
                    TweenService:Create(Dropdown, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 465, 0, 178)}):Play()
                    Dropdown.List.Visible = true
                    TweenService:Create(Dropdown.List, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ScrollBarImageTransparency = 0.7}):Play()
                    TweenService:Create(Dropdown.Toggle, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Rotation = 0}):Play()

                    SearchBar.Input.Text = ""
                    TweenService:Create(SearchBar, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
                    TweenService:Create(SearchBar.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
                    TweenService:Create(SearchBar.Input, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()

                    for _, DropdownOpt in ipairs(Dropdown.List:GetChildren()) do
                        if DropdownOpt.ClassName == "Frame" and DropdownOpt.Name ~= "PlaceHolder" and DropdownOpt ~= SearchBar then
                            TweenService:Create(DropdownOpt, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
                            if DropdownOpt:FindFirstChild("UIStroke") then
                                TweenService:Create(DropdownOpt.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
                            end
                            if DropdownOpt:FindFirstChild("Title") then
                                TweenService:Create(DropdownOpt.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
                            end
                        end
                    end
                end
            end)

            SearchBar.Input:GetPropertyChangedSignal("Text"):Connect(function()
                local InputText = string.upper(SearchBar.Input.Text)
                for _, item in ipairs(Dropdown.List:GetChildren()) do
                    if item:IsA("Frame") and item.Name ~= "Template" and item ~= SearchBar and item.Name ~= "PlaceHolder" then
                        if InputText == "" or InputText == " " or string.find(string.upper(item.Name), InputText) ~= nil then
                            TweenService:Create(item, TweenInfo.new(0.15, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
                            if item:FindFirstChild("UIStroke") then
                                TweenService:Create(item.UIStroke, TweenInfo.new(0.15, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
                            end
                            if item:FindFirstChild("Title") then
                                TweenService:Create(item.Title, TweenInfo.new(0.15, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
                            end
                        else
                            TweenService:Create(item, TweenInfo.new(0.15, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
                            if item:FindFirstChild("UIStroke") then
                                TweenService:Create(item.UIStroke, TweenInfo.new(0.15, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
                            end
                            if item:FindFirstChild("Title") then
                                TweenService:Create(item.Title, TweenInfo.new(0.15, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
                            end
                        end
                    end
                end
            end)

            Dropdown.MouseEnter:Connect(function()
                if not Dropdown.List.Visible and SelectedTheme then
                    TweenService:Create(Dropdown, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
                end
            end)

            Dropdown.MouseLeave:Connect(function()
                if SelectedTheme then
                    TweenService:Create(Dropdown, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
                end
            end)

            local function Error(text)
                TweenService:Create(Dropdown, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = Color3.fromRGB(85, 0, 0)}):Play()
                TweenService:Create(Dropdown.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
                Dropdown.Title.Text = text
                task.wait(0.5)
                Dropdown.Title.Text = DropdownSettings.Name
                if SelectedTheme then
                    TweenService:Create(Dropdown, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
                end
                TweenService:Create(Dropdown.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
            end

            local function AddOption(Option, Selecteds)
                local DropdownOption = Elements.Template.Dropdown.List.Template:Clone()

                DropdownOption:GetPropertyChangedSignal("BackgroundTransparency"):Connect(function()
                    DropdownOption.Visible = DropdownOption.BackgroundTransparency ~= 1
                end)

                DropdownSettings.Items[Option] = {
                    Option = DropdownOption,
                    Selected = false
                }

                local OptionInTable = DropdownSettings.Items[Option]
                DropdownOption.Name = Option.Name or Option
                DropdownOption.Title.Text = Option.Name or Option
                DropdownOption.Parent = Dropdown.List
                DropdownOption.Visible = true

                local IsSelected = OptionInTable.Selected
                if Selecteds then
                    local selectList = typeof(Selecteds) == "string" and {Selecteds} or Selecteds
                    for _, Selected in pairs(selectList) do
                        if Selected == Option then
                            IsSelected = true
                            OptionInTable.Selected = true
                            table.insert(DropdownSettings.Items.Selected, OptionInTable)
                        end
                    end
                    RefreshSelected()
                end

                if IsSelected then
                    DropdownOption.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                else
                    DropdownOption.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                end

                if Dropdown.List.Visible then
                    DropdownOption.BackgroundTransparency = 0
                    if DropdownOption:FindFirstChild("UIStroke") then
                        DropdownOption.UIStroke.Transparency = 0
                    end
                    DropdownOption.Title.TextTransparency = 0
                else
                    DropdownOption.BackgroundTransparency = 1
                    if DropdownOption:FindFirstChild("UIStroke") then
                        DropdownOption.UIStroke.Transparency = 1
                    end
                    DropdownOption.Title.TextTransparency = 1
                end

                DropdownOption.Interact.ZIndex = 50
                DropdownOption.Interact.MouseButton1Click:Connect(function()
                    if DropdownSettings.Locked then return end

                    if OptionInTable.Selected then
                        OptionInTable.Selected = false
                        local idx = table.find(DropdownSettings.Items.Selected, OptionInTable)
                        if idx then table.remove(DropdownSettings.Items.Selected, idx) end
                        RefreshSelected()
                        TweenService:Create(DropdownOption, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundColor3 = Color3.fromRGB(30, 30, 30)}):Play()
                        SaveConfiguration()
                        return
                    end

                    if not Multi and DropdownSettings.Items.Selected[1] then
                        DropdownSettings.Items.Selected[1].Selected = false
                        TweenService:Create(DropdownSettings.Items.Selected[1].Option, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundColor3 = Color3.fromRGB(30, 30, 30)}):Play()
                    end

                    if not Multi then
                        DropdownSettings.Items.Selected = {OptionInTable}
                        Dropdown.Selected.Text = Option.Name or Option
                    else
                        table.insert(DropdownSettings.Items.Selected, OptionInTable)
                        RefreshSelected()
                    end

                    local Success, Response = pcall(function()
                        DropdownSettings.Callback(Option)
                    end)

                    if not Success then
                        Error("Callback Error")
                        print("ArrayField | "..DropdownSettings.Name.." Callback Error " ..tostring(Response))
                    end

                    OptionInTable.Selected = true

                    if not Multi then
                        for _, op in ipairs(DropdownSettings.Items.Selected) do
                            TweenService:Create(op.Option, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundColor3 = Color3.fromRGB(30, 30, 30)}):Play()
                        end
                    end

                    TweenService:Create(DropdownOption.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
                    TweenService:Create(DropdownOption, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundColor3 = Color3.fromRGB(40, 40, 40)}):Play()
                    DropdownDebounce = true
                    task.wait(0.2)
                    TweenService:Create(DropdownOption.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
                    task.wait(0.1)

                    if not Multi then
                        TweenService:Create(Dropdown, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 465, 0, 45)}):Play()

                        for _, DropdownOpt in ipairs(Dropdown.List:GetChildren()) do
                            if DropdownOpt.ClassName == "Frame" and DropdownOpt.Name ~= "PlaceHolder" and DropdownOpt ~= SearchBar then
                                TweenService:Create(DropdownOpt, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
                                if DropdownOpt:FindFirstChild("UIStroke") then
                                    TweenService:Create(DropdownOpt.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
                                end
                                if DropdownOpt:FindFirstChild("Title") then
                                    TweenService:Create(DropdownOpt.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
                                end
                            end
                        end

                        TweenService:Create(Dropdown.List, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ScrollBarImageTransparency = 1}):Play()
                        TweenService:Create(Dropdown.Toggle, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Rotation = 180}):Play()

                        task.wait(0.35)
                        Dropdown.List.Visible = false
                    end

                    DropdownDebounce = false
                    SaveConfiguration()
                end)

                DropdownOption.MouseEnter:Connect(function()
                    if not OptionInTable.Selected then
                        TweenService:Create(DropdownOption, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundColor3 = Color3.fromRGB(35, 35, 35)}):Play()
                    end
                end)

                DropdownOption.MouseLeave:Connect(function()
                    if not OptionInTable.Selected then
                        TweenService:Create(DropdownOption, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundColor3 = Color3.fromRGB(30, 30, 30)}):Play()
                    end
                end)
            end

            local function AddOptions(Options, Selected)
                if typeof(Options) == "table" then
                    for _, Option in ipairs(Options) do
                        AddOption(Option, Selected)
                    end
                else
                    AddOption(Options, Selected)
                end

                if Settings.ConfigurationSaving then
                    if Settings.ConfigurationSaving.Enabled and DropdownSettings.Flag then
                        ArrayFieldLibrary.Flags[DropdownSettings.Flag] = DropdownSettings
                    end
                end
            end

            function DropdownSettings:Add(Items, Selected)
                AddOptions(Items, Selected)
            end

            AddOptions(DropdownSettings.Options, DropdownSettings.CurrentOption)

            function DropdownSettings:Set(NewOption)
                if typeof(NewOption) == "table" then
                    DropdownSettings.Items.Selected = NewOption
                else
                    DropdownSettings.Items.Selected = {NewOption}
                end

                local Success, Response = pcall(function()
                    DropdownSettings.Callback(NewOption)
                end)

                if not Success then
                    Error("Callback Error")
                    print("ArrayField | "..DropdownSettings.Name.." Callback Error " ..tostring(Response))
                end
            end

            function DropdownSettings:Error(text)
                Error(text)
            end

            function DropdownSettings:Refresh(NewOptions, Selecteds)
                DropdownSettings.Items = {Selected = {}}
                for _, option in ipairs(Dropdown.List:GetChildren()) do
                    if option.ClassName == "Frame" and option ~= SearchBar and option.Name ~= "PlaceHolder" and option.Name ~= "Template" then
                        option:Destroy()
                    end
                end
                AddOptions(NewOptions, Selecteds)
            end

            function DropdownSettings:Remove(Item)
                if Item.Name ~= "PlaceHolder" and Item ~= SearchBar then
                    if DropdownSettings.Items[Item] then
                        DropdownSettings.Items[Item].Option:Destroy()
                        DropdownSettings.Items[Item] = nil
                    else
                        Error("Option not found.")
                    end
                end
                if Dropdown.Selected.Text == Item then
                    Dropdown.Selected.Text = ""
                end
            end

            function DropdownSettings:Lock(Reason)
                if DropdownSettings.Locked then return end
                DropdownSettings.Locked = true
                DropdownDebounce = true

                TweenService:Create(Dropdown, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 465, 0, 44)}):Play()

                for _, DropdownOpt in ipairs(Dropdown.List:GetChildren()) do
                    if DropdownOpt.ClassName == "Frame" and DropdownOpt.Name ~= "PlaceHolder" and DropdownOpt.Name ~= "-SearchBar" then
                        TweenService:Create(DropdownOpt, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
                        if DropdownOpt:FindFirstChild("UIStroke") then
                            TweenService:Create(DropdownOpt.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
                        end
                        if DropdownOpt:FindFirstChild("Title") then
                            TweenService:Create(DropdownOpt.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
                        end
                    end
                end

                TweenService:Create(Dropdown.List, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ScrollBarImageTransparency = 1}):Play()
                TweenService:Create(Dropdown.Toggle, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Rotation = 180}):Play()

                task.wait(0.35)
                Dropdown.List.Visible = false
                DropdownDebounce = false

                if Dropdown:FindFirstChild("Lock") then
                    Dropdown.Lock.Reason.Text = Reason or "Locked"
                    TweenService:Create(Dropdown.Lock, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
                    TweenService:Create(Dropdown.Lock.Reason, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
                    task.wait(0.2)
                    if DropdownSettings.Locked and Dropdown.Lock.Reason:FindFirstChild("Icon") then
                        TweenService:Create(Dropdown.Lock.Reason.Icon, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {ImageTransparency = 0}):Play()
                    end
                end
            end

            function DropdownSettings:Unlock()
                if not DropdownSettings.Locked then return end
                DropdownSettings.Locked = false

                if Dropdown:FindFirstChild("Lock") then
                    task.wait(0.2)
                    if Dropdown.Lock.Reason:FindFirstChild("Icon") then
                        TweenService:Create(Dropdown.Lock.Reason.Icon, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
                    end
                    if not DropdownSettings.Locked then
                        TweenService:Create(Dropdown.Lock, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
                        TweenService:Create(Dropdown.Lock.Reason, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
                    end
                end
            end

            function DropdownSettings:Destroy()
                Dropdown:Destroy()
            end

            function DropdownSettings:Visible(bool)
                Dropdown.Visible = bool
            end

            return DropdownSettings
        end

        -- ColorPicker
        function Tab:CreateColorPicker(ColorPickerSettings)
            local ColorPicker = Elements.Template.ColorPicker:Clone()

            Tab.Elements[ColorPickerSettings.Name] = {
                type = 'colorpicker',
                section = ColorPickerSettings.SectionParent,
                element = ColorPicker
            }

            local Background = ColorPicker.CPBackground
            local Display = Background.Display
            local Main = Background.MainCP
            local Slider = ColorPicker.ColorSlider

            ColorPicker.ClipsDescendants = true
            ColorPicker.Name = ColorPickerSettings.Name
            ColorPicker.Title.Text = ColorPickerSettings.Name
            ColorPickerSettings.Locked = false
            ColorPicker.Visible = true

            if SelectedTheme then
                ColorPicker.BackgroundColor3 = SelectedTheme.ElementBackground
                ColorPicker.UIStroke.Color = SelectedTheme.ElementStroke
                ColorPicker.Title.TextColor3 = SelectedTheme.TextColor
            end

            if ColorPickerSettings.SectionParent then
                ColorPicker.Parent = ColorPickerSettings.SectionParent.Holder
            else
                ColorPicker.Parent = TabPage
            end

            ColorPicker.Size = UDim2.new(0, 465, 0, 40)
            ColorPicker.ColorSlider.Visible = false
            ColorPicker.HexInput.Visible = false
            ColorPicker.RGB.Visible = false
            Background.Size = UDim2.new(0, 39, 0, 22)
            Display.BackgroundTransparency = 0
            Main.MainPoint.ImageTransparency = 1
            ColorPicker.Interact.Size = UDim2.new(1, 0, 1, 0)
            ColorPicker.Interact.Position = UDim2.new(0.5, 0, 0.5, 0)
            ColorPicker.RGB.Position = UDim2.new(0, 17, 0, 70)
            ColorPicker.HexInput.Position = UDim2.new(0, 17, 0, 90)
            Main.ImageTransparency = 1
            Background.BackgroundTransparency = 1

            local opened = false
            local mouse = game.Players.LocalPlayer:GetMouse()
            Main.Image = "http://www.roblox.com/asset/?id=11415645739"
            local mainDragging = false
            local sliderDragging = false

            ColorPicker.Interact.MouseButton1Down:Connect(function()
                if ColorPickerSettings.Locked then return end

                if not opened then
                    if ColorPicker:FindFirstChild("ColorPickerIs") then
                        ColorPicker.ColorPickerIs.Value = true
                    end
                    opened = true
                    ColorPicker.ColorSlider.Visible = true
                    ColorPicker.HexInput.Visible = true
                    ColorPicker.RGB.Visible = true
                    TweenService:Create(ColorPicker, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 465, 0, 120)}):Play()
                    TweenService:Create(Background, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 173, 0, 86)}):Play()
                    TweenService:Create(Display, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
                    TweenService:Create(ColorPicker.Interact, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Position = UDim2.new(0.289, 0, 0.5, 0)}):Play()
                    TweenService:Create(ColorPicker.RGB, TweenInfo.new(0.8, Enum.EasingStyle.Quint), {Position = UDim2.new(0, 17, 0, 40)}):Play()
                    TweenService:Create(ColorPicker.HexInput, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Position = UDim2.new(0, 17, 0, 73)}):Play()
                    TweenService:Create(ColorPicker.Interact, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Size = UDim2.new(0.574, 0, 1, 0)}):Play()
                    TweenService:Create(Main.MainPoint, TweenInfo.new(0.2, Enum.EasingStyle.Quint), {ImageTransparency = 0}):Play()
                    TweenService:Create(Main, TweenInfo.new(0.2, Enum.EasingStyle.Quint), {ImageTransparency = 0.1}):Play()
                    TweenService:Create(Background, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
                else
                    if ColorPicker:FindFirstChild("ColorPickerIs") then
                        ColorPicker.ColorPickerIs.Value = false
                    end
                    opened = false
                    ColorPicker.ColorSlider.Visible = false
                    ColorPicker.HexInput.Visible = false
                    ColorPicker.RGB.Visible = false
                    TweenService:Create(ColorPicker, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 465, 0, 40)}):Play()
                    TweenService:Create(Background, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 39, 0, 22)}):Play()
                    TweenService:Create(ColorPicker.Interact, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Size = UDim2.new(1, 0, 1, 0)}):Play()
                    TweenService:Create(ColorPicker.Interact, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Position = UDim2.new(0.5, 0, 0.5, 0)}):Play()
                    TweenService:Create(ColorPicker.RGB, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Position = UDim2.new(0, 17, 0, 70)}):Play()
                    TweenService:Create(ColorPicker.HexInput, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Position = UDim2.new(0, 17, 0, 90)}):Play()
                    TweenService:Create(Display, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
                    TweenService:Create(Main.MainPoint, TweenInfo.new(0.2, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
                    TweenService:Create(Main, TweenInfo.new(0.2, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
                    TweenService:Create(Background, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
                end
            end)

            UserInputService.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    mainDragging = false
                    sliderDragging = false
                end
            end)

            Main.MouseButton1Down:Connect(function()
                if opened and not ColorPickerSettings.Locked then mainDragging = true end
            end)

            Main.MainPoint.MouseButton1Down:Connect(function()
                if opened and not ColorPickerSettings.Locked then mainDragging = true end
            end)

            Slider.MouseButton1Down:Connect(function()
                if ColorPickerSettings.Locked then return end
                sliderDragging = true
            end)

            Slider.SliderPoint.MouseButton1Down:Connect(function()
                if ColorPickerSettings.Locked then return end
                sliderDragging = true
            end)

            local h, s, v = ColorPickerSettings.Color:ToHSV()
            local color = Color3.fromHSV(h, s, v)
            local hex = string.format("#%02X%02X%02X", color.R * 0xFF, color.G * 0xFF, color.B * 0xFF)
            ColorPicker.HexInput.InputBox.Text = hex

            local function setDisplay()
                Main.MainPoint.Position = UDim2.new(s, -Main.MainPoint.AbsoluteSize.X / 2, 1 - v, -Main.MainPoint.AbsoluteSize.Y / 2)
                Main.MainPoint.ImageColor3 = Color3.fromHSV(h, s, v)
                Background.BackgroundColor3 = Color3.fromHSV(h, 1, 1)
                Display.BackgroundColor3 = Color3.fromHSV(h, s, v)

                local x = h * Slider.AbsoluteSize.X
                Slider.SliderPoint.Position = UDim2.new(0, x - Slider.SliderPoint.AbsoluteSize.X / 2, 0.5, 0)
                Slider.SliderPoint.ImageColor3 = Color3.fromHSV(h, 1, 1)

                local currentColor = Color3.fromHSV(h, s, v)
                local r, g, b = math.floor((currentColor.R * 255) + 0.5), math.floor((currentColor.G * 255) + 0.5), math.floor((currentColor.B * 255) + 0.5)
                ColorPicker.RGB.RInput.InputBox.Text = tostring(r)
                ColorPicker.RGB.GInput.InputBox.Text = tostring(g)
                ColorPicker.RGB.BInput.InputBox.Text = tostring(b)
                hex = string.format("#%02X%02X%02X", currentColor.R * 0xFF, currentColor.G * 0xFF, currentColor.B * 0xFF)
                ColorPicker.HexInput.InputBox.Text = hex
            end

            setDisplay()

            ColorPicker.HexInput.InputBox.FocusLost:Connect(function()
                if not pcall(function()
                    local r, g, b = string.match(ColorPicker.HexInput.InputBox.Text, "^#?(%w%w)(%w%w)(%w%w)$")
                    local rgbColor = Color3.fromRGB(tonumber(r, 16), tonumber(g, 16), tonumber(b, 16))
                    h, s, v = rgbColor:ToHSV()
                    hex = ColorPicker.HexInput.InputBox.Text
                    setDisplay()
                    ColorPickerSettings.Color = rgbColor
                end) then
                    ColorPicker.HexInput.InputBox.Text = hex
                end
                pcall(function() ColorPickerSettings.Callback(Color3.fromHSV(h, s, v)) end)
                SaveConfiguration()
            end)

            local function rgbBoxes(box, toChange)
                local value = tonumber(box.Text)
                local currentColor = Color3.fromHSV(h, s, v)
                local oldR, oldG, oldB = math.floor((currentColor.R * 255) + 0.5), math.floor((currentColor.G * 255) + 0.5), math.floor((currentColor.B * 255) + 0.5)
                local save

                if toChange == "R" then save = oldR; oldR = value
                elseif toChange == "G" then save = oldG; oldG = value
                else save = oldB; oldB = value end

                if value then
                    value = math.clamp(value, 0, 255)
                    h, s, v = Color3.fromRGB(oldR, oldG, oldB):ToHSV()
                    setDisplay()
                else
                    box.Text = tostring(save)
                end

                ColorPickerSettings.Color = Color3.fromHSV(h, s, v)
                SaveConfiguration()
            end

            ColorPicker.RGB.RInput.InputBox.FocusLost:Connect(function()
                rgbBoxes(ColorPicker.RGB.RInput.InputBox, "R")
                pcall(function() ColorPickerSettings.Callback(Color3.fromHSV(h, s, v)) end)
            end)

            ColorPicker.RGB.GInput.InputBox.FocusLost:Connect(function()
                rgbBoxes(ColorPicker.RGB.GInput.InputBox, "G")
                pcall(function() ColorPickerSettings.Callback(Color3.fromHSV(h, s, v)) end)
            end)

            ColorPicker.RGB.BInput.InputBox.FocusLost:Connect(function()
                rgbBoxes(ColorPicker.RGB.BInput.InputBox, "B")
                pcall(function() ColorPickerSettings.Callback(Color3.fromHSV(h, s, v)) end)
            end)

            ColorPicker.HexInput.InputBox.Focused:Connect(function()
                if ColorPickerSettings.Locked then ColorPicker.HexInput.InputBox:ReleaseFocus() end
            end)

            ColorPicker.RGB.RInput.InputBox.Focused:Connect(function()
                if ColorPickerSettings.Locked then ColorPicker.RGB.RInput.InputBox:ReleaseFocus() end
            end)

            ColorPicker.RGB.GInput.InputBox.Focused:Connect(function()
                if ColorPickerSettings.Locked then ColorPicker.RGB.GInput.InputBox:ReleaseFocus() end
            end)

            ColorPicker.RGB.BInput.InputBox.Focused:Connect(function()
                if ColorPickerSettings.Locked then ColorPicker.RGB.BInput.InputBox:ReleaseFocus() end
            end)

            RunService.RenderStepped:Connect(function()
                if mainDragging then
                    local localX = math.clamp(mouse.X - Main.AbsolutePosition.X, 0, Main.AbsoluteSize.X)
                    local localY = math.clamp(mouse.Y - Main.AbsolutePosition.Y, 0, Main.AbsoluteSize.Y)
                    Main.MainPoint.Position = UDim2.new(0, localX - Main.MainPoint.AbsoluteSize.X / 2, 0, localY - Main.MainPoint.AbsoluteSize.Y / 2)
                    s = localX / Main.AbsoluteSize.X
                    v = 1 - (localY / Main.AbsoluteSize.Y)
                    Display.BackgroundColor3 = Color3.fromHSV(h, s, v)
                    Main.MainPoint.ImageColor3 = Color3.fromHSV(h, s, v)
                    Background.BackgroundColor3 = Color3.fromHSV(h, 1, 1)

                    local currentColor = Color3.fromHSV(h, s, v)
                    local r, g, b = math.floor((currentColor.R * 255) + 0.5), math.floor((currentColor.G * 255) + 0.5), math.floor((currentColor.B * 255) + 0.5)
                    ColorPicker.RGB.RInput.InputBox.Text = tostring(r)
                    ColorPicker.RGB.GInput.InputBox.Text = tostring(g)
                    ColorPicker.RGB.BInput.InputBox.Text = tostring(b)
                    ColorPicker.HexInput.InputBox.Text = string.format("#%02X%02X%02X", currentColor.R * 0xFF, currentColor.G * 0xFF, currentColor.B * 0xFF)
                    pcall(function() ColorPickerSettings.Callback(Color3.fromHSV(h, s, v)) end)
                    ColorPickerSettings.Color = currentColor
                    SaveConfiguration()
                end

                if sliderDragging then
                    local localX = math.clamp(mouse.X - Slider.AbsolutePosition.X, 0, Slider.AbsoluteSize.X)
                    h = localX / Slider.AbsoluteSize.X
                    Display.BackgroundColor3 = Color3.fromHSV(h, s, v)
                    Slider.SliderPoint.Position = UDim2.new(0, localX - Slider.SliderPoint.AbsoluteSize.X / 2, 0.5, 0)
                    Slider.SliderPoint.ImageColor3 = Color3.fromHSV(h, 1, 1)
                    Background.BackgroundColor3 = Color3.fromHSV(h, 1, 1)
                    Main.MainPoint.ImageColor3 = Color3.fromHSV(h, s, v)

                    local currentColor = Color3.fromHSV(h, s, v)
                    local r, g, b = math.floor((currentColor.R * 255) + 0.5), math.floor((currentColor.G * 255) + 0.5), math.floor((currentColor.B * 255) + 0.5)
                    ColorPicker.RGB.RInput.InputBox.Text = tostring(r)
                    ColorPicker.RGB.GInput.InputBox.Text = tostring(g)
                    ColorPicker.RGB.BInput.InputBox.Text = tostring(b)
                    ColorPicker.HexInput.InputBox.Text = string.format("#%02X%02X%02X", currentColor.R * 0xFF, currentColor.G * 0xFF, currentColor.B * 0xFF)
                    pcall(function() ColorPickerSettings.Callback(Color3.fromHSV(h, s, v)) end)
                    ColorPickerSettings.Color = currentColor
                    SaveConfiguration()
                end
            end)

            function ColorPickerSettings:Set(RGBColor)
                ColorPickerSettings.Color = RGBColor
                h, s, v = ColorPickerSettings.Color:ToHSV()
                setDisplay()
            end

            function ColorPickerSettings:Lock(Reason)
                if ColorPickerSettings.Locked then return end

                if ColorPicker:FindFirstChild("ColorPickerIs") then
                    ColorPicker.ColorPickerIs.Value = false
                end
                opened = false
                ColorPicker.ColorSlider.Visible = false
                ColorPicker.HexInput.Visible = false
                ColorPicker.RGB.Visible = false
                TweenService:Create(ColorPicker, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 465, 0, 40)}):Play()
                TweenService:Create(Background, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 39, 0, 22)}):Play()
                TweenService:Create(ColorPicker.Interact, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Size = UDim2.new(1, 0, 1, 0)}):Play()
                TweenService:Create(ColorPicker.Interact, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Position = UDim2.new(0.5, 0, 0.5, 0)}):Play()
                TweenService:Create(Display, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
                TweenService:Create(Main.MainPoint, TweenInfo.new(0.2, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
                TweenService:Create(Main, TweenInfo.new(0.2, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
                TweenService:Create(Background, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()

                ColorPickerSettings.Locked = true

                if ColorPicker:FindFirstChild("Lock") then
                    ColorPicker.Lock.Reason.Text = Reason or "Locked"
                    TweenService:Create(ColorPicker.Lock, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
                    TweenService:Create(ColorPicker.Lock.Reason, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
                    task.wait(0.2)
                    if ColorPickerSettings.Locked and ColorPicker.Lock.Reason:FindFirstChild("Icon") then
                        TweenService:Create(ColorPicker.Lock.Reason.Icon, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {ImageTransparency = 0}):Play()
                    end
                end
            end

            function ColorPickerSettings:Unlock()
                if not ColorPickerSettings.Locked then return end
                ColorPickerSettings.Locked = false

                if ColorPicker:FindFirstChild("Lock") then
                    task.wait(0.2)
                    if ColorPicker.Lock.Reason:FindFirstChild("Icon") then
                        TweenService:Create(ColorPicker.Lock.Reason.Icon, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
                    end
                    if not ColorPickerSettings.Locked then
                        TweenService:Create(ColorPicker.Lock, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
                        TweenService:Create(ColorPicker.Lock.Reason, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
                    end
                end
            end

            function ColorPickerSettings:Destroy()
                ColorPicker:Destroy()
            end

            function ColorPickerSettings:Visible(bool)
                ColorPicker.Visible = bool
            end

            if Settings.ConfigurationSaving then
                if Settings.ConfigurationSaving.Enabled and ColorPickerSettings.Flag then
                    ArrayFieldLibrary.Flags[ColorPickerSettings.Flag] = ColorPickerSettings
                end
            end

            return ColorPickerSettings
        end

        return Tab
    end

    return Window
end

return ArrayFieldLibrary
--[[
local Window = ArrayFieldLibrary:CreateWindow({
    Name = "My Script Hub",
    Icon = "shield",
    LoadingTitle = "Loading Script",
    LoadingSubtitle = "Please wait...",
    DefaultTheme = "Default",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "MyScriptHub",
        FileName = "Config"
    }
})

local Tab1 = Window:CreateTab("Home", "home")
local Tab2 = Window:CreateTab("Elements", "box")
local Tab3 = Window:CreateTab("Combat", "sword")

-- Tab 1: Home
local WelcomeSection = Tab1:CreateSection("Welcome")

Tab1:CreateLabel({
    Text = "Welcome to ArrayField!",
    Icon = "sparkles"
}, WelcomeSection)

Tab1:CreateParagraph({
    Title = "<b>Getting Started</b>",
    Content = "This is a test of the new ArrayField library. Everything should work smoothly with <i>rich text</i> support!",
    Icon = "info"
}, WelcomeSection)

Tab1:CreateSpacing(WelcomeSection, 10)

local NotifSection = Tab1:CreateSection("Notifications")

Tab1:CreateLabel({
    Text = "Warning: This is a test!",
    Background = "warn"
}, NotifSection)

Tab1:CreateLabel({
    Text = "Success: Everything works!",
    Background = "success"
}, NotifSection)

Tab1:CreateLabel({
    Text = "Error: Something broke!",
    Background = "error"
}, NotifSection)

Tab1:CreateLabel({
    Text = "Custom Color Test",
    Background = "#FF69B4"
}, NotifSection)

-- Tab 2: Elements Testing
local ButtonSection = Tab2:CreateSection("Buttons & Toggles")

Tab2:CreateButton({
    Name = "Test Button",
    Description = "This button has a description that appears on hover!",
    Callback = function()
        print("Button clicked!")
    end
}, ButtonSection)

Tab2:CreateToggle({
    Name = "Test Toggle",
    Description = "Toggle this feature on or off with a hover description",
    CurrentValue = false,
    Flag = "TestToggle",
    Callback = function(Value)
        print("Toggle:", Value)
    end
}, ButtonSection)

Tab2:CreateSpacing(ButtonSection, 8)

local SliderSection = Tab2:CreateSection("Sliders & Inputs")

Tab2:CreateSlider({
    Name = "Speed Multiplier",
    Description = "Adjust the speed value between 0 and 100",
    Range = {0, 100},
    Increment = 1,
    Suffix = "%",
    CurrentValue = 50,
    Flag = "TestSlider",
    Callback = function(Value)
        print("Slider:", Value)
    end
}, SliderSection)

Tab2:CreateInput({
    Name = "Username Input",
    Description = "Enter your username in this input field",
    PlaceholderText = "Type here...",
    RemoveTextAfterFocusLost = false,
    Callback = function(Text)
        print("Input:", Text)
    end
}, SliderSection)

Tab2:CreateKeybind({
    Name = "Toggle Keybind",
    Description = "Click and press a key to set the keybind",
    CurrentKeybind = "Q",
    Flag = "TestKeybind",
    Callback = function()
        print("Keybind pressed!")
    end
}, SliderSection)

Tab2:CreateSpacing(SliderSection, 8)

local DropdownSection = Tab2:CreateSection("Dropdowns & Colors")

Tab2:CreateDropdown({
    Name = "Select Mode",
    Options = {"Legit", "Rage", "Semi-Rage", "Casual"},
    CurrentOption = "Legit",
    MultiSelection = false,
    Flag = "TestDropdown",
    Callback = function(Option)
        print("Selected:", Option)
    end
}, DropdownSection)

Tab2:CreateDropdown({
    Name = "Multi Select",
    Options = {"Feature 1", "Feature 2", "Feature 3", "Feature 4"},
    CurrentOption = {"Feature 1"},
    MultiSelection = true,
    Flag = "TestMultiDropdown",
    Callback = function(Option)
        print("Multi Selected:", Option)
    end
}, DropdownSection)

Tab2:CreateColorPicker({
    Name = "Theme Color",
    Color = Color3.fromRGB(255, 0, 0),
    Flag = "TestColor",
    Callback = function(Color)
        print("Color:", Color)
    end
}, DropdownSection)

-- Tab 3: Combat
local CombatMain = Tab3:CreateSection("Combat Features")

Tab3:CreateParagraph({
    Title = "<b>Combat System</b>",
    Content = "Configure your <i>combat</i> settings below. Make sure to <b>save</b> your configuration when you're done!",
    Icon = "sword",
    Background = "warn"
}, CombatMain)

Tab3:CreateToggle({
    Name = "Auto Attack",
    Description = "Automatically attack nearby enemies",
    CurrentValue = false,
    Flag = "AutoAttack",
    Callback = function(Value)
        print("Auto Attack:", Value)
    end
}, CombatMain)

Tab3:CreateSlider({
    Name = "Attack Range",
    Description = "Maximum distance to attack enemies",
    Range = {5, 50},
    Increment = 1,
    Suffix = "studs",
    CurrentValue = 20,
    Flag = "AttackRange",
    Callback = function(Value)
        print("Attack Range:", Value)
    end
}, CombatMain)

Tab3:CreateSlider({
    Name = "Attack Speed",
    Description = "How many attacks per second",
    Range = {1, 20},
    Increment = 0.5,
    Suffix = "atk/s",
    CurrentValue = 10,
    Flag = "AttackSpeed",
    Callback = function(Value)
        print("Attack Speed:", Value)
    end
}, CombatMain)

Tab3:CreateSpacing(CombatMain, 10)

local WeaponSection = Tab3:CreateSection("Weapon Settings")

Tab3:CreateDropdown({
    Name = "Weapon Type",
    Options = {"Sword", "Axe", "Spear", "Bow", "Staff", "Dagger"},
    CurrentOption = "Sword",
    MultiSelection = false,
    Flag = "WeaponType",
    Callback = function(Option)
        print("Weapon:", Option)
    end
}, WeaponSection)

Tab3:CreateButton({
    Name = "Equip Weapon",
    Description = "Click to equip the selected weapon",
    Callback = function()
        print("Weapon equipped!")
    end
}, WeaponSection)

Tab3:CreateColorPicker({
    Name = "Weapon Color",
    Color = Color3.fromRGB(150, 150, 150),
    Flag = "WeaponColor",
    Callback = function(Color)
        print("Weapon Color:", Color)
    end
}, WeaponSection)
]]
