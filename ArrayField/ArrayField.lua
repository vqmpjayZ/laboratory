--[[

ArrayField Interface Suite
by vqmpjay

Original by Sirius

-------------------------------
vqmpjay | Designing + Programming + New Features

]]

--[[

# INTRODUCING GEN 3 OF ARRAYFIELD
- Slick new UI (- size; + settings; + Drag bar) COMPLETELY RE-WORKED
- Theme Changer, Keybind Changer, Configuration Saving toggle ALL in Settings now!

# Say goodbye to issues or bugs!
- We've fixed every issue that's ever overcame any ArrayField version and we've improved performence to everything!

# Brand-New features
- NotePrompt
- CreateImage
- CreateSeparator
- Categories

We've added Descriptions to all use-able elements apart for the Dropdown and Color-picker.
We've Added Backgrounds to Paragraphs and labels!
We've Added RichText support to more text-related things!
You can now add icons to Paragraphs!

Useage Example at https://raw.githubusercontent.com/vqmpjayZ/laboratory/refs/heads/main/ArrayField/ArrayField_UsageExample.lua
Docs coming soon hopefully

Change Logs (dd/mm/yy):
// [19/1/2026] Released!

]]

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
        Default = {
            TextFont = "Default",
            TextColor = Color3.fromRGB(240, 240, 240),
            Background = Color3.fromRGB(25, 25, 25),
            Topbar = Color3.fromRGB(50, 50, 50),
            Shadow = Color3.fromRGB(20, 20, 20),
            NotificationBackground = Color3.fromRGB(20, 20, 20),
            NotificationActionsBackground = Color3.fromRGB(230, 230, 230),
            NotificationActionsText = Color3.fromRGB(20, 20, 20),
            TabBackground = Color3.fromRGB(25, 25, 25),
            TabStroke = Color3.fromRGB(85, 85, 85),
            TabBackgroundSelected = Color3.fromRGB(90, 90, 90),
            TabTextColor = Color3.fromRGB(240, 240, 240),
            SelectedTabTextColor = Color3.fromRGB(255, 255, 255),
            TabImage = Color3.fromRGB(240, 240, 240),
            ElementBackground = Color3.fromRGB(35, 35, 35),
            ElementBackgroundHover = Color3.fromRGB(43, 43, 43),
            SecondaryElementBackground = Color3.fromRGB(25, 25, 25),
            ElementStroke = Color3.fromRGB(50, 50, 50),
            SecondaryElementStroke = Color3.fromRGB(40, 40, 40),
            SectionTitleBackground = Color3.fromRGB(25, 25, 25),
            SectionTitleText = Color3.fromRGB(175, 175, 175),
            SidebarBackground = Color3.fromRGB(44, 44, 44),
            SliderBackground = Color3.fromRGB(43, 105, 159),
            SliderProgress = Color3.fromRGB(43, 105, 159),
            SliderStroke = Color3.fromRGB(48, 119, 177),
            ToggleBackground = Color3.fromRGB(30, 30, 30),
            ToggleEnabled = Color3.fromRGB(0, 146, 214),
            ToggleDisabled = Color3.fromRGB(100, 100, 100),
            ToggleEnabledStroke = Color3.fromRGB(0, 170, 255),
            ToggleDisabledStroke = Color3.fromRGB(125, 125, 125),
            ToggleEnabledOuterStroke = Color3.fromRGB(100, 100, 100),
            ToggleDisabledOuterStroke = Color3.fromRGB(65, 65, 65),
            InputBackground = Color3.fromRGB(30, 30, 30),
            InputStroke = Color3.fromRGB(50, 50, 50),
            PlaceholderColor = Color3.fromRGB(178, 178, 178),
            Accent = Color3.fromRGB(90, 90, 90),
            LoadingTitle = Color3.fromRGB(240, 240, 240),
            LoadingSubtitle = Color3.fromRGB(200, 200, 200),
            LoadingVersion = Color3.fromRGB(70, 70, 70),
            TopbarCornerRepair = Color3.fromRGB(52, 52, 52),
            TopbarDivider = Color3.fromRGB(65, 65, 65),
            TopbarButtons = Color3.fromRGB(240, 240, 240),
            SearchBarBackground = Color3.fromRGB(58, 58, 58),
            SearchBarStroke = Color3.fromRGB(50, 50, 50),
            SearchBarInputText = Color3.fromRGB(180, 180, 180),
            SearchBarInputPlaceholder = Color3.fromRGB(110, 110, 110),
            SearchBarIcon = Color3.fromRGB(240, 240, 240),
            SearchBarClear = Color3.fromRGB(240, 240, 240),
            SearchBarFilter = Color3.fromRGB(240, 240, 240),
            SideTabListBackground = Color3.fromRGB(44, 44, 44),
            SideTabListStroke = Color3.fromRGB(44, 44, 44),
            SideTabListRDMT = Color3.fromRGB(200, 200, 200),
            SideListItemTitle = Color3.fromRGB(205, 205, 205),
            SideListItemImage = Color3.fromRGB(205, 205, 205),
            SettingsFrameBackground = Color3.fromRGB(30, 30, 30),
            SettingsFrameStroke = Color3.fromRGB(50, 50, 50),
            KeybindBackground = Color3.fromRGB(35, 35, 35),
            KeybindTitle = Color3.fromRGB(240, 240, 240),
            KeybindStroke = Color3.fromRGB(50, 50, 50),
            KeybindFrameBackground = Color3.fromRGB(30, 30, 30),
            KeybindFrameStroke = Color3.fromRGB(65, 65, 65),
            KeybindBoxText = Color3.fromRGB(240, 240, 240),
            DropdownBackground = Color3.fromRGB(35, 35, 35),
            DropdownTitle = Color3.fromRGB(240, 240, 240),
            DropdownSelected = Color3.fromRGB(150, 150, 150),
            DropdownToggle = Color3.fromRGB(150, 150, 150),
            DropdownStroke = Color3.fromRGB(50, 50, 50),
            DropdownListBackground = Color3.fromRGB(30, 30, 30),
            DropdownListScrollBar = Color3.fromRGB(240, 240, 240),
            DragCosmetic = Color3.fromRGB(255, 255, 255),
            ButtonBackground = Color3.fromRGB(35, 35, 35),
            ElementsBackground = Color3.fromRGB(25, 25, 25),
            NotePromptBackground = Color3.fromRGB(25, 25, 25),
            NotePromptStroke = Color3.fromRGB(50, 50, 50),
            NotePromptShadow = Color3.fromRGB(20, 20, 20),
            NotePromptTitle = Color3.fromRGB(240, 240, 240),
            NotePromptDescription = Color3.fromRGB(180, 180, 180),
            NotePromptIcon = Color3.fromRGB(240, 240, 240),
            NotePromptClose = Color3.fromRGB(150, 150, 150),
            NotePromptButtonBackground = Color3.fromRGB(34, 35, 33),
            NotePromptButtonStroke = Color3.fromRGB(50, 50, 50),
            NotePromptButtonText = Color3.fromRGB(240, 240, 240),
        },
        Dark = {
            TextFont = "Default",
            TextColor = Color3.fromRGB(220, 220, 220),
            Background = Color3.fromRGB(18, 18, 18),
            Topbar = Color3.fromRGB(25, 25, 25),
            Shadow = Color3.fromRGB(10, 10, 10),
            NotificationBackground = Color3.fromRGB(15, 15, 15),
            NotificationActionsBackground = Color3.fromRGB(200, 200, 200),
            NotificationActionsText = Color3.fromRGB(15, 15, 15),
            TabBackground = Color3.fromRGB(22, 22, 22),
            TabStroke = Color3.fromRGB(40, 40, 40),
            TabBackgroundSelected = Color3.fromRGB(60, 60, 60),
            TabTextColor = Color3.fromRGB(220, 220, 220),
            SelectedTabTextColor = Color3.fromRGB(255, 255, 255),
            TabImage = Color3.fromRGB(220, 220, 220),
            ElementBackground = Color3.fromRGB(28, 28, 28),
            ElementBackgroundHover = Color3.fromRGB(35, 35, 35),
            SecondaryElementBackground = Color3.fromRGB(20, 20, 20),
            ElementStroke = Color3.fromRGB(40, 40, 40),
            SecondaryElementStroke = Color3.fromRGB(32, 32, 32),
            SectionTitleBackground = Color3.fromRGB(18, 18, 18),
            SectionTitleText = Color3.fromRGB(150, 150, 150),
            SidebarBackground = Color3.fromRGB(30, 30, 30),
            SliderBackground = Color3.fromRGB(35, 90, 140),
            SliderProgress = Color3.fromRGB(35, 90, 140),
            SliderStroke = Color3.fromRGB(40, 100, 155),
            ToggleBackground = Color3.fromRGB(22, 22, 22),
            ToggleEnabled = Color3.fromRGB(0, 130, 190),
            ToggleDisabled = Color3.fromRGB(80, 80, 80),
            ToggleEnabledStroke = Color3.fromRGB(0, 150, 220),
            ToggleDisabledStroke = Color3.fromRGB(100, 100, 100),
            ToggleEnabledOuterStroke = Color3.fromRGB(80, 80, 80),
            ToggleDisabledOuterStroke = Color3.fromRGB(50, 50, 50),
            InputBackground = Color3.fromRGB(22, 22, 22),
            InputStroke = Color3.fromRGB(40, 40, 40),
            PlaceholderColor = Color3.fromRGB(140, 140, 140),
            Accent = Color3.fromRGB(60, 60, 60),
            LoadingTitle = Color3.fromRGB(220, 220, 220),
            LoadingSubtitle = Color3.fromRGB(170, 170, 170),
            LoadingVersion = Color3.fromRGB(60, 60, 60),
            TopbarCornerRepair = Color3.fromRGB(25, 25, 25),
            TopbarDivider = Color3.fromRGB(40, 40, 40),
            TopbarButtons = Color3.fromRGB(220, 220, 220),
            SearchBarBackground = Color3.fromRGB(30, 30, 30),
            SearchBarStroke = Color3.fromRGB(40, 40, 40),
            SearchBarInputText = Color3.fromRGB(160, 160, 160),
            SearchBarInputPlaceholder = Color3.fromRGB(90, 90, 90),
            SearchBarIcon = Color3.fromRGB(220, 220, 220),
            SearchBarClear = Color3.fromRGB(220, 220, 220),
            SearchBarFilter = Color3.fromRGB(220, 220, 220),
            SideTabListBackground = Color3.fromRGB(25, 25, 25),
            SideTabListStroke = Color3.fromRGB(25, 25, 25),
            SideTabListRDMT = Color3.fromRGB(170, 170, 170),
            SideListItemTitle = Color3.fromRGB(180, 180, 180),
            SideListItemImage = Color3.fromRGB(180, 180, 180),
            SettingsFrameBackground = Color3.fromRGB(22, 22, 22),
            SettingsFrameStroke = Color3.fromRGB(40, 40, 40),
            KeybindBackground = Color3.fromRGB(28, 28, 28),
            KeybindTitle = Color3.fromRGB(220, 220, 220),
            KeybindStroke = Color3.fromRGB(40, 40, 40),
            KeybindFrameBackground = Color3.fromRGB(22, 22, 22),
            KeybindFrameStroke = Color3.fromRGB(50, 50, 50),
            KeybindBoxText = Color3.fromRGB(220, 220, 220),
            DropdownBackground = Color3.fromRGB(28, 28, 28),
            DropdownTitle = Color3.fromRGB(220, 220, 220),
            DropdownSelected = Color3.fromRGB(130, 130, 130),
            DropdownToggle = Color3.fromRGB(130, 130, 130),
            DropdownStroke = Color3.fromRGB(40, 40, 40),
            DropdownListBackground = Color3.fromRGB(22, 22, 22),
            DropdownListScrollBar = Color3.fromRGB(220, 220, 220),
            DragCosmetic = Color3.fromRGB(200, 200, 200),
            ButtonBackground = Color3.fromRGB(28, 28, 28),
            ElementsBackground = Color3.fromRGB(18, 18, 18),
            NotePromptBackground = Color3.fromRGB(18, 18, 18),
            NotePromptStroke = Color3.fromRGB(40, 40, 40),
            NotePromptShadow = Color3.fromRGB(10, 10, 10),
            NotePromptTitle = Color3.fromRGB(220, 220, 220),
            NotePromptDescription = Color3.fromRGB(160, 160, 160),
            NotePromptIcon = Color3.fromRGB(220, 220, 220),
            NotePromptClose = Color3.fromRGB(130, 130, 130),
            NotePromptButtonBackground = Color3.fromRGB(28, 28, 28),
            NotePromptButtonStroke = Color3.fromRGB(40, 40, 40),
            NotePromptButtonText = Color3.fromRGB(220, 220, 220),
        },
        Light = {
            TextFont = "Gotham",
            TextColor = Color3.fromRGB(50, 50, 50),
            Background = Color3.fromRGB(255, 255, 255),
            Topbar = Color3.fromRGB(217, 217, 217),
            Shadow = Color3.fromRGB(223, 223, 223),
            NotificationBackground = Color3.fromRGB(245, 245, 245),
            NotificationActionsBackground = Color3.fromRGB(230, 230, 230),
            NotificationActionsText = Color3.fromRGB(50, 50, 50),
            TabBackground = Color3.fromRGB(220, 220, 220),
            TabStroke = Color3.fromRGB(180, 180, 180),
            TabBackgroundSelected = Color3.fromRGB(0, 142, 208),
            TabTextColor = Color3.fromRGB(80, 80, 80),
            SelectedTabTextColor = Color3.fromRGB(255, 255, 255),
            TabImage = Color3.fromRGB(80, 80, 80),
            ElementBackground = Color3.fromRGB(240, 240, 240),
            ElementBackgroundHover = Color3.fromRGB(230, 230, 230),
            SecondaryElementBackground = Color3.fromRGB(235, 235, 235),
            ElementStroke = Color3.fromRGB(200, 200, 200),
            SecondaryElementStroke = Color3.fromRGB(190, 190, 190),
            SectionTitleBackground = Color3.fromRGB(255, 255, 255),
            SectionTitleText = Color3.fromRGB(100, 100, 100),
            SidebarBackground = Color3.fromRGB(230, 230, 230),
            SliderBackground = Color3.fromRGB(31, 159, 71),
            SliderProgress = Color3.fromRGB(31, 159, 71),
            SliderStroke = Color3.fromRGB(42, 216, 94),
            ToggleBackground = Color3.fromRGB(220, 220, 220),
            ToggleEnabled = Color3.fromRGB(32, 214, 29),
            ToggleDisabled = Color3.fromRGB(170, 170, 170),
            ToggleEnabledStroke = Color3.fromRGB(17, 255, 0),
            ToggleDisabledStroke = Color3.fromRGB(150, 150, 150),
            ToggleEnabledOuterStroke = Color3.fromRGB(0, 170, 0),
            ToggleDisabledOuterStroke = Color3.fromRGB(160, 160, 160),
            InputBackground = Color3.fromRGB(245, 245, 245),
            InputStroke = Color3.fromRGB(200, 200, 200),
            PlaceholderColor = Color3.fromRGB(140, 140, 140),
            Accent = Color3.fromRGB(0, 142, 208),
            LoadingTitle = Color3.fromRGB(50, 50, 50),
            LoadingSubtitle = Color3.fromRGB(80, 80, 80),
            LoadingVersion = Color3.fromRGB(150, 150, 150),
            TopbarCornerRepair = Color3.fromRGB(217, 217, 217),
            TopbarDivider = Color3.fromRGB(190, 190, 190),
            TopbarButtons = Color3.fromRGB(50, 50, 50),
            SearchBarBackground = Color3.fromRGB(235, 235, 235),
            SearchBarStroke = Color3.fromRGB(200, 200, 200),
            SearchBarInputText = Color3.fromRGB(50, 50, 50),
            SearchBarInputPlaceholder = Color3.fromRGB(130, 130, 130),
            SearchBarIcon = Color3.fromRGB(50, 50, 50),
            SearchBarClear = Color3.fromRGB(50, 50, 50),
            SearchBarFilter = Color3.fromRGB(50, 50, 50),
            SideTabListBackground = Color3.fromRGB(225, 225, 225),
            SideTabListStroke = Color3.fromRGB(225, 225, 225),
            SideTabListRDMT = Color3.fromRGB(80, 80, 80),
            SideListItemTitle = Color3.fromRGB(70, 70, 70),
            SideListItemImage = Color3.fromRGB(70, 70, 70),
            SettingsFrameBackground = Color3.fromRGB(240, 240, 240),
            SettingsFrameStroke = Color3.fromRGB(200, 200, 200),
            KeybindBackground = Color3.fromRGB(240, 240, 240),
            KeybindTitle = Color3.fromRGB(50, 50, 50),
            KeybindStroke = Color3.fromRGB(200, 200, 200),
            KeybindFrameBackground = Color3.fromRGB(245, 245, 245),
            KeybindFrameStroke = Color3.fromRGB(180, 180, 180),
            KeybindBoxText = Color3.fromRGB(50, 50, 50),
            DropdownBackground = Color3.fromRGB(240, 240, 240),
            DropdownTitle = Color3.fromRGB(50, 50, 50),
            DropdownSelected = Color3.fromRGB(100, 100, 100),
            DropdownToggle = Color3.fromRGB(100, 100, 100),
            DropdownStroke = Color3.fromRGB(200, 200, 200),
            DropdownListBackground = Color3.fromRGB(245, 245, 245),
            DropdownListScrollBar = Color3.fromRGB(50, 50, 50),
            DragCosmetic = Color3.fromRGB(50, 50, 50),
            ButtonBackground = Color3.fromRGB(240, 240, 240),
            ElementsBackground = Color3.fromRGB(255, 255, 255),
            NotePromptBackground = Color3.fromRGB(250, 250, 250),
            NotePromptStroke = Color3.fromRGB(200, 200, 200),
            NotePromptShadow = Color3.fromRGB(210, 210, 210),
            NotePromptTitle = Color3.fromRGB(50, 50, 50),
            NotePromptDescription = Color3.fromRGB(90, 90, 90),
            NotePromptIcon = Color3.fromRGB(50, 50, 50),
            NotePromptClose = Color3.fromRGB(120, 120, 120),
            NotePromptButtonBackground = Color3.fromRGB(235, 235, 235),
            NotePromptButtonStroke = Color3.fromRGB(200, 200, 200),
            NotePromptButtonText = Color3.fromRGB(50, 50, 50),
        },
        Ocean = {
            TextFont = "Gotham",
            TextColor = Color3.fromRGB(200, 230, 255),
            Background = Color3.fromRGB(15, 25, 35),
            Topbar = Color3.fromRGB(20, 35, 50),
            Shadow = Color3.fromRGB(10, 20, 30),
            NotificationBackground = Color3.fromRGB(15, 25, 35),
            NotificationActionsBackground = Color3.fromRGB(100, 150, 200),
            NotificationActionsText = Color3.fromRGB(15, 25, 35),
            TabBackground = Color3.fromRGB(30, 50, 70),
            TabStroke = Color3.fromRGB(50, 80, 110),
            TabBackgroundSelected = Color3.fromRGB(40, 120, 180),
            TabTextColor = Color3.fromRGB(200, 230, 255),
            SelectedTabTextColor = Color3.fromRGB(255, 255, 255),
            TabImage = Color3.fromRGB(200, 230, 255),
            ElementBackground = Color3.fromRGB(25, 40, 55),
            ElementBackgroundHover = Color3.fromRGB(30, 50, 70),
            SecondaryElementBackground = Color3.fromRGB(20, 35, 50),
            ElementStroke = Color3.fromRGB(40, 70, 100),
            SecondaryElementStroke = Color3.fromRGB(35, 60, 85),
            SectionTitleBackground = Color3.fromRGB(15, 25, 35),
            SectionTitleText = Color3.fromRGB(140, 180, 210),
            SidebarBackground = Color3.fromRGB(25, 45, 65),
            SliderBackground = Color3.fromRGB(30, 100, 150),
            SliderProgress = Color3.fromRGB(50, 150, 220),
            SliderStroke = Color3.fromRGB(70, 170, 240),
            ToggleBackground = Color3.fromRGB(20, 35, 50),
            ToggleEnabled = Color3.fromRGB(40, 150, 220),
            ToggleDisabled = Color3.fromRGB(80, 100, 120),
            ToggleEnabledStroke = Color3.fromRGB(60, 180, 255),
            ToggleDisabledStroke = Color3.fromRGB(100, 120, 140),
            ToggleEnabledOuterStroke = Color3.fromRGB(50, 120, 180),
            ToggleDisabledOuterStroke = Color3.fromRGB(60, 80, 100),
            InputBackground = Color3.fromRGB(20, 35, 50),
            InputStroke = Color3.fromRGB(40, 70, 100),
            PlaceholderColor = Color3.fromRGB(150, 180, 210),
            Accent = Color3.fromRGB(40, 120, 180),
            LoadingTitle = Color3.fromRGB(200, 230, 255),
            LoadingSubtitle = Color3.fromRGB(150, 180, 210),
            LoadingVersion = Color3.fromRGB(60, 90, 120),
            TopbarCornerRepair = Color3.fromRGB(20, 35, 50),
            TopbarDivider = Color3.fromRGB(50, 80, 110),
            TopbarButtons = Color3.fromRGB(200, 230, 255),
            SearchBarBackground = Color3.fromRGB(30, 50, 70),
            SearchBarStroke = Color3.fromRGB(40, 70, 100),
            SearchBarInputText = Color3.fromRGB(180, 210, 240),
            SearchBarInputPlaceholder = Color3.fromRGB(100, 130, 160),
            SearchBarIcon = Color3.fromRGB(200, 230, 255),
            SearchBarClear = Color3.fromRGB(200, 230, 255),
            SearchBarFilter = Color3.fromRGB(200, 230, 255),
            SideTabListBackground = Color3.fromRGB(25, 45, 65),
            SideTabListStroke = Color3.fromRGB(25, 45, 65),
            SideTabListRDMT = Color3.fromRGB(150, 180, 210),
            SideListItemTitle = Color3.fromRGB(170, 200, 230),
            SideListItemImage = Color3.fromRGB(170, 200, 230),
            SettingsFrameBackground = Color3.fromRGB(20, 35, 50),
            SettingsFrameStroke = Color3.fromRGB(40, 70, 100),
            KeybindBackground = Color3.fromRGB(25, 40, 55),
            KeybindTitle = Color3.fromRGB(200, 230, 255),
            KeybindStroke = Color3.fromRGB(40, 70, 100),
            KeybindFrameBackground = Color3.fromRGB(20, 35, 50),
            KeybindFrameStroke = Color3.fromRGB(50, 80, 110),
            KeybindBoxText = Color3.fromRGB(200, 230, 255),
            DropdownBackground = Color3.fromRGB(25, 40, 55),
            DropdownTitle = Color3.fromRGB(200, 230, 255),
            DropdownSelected = Color3.fromRGB(140, 170, 200),
            DropdownToggle = Color3.fromRGB(140, 170, 200),
            DropdownStroke = Color3.fromRGB(40, 70, 100),
            DropdownListBackground = Color3.fromRGB(20, 35, 50),
            DropdownListScrollBar = Color3.fromRGB(200, 230, 255),
            DragCosmetic = Color3.fromRGB(200, 230, 255),
            ButtonBackground = Color3.fromRGB(25, 40, 55),
            ElementsBackground = Color3.fromRGB(15, 25, 35),
            NotePromptBackground = Color3.fromRGB(15, 25, 35),
            NotePromptStroke = Color3.fromRGB(40, 70, 100),
            NotePromptShadow = Color3.fromRGB(10, 20, 30),
            NotePromptTitle = Color3.fromRGB(200, 230, 255),
            NotePromptDescription = Color3.fromRGB(150, 180, 210),
            NotePromptIcon = Color3.fromRGB(200, 230, 255),
            NotePromptClose = Color3.fromRGB(140, 170, 200),
            NotePromptButtonBackground = Color3.fromRGB(25, 40, 52),
            NotePromptButtonStroke = Color3.fromRGB(40, 70, 100),
            NotePromptButtonText = Color3.fromRGB(200, 230, 255),
        },
        Purple = {
            TextFont = "Gotham",
            TextColor = Color3.fromRGB(220, 200, 255),
            Background = Color3.fromRGB(20, 15, 35),
            Topbar = Color3.fromRGB(35, 25, 55),
            Shadow = Color3.fromRGB(15, 10, 30),
            NotificationBackground = Color3.fromRGB(20, 15, 35),
            NotificationActionsBackground = Color3.fromRGB(150, 100, 200),
            NotificationActionsText = Color3.fromRGB(255, 255, 255),
            TabBackground = Color3.fromRGB(50, 30, 80),
            TabStroke = Color3.fromRGB(80, 50, 120),
            TabBackgroundSelected = Color3.fromRGB(120, 80, 180),
            TabTextColor = Color3.fromRGB(220, 200, 255),
            SelectedTabTextColor = Color3.fromRGB(255, 255, 255),
            TabImage = Color3.fromRGB(220, 200, 255),
            ElementBackground = Color3.fromRGB(40, 25, 65),
            ElementBackgroundHover = Color3.fromRGB(50, 35, 80),
            SecondaryElementBackground = Color3.fromRGB(35, 20, 60),
            ElementStroke = Color3.fromRGB(70, 40, 110),
            SecondaryElementStroke = Color3.fromRGB(60, 35, 95),
            SectionTitleBackground = Color3.fromRGB(20, 15, 35),
            SectionTitleText = Color3.fromRGB(170, 140, 200),
            SidebarBackground = Color3.fromRGB(45, 30, 70),
            SliderBackground = Color3.fromRGB(80, 50, 140),
            SliderProgress = Color3.fromRGB(120, 80, 200),
            SliderStroke = Color3.fromRGB(150, 100, 230),
            ToggleBackground = Color3.fromRGB(35, 20, 60),
            ToggleEnabled = Color3.fromRGB(140, 80, 220),
            ToggleDisabled = Color3.fromRGB(100, 80, 120),
            ToggleEnabledStroke = Color3.fromRGB(180, 120, 255),
            ToggleDisabledStroke = Color3.fromRGB(120, 100, 140),
            ToggleEnabledOuterStroke = Color3.fromRGB(120, 70, 180),
            ToggleDisabledOuterStroke = Color3.fromRGB(80, 60, 100),
            InputBackground = Color3.fromRGB(35, 20, 60),
            InputStroke = Color3.fromRGB(70, 40, 110),
            PlaceholderColor = Color3.fromRGB(180, 150, 210),
            Accent = Color3.fromRGB(120, 80, 180),
            LoadingTitle = Color3.fromRGB(220, 200, 255),
            LoadingSubtitle = Color3.fromRGB(180, 150, 210),
            LoadingVersion = Color3.fromRGB(80, 60, 110),
            TopbarCornerRepair = Color3.fromRGB(35, 25, 55),
            TopbarDivider = Color3.fromRGB(80, 50, 120),
            TopbarButtons = Color3.fromRGB(220, 200, 255),
            SearchBarBackground = Color3.fromRGB(50, 30, 80),
            SearchBarStroke = Color3.fromRGB(70, 40, 110),
            SearchBarInputText = Color3.fromRGB(200, 180, 235),
            SearchBarInputPlaceholder = Color3.fromRGB(130, 100, 160),
            SearchBarIcon = Color3.fromRGB(220, 200, 255),
            SearchBarClear = Color3.fromRGB(220, 200, 255),
            SearchBarFilter = Color3.fromRGB(220, 200, 255),
            SideTabListBackground = Color3.fromRGB(45, 30, 70),
            SideTabListStroke = Color3.fromRGB(45, 30, 70),
            SideTabListRDMT = Color3.fromRGB(180, 150, 210),
            SideListItemTitle = Color3.fromRGB(190, 170, 220),
            SideListItemImage = Color3.fromRGB(190, 170, 220),
            SettingsFrameBackground = Color3.fromRGB(35, 20, 60),
            SettingsFrameStroke = Color3.fromRGB(70, 40, 110),
            KeybindBackground = Color3.fromRGB(40, 25, 65),
            KeybindTitle = Color3.fromRGB(220, 200, 255),
            KeybindStroke = Color3.fromRGB(70, 40, 110),
            KeybindFrameBackground = Color3.fromRGB(35, 20, 60),
            KeybindFrameStroke = Color3.fromRGB(80, 50, 120),
            KeybindBoxText = Color3.fromRGB(220, 200, 255),
            DropdownBackground = Color3.fromRGB(40, 25, 65),
            DropdownTitle = Color3.fromRGB(220, 200, 255),
            DropdownSelected = Color3.fromRGB(160, 130, 190),
            DropdownToggle = Color3.fromRGB(160, 130, 190),
            DropdownStroke = Color3.fromRGB(70, 40, 110),
            DropdownListBackground = Color3.fromRGB(35, 20, 60),
            DropdownListScrollBar = Color3.fromRGB(220, 200, 255),
            DragCosmetic = Color3.fromRGB(220, 200, 255),
            ButtonBackground = Color3.fromRGB(40, 25, 65),
            ElementsBackground = Color3.fromRGB(20, 15, 35),
            NotePromptBackground = Color3.fromRGB(20, 15, 35),
            NotePromptStroke = Color3.fromRGB(70, 40, 110),
            NotePromptShadow = Color3.fromRGB(15, 10, 30),
            NotePromptTitle = Color3.fromRGB(220, 200, 255),
            NotePromptDescription = Color3.fromRGB(180, 150, 210),
            NotePromptIcon = Color3.fromRGB(220, 200, 255),
            NotePromptClose = Color3.fromRGB(160, 130, 190),
            NotePromptButtonBackground = Color3.fromRGB(38, 24, 58),
            NotePromptButtonStroke = Color3.fromRGB(70, 40, 110),
            NotePromptButtonText = Color3.fromRGB(220, 200, 255),
        },
        Green = {
            TextFont = "Gotham",
            TextColor = Color3.fromRGB(200, 255, 200),
            Background = Color3.fromRGB(15, 25, 15),
            Topbar = Color3.fromRGB(25, 40, 25),
            Shadow = Color3.fromRGB(10, 20, 10),
            NotificationBackground = Color3.fromRGB(15, 25, 15),
            NotificationActionsBackground = Color3.fromRGB(100, 200, 100),
            NotificationActionsText = Color3.fromRGB(15, 25, 15),
            TabBackground = Color3.fromRGB(40, 60, 40),
            TabStroke = Color3.fromRGB(60, 90, 60),
            TabBackgroundSelected = Color3.fromRGB(80, 160, 80),
            TabTextColor = Color3.fromRGB(200, 255, 200),
            SelectedTabTextColor = Color3.fromRGB(255, 255, 255),
            TabImage = Color3.fromRGB(200, 255, 200),
            ElementBackground = Color3.fromRGB(30, 45, 30),
            ElementBackgroundHover = Color3.fromRGB(40, 60, 40),
            SecondaryElementBackground = Color3.fromRGB(25, 40, 25),
            ElementStroke = Color3.fromRGB(50, 80, 50),
            SecondaryElementStroke = Color3.fromRGB(45, 70, 45),
            SectionTitleBackground = Color3.fromRGB(15, 25, 15),
            SectionTitleText = Color3.fromRGB(140, 200, 140),
            SidebarBackground = Color3.fromRGB(35, 55, 35),
            SliderBackground = Color3.fromRGB(60, 120, 60),
            SliderProgress = Color3.fromRGB(80, 180, 80),
            SliderStroke = Color3.fromRGB(100, 200, 100),
            ToggleBackground = Color3.fromRGB(25, 40, 25),
            ToggleEnabled = Color3.fromRGB(80, 200, 80),
            ToggleDisabled = Color3.fromRGB(80, 100, 80),
            ToggleEnabledStroke = Color3.fromRGB(120, 255, 120),
            ToggleDisabledStroke = Color3.fromRGB(100, 120, 100),
            ToggleEnabledOuterStroke = Color3.fromRGB(60, 150, 60),
            ToggleDisabledOuterStroke = Color3.fromRGB(60, 80, 60),
            InputBackground = Color3.fromRGB(25, 40, 25),
            InputStroke = Color3.fromRGB(50, 80, 50),
            PlaceholderColor = Color3.fromRGB(150, 200, 150),
            Accent = Color3.fromRGB(80, 160, 80),
            LoadingTitle = Color3.fromRGB(200, 255, 200),
            LoadingSubtitle = Color3.fromRGB(150, 200, 150),
            LoadingVersion = Color3.fromRGB(60, 100, 60),
            TopbarCornerRepair = Color3.fromRGB(25, 40, 25),
            TopbarDivider = Color3.fromRGB(60, 90, 60),
            TopbarButtons = Color3.fromRGB(200, 255, 200),
            SearchBarBackground = Color3.fromRGB(40, 60, 40),
            SearchBarStroke = Color3.fromRGB(50, 80, 50),
            SearchBarInputText = Color3.fromRGB(180, 230, 180),
            SearchBarInputPlaceholder = Color3.fromRGB(100, 150, 100),
            SearchBarIcon = Color3.fromRGB(200, 255, 200),
            SearchBarClear = Color3.fromRGB(200, 255, 200),
            SearchBarFilter = Color3.fromRGB(200, 255, 200),
            SideTabListBackground = Color3.fromRGB(35, 55, 35),
            SideTabListStroke = Color3.fromRGB(35, 55, 35),
            SideTabListRDMT = Color3.fromRGB(150, 200, 150),
            SideListItemTitle = Color3.fromRGB(170, 220, 170),
            SideListItemImage = Color3.fromRGB(170, 220, 170),
            SettingsFrameBackground = Color3.fromRGB(25, 40, 25),
            SettingsFrameStroke = Color3.fromRGB(50, 80, 50),
            KeybindBackground = Color3.fromRGB(30, 45, 30),
            KeybindTitle = Color3.fromRGB(200, 255, 200),
            KeybindStroke = Color3.fromRGB(50, 80, 50),
            KeybindFrameBackground = Color3.fromRGB(25, 40, 25),
            KeybindFrameStroke = Color3.fromRGB(60, 90, 60),
            KeybindBoxText = Color3.fromRGB(200, 255, 200),
            DropdownBackground = Color3.fromRGB(30, 45, 30),
            DropdownTitle = Color3.fromRGB(200, 255, 200),
            DropdownSelected = Color3.fromRGB(140, 190, 140),
            DropdownToggle = Color3.fromRGB(140, 190, 140),
            DropdownStroke = Color3.fromRGB(50, 80, 50),
            DropdownListBackground = Color3.fromRGB(25, 40, 25),
            DropdownListScrollBar = Color3.fromRGB(200, 255, 200),
            DragCosmetic = Color3.fromRGB(200, 255, 200),
            ButtonBackground = Color3.fromRGB(30, 45, 30),
            ElementsBackground = Color3.fromRGB(15, 25, 15),
            NotePromptBackground = Color3.fromRGB(15, 25, 15),
            NotePromptStroke = Color3.fromRGB(50, 80, 50),
            NotePromptShadow = Color3.fromRGB(10, 20, 10),
            NotePromptTitle = Color3.fromRGB(200, 255, 200),
            NotePromptDescription = Color3.fromRGB(150, 200, 150),
            NotePromptIcon = Color3.fromRGB(200, 255, 200),
            NotePromptClose = Color3.fromRGB(140, 190, 140),
            NotePromptButtonBackground = Color3.fromRGB(28, 42, 28),
            NotePromptButtonStroke = Color3.fromRGB(50, 80, 50),
            NotePromptButtonText = Color3.fromRGB(200, 255, 200),
        },
        Red = {
            TextFont = "Gotham",
            TextColor = Color3.fromRGB(255, 200, 200),
            Background = Color3.fromRGB(25, 15, 15),
            Topbar = Color3.fromRGB(40, 25, 25),
            Shadow = Color3.fromRGB(20, 10, 10),
            NotificationBackground = Color3.fromRGB(25, 15, 15),
            NotificationActionsBackground = Color3.fromRGB(200, 100, 100),
            NotificationActionsText = Color3.fromRGB(255, 255, 255),
            TabBackground = Color3.fromRGB(60, 40, 40),
            TabStroke = Color3.fromRGB(90, 60, 60),
            TabBackgroundSelected = Color3.fromRGB(160, 80, 80),
            TabTextColor = Color3.fromRGB(255, 200, 200),
            SelectedTabTextColor = Color3.fromRGB(255, 255, 255),
            TabImage = Color3.fromRGB(255, 200, 200),
            ElementBackground = Color3.fromRGB(45, 30, 30),
            ElementBackgroundHover = Color3.fromRGB(60, 40, 40),
            SecondaryElementBackground = Color3.fromRGB(40, 25, 25),
            ElementStroke = Color3.fromRGB(80, 50, 50),
            SecondaryElementStroke = Color3.fromRGB(70, 45, 45),
            SectionTitleBackground = Color3.fromRGB(25, 15, 15),
            SectionTitleText = Color3.fromRGB(200, 140, 140),
            SidebarBackground = Color3.fromRGB(55, 35, 35),
            SliderBackground = Color3.fromRGB(120, 60, 60),
            SliderProgress = Color3.fromRGB(180, 80, 80),
            SliderStroke = Color3.fromRGB(200, 100, 100),
            ToggleBackground = Color3.fromRGB(40, 25, 25),
            ToggleEnabled = Color3.fromRGB(200, 80, 80),
            ToggleDisabled = Color3.fromRGB(100, 80, 80),
            ToggleEnabledStroke = Color3.fromRGB(255, 120, 120),
            ToggleDisabledStroke = Color3.fromRGB(120, 100, 100),
            ToggleEnabledOuterStroke = Color3.fromRGB(150, 60, 60),
            ToggleDisabledOuterStroke = Color3.fromRGB(80, 60, 60),
            InputBackground = Color3.fromRGB(40, 25, 25),
            InputStroke = Color3.fromRGB(80, 50, 50),
            PlaceholderColor = Color3.fromRGB(200, 150, 150),
            Accent = Color3.fromRGB(160, 80, 80),
            LoadingTitle = Color3.fromRGB(255, 200, 200),
            LoadingSubtitle = Color3.fromRGB(200, 150, 150),
            LoadingVersion = Color3.fromRGB(100, 60, 60),
            TopbarCornerRepair = Color3.fromRGB(40, 25, 25),
            TopbarDivider = Color3.fromRGB(90, 60, 60),
            TopbarButtons = Color3.fromRGB(255, 200, 200),
            SearchBarBackground = Color3.fromRGB(60, 40, 40),
            SearchBarStroke = Color3.fromRGB(80, 50, 50),
            SearchBarInputText = Color3.fromRGB(230, 180, 180),
            SearchBarInputPlaceholder = Color3.fromRGB(150, 100, 100),
            SearchBarIcon = Color3.fromRGB(255, 200, 200),
            SearchBarClear = Color3.fromRGB(255, 200, 200),
            SearchBarFilter = Color3.fromRGB(255, 200, 200),
            SideTabListBackground = Color3.fromRGB(55, 35, 35),
            SideTabListStroke = Color3.fromRGB(55, 35, 35),
            SideTabListRDMT = Color3.fromRGB(200, 150, 150),
            SideListItemTitle = Color3.fromRGB(220, 170, 170),
            SideListItemImage = Color3.fromRGB(220, 170, 170),
            SettingsFrameBackground = Color3.fromRGB(40, 25, 25),
            SettingsFrameStroke = Color3.fromRGB(80, 50, 50),
            KeybindBackground = Color3.fromRGB(45, 30, 30),
            KeybindTitle = Color3.fromRGB(255, 200, 200),
            KeybindStroke = Color3.fromRGB(80, 50, 50),
            KeybindFrameBackground = Color3.fromRGB(40, 25, 25),
            KeybindFrameStroke = Color3.fromRGB(90, 60, 60),
            KeybindBoxText = Color3.fromRGB(255, 200, 200),
            DropdownBackground = Color3.fromRGB(45, 30, 30),
            DropdownTitle = Color3.fromRGB(255, 200, 200),
            DropdownSelected = Color3.fromRGB(190, 140, 140),
            DropdownToggle = Color3.fromRGB(190, 140, 140),
            DropdownStroke = Color3.fromRGB(80, 50, 50),
            DropdownListBackground = Color3.fromRGB(40, 25, 25),
            DropdownListScrollBar = Color3.fromRGB(255, 200, 200),
            DragCosmetic = Color3.fromRGB(255, 200, 200),
            ButtonBackground = Color3.fromRGB(45, 30, 30),
            ElementsBackground = Color3.fromRGB(25, 15, 15),
            NotePromptBackground = Color3.fromRGB(25, 15, 15),
            NotePromptStroke = Color3.fromRGB(80, 50, 50),
            NotePromptShadow = Color3.fromRGB(20, 10, 10),
            NotePromptTitle = Color3.fromRGB(255, 200, 200),
            NotePromptDescription = Color3.fromRGB(200, 150, 150),
            NotePromptIcon = Color3.fromRGB(255, 200, 200),
            NotePromptClose = Color3.fromRGB(190, 140, 140),
            NotePromptButtonBackground = Color3.fromRGB(42, 28, 28),
            NotePromptButtonStroke = Color3.fromRGB(80, 50, 50),
            NotePromptButtonText = Color3.fromRGB(255, 200, 200),
        },
        Synapse = {
            TextFont = "Gotham",
            TextColor = Color3.fromRGB(200, 200, 200),
            Background = Color3.fromRGB(26, 26, 30),
            Topbar = Color3.fromRGB(30, 30, 35),
            Shadow = Color3.fromRGB(20, 20, 25),
            NotificationBackground = Color3.fromRGB(28, 28, 32),
            NotificationActionsBackground = Color3.fromRGB(0, 170, 255),
            NotificationActionsText = Color3.fromRGB(255, 255, 255),
            TabBackground = Color3.fromRGB(35, 35, 40),
            TabStroke = Color3.fromRGB(45, 45, 50),
            TabBackgroundSelected = Color3.fromRGB(0, 170, 255),
            TabTextColor = Color3.fromRGB(200, 200, 200),
            SelectedTabTextColor = Color3.fromRGB(255, 255, 255),
            TabImage = Color3.fromRGB(200, 200, 200),
            ElementBackground = Color3.fromRGB(32, 32, 36),
            ElementBackgroundHover = Color3.fromRGB(38, 38, 44),
            SecondaryElementBackground = Color3.fromRGB(26, 26, 30),
            ElementStroke = Color3.fromRGB(50, 50, 55),
            SecondaryElementStroke = Color3.fromRGB(40, 40, 45),
            SectionTitleBackground = Color3.fromRGB(26, 26, 30),
            SectionTitleText = Color3.fromRGB(150, 150, 160),
            SidebarBackground = Color3.fromRGB(32, 32, 36),
            SliderBackground = Color3.fromRGB(0, 100, 170),
            SliderProgress = Color3.fromRGB(0, 170, 255),
            SliderStroke = Color3.fromRGB(0, 190, 255),
            ToggleBackground = Color3.fromRGB(30, 30, 35),
            ToggleEnabled = Color3.fromRGB(0, 170, 255),
            ToggleDisabled = Color3.fromRGB(90, 90, 95),
            ToggleEnabledStroke = Color3.fromRGB(0, 200, 255),
            ToggleDisabledStroke = Color3.fromRGB(120, 120, 130),
            ToggleEnabledOuterStroke = Color3.fromRGB(60, 120, 180),
            ToggleDisabledOuterStroke = Color3.fromRGB(60, 60, 70),
            InputBackground = Color3.fromRGB(30, 30, 35),
            InputStroke = Color3.fromRGB(50, 50, 55),
            PlaceholderColor = Color3.fromRGB(150, 150, 160),
            Accent = Color3.fromRGB(0, 170, 255),
            LoadingTitle = Color3.fromRGB(200, 200, 200),
            LoadingSubtitle = Color3.fromRGB(150, 150, 160),
            LoadingVersion = Color3.fromRGB(70, 70, 80),
            TopbarCornerRepair = Color3.fromRGB(30, 30, 35),
            TopbarDivider = Color3.fromRGB(45, 45, 50),
            TopbarButtons = Color3.fromRGB(200, 200, 200),
            SearchBarBackground = Color3.fromRGB(38, 38, 44),
            SearchBarStroke = Color3.fromRGB(50, 50, 55),
            SearchBarInputText = Color3.fromRGB(180, 180, 190),
            SearchBarInputPlaceholder = Color3.fromRGB(110, 110, 120),
            SearchBarIcon = Color3.fromRGB(200, 200, 200),
            SearchBarClear = Color3.fromRGB(200, 200, 200),
            SearchBarFilter = Color3.fromRGB(200, 200, 200),
            SideTabListBackground = Color3.fromRGB(32, 32, 36),
            SideTabListStroke = Color3.fromRGB(32, 32, 36),
            SideTabListRDMT = Color3.fromRGB(150, 150, 160),
            SideListItemTitle = Color3.fromRGB(170, 170, 180),
            SideListItemImage = Color3.fromRGB(170, 170, 180),
            SettingsFrameBackground = Color3.fromRGB(28, 28, 32),
            SettingsFrameStroke = Color3.fromRGB(50, 50, 55),
            KeybindBackground = Color3.fromRGB(32, 32, 36),
            KeybindTitle = Color3.fromRGB(200, 200, 200),
            KeybindStroke = Color3.fromRGB(50, 50, 55),
            KeybindFrameBackground = Color3.fromRGB(30, 30, 35),
            KeybindFrameStroke = Color3.fromRGB(60, 60, 70),
            KeybindBoxText = Color3.fromRGB(200, 200, 200),
            DropdownBackground = Color3.fromRGB(32, 32, 36),
            DropdownTitle = Color3.fromRGB(200, 200, 200),
            DropdownSelected = Color3.fromRGB(140, 140, 150),
            DropdownToggle = Color3.fromRGB(140, 140, 150),
            DropdownStroke = Color3.fromRGB(50, 50, 55),
            DropdownListBackground = Color3.fromRGB(28, 28, 32),
            DropdownListScrollBar = Color3.fromRGB(200, 200, 200),
            DragCosmetic = Color3.fromRGB(0, 170, 255),
            ButtonBackground = Color3.fromRGB(32, 32, 36),
            ElementsBackground = Color3.fromRGB(26, 26, 30),
            NotePromptBackground = Color3.fromRGB(26, 26, 30),
            NotePromptStroke = Color3.fromRGB(50, 50, 55),
            NotePromptShadow = Color3.fromRGB(20, 20, 25),
            NotePromptTitle = Color3.fromRGB(200, 200, 200),
            NotePromptDescription = Color3.fromRGB(150, 150, 160),
            NotePromptIcon = Color3.fromRGB(200, 200, 200),
            NotePromptClose = Color3.fromRGB(140, 140, 150),
            NotePromptButtonBackground = Color3.fromRGB(30, 30, 34),
            NotePromptButtonStroke = Color3.fromRGB(50, 50, 55),
            NotePromptButtonText = Color3.fromRGB(200, 200, 200),
        },
        AmberGlow = {
            TextFont = "Gotham",
            TextColor = Color3.fromRGB(255, 245, 230),
            Background = Color3.fromRGB(45, 30, 20),
            Topbar = Color3.fromRGB(55, 40, 25),
            Shadow = Color3.fromRGB(35, 25, 15),
            NotificationBackground = Color3.fromRGB(50, 35, 25),
            NotificationActionsBackground = Color3.fromRGB(245, 200, 150),
            NotificationActionsText = Color3.fromRGB(50, 35, 25),
            TabBackground = Color3.fromRGB(75, 50, 35),
            TabStroke = Color3.fromRGB(90, 60, 45),
            TabBackgroundSelected = Color3.fromRGB(230, 180, 100),
            TabTextColor = Color3.fromRGB(250, 220, 200),
            SelectedTabTextColor = Color3.fromRGB(255, 255, 255),
            TabImage = Color3.fromRGB(250, 220, 200),
            ElementBackground = Color3.fromRGB(60, 45, 35),
            ElementBackgroundHover = Color3.fromRGB(70, 50, 40),
            SecondaryElementBackground = Color3.fromRGB(55, 40, 30),
            ElementStroke = Color3.fromRGB(85, 60, 45),
            SecondaryElementStroke = Color3.fromRGB(75, 50, 35),
            SectionTitleBackground = Color3.fromRGB(45, 30, 20),
            SectionTitleText = Color3.fromRGB(200, 160, 120),
            SidebarBackground = Color3.fromRGB(65, 45, 32),
            SliderBackground = Color3.fromRGB(220, 130, 60),
            SliderProgress = Color3.fromRGB(250, 150, 75),
            SliderStroke = Color3.fromRGB(255, 170, 85),
            ToggleBackground = Color3.fromRGB(55, 40, 30),
            ToggleEnabled = Color3.fromRGB(240, 130, 30),
            ToggleDisabled = Color3.fromRGB(90, 70, 60),
            ToggleEnabledStroke = Color3.fromRGB(255, 160, 50),
            ToggleDisabledStroke = Color3.fromRGB(110, 85, 75),
            ToggleEnabledOuterStroke = Color3.fromRGB(200, 100, 50),
            ToggleDisabledOuterStroke = Color3.fromRGB(75, 60, 55),
            InputBackground = Color3.fromRGB(60, 45, 35),
            InputStroke = Color3.fromRGB(85, 60, 45),
            PlaceholderColor = Color3.fromRGB(190, 150, 130),
            Accent = Color3.fromRGB(230, 180, 100),
            LoadingTitle = Color3.fromRGB(255, 245, 230),
            LoadingSubtitle = Color3.fromRGB(200, 170, 140),
            LoadingVersion = Color3.fromRGB(120, 90, 70),
            TopbarCornerRepair = Color3.fromRGB(55, 40, 25),
            TopbarDivider = Color3.fromRGB(90, 60, 45),
            TopbarButtons = Color3.fromRGB(255, 245, 230),
            SearchBarBackground = Color3.fromRGB(70, 50, 40),
            SearchBarStroke = Color3.fromRGB(85, 60, 45),
            SearchBarInputText = Color3.fromRGB(230, 200, 180),
            SearchBarInputPlaceholder = Color3.fromRGB(150, 120, 100),
            SearchBarIcon = Color3.fromRGB(255, 245, 230),
            SearchBarClear = Color3.fromRGB(255, 245, 230),
            SearchBarFilter = Color3.fromRGB(255, 245, 230),
            SideTabListBackground = Color3.fromRGB(65, 45, 32),
            SideTabListStroke = Color3.fromRGB(65, 45, 32),
            SideTabListRDMT = Color3.fromRGB(200, 170, 140),
            SideListItemTitle = Color3.fromRGB(220, 190, 160),
            SideListItemImage = Color3.fromRGB(220, 190, 160),
            SettingsFrameBackground = Color3.fromRGB(55, 40, 30),
            SettingsFrameStroke = Color3.fromRGB(85, 60, 45),
            KeybindBackground = Color3.fromRGB(60, 45, 35),
            KeybindTitle = Color3.fromRGB(255, 245, 230),
            KeybindStroke = Color3.fromRGB(85, 60, 45),
            KeybindFrameBackground = Color3.fromRGB(55, 40, 30),
            KeybindFrameStroke = Color3.fromRGB(90, 65, 50),
            KeybindBoxText = Color3.fromRGB(255, 245, 230),
            DropdownBackground = Color3.fromRGB(60, 45, 35),
            DropdownTitle = Color3.fromRGB(255, 245, 230),
            DropdownSelected = Color3.fromRGB(190, 150, 120),
            DropdownToggle = Color3.fromRGB(190, 150, 120),
            DropdownStroke = Color3.fromRGB(85, 60, 45),
            DropdownListBackground = Color3.fromRGB(55, 40, 30),
            DropdownListScrollBar = Color3.fromRGB(255, 245, 230),
            DragCosmetic = Color3.fromRGB(255, 245, 230),
            ButtonBackground = Color3.fromRGB(60, 45, 35),
            ElementsBackground = Color3.fromRGB(45, 30, 20),
            NotePromptBackground = Color3.fromRGB(45, 30, 20),
            NotePromptStroke = Color3.fromRGB(85, 60, 45),
            NotePromptShadow = Color3.fromRGB(35, 25, 15),
            NotePromptTitle = Color3.fromRGB(255, 245, 230),
            NotePromptDescription = Color3.fromRGB(200, 170, 140),
            NotePromptIcon = Color3.fromRGB(255, 245, 230),
            NotePromptClose = Color3.fromRGB(190, 150, 120),
            NotePromptButtonBackground = Color3.fromRGB(55, 40, 28),
            NotePromptButtonStroke = Color3.fromRGB(85, 60, 45),
            NotePromptButtonText = Color3.fromRGB(255, 245, 230),
        },
        Amethyst = {
            TextFont = "Gotham",
            TextColor = Color3.fromRGB(240, 240, 240),
            Background = Color3.fromRGB(30, 20, 40),
            Topbar = Color3.fromRGB(40, 25, 50),
            Shadow = Color3.fromRGB(20, 15, 30),
            NotificationBackground = Color3.fromRGB(35, 20, 40),
            NotificationActionsBackground = Color3.fromRGB(180, 140, 200),
            NotificationActionsText = Color3.fromRGB(35, 20, 40),
            TabBackground = Color3.fromRGB(60, 40, 80),
            TabStroke = Color3.fromRGB(70, 45, 90),
            TabBackgroundSelected = Color3.fromRGB(180, 140, 200),
            TabTextColor = Color3.fromRGB(230, 230, 240),
            SelectedTabTextColor = Color3.fromRGB(255, 255, 255),
            TabImage = Color3.fromRGB(230, 230, 240),
            ElementBackground = Color3.fromRGB(45, 30, 60),
            ElementBackgroundHover = Color3.fromRGB(50, 35, 70),
            SecondaryElementBackground = Color3.fromRGB(40, 30, 55),
            ElementStroke = Color3.fromRGB(70, 50, 85),
            SecondaryElementStroke = Color3.fromRGB(65, 45, 80),
            SectionTitleBackground = Color3.fromRGB(30, 20, 40),
            SectionTitleText = Color3.fromRGB(180, 150, 200),
            SidebarBackground = Color3.fromRGB(50, 32, 65),
            SliderBackground = Color3.fromRGB(100, 60, 150),
            SliderProgress = Color3.fromRGB(130, 80, 180),
            SliderStroke = Color3.fromRGB(150, 100, 200),
            ToggleBackground = Color3.fromRGB(45, 30, 55),
            ToggleEnabled = Color3.fromRGB(120, 60, 150),
            ToggleDisabled = Color3.fromRGB(94, 47, 117),
            ToggleEnabledStroke = Color3.fromRGB(140, 80, 170),
            ToggleDisabledStroke = Color3.fromRGB(124, 71, 150),
            ToggleEnabledOuterStroke = Color3.fromRGB(90, 40, 120),
            ToggleDisabledOuterStroke = Color3.fromRGB(80, 50, 110),
            InputBackground = Color3.fromRGB(45, 30, 60),
            InputStroke = Color3.fromRGB(70, 50, 85),
            PlaceholderColor = Color3.fromRGB(178, 150, 200),
            Accent = Color3.fromRGB(180, 140, 200),
            LoadingTitle = Color3.fromRGB(240, 240, 240),
            LoadingSubtitle = Color3.fromRGB(180, 150, 200),
            LoadingVersion = Color3.fromRGB(90, 60, 110),
            TopbarCornerRepair = Color3.fromRGB(40, 25, 50),
            TopbarDivider = Color3.fromRGB(70, 45, 90),
            TopbarButtons = Color3.fromRGB(240, 240, 240),
            SearchBarBackground = Color3.fromRGB(55, 35, 75),
            SearchBarStroke = Color3.fromRGB(70, 50, 85),
            SearchBarInputText = Color3.fromRGB(210, 200, 230),
            SearchBarInputPlaceholder = Color3.fromRGB(140, 120, 160),
            SearchBarIcon = Color3.fromRGB(240, 240, 240),
            SearchBarClear = Color3.fromRGB(240, 240, 240),
            SearchBarFilter = Color3.fromRGB(240, 240, 240),
            SideTabListBackground = Color3.fromRGB(50, 32, 65),
            SideTabListStroke = Color3.fromRGB(50, 32, 65),
            SideTabListRDMT = Color3.fromRGB(180, 150, 200),
            SideListItemTitle = Color3.fromRGB(200, 180, 220),
            SideListItemImage = Color3.fromRGB(200, 180, 220),
            SettingsFrameBackground = Color3.fromRGB(40, 25, 55),
            SettingsFrameStroke = Color3.fromRGB(70, 50, 85),
            KeybindBackground = Color3.fromRGB(45, 30, 60),
            KeybindTitle = Color3.fromRGB(240, 240, 240),
            KeybindStroke = Color3.fromRGB(70, 50, 85),
            KeybindFrameBackground = Color3.fromRGB(40, 25, 55),
            KeybindFrameStroke = Color3.fromRGB(80, 50, 110),
            KeybindBoxText = Color3.fromRGB(240, 240, 240),
            DropdownBackground = Color3.fromRGB(45, 30, 60),
            DropdownTitle = Color3.fromRGB(240, 240, 240),
            DropdownSelected = Color3.fromRGB(160, 130, 190),
            DropdownToggle = Color3.fromRGB(160, 130, 190),
            DropdownStroke = Color3.fromRGB(70, 50, 85),
            DropdownListBackground = Color3.fromRGB(40, 25, 55),
            DropdownListScrollBar = Color3.fromRGB(240, 240, 240),
            DragCosmetic = Color3.fromRGB(240, 240, 240),
            ButtonBackground = Color3.fromRGB(45, 30, 60),
            ElementsBackground = Color3.fromRGB(30, 20, 40),
            NotePromptBackground = Color3.fromRGB(30, 20, 40),
            NotePromptStroke = Color3.fromRGB(70, 50, 85),
            NotePromptShadow = Color3.fromRGB(20, 15, 30),
            NotePromptTitle = Color3.fromRGB(240, 240, 240),
            NotePromptDescription = Color3.fromRGB(180, 150, 200),
            NotePromptIcon = Color3.fromRGB(240, 240, 240),
            NotePromptClose = Color3.fromRGB(160, 130, 190),
            NotePromptButtonBackground = Color3.fromRGB(42, 28, 55),
            NotePromptButtonStroke = Color3.fromRGB(70, 50, 85),
            NotePromptButtonText = Color3.fromRGB(240, 240, 240),
        },
        Bloom = {
            TextFont = "Gotham",
            TextColor = Color3.fromRGB(60, 40, 50),
            Background = Color3.fromRGB(255, 240, 245),
            Topbar = Color3.fromRGB(250, 220, 230),
            Shadow = Color3.fromRGB(230, 190, 200),
            NotificationBackground = Color3.fromRGB(255, 235, 240),
            NotificationActionsBackground = Color3.fromRGB(255, 180, 200),
            NotificationActionsText = Color3.fromRGB(60, 40, 50),
            TabBackground = Color3.fromRGB(250, 215, 225),
            TabStroke = Color3.fromRGB(230, 200, 210),
            TabBackgroundSelected = Color3.fromRGB(255, 180, 200),
            TabTextColor = Color3.fromRGB(100, 60, 80),
            SelectedTabTextColor = Color3.fromRGB(50, 30, 40),
            TabImage = Color3.fromRGB(100, 60, 80),
            ElementBackground = Color3.fromRGB(255, 235, 240),
            ElementBackgroundHover = Color3.fromRGB(250, 225, 235),
            SecondaryElementBackground = Color3.fromRGB(250, 230, 235),
            ElementStroke = Color3.fromRGB(230, 200, 210),
            SecondaryElementStroke = Color3.fromRGB(220, 190, 200),
            SectionTitleBackground = Color3.fromRGB(255, 240, 245),
            SectionTitleText = Color3.fromRGB(140, 100, 120),
            SidebarBackground = Color3.fromRGB(250, 220, 230),
            SliderBackground = Color3.fromRGB(255, 150, 180),
            SliderProgress = Color3.fromRGB(255, 120, 160),
            SliderStroke = Color3.fromRGB(255, 180, 200),
            ToggleBackground = Color3.fromRGB(245, 215, 225),
            ToggleEnabled = Color3.fromRGB(255, 140, 170),
            ToggleDisabled = Color3.fromRGB(210, 190, 195),
            ToggleEnabledStroke = Color3.fromRGB(255, 160, 190),
            ToggleDisabledStroke = Color3.fromRGB(190, 170, 175),
            ToggleEnabledOuterStroke = Color3.fromRGB(230, 170, 190),
            ToggleDisabledOuterStroke = Color3.fromRGB(200, 180, 185),
            InputBackground = Color3.fromRGB(255, 240, 245),
            InputStroke = Color3.fromRGB(230, 200, 210),
            PlaceholderColor = Color3.fromRGB(170, 130, 145),
            Accent = Color3.fromRGB(255, 180, 200),
            LoadingTitle = Color3.fromRGB(60, 40, 50),
            LoadingSubtitle = Color3.fromRGB(100, 70, 85),
            LoadingVersion = Color3.fromRGB(170, 140, 150),
            TopbarCornerRepair = Color3.fromRGB(250, 220, 230),
            TopbarDivider = Color3.fromRGB(230, 200, 210),
            TopbarButtons = Color3.fromRGB(80, 50, 65),
            SearchBarBackground = Color3.fromRGB(250, 230, 238),
            SearchBarStroke = Color3.fromRGB(230, 200, 210),
            SearchBarInputText = Color3.fromRGB(80, 50, 65),
            SearchBarInputPlaceholder = Color3.fromRGB(150, 120, 130),
            SearchBarIcon = Color3.fromRGB(80, 50, 65),
            SearchBarClear = Color3.fromRGB(80, 50, 65),
            SearchBarFilter = Color3.fromRGB(80, 50, 65),
            SideTabListBackground = Color3.fromRGB(250, 222, 232),
            SideTabListStroke = Color3.fromRGB(250, 222, 232),
            SideTabListRDMT = Color3.fromRGB(100, 70, 85),
            SideListItemTitle = Color3.fromRGB(90, 60, 75),
            SideListItemImage = Color3.fromRGB(90, 60, 75),
            SettingsFrameBackground = Color3.fromRGB(252, 235, 242),
            SettingsFrameStroke = Color3.fromRGB(230, 200, 210),
            KeybindBackground = Color3.fromRGB(255, 235, 240),
            KeybindTitle = Color3.fromRGB(60, 40, 50),
            KeybindStroke = Color3.fromRGB(230, 200, 210),
            KeybindFrameBackground = Color3.fromRGB(250, 230, 238),
            KeybindFrameStroke = Color3.fromRGB(220, 190, 200),
            KeybindBoxText = Color3.fromRGB(60, 40, 50),
            DropdownBackground = Color3.fromRGB(255, 235, 240),
            DropdownTitle = Color3.fromRGB(60, 40, 50),
            DropdownSelected = Color3.fromRGB(130, 90, 110),
            DropdownToggle = Color3.fromRGB(130, 90, 110),
            DropdownStroke = Color3.fromRGB(230, 200, 210),
            DropdownListBackground = Color3.fromRGB(252, 235, 242),
            DropdownListScrollBar = Color3.fromRGB(80, 50, 65),
            DragCosmetic = Color3.fromRGB(80, 50, 65),
            ButtonBackground = Color3.fromRGB(255, 235, 240),
            ElementsBackground = Color3.fromRGB(255, 240, 245),
            NotePromptBackground = Color3.fromRGB(255, 240, 245),
            NotePromptStroke = Color3.fromRGB(230, 200, 210),
            NotePromptShadow = Color3.fromRGB(225, 190, 200),
            NotePromptTitle = Color3.fromRGB(60, 40, 50),
            NotePromptDescription = Color3.fromRGB(100, 70, 85),
            NotePromptIcon = Color3.fromRGB(80, 50, 65),
            NotePromptClose = Color3.fromRGB(130, 90, 110),
            NotePromptButtonBackground = Color3.fromRGB(250, 232, 240),
            NotePromptButtonStroke = Color3.fromRGB(230, 200, 210),
            NotePromptButtonText = Color3.fromRGB(60, 40, 50),
        },
        DarkBlue = {
            TextFont = "Gotham",
            TextColor = Color3.fromRGB(230, 230, 230),
            Background = Color3.fromRGB(20, 25, 30),
            Topbar = Color3.fromRGB(30, 35, 40),
            Shadow = Color3.fromRGB(15, 20, 25),
            NotificationBackground = Color3.fromRGB(25, 30, 35),
            NotificationActionsBackground = Color3.fromRGB(60, 100, 150),
            NotificationActionsText = Color3.fromRGB(230, 230, 230),
            TabBackground = Color3.fromRGB(35, 40, 50),
            TabStroke = Color3.fromRGB(45, 55, 65),
            TabBackgroundSelected = Color3.fromRGB(50, 90, 140),
            TabTextColor = Color3.fromRGB(200, 210, 220),
            SelectedTabTextColor = Color3.fromRGB(255, 255, 255),
            TabImage = Color3.fromRGB(200, 210, 220),
            ElementBackground = Color3.fromRGB(30, 35, 45),
            ElementBackgroundHover = Color3.fromRGB(40, 45, 55),
            SecondaryElementBackground = Color3.fromRGB(25, 30, 40),
            ElementStroke = Color3.fromRGB(45, 55, 65),
            SecondaryElementStroke = Color3.fromRGB(40, 50, 60),
            SectionTitleBackground = Color3.fromRGB(20, 25, 30),
            SectionTitleText = Color3.fromRGB(150, 165, 180),
            SidebarBackground = Color3.fromRGB(30, 38, 48),
            SliderBackground = Color3.fromRGB(40, 90, 150),
            SliderProgress = Color3.fromRGB(50, 120, 200),
            SliderStroke = Color3.fromRGB(60, 140, 220),
            ToggleBackground = Color3.fromRGB(30, 35, 45),
            ToggleEnabled = Color3.fromRGB(50, 130, 210),
            ToggleDisabled = Color3.fromRGB(70, 80, 90),
            ToggleEnabledStroke = Color3.fromRGB(60, 150, 240),
            ToggleDisabledStroke = Color3.fromRGB(85, 95, 105),
            ToggleEnabledOuterStroke = Color3.fromRGB(40, 100, 170),
            ToggleDisabledOuterStroke = Color3.fromRGB(55, 65, 75),
            InputBackground = Color3.fromRGB(28, 33, 42),
            InputStroke = Color3.fromRGB(45, 55, 65),
            PlaceholderColor = Color3.fromRGB(140, 155, 170),
            Accent = Color3.fromRGB(50, 90, 140),
            LoadingTitle = Color3.fromRGB(230, 230, 230),
            LoadingSubtitle = Color3.fromRGB(170, 185, 200),
            LoadingVersion = Color3.fromRGB(70, 85, 100),
            TopbarCornerRepair = Color3.fromRGB(30, 35, 40),
            TopbarDivider = Color3.fromRGB(45, 55, 65),
            TopbarButtons = Color3.fromRGB(230, 230, 230),
            SearchBarBackground = Color3.fromRGB(38, 45, 55),
            SearchBarStroke = Color3.fromRGB(45, 55, 65),
            SearchBarInputText = Color3.fromRGB(200, 210, 220),
            SearchBarInputPlaceholder = Color3.fromRGB(120, 135, 150),
            SearchBarIcon = Color3.fromRGB(230, 230, 230),
            SearchBarClear = Color3.fromRGB(230, 230, 230),
            SearchBarFilter = Color3.fromRGB(230, 230, 230),
            SideTabListBackground = Color3.fromRGB(30, 38, 48),
            SideTabListStroke = Color3.fromRGB(30, 38, 48),
            SideTabListRDMT = Color3.fromRGB(170, 185, 200),
            SideListItemTitle = Color3.fromRGB(180, 195, 210),
            SideListItemImage = Color3.fromRGB(180, 195, 210),
            SettingsFrameBackground = Color3.fromRGB(28, 33, 42),
            SettingsFrameStroke = Color3.fromRGB(45, 55, 65),
            KeybindBackground = Color3.fromRGB(30, 35, 45),
            KeybindTitle = Color3.fromRGB(230, 230, 230),
            KeybindStroke = Color3.fromRGB(45, 55, 65),
            KeybindFrameBackground = Color3.fromRGB(28, 33, 42),
            KeybindFrameStroke = Color3.fromRGB(50, 60, 70),
            KeybindBoxText = Color3.fromRGB(230, 230, 230),
            DropdownBackground = Color3.fromRGB(30, 35, 45),
            DropdownTitle = Color3.fromRGB(230, 230, 230),
            DropdownSelected = Color3.fromRGB(150, 165, 180),
            DropdownToggle = Color3.fromRGB(150, 165, 180),
            DropdownStroke = Color3.fromRGB(45, 55, 65),
            DropdownListBackground = Color3.fromRGB(28, 33, 42),
            DropdownListScrollBar = Color3.fromRGB(230, 230, 230),
            DragCosmetic = Color3.fromRGB(230, 230, 230),
            ButtonBackground = Color3.fromRGB(30, 35, 45),
            ElementsBackground = Color3.fromRGB(20, 25, 30),
            NotePromptBackground = Color3.fromRGB(20, 25, 30),
            NotePromptStroke = Color3.fromRGB(45, 55, 65),
            NotePromptShadow = Color3.fromRGB(15, 20, 25),
            NotePromptTitle = Color3.fromRGB(230, 230, 230),
            NotePromptDescription = Color3.fromRGB(170, 185, 200),
            NotePromptIcon = Color3.fromRGB(230, 230, 230),
            NotePromptClose = Color3.fromRGB(150, 165, 180),
            NotePromptButtonBackground = Color3.fromRGB(28, 34, 40),
            NotePromptButtonStroke = Color3.fromRGB(45, 55, 65),
            NotePromptButtonText = Color3.fromRGB(230, 230, 230),
        },
        Serenity = {
            TextFont = "Gotham",
            TextColor = Color3.fromRGB(50, 55, 65),
            Background = Color3.fromRGB(240, 245, 250),
            Topbar = Color3.fromRGB(220, 228, 238),
            Shadow = Color3.fromRGB(200, 210, 220),
            NotificationBackground = Color3.fromRGB(230, 238, 245),
            NotificationActionsBackground = Color3.fromRGB(180, 200, 220),
            NotificationActionsText = Color3.fromRGB(50, 55, 65),
            TabBackground = Color3.fromRGB(210, 220, 230),
            TabStroke = Color3.fromRGB(190, 200, 210),
            TabBackgroundSelected = Color3.fromRGB(150, 175, 200),
            TabTextColor = Color3.fromRGB(70, 80, 90),
            SelectedTabTextColor = Color3.fromRGB(40, 45, 55),
            TabImage = Color3.fromRGB(70, 80, 90),
            ElementBackground = Color3.fromRGB(225, 232, 242),
            ElementBackgroundHover = Color3.fromRGB(215, 225, 235),
            SecondaryElementBackground = Color3.fromRGB(220, 228, 238),
            ElementStroke = Color3.fromRGB(195, 205, 215),
            SecondaryElementStroke = Color3.fromRGB(185, 195, 205),
            SectionTitleBackground = Color3.fromRGB(240, 245, 250),
            SectionTitleText = Color3.fromRGB(100, 115, 130),
            SidebarBackground = Color3.fromRGB(215, 225, 235),
            SliderBackground = Color3.fromRGB(140, 175, 210),
            SliderProgress = Color3.fromRGB(100, 150, 200),
            SliderStroke = Color3.fromRGB(120, 165, 210),
            ToggleBackground = Color3.fromRGB(215, 225, 235),
            ToggleEnabled = Color3.fromRGB(90, 160, 220),
            ToggleDisabled = Color3.fromRGB(180, 185, 190),
            ToggleEnabledStroke = Color3.fromRGB(80, 150, 210),
            ToggleDisabledStroke = Color3.fromRGB(160, 165, 170),
            ToggleEnabledOuterStroke = Color3.fromRGB(130, 160, 190),
            ToggleDisabledOuterStroke = Color3.fromRGB(165, 170, 180),
            InputBackground = Color3.fromRGB(230, 238, 245),
            InputStroke = Color3.fromRGB(195, 205, 215),
            PlaceholderColor = Color3.fromRGB(130, 140, 155),
            Accent = Color3.fromRGB(150, 175, 200),
            LoadingTitle = Color3.fromRGB(50, 55, 65),
            LoadingSubtitle = Color3.fromRGB(90, 100, 115),
            LoadingVersion = Color3.fromRGB(150, 160, 175),
            TopbarCornerRepair = Color3.fromRGB(220, 228, 238),
            TopbarDivider = Color3.fromRGB(190, 200, 210),
            TopbarButtons = Color3.fromRGB(60, 70, 80),
            SearchBarBackground = Color3.fromRGB(225, 235, 245),
            SearchBarStroke = Color3.fromRGB(195, 205, 215),
            SearchBarInputText = Color3.fromRGB(60, 70, 80),
            SearchBarInputPlaceholder = Color3.fromRGB(130, 140, 155),
            SearchBarIcon = Color3.fromRGB(60, 70, 80),
            SearchBarClear = Color3.fromRGB(60, 70, 80),
            SearchBarFilter = Color3.fromRGB(60, 70, 80),
            SideTabListBackground = Color3.fromRGB(218, 228, 238),
            SideTabListStroke = Color3.fromRGB(218, 228, 238),
            SideTabListRDMT = Color3.fromRGB(90, 100, 115),
            SideListItemTitle = Color3.fromRGB(75, 85, 100),
            SideListItemImage = Color3.fromRGB(75, 85, 100),
            SettingsFrameBackground = Color3.fromRGB(228, 235, 245),
            SettingsFrameStroke = Color3.fromRGB(195, 205, 215),
            KeybindBackground = Color3.fromRGB(225, 232, 242),
            KeybindTitle = Color3.fromRGB(50, 55, 65),
            KeybindStroke = Color3.fromRGB(195, 205, 215),
            KeybindFrameBackground = Color3.fromRGB(230, 238, 245),
            KeybindFrameStroke = Color3.fromRGB(185, 195, 205),
            KeybindBoxText = Color3.fromRGB(50, 55, 65),
            DropdownBackground = Color3.fromRGB(225, 232, 242),
            DropdownTitle = Color3.fromRGB(50, 55, 65),
            DropdownSelected = Color3.fromRGB(100, 115, 130),
            DropdownToggle = Color3.fromRGB(100, 115, 130),
            DropdownStroke = Color3.fromRGB(195, 205, 215),
            DropdownListBackground = Color3.fromRGB(230, 238, 245),
            DropdownListScrollBar = Color3.fromRGB(60, 70, 80),
            DragCosmetic = Color3.fromRGB(60, 70, 80),
            ButtonBackground = Color3.fromRGB(225, 232, 242),
            ElementsBackground = Color3.fromRGB(240, 245, 250),
            NotePromptBackground = Color3.fromRGB(240, 245, 250),
            NotePromptStroke = Color3.fromRGB(195, 205, 215),
            NotePromptShadow = Color3.fromRGB(195, 205, 215),
            NotePromptTitle = Color3.fromRGB(50, 55, 65),
            NotePromptDescription = Color3.fromRGB(90, 100, 115),
            NotePromptIcon = Color3.fromRGB(60, 70, 80),
            NotePromptClose = Color3.fromRGB(100, 115, 130),
            NotePromptButtonBackground = Color3.fromRGB(222, 232, 242),
            NotePromptButtonStroke = Color3.fromRGB(195, 205, 215),
            NotePromptButtonText = Color3.fromRGB(50, 55, 65),
        },
    }
}

