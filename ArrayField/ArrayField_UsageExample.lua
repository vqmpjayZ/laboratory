-- ArrayField UI Library - Complete Usage Example
-- This example demonstrates all features and best practices

local ArrayFieldLibrary = loadstring(game:HttpGet('https://raw.githubusercontent.com/vqmpjayZ/laboratory/refs/heads/main/ArrayField/ArrayField.lua'))()

-- ============================
-- WINDOW CREATION
-- ============================

local Window = ArrayFieldLibrary:CreateWindow({
    Name = "My Script Hub",                    -- Window title
    Icon = "shield",                            -- Lucide icon or asset ID
    LoadingTitle = "Loading Script Hub",       -- Text shown during load
    LoadingSubtitle = "by YourName",           -- Subtitle during load
    
    -- Optional: Set a default theme
    -- Can be: "Default", "Dark", "Light", "Ocean", "Purple", "Green", "Red", etc.
    DefaultTheme = "Default", -- removes the choice from users to re-execute with their previously selected themes
    
    -- Configuration saving
    ConfigurationSaving = { -- configuration saving is enabled from settings
        FolderName = "MyScriptHub",            -- Folder name in workspace
        FileName = "Config"                    -- Config file name
    }
})

-- ============================
-- CREATING TABS
-- ============================

-- Simple tab creation
local MainTab = Window:CreateTab("Main", "home")
local CombatTab = Window:CreateTab("Combat", "sword")
local VisualsTab = Window:CreateTab("Visuals", "eye")

-- ============================
-- CREATING CATEGORIES (Optional)
-- ============================

-- Categories help organize tabs into collapsible groups
local MainCategory = Window:CreateCategory("Main Features", {DefaultOpen = true})
local SettingsCategory = Window:CreateCategory("Settings", {DefaultOpen = false})

-- Create tabs under categories
local PlayerTab = Window:CreateTab("Player", "user", MainCategory)
local ConfigTab = Window:CreateTab("Config", "settings", SettingsCategory)

-- ============================
-- SECTIONS
-- ============================

-- Sections organize elements within a tab
local WelcomeSection = MainTab:CreateSection("Welcome")
local MovementSection = MainTab:CreateSection("Movement")

-- ============================
-- LABELS & PARAGRAPHS
-- ============================

-- Simple label
MainTab:CreateLabel({
    Text = "Welcome to my script!",
    SectionParent = WelcomeSection
})

-- Label with icon
MainTab:CreateLabel({
    Text = "Press K to toggle the UI",
    Icon = "keyboard",
    SectionParent = WelcomeSection
})

-- Colored labels
MainTab:CreateLabel({
    Text = "Warning: Use at your own risk!",
    Background = "warn",               -- Options: "warn", "success", "error"
    SectionParent = WelcomeSection
})

MainTab:CreateLabel({
    Text = "Custom color label",
    Background = "#FF69B4",           -- Hex color code
    SectionParent = WelcomeSection
})

-- Paragraph with rich text support
MainTab:CreateParagraph({
    Title = "<b>Getting Started</b>",
    Content = "This script includes <i>powerful features</i> for your game. Make sure to <b>configure</b> everything properly!",
    Icon = "info",
    Background = "success",            -- Optional background color
    SectionParent = WelcomeSection
})

-- ============================
-- BUTTONS
-- ============================

MainTab:CreateButton({
    Name = "Click Me",
    Description = "This description appears when you hover over the button",  -- Optional
    Interact = "click",                -- Button hint text (optional)
    SectionParent = MovementSection,
    Callback = function()
        print("Button clicked!")
        -- Your code here
    end
})

-- ============================
-- TOGGLES
-- ============================

local SpeedToggle = MainTab:CreateToggle({
    Name = "Speed Boost",
    Description = "Increases your movement speed",  -- Optional hover description
    CurrentValue = false,              -- Initial state
    Flag = "SpeedToggle",             -- Unique identifier for saving (optional)
    SectionParent = MovementSection,
    Callback = function(Value)
        print("Speed Boost:", Value)   -- Value is true/false
        -- Your code here
    end
})

-- Programmatically change toggle
SpeedToggle:Set(true)

-- Lock/unlock a toggle
SpeedToggle:Lock("Feature disabled")
SpeedToggle:Unlock()

-- ============================
-- SLIDERS
-- ============================

local SpeedSlider = MainTab:CreateSlider({
    Name = "Speed Multiplier",
    Description = "Adjust your speed from 1x to 10x",  -- Optional
    Range = {1, 10},                  -- Min and max values
    Increment = 0.5,                  -- Step size
    Suffix = "x",                     -- Optional suffix (e.g., "x", "%", "studs")
    CurrentValue = 1,                 -- Initial value
    Flag = "SpeedValue",              -- For saving (optional)
    SectionParent = MovementSection,
    Callback = function(Value)
        print("Speed set to:", Value)
        -- Your code here
    end
})

-- Change slider value programmatically
SpeedSlider:Set(5)

-- ============================
-- TEXT INPUTS
-- ============================

local UsernameInput = MainTab:CreateInput({
    Name = "Username",
    Description = "Enter a player's username",  -- Optional
    PlaceholderText = "Type here...",
    RemoveTextAfterFocusLost = false,  -- Keep text after losing focus
    NumbersOnly = false,               -- Only allow numbers (optional)
    CharacterLimit = 20,               -- Max characters (optional)
    OnEnter = false,                   -- Only callback on Enter key (optional)
    SectionParent = WelcomeSection,
    Callback = function(Text)
        print("Input text:", Text)
        -- Your code here
    end
})

-- Set input text programmatically
UsernameInput:Set("NewUsername")