local SelectedTheme = ArrayFieldLibrary.Theme.Default
local DeveloperSelectedTheme = nil
local CurrentThemeName = nil
local MobileButtonOriginalSize = nil
local MobileButtonOriginalPos = nil
local Hidden = false
local Minimised = false
local Debounce = false
local SideBarClosed = true
local SearchHided = true
local SettingsOpen = false
local SettingsDropdownOpen = false
local SettingsOpen = false
local isMobileButtonVisible = false
local SideBarLoaded = false
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

local ArrayField = game:GetObjects("rbxassetid://91567081281322")[1]
local DiscordButtonOriginalText = "ArrayField UI's Discord"
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

local Camera = workspace.CurrentCamera
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
local Prompt = Main.Prompt
local NotePrompt = Main.NotePrompt
local MobileButton = ArrayField:FindFirstChild("MobileButton")

local MouseOverSettings = false

SettingsFrame.MouseEnter:Connect(function()
    MouseOverSettings = true
end)

SettingsFrame.MouseLeave:Connect(function()
    MouseOverSettings = false
end)

local function ShouldBlockHover()
    return MouseOverSettings and SettingsFrame.Visible
end

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

local neon = (function()  --Open sourced neon module
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
	if false == nil then
		RootParent = Camera
	else
		if not false then
			RootParent = Camera
		else
			RootParent = nil
		end
	end


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
					local vec = tl
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

ArrayFieldLibrary.Flags = {}
ArrayFieldLibrary.ConfigEnabled = false
ArrayFieldLibrary.ConfigFolder = "ArrayField"
ArrayFieldLibrary.ConfigFileName = "ArrayField"

function ArrayFieldLibrary.SaveConfiguration()
    if not ArrayFieldLibrary.ConfigEnabled then return end

    local Data = {}
    for FlagName, Flag in pairs(ArrayFieldLibrary.Flags) do
        if Flag.Type == "ColorPicker" then
            local c = Flag.Color
            Data[FlagName] = {R = math.floor(c.R * 255), G = math.floor(c.G * 255), B = math.floor(c.B * 255)}
        elseif Flag.Type == "Dropdown" then
            if Flag.Items and Flag.Items.Selected then
                local selected = {}
                for _, item in ipairs(Flag.Items.Selected) do
                    table.insert(selected, item.Option.Name)
                end
                if #selected > 0 then
                    Data[FlagName] = selected
                end
            end
        else
            if typeof(Flag.CurrentValue) == 'boolean' then
                Data[FlagName] = Flag.CurrentValue
            else
                Data[FlagName] = Flag.CurrentValue or Flag.CurrentKeybind
            end
        end
    end

    local success, encoded = pcall(function()
        return HttpService:JSONEncode(Data)
    end)

    if success and encoded then
        pcall(function()
            writefile(ArrayFieldLibrary.ConfigFolder .. "/" .. ArrayFieldLibrary.ConfigFileName .. ".json", encoded)
        end)
    end
end

function ArrayFieldLibrary.LoadConfiguration()
    if not ArrayFieldLibrary.ConfigEnabled then
        return
    end

    local FilePath = ArrayFieldLibrary.ConfigFolder .. "/" .. ArrayFieldLibrary.ConfigFileName .. ".json"

    if not isfile(FilePath) then
        return
    end

    local fileContent = readfile(FilePath)

    local success, decoded = pcall(function()
        return HttpService:JSONDecode(fileContent)
    end)

    if not success or not decoded then
        return
    end

    local loadedCount = 0

    for FlagName, FlagValue in pairs(decoded) do
        local Flag = ArrayFieldLibrary.Flags[FlagName]
        if Flag then
            task.spawn(function()
                if Flag.Type == "ColorPicker" then
                    if typeof(FlagValue) == "table" and FlagValue.R then
                        Flag:Set(Color3.fromRGB(FlagValue.R, FlagValue.G, FlagValue.B))
                    end
                elseif Flag.Type == "Dropdown" then
                    if typeof(FlagValue) == "table" then
                        Flag:Set(FlagValue)
                    else
                        Flag:Set(FlagValue)
                    end
                else
                    Flag:Set(FlagValue)
                end
            end)
            loadedCount = loadedCount + 1
        end
    end

    if loadedCount > 0 then
        ArrayFieldLibrary:Notify({
            Title = "Configuration Savings Loaded",
            Content = "Successfully Restored your configuration settings from your past ",
            Duration = 3
        })
    end
end

local function SaveSettings()
    if not writefile then return end

    local existingData = {}
    if isfile and isfile(SETTINGS_FILE) then
        local s, content = pcall(readfile, SETTINGS_FILE)
        if s and content then
            local ds, data = pcall(HttpService.JSONDecode, HttpService, content)
            if ds and type(data) == "table" then
                existingData = data
            end
        end
    end

    existingData.UnhideKeybind = UnhideKeybind.Name
    existingData.Theme = CurrentThemeName
    existingData.ConfigStates = existingData.ConfigStates or {}

    if ArrayFieldLibrary.ConfigFolder and ArrayFieldLibrary.ConfigFileName then
        local key = ArrayFieldLibrary.ConfigFolder .. "/" .. ArrayFieldLibrary.ConfigFileName
        existingData.ConfigStates[key] = ArrayFieldLibrary.ConfigEnabled
    end

    local success, encoded = pcall(function()
        return HttpService:JSONEncode(existingData)
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

            if data.Theme == "ArrayField" then
                SelectedTheme = ArrayFieldLibrary.Theme.Default
            elseif data.Theme == "Dev Selected" then
                SelectedTheme = DeveloperSelectedTheme or ArrayFieldLibrary.Theme.Default
            elseif ArrayFieldLibrary.Theme[data.Theme] then
                SelectedTheme = ArrayFieldLibrary.Theme[data.Theme]
            else
                SelectedTheme = ArrayFieldLibrary.Theme.Default
            end
        end
        if data.ConfigStates then
            ArrayFieldLibrary._ConfigStates = data.ConfigStates
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

    local customBgColors = {
        Color3.fromRGB(180, 130, 30),
        Color3.fromRGB(50, 140, 50),
        Color3.fromRGB(160, 50, 50)
    }

    local function hasCustomBackground(element)
        if not element:FindFirstChild("BackgroundColor3") then return false end
        local bg = element.BackgroundColor3
        for _, customColor in ipairs(customBgColors) do
            if math.abs(bg.R - customColor.R) < 0.01 and math.abs(bg.G - customColor.G) < 0.01 and math.abs(bg.B - customColor.B) < 0.01 then
                return true
            end
        end
        if bg ~= SelectedTheme.SecondaryElementBackground and bg ~= SelectedTheme.ElementBackground then
            local isThemeColor = false
            for _, v in pairs(SelectedTheme) do
                if typeof(v) == "Color3" and math.abs(bg.R - v.R) < 0.01 and math.abs(bg.G - v.G) < 0.01 and math.abs(bg.B - v.B) < 0.01 then
                    isThemeColor = true
                    break
                end
            end
            if not isThemeColor then
                return true
            end
        end
        return false
    end

    Main.BackgroundColor3 = SelectedTheme.Background
    Topbar.BackgroundColor3 = SelectedTheme.Topbar
    if Topbar.Title then Topbar.Title.TextColor3 = SelectedTheme.TextColor end
    if Topbar.Divider then Topbar.Divider.BackgroundColor3 = SelectedTheme.TopbarDivider end
    if Topbar.CornerRepair then Topbar.CornerRepair.BackgroundColor3 = SelectedTheme.TopbarCornerRepair end
    if Main.Shadow and Main.Shadow.Image then Main.Shadow.Image.ImageColor3 = SelectedTheme.Shadow end

    for _, btn in ipairs(Topbar:GetChildren()) do
        if btn:IsA("ImageButton") then btn.ImageColor3 = SelectedTheme.TopbarButtons end
    end

    SideTabList.BackgroundColor3 = SelectedTheme.SideTabListBackground
    if SideTabList:FindFirstChild("UIStroke") then SideTabList.UIStroke.Color = SelectedTheme.SideTabListStroke end
    if SideTabList:FindFirstChild("RDMT") then SideTabList.RDMT.TextColor3 = SelectedTheme.SideTabListRDMT end

    for _, tabbtn in pairs(SideList:GetChildren()) do
        if tabbtn.ClassName == "Frame" and tabbtn.Name ~= "Placeholder" and tabbtn.Name ~= "SideTemplate" then
            if tabbtn.Name:match("^Category_") then
                if tabbtn:FindFirstChild("Title") then
                    tabbtn.Title.TextColor3 = SelectedTheme.TextColor or SelectedTheme.SideListItemTitle
                end
                if tabbtn.Title and tabbtn.Title:FindFirstChild("ImageButton") then
                    tabbtn.Title.ImageButton.ImageColor3 = SelectedTheme.TextColor or SelectedTheme.SideListItemImage
                end
                if tabbtn:FindFirstChild("Holder") then
                    for _, cattab in pairs(tabbtn.Holder:GetChildren()) do
                        if cattab:IsA("Frame") and cattab.Name ~= "Placeholder" then
                            if cattab:FindFirstChild("Title") then
                                cattab.Title.TextColor3 = SelectedTheme.SideListItemTitle
                            end
                            if cattab:FindFirstChild("Image") then
                                cattab.Image.ImageColor3 = SelectedTheme.SideListItemImage
                            end
                        end
                    end
                end
            else
                if tabbtn:FindFirstChild("Title") then tabbtn.Title.TextColor3 = SelectedTheme.SideListItemTitle end
                if tabbtn:FindFirstChild("Image") then tabbtn.Image.ImageColor3 = SelectedTheme.SideListItemImage end
            end
        end
    end

    Elements.BackgroundColor3 = SelectedTheme.ElementsBackground

    SearchBar.BackgroundColor3 = SelectedTheme.SearchBarBackground
    if SearchBar:FindFirstChild("UIStroke") then SearchBar.UIStroke.Color = SelectedTheme.SearchBarStroke end
    if SearchBar:FindFirstChild("Input") then
        SearchBar.Input.TextColor3 = SelectedTheme.SearchBarInputText
        SearchBar.Input.PlaceholderColor3 = SelectedTheme.SearchBarInputPlaceholder
    end
    if SearchBar:FindFirstChild("Icon") then SearchBar.Icon.ImageColor3 = SelectedTheme.SearchBarIcon end
    if SearchBar:FindFirstChild("Clear") then SearchBar.Clear.ImageColor3 = SelectedTheme.SearchBarClear end
    if SearchBar:FindFirstChild("Filter") then SearchBar.Filter.ImageColor3 = SelectedTheme.SearchBarFilter end

    SettingsFrame.BackgroundColor3 = SelectedTheme.SettingsFrameBackground
    if SettingsFrame:FindFirstChild("UIStroke") then SettingsFrame.UIStroke.Color = SelectedTheme.SettingsFrameStroke end

    local SettingsInnerFrame = SettingsFrame:FindFirstChild("Frame")
    if SettingsInnerFrame then
        for _, child in pairs(SettingsInnerFrame:GetChildren()) do
            if child:IsA("TextLabel") then
                child.TextColor3 = SelectedTheme.TextColor
            end
        end

        local SettingsKeybind = SettingsInnerFrame:FindFirstChild("Keybind")
        if SettingsKeybind then
            SettingsKeybind.BackgroundColor3 = SelectedTheme.KeybindBackground
            if SettingsKeybind:FindFirstChild("UIStroke") then
                SettingsKeybind.UIStroke.Color = SelectedTheme.KeybindStroke
            end
            if SettingsKeybind:FindFirstChild("Title") then
                SettingsKeybind.Title.TextColor3 = SelectedTheme.KeybindTitle
            end
            local KeybindFrame = SettingsKeybind:FindFirstChild("KeybindFrame")
            if KeybindFrame then
                KeybindFrame.BackgroundColor3 = SelectedTheme.KeybindFrameBackground
                if KeybindFrame:FindFirstChild("UIStroke") then
                    KeybindFrame.UIStroke.Color = SelectedTheme.KeybindFrameStroke
                end
                if KeybindFrame:FindFirstChild("KeybindBox") then
                    KeybindFrame.KeybindBox.TextColor3 = SelectedTheme.KeybindBoxText
                end
            end
        end

        local SettingsToggle = SettingsInnerFrame:FindFirstChild("Toggle")
        if SettingsToggle then
            SettingsToggle.BackgroundColor3 = SelectedTheme.ElementBackground
            if SettingsToggle:FindFirstChild("UIStroke") then
                SettingsToggle.UIStroke.Color = SelectedTheme.ElementStroke
            end
            if SettingsToggle:FindFirstChild("Title") then
                SettingsToggle.Title.TextColor3 = SelectedTheme.TextColor
            end
            local Switch = SettingsToggle:FindFirstChild("Switch")
            if Switch then
                Switch.BackgroundColor3 = SelectedTheme.ToggleBackground
                local Indicator = Switch:FindFirstChild("Indicator")
                if Indicator then
                    local isOn = Indicator.Position.X.Offset > -30
                    if isOn then
                        if Switch:FindFirstChild("UIStroke") then
                            Switch.UIStroke.Color = SelectedTheme.ToggleEnabledOuterStroke
                        end
                        if Indicator:FindFirstChild("UIStroke") then
                            Indicator.UIStroke.Color = SelectedTheme.ToggleEnabledStroke
                        end
                        Indicator.BackgroundColor3 = SelectedTheme.ToggleEnabled
                    else
                        if Switch:FindFirstChild("UIStroke") then
                            Switch.UIStroke.Color = SelectedTheme.ToggleDisabledOuterStroke
                        end
                        if Indicator:FindFirstChild("UIStroke") then
                            Indicator.UIStroke.Color = SelectedTheme.ToggleDisabledStroke
                        end
                        Indicator.BackgroundColor3 = SelectedTheme.ToggleDisabled
                    end
                end
            end
        end

        local SettingsDropdown = SettingsInnerFrame:FindFirstChild("Dropdown")
        if SettingsDropdown then
            SettingsDropdown.BackgroundColor3 = SelectedTheme.DropdownBackground
            if SettingsDropdown:FindFirstChild("UIStroke") then
                SettingsDropdown.UIStroke.Color = SelectedTheme.DropdownStroke
            end
            if SettingsDropdown:FindFirstChild("Title") then
                SettingsDropdown.Title.TextColor3 = SelectedTheme.DropdownTitle
            end
            if SettingsDropdown:FindFirstChild("Selected") then
                SettingsDropdown.Selected.TextColor3 = SelectedTheme.DropdownSelected
            end
            if SettingsDropdown:FindFirstChild("Toggle") then
                SettingsDropdown.Toggle.ImageColor3 = SelectedTheme.DropdownToggle
            end
            local SettingsList = SettingsDropdown:FindFirstChild("List")
            if SettingsList then
                SettingsList.BackgroundColor3 = SelectedTheme.DropdownListBackground
                SettingsList.ScrollBarImageColor3 = SelectedTheme.DropdownListScrollBar
                for _, opt in pairs(SettingsList:GetChildren()) do
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

        local SettingsButton = SettingsInnerFrame:FindFirstChild("Button")
        if SettingsButton then
            SettingsButton.BackgroundColor3 = SelectedTheme.ElementBackground
            if SettingsButton:FindFirstChild("UIStroke") then
                SettingsButton.UIStroke.Color = SelectedTheme.ElementStroke
            end
            if SettingsButton:FindFirstChild("Title") then
                SettingsButton.Title.TextColor3 = SelectedTheme.TextColor
            end
        end
    end

    if NotePrompt then
        NotePrompt.BackgroundColor3 = SelectedTheme.NotePromptBackground
        if NotePrompt:FindFirstChild("UIStroke") then
            NotePrompt.UIStroke.Color = SelectedTheme.NotePromptStroke
        end
        if NotePrompt:FindFirstChild("Shadow") and NotePrompt.Shadow:FindFirstChild("Image") then
            NotePrompt.Shadow.Image.ImageColor3 = SelectedTheme.NotePromptShadow
        end
        if NotePrompt:FindFirstChild("Title") then
            NotePrompt.Title.TextColor3 = SelectedTheme.NotePromptTitle
        end
        if NotePrompt:FindFirstChild("Description") then
            NotePrompt.Description.TextColor3 = SelectedTheme.NotePromptDescription
        end
        if NotePrompt:FindFirstChild("Icon") then
            NotePrompt.Icon.ImageColor3 = SelectedTheme.NotePromptIcon
        end
        if NotePrompt:FindFirstChild("Close") then
            NotePrompt.Close.ImageColor3 = SelectedTheme.NotePromptClose
        end
        if NotePrompt:FindFirstChild("Load") then
            NotePrompt.Load.BackgroundColor3 = SelectedTheme.NotePromptButtonBackground
            NotePrompt.Load.TextColor3 = SelectedTheme.NotePromptButtonText
            if NotePrompt.Load:FindFirstChild("UIStroke") then
                NotePrompt.Load.UIStroke.Color = SelectedTheme.NotePromptButtonStroke
            end
        end
    end

    DragCosmetic.BackgroundColor3 = SelectedTheme.DragCosmetic

    for _, TabButton in ipairs(TopList:GetChildren()) do
        if TabButton.ClassName == "Frame" and TabButton.Name ~= "Placeholder" and TabButton.Name ~= "Template" then
            local isSelected = TabButton.BackgroundColor3 == SelectedTheme.TabBackgroundSelected or TabButton.BackgroundTransparency < 0.5

            if TabButton:FindFirstChild("Title") then
                TabButton.Title.TextColor3 = isSelected and SelectedTheme.SelectedTabTextColor or SelectedTheme.TabTextColor
            end
            if TabButton:FindFirstChild("Image") then
                TabButton.Image.ImageColor3 = isSelected and SelectedTheme.SelectedTabTextColor or SelectedTheme.TabImage
            end
            if TabButton:FindFirstChild("UIStroke") then
                TabButton.UIStroke.Color = SelectedTheme.TabStroke
            end
        end
    end

    LoadingFrame.Title.TextColor3 = SelectedTheme.LoadingTitle
    LoadingFrame.Subtitle.TextColor3 = SelectedTheme.LoadingSubtitle
    if LoadingFrame:FindFirstChild("Version") then LoadingFrame.Version.TextColor3 = SelectedTheme.LoadingVersion end

    for _, tabPage in pairs(Elements:GetChildren()) do
        if tabPage:IsA("ScrollingFrame") and tabPage.Name ~= "Template" then

            for _, element in pairs(tabPage:GetDescendants()) do

                if element.Name == "Progress" and element:IsA("Frame") then
                    element.BackgroundColor3 = SelectedTheme.SliderProgress
                end

                if element.Name == "Main" and element.Parent and element.Parent:FindFirstChild("Title") and element:FindFirstChild("Progress") then
                    element.BackgroundColor3 = SelectedTheme.SliderBackground
                    if element:FindFirstChild("UIStroke") then
                        element.UIStroke.Color = SelectedTheme.SliderStroke
                    end
                    if element:FindFirstChild("Information") then
                        element.Information.TextColor3 = SelectedTheme.TextColor
                    end
                end

                if element.Name == "Switch" and element:IsA("Frame") and element:FindFirstChild("Indicator") then
                    local indicator = element.Indicator
                    local isOn = indicator.Position.X.Offset > -30

                    element.BackgroundColor3 = SelectedTheme.ToggleBackground

                    if isOn then
                        if element:FindFirstChild("UIStroke") then
                            element.UIStroke.Color = SelectedTheme.ToggleEnabledOuterStroke
                        end
                        if indicator:FindFirstChild("UIStroke") then
                            indicator.UIStroke.Color = SelectedTheme.ToggleEnabledStroke
                        end
                        indicator.BackgroundColor3 = SelectedTheme.ToggleEnabled
                    else
                        if element:FindFirstChild("UIStroke") then
                            element.UIStroke.Color = SelectedTheme.ToggleDisabledOuterStroke
                        end
                        if indicator:FindFirstChild("UIStroke") then
                            indicator.UIStroke.Color = SelectedTheme.ToggleDisabledStroke
                        end
                        indicator.BackgroundColor3 = SelectedTheme.ToggleDisabled
                    end
                end

            for _, element in pairs(tabPage:GetDescendants()) do
                if element.Name == "InputFrame" and element:IsA("Frame") and element:FindFirstChild("InputBox") then
                    element.BackgroundColor3 = SelectedTheme.InputBackground
                    if element:FindFirstChild("UIStroke") then
                        element.UIStroke.Color = SelectedTheme.InputStroke
                    end
                end

                if element.Name == "Toggle" and (element:IsA("ImageLabel") or element:IsA("ImageButton")) then
                    local parent = element.Parent
                    if parent and parent:FindFirstChild("Selected") and parent:FindFirstChild("List") then
                        element.ImageColor3 = SelectedTheme.DropdownToggle
                    end
                end

                if element.Name == "KeybindFrame" and element:IsA("Frame") and element:FindFirstChild("KeybindBox") then
                    element.BackgroundColor3 = SelectedTheme.InputBackground
                    if element:FindFirstChild("UIStroke") then
                        element.UIStroke.Color = SelectedTheme.InputStroke
                    end
                end

                if element.Name == "List" and element:IsA("ScrollingFrame") and element.Parent and element.Parent:FindFirstChild("Selected") then
                    for _, opt in pairs(element:GetChildren()) do
                        if opt:IsA("Frame") and opt.Name ~= "Template" and opt.Name ~= "PlaceHolder" and opt.Name ~= "-SearchBar" then
                            local isSelected = opt.BackgroundColor3 ~= Color3.fromRGB(30, 30, 30) and opt.BackgroundColor3 ~= SelectedTheme.SecondaryElementBackground
                            if isSelected then
                                opt.BackgroundColor3 = SelectedTheme.ElementBackgroundHover
                            else
                                opt.BackgroundColor3 = SelectedTheme.SecondaryElementBackground
                            end
                            if opt:FindFirstChild("UIStroke") then
                                opt.UIStroke.Color = SelectedTheme.SecondaryElementStroke
                            end
                            if opt:FindFirstChild("Title") then
                                opt.Title.TextColor3 = SelectedTheme.TextColor
                            end
                        end
                    end
                end

                if element.Name == "ColorPicker" or element:FindFirstChild("CPBackground") then
                    if element:IsA("Frame") then
                        element.BackgroundColor3 = SelectedTheme.ElementBackground
                        if element:FindFirstChild("UIStroke") then
                            element.UIStroke.Color = SelectedTheme.ElementStroke
                        end
                        if element:FindFirstChild("Title") then
                            element.Title.TextColor3 = SelectedTheme.TextColor
                        end
                        if element:FindFirstChild("HexInput") then
                            element.HexInput.BackgroundColor3 = SelectedTheme.InputBackground
                            if element.HexInput:FindFirstChild("UIStroke") then
                                element.HexInput.UIStroke.Color = SelectedTheme.InputStroke
                            end
                            if element.HexInput:FindFirstChild("InputBox") then
                                element.HexInput.InputBox.TextColor3 = SelectedTheme.TextColor
                            end
                        end
                        if element:FindFirstChild("RGB") then
                            local RGB = element.RGB
                            for _, input in ipairs({RGB:FindFirstChild("RInput"), RGB:FindFirstChild("GInput"), RGB:FindFirstChild("BInput")}) do
                                if input then
                                    input.BackgroundColor3 = SelectedTheme.InputBackground
                                    if input:FindFirstChild("UIStroke") then
                                        input.UIStroke.Color = SelectedTheme.InputStroke
                                    end
                                    if input:FindFirstChild("InputBox") then
                                        input.InputBox.TextColor3 = SelectedTheme.TextColor
                                    end
                                end
                            end
                        end
                    end
                end

                if element.Name == "Selected" and element:IsA("TextLabel") and element.Parent and element.Parent:FindFirstChild("Toggle") and element.Parent:FindFirstChild("List") then
                    element.TextColor3 = SelectedTheme.DropdownSelected
                end
            end

            local function updateElementsInContainer(container)
                for _, element in pairs(container:GetChildren()) do
                    if element:IsA("Frame") and element.Name ~= "Template" and element.Name ~= "Placeholder" and element.Name ~= "SectionSpacing" then

                        if element.Name == "SectionTitle" then
                            if element:FindFirstChild("Title") then
                                element.Title.TextColor3 = SelectedTheme.SectionTitleText or SelectedTheme.TextColor
                            end
                            if element:FindFirstChild("Holder") then
                                updateElementsInContainer(element.Holder)
                            end
                        else
                            local isLabel = element.Name == "Label" or (element:FindFirstChild("Title") and not element:FindFirstChild("Switch") and not element:FindFirstChild("Main") and not element:FindFirstChild("Interact") and not element:FindFirstChild("Content"))
                            local isParagraph = element.Name == "Paragraph" or element:FindFirstChild("Content")

                            local hasCustomBg = element:GetAttribute("HasCustomBackground")

                            if (isLabel or isParagraph) and hasCustomBg then
                                local bgR = element:GetAttribute("CustomBgR")
                                local bgG = element:GetAttribute("CustomBgG")
                                local bgB = element:GetAttribute("CustomBgB")
                                if bgR and bgG and bgB then
                                    element.BackgroundColor3 = Color3.new(bgR, bgG, bgB)
                                end

                                if isLabel then
                                    local textR = element:GetAttribute("CustomTextR")
                                    local textG = element:GetAttribute("CustomTextG")
                                    local textB = element:GetAttribute("CustomTextB")
                                    if textR and textG and textB and element:FindFirstChild("Title") then
                                        element.Title.TextColor3 = Color3.new(textR, textG, textB)
                                    end
                                    if element:FindFirstChild("LabelIcon") then
                                        element.LabelIcon.ImageColor3 = Color3.fromRGB(255, 255, 255)
                                    end
                                end

                                if isParagraph then
                                    local titleR = element:GetAttribute("CustomTitleR")
                                    local titleG = element:GetAttribute("CustomTitleG")
                                    local titleB = element:GetAttribute("CustomTitleB")
                                    local contentR = element:GetAttribute("CustomContentR")
                                    local contentG = element:GetAttribute("CustomContentG")
                                    local contentB = element:GetAttribute("CustomContentB")
                                    if titleR and titleG and titleB and element:FindFirstChild("Title") then
                                        element.Title.TextColor3 = Color3.new(titleR, titleG, titleB)
                                    end
                                    if contentR and contentG and contentB and element:FindFirstChild("Content") then
                                        element.Content.TextColor3 = Color3.new(contentR, contentG, contentB)
                                    end
                                    if element:FindFirstChild("ParagraphIcon") then
                                        element.ParagraphIcon.ImageColor3 = Color3.fromRGB(255, 255, 255)
                                    end
                                end

                                if element:FindFirstChild("UIStroke") then
                                    element.UIStroke.Color = SelectedTheme.SecondaryElementStroke
                                end
                            elseif isLabel or isParagraph then
                                element.BackgroundColor3 = SelectedTheme.SecondaryElementBackground
                                if element:FindFirstChild("UIStroke") then
                                    element.UIStroke.Color = SelectedTheme.SecondaryElementStroke
                                end
                                if element:FindFirstChild("Title") then
                                    element.Title.TextColor3 = SelectedTheme.TextColor
                                end
                                if element:FindFirstChild("Content") then
                                    element.Content.TextColor3 = SelectedTheme.TextColor
                                end
                                if element:FindFirstChild("LabelIcon") then
                                    element.LabelIcon.ImageColor3 = SelectedTheme.TextColor
                                end
                                if element:FindFirstChild("ParagraphIcon") then
                                    element.ParagraphIcon.ImageColor3 = SelectedTheme.TextColor
                                end
                            else
                                element.BackgroundColor3 = SelectedTheme.ElementBackground
                                if element:FindFirstChild("UIStroke") then
                                    element.UIStroke.Color = SelectedTheme.ElementStroke
                                end
                                if element:FindFirstChild("Title") then
                                    element.Title.TextColor3 = SelectedTheme.TextColor
                                end
                            end

                            if element:FindFirstChild("Holder") then
                                updateElementsInContainer(element.Holder)
                            end
                        end
                    end
                end
            end
            updateElementsInContainer(tabPage)
        end
    end
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
    if not SettingsDropdownOpen then return end

    local Frame = SettingsFrame:FindFirstChild("Frame")
    if not Frame then return end

    local Dropdown = Frame:FindFirstChild("Dropdown")
    if not Dropdown then return end

    local List = Dropdown:FindFirstChild("List")
    if not List then return end

    local Toggle = Dropdown:FindFirstChild("Toggle")

    TweenService:Create(Dropdown, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 195, 0, 40)}):Play()
    TweenService:Create(SettingsFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 210, 0, 130)}):Play()

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

    task.spawn(function()
        task.wait(0.35)
        List.Visible = false
        SettingsDropdownOpen = false
    end)
end

local function SetupMobileButton()
    if not UserInputService.TouchEnabled then return end
    if not MobileButton then return end

    MobileButtonOriginalSize = MobileButton.Size
    MobileButtonOriginalPos = MobileButton.Position
    MobileButton.Visible = false

    local Interact = MobileButton:FindFirstChild("Interact")
    local isDragging = false
    local dragStart = nil
    local startPos = nil

    if Interact then
        Interact.MouseButton1Down:Connect(function()
            isDragging = true
            dragStart = UserInputService:GetMouseLocation()
            startPos = MobileButton.Position
            TweenService:Create(MobileButton, TweenInfo.new(0.15, Enum.EasingStyle.Quad), {BackgroundTransparency = 0}):Play()
        end)

        Interact.MouseButton1Up:Connect(function()
            if isDragging then
                local dragEnd = UserInputService:GetMouseLocation()
                local delta = (dragEnd - dragStart).Magnitude

                if delta < 5 then
                    if Debounce then
                        isDragging = false
                        return
                    end

                    local smallSize = UDim2.new(0, MobileButtonOriginalSize.X.Offset - 5, 0, MobileButtonOriginalSize.Y.Offset - 5)

                    TweenService:Create(MobileButton, TweenInfo.new(0.1, Enum.EasingStyle.Quad), {Size = smallSize}):Play()
                    task.wait(0.1)
                    TweenService:Create(MobileButton, TweenInfo.new(0.15, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = MobileButtonOriginalSize}):Play()
                    task.wait(0.15)

                    if Hidden then
                        Unhide()
                    end
                else
                    MobileButtonOriginalPos = MobileButton.Position
                end
            end
            isDragging = false
        end)

        UserInputService.InputChanged:Connect(function(input)
            if isDragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                local mousePos = UserInputService:GetMouseLocation()
                local delta = mousePos - dragStart
                local newPos = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
                MobileButton.Position = newPos
            end
        end)

        Interact.MouseEnter:Connect(function()
            TweenService:Create(MobileButton, TweenInfo.new(0.15, Enum.EasingStyle.Quad), {BackgroundColor3 = Color3.fromRGB(35, 35, 45), BackgroundTransparency = 0}):Play()
            if MobileButton:FindFirstChild("UIStroke") then
                TweenService:Create(MobileButton.UIStroke, TweenInfo.new(0.15, Enum.EasingStyle.Quad), {Color = Color3.fromRGB(80, 80, 100)}):Play()
            end
        end)

        Interact.MouseLeave:Connect(function()
            TweenService:Create(MobileButton, TweenInfo.new(0.15, Enum.EasingStyle.Quad), {BackgroundColor3 = Color3.fromRGB(20, 20, 25), BackgroundTransparency = 0.5}):Play()
            if MobileButton:FindFirstChild("UIStroke") then
                TweenService:Create(MobileButton.UIStroke, TweenInfo.new(0.15, Enum.EasingStyle.Quad), {Color = Color3.fromRGB(60, 60, 80)}):Play()
            end
        end)
    end