-- ============================
-- KEYBINDS
-- ============================

local FlyKeybind = MainTab:CreateKeybind({
    Name = "Fly Key",
    Description = "Press to toggle flight",  -- Optional
    CurrentKeybind = "F",             -- Default key
    HoldToInteract = false,           -- If true, callback fires while held
    Flag = "FlyKey",                  -- For saving (optional)
    SectionParent = MovementSection,
    Callback = function(IsHeld)       -- IsHeld only matters if HoldToInteract is true
        print("Fly key pressed!")
        -- Your code here
    end
})

-- Change keybind programmatically
FlyKeybind:Set("G")

-- ============================
-- DROPDOWNS
-- ============================

-- Single selection dropdown
local WeaponDropdown = CombatTab:CreateDropdown({
    Name = "Select Weapon",
    Options = {"Sword", "Axe", "Spear", "Bow"},
    CurrentOption = "Sword",          -- Default selection
    MultiSelection = false,           -- Single choice
    Flag = "SelectedWeapon",          -- For saving (optional)
    Callback = function(Option)
        print("Selected:", Option)
        -- Your code here
    end
})

-- Multi-selection dropdown
local FeaturesDropdown = CombatTab:CreateDropdown({
    Name = "Enable Features",
    Options = {"Auto Heal", "Auto Attack", "Auto Block", "Auto Dodge"},
    CurrentOption = {"Auto Heal"},    -- Default selections (array)
    MultiSelection = true,            -- Multiple choices allowed
    Flag = "EnabledFeatures",
    Callback = function(Option)
        print("Toggled:", Option)
        -- Your code here
    end
})

-- Dropdown methods
WeaponDropdown:Set("Bow")                              -- Change selection
WeaponDropdown:Add({"Dagger", "Staff"})               -- Add new options
WeaponDropdown:Remove("Sword")                         -- Remove an option
WeaponDropdown:Refresh({"Katana", "Claymore"}, "Katana") -- Replace all options

-- ============================
-- COLOR PICKERS
-- ============================

local ESPColor = VisualsTab:CreateColorPicker({
    Name = "ESP Color",
    Color = Color3.fromRGB(255, 0, 0),  -- Default color (red)
    Flag = "ESPColor",                   -- For saving (optional)
    Callback = function(Color)
        print("Color changed:", Color)
        -- Your code here
    end
})

-- Change color programmatically
ESPColor:Set(Color3.fromRGB(0, 255, 0))  -- Green

-- ============================
-- IMAGES
-- ============================

MainTab:CreateImage(WelcomeSection, {
    Image = "https://example.com/image.png",  -- URL, asset ID, or file path
    Width = 200,                              -- Image width
    Height = 200,                             -- Image height
    Transparency = 0                          -- 0 = opaque, 1 = invisible
})

-- ============================
-- SEPARATORS
-- ============================

MainTab:CreateSeparator(MovementSection, {
    Title = "Advanced Settings",  -- Optional title in the middle
    Width = 0.9,                  -- 0 to 1 (percentage of container width)
    Padding = 10                  -- Vertical padding around separator
})

-- ============================
-- SPACING
-- ============================

-- Add vertical space between elements
MainTab:CreateSpacing(MovementSection, 15)  -- 15 pixels

-- ============================
-- NOTIFICATIONS
-- ============================

-- Simple notification
ArrayFieldLibrary:Notify({
    Title = "Success",
    Content = "Script loaded successfully!",
    Duration = 5,                    -- Seconds (optional, default 6.5)
    Image = "check-circle"           -- Lucide icon, asset ID, or image URL
})

-- Notification with actions
ArrayFieldLibrary:Notify({
    Title = "Update Available",
    Content = "A new version is ready. Update now?",
    Image = "download",
    Actions = {
        {
            Name = "Update",
            Callback = function()
                print("Updating...")
            end
        },
        {
            Name = "Later",
            Callback = function()
                print("Cancelled")
            end
        }
    }
})

-- ============================
-- PROMPTS & DIALOGS
-- ============================

-- Simple prompt
Window:NotePrompt({
    Title = "Welcome!",
    Description = "Thanks for using this script",
    Icon = "sparkles",
    Callback = function()
        print("User clicked OK")
    end
})

-- Confirmation dialog
Window:Prompt({
    Title = "Confirm Action",
    SubTitle = "Are you sure?",
    Content = "This action cannot be undone.",
    Actions = {
        Confirm = {
            Name = "Yes",
            Callback = function()
                print("Confirmed")
            end
        },
        Cancel = {
            Name = "No",
            Callback = function()
                print("Cancelled")
            end
        }
    }
})

-- ============================
-- ELEMENT METHODS (Universal)
-- ============================

-- All elements support these methods:

-- Lock an element (prevents interaction)
SpeedToggle:Lock("Premium feature")

-- Unlock an element
SpeedToggle:Unlock()

-- Show/hide an element
SpeedToggle:Visible(false)  -- Hide
SpeedToggle:Visible(true)   -- Show

-- Destroy an element
SpeedToggle:Destroy()

-- ============================
-- SAVING & LOADING
-- ============================

-- Save current configuration (automatic if ConfigurationSaving is enabled)
ArrayFieldLibrary.SaveConfiguration()

-- Load saved configuration (automatic on startup)
ArrayFieldLibrary.LoadConfiguration()

-- Access flag values
print(ArrayFieldLibrary.Flags["SpeedToggle"].CurrentValue)
print(ArrayFieldLibrary.Flags["SpeedValue"].CurrentValue)

-- ============================
-- DESTROYING THE UI
-- ============================

ArrayFieldLibrary:Destroy()  -- Completely removes the UI