end

local function ShowMobileButton()
    if not UserInputService.TouchEnabled then return end
    if not MobileButton then return end
    if isMobileButtonVisible then return end

    isMobileButtonVisible = true

    MobileButton.Size = MobileButtonOriginalSize
    MobileButton.Position = UDim2.new(MobileButtonOriginalPos.X.Scale, MobileButtonOriginalPos.X.Offset + 100, MobileButtonOriginalPos.Y.Scale, MobileButtonOriginalPos.Y.Offset)
    MobileButton.BackgroundTransparency = 1
    MobileButton.Visible = true

    TweenService:Create(MobileButton, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Position = MobileButtonOriginalPos}):Play()
    TweenService:Create(MobileButton, TweenInfo.new(0.4, Enum.EasingStyle.Quad), {BackgroundTransparency = 0.5}):Play()
end

local function HideMobileButton()
    if not UserInputService.TouchEnabled then return end
    if not MobileButton then return end
    if not isMobileButtonVisible then return end

    isMobileButtonVisible = false

    local offScreenPos = UDim2.new(MobileButtonOriginalPos.X.Scale, MobileButtonOriginalPos.X.Offset + 100, MobileButtonOriginalPos.Y.Scale, MobileButtonOriginalPos.Y.Offset)

    local hideTween = TweenService:Create(MobileButton, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In), {Position = offScreenPos})
    TweenService:Create(MobileButton, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {BackgroundTransparency = 1}):Play()
    hideTween:Play()
    hideTween.Completed:Connect(function()
        MobileButton.Visible = false
        MobileButton.Position = MobileButtonOriginalPos
        MobileButton.Size = MobileButtonOriginalSize
    end)
end

SetupMobileButton()

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

    if SideBarLoaded then
        for _, tabbtn in pairs(SideList:GetChildren()) do
            if tabbtn.ClassName == "Frame" and tabbtn.Name ~= "Placeholder" then
                if tabbtn.Name:match("^Category_") then
                    if tabbtn:FindFirstChild("Title") then
                        tabbtn.Title.TextTransparency = 0
                    end
                    if tabbtn.Title and tabbtn.Title:FindFirstChild("ImageButton") then
                        tabbtn.Title.ImageButton.ImageTransparency = 0
                    end
                    if tabbtn:FindFirstChild("Holder") then
                        local categoryOpen = true
                        local catName = tabbtn.Name:sub(10)
                        if Window and Window.Categories and Window.Categories[catName] then
                            categoryOpen = Window.Categories[catName].Open
                        end
                        if categoryOpen then
                            for _, cattab in pairs(tabbtn.Holder:GetChildren()) do
                                if cattab:IsA("Frame") and cattab.Name ~= "Placeholder" then
                                    local originalHeight = cattab:GetAttribute("OriginalHeight") or 30
                                    cattab.Size = UDim2.new(cattab.Size.X.Scale, cattab.Size.X.Offset, 0, originalHeight)
                                    if cattab:FindFirstChild("Title") then
                                        cattab.Title.TextTransparency = 0
                                    end
                                    if cattab:FindFirstChild("Image") then
                                        cattab.Image.ImageTransparency = 0
                                    end
                                end
                            end
                        end
                    end
                else
                    if tabbtn:FindFirstChild("Title") then
                        tabbtn.Title.TextTransparency = 0
                    end
                    if tabbtn:FindFirstChild("Image") then
                        tabbtn.Image.ImageTransparency = 0
                    end
                end
            end
        end
        SideBarClosed = false
        Debounce = false
        return
    end

    for _, tabbtn in pairs(SideList:GetChildren()) do
        if tabbtn.ClassName == "Frame" and tabbtn.Name ~= "Placeholder" then
            if tabbtn.Name:match("^Category_") then
                if tabbtn:FindFirstChild("Title") then
                    Tween(tabbtn.Title, 0.25, {TextTransparency = 0})
                end
                if tabbtn.Title and tabbtn.Title:FindFirstChild("ImageButton") then
                    Tween(tabbtn.Title.ImageButton, 0.25, {ImageTransparency = 0})
                end
                if fast then
                    task.wait(0.05)
                else
                    task.wait(0.12)
                end

                if tabbtn:FindFirstChild("Holder") then
                    local categoryOpen = true
                    if Window.Categories and Window.Categories[tabbtn.Name:sub(10)] then
                        categoryOpen = Window.Categories[tabbtn.Name:sub(10)].Open
                    end

                    if categoryOpen then
                        for _, cattab in pairs(tabbtn.Holder:GetChildren()) do
                            if cattab:IsA("Frame") and cattab.Name ~= "Placeholder" then
                                local originalHeight = cattab:GetAttribute("OriginalHeight") or 30
                                Tween(cattab, 0.2, {Size = UDim2.new(cattab.Size.X.Scale, cattab.Size.X.Offset, 0, originalHeight)})
                                task.delay(0.08, function()
                                    if cattab:FindFirstChild("Title") then
                                        Tween(cattab.Title, 0.2, {TextTransparency = 0})
                                    end
                                    if cattab:FindFirstChild("Image") then
                                        Tween(cattab.Image, 0.2, {ImageTransparency = 0})
                                    end
                                end)
                                if fast then
                                    task.wait(0.03)
                                else
                                    task.wait(0.06)
                                end
                            end
                        end
                    end
                end
            else
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
    end

    SideBarLoaded = true
    SideBarClosed = false
    task.wait(0.1)
    Debounce = false
end

function CloseSideBar()
    Debounce = true
    SideBarClosed = true
    for _, tabbtn in pairs(SideList:GetChildren()) do
        if tabbtn.ClassName == "Frame" and tabbtn.Name ~= "Placeholder" then
            if tabbtn.Name:match("^Category_") then
                if tabbtn:FindFirstChild("Title") then
                    Tween(tabbtn.Title, 0.3, {TextTransparency = 1})
                end
                if tabbtn.Title and tabbtn.Title:FindFirstChild("ImageButton") then
                    Tween(tabbtn.Title.ImageButton, 0.3, {ImageTransparency = 1})
                end
                if tabbtn:FindFirstChild("Holder") then
                    for _, cattab in pairs(tabbtn.Holder:GetChildren()) do
                        if cattab:IsA("Frame") and cattab.Name ~= "Placeholder" then
                            if cattab:FindFirstChild("Title") then
                                Tween(cattab.Title, 0.2, {TextTransparency = 1})
                            end
                            if cattab:FindFirstChild("Image") then
                                Tween(cattab.Image, 0.2, {ImageTransparency = 1})
                            end
                            Tween(cattab, 0.25, {Size = UDim2.new(cattab.Size.X.Scale, cattab.Size.X.Offset, 0, 0)})
                        end
                    end
                end
            else
                if tabbtn:FindFirstChild("Title") then
                    Tween(tabbtn.Title, 0.3, {TextTransparency = 1})
                end
                if tabbtn:FindFirstChild("Image") then
                    Tween(tabbtn.Image, 0.3, {ImageTransparency = 1})
                end
            end
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

SearchBar.Input.Active = true
SearchBar.Input.Selectable = true

SearchBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
        SearchBar.Input:CaptureFocus()
    end
end)

function OpenSearch()
    Debounce = true
    SearchBar.Position = UDim2.new(0.632835805, 0, 0.173291534, 0)
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

    --SettingsFrame.Size = UDim2.new(0, 210,0, 303)
    SettingsFrame.BackgroundTransparency = 1

    if SettingsFrame:FindFirstChild("UIStroke") then
        SettingsFrame.UIStroke.Transparency = 1
    end

    SetAllTransparent(SettingsFrame)
    SettingsFrame.Visible = true

    Tween(SettingsFrame, 0.4, {BackgroundTransparency = 0, Size = UDim2.new(0, 210,0, 303)})

    if SettingsFrame:FindFirstChild("UIStroke") then
        Tween(SettingsFrame.UIStroke, 0.4, {Transparency = 0})
    end

    task.wait(0.15)
    FadeIn(SettingsFrame, 0.3, {})

    local Button = SettingsFrame.Frame:FindFirstChild("Button")
    if Button and Button:FindFirstChild("Title") then
        Button.Title.Text = DiscordButtonOriginalText
        TweenService:Create(Button.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
    end

    task.wait(0.4)
    Debounce = false
end

function ClosePrompt()
	local PromptUI = Prompt.Prompt
	clicked = false
	TweenService:Create(Prompt, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
	TweenService:Create(PromptUI, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {BackgroundTransparency = 1,Size = UDim2.new(0,340,0,140)}):Play()
	TweenService:Create(PromptUI.UIStroke, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
	TweenService:Create(PromptUI.Title, TweenInfo.new(0.45, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
	TweenService:Create(PromptUI.Content, TweenInfo.new(0.45, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
	TweenService:Create(PromptUI.Sub, TweenInfo.new(0.45, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
	for _,button in pairs(PromptUI.Buttons:GetChildren()) do
		if button.Name ~= 'Template' and button:IsA("Frame") then
			TweenService:Create(button.UIStroke,TweenInfo.new(0.2, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
			TweenService:Create(button.TextLabel,TweenInfo.new(0.2, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
			delay(.2,function()
				button:Destroy()
			end)
		end
	end
	wait(.5)
	Prompt.Visible = false
end

function CloseNPrompt()
	local Infos = TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	TweenService:Create(NotePrompt, Infos, {BackgroundTransparency = 1}):Play()
	TweenService:Create(NotePrompt.UIStroke, Infos, {Transparency = 1}):Play()
	TweenService:Create(NotePrompt.Shadow.Image, Infos, {ImageTransparency = 1}):Play()

	TweenService:Create(NotePrompt.Close, Infos, {ImageTransparency = 1}):Play()
	TweenService:Create(NotePrompt.Icon, Infos, {ImageTransparency = 1}):Play()
	TweenService:Create(NotePrompt.Title, Infos, {TextTransparency = 1}):Play()

	TweenService:Create(NotePrompt.Description, Infos, {TextTransparency = 1}):Play()
	TweenService:Create(NotePrompt.Load, Infos, {TextTransparency = 1, BackgroundTransparency = 1}):Play()
	TweenService:Create(NotePrompt.Load.UIStroke, Infos, {Transparency = 1}):Play()
	TweenService:Create(NotePrompt.Load.Shadow, Infos, {ImageTransparency = 1}):Play()
	wait(0.21)
	NotePrompt.Visible = false
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
    Elements.Size = UDim2.new(0.8, 0, 1, -65)
    TabsList.Visible = false
    Drag.Visible = false

    task.wait(0.2)
    Main.Visible = false
    Hidden = true
    Minimised = false
    Debounce = false

    ShowMobileButton()
    if UserInputService.TouchEnabled then return end
    ArrayFieldLibrary:Notify({
        Title = "Interface Hidden",
        Content = "Press " .. UnhideKeybind.Name .. " to show the interface again.",
        Duration = 5,
        Image = "eye-closed"
    })
end

function Unhide()
    HideMobileButton()
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
    Elements.Size = UDim2.new(0.74, 0, 1, -65)

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
    SideTabList.Visible = false
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
    SideTabList.Visible = true
    Elements.Visible = true
    Elements.Size = UDim2.new(0.74, 0, 1, -65)
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

        local blurlight = nil
        if not false then
            blurlight = Instance.new("DepthOfFieldEffect", game:GetService("Lighting"))
            blurlight.Enabled = true
            blurlight.FarIntensity = 0
            blurlight.FocusDistance = 51.6
            blurlight.InFocusRadius = 50
            blurlight.NearIntensity = 1
            game:GetService("Debris"):AddItem(blurlight, 10)
        end

        if Notification:FindFirstChild("Actions") and Notification.Actions:FindFirstChild("Template") then
            Notification.Actions.Template.Visible = false

            if NotificationSettings.Actions then
                for _, Action in pairs(NotificationSettings.Actions) do
                    ActionCompleted = false
                    local NewAction = Notification.Actions.Template:Clone()
                    NewAction.BackgroundColor3 = SelectedTheme.NotificationActionsBackground
                    if SelectedTheme ~= ArrayFieldLibrary.Theme.Default then
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

        Notification.BackgroundColor3 = SelectedTheme.Background

        if Notification:FindFirstChild("Title") then
            Notification.Title.Text = NotificationSettings.Title or "Unknown"
            Notification.Title.TextTransparency = 1
            Notification.Title.TextColor3 = SelectedTheme.TextColor
            Notification.Title.TextScaled = true
            Notification.Title.Size = UDim2.new(0, 250, 0, 15)
            Notification.Title.Position = UDim2.new(0, 165, 0, 21)
        end

        if Notification:FindFirstChild("Description") then
            Notification.Description.Text = NotificationSettings.Content or "Unknown"
            Notification.Description.TextTransparency = 1
            Notification.Description.TextColor3 = SelectedTheme.TextColor
            Notification.Description.TextWrapped = true
            Notification.Description.Size = UDim2.new(0, 260, 0, 55)
            Notification.Description.Position = UDim2.new(0, 147, 0, 60)
        end

        if Notification:FindFirstChild("Icon") then
            Notification.Icon.ImageColor3 = SelectedTheme.TextColor
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

        if Notification:FindFirstChild("Icon") then
            Notification.Icon.ImageTransparency = 1
        end

        Notification.Size = UDim2.new(0, 260, 0, 80)
        Notification.BackgroundTransparency = 1

        TweenService:Create(Notification, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 295, 0, 91)}):Play()
        TweenService:Create(Notification, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0.1}):Play()
        Notification:TweenPosition(UDim2.new(0.5,0,0.915,0),'Out','Quint',0.8,true)

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

        if neon and ArrayField.Name == "ArrayField" and Notification:FindFirstChild("BlurModule") then
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
                TweenService:Create(Notification.Title, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Position = UDim2.new(0.47, 0,0.234, 0)}):Play()
            end
            if Notification:FindFirstChild("Description") then
                TweenService:Create(Notification.Description, TweenInfo.new(0.8, Enum.EasingStyle.Quint), {Position = UDim2.new(0.528, 0,0.637, 0)}):Play()
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

            if not false then
                if neon and Notification:FindFirstChild("BlurModule") then
                    neon:UnbindFrame(Notification.BlurModule)
                end
                if blurlight then
                    blurlight:Destroy()
                end
            end

            wait(0.9)
            if Notification then
                Notification:Destroy()
            end
        end
    end)
end
local function SetupSettingsConfigToggle()
    local Frame = SettingsFrame:FindFirstChild("Frame")
    if not Frame then return end

    local Toggle = Frame:FindFirstChild("Toggle")
    if not Toggle then return end

    local Switch = Toggle:FindFirstChild("Switch")
    local Interact = Toggle:FindFirstChild("Interact")
    if not Switch or not Interact then return end

    local Indicator = Switch:FindFirstChild("Indicator")
    if not Indicator then return end

    if SelectedTheme then
        Toggle.BackgroundColor3 = SelectedTheme.ElementBackground
        if Toggle:FindFirstChild("UIStroke") then
            Toggle.UIStroke.Color = SelectedTheme.ElementStroke
        end
        if Toggle:FindFirstChild("Title") then
            Toggle.Title.TextColor3 = SelectedTheme.TextColor
            Toggle.Title.TextTransparency = 0
        end
        Switch.BackgroundColor3 = SelectedTheme.ToggleBackground
    end

    if SelectedTheme and SelectedTheme ~= ArrayFieldLibrary.Theme.Default then
        if Switch:FindFirstChild("Shadow") then
            Switch.Shadow.Visible = false
        end
    end

    local function UpdateToggleVisual(value)
        if value then
            Indicator.Position = UDim2.new(1, -20, 0.5, 0)
            if SelectedTheme then
                Indicator.UIStroke.Color = SelectedTheme.ToggleEnabledStroke
                Indicator.BackgroundColor3 = SelectedTheme.ToggleEnabled
                Switch.UIStroke.Color = SelectedTheme.ToggleEnabledOuterStroke
            end
        else
            Indicator.Position = UDim2.new(1, -40, 0.5, 0)
            if SelectedTheme then
                Indicator.UIStroke.Color = SelectedTheme.ToggleDisabledStroke
                Indicator.BackgroundColor3 = SelectedTheme.ToggleDisabled
                Switch.UIStroke.Color = SelectedTheme.ToggleDisabledOuterStroke
            end
        end
    end

    UpdateToggleVisual(ArrayFieldLibrary.ConfigEnabled)

    Toggle.MouseEnter:Connect(function()
        if SelectedTheme then
            TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
        end
    end)

    Toggle.MouseLeave:Connect(function()
        if SelectedTheme then
            TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
        end
    end)

    Interact.MouseButton1Click:Connect(function()
        ArrayFieldLibrary.ConfigEnabled = not ArrayFieldLibrary.ConfigEnabled
        local newValue = ArrayFieldLibrary.ConfigEnabled

        if newValue then
            if SelectedTheme then
                TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
            end
            TweenService:Create(Toggle.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
            TweenService:Create(Indicator, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2.new(1, -20, 0.5, 0)}):Play()
            TweenService:Create(Indicator, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0, 12, 0, 12)}):Play()
            if SelectedTheme then
                TweenService:Create(Indicator.UIStroke, TweenInfo.new(0.55, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Color = SelectedTheme.ToggleEnabledStroke}):Play()
                TweenService:Create(Indicator, TweenInfo.new(0.8, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundColor3 = SelectedTheme.ToggleEnabled}):Play()
                TweenService:Create(Switch.UIStroke, TweenInfo.new(0.55, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Color = SelectedTheme.ToggleEnabledOuterStroke}):Play()
            end
            task.wait(0.05)
            TweenService:Create(Indicator, TweenInfo.new(0.45, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0, 17, 0, 17)}):Play()
            task.wait(0.15)
            if SelectedTheme then
                TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
            end
            TweenService:Create(Toggle.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 0}):Play()

            if not isfolder(ArrayFieldLibrary.ConfigFolder) then
                makefolder(ArrayFieldLibrary.ConfigFolder)
            end
            ArrayFieldLibrary.SaveConfiguration()
        else
            if SelectedTheme then
                TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
            end
            TweenService:Create(Toggle.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
            TweenService:Create(Indicator, TweenInfo.new(0.45, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2.new(1, -40, 0.5, 0)}):Play()
            TweenService:Create(Indicator, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0, 12, 0, 12)}):Play()
            if SelectedTheme then
                TweenService:Create(Indicator.UIStroke, TweenInfo.new(0.55, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Color = SelectedTheme.ToggleDisabledStroke}):Play()
                TweenService:Create(Indicator, TweenInfo.new(0.8, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundColor3 = SelectedTheme.ToggleDisabled}):Play()
                TweenService:Create(Switch.UIStroke, TweenInfo.new(0.55, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Color = SelectedTheme.ToggleDisabledOuterStroke}):Play()
            end
            task.wait(0.05)
            TweenService:Create(Indicator, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0, 17, 0, 17)}):Play()
            task.wait(0.15)
            if SelectedTheme then
                TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
            end
            TweenService:Create(Toggle.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
        end

        SaveSettings()
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

    if Keybind:FindFirstChild("Title") then
        Keybind.Title.TextTransparency = 0
    end

    if Keybind:FindFirstChild("ElementIndicator") then
        Keybind.ElementIndicator.Text = "press"
        Keybind.ElementIndicator.TextTransparency = 0.9
    end

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
        TweenService:Create(KeybindFrame, TweenInfo.new(0.55, Enum.EasingStyle.Quint), {Size = UDim2.new(0, KeybindBox.TextBounds.X + 24, 0, 30)}):Play()
    end)

    Keybind.MouseEnter:Connect(function()
        if SelectedTheme then
            TweenService:Create(Keybind, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
        end
        if Keybind:FindFirstChild("ElementIndicator") then
            TweenService:Create(Keybind.ElementIndicator, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {TextTransparency = 0.7}):Play()
        end
    end)

    Keybind.MouseLeave:Connect(function()
        if SelectedTheme then
            TweenService:Create(Keybind, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
        end
        if Keybind:FindFirstChild("ElementIndicator") then
            TweenService:Create(Keybind.ElementIndicator, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {TextTransparency = 0.9}):Play()
        end
    end)
end

local function SetupSettingsDiscordButton()
    local Frame = SettingsFrame:FindFirstChild("Frame")
    if not Frame then return end

    local Button = Frame:FindFirstChild("Button")
    if not Button then return end

    local AllClipboards = setclipboard or toclipboard or set_clipboard or (Clipboard and Clipboard.set)
    local discordInvite = "https://discord.gg/VPhjH4Kntp"

    Button.Title.Text = DiscordButtonOriginalText
    Button.Title.TextTransparency = 0
    Button.Title.TextColor3 = Color3.fromRGB(255, 255, 255)

    if Button:FindFirstChild("ElementIndicator") then
        Button.ElementIndicator.Text = "Copy"
        Button.ElementIndicator.TextTransparency = 0.9
    end

    if SelectedTheme then
        Button.BackgroundColor3 = SelectedTheme.ElementBackground
        if Button:FindFirstChild("UIStroke") then
            Button.UIStroke.Color = SelectedTheme.ElementStroke
        end
    end

    local Interact = Button:FindFirstChild("Interact")
    if Interact then
        Interact.MouseButton1Click:Connect(function()
            if AllClipboards then
                pcall(function()
                    AllClipboards(discordInvite)
                end)

                if SelectedTheme then
                    TweenService:Create(Button, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
                end
                if Button:FindFirstChild("UIStroke") then
                    TweenService:Create(Button.UIStroke, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
                end
                if Button:FindFirstChild("ElementIndicator") then
                    TweenService:Create(Button.ElementIndicator, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
                end

                Button.Title.Text = "Copied to clipboard!"

                task.wait(0.3)

                if SelectedTheme then
                    TweenService:Create(Button, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
                end
                if Button:FindFirstChild("UIStroke") then
                    TweenService:Create(Button.UIStroke, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
                end
                if Button:FindFirstChild("ElementIndicator") then
                    TweenService:Create(Button.ElementIndicator, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 0.9}):Play()
                end

                task.wait(0.8)
                Button.Title.Text = DiscordButtonOriginalText
            else
                Button.Title.Text = "Clipboard unavailable"
                task.wait(1)
                Button.Title.Text = DiscordButtonOriginalText
            end
        end)
    end

    Button.MouseEnter:Connect(function()
        if SelectedTheme then
            TweenService:Create(Button, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
        end
        if Button:FindFirstChild("ElementIndicator") then
            TweenService:Create(Button.ElementIndicator, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {TextTransparency = 0.7}):Play()
        end
    end)

    Button.MouseLeave:Connect(function()
        if SelectedTheme then
            TweenService:Create(Button, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
        end
        if Button:FindFirstChild("ElementIndicator") then
            TweenService:Create(Button.ElementIndicator, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {TextTransparency = 0.9}):Play()
        end
    end)
end

local function RefreshSettingsDropdownColors()
    task.spawn(function()
        task.wait(0.05)

        if not SelectedTheme then return end

        local success, Dropdown = pcall(function()
            return ArrayField.Main.Settings.Frame.Dropdown
        end)

        if not success or not Dropdown then return end

        local List = Dropdown:FindFirstChild("List")
        local Selected = Dropdown:FindFirstChild("Selected")
        local Toggle = Dropdown:FindFirstChild("Toggle")

        if not List then return end

        for _, opt in ipairs(List:GetChildren()) do
            if opt:IsA("Frame") and opt.Name ~= "Template" and opt.Name ~= "PlaceHolder" then
                local isSelected = opt.Name == CurrentThemeName

                opt.BackgroundColor3 = isSelected and SelectedTheme.ElementBackgroundHover or SelectedTheme.SecondaryElementBackground

                if opt:FindFirstChild("UIStroke") then
                    opt.UIStroke.Color = SelectedTheme.SecondaryElementStroke
                end

                if opt:FindFirstChild("Title") then
                    opt.Title.TextColor3 = SelectedTheme.TextColor
                end
            end
        end

        List.BackgroundColor3 = SelectedTheme.DropdownListBackground

        if Selected then
            Selected.Text = CurrentThemeName or "ArrayField"
            Selected.TextColor3 = SelectedTheme.DropdownSelected
        end

        if Toggle then
            Toggle.ImageColor3 = SelectedTheme.DropdownToggle
        end

        Dropdown.BackgroundColor3 = SelectedTheme.ElementBackground

        if Dropdown:FindFirstChild("UIStroke") then
            Dropdown.UIStroke.Color = SelectedTheme.ElementStroke
        end

        if Dropdown:FindFirstChild("Title") then
            Dropdown.Title.TextColor3 = SelectedTheme.TextColor
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

    Template.Visible = false

    local Interact = Dropdown:FindFirstChild("Interact")
    local Toggle = Dropdown:FindFirstChild("Toggle")
    local Selected = Dropdown:FindFirstChild("Selected")

    if CurrentThemeName == nil then
        if DeveloperSelectedTheme then
            CurrentThemeName = "Dev Selected"
            SelectedTheme = DeveloperSelectedTheme
        else
            CurrentThemeName = "ArrayField"
            SelectedTheme = ArrayFieldLibrary.Theme.Default
        end
    end

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
        table.insert(themeNames, "Dev Selected")
    end

    table.insert(themeNames, "ArrayField")

    for themeName, _ in pairs(ArrayFieldLibrary.Theme) do
        if themeName ~= "Default" then
            table.insert(themeNames, themeName)
        end
    end

    table.sort(themeNames, function(a, b)
        if a == "Dev Selected" then return true end
        if b == "Dev Selected" then return false end
        if a == "ArrayField" then return true end
        if b == "ArrayField" then return false end
        return a < b
    end)

    local function SelectTheme(themeName)
        CurrentThemeName = themeName

        if themeName == "ArrayField" then
            SelectedTheme = ArrayFieldLibrary.Theme.Default
        elseif themeName == "Dev Selected" then
            SelectedTheme = DeveloperSelectedTheme or ArrayFieldLibrary.Theme.Default
        else
            SelectedTheme = ArrayFieldLibrary.Theme[themeName] or ArrayFieldLibrary.Theme.Default
        end

        ApplyTheme()
        RefreshSettingsDropdownColors()

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
            Option.Title.Position = UDim2.new(0.45, 0, 0.5, 0)
            Option.Title.TextTruncate = Enum.TextTruncate.AtEnd
            Option.Title.TextColor3 = SelectedTheme and SelectedTheme.TextColor or Color3.fromRGB(240, 240, 240)
        end

        if Option:FindFirstChild("UIStroke") then
            Option.UIStroke.Transparency = 1
            Option.UIStroke.Color = SelectedTheme and SelectedTheme.SecondaryElementStroke or Color3.fromRGB(35, 35, 35)
        end

        if themeName == CurrentThemeName then
            Option.BackgroundColor3 = SelectedTheme and SelectedTheme.ElementBackgroundHover or Color3.fromRGB(40, 40, 40)
        else
            Option.BackgroundColor3 = SelectedTheme and SelectedTheme.SecondaryElementBackground or Color3.fromRGB(30, 30, 30)
        end

        local OptionInteract = Option:FindFirstChild("Interact")
        if OptionInteract then
            OptionInteract.ZIndex = 50
            OptionInteract.MouseButton1Click:Connect(function()
                if themeName == CurrentThemeName then return end

                for _, opt in ipairs(List:GetChildren()) do
                    if opt:IsA("Frame") and opt.Name ~= "Template" and opt.Name ~= "PlaceHolder" then
                        TweenService:Create(opt, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme and SelectedTheme.SecondaryElementBackground or Color3.fromRGB(30, 30, 30)}):Play()
                    end
                end

                TweenService:Create(Option, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme and SelectedTheme.ElementBackgroundHover or Color3.fromRGB(40, 40, 40)}):Play()

                SelectTheme(themeName)

                task.wait(0.2)

                TweenService:Create(Dropdown, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 195, 0, 40)}):Play()
                TweenService:Create(SettingsFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 210, 0, 303)}):Play()

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
                TweenService:Create(Option, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme and SelectedTheme.ElementBackground or Color3.fromRGB(35, 35, 35)}):Play()
            end
        end)

        Option.MouseLeave:Connect(function()
            if themeName ~= CurrentThemeName then
                TweenService:Create(Option, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme and SelectedTheme.SecondaryElementBackground or Color3.fromRGB(30, 30, 30)}):Play()
            end
        end)
    end

    if Interact then
        Interact.MouseButton1Click:Connect(function()
            if SettingsDropdownOpen then
                TweenService:Create(Dropdown, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 195,0, 40)}):Play()
                TweenService:Create(SettingsFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 210, 0, 303)}):Play()

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
                TweenService:Create(Dropdown, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 195, 0, 180)}):Play()
                TweenService:Create(SettingsFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 210, 0, 270)}):Play()

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
    if Settings.ConfigurationSaving then
        ArrayFieldLibrary.ConfigFolder = Settings.ConfigurationSaving.FolderName or "ArrayField"
        ArrayFieldLibrary.ConfigFileName = Settings.ConfigurationSaving.FileName or "ArrayField"

        local key = ArrayFieldLibrary.ConfigFolder .. "/" .. ArrayFieldLibrary.ConfigFileName
        if ArrayFieldLibrary._ConfigStates and ArrayFieldLibrary._ConfigStates[key] ~= nil then
            ArrayFieldLibrary.ConfigEnabled = ArrayFieldLibrary._ConfigStates[key]
        else
            ArrayFieldLibrary.ConfigEnabled = Settings.ConfigurationSaving.Enabled or false
        end

        if ArrayFieldLibrary.ConfigEnabled then
            if not isfolder(ArrayFieldLibrary.ConfigFolder) then
                makefolder(ArrayFieldLibrary.ConfigFolder)
            end
        end
    end

    local Window = {Tabs = {}}
    ArrayFieldLibrary.Tabs = Window.Tabs

    if Settings.DefaultTheme then
        if type(Settings.DefaultTheme) == "string" and ArrayFieldLibrary.Theme[Settings.DefaultTheme] then
            DeveloperSelectedTheme = ArrayFieldLibrary.Theme[Settings.DefaultTheme]
            SelectedTheme = DeveloperSelectedTheme
            CurrentThemeName = "Dev Selected"
        elseif type(Settings.DefaultTheme) == "table" then
            DeveloperSelectedTheme = Settings.DefaultTheme
            SelectedTheme = DeveloperSelectedTheme
            CurrentThemeName = "Dev Selected"
        end
    else
        if CurrentThemeName == nil then
            CurrentThemeName = "ArrayField"
        end
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
    LoadingFrame.Subtitle.Text = Settings.LoadingSubtitle or "by vqmpjay"
    Topbar.Visible = false
    Elements.Visible = false
    Elements.Size = UDim2.new(0.74, 0, 1, -65)
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
            local isSelected = tabbtn.BackgroundColor3 == SelectedTheme.TabBackgroundSelected or tabbtn.BackgroundTransparency < 0.5

            if tabbtn:FindFirstChild("Title") then
                tabbtn.Title.TextColor3 = isSelected and SelectedTheme.SelectedTabTextColor or SelectedTheme.SideListItemTitle
            end
            if tabbtn:FindFirstChild("Image") then
                tabbtn.Image.ImageColor3 = isSelected and SelectedTheme.SelectedTabTextColor or SelectedTheme.SideListItemImage
            end
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
    SetZIndex(SettingsFrame, 6)
    SetZIndex(SearchBar, 7)
    SetZIndex(Drag, 8)
    SetZIndex(Notifications, 10)
    SetZIndex(NotePrompt, 15)
    SetZIndex(Prompt, 16)

    AddDraggingFunctionality(Topbar, Main)
    SetupSettingsKeybind()
    SetupSettingsConfigToggle()
    SetupSettingsThemeDropdown()
    SetupSettingsDiscordButton()

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

    SearchBar.Input:GetPropertyChangedSignal('Text'):Connect(function()
    local InputText = string.upper(SearchBar.Input.Text)

    local function searchInContainer(container)
        for _, Element in pairs(container:GetChildren()) do
            if Element:IsA("Frame") and Element.Name ~= 'Placeholder' and Element.Name ~= 'SectionSpacing' and Element.Name ~= 'Template' then
                if Element:FindFirstChild("Holder") then
                    searchInContainer(Element.Holder)
                    local anyChildVisible = false
                    for _, child in pairs(Element.Holder:GetChildren()) do
                        if child:IsA("Frame") and child.Visible then
                            anyChildVisible = true
                            break
                        end
                    end
                    if InputText == "" or string.find(string.upper(Element.Name), InputText) ~= nil or anyChildVisible then
                        Element.Visible = true
                    else
                        Element.Visible = false
                    end
                else
                    if InputText == "" or string.find(string.upper(Element.Name), InputText) ~= nil then
                        Element.Visible = true

                        local parent = Element.Parent
                        while parent and parent ~= Elements do
                            parent.Visible = true
                            parent = parent.Parent
                        end
                    else
                        Element.Visible = false
                    end
                end
            end
        end
    end

    for _, page in ipairs(Elements:GetChildren()) do
        if page.Name ~= 'Template' then
            searchInContainer(page)
        end
    end
end)

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
    Elements.Size = UDim2.new(0.74, 0, 1, -65)
    Drag.Visible = true
    SettingsFrame.Frame.Button.Title.TextTransparency = 0
    Drag.Position = UDim2.fromOffset(Main.AbsolutePosition.X + Main.AbsoluteSize.X / 2, Main.AbsolutePosition.Y + Main.AbsoluteSize.Y / 2 + dragOffset)
    DragCosmetic.Size = UDim2.new(0, 247, 0, 4)
    DragCosmetic.BackgroundTransparency = 0.4

    SetupDragBar()

    task.wait(0.3)
    task.spawn(OpenSideBar)

    local FirstTab = false

function Window:CreateCategory(Name, Settings)
    Settings = Settings or {}
    local DefaultOpen = Settings.DefaultOpen
    if DefaultOpen == nil then DefaultOpen = true end

    if not Window.Categories then
        Window.Categories = {}
    end

    local CategoryValue = {
        Open = DefaultOpen,
        Holder = nil
    }
    local CategoryDebounce = false

    Window.Categories[Name] = CategoryValue

    local Category = Elements.Template.SectionTitle:Clone()
    Category.Name = "Category_" .. Name
    Category.Title.Text = Name
    Category.Visible = true
    Category.LayoutOrder = 0
    Category.Position = UDim2.new(0, -12, 0, 0)
    Category.Size = UDim2.new(1, 12, 0, 28)
    Category.Parent = SideList

    for _, descendant in ipairs(Category:GetDescendants()) do
        if descendant:IsA("GuiObject") then
            descendant.ZIndex = descendant.ZIndex + 1
        end
    end
    Category.ZIndex = 3

    Category.BackgroundTransparency = 1
    if Category:FindFirstChild("UIStroke") then
        Category.UIStroke.Transparency = 1
    end

    Category.Title.TextTransparency = 1
    Category.Title.Font = Enum.Font.GothamBold
    Category.Title.TextSize = 13
    Category.Title.TextColor3 = SelectedTheme and SelectedTheme.TextColor or Color3.fromRGB(200, 200, 200)
    TweenService:Create(Category.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()

    if Category.Title:FindFirstChild("ImageButton") then
        Category.Title.ImageButton.ImageTransparency = 1
        TweenService:Create(Category.Title.ImageButton, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageTransparency = 0}):Play()
    end

    CategoryValue.Holder = Category.Holder
    Category.Holder.Visible = true
    Category.Holder.AutomaticSize = Enum.AutomaticSize.Y

    local HolderPadding = Instance.new("UIPadding")
    HolderPadding.PaddingLeft = UDim.new(0, 14)
    HolderPadding.Parent = Category.Holder

    local HolderLayout = Category.Holder:FindFirstChildOfClass("UIListLayout")
    if HolderLayout then
        HolderLayout.Padding = UDim.new(0, 2)
    end

    if Category.Title:FindFirstChild("ImageButton") then
        Category.Title.ImageButton.MouseButton1Down:Connect(function()
            if CategoryDebounce then return end
            CategoryDebounce = true

            local tabs = {}
            for _, tab in ipairs(Category.Holder:GetChildren()) do
                if tab:IsA("Frame") and tab.Name ~= "Placeholder" then
                    table.insert(tabs, tab)
                end
            end

            if CategoryValue.Open then
                TweenService:Create(Category.Title.ImageButton, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Rotation = 180}):Play()

                for i = #tabs, 1, -1 do
                    local tab = tabs[i]
                    local delayTime = (#tabs - i) * 0.04

                    if not tab:GetAttribute("OriginalHeight") then
                        tab:SetAttribute("OriginalHeight", tab.Size.Y.Offset)
                    end

                    task.delay(delayTime, function()
                        if tab:FindFirstChild("Title") then
                            TweenService:Create(tab.Title, TweenInfo.new(0.1, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
                        end
                        if tab:FindFirstChild("Image") then
                            TweenService:Create(tab.Image, TweenInfo.new(0.1, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
                        end
                        TweenService:Create(tab, TweenInfo.new(0.2, Enum.EasingStyle.Quint), {Size = UDim2.new(tab.Size.X.Scale, tab.Size.X.Offset, 0, 0)}):Play()
                    end)
                end

                local totalDelay = #tabs * 0.04 + 0.25
                task.delay(totalDelay, function()
                    CategoryDebounce = false
                end)

                CategoryValue.Open = false
            else
                TweenService:Create(Category.Title.ImageButton, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Rotation = 0}):Play()

                for i, tab in ipairs(tabs) do
                    local delayTime = (i - 1) * 0.04
                    local originalHeight = tab:GetAttribute("OriginalHeight") or 30

                    task.delay(delayTime, function()
                        TweenService:Create(tab, TweenInfo.new(0.2, Enum.EasingStyle.Quint), {Size = UDim2.new(tab.Size.X.Scale, tab.Size.X.Offset, 0, originalHeight)}):Play()

                        task.delay(0.08, function()
                            if tab:FindFirstChild("Title") then
                                TweenService:Create(tab.Title, TweenInfo.new(0.15, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
                            end
                            if tab:FindFirstChild("Image") then
                                TweenService:Create(tab.Image, TweenInfo.new(0.15, Enum.EasingStyle.Quint), {ImageTransparency = 0}):Play()
                            end
                        end)
                    end)
                end

                local totalDelay = #tabs * 0.04 + 0.3
                task.delay(totalDelay, function()
                    CategoryDebounce = false
                end)

                CategoryValue.Open = true
            end
        end)
    end

    if not DefaultOpen then
        CategoryValue.Open = false
        if Category.Title:FindFirstChild("ImageButton") then
            Category.Title.ImageButton.Rotation = 180
        end
    end

    function CategoryValue:Set(NewName)
        Category.Title.Text = NewName
    end

    function CategoryValue:Expand()
        if not CategoryValue.Open and Category.Title:FindFirstChild("ImageButton") then
            Category.Title.ImageButton.MouseButton1Down:Fire()
        end
    end

    function CategoryValue:Collapse()
        if CategoryValue.Open and Category.Title:FindFirstChild("ImageButton") then
            Category.Title.ImageButton.MouseButton1Down:Fire()
        end
    end

    Window.Categories[Name] = CategoryValue

    return CategoryValue
end

-- Tab
function Window:CreateTab(Name, Image, CategoryParent)
    Window.Tabs[Name] = {Elements = {}}
    local Tab = Window.Tabs[Name]
    local SDone = false
    local TopTabButton = TopList.Template:Clone()
    local SideTabButton = SideList.SideTemplate:Clone()

    TopTabButton.Parent = TopList

    local isInCategory = CategoryParent ~= nil

    if isInCategory then
        SideTabButton.Parent = CategoryParent.Holder
        SideTabButton.ZIndex = 4
        for _, descendant in ipairs(SideTabButton:GetDescendants()) do
            if descendant:IsA("GuiObject") then
                descendant.ZIndex = 4
            end
        end

        if SideTabButton:FindFirstChild("Shadow") then
            SideTabButton.Shadow.Visible = false
        end
        SideTabButton.BackgroundTransparency = 1
    else
        SideTabButton.Parent = SideList
    end

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

    if isInCategory then
        local originalHeight = SideTabButton.Size.Y.Offset
        SideTabButton:SetAttribute("OriginalHeight", originalHeight)
        SideTabButton.Size = UDim2.new(SideTabButton.Size.X.Scale, SideTabButton.Size.X.Offset, 0, 0)
        SideTabButton.Title.TextTransparency = 1
        SideTabButton.Image.ImageTransparency = 1
    end

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

    TopTabButton.UIStroke.Color = SelectedTheme and SelectedTheme.TabStroke or Color3.fromRGB(85, 85, 85)

    task.wait(0.1)

    if isInCategory and CategoryParent.Open then
        local originalHeight = SideTabButton:GetAttribute("OriginalHeight") or 30
        local tabIndex = 0
        for _, child in ipairs(CategoryParent.Holder:GetChildren()) do
            if child:IsA("Frame") and child.Name ~= "Placeholder" then
                tabIndex = tabIndex + 1
                if child == SideTabButton then break end
            end
        end
        local delayTime = (tabIndex - 1) * 0.05

        task.delay(delayTime, function()
            if Minimised then return end

            TweenService:Create(SideTabButton, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Size = UDim2.new(SideTabButton.Size.X.Scale, SideTabButton.Size.X.Offset, 0, originalHeight)}):Play()
            task.delay(0.1, function()
                if Minimised then return end

                TweenService:Create(SideTabButton.Title, TweenInfo.new(0.25, Enum.EasingStyle.Quint), {TextTransparency = 0, TextColor3 = SelectedTheme and SelectedTheme.SideListItemTitle or Color3.fromRGB(205, 205, 205)}):Play()
                TweenService:Create(SideTabButton.Image, TweenInfo.new(0.25, Enum.EasingStyle.Quint), {ImageTransparency = 0, ImageColor3 = SelectedTheme and SelectedTheme.SideListItemImage or Color3.fromRGB(205, 205, 205)}):Play()
            end)
        end)
    end

    if FirstTab then
        TopTabButton.BackgroundColor3 = SelectedTheme and SelectedTheme.TabBackground or Color3.fromRGB(25, 25, 25)
        TopTabButton.Image.ImageColor3 = SelectedTheme and SelectedTheme.TabImage or Color3.fromRGB(240, 240, 240)
        TopTabButton.Title.TextColor3 = SelectedTheme and SelectedTheme.TabTextColor or Color3.fromRGB(240, 240, 240)
        TweenService:Create(TopTabButton, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0.7}):Play()
        TweenService:Create(TopTabButton.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0.2}):Play()
        TweenService:Create(TopTabButton.Image, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageTransparency = 0.2}):Play()
        TweenService:Create(TopTabButton.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
        TweenService:Create(TopTabButton.Shadow, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ImageTransparency = 0.7}):Play()

        if not isInCategory then
            TweenService:Create(SideTabButton.Image, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageTransparency = 0, ImageColor3 = SelectedTheme and SelectedTheme.SideListItemImage or Color3.fromRGB(205, 205, 205)}):Play()
            TweenService:Create(SideTabButton.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0.2, TextColor3 = SelectedTheme and SelectedTheme.SideListItemTitle or Color3.fromRGB(205, 205, 205)}):Play()
        end
    else
        FirstTab = Name

        TopTabButton.BackgroundColor3 = SelectedTheme and SelectedTheme.TabBackgroundSelected or Color3.fromRGB(90, 90, 90)
        TopTabButton.Image.ImageColor3 = SelectedTheme and SelectedTheme.SelectedTabTextColor or Color3.fromRGB(255, 255, 255)
        TopTabButton.Title.TextColor3 = SelectedTheme and SelectedTheme.SelectedTabTextColor or Color3.fromRGB(255, 255, 255)
        TweenService:Create(TopTabButton.Shadow, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ImageTransparency = 0.9}):Play()
        TweenService:Create(TopTabButton.Image, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageTransparency = 0}):Play()
        TweenService:Create(TopTabButton, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
        TweenService:Create(TopTabButton.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()

        if isInCategory and CategoryParent.Open then
            local tabIndex = 0
            for _, child in ipairs(CategoryParent.Holder:GetChildren()) do
                if child:IsA("Frame") and child.Name ~= "Placeholder" then
                    tabIndex = tabIndex + 1
                    if child == SideTabButton then break end
                end
            end
            local delayTime = (tabIndex - 1) * 0.05 + 0.15

            task.delay(delayTime, function()
                SideTabButton.Image.ImageColor3 = SelectedTheme and SelectedTheme.SelectedTabTextColor or Color3.fromRGB(255, 255, 255)
                SideTabButton.Title.TextColor3 = SelectedTheme and SelectedTheme.SelectedTabTextColor or Color3.fromRGB(255, 255, 255)
                TweenService:Create(SideTabButton.Image, TweenInfo.new(0.2, Enum.EasingStyle.Quint), {ImageTransparency = 0}):Play()
                TweenService:Create(SideTabButton.Title, TweenInfo.new(0.2, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
            end)
        elseif not isInCategory then
            SideTabButton.Image.ImageColor3 = SelectedTheme and SelectedTheme.SelectedTabTextColor or Color3.fromRGB(255, 255, 255)
            SideTabButton.Title.TextColor3 = SelectedTheme and SelectedTheme.SelectedTabTextColor or Color3.fromRGB(255, 255, 255)
            TweenService:Create(SideTabButton.Image, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageTransparency = 0}):Play()
            TweenService:Create(SideTabButton.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
        end
    end

local function Pick()
    if Minimised then return end

    TweenService:Create(TopTabButton, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
    TweenService:Create(TopTabButton.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
    TweenService:Create(TopTabButton.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
    TweenService:Create(TopTabButton.Image, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageTransparency = 0}):Play()
    TweenService:Create(TopTabButton, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme and SelectedTheme.TabBackgroundSelected or Color3.fromRGB(90, 90, 90)}):Play()
    TweenService:Create(TopTabButton.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextColor3 = SelectedTheme and SelectedTheme.SelectedTabTextColor or Color3.fromRGB(255, 255, 255)}):Play()
    TweenService:Create(TopTabButton.Image, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageColor3 = SelectedTheme and SelectedTheme.SelectedTabTextColor or Color3.fromRGB(255, 255, 255)}):Play()
    TweenService:Create(TopTabButton.Shadow, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ImageTransparency = 0.9}):Play()

    TweenService:Create(SideTabButton.Image, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageTransparency = 0, ImageColor3 = SelectedTheme and SelectedTheme.SelectedTabTextColor or Color3.fromRGB(255, 255, 255)}):Play()
    TweenService:Create(SideTabButton.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0, TextColor3 = SelectedTheme and SelectedTheme.SelectedTabTextColor or Color3.fromRGB(255, 255, 255)}):Play()

    Elements.UIPageLayout:JumpTo(TabPage)

    for _, OtherTabButton in ipairs(TopList:GetChildren()) do
        if OtherTabButton.Name ~= "Template" and OtherTabButton.ClassName == "Frame" and OtherTabButton ~= TopTabButton and OtherTabButton.Name ~= "Placeholder" then
            TweenService:Create(OtherTabButton, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme and SelectedTheme.TabBackground or Color3.fromRGB(25, 25, 25), BackgroundTransparency = 0.7}):Play()
            TweenService:Create(OtherTabButton.Image, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageColor3 = SelectedTheme and SelectedTheme.TabImage or Color3.fromRGB(240, 240, 240)}):Play()
            TweenService:Create(OtherTabButton.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Transparency = 0, Color = SelectedTheme and SelectedTheme.TabStroke or Color3.fromRGB(85, 85, 85)}):Play()
            TweenService:Create(OtherTabButton.Shadow, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageTransparency = 0.85}):Play()
            TweenService:Create(OtherTabButton.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextColor3 = SelectedTheme and SelectedTheme.TabTextColor or Color3.fromRGB(240, 240, 240), TextTransparency = 0.2}):Play()
        end
    end

    for _, OtherTabButton in ipairs(SideList:GetChildren()) do
        if OtherTabButton.Name ~= "Template" and OtherTabButton.Name ~= "SideTemplate" and OtherTabButton.ClassName == "Frame" and OtherTabButton ~= SideTabButton and OtherTabButton.Name ~= "Placeholder" then
            if OtherTabButton.Name:match("^Category_") and OtherTabButton:FindFirstChild("Holder") then
                local categoryData = nil
                for catName, catValue in pairs(Window.Categories or {}) do
                    if OtherTabButton.Name == "Category_" .. catName then
                        categoryData = catValue
                        break
                    end
                end

                for _, CategoryTab in ipairs(OtherTabButton.Holder:GetChildren()) do
                    if CategoryTab:IsA("Frame") and CategoryTab ~= SideTabButton then
                        local isOpen = categoryData and categoryData.Open
                        if isOpen == nil then
                            isOpen = CategoryTab.Size.Y.Offset > 0
                        end

                        if isOpen then
                            TweenService:Create(CategoryTab.Image, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageTransparency = 0, ImageColor3 = SelectedTheme and SelectedTheme.SideListItemImage or Color3.fromRGB(205, 205, 205)}):Play()
                            TweenService:Create(CategoryTab.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0.2, TextColor3 = SelectedTheme and SelectedTheme.SideListItemTitle or Color3.fromRGB(205, 205, 205)}):Play()
                        end
                    end
                end
            else
                TweenService:Create(OtherTabButton.Image, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageTransparency = 0, ImageColor3 = SelectedTheme and SelectedTheme.SideListItemImage or Color3.fromRGB(205, 205, 205)}):Play()
                TweenService:Create(OtherTabButton.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0.2, TextColor3 = SelectedTheme and SelectedTheme.SideListItemTitle or Color3.fromRGB(205, 205, 205)}):Play()
            end
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
            Section.Title.TextColor3 = SelectedTheme and SelectedTheme.SectionTitleText or Color3.fromRGB(175, 175, 175)
            TweenService:Create(Section.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
            --[[
            local SectionSep = ArrayField.Edit.Elements.Editor.General.Sep:Clone()
                SectionSep.Visible = true
                SectionSep.ZIndex = 5
                SectionSep.Name = "SectionSeperator"
                SectionSep.Size = UDim2.new(0.96, 0, 0, 1)
                SectionSep.AnchorPoint = Vector2.new(0.5, 0)
                SectionSep.Position = UDim2.new(0.5, 0, 0, 0)
                SectionSep.LayoutOrder = -1
                SectionSep.Parent = Section.Holder
            ]]
                function SectionValue:Set(NewSection)
                    Section.Title.Text = NewSection
                end
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

        -- Seperator
        function Tab:CreateSeparator(SectionParent, Settings)
            Settings = Settings or {}
            local Title = Settings.Title or nil
            local Width = Settings.Width or 0.99
            local Padding = Settings.Padding or 10

            local Container = Instance.new("Frame")
            Container.Name = "Separator"
            Container.BackgroundTransparency = 1
            Container.Size = UDim2.new(Width, 0, 0, Padding * 2 + 1)
            Container.AnchorPoint = Vector2.new(0.5, 0)
            Container.Position = UDim2.new(0.5, 0, 0, 0)
            Container.LayoutOrder = 1
            Container.ZIndex = 5

            if Title then
                local LeftLine = ArrayField.Edit.Elements.Editor.General.Sep:Clone()
                LeftLine.Visible = true
                LeftLine.ZIndex = 5
                LeftLine.Size = UDim2.new(0.4, -10, 0, 1)
                LeftLine.Position = UDim2.new(0, 0, 0.5, 0)
                LeftLine.AnchorPoint = Vector2.new(0, 0.5)
                LeftLine.Parent = Container

                local TitleLabel = Instance.new("TextLabel")
                TitleLabel.Name = "Title"
                TitleLabel.BackgroundTransparency = 1
                TitleLabel.Size = UDim2.new(0.2, 20, 1, 0)
                TitleLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
                TitleLabel.AnchorPoint = Vector2.new(0.5, 0.5)
                TitleLabel.Text = Title
                TitleLabel.TextColor3 = SelectedTheme and SelectedTheme.TextColor or Color3.fromRGB(175, 175, 175)
                TitleLabel.TextSize = 12
                TitleLabel.Font = Enum.Font.Gotham
                TitleLabel.ZIndex = 5
                TitleLabel.Parent = Container

                local RightLine = ArrayField.Edit.Elements.Editor.General.Sep:Clone()
                RightLine.Visible = true
                RightLine.ZIndex = 5
                RightLine.Size = UDim2.new(0.4, -10, 0, 1)
                RightLine.Position = UDim2.new(1, 0, 0.5, 0)
                RightLine.AnchorPoint = Vector2.new(1, 0.5)
                RightLine.Parent = Container
            else
                local Line = ArrayField.Edit.Elements.Editor.General.Sep:Clone()
                Line.Visible = true
                Line.ZIndex = 5
                Line.Size = UDim2.new(1, 0, 0, 1)
                Line.Position = UDim2.new(0.5, 0, 0.5, 0)
                Line.AnchorPoint = Vector2.new(0.5, 0.5)
                Line.Parent = Container
            end

            if SectionParent then
                Container.Parent = SectionParent.Holder
            else
                Container.Parent = TabPage
            end

            return Container
        end

        -- ImageLabel image
        function Tab:CreateImage(SectionParent, Settings)
            Settings = Settings or {}
            local Image = Settings.Image or ""
            local Width = Settings.Width or 200
            local Height = Settings.Height or 200
            local Transparency = Settings.Transparency or 0

            local httpRequest = request or http_request or (syn and syn.request) or (http and http.request) or (fluxus and fluxus.request)

            local ImageContainer = Elements.Template.ImageLabel:Clone()
            ImageContainer.Visible = true
            ImageContainer.LayoutOrder = 1
            ImageContainer.Size = UDim2.new(0, Width, 0, Height)
            ImageContainer.AnchorPoint = Vector2.new(0.5, 0)
            ImageContainer.Position = UDim2.new(0.5, 0, 0, 0)
            ImageContainer.BackgroundColor3 = SelectedTheme and SelectedTheme.ElementBackground or ImageContainer.BackgroundColor3
            if ImageContainer:FindFirstChild("UIStroke") then
                ImageContainer.UIStroke.Color = SelectedTheme and SelectedTheme.ElementStroke or ImageContainer.UIStroke.Color
            end

            local ImageElement = ImageContainer.ImageLabel
            ImageElement.ZIndex = 5
            ImageElement.ImageTransparency = 1
            ImageElement.Size = UDim2.new(1, 0, 1, 0)
            ImageElement.Image = ""

            if ImageElement:FindFirstChild("TextLabel") then
                ImageElement.TextLabel:Destroy()
            end

            local function GetUrlHash(url)
                local hash = 5381
                for i = 1, #url do
                    hash = ((hash * 33) + string.byte(url, i)) % 2147483647
                end
                return tostring(hash)
            end

            local function GetExtension(path)
                local cleanPath = path:match("^([^?#]+)") or path
                local ext = cleanPath:match("%.(%w+)$")
                return ext and ext:lower() or "png"
            end

            local function EnsureFolders()
                if isfolder and makefolder then
                    if not isfolder("ArrayField") then
                        makefolder("ArrayField")
                    end
                    if not isfolder("ArrayField/Assets") then
                        makefolder("ArrayField/Assets")
                    end
                end
            end

            local function ShowImage(assetPath)
                ImageElement.Image = assetPath
                TweenService:Create(ImageElement, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ImageTransparency = Transparency}):Play()
            end

            local function DownloadAndShowImage(url)
                task.spawn(function()
                    EnsureFolders()

                    local ext = GetExtension(url)
                    if ext == "gif" then ext = "png" end
                    local fileHash = GetUrlHash(url)
                    local fileName = "ArrayField/Assets/" .. fileHash .. "." .. ext

                    local assetFunc = getcustomasset or getsynasset or getasset
                    if not assetFunc then return end

                    if isfile and isfile(fileName) then
                        local success, assetPath = pcall(function()
                            return assetFunc(fileName)
                        end)
                        if success and assetPath then
                            ShowImage(assetPath)
                        end
                        return
                    end

                    if not httpRequest then return end

                    local success, response = pcall(function()
                        return httpRequest({
                            Url = url,
                            Method = "GET"
                        })
                    end)

                    if success and response and response.StatusCode == 200 and response.Body and response.Body ~= "" then
                        local writeSuccess = pcall(function()
                            writefile(fileName, response.Body)
                        end)

                        if writeSuccess then
                            local assetSuccess, assetPath = pcall(function()
                                return assetFunc(fileName)
                            end)

                            if assetSuccess and assetPath then
                                ShowImage(assetPath)
                            end
                        end
                    end
                end)
            end

            local function SetImage(img)
                ImageElement.ImageTransparency = 1
                ImageElement.Image = ""

                if not img or img == "" then
                    return
                end

                if img:match("^rbxasset") or img:match("^rbxthumb") then
                    ShowImage(img)
                    return
                end

                if isfile and isfile(img) then
                    local assetFunc = getcustomasset or getsynasset or getasset
                    if assetFunc then
                        local success, result = pcall(function()
                            return assetFunc(img)
                        end)
                        if success and result then
                            ShowImage(result)
                        end
                    end
                    return
                end

                if img:match("^https?://") then
                    DownloadAndShowImage(img)
                    return
                end

                ShowImage(img)
            end

            SetImage(Image)

            if SectionParent then
                ImageContainer.Parent = SectionParent.Holder
            else
                ImageContainer.Parent = TabPage
            end

            local ImageValue = {}

            function ImageValue:Set(NewImage)
                SetImage(NewImage)
            end

            function ImageValue:SetSize(NewWidth, NewHeight)
                ImageContainer.Size = UDim2.new(0, NewWidth, 0, NewHeight)
            end

            function ImageValue:SetTransparency(NewTransparency)
                Transparency = NewTransparency
                ImageElement.ImageTransparency = NewTransparency
            end

            function ImageValue:Destroy()
                ImageContainer:Destroy()
            end

            return ImageValue
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

            if Button:FindFirstChild("ElementIndicator") then
                Button.ElementIndicator.Text = ButtonSettings.Interact or "button"
            end

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

            local function CreateDescriptionLabel()
                if not ButtonSettings.Description then return end

                DescriptionLabel = Instance.new("TextLabel")
                DescriptionLabel.Name = "DescriptionText"
                DescriptionLabel.BackgroundTransparency = 1
                DescriptionLabel.Text = ButtonSettings.Description
                DescriptionLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
                DescriptionLabel.TextSize = 13
                DescriptionLabel.ZIndex = 3
                DescriptionLabel.Font = Enum.Font.Gotham
                DescriptionLabel.TextXAlignment = Enum.TextXAlignment.Left
                DescriptionLabel.TextYAlignment = Enum.TextYAlignment.Center
                DescriptionLabel.TextWrapped = true
                DescriptionLabel.TextTransparency = 1
                DescriptionLabel.Visible = false
                DescriptionLabel.Parent = Button

                local textService = game:GetService("TextService")
                local textSize = textService:GetTextSize(ButtonSettings.Description, 13, Enum.Font.Gotham, Vector2.new(400, math.huge))

                DescriptionLabel.Size = UDim2.new(0, math.min(textSize.X + 20, 420), 0, math.max(textSize.Y + 4, 20))
                DescriptionLabel.Position = UDim2.new(0, 15, 0.46, 0)
            end

            if ButtonSettings.Description then
                CreateDescriptionLabel()
            end

            Button.Interact.MouseButton1Click:Connect(function()
                if ButtonValue.Locked then return end

                local Success, Response = pcall(ButtonSettings.Callback)

                if not Button.Parent then return end

                if not Success then
                    TweenService:Create(Button, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = Color3.fromRGB(85, 0, 0)}):Play()
                    if Button:FindFirstChild("ElementIndicator") then
                        TweenService:Create(Button.ElementIndicator, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
                    end
                    TweenService:Create(Button.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
                    Button.Title.Text = "Callback Error"
                    print("ArrayField | "..ButtonSettings.Name.." Callback Error " ..tostring(Response))
                    task.wait(0.5)
                    Button.Title.Text = ButtonSettings.Name
                    if SelectedTheme then
                        TweenService:Create(Button, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
                    end
                    TweenService:Create(Button.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
                    if Button:FindFirstChild("ElementIndicator") then
                        TweenService:Create(Button.ElementIndicator, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {TextTransparency = 0.9}):Play()
                    end
                else
                    if SelectedTheme then
                        TweenService:Create(Button, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
                    end
                    if Button:FindFirstChild("ElementIndicator") then
                        TweenService:Create(Button.ElementIndicator, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
                    end
                    TweenService:Create(Button.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
                    task.wait(0.2)
                    if SelectedTheme then
                        TweenService:Create(Button, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
                    end
                    TweenService:Create(Button.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
                    if Button:FindFirstChild("ElementIndicator") then
                        TweenService:Create(Button.ElementIndicator, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {TextTransparency = 0.9}):Play()
                    end
                end
            end)

            Button.MouseEnter:Connect(function()
                if ShouldBlockHover() then return end
                if SelectedTheme then
                    TweenService:Create(Button, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
                end
                if Button:FindFirstChild("ElementIndicator") then
                    TweenService:Create(Button.ElementIndicator, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {TextTransparency = 0.7}):Play()
                end

                if ButtonSettings.Description and DescriptionLabel and not DescriptionVisible then
                    DescriptionVisible = true
                    DescriptionLabel.Visible = true

                    local NewTitleY = OriginalTitlePosition.Y.Scale
                    local NewTitleYOffset = OriginalTitlePosition.Y.Offset - 15

                    TweenService:Create(Button.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {
                        Position = UDim2.new(OriginalTitlePosition.X.Scale, OriginalTitlePosition.X.Offset, NewTitleY, NewTitleYOffset)
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
                if Button:FindFirstChild("ElementIndicator") then
                    TweenService:Create(Button.ElementIndicator, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {TextTransparency = 0.9}):Play()
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

            function ButtonValue:Set(NewButton, Interaction)
                Button.Title.Text = NewButton or Button.Title.Text
                Button.Name = NewButton or Button.Name
                if Button:FindFirstChild("ElementIndicator") then
                    Button.ElementIndicator.Text = Interaction or Button.ElementIndicator.Text
                end
            end

            function ButtonValue:SetDescription(NewDescription)
                ButtonSettings.Description = NewDescription
                if DescriptionLabel then
                    DescriptionLabel.Text = NewDescription
                    local textService = game:GetService("TextService")
                    local textSize = textService:GetTextSize(NewDescription, 13, Enum.Font.Gotham, Vector2.new(400, math.huge))
                    DescriptionLabel.Size = UDim2.new(0, math.min(textSize.X + 20, 420), 0, math.max(textSize.Y + 4, 20))
                elseif NewDescription then
                    CreateDescriptionLabel()
                end
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
                DescriptionLabel.ZIndex = 3
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
                if ShouldBlockHover() then return end
                TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()

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
                TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()

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

                ArrayFieldLibrary.SaveConfiguration()
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

            ToggleSettings.Type = "Toggle"

            if ArrayFieldLibrary.ConfigEnabled and ToggleSettings.Flag then
                ArrayFieldLibrary.Flags[ToggleSettings.Flag] = ToggleSettings
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

            Slider.Main.Interact.Size = UDim2.new(1, 0, 1, 0)
            Slider.Main.Interact.Position = UDim2.new(0, 0, 0, 0)
            Slider.Main.Interact.ZIndex = 10
            Slider.Main.Interact.BackgroundTransparency = 1

            Tab.Elements[SliderSettings.Name] = {
                type = 'slider',
                section = SliderSettings.SectionParent,
                element = Slider
            }

            if not Slider.Main:FindFirstChild("UIStroke") then
                local stroke = Instance.new("UIStroke")
                stroke.Color = SelectedTheme.SliderStroke
                stroke.Thickness = 1
                stroke.Parent = Slider.Main
            end

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
                Slider.Main.Progress.BackgroundColor3 = SelectedTheme.SliderProgress
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
                DescriptionLabel.ZIndex = 3
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
                if ShouldBlockHover() then return end
                TweenService:Create(Slider, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()

                if SliderSettings.Description and DescriptionLabel and not DescriptionVisible then
                    DescriptionVisible = true
                    DescriptionLabel.Visible = true
                    TweenService:Create(Slider, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 465, 0, 45 + DescriptionLabel.AbsoluteSize.Y + 12)}):Play()
                    TweenService:Create(DescriptionLabel, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
                end
            end)

            Slider.MouseLeave:Connect(function()
                TweenService:Create(Slider, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()

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
                    ArrayFieldLibrary.SaveConfiguration()
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

            SliderSettings.Type = "Slider"

            if ConfigurationSettings.Enabled and SliderSettings.Flag then
                ArrayFieldLibrary.Flags[SliderSettings.Flag] = SliderSettings
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
                DescriptionLabel.ZIndex = 3
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
            end)

            Input.MouseEnter:Connect(function()
                if ShouldBlockHover() then return end
                TweenService:Create(Input, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()

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
                    TweenService:Create(Input, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()

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
                DescriptionLabel.ZIndex = 3
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
                    ArrayFieldLibrary.SaveConfiguration()
                end
            end)

            Keybind.MouseEnter:Connect(function()
                if ShouldBlockHover() then return end
                TweenService:Create(Keybind, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()

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
                TweenService:Create(Keybind, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()

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
                        ArrayFieldLibrary.SaveConfiguration()
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

            KeybindSettings.Type = "Keybind"

            if ConfigurationSettings.Enabled and KeybindSettings.Flag then
                ArrayFieldLibrary.Flags[KeybindSettings.Flag] = KeybindSettings
            end

            return KeybindSettings
        end

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
                    Label:SetAttribute("HasCustomBackground", true)
                    Label:SetAttribute("CustomBgR", bgColors[background].bg.R)
                    Label:SetAttribute("CustomBgG", bgColors[background].bg.G)
                    Label:SetAttribute("CustomBgB", bgColors[background].bg.B)
                    Label:SetAttribute("CustomTextR", bgColors[background].text.R)
                    Label:SetAttribute("CustomTextG", bgColors[background].text.G)
                    Label:SetAttribute("CustomTextB", bgColors[background].text.B)
                elseif string.match(tostring(background), "^#%x%x%x%x%x%x$") then
                    local r, g, b = string.match(background, "^#(%x%x)(%x%x)(%x%x)$")
                    local bgColor = Color3.fromRGB(tonumber(r, 16), tonumber(g, 16), tonumber(b, 16))
                    Label.BackgroundColor3 = bgColor
                    Label.Title.TextColor3 = Color3.fromRGB(255, 255, 255)
                    Label:SetAttribute("HasCustomBackground", true)
                    Label:SetAttribute("CustomBgR", bgColor.R)
                    Label:SetAttribute("CustomBgG", bgColor.G)
                    Label:SetAttribute("CustomBgB", bgColor.B)
                    Label:SetAttribute("CustomTextR", 1)
                    Label:SetAttribute("CustomTextG", 1)
                    Label:SetAttribute("CustomTextB", 1)
                end
            else
                if SelectedTheme then
                    Label.BackgroundColor3 = SelectedTheme.SecondaryElementBackground
                    Label.UIStroke.Color = SelectedTheme.SecondaryElementStroke
                    Label.Title.TextColor3 = SelectedTheme.TextColor
                end
            end

            local iconLabel = nil
            if iconName then
                iconLabel = Instance.new("ImageLabel")
                iconLabel.Name = "LabelIcon"
                iconLabel.Size = UDim2.new(0, 20, 0, 20)
                iconLabel.Position = UDim2.new(0, 12, 0.5, 0)
                iconLabel.AnchorPoint = Vector2.new(0, 0.5)
                iconLabel.BackgroundTransparency = 1
                iconLabel.ZIndex = 3
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
                        Label:SetAttribute("HasCustomBackground", true)
                        Label:SetAttribute("CustomBgR", bgColors[newBg].bg.R)
                        Label:SetAttribute("CustomBgG", bgColors[newBg].bg.G)
                        Label:SetAttribute("CustomBgB", bgColors[newBg].bg.B)
                        Label:SetAttribute("CustomTextR", bgColors[newBg].text.R)
                        Label:SetAttribute("CustomTextG", bgColors[newBg].text.G)
                        Label:SetAttribute("CustomTextB", bgColors[newBg].text.B)
                    elseif string.match(tostring(newBg), "^#%x%x%x%x%x%x$") then
                        local r, g, b = string.match(newBg, "^#(%x%x)(%x%x)(%x%x)$")
                        local bgColor = Color3.fromRGB(tonumber(r, 16), tonumber(g, 16), tonumber(b, 16))
                        Label.BackgroundColor3 = bgColor
                        Label.Title.TextColor3 = Color3.fromRGB(255, 255, 255)
                        if iconLabel then iconLabel.ImageColor3 = Color3.fromRGB(255, 255, 255) end
                        Label:SetAttribute("HasCustomBackground", true)
                        Label:SetAttribute("CustomBgR", bgColor.R)
                        Label:SetAttribute("CustomBgG", bgColor.G)
                        Label:SetAttribute("CustomBgB", bgColor.B)
                        Label:SetAttribute("CustomTextR", 1)
                        Label:SetAttribute("CustomTextG", 1)
                        Label:SetAttribute("CustomTextB", 1)
                    end
                elseif NewSettings.Background == nil and Label:GetAttribute("HasCustomBackground") then
                    Label:SetAttribute("HasCustomBackground", nil)
                    Label:SetAttribute("CustomBgR", nil)
                    Label:SetAttribute("CustomBgG", nil)
                    Label:SetAttribute("CustomBgB", nil)
                    Label:SetAttribute("CustomTextR", nil)
                    Label:SetAttribute("CustomTextG", nil)
                    Label:SetAttribute("CustomTextB", nil)
                    if SelectedTheme then
                        Label.BackgroundColor3 = SelectedTheme.SecondaryElementBackground
                        Label.Title.TextColor3 = SelectedTheme.TextColor
                        if iconLabel then iconLabel.ImageColor3 = SelectedTheme.TextColor end
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
                Paragraph.Title.TextColor3 = SelectedTheme.TextColor
                Paragraph.Content.TextColor3 = SelectedTheme.TextColor
            end

            local hasCustomBg = false
            if ParagraphSettings.Background then
                local bg = ParagraphSettings.Background
                if bgColors[bg] then
                    Paragraph.BackgroundColor3 = bgColors[bg].bg
                    Paragraph.Title.TextColor3 = bgColors[bg].title
                    Paragraph.Content.TextColor3 = bgColors[bg].content
                    hasCustomBg = true
                    Paragraph:SetAttribute("HasCustomBackground", true)
                    Paragraph:SetAttribute("CustomBgR", bgColors[bg].bg.R)
                    Paragraph:SetAttribute("CustomBgG", bgColors[bg].bg.G)
                    Paragraph:SetAttribute("CustomBgB", bgColors[bg].bg.B)
                    Paragraph:SetAttribute("CustomTitleR", bgColors[bg].title.R)
                    Paragraph:SetAttribute("CustomTitleG", bgColors[bg].title.G)
                    Paragraph:SetAttribute("CustomTitleB", bgColors[bg].title.B)
                    Paragraph:SetAttribute("CustomContentR", bgColors[bg].content.R)
                    Paragraph:SetAttribute("CustomContentG", bgColors[bg].content.G)
                    Paragraph:SetAttribute("CustomContentB", bgColors[bg].content.B)
                elseif string.match(tostring(bg), "^#%x%x%x%x%x%x$") then
                    local r, g, b = string.match(bg, "^#(%x%x)(%x%x)(%x%x)$")
                    local bgColor = Color3.fromRGB(tonumber(r, 16), tonumber(g, 16), tonumber(b, 16))
                    Paragraph.BackgroundColor3 = bgColor
                    Paragraph.Title.TextColor3 = Color3.fromRGB(255, 255, 255)
                    Paragraph.Content.TextColor3 = Color3.fromRGB(240, 240, 240)
                    hasCustomBg = true
                    Paragraph:SetAttribute("HasCustomBackground", true)
                    Paragraph:SetAttribute("CustomBgR", bgColor.R)
                    Paragraph:SetAttribute("CustomBgG", bgColor.G)
                    Paragraph:SetAttribute("CustomBgB", bgColor.B)
                    Paragraph:SetAttribute("CustomTitleR", 1)
                    Paragraph:SetAttribute("CustomTitleG", 1)
                    Paragraph:SetAttribute("CustomTitleB", 1)
                    Paragraph:SetAttribute("CustomContentR", 240/255)
                    Paragraph:SetAttribute("CustomContentG", 240/255)
                    Paragraph:SetAttribute("CustomContentB", 240/255)
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
                iconLabel.ZIndex = 3

                if hasCustomBg then
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

        function Tab:CreateDropdown(DropdownSettings)
            local Dropdown = Elements.Template.Dropdown:Clone()
            Dropdown.List.Template.Visible = false
            local SearchBar = Dropdown.List["-SearchBar"]
            local DropdownDebounce = false

            local InputButton = Instance.new("TextButton")
            InputButton.Name = "InputButton"
            InputButton.BackgroundTransparency = 1
            InputButton.Size = UDim2.new(1, 0, 1, 0)
            InputButton.Text = ""
            InputButton.ZIndex = 10
            InputButton.Parent = SearchBar

            InputButton.MouseButton1Click:Connect(function()
                if not DropdownSettings.Locked then
                    SearchBar.Input:CaptureFocus()
                end
            end)

            InputButton.TouchTap:Connect(function()
                if not DropdownSettings.Locked then
                    SearchBar.Input:CaptureFocus()
                end
            end)

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
                Dropdown.Selected.TextColor3 = SelectedTheme.DropdownSelected
                Dropdown.Toggle.ImageColor3 = SelectedTheme.DropdownToggle
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
                if ShouldBlockHover() then return end
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
                if SelectedTheme then
                    TweenService:Create(Dropdown, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = Color3.fromRGB(85, 0, 0)}):Play()
                end
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
                    DropdownOption.BackgroundColor3 = SelectedTheme.ElementBackgroundHover
                else
                    DropdownOption.BackgroundColor3 = SelectedTheme.SecondaryElementBackground
                end
                if DropdownOption:FindFirstChild("UIStroke") then
                    DropdownOption.UIStroke.Color = SelectedTheme.SecondaryElementStroke
                end
                if DropdownOption:FindFirstChild("Title") then
                    DropdownOption.Title.TextColor3 = SelectedTheme.TextColor
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
                        TweenService:Create(DropdownOption, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.SecondaryElementBackground}):Play()
                        ArrayFieldLibrary.SaveConfiguration()
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
                    TweenService:Create(DropdownOption, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
                    DropdownDebounce = true
                    task.wait(0.2)
                    TweenService:Create(DropdownOption.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
                    task.wait(0.1)

                    if not Multi then
                        TweenService:Create(Dropdown, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 465, 0, 45)}):Play()

                        TweenService:Create(SearchBar, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
                        TweenService:Create(SearchBar.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
                        TweenService:Create(SearchBar.Input, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()

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
                    ArrayFieldLibrary.SaveConfiguration()
                end)

                DropdownOption.MouseEnter:Connect(function()
                    if not OptionInTable.Selected then
                        TweenService:Create(DropdownOption, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
                    end
                end)

                DropdownOption.MouseLeave:Connect(function()
                    if not OptionInTable.Selected then
                        TweenService:Create(DropdownOption, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.SecondaryElementBackground}):Play()
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
            end

            function DropdownSettings:Add(Items, Selected)
                AddOptions(Items, Selected)
            end

            AddOptions(DropdownSettings.Options, DropdownSettings.CurrentOption)

            function DropdownSettings:Set(NewOption)
                if typeof(NewOption) == "table" then
                    for _, item in ipairs(DropdownSettings.Items.Selected) do
                        item.Selected = false
                        TweenService:Create(item.Option, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.SecondaryElementBackground}):Play()
                    end
                    DropdownSettings.Items.Selected = {}

                    for _, optName in ipairs(NewOption) do
                        local item = DropdownSettings.Items[optName]
                        if item then
                            item.Selected = true
                            table.insert(DropdownSettings.Items.Selected, item)
                            TweenService:Create(item.Option, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
                        end
                    end
                    RefreshSelected()
                else
                    for _, item in ipairs(DropdownSettings.Items.Selected) do
                        item.Selected = false
                        TweenService:Create(item.Option, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.SecondaryElementBackground}):Play()
                    end
                    DropdownSettings.Items.Selected = {}

                    local item = DropdownSettings.Items[NewOption]
                    if item then
                        item.Selected = true
                        table.insert(DropdownSettings.Items.Selected, item)
                        TweenService:Create(item.Option, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
                        Dropdown.Selected.Text = NewOption
                    end
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

                TweenService:Create(SearchBar, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
                TweenService:Create(SearchBar.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
                TweenService:Create(SearchBar.Input, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()

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

            DropdownSettings.Type = "Dropdown"

            if ConfigurationSettings.Enabled and DropdownSettings.Flag then
                ArrayFieldLibrary.Flags[DropdownSettings.Flag] = DropdownSettings
            end

            return DropdownSettings
        end

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

            if ColorPicker:FindFirstChild("ColorPickerIs") then
                ColorPicker.ColorPickerIs.Value = false
            end

            ColorPicker.ClipsDescendants = true
            ColorPicker.Name = ColorPickerSettings.Name
            ColorPicker.Title.Text = ColorPickerSettings.Name
            ColorPickerSettings.Locked = false
            ColorPicker.Visible = true

            if SelectedTheme then
                ColorPicker.BackgroundColor3 = SelectedTheme.ElementBackground
                if ColorPicker:FindFirstChild("UIStroke") then
                    ColorPicker.UIStroke.Color = SelectedTheme.ElementStroke
                end
                if ColorPicker:FindFirstChild("Title") then
                    ColorPicker.Title.TextColor3 = SelectedTheme.TextColor
                end
                if ColorPicker:FindFirstChild("HexInput") then
                    ColorPicker.HexInput.BackgroundColor3 = SelectedTheme.InputBackground
                    if ColorPicker.HexInput:FindFirstChild("UIStroke") then
                        ColorPicker.HexInput.UIStroke.Color = SelectedTheme.InputStroke
                    end
                    if ColorPicker.HexInput:FindFirstChild("InputBox") then
                        ColorPicker.HexInput.InputBox.TextColor3 = SelectedTheme.TextColor
                    end
                end
                if ColorPicker:FindFirstChild("RGB") then
                    local RGB = ColorPicker.RGB
                    for _, input in ipairs({RGB:FindFirstChild("RInput"), RGB:FindFirstChild("GInput"), RGB:FindFirstChild("BInput")}) do
                        if input then
                            input.BackgroundColor3 = SelectedTheme.InputBackground
                            if input:FindFirstChild("UIStroke") then
                                input.UIStroke.Color = SelectedTheme.InputStroke
                            end
                            if input:FindFirstChild("InputBox") then
                                input.InputBox.TextColor3 = SelectedTheme.TextColor
                            end
                        end
                    end
                end
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
            ColorPicker.Interact.Position = UDim2.new(0.5, 0, 0.7, 0)
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
                    TweenService:Create(ColorPicker.Interact, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Position = UDim2.new(0.5, 0, 0.7, 0)}):Play()
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
                if opened and not ColorPickerSettings.Locked then
                    mainDragging = true
                end
            end)

            Main.MainPoint.MouseButton1Down:Connect(function()
                if opened and not ColorPickerSettings.Locked then
                    mainDragging = true
                end
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

                color = Color3.fromHSV(h, s, v)
                local r, g, b = math.floor((color.R * 255) + 0.5), math.floor((color.G * 255) + 0.5), math.floor((color.B * 255) + 0.5)
                ColorPicker.RGB.RInput.InputBox.Text = tostring(r)
                ColorPicker.RGB.GInput.InputBox.Text = tostring(g)
                ColorPicker.RGB.BInput.InputBox.Text = tostring(b)
                hex = string.format("#%02X%02X%02X", color.R * 0xFF, color.G * 0xFF, color.B * 0xFF)
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
                local r, g, b = math.floor((h * 255) + 0.5), math.floor((s * 255) + 0.5), math.floor((v * 255) + 0.5)
                ColorPickerSettings.Color = Color3.fromRGB(r, g, b)
                ArrayFieldLibrary.SaveConfiguration()
            end)

            local function rgbBoxes(box, toChange)
                local value = tonumber(box.Text)
                color = Color3.fromHSV(h, s, v)
                local oldR, oldG, oldB = math.floor((color.R * 255) + 0.5), math.floor((color.G * 255) + 0.5), math.floor((color.B * 255) + 0.5)
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

                local r, g, b = math.floor((h * 255) + 0.5), math.floor((s * 255) + 0.5), math.floor((v * 255) + 0.5)
                ColorPickerSettings.Color = Color3.fromRGB(r, g, b)
                ArrayFieldLibrary.SaveConfiguration()
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

                    color = Color3.fromHSV(h, s, v)
                    local r, g, b = math.floor((color.R * 255) + 0.5), math.floor((color.G * 255) + 0.5), math.floor((color.B * 255) + 0.5)
                    ColorPicker.RGB.RInput.InputBox.Text = tostring(r)
                    ColorPicker.RGB.GInput.InputBox.Text = tostring(g)
                    ColorPicker.RGB.BInput.InputBox.Text = tostring(b)
                    ColorPicker.HexInput.InputBox.Text = string.format("#%02X%02X%02X", color.R * 0xFF, color.G * 0xFF, color.B * 0xFF)
                    pcall(function() ColorPickerSettings.Callback(Color3.fromHSV(h, s, v)) end)
                    ColorPickerSettings.Color = Color3.fromRGB(r, g, b)
                    ArrayFieldLibrary.SaveConfiguration()
                end

                if sliderDragging then
                    local localX = math.clamp(mouse.X - Slider.AbsolutePosition.X, 0, Slider.AbsoluteSize.X)
                    h = localX / Slider.AbsoluteSize.X
                    Display.BackgroundColor3 = Color3.fromHSV(h, s, v)
                    Slider.SliderPoint.Position = UDim2.new(0, localX - Slider.SliderPoint.AbsoluteSize.X / 2, 0.5, 0)
                    Slider.SliderPoint.ImageColor3 = Color3.fromHSV(h, 1, 1)
                    Background.BackgroundColor3 = Color3.fromHSV(h, 1, 1)
                    Main.MainPoint.ImageColor3 = Color3.fromHSV(h, s, v)

                    color = Color3.fromHSV(h, s, v)
                    local r, g, b = math.floor((color.R * 255) + 0.5), math.floor((color.G * 255) + 0.5), math.floor((color.B * 255) + 0.5)
                    ColorPicker.RGB.RInput.InputBox.Text = tostring(r)
                    ColorPicker.RGB.GInput.InputBox.Text = tostring(g)
                    ColorPicker.RGB.BInput.InputBox.Text = tostring(b)
                    ColorPicker.HexInput.InputBox.Text = string.format("#%02X%02X%02X", color.R * 0xFF, color.G * 0xFF, color.B * 0xFF)
                    pcall(function() ColorPickerSettings.Callback(Color3.fromHSV(h, s, v)) end)
                    ColorPickerSettings.Color = Color3.fromRGB(r, g, b)
                    ArrayFieldLibrary.SaveConfiguration()
                end
            end)

            function ColorPickerSettings:Set(RGBColor)
                ColorPickerSettings.Color = RGBColor
                h, s, v = ColorPickerSettings.Color:ToHSV()
                color = Color3.fromHSV(h, s, v)
                setDisplay()
            end

            function ColorPickerSettings:Destroy()
                ColorPicker:Destroy()
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
                TweenService:Create(ColorPicker.RGB, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Position = UDim2.new(0, 17, 0, 70)}):Play()
                TweenService:Create(ColorPicker.HexInput, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Position = UDim2.new(0, 17, 0, 90)}):Play()
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

            function ColorPickerSettings:Visible(bool)
                ColorPicker.Visible = bool
            end

            ColorPickerSettings.Type = "ColorPicker"

            if ConfigurationSettings.Enabled and ColorPickerSettings.Flag then
                ArrayFieldLibrary.Flags[ColorPickerSettings.Flag] = ColorPickerSettings
            end

            return ColorPickerSettings
        end
        return Tab
    end

    function Window:Prompt(PromptSettings)
		local PromptUI = Prompt.Prompt
		Prompt.Visible = true
		Prompt.BackgroundTransparency = 1
		PromptUI.BackgroundTransparency = 1
		PromptUI.UIStroke.Transparency = 1
		PromptUI.Content.TextTransparency = 1
		PromptUI.Title.TextTransparency = 1
		PromptUI.Sub.TextTransparency = 1
		PromptUI.Size = UDim2.new(0,340,0,140)
        PromptUI.Buttons.Size = UDim2.new(0, 340, 0, 38)
		PromptUI.Buttons.Template.Visible = false
		PromptUI.Buttons.Template.TextLabel.TextTransparency = 1
		PromptUI.Buttons.Template.UIStroke.Transparency = 1

		PromptUI.Content.Text = PromptSettings.Content
		PromptUI.Sub.Text = PromptSettings.SubTitle or ''
		PromptUI.Title.Text = PromptSettings.Title or ''

		if PromptSettings.Actions then
			for name,info in pairs(PromptSettings.Actions) do
				local Button = PromptUI.Buttons.Template:Clone()
				Button.TextLabel.Text = info.Name
				Button.Interact.MouseButton1Up:Connect(function()
					if not clicked then
						local Success, Response = pcall(info.Callback)
						clicked = true
						if not Success then
							ClosePrompt()
							print("ArrayField | "..info.Name.." Callback Error " ..tostring(Response))
						else
							ClosePrompt()
						end
					end
				end)
				Button.Name = name
				Button.Parent = PromptUI.Buttons
				Button.Size = UDim2.fromOffset(Button.TextLabel.TextBounds.X + 24, 30)
			end
		end

		TweenService:Create(Prompt, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = .5}):Play()
		wait(.2)
		TweenService:Create(PromptUI, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {BackgroundTransparency = 0,Size = UDim2.new(0,350,0,150)}):Play()
		wait(0.2)
		TweenService:Create(PromptUI.UIStroke, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
		TweenService:Create(PromptUI.Title, TweenInfo.new(0.45, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
		TweenService:Create(PromptUI.Content, TweenInfo.new(0.45, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
		TweenService:Create(PromptUI.Sub, TweenInfo.new(0.45, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
		wait(1)
		if PromptSettings.Actions then
			for _,button in pairs(PromptUI.Buttons:GetChildren()) do
				if button.Name ~= 'Template' and button.Name ~= 'Middle' and button:IsA('Frame') then
					button.Visible = true
					TweenService:Create(button.UIStroke,TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
					TweenService:Create(button.TextLabel,TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
					wait(.8)
				end
			end
		else
			TweenService:Create(PromptUI.Buttons.Middle.UIStroke,TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
			TweenService:Create(PromptUI.Buttons.Middle.TextLabel,TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
		end
	end

    function Window:NotePrompt(PromptSettings)
        local Infos = TweenInfo.new(.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        NotePrompt.Visible = false

        NotePrompt.Title.TextScaled = false
        NotePrompt.Title.TextSize = 18
        NotePrompt.Description.TextScaled = false
        NotePrompt.Description.TextSize = 14

        NotePrompt.Shadow.Image.ZIndex = NotePrompt.Shadow.ZIndex - 1

        NotePrompt.Size = UDim2.fromOffset(474, 100)
        NotePrompt.Position = UDim2.new(0.6, 0, 0.31, 0)
        NotePrompt.BackgroundTransparency = 1
        NotePrompt.UIStroke.Transparency = 1

        NotePrompt.Icon.ImageTransparency = 1
        NotePrompt.Close.ImageTransparency = 1

        NotePrompt.Shadow.Image.ImageTransparency = 1

        NotePrompt.Title.TextTransparency = 1
        NotePrompt.Description.TextTransparency = 1

        NotePrompt.Load.BackgroundColor3 = Color3.fromRGB(34, 35, 33)
        NotePrompt.Load.BackgroundTransparency = 1
        NotePrompt.Load.UIStroke.Transparency = 1
        NotePrompt.Load.TextTransparency = 1
        NotePrompt.Load.Shadow.ImageTransparency = 1

        NotePrompt.Title.Text = PromptSettings.Title or ''
        NotePrompt.Description.Text = PromptSettings.Description or ''

        if PromptSettings.Icon then
            if type(PromptSettings.Icon) == "string" and not tonumber(PromptSettings.Icon) then
                local success, iconData = pcall(getIcon, PromptSettings.Icon)
                if success then
                    NotePrompt.Icon.Image = "rbxassetid://" .. iconData.id
                    NotePrompt.Icon.ImageRectOffset = iconData.imageRectOffset
                    NotePrompt.Icon.ImageRectSize = iconData.imageRectSize
                else
                    NotePrompt.Icon.Image = "rbxassetid://4483362748"
                    NotePrompt.Icon.ImageRectOffset = Vector2.new(0, 0)
                    NotePrompt.Icon.ImageRectSize = Vector2.new(0, 0)
                end
            else
                NotePrompt.Icon.Image = "rbxassetid://" .. tostring(PromptSettings.Icon)
                NotePrompt.Icon.ImageRectOffset = Vector2.new(0, 0)
                NotePrompt.Icon.ImageRectSize = Vector2.new(0, 0)
            end
        else
            NotePrompt.Icon.Image = "rbxassetid://4483362748"
            NotePrompt.Icon.ImageRectOffset = Vector2.new(0, 0)
            NotePrompt.Icon.ImageRectSize = Vector2.new(0, 0)
        end

        NotePrompt.Load.MouseButton1Down:Once(function(x, y)
            CloseNPrompt()
            if PromptSettings.Callback then
                PromptSettings.Callback()
            end
        end)

        NotePrompt.Close.MouseButton1Down:Once(function()
            CloseNPrompt()
        end)

        NotePrompt.Visible = true

        TweenService:Create(NotePrompt, Infos, {BackgroundTransparency = .1}):Play()
        TweenService:Create(NotePrompt.UIStroke, Infos, {Transparency = 0}):Play()
        TweenService:Create(NotePrompt.Shadow.Image, Infos, {ImageTransparency = .2}):Play()

        wait(.3)

        TweenService:Create(NotePrompt.Close, Infos, {ImageTransparency = .8}):Play()
        TweenService:Create(NotePrompt.Icon, Infos, {ImageTransparency = 0}):Play()
        TweenService:Create(NotePrompt.Title, Infos, {TextTransparency = 0}):Play()

        wait(.1)

        TweenService:Create(NotePrompt.Description, Infos, {TextTransparency = 0}):Play()

        wait(.2)

        TweenService:Create(NotePrompt.Load, Infos, {TextTransparency = 0, BackgroundTransparency = .2}):Play()
        TweenService:Create(NotePrompt.Load.UIStroke, Infos, {Transparency = 0}):Play()
        TweenService:Create(NotePrompt.Load.Shadow, Infos, {ImageTransparency = .8}):Play()
    end

    function ArrayFieldLibrary:Destroy()
	    ArrayField:Destroy()
        if ArrayField:FindFirstChild("MobileToggleButton") then
	        ArrayField:FindFirstChild("MobileToggleButton"):Destroy()
        end
    end

    task.delay(2, function()
        ArrayFieldLibrary.LoadConfiguration()
    end)

    return Window
end
return ArrayFieldLibrary
