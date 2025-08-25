local Release = "Release 2D"
local NotificationDuration = 6.5
local ArrayFieldFolder = "ArrayField"
local ConfigurationFolder = ArrayFieldFolder.."/Configurations"
local ConfigurationExtension = ".rfld"
local ArrayFieldQuality = {}

local ArrayFieldLibrary = {
	Flags = {},
	Theme = {
		Default = {
			TextFont = "SourceSansBold",
			TextColor = Color3.fromRGB(240, 240, 240),

			Background = Color3.fromRGB(25, 25, 25),
			Topbar = Color3.fromRGB(34, 34, 34),
			Shadow = Color3.fromRGB(20, 20, 20),

			NotificationBackground = Color3.fromRGB(20, 20, 20),
			NotificationActionsBackground = Color3.fromRGB(230, 230, 230),

			TabBackground = Color3.fromRGB(80, 80, 80),
			TabStroke = Color3.fromRGB(85, 85, 85),
			TabBackgroundSelected = Color3.fromRGB(210, 210, 210),
			TabTextColor = Color3.fromRGB(240, 240, 240),
			SelectedTabTextColor = Color3.fromRGB(50, 50, 50),

			ElementBackground = Color3.fromRGB(35, 35, 35),
			ElementBackgroundHover = Color3.fromRGB(40, 40, 40),
			SecondaryElementBackground = Color3.fromRGB(25, 25, 25),
			ElementStroke = Color3.fromRGB(50, 50, 50),
			SecondaryElementStroke = Color3.fromRGB(40, 40, 40),

			SectionTitleBackground = Color3.fromRGB(25, 25, 25),
			SidebarBackground = Color3.fromRGB(50, 50, 50),

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
			InputStroke = Color3.fromRGB(65, 65, 65),
			PlaceholderColor = Color3.fromRGB(178, 178, 178)
		},
		Light = {
			TextFont = "GothamBold",
			TextColor = Color3.fromRGB(20, 20, 20),

			Background = Color3.fromRGB(255, 255, 255),
			Topbar = Color3.fromRGB(217, 217, 217),
			Shadow = Color3.fromRGB(223, 223, 223),

			NotificationBackground = Color3.fromRGB(20, 20, 20),
			NotificationActionsBackground = Color3.fromRGB(230, 230, 230),

			TabBackground = Color3.fromRGB(220, 220, 220),
			TabStroke = Color3.fromRGB(112, 112, 112),
			TabBackgroundSelected = Color3.fromRGB(0, 142, 208),
			TabTextColor = Color3.fromRGB(30, 30, 30),
			SelectedTabTextColor = Color3.fromRGB(255, 255, 255),

			ElementBackground = Color3.fromRGB(198, 198, 198),
			ElementBackgroundHover = Color3.fromRGB(230, 230, 230),
			SecondaryElementBackground = Color3.fromRGB(136, 136, 136),
			ElementStroke = Color3.fromRGB(180, 199, 97),
			SecondaryElementStroke = Color3.fromRGB(40, 40, 40),

			SectionTitleBackground = Color3.fromRGB(255, 255, 255),
			SidebarBackground = Color3.fromRGB(200, 200, 200),

			SliderBackground = Color3.fromRGB(31, 159, 71),
			SliderProgress = Color3.fromRGB(31, 159, 71),
			SliderStroke = Color3.fromRGB(42, 216, 94),

			ToggleBackground = Color3.fromRGB(170, 203, 60),
			ToggleEnabled = Color3.fromRGB(32, 214, 29),
			ToggleDisabled = Color3.fromRGB(100, 22, 23),
			ToggleEnabledStroke = Color3.fromRGB(17, 255, 0),
			ToggleDisabledStroke = Color3.fromRGB(65, 8, 8),
			ToggleEnabledOuterStroke = Color3.fromRGB(0, 170, 0),
			ToggleDisabledOuterStroke = Color3.fromRGB(170, 0, 0),

			InputBackground = Color3.fromRGB(31, 159, 71),
			InputStroke = Color3.fromRGB(19, 65, 31),
			PlaceholderColor = Color3.fromRGB(100, 100, 100)
		},
		Ocean = {
			TextFont = "GothamBold",
			TextColor = Color3.fromRGB(230, 250, 255),

			Background = Color3.fromRGB(15, 25, 35),
			Topbar = Color3.fromRGB(20, 35, 50),
			Shadow = Color3.fromRGB(10, 20, 30),

			NotificationBackground = Color3.fromRGB(15, 25, 35),
			NotificationActionsBackground = Color3.fromRGB(100, 150, 200),

			TabBackground = Color3.fromRGB(30, 50, 70),
			TabStroke = Color3.fromRGB(50, 80, 110),
			TabBackgroundSelected = Color3.fromRGB(40, 120, 180),
			TabTextColor = Color3.fromRGB(230, 250, 255),
			SelectedTabTextColor = Color3.fromRGB(255, 255, 255),

			ElementBackground = Color3.fromRGB(25, 40, 55),
			ElementBackgroundHover = Color3.fromRGB(30, 50, 70),
			SecondaryElementBackground = Color3.fromRGB(20, 35, 50),
			ElementStroke = Color3.fromRGB(40, 70, 100),
			SecondaryElementStroke = Color3.fromRGB(35, 60, 85),

			SectionTitleBackground = Color3.fromRGB(15, 25, 35),
			SidebarBackground = Color3.fromRGB(35, 55, 75),

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
			PlaceholderColor = Color3.fromRGB(150, 180, 210)
		},
		Purple = {
			TextFont = "GothamBold",
			TextColor = Color3.fromRGB(240, 220, 255),

			Background = Color3.fromRGB(20, 15, 35),
			Topbar = Color3.fromRGB(35, 25, 55),
			Shadow = Color3.fromRGB(15, 10, 30),

			NotificationBackground = Color3.fromRGB(20, 15, 35),
			NotificationActionsBackground = Color3.fromRGB(150, 100, 200),

			TabBackground = Color3.fromRGB(50, 30, 80),
			TabStroke = Color3.fromRGB(80, 50, 120),
			TabBackgroundSelected = Color3.fromRGB(120, 80, 180),
			TabTextColor = Color3.fromRGB(240, 220, 255),
			SelectedTabTextColor = Color3.fromRGB(255, 255, 255),

			ElementBackground = Color3.fromRGB(40, 25, 65),
			ElementBackgroundHover = Color3.fromRGB(50, 35, 80),
			SecondaryElementBackground = Color3.fromRGB(35, 20, 60),
			ElementStroke = Color3.fromRGB(70, 40, 110),
			SecondaryElementStroke = Color3.fromRGB(60, 35, 95),

			SectionTitleBackground = Color3.fromRGB(20, 15, 35),
			SidebarBackground = Color3.fromRGB(55, 35, 85),

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
			PlaceholderColor = Color3.fromRGB(180, 150, 210)
		},
		Green = {
			TextFont = "GothamBold",
			TextColor = Color3.fromRGB(230, 255, 230),

			Background = Color3.fromRGB(15, 25, 15),
			Topbar = Color3.fromRGB(25, 40, 25),
			Shadow = Color3.fromRGB(10, 20, 10),

			NotificationBackground = Color3.fromRGB(15, 25, 15),
			NotificationActionsBackground = Color3.fromRGB(100, 200, 100),

			TabBackground = Color3.fromRGB(40, 60, 40),
			TabStroke = Color3.fromRGB(60, 90, 60),
			TabBackgroundSelected = Color3.fromRGB(80, 160, 80),
			TabTextColor = Color3.fromRGB(230, 255, 230),
			SelectedTabTextColor = Color3.fromRGB(255, 255, 255),

			ElementBackground = Color3.fromRGB(30, 45, 30),
			ElementBackgroundHover = Color3.fromRGB(40, 60, 40),
			SecondaryElementBackground = Color3.fromRGB(25, 40, 25),
			ElementStroke = Color3.fromRGB(50, 80, 50),
			SecondaryElementStroke = Color3.fromRGB(45, 70, 45),

			SectionTitleBackground = Color3.fromRGB(15, 25, 15),
			SidebarBackground = Color3.fromRGB(45, 70, 45),

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
			PlaceholderColor = Color3.fromRGB(150, 200, 150)
		},
		Red = {
			TextFont = "GothamBold",
			TextColor = Color3.fromRGB(255, 230, 230),

			Background = Color3.fromRGB(25, 15, 15),
			Topbar = Color3.fromRGB(40, 25, 25),
			Shadow = Color3.fromRGB(20, 10, 10),

			NotificationBackground = Color3.fromRGB(25, 15, 15),
			NotificationActionsBackground = Color3.fromRGB(200, 100, 100),

			TabBackground = Color3.fromRGB(60, 40, 40),
			TabStroke = Color3.fromRGB(90, 60, 60),
			TabBackgroundSelected = Color3.fromRGB(160, 80, 80),
			TabTextColor = Color3.fromRGB(255, 230, 230),
			SelectedTabTextColor = Color3.fromRGB(255, 255, 255),

			ElementBackground = Color3.fromRGB(45, 30, 30),
			ElementBackgroundHover = Color3.fromRGB(60, 40, 40),
			SecondaryElementBackground = Color3.fromRGB(40, 25, 25),
			ElementStroke = Color3.fromRGB(80, 50, 50),
			SecondaryElementStroke = Color3.fromRGB(70, 45, 45),

			SectionTitleBackground = Color3.fromRGB(25, 15, 15),
			SidebarBackground = Color3.fromRGB(70, 45, 45),

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
			PlaceholderColor = Color3.fromRGB(200, 150, 150)
		},
		Synapse = {
			TextFont = "GothamBold",
			TextColor = Color3.fromRGB(220, 220, 220),

			Background = Color3.fromRGB(26, 26, 30),
			Topbar = Color3.fromRGB(30, 30, 35),
			Shadow = Color3.fromRGB(20, 20, 25),

			NotificationBackground = Color3.fromRGB(28, 28, 32),
			NotificationActionsBackground = Color3.fromRGB(0, 170, 255),

			TabBackground = Color3.fromRGB(35, 35, 40),
			TabStroke = Color3.fromRGB(45, 45, 50),
			TabBackgroundSelected = Color3.fromRGB(0, 170, 255),
			TabTextColor = Color3.fromRGB(220, 220, 220),
			SelectedTabTextColor = Color3.fromRGB(255, 255, 255),

			ElementBackground = Color3.fromRGB(32, 32, 36),
			ElementBackgroundHover = Color3.fromRGB(38, 38, 44),
			SecondaryElementBackground = Color3.fromRGB(26, 26, 30),
			ElementStroke = Color3.fromRGB(50, 50, 55),
			SecondaryElementStroke = Color3.fromRGB(40, 40, 45),

			SectionTitleBackground = Color3.fromRGB(26, 26, 30),
			SidebarBackground = Color3.fromRGB(40, 40, 45),

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
			InputStroke = Color3.fromRGB(60, 60, 70),
			PlaceholderColor = Color3.fromRGB(150, 150, 160)
		},
		AmberGlow = {
			TextFont = "GothamBold",
			TextColor = Color3.fromRGB(255, 250, 240),

			Background = Color3.fromRGB(45, 30, 20),
			Topbar = Color3.fromRGB(55, 40, 25),
			Shadow = Color3.fromRGB(35, 25, 15),

			NotificationBackground = Color3.fromRGB(50, 35, 25),
			NotificationActionsBackground = Color3.fromRGB(245, 230, 215),

			TabBackground = Color3.fromRGB(75, 50, 35),
			TabStroke = Color3.fromRGB(90, 60, 45),
			TabBackgroundSelected = Color3.fromRGB(230, 180, 100),
			TabTextColor = Color3.fromRGB(255, 250, 240),
			SelectedTabTextColor = Color3.fromRGB(50, 30, 10),

			ElementBackground = Color3.fromRGB(60, 45, 35),
			ElementBackgroundHover = Color3.fromRGB(70, 50, 40),
			SecondaryElementBackground = Color3.fromRGB(55, 40, 30),
			ElementStroke = Color3.fromRGB(85, 60, 45),
			SecondaryElementStroke = Color3.fromRGB(75, 50, 35),

			SectionTitleBackground = Color3.fromRGB(45, 30, 20),
			SidebarBackground = Color3.fromRGB(75, 50, 35),

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
			InputStroke = Color3.fromRGB(90, 65, 50),
			PlaceholderColor = Color3.fromRGB(190, 150, 130)
		},
		Amethyst = {
			TextFont = "GothamBold",
			TextColor = Color3.fromRGB(250, 250, 255),

			Background = Color3.fromRGB(30, 20, 40),
			Topbar = Color3.fromRGB(40, 25, 50),
			Shadow = Color3.fromRGB(20, 15, 30),

			NotificationBackground = Color3.fromRGB(35, 20, 40),
			NotificationActionsBackground = Color3.fromRGB(240, 240, 250),

			TabBackground = Color3.fromRGB(60, 40, 80),
			TabStroke = Color3.fromRGB(70, 45, 90),
			TabBackgroundSelected = Color3.fromRGB(180, 140, 200),
			TabTextColor = Color3.fromRGB(250, 250, 255),
			SelectedTabTextColor = Color3.fromRGB(255, 255, 255),

			ElementBackground = Color3.fromRGB(45, 30, 60),
			ElementBackgroundHover = Color3.fromRGB(50, 35, 70),
			SecondaryElementBackground = Color3.fromRGB(40, 30, 55),
			ElementStroke = Color3.fromRGB(70, 50, 85),
			SecondaryElementStroke = Color3.fromRGB(65, 45, 80),

			SectionTitleBackground = Color3.fromRGB(30, 20, 40),
			SidebarBackground = Color3.fromRGB(60, 40, 80),

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
			InputStroke = Color3.fromRGB(80, 50, 110),
			PlaceholderColor = Color3.fromRGB(178, 150, 200)
		},
		Bloom = {
			TextFont = "GothamBold",
			TextColor = Color3.fromRGB(40, 20, 30),

			Background = Color3.fromRGB(255, 240, 245),
			Topbar = Color3.fromRGB(250, 220, 225),
			Shadow = Color3.fromRGB(230, 190, 195),

			NotificationBackground = Color3.fromRGB(255, 235, 240),
			NotificationActionsBackground = Color3.fromRGB(245, 215, 225),

			TabBackground = Color3.fromRGB(240, 210, 220),
			TabStroke = Color3.fromRGB(230, 200, 210),
			TabBackgroundSelected = Color3.fromRGB(255, 140, 170),
			TabTextColor = Color3.fromRGB(40, 20, 30),
			SelectedTabTextColor = Color3.fromRGB(255, 255, 255),

			ElementBackground = Color3.fromRGB(255, 235, 240),
			ElementBackgroundHover = Color3.fromRGB(245, 220, 230),
			SecondaryElementBackground = Color3.fromRGB(255, 235, 240),
			ElementStroke = Color3.fromRGB(230, 200, 210),
			SecondaryElementStroke = Color3.fromRGB(230, 200, 210),

			SectionTitleBackground = Color3.fromRGB(255, 240, 245),
			SidebarBackground = Color3.fromRGB(240, 210, 220),

			SliderBackground = Color3.fromRGB(240, 130, 160),
			SliderProgress = Color3.fromRGB(250, 160, 180),
			SliderStroke = Color3.fromRGB(255, 180, 200),

			ToggleBackground = Color3.fromRGB(240, 210, 220),
			ToggleEnabled = Color3.fromRGB(255, 140, 170),
			ToggleDisabled = Color3.fromRGB(200, 180, 185),
			ToggleEnabledStroke = Color3.fromRGB(250, 160, 190),
			ToggleDisabledStroke = Color3.fromRGB(210, 180, 190),
			ToggleEnabledOuterStroke = Color3.fromRGB(220, 160, 180),
			ToggleDisabledOuterStroke = Color3.fromRGB(190, 170, 180),

			InputBackground = Color3.fromRGB(255, 235, 240),
			InputStroke = Color3.fromRGB(220, 190, 200),
			PlaceholderColor = Color3.fromRGB(150, 100, 120)
		},
		DarkBlue = {
			TextFont = "GothamBold",
			TextColor = Color3.fromRGB(240, 240, 250),

			Background = Color3.fromRGB(20, 25, 30),
			Topbar = Color3.fromRGB(30, 35, 40),
			Shadow = Color3.fromRGB(15, 20, 25),

			NotificationBackground = Color3.fromRGB(25, 30, 35),
			NotificationActionsBackground = Color3.fromRGB(45, 50, 55),

			TabBackground = Color3.fromRGB(35, 40, 45),
			TabStroke = Color3.fromRGB(45, 50, 60),
			TabBackgroundSelected = Color3.fromRGB(40, 70, 100),
			TabTextColor = Color3.fromRGB(240, 240, 250),
			SelectedTabTextColor = Color3.fromRGB(255, 255, 255),

			ElementBackground = Color3.fromRGB(30, 35, 40),
			ElementBackgroundHover = Color3.fromRGB(40, 45, 50),
			SecondaryElementBackground = Color3.fromRGB(35, 40, 45),
			ElementStroke = Color3.fromRGB(45, 50, 60),
			SecondaryElementStroke = Color3.fromRGB(40, 45, 55),

			SectionTitleBackground = Color3.fromRGB(20, 25, 30),
			SidebarBackground = Color3.fromRGB(35, 40, 45),

			SliderBackground = Color3.fromRGB(0, 90, 180),
			SliderProgress = Color3.fromRGB(0, 120, 210),
			SliderStroke = Color3.fromRGB(0, 150, 240),

			ToggleBackground = Color3.fromRGB(35, 40, 45),
			ToggleEnabled = Color3.fromRGB(0, 120, 210),
			ToggleDisabled = Color3.fromRGB(70, 70, 80),
			ToggleEnabledStroke = Color3.fromRGB(0, 150, 240),
			ToggleDisabledStroke = Color3.fromRGB(75, 75, 85),
			ToggleEnabledOuterStroke = Color3.fromRGB(20, 100, 180),
			ToggleDisabledOuterStroke = Color3.fromRGB(55, 55, 65),

			InputBackground = Color3.fromRGB(25, 30, 35),
			InputStroke = Color3.fromRGB(45, 50, 60),
			PlaceholderColor = Color3.fromRGB(150, 150, 160)
		},
		Serenity = {
			TextFont = "GothamBold",
			TextColor = Color3.fromRGB(30, 35, 45),

			Background = Color3.fromRGB(240, 245, 250),
			Topbar = Color3.fromRGB(215, 225, 235),
			Shadow = Color3.fromRGB(200, 210, 220),

			NotificationBackground = Color3.fromRGB(210, 220, 230),
			NotificationActionsBackground = Color3.fromRGB(225, 230, 240),

			TabBackground = Color3.fromRGB(200, 210, 220),
			TabStroke = Color3.fromRGB(180, 190, 200),
			TabBackgroundSelected = Color3.fromRGB(70, 130, 180),
			TabTextColor = Color3.fromRGB(30, 35, 45),
			SelectedTabTextColor = Color3.fromRGB(255, 255, 255),

			ElementBackground = Color3.fromRGB(210, 220, 230),
			ElementBackgroundHover = Color3.fromRGB(220, 230, 240),
			SecondaryElementBackground = Color3.fromRGB(200, 210, 220),
			ElementStroke = Color3.fromRGB(190, 200, 210),
			SecondaryElementStroke = Color3.fromRGB(180, 190, 200),

			SectionTitleBackground = Color3.fromRGB(240, 245, 250),
			SidebarBackground = Color3.fromRGB(200, 210, 220),

			SliderBackground = Color3.fromRGB(200, 220, 235),
			SliderProgress = Color3.fromRGB(70, 130, 180),
			SliderStroke = Color3.fromRGB(150, 180, 220),

			ToggleBackground = Color3.fromRGB(210, 220, 230),
			ToggleEnabled = Color3.fromRGB(70, 160, 210),
			ToggleDisabled = Color3.fromRGB(180, 180, 180),
			ToggleEnabledStroke = Color3.fromRGB(60, 150, 200),
			ToggleDisabledStroke = Color3.fromRGB(140, 140, 140),
			ToggleEnabledOuterStroke = Color3.fromRGB(100, 120, 140),
			ToggleDisabledOuterStroke = Color3.fromRGB(120, 120, 130),

			InputBackground = Color3.fromRGB(220, 230, 240),
			InputStroke = Color3.fromRGB(180, 190, 200),
			PlaceholderColor = Color3.fromRGB(120, 120, 120)
		}
	}
}

local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local LocalPlayer = game:GetService('Players').LocalPlayer

local ArrayField = game:GetObjects("rbxassetid://104864835246885")[1]
ArrayField.Enabled = false
local spawn = task.spawn
local delay = task.delay

if game["Run Service"]:IsStudio() then
	function gethui() return ArrayField end local http_request = nil local syn = {protect_gui = false,request = false,}local http = nil function writefile(tt,t,ttt)end function isfolder(t)end function makefolder(t)end function isfile(r)end function readfile(t)end
end

pcall(function()
	_G.LastRayField.Name = 'Old Arrayfield'
	_G.LastRayField.Enabled = false
end)

if _G.LastRayField and _G.LastRayField:FindFirstChild("MobileToggleButton") then
    _G.LastRayField.MobileToggleButton:Destroy()
end
local ParentObject = function(Gui)
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
	_G.LastRayField = ArrayField
end
ParentObject(ArrayField)

local Camera = workspace.CurrentCamera
local Main = ArrayField.Main
local Topbar = Main.Topbar
local Elements = Main.Elements
local LoadingFrame = Main.LoadingFrame
local TopList = Main.TabList
local SideList = Main.SideTabList.Holder
local TabsList = TopList and SideList
local SearchBar = Main.Searchbar
local Filler = SearchBar.CanvasGroup.Filler
local Prompt = Main.Prompt
local NotePrompt = Main.NotePrompt
local InfoPrompt = ArrayField.Info

ArrayField.DisplayOrder = 100
LoadingFrame.Version.Text = Release

local request = (syn and syn.request) or (http and http.request) or http_request
local CFileName = nil
local CEnabled = false
local Minimised = false
local Hidden = false
local Debounce = false
local clicked = false
local SearchHided = true
local SideBarClosed = false
local InfoPromptOpen = false
local BarType = 'Side'
local HoverTime = 0.3
local Notifications = ArrayField.Notifications

local SelectedTheme = ArrayFieldLibrary.Theme.Default

local Icons = useStudio and require(script.Parent.icons) or loadstring(game:HttpGet('https://raw.githubusercontent.com/SiriusSoftwareLtd/Rayfield/refs/heads/main/icons.lua'))()

function ChangeTheme(ThemeName)
	SelectedTheme = ArrayField.Theme[ThemeName]
	for _, obj in ipairs(ArrayField:GetDescendants()) do
		if obj.ClassName == "TextLabel" or obj.ClassName == "TextBox" or obj.ClassName == "TextButton" then
			if SelectedTheme.TextFont ~= "Default" then 
				obj.TextColor3 = SelectedTheme.TextColor
				obj.Font = SelectedTheme.TextFont
			end
		end
	end

	ArrayField.Main.BackgroundColor3 = SelectedTheme.Background
	ArrayField.Main.Topbar.BackgroundColor3 = SelectedTheme.Topbar
	ArrayField.Main.Topbar.CornerRepair.BackgroundColor3 = SelectedTheme.Topbar
	ArrayField.Main.Shadow.Image.ImageColor3 = SelectedTheme.Shadow

	ArrayField.Main.Topbar.ChangeSize.ImageColor3 = SelectedTheme.TextColor
	ArrayField.Main.Topbar.Hide.ImageColor3 = SelectedTheme.TextColor
	ArrayField.Main.Topbar.Theme.ImageColor3 = SelectedTheme.TextColor

	for _, TabPage in ipairs(Elements:GetChildren()) do
		for _, Element in ipairs(TabPage:GetChildren()) do
			if Element.ClassName == "Frame" and Element.Name ~= "Placeholder" and Element.Name ~= "SectionSpacing" and Element.Name ~= ""  then
				Element.BackgroundColor3 = SelectedTheme.ElementBackground
				Element.UIStroke.Color = SelectedTheme.ElementStroke
			end
		end
	end
end

local function AddDraggingFunctionality(DragPoint, Main)
    pcall(function()
        local Dragging = false
        local StartPos

        DragPoint.InputBegan:Connect(function(Input)
            if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
                Dragging = true
                StartPos = Input.Position
                FramePos = Main.Position

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
                
                TweenService:Create(Main, TweenInfo.new(0.45, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                    Position = UDim2.new(
                        FramePos.X.Scale,
                        FramePos.X.Offset + Delta.X,
                        FramePos.Y.Scale,
                        FramePos.Y.Offset + Delta.Y
                    )
                }):Play()

                if InfoPrompt then
                    TweenService:Create(InfoPrompt, TweenInfo.new(0.6, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                        Position = UDim2.new(
                            FramePos.X.Scale,
                            FramePos.X.Offset + Delta.X + 370,
                            FramePos.Y.Scale,
                            FramePos.Y.Offset + Delta.Y
                        )
                    }):Play()
                end
            end
        end)
    end)
end

local function getIcon(name : string)
	name = string.match(string.lower(name), "^%s*(.*)%s*$") :: string
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

function BoolToText(Bool)
	if Bool == true then
		return 'ENABLED',Color3.fromRGB(44, 186, 44)
	else
		return 'DISABLED',Color3.fromRGB(186, 44, 44)
	end
end

local function PackColor(Color)
	return {R = Color.R * 255, G = Color.G * 255, B = Color.B * 255}
end    

local function UnpackColor(Color)
	return Color3.fromRGB(Color.R, Color.G, Color.B)
end

local function LoadConfiguration(Configuration)
	local Data = HttpService:JSONDecode(Configuration)
	for FlagName, FlagValue in next, Data do
		if ArrayFieldLibrary.Flags[FlagName] then
			spawn(function() 
				if ArrayFieldLibrary.Flags[FlagName].Type == "ColorPicker" then
					ArrayFieldLibrary.Flags[FlagName]:Set(UnpackColor(FlagValue))
				else
					if ArrayFieldLibrary.Flags[FlagName].CurrentValue or ArrayFieldLibrary.Flags[FlagName].CurrentKeybind or ArrayFieldLibrary.Flags[FlagName].CurrentOption or ArrayFieldLibrary.Flags[FlagName].Color ~= FlagValue then ArrayFieldLibrary.Flags[FlagName]:Set(FlagValue) end
				end    
			end)
		else
			ArrayFieldLibrary:Notify({Title = "Flag Error", Content = "ArrayField was unable to find '"..FlagName.. "'' in the current script"})
		end
	end
end

local function SaveConfiguration()
	if not CEnabled then return end
	local Data = {}
	for i,v in pairs(ArrayFieldLibrary.Flags) do
		if v.Type == "ColorPicker" then
			Data[i] = PackColor(v.Color)
		else
			Data[i] = v.CurrentValue or v.CurrentKeybind or v.Color or v.CurrentOption
		end
	end	
	writefile(ConfigurationFolder .. "/" .. CFileName .. ConfigurationExtension, tostring(HttpService:JSONEncode(Data)))
end

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

function CloseNPrompt()
	local Infos= TweenInfo.new(.2,Enum.EasingStyle.Quad,Enum.EasingDirection.Out)
	TweenService:Create(NotePrompt,Infos,{BackgroundTransparency = 1,Size = UDim2.fromOffset(436,92),Position = UDim2.fromScale(0.5,0.19)}):Play()
	TweenService:Create(NotePrompt.UIStroke,Infos,{Transparency = 1}):Play()
	TweenService:Create(NotePrompt.Shadow.Image,Infos,{ImageTransparency = 1}):Play()

	TweenService:Create(NotePrompt.Close,Infos,{ImageTransparency = .1}):Play()
	TweenService:Create(NotePrompt.Icon,Infos,{ImageTransparency = 1}):Play()
	TweenService:Create(NotePrompt.Title,Infos,{TextTransparency = 1}):Play()

	TweenService:Create(NotePrompt.Description,Infos,{TextTransparency = 1}):Play()
	TweenService:Create(NotePrompt.Load,Infos,{TextTransparency = 1,BackgroundTransparency = 1}):Play()
	TweenService:Create(NotePrompt.Load.UIStroke,Infos,{Transparency = 1}):Play()
	TweenService:Create(NotePrompt.Load.Shadow,Infos,{ImageTransparency = 1}):Play()
	wait(0.21)
	NotePrompt.Visible = false
end

function qNotePrompt(PromptSettings)
	local Infos= TweenInfo.new(.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out)
	NotePrompt.Visible = false
	
	NotePrompt.Size = UDim2.fromOffset(436,92)
	NotePrompt.Position = UDim2.fromScale(0.5,0.19)
	NotePrompt.BackgroundTransparency = 1
	NotePrompt.UIStroke.Transparency = 1

	NotePrompt.Icon.ImageTransparency = 1
	NotePrompt.Close.ImageTransparency = 1

	NotePrompt.Shadow.Image.ImageTransparency = 1

	NotePrompt.Title.TextTransparency = 1
	NotePrompt.Description.TextTransparency = 1

	NotePrompt.Load.BackgroundTransparency = 1
	NotePrompt.Load.UIStroke.Transparency = 1
	NotePrompt.Load.TextTransparency = 1
	NotePrompt.Load.Shadow.ImageTransparency = 1
	
	NotePrompt.Title.Text = PromptSettings.Title or ''
	NotePrompt.Description.Text = PromptSettings.Description or ''
	NotePrompt.Icon.Image = PromptSettings.Icon or 'rbxassetid://4483362748'
	NotePrompt.Load.BackgroundColor3 = PromptSettings.Color or Color3.fromRGB(90, 90, 90)
	NotePrompt.Load.MouseButton1Down:Once(function(x,y)
		CloseNPrompt()
		if PromptSettings.Callback then
			PromptSettings.Callback()
		end
	end)

	NotePrompt.Close.MouseButton1Down:Once(function()
		CloseNPrompt()
	end)
	NotePrompt.Visible = true
	
	TweenService:Create(NotePrompt,Infos,{BackgroundTransparency = .1,Size = UDim2.fromOffset(474,100),Position = UDim2.fromScale(0.5,0.21)}):Play()
	TweenService:Create(NotePrompt.UIStroke,Infos,{Transparency = 0}):Play()
	TweenService:Create(NotePrompt.Shadow.Image,Infos,{ImageTransparency = .2}):Play()
	wait(.3)
	TweenService:Create(NotePrompt.Close,Infos,{ImageTransparency = .8}):Play()
	TweenService:Create(NotePrompt.Icon,Infos,{ImageTransparency = 0}):Play()
	TweenService:Create(NotePrompt.Title,Infos,{TextTransparency = 0}):Play()
	wait(.1)
	TweenService:Create(NotePrompt.Description,Infos,{TextTransparency = 0}):Play()
	wait(.2)
	TweenService:Create(NotePrompt.Load,Infos,{TextTransparency = 0,BackgroundTransparency = .2}):Play()
	TweenService:Create(NotePrompt.Load.UIStroke,Infos,{Transparency = 0}):Play()
	TweenService:Create(NotePrompt.Load.Shadow,Infos,{ImageTransparency = .8}):Play()
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
            game:GetService("Debris"):AddItem(script, 0)
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
            Notification.Title.Font = SelectedTheme.TextFont
        end
        if Notification:FindFirstChild("Description") then
            Notification.Description.Text = NotificationSettings.Content or "Unknown"
            Notification.Description.TextTransparency = 1
            Notification.Description.TextColor3 = SelectedTheme.TextColor
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

        Notification.Parent = Notifications
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

        if false == nil then
            TweenService:Create(Notification, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 0.4}):Play()
        else
            if not false then
                TweenService:Create(Notification, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 0.4}):Play()
            else
                TweenService:Create(Notification, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
            end
        end

        if ArrayField.Name == "ArrayField" and Notification:FindFirstChild("BlurModule") then
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
                if Notification:FindFirstChild("BlurModule") then
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

function CloseSideBar()
	Debounce = true
	SideBarClosed = true
	for _,tabbtn in pairs(SideList:GetChildren()) do
		if tabbtn.ClassName == "Frame" and tabbtn.Name ~= "Placeholder" then
			TweenService:Create(tabbtn.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint),{TextTransparency = 1}):Play()
			TweenService:Create(tabbtn.Image, TweenInfo.new(0.3, Enum.EasingStyle.Quint),{ImageTransparency = 1}):Play()
		end
	end
	if Main and Main:FindFirstChild("SideTabList") then
		TweenService:Create(Main.SideTabList, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {BackgroundTransparency = 1,Size = UDim2.new(0,160,0,285),Position = UDim2.new(0,14,0.5,22)}):Play()
		if Main.SideTabList:FindFirstChild("UIStroke") then
			TweenService:Create(Main.SideTabList.UIStroke, TweenInfo.new(0.4, Enum.EasingStyle.Quint),{Transparency = 1}):Play()
		end
		if Main.SideTabList:FindFirstChild("RDMT") then
			TweenService:Create(Main.SideTabList.RDMT, TweenInfo.new(0.4, Enum.EasingStyle.Quint),{TextTransparency = 1}):Play()
		end
	end
	wait(.4)
	if Main and Main:FindFirstChild("SideTabList") then
		Main.SideTabList.Visible = false
	end
	wait(0.2)
	Debounce = false
end

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

local ButtonFrame
local IconLabel
local ScreenGui
local BlurFrame
local isDragging = false
local dragStart = nil
local startPos = nil
local isVisible = false
local isAnimating = false
local savedPosition = UDim2.new(1, -67, 0.5, -22)
local savedBlurPosition = UDim2.new(1, -70, 0.5, -25)

local MobileToggle = {}

local function createMobileButton()
	local existingMobileButton = ArrayField:FindFirstChild("MobileToggleButton")
	if existingMobileButton then
		existingMobileButton:Destroy()
	end
    ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "MobileToggleButton"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.Parent = ArrayField
    
    BlurFrame = Instance.new("Frame")
    BlurFrame.Name = "BlurShadow"
    BlurFrame.Size = UDim2.new(0, 50, 0, 50)
    BlurFrame.Position = savedBlurPosition
    BlurFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    BlurFrame.BackgroundTransparency = 0.3
    BlurFrame.BorderSizePixel = 0
    BlurFrame.Visible = false
    BlurFrame.Parent = ScreenGui
    
    local BlurCorner = Instance.new("UICorner")
    BlurCorner.CornerRadius = UDim.new(0, 10)
    BlurCorner.Parent = BlurFrame
    
    ButtonFrame = Instance.new("Frame")
    ButtonFrame.Name = "ToggleButton"
    ButtonFrame.Size = UDim2.new(0, 45, 0, 45)
    ButtonFrame.Position = savedPosition
    ButtonFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
    ButtonFrame.BorderSizePixel = 0
    ButtonFrame.Visible = false
    ButtonFrame.Parent = ScreenGui
    
    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 8)
    Corner.Parent = ButtonFrame
    
    local GradientFrame = Instance.new("Frame")
    GradientFrame.Name = "Gradient"
    GradientFrame.Size = UDim2.new(1, 0, 1, 0)
    GradientFrame.Position = UDim2.new(0, 0, 0, 0)
    GradientFrame.BackgroundTransparency = 0.3
    GradientFrame.Parent = ButtonFrame
    
    local GradientCorner = Instance.new("UICorner")
    GradientCorner.CornerRadius = UDim.new(0, 8)
    GradientCorner.Parent = GradientFrame
    
    local Gradient = Instance.new("UIGradient")
    Gradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(45, 45, 60)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(15, 15, 20))
    }
    Gradient.Rotation = 135
    Gradient.Parent = GradientFrame
    
    local OuterStroke = Instance.new("UIStroke")
    OuterStroke.Color = Color3.fromRGB(60, 60, 80)
    OuterStroke.Thickness = 1.5
    OuterStroke.Parent = ButtonFrame
    
    local InnerStroke = Instance.new("UIStroke")
    InnerStroke.Color = Color3.fromRGB(35, 35, 45)
    InnerStroke.Thickness = 1
    InnerStroke.Parent = GradientFrame
    
    IconLabel = Instance.new("ImageLabel")
    IconLabel.Name = "Icon"
    IconLabel.Size = UDim2.new(0, 18, 0, 18)
    IconLabel.Position = UDim2.new(0.5, -9, 0.5, -9)
    IconLabel.BackgroundTransparency = 1
    IconLabel.Image = "rbxassetid://16898669897"
    IconLabel.ImageRectSize = Vector2.new(256, 256)
    IconLabel.ImageRectOffset = Vector2.new(0, 0)
    IconLabel.ImageColor3 = Color3.fromRGB(180, 180, 200)
    IconLabel.Parent = ButtonFrame
    
    local ClickDetector = Instance.new("TextButton")
    ClickDetector.Name = "ClickDetector"
    ClickDetector.Size = UDim2.new(1, 0, 1, 0)
    ClickDetector.Position = UDim2.new(0, 0, 0, 0)
    ClickDetector.BackgroundTransparency = 1
    ClickDetector.Text = ""
    ClickDetector.Parent = ButtonFrame
    
    return ClickDetector
end

local function animateClick()
    if isAnimating then return end
    isAnimating = true
    
    local clickTween = TweenService:Create(
        ButtonFrame,
        TweenInfo.new(0.08, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
        {Size = UDim2.new(0, 40, 0, 40)}
    )
    
    local releaseTween = TweenService:Create(
        ButtonFrame,
        TweenInfo.new(0.12, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
        {Size = UDim2.new(0, 45, 0, 45)}
    )
    
    clickTween:Play()
    clickTween.Completed:Connect(function()
        releaseTween:Play()
        releaseTween.Completed:Connect(function()
            isAnimating = false
        end)
    end)
end

local function animateHover(hovering)
    local targetColor = hovering and Color3.fromRGB(25, 25, 35) or Color3.fromRGB(20, 20, 25)
    local targetStroke = hovering and Color3.fromRGB(80, 80, 100) or Color3.fromRGB(60, 60, 80)
    
    TweenService:Create(
        ButtonFrame,
        TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {BackgroundColor3 = targetColor}
    ):Play()
    
    TweenService:Create(
        ButtonFrame.UIStroke,
        TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {Color = targetStroke}
    ):Play()
end

local function savePosition()
    savedPosition = ButtonFrame.Position
    savedBlurPosition = UDim2.new(
        ButtonFrame.Position.X.Scale,
        ButtonFrame.Position.X.Offset - 3,
        ButtonFrame.Position.Y.Scale,
        ButtonFrame.Position.Y.Offset - 3
    )
end

function MobileToggle:Show()
    if isVisible or not ButtonFrame or not BlurFrame then return end
    isVisible = true
    
    local offScreenPos = UDim2.new(savedPosition.X.Scale, savedPosition.X.Offset + 100, savedPosition.Y.Scale, savedPosition.Y.Offset)
    local offScreenBlurPos = UDim2.new(savedBlurPosition.X.Scale, savedBlurPosition.X.Offset + 100, savedBlurPosition.Y.Scale, savedBlurPosition.Y.Offset)
    
    ButtonFrame.Position = offScreenPos
    BlurFrame.Position = offScreenBlurPos
    ButtonFrame.Visible = true
    BlurFrame.Visible = true
    
    TweenService:Create(
        ButtonFrame,
        TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
        {Position = savedPosition}
    ):Play()
    
    TweenService:Create(
        BlurFrame,
        TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
        {Position = savedBlurPosition}
    ):Play()
end

function MobileToggle:Hide()
    if not isVisible or not ButtonFrame or not BlurFrame then return end
    isVisible = false
    
    local offScreenPos = UDim2.new(savedPosition.X.Scale, savedPosition.X.Offset + 100, savedPosition.Y.Scale, savedPosition.Y.Offset)
    local offScreenBlurPos = UDim2.new(savedBlurPosition.X.Scale, savedBlurPosition.X.Offset + 100, savedBlurPosition.Y.Scale, savedBlurPosition.Y.Offset)
    
    local hideTween = TweenService:Create(
        ButtonFrame,
        TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In),
        {Position = offScreenPos}
    )
    
    local hideBlurTween = TweenService:Create(
        BlurFrame,
        TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In),
        {Position = offScreenBlurPos}
    )
    
    hideTween:Play()
    hideBlurTween:Play()
    hideTween.Completed:Connect(function()
        ButtonFrame.Visible = false
        BlurFrame.Visible = false
    end)
end

function MobileToggle:Destroy()
    if ScreenGui then
        ScreenGui:Destroy()
        ScreenGui = nil
        ButtonFrame = nil
        IconLabel = nil
        BlurFrame = nil
        isVisible = false
        isAnimating = false
        isDragging = false
    end
end

local ClickDetector

if UserInputService.TouchEnabled then
	ClickDetector = createMobileButton()

	ClickDetector.MouseButton1Click:Connect(function()
		animateClick()
		if Debounce then return end
		if Hidden then
			Hidden = false
			Unhide()
		else
			if not SearchHided then spawn(CloseSearch) end
			Hidden = true
			Hide()
		end
	end)

	ClickDetector.MouseEnter:Connect(function()
		animateHover(true)
	end)

	ClickDetector.MouseLeave:Connect(function()
		animateHover(false)
	end)

	ClickDetector.MouseButton1Down:Connect(function()
		isDragging = true
		dragStart = UserInputService:GetMouseLocation()
		startPos = ButtonFrame.Position
	end)
end

UserInputService.InputChanged:Connect(function(input)
    if isDragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local currentPos = UserInputService:GetMouseLocation()
        local delta = currentPos - dragStart
        local newPos = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
        ButtonFrame.Position = newPos
        BlurFrame.Position = UDim2.new(
            newPos.X.Scale,
            newPos.X.Offset - 3,
            newPos.Y.Scale,
            newPos.Y.Offset - 3
        )
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        if isDragging then
            savePosition()
            isDragging = false
        end
    end
end)

UserInputService.TouchTapInWorld:Connect(function(position, processed)
    if processed then return end
    local screenPos = Vector2.new(position.x, position.y)
    local buttonPos = ButtonFrame.AbsolutePosition
    local buttonSize = ButtonFrame.AbsoluteSize
    
    if screenPos.X >= buttonPos.X and screenPos.X <= buttonPos.X + buttonSize.X and
       screenPos.Y >= buttonPos.Y and screenPos.Y <= buttonPos.Y + buttonSize.Y then
        animateClick()
        if Debounce then return end
        if Hidden then
            Hidden = false
            Unhide()
        else
            if not SearchHided then spawn(CloseSearch) end
            Hidden = true
            Hide()
        end
    end
end)

function Hide()
	MobileToggle:Show()
	if not Minimised and not SideBarClosed then
		spawn(CloseSideBar)
		if Main and Main:FindFirstChild("SideTabList") then
			TweenService:Create(Main.SideTabList, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {BackgroundTransparency = 1,Size = UDim2.new(0,160,0,285),Position = UDim2.new(0,14,0.5,22)}):Play()
			if Main.SideTabList:FindFirstChild("UIStroke") then
				TweenService:Create(Main.SideTabList.UIStroke, TweenInfo.new(0.4, Enum.EasingStyle.Quint),{Transparency = 1}):Play()
			end
			if Main.SideTabList:FindFirstChild("RDMT") then
				TweenService:Create(Main.SideTabList.RDMT, TweenInfo.new(0.4, Enum.EasingStyle.Quint),{TextTransparency = 1}):Play()
			end
			Main.SideTabList.Visible = false
		end
	end

	Debounce = true
    ArrayFieldLibrary:Notify({
        Title = "Interface Hidden", 
        Content = "The interface has been hidden, you can unhide the interface by tapping K",
        Duration = 7,
        Image = "eye-closed"
    })
    
	if not Main or not Main.Parent then return end
	
	TweenService:Create(Main, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 470, 0, 400)}):Play()
	if Main:FindFirstChild("Topbar") then
		TweenService:Create(Main.Topbar, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 470, 0, 45)}):Play()
	end
	TweenService:Create(Main, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
	if Main:FindFirstChild("Topbar") then
		TweenService:Create(Main.Topbar, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
		if Main.Topbar:FindFirstChild("Divider") then
			TweenService:Create(Main.Topbar.Divider, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
		end
		if Main.Topbar:FindFirstChild("CornerRepair") then
			TweenService:Create(Main.Topbar.CornerRepair, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
		end
		if Main.Topbar:FindFirstChild("Title") then
			TweenService:Create(Main.Topbar.Title, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
		end
	end
	if Main:FindFirstChild("Shadow") and Main.Shadow:FindFirstChild("Image") then
		TweenService:Create(Main.Shadow.Image, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
	end
	if Topbar and Topbar:FindFirstChild("UIStroke") then
		TweenService:Create(Topbar.UIStroke, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
	end
	if Topbar then
		for _, TopbarButton in ipairs(Topbar:GetChildren()) do
			if TopbarButton.ClassName == "ImageButton" then
				TweenService:Create(TopbarButton, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
			end
		end
	end
	if TabsList then
		for _, tabbtn in ipairs(TabsList:GetChildren()) do
			if tabbtn.ClassName == "Frame" and tabbtn.Name ~= "Placeholder" then
				TweenService:Create(tabbtn, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
				if tabbtn:FindFirstChild("Title") then
					TweenService:Create(tabbtn.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
				end
				if tabbtn:FindFirstChild("Image") then
					TweenService:Create(tabbtn.Image, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
				end
				if tabbtn:FindFirstChild("Shadow") then
					TweenService:Create(tabbtn.Shadow, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
				end
				if tabbtn:FindFirstChild("UIStroke") then
					TweenService:Create(tabbtn.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
				end
			end
		end
	end
	if Elements then
		for _, tab in ipairs(Elements:GetChildren()) do
			if tab.Name ~= "Template" and tab.ClassName == "ScrollingFrame" and tab.Name ~= "Placeholder" then
				for _, element in ipairs(tab:GetChildren()) do
					if element.ClassName == "Frame" then
						if element.Name ~= "SectionSpacing" and element.Name ~= "Placeholder" then
							if element:FindFirstChild('Holder') then
								TweenService:Create(element, TweenInfo.new(0.2, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
								if element:FindFirstChild("Title") then
									TweenService:Create(element.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
								end
							else
								TweenService:Create(element, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
								pcall(function()
									if element:FindFirstChild("UIStroke") then
										TweenService:Create(element.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
									end
								end)
								if element:FindFirstChild("Title") then
									TweenService:Create(element.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
								end
							end
							for _, child in ipairs(element:GetChildren()) do
								if child.ClassName == "Frame" or child.ClassName == "TextLabel" or child.ClassName == "TextBox" or child.ClassName == "ImageButton" or child.ClassName == "ImageLabel" then
									child.Visible = false
								end
							end
						end
					end
				end
			end
		end
	end

	wait(0.5)
	if Main then
		Main.Visible = false
	end
	Debounce = false
end

function Unhide()
	MobileToggle:Hide()
	if not Minimised and SideBarClosed then
		wait(.1)
		spawn(OpenSideBar)
	end
	task.spawn(function()
		task.wait(0.2)
		if Elements then
			for _, Descendant in ipairs(Elements:GetDescendants()) do
				if Descendant:IsA("Frame") and Descendant.Name == "SectionTitle" then
					Descendant.BackgroundColor3 = SelectedTheme.Background
				end
			end
		end
	end)
	Debounce = true
	if not Main or not Main.Parent then return end
	
	Main.Position = UDim2.new(0.5, 0, 0.5, 0)
	Main.Visible = true
	TweenService:Create(Main, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 700, 0, 355)}):Play()
	if Main:FindFirstChild("Topbar") then
		TweenService:Create(Main.Topbar, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 700, 0, 45)}):Play()
	end
	if Main:FindFirstChild("Shadow") and Main.Shadow:FindFirstChild("Image") then
		TweenService:Create(Main.Shadow.Image, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageTransparency = 0.4}):Play()
	end
	TweenService:Create(Main, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
	if Main:FindFirstChild("Topbar") then
		TweenService:Create(Main.Topbar, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
		if Main.Topbar:FindFirstChild("Divider") then
			TweenService:Create(Main.Topbar.Divider, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
		end
		if Main.Topbar:FindFirstChild("CornerRepair") then
			TweenService:Create(Main.Topbar.CornerRepair, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
		end
		if Main.Topbar:FindFirstChild("Title") then
			TweenService:Create(Main.Topbar.Title, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
		end
	end
	if Minimised then
		spawn(Maximise)
	end
	if Topbar then
		for _, TopbarButton in ipairs(Topbar:GetChildren()) do
			if TopbarButton.ClassName == "ImageButton" then
				TweenService:Create(TopbarButton, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageTransparency = 0.8}):Play()
			end
		end
	end
	if Elements then
		for _, tab in ipairs(Elements:GetChildren()) do
			if tab.Name ~= "Template" and tab.ClassName == "ScrollingFrame" and tab.Name ~= "Placeholder" then
				for _, element in ipairs(tab:GetChildren()) do
					if element.ClassName == "Frame" then
						if element.Name ~= "SectionSpacing" and element.Name ~= "Placeholder" and not element:FindFirstChild('ColorPickerIs') then
							if element:FindFirstChild('_UIPadding_') then
								if element:FindFirstChild("Title") then
									TweenService:Create(element.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
								end
								TweenService:Create(element, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = .25}):Play()
							else
								if element.Name ~= 'SectionTitle' then
									TweenService:Create(element, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
									if element:FindFirstChild("UIStroke") then
										TweenService:Create(element.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
									end
								end
								if element:FindFirstChild("Title") then
									TweenService:Create(element.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
								end
							end
							for _, child in ipairs(element:GetChildren()) do
								if (child.ClassName == "Frame" or child.ClassName == "TextLabel" or child.ClassName == "TextBox" or child.ClassName == "ImageButton" or child.ClassName == "ImageLabel") then
									child.Visible = true
								end
							end
						elseif element:FindFirstChild('ColorPickerIs') then
							TweenService:Create(element, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
							if element:FindFirstChild("UIStroke") then
								TweenService:Create(element.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
							end
							if element:FindFirstChild("Title") then
								TweenService:Create(element.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
							end

							if element.ColorPickerIs.Value then
								if element:FindFirstChild("ColorSlider") then
									element.ColorSlider.Visible = true
								end
								if element:FindFirstChild("HexInput") then
									element.HexInput.Visible = true
								end
								if element:FindFirstChild("RGB") then
									element.RGB.Visible = true
								end
							end
							if element:FindFirstChild("CPBackground") then
								element.CPBackground.Visible = true
							end
							if element:FindFirstChild("Lock") then
								element.Lock.Visible = true
							end
							if element:FindFirstChild("Interact") then
								element.Interact.Visible = true
							end
							if element:FindFirstChild("Title") then
								element.Title.Visible = true
							end
						end
					end
				end
			end
		end
	end
	wait(0.5)
	Minimised = false
	Debounce = false
end

function CloseSearch()
	Debounce = true
	TweenService:Create(SearchBar, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {BackgroundTransparency = 1,Size = UDim2.new(0, 460,0, 35)}):Play()
	TweenService:Create(SearchBar.Icon, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
	TweenService:Create(SearchBar.Clear, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
	TweenService:Create(SearchBar.UIStroke, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
	TweenService:Create(SearchBar.Filter, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
	TweenService:Create(SearchBar.Shadow.Image, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {ImageTransparency = 0.1}):Play()
	TweenService:Create(SearchBar.Input, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
	delay(.3,function()
		SearchBar.Input.Visible = false
	end)
	wait(0.5)
	SearchBar.Visible = false
	Debounce = false
end

function OpenSearch()
	Debounce = true
	SearchBar.Visible = true
	SearchBar.Input.Visible = true
	TweenService:Create(SearchBar, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {BackgroundTransparency = 0,Size = UDim2.new(0, 500,0, 40), Position = UDim2.new(0.5, 80, 0.150000006, 0)}):Play()
	TweenService:Create(SearchBar.Icon, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {ImageTransparency = 0.5}):Play()
	TweenService:Create(SearchBar.Shadow.Image, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {ImageTransparency = 0.1}):Play()
	TweenService:Create(SearchBar.UIStroke, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {Transparency = 0.05}):Play()
	TweenService:Create(SearchBar.Clear, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {ImageTransparency = .8}):Play()
	TweenService:Create(SearchBar.Filter, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {ImageTransparency = .8}):Play()
	TweenService:Create(SearchBar.Input, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
	wait(0.5)
	Debounce = false
end

local InputDetection = Instance.new("TextButton")
InputDetection.Name = "InputDetection"
InputDetection.BackgroundTransparency = 1
InputDetection.Size = UDim2.new(1, 0, 1, 0)
InputDetection.ZIndex = 10
InputDetection.Text = ""
InputDetection.Parent = SearchBar

InputDetection.MouseButton1Click:Connect(function()
    SearchBar.Input:CaptureFocus()
end)

InputDetection.TouchTap:Connect(function()
    SearchBar.Input:CaptureFocus()
end)

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
    Filler.Position = UDim2.new(0.957, 0, .5, 0)
    Filler.Size = UDim2.new(0, 1, 0, 1)
    Filler.BackgroundTransparency = .9
    local goal = {}
    goal.Size = UDim2.new(0, 1000, 0, 500)
    goal.BackgroundTransparency = 1
    TweenService:Create(Filler, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), goal):Play()
    SearchBar.Input.Text = ''
end)

SearchBar.Clear.TouchTap:Connect(function()
    Filler.Position = UDim2.new(0.957, 0, .5, 0)
    Filler.Size = UDim2.new(0, 1, 0, 1)
    Filler.BackgroundTransparency = .9
    local goal = {}
    goal.Size = UDim2.new(0, 1000, 0, 500)
    goal.BackgroundTransparency = 1
    TweenService:Create(Filler, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), goal):Play()
    SearchBar.Input.Text = ''
end)

function Maximise()
	if SideBarClosed then
		wait(.1)
		spawn(OpenSideBar)
	end
	task.spawn(function()
		task.wait(0.2)
		for _, Descendant in ipairs(Elements:GetDescendants()) do
			if Descendant:IsA("Frame") and Descendant.Name == "SectionTitle" then
				Descendant.BackgroundColor3 = SelectedTheme.Background
			end
		end
	end)

	Debounce = true
	Topbar.ChangeSize.Image = "rbxassetid://"..10137941941

	TweenService:Create(Topbar.UIStroke, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
	TweenService:Create(Main.Shadow.Image, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {ImageTransparency = 0.4}):Play()
	TweenService:Create(Topbar.CornerRepair, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
	TweenService:Create(Topbar.Divider, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
	TweenService:Create(Main, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 700, 0, 355)}):Play()
	TweenService:Create(Topbar, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 700, 0, 45)}):Play()
	TabsList.Visible = true
	wait(0.2)

	Elements.Visible = true

	for _, tab in ipairs(Elements:GetChildren()) do
		if tab.Name ~= "Template" and tab.ClassName == "ScrollingFrame" and tab.Name ~= "Placeholder" then
			for _, element in ipairs(tab:GetChildren()) do
				if element.ClassName == "Frame" then
					if element.Name ~= "SectionSpacing" and element.Name ~= "Placeholder" and not element:FindFirstChild('ColorPickerIs') then
						if element:FindFirstChild('_UIPadding_') then
							TweenService:Create(element, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = .25}):Play()
							TweenService:Create(element.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
						else
							if element.Name ~= 'SectionTitle' then
								TweenService:Create(element, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
								TweenService:Create(element.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
							end
							TweenService:Create(element.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
						end
						for _, child in ipairs(element:GetChildren()) do
							if (child.ClassName == "Frame" or child.ClassName == "TextLabel" or child.ClassName == "TextBox" or child.ClassName == "ImageButton" or child.ClassName == "ImageLabel") then
								child.Visible = true
							end
						end
					elseif element:FindFirstChild('ColorPickerIs') then
						TweenService:Create(element, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
						TweenService:Create(element.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
						TweenService:Create(element.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()

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
				end
			end
		end
	end

	wait(0.1)

	for _, tabbtn in ipairs(TopList:GetChildren()) do
		if tabbtn.ClassName == "Frame" and tabbtn.Name ~= "Placeholder" then
			if tostring(Elements.UIPageLayout.CurrentPage) == tabbtn.Title.Text then
				TweenService:Create(tabbtn, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
				TweenService:Create(tabbtn.Image, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ImageTransparency = 0}):Play()
				TweenService:Create(tabbtn.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
				TweenService:Create(tabbtn.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
				TweenService:Create(tabbtn.Shadow, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ImageTransparency = 0.9}):Play()
			else
				TweenService:Create(tabbtn, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 0.7}):Play()
				TweenService:Create(tabbtn.Shadow, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ImageTransparency = 0.7}):Play()
				TweenService:Create(tabbtn.Image, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ImageTransparency = 0.2}):Play()
				TweenService:Create(tabbtn.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 0.2}):Play()
				TweenService:Create(tabbtn.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
			end
		end
	end

	wait(0.5)
	Debounce = false
end

function OpenSideBar()
	Debounce = true

	if not Main or not Main:FindFirstChild("SideTabList") then 
		Debounce = false
		return 
	end
	
	Main.SideTabList.Visible = true 
	TweenService:Create(Main.SideTabList, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {BackgroundTransparency = .03,Size = UDim2.new(0,160,0,285),Position = UDim2.new(0,14,0.5,22)}):Play()
	if Main.SideTabList:FindFirstChild("UIStroke") then
		TweenService:Create(Main.SideTabList.UIStroke, TweenInfo.new(0.4, Enum.EasingStyle.Quint),{Transparency = 0}):Play()
	end
	if Main.SideTabList:FindFirstChild("RDMT") then
		TweenService:Create(Main.SideTabList.RDMT, TweenInfo.new(0.4, Enum.EasingStyle.Quint),{TextTransparency = 0}):Play()
	end
	if SideList then
		for _,tabbtn in pairs(SideList:GetChildren()) do
			if tabbtn.ClassName == "Frame" and tabbtn.Name ~= "Placeholder" then
				if tabbtn:FindFirstChild("Title") and tabbtn.Title.TextColor3 ~= Color3.fromRGB(255,255,255) then
					TweenService:Create(tabbtn.Title, TweenInfo.new(0.25, Enum.EasingStyle.Quint),{TextTransparency = .2}):Play()
				elseif tabbtn:FindFirstChild("Title") then
					TweenService:Create(tabbtn.Title, TweenInfo.new(0.25, Enum.EasingStyle.Quint),{TextTransparency = 0}):Play()
				end
				if tabbtn:FindFirstChild("Image") then
					TweenService:Create(tabbtn.Image, TweenInfo.new(0.25, Enum.EasingStyle.Quint),{ImageTransparency = 0}):Play()
				end
			end
			wait(0.12)
		end
	end
	SideBarClosed = false
	if Topbar and Topbar:FindFirstChild("Type") then
		Topbar.Type.Active = false
		Topbar.Type.AutoButtonColor = false
	end
	
	if Main:FindFirstChild("SideTabList") then
		TweenService:Create(Main.SideTabList, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {BackgroundTransparency = 0,Size = UDim2.new(0,160,0,285),Position = UDim2.new(0,14,0.5,22)}):Play()
		if Main.SideTabList:FindFirstChild("UIStroke") then
			TweenService:Create(Main.SideTabList.UIStroke, TweenInfo.new(0.4, Enum.EasingStyle.Quint),{Transparency = 0}):Play()
		end
		if Main.SideTabList:FindFirstChild("RDMT") then
			TweenService:Create(Main.SideTabList.RDMT, TweenInfo.new(0.4, Enum.EasingStyle.Quint),{TextTransparency = 0}):Play()
		end
		wait(.4)
		Main.SideTabList.Visible = true
	end
	wait(0.2)
	Debounce = false
end

function Minimise()
	Debounce = true
	Topbar.ChangeSize.Image = "rbxassetid://"..11036884234
	if not SearchHided then
		spawn(CloseSearch)
	end
	if not SideBarClosed then
		wait(.1)
        spawn(CloseSideBar)
        TweenService:Create(Main.SideTabList, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {BackgroundTransparency = 1,Size = UDim2.new(0,160,0,285),Position = UDim2.new(0,14,0.5,22)}):Play()
        TweenService:Create(Main.SideTabList.UIStroke, TweenInfo.new(0.4, Enum.EasingStyle.Quint),{Transparency = 1}):Play()
        TweenService:Create(Main.SideTabList.RDMT, TweenInfo.new(0.4, Enum.EasingStyle.Quint),{TextTransparency = 1}):Play()
        wait(.1)
        Main.SideTabList.Visible = false
	end
	
	for _, tabbtn in ipairs(TopList:GetChildren()) do
		if tabbtn.ClassName == "Frame" and tabbtn.Name ~= "Placeholder" then
			TweenService:Create(tabbtn, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
			TweenService:Create(tabbtn.Image, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
			TweenService:Create(tabbtn.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
			TweenService:Create(tabbtn.Shadow, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
			TweenService:Create(tabbtn.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
		end
	end

	for _, tab in ipairs(Elements:GetChildren()) do
		if tab.Name ~= "Template" and tab.ClassName == "ScrollingFrame" and tab.Name ~= "Placeholder" then
			for _, element in ipairs(tab:GetChildren()) do
				if element.ClassName == "Frame" then
					if element.Name ~= "SectionSpacing" and element.Name ~= "Placeholder" then
						if element:FindFirstChild('_UIPadding_') then
							TweenService:Create(element, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
							TweenService:Create(element.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
						else
                            TweenService:Create(element, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
							pcall(function()
								TweenService:Create(element.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
							end)
							TweenService:Create(element.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
						end
						for _, child in ipairs(element:GetChildren()) do
							if child.ClassName == "Frame" or child.ClassName == "TextLabel" or child.ClassName == "TextBox" or child.ClassName == "ImageButton" or child.ClassName == "ImageLabel" then
								child.Visible = false
							end
						end
					end
				end
			end
		end
	end

	TweenService:Create(Topbar.UIStroke, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
	TweenService:Create(Main.Shadow.Image, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
	TweenService:Create(Topbar.CornerRepair, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
	TweenService:Create(Topbar.Divider, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
	TweenService:Create(Main, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 495, 0, 45)}):Play()
	TweenService:Create(Topbar, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 495, 0, 45)}):Play()

	wait(0.3)

	Elements.Visible = false
	TabsList.Visible = false

	wait(0.2)
	Debounce = false
end

function ApplyTheme()
    ArrayField.Main.BackgroundColor3 = SelectedTheme.Background
    ArrayField.Main.Topbar.BackgroundColor3 = SelectedTheme.Topbar
    ArrayField.Main.Topbar.CornerRepair.BackgroundColor3 = SelectedTheme.Topbar
    ArrayField.Main.Shadow.Image.ImageColor3 = SelectedTheme.Shadow

    ArrayField.Main.Topbar.ChangeSize.ImageColor3 = SelectedTheme.TextColor
    ArrayField.Main.Topbar.Hide.ImageColor3 = SelectedTheme.TextColor
    if ArrayField.Main.Topbar:FindFirstChild("Search") then
        ArrayField.Main.Topbar.Search.ImageColor3 = SelectedTheme.TextColor
    end

    ArrayField.Main.SideTabList.BackgroundColor3 = SelectedTheme.SidebarBackground

    local Sections = ArrayField.Main:GetChildren()
    for _, section in pairs(Sections) do
        if section:IsA("Frame") then
            if section:FindFirstChild("Minimize") then
                section.Minimize.Visible = false
            end
            
            if section:FindFirstChild("Border") then
                section.Border.Visible = false
            end
            
            section.BackgroundColor3 = SelectedTheme.SidebarBackground
        end
    end

    for _, Descendant in ipairs(Elements:GetDescendants()) do
        if Descendant:IsA("Frame") and Descendant.Name == "SectionTitle" then
            Descendant.BackgroundColor3 = SelectedTheme.TabBackground
        end
    end

    for _, obj in ipairs(ArrayField:GetDescendants()) do
        if obj.ClassName == "TextLabel" or obj.ClassName == "TextBox" or obj.ClassName == "TextButton" then
            if SelectedTheme.TextFont ~= "Default" then 
                obj.TextColor3 = SelectedTheme.TextColor
                obj.Font = SelectedTheme.TextFont
            end
        end
    end

    for _, TabPage in ipairs(Elements:GetChildren()) do
        for _, Element in ipairs(TabPage:GetChildren()) do
            if Element.ClassName == "Frame" and Element.Name ~= "Placeholder" and Element.Name ~= "SectionSpacing" and Element.Name ~= "" then
                Element.BackgroundColor3 = SelectedTheme.ElementBackground
                if Element:FindFirstChild("UIStroke") then
                    Element.UIStroke.Color = SelectedTheme.ElementStroke
                end
            end
        end
    end
end

function ArrayFieldLibrary:CreateWindow(Settings)
    Topbar.Type.Active = false
    Topbar.Type.AutoButtonColor = false

    if Settings.Theme then
        if ArrayFieldLibrary.Theme[Settings.Theme] then
            SelectedTheme = ArrayFieldLibrary.Theme[Settings.Theme]
        else
            warn("ArrayField: Theme '" .. Settings.Theme .. "' not found, using Default theme")
            SelectedTheme = ArrayFieldLibrary.Theme.Default
        end
    else
        SelectedTheme = ArrayFieldLibrary.Theme.Default
    end

    local OriginalTopbarSize = Topbar.Size
    ArrayField.Enabled = false
    local Passthrough = false
    Topbar.Title.Text = Settings.Name
    Topbar.Title.Font = SelectedTheme.TextFont
    Main.Size = UDim2.new(0, 250, 0, 260)
    Main.Visible = true
    Main.BackgroundTransparency = 1
    LoadingFrame.Title.TextTransparency = 1
    LoadingFrame.Subtitle.TextTransparency = 1
    Main.Shadow.Image.ImageTransparency = 1
    LoadingFrame.Version.TextTransparency = 1
    LoadingFrame.Version.Position = UDim2.new(0, 100, 0, 230)
    LoadingFrame.Title.Text = Settings.LoadingTitle or "Arrayfield Interface Suite"
    LoadingFrame.Subtitle.Text = Settings.LoadingSubtitle or "by Sirius | Meta"
    if Settings.LoadingTitle ~= "Arrayfield Interface Suite" then
        LoadingFrame.Version.Text = "ArrayField UI"
    end
    Topbar.Visible = false
    Elements.Visible = false
    LoadingFrame.Visible = true
    LoadingFrame.Title.Font = SelectedTheme.TextFont
    LoadingFrame.Subtitle.Font = SelectedTheme.TextFont
    LoadingFrame.Version.Font = SelectedTheme.TextFont

    ApplyTheme()

	pcall(function()
		if not Settings.ConfigurationSaving.FileName then
			Settings.ConfigurationSaving.FileName = tostring(game.PlaceId)
		end
		if not isfolder(ArrayFieldLibrary.."/".."Configuration Folders") then

		end
		if Settings.ConfigurationSaving.Enabled == nil then
			Settings.ConfigurationSaving.Enabled = false
		end
		CFileName = Settings.ConfigurationSaving.FileName
		ConfigurationFolder = Settings.ConfigurationSaving.FolderName or ConfigurationFolder
		CEnabled = Settings.ConfigurationSaving.Enabled

		if Settings.ConfigurationSaving.Enabled then
			if not isfolder(ConfigurationFolder) then
				makefolder(ConfigurationFolder)
			end	
		end
	end)

	AddDraggingFunctionality(Topbar,Main)

	if typeof(Settings.KeySettings.Key) == "string" then Settings.KeySettings.Key = {Settings.KeySettings.Key} end

	for _, TabButton in ipairs(TabsList:GetChildren()) do
		if TabButton.ClassName == "Frame" and TabButton.Name ~= "Placeholder" then
			TabButton.BackgroundTransparency = 1
			TabButton.Title.TextTransparency = 1
			TabButton.Shadow.ImageTransparency = 1
			TabButton.Image.ImageTransparency = 1
			TabButton.UIStroke.Transparency = 1
		end
	end

	if Settings.Discord then
		if not isfolder(ArrayFieldFolder.."/Discord Invites") then
			makefolder(ArrayFieldFolder.."/Discord Invites")
		end
		if not isfile(ArrayFieldFolder.."/Discord Invites".."/"..Settings.Discord.Invite..ConfigurationExtension) then
			warn("discord rpc was removed. discord invite saving cant work")

			if Settings.Discord.RememberJoins then
				writefile(ArrayFieldFolder.."/Discord Invites".."/"..Settings.Discord.Invite..ConfigurationExtension,"ArrayField RememberJoins is true for this invite, this invite will not ask you to join again")
			end
		else

		end
	end

	if Settings.KeySystem then
		if not Settings.KeySettings then
			Passthrough = true
			return
		end

		if not isfolder(ArrayFieldFolder.."/Key System") then
			makefolder(ArrayFieldFolder.."/Key System")
		end

		if Settings.KeySettings.GrabKeyFromSite then
			for i, Key in ipairs(Settings.KeySettings.Key) do
				local Success, Response = pcall(function()
					Settings.KeySettings.Key[i] = tostring(game:HttpGet(Key):gsub("[\n\r]", " "))
					Settings.KeySettings.Key[i] = string.gsub(Settings.KeySettings.Key[i], " ", "")
				end)
				if not Success then
					print("ArrayField | "..Key.." Error " ..tostring(Response))
				end
			end
		end

		if not Settings.KeySettings.FileName then
			Settings.KeySettings.FileName = "No file name specified"
		end

		if isfile(ArrayFieldFolder.."/Key System".."/"..Settings.KeySettings.FileName..ConfigurationExtension) then
			if readfile(ArrayFieldFolder.."/Key System".."/"..Settings.KeySettings.FileName..ConfigurationExtension) == Settings.KeySettings.Key then
				Passthrough = true
			end
		end

		if not Passthrough then
			local AttemptsRemaining = math.random(2,6)
			ArrayField.Enabled = false
			local KeyUI = game:GetObjects("rbxassetid://11695805160")[1]
			KeyUI.Enabled = true
			pcall(function()
				_G.KeyUI:Destroy()
			end)
			_G.KeyUI = KeyUI

			ParentObject(KeyUI)

			local KeyMain = KeyUI.Main
			KeyMain.Title.Text = Settings.KeySettings.Title or Settings.Name
			KeyMain.Subtitle.Text = Settings.KeySettings.Subtitle or "Key System"
			KeyMain.NoteMessage.Text = Settings.KeySettings.Note or "No instructions"

			KeyMain.Size = UDim2.new(0, 467, 0, 175)
			KeyMain.BackgroundTransparency = 1
			KeyMain.EShadow.ImageTransparency = 1
			KeyMain.Title.TextTransparency = 1
			KeyMain.Subtitle.TextTransparency = 1
			KeyMain.KeyNote.TextTransparency = 1
			KeyMain.Input.BackgroundTransparency = 1
			KeyMain.Input.UIStroke.Transparency = 1
			KeyMain.Input.InputBox.TextTransparency = 1
			KeyMain.NoteTitle.TextTransparency = 1
			KeyMain.NoteMessage.TextTransparency = 1
			KeyMain.Hide.ImageTransparency = 1
			KeyMain.HideP.ImageTransparency = 1
			KeyMain.Actions.Template.TextTransparency = 1

			if Settings.KeySettings.Actions then
				for _,ActionInfo in ipairs(Settings.KeySettings.Actions) do
					local Action = KeyMain.Actions.Template:Clone()
					Action.Text = ActionInfo.Text
					Action.MouseButton1Down:Connect(ActionInfo.OnPress)
					Action.MouseEnter:Connect(function()
						TweenService:Create(Action,TweenInfo.new(.25,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{TextColor3 = Color3.fromRGB(185, 185, 185)}):Play()
					end)
					Action.MouseLeave:Connect(function()
						TweenService:Create(Action,TweenInfo.new(.25,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{TextColor3 = Color3.fromRGB(105, 105, 105)}):Play()
					end)
					Action.Parent = KeyMain.Actions
					delay(.2,function()
						Action.Visible = true
						TweenService:Create(Action, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
					end)
				end
			end

			TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
			TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 500, 0, 187)}):Play()
			TweenService:Create(KeyMain.EShadow, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {ImageTransparency = 0.5}):Play()
			wait(0.05)
			TweenService:Create(KeyMain.Title, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
			TweenService:Create(KeyMain.Subtitle, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
			wait(0.05)
			TweenService:Create(KeyMain.KeyNote, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
			TweenService:Create(KeyMain.Input, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
			TweenService:Create(KeyMain.Input.UIStroke, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
			TweenService:Create(KeyMain.Input.HidenInput, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
			wait(0.05)
			TweenService:Create(KeyMain.NoteTitle, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
			TweenService:Create(KeyMain.NoteMessage, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
			wait(0.15)
			TweenService:Create(KeyMain.Hide, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {ImageTransparency = 0.3}):Play()
			TweenService:Create(KeyMain.HideP, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {ImageTransparency = 0.3}):Play()
			KeyUI.Main.Input.InputBox:GetPropertyChangedSignal('Text'):Connect(function()
				KeyUI.Main.Input.HidenInput.Text = string.rep('•', #KeyUI.Main.Input.InputBox.Text)
			end)
			KeyUI.Main.Input.InputBox.FocusLost:Connect(function(EnterPressed)
				if not EnterPressed then return end
				if #KeyUI.Main.Input.InputBox.Text == 0 then return end
				local KeyFound = false
				local FoundKey = ''
				for _, MKey in ipairs(Settings.KeySettings.Key) do
					if KeyMain.Input.InputBox.Text== MKey then
						KeyFound = true
						FoundKey = MKey
					end
				end
				if KeyFound then
					for _,Action in ipairs(KeyMain.Actions:GetChildren()) do
						if Action:IsA('TextButton') then
							TweenService:Create(Action, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
						end
					end
					TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
					TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 467, 0, 175)}):Play()
					TweenService:Create(KeyMain.EShadow, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
					TweenService:Create(KeyMain.Title, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
					TweenService:Create(KeyMain.Subtitle, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
					TweenService:Create(KeyMain.KeyNote, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
					TweenService:Create(KeyMain.Input, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
					TweenService:Create(KeyMain.Input.UIStroke, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
					TweenService:Create(KeyMain.Input.InputBox,TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
					TweenService:Create(KeyMain.Input.HidenInput, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
					TweenService:Create(KeyMain.NoteTitle, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
					TweenService:Create(KeyMain.NoteMessage, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
					TweenService:Create(KeyMain.Hide, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
					TweenService:Create(KeyMain.HideP, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
					delay(.4,function()
						KeyMain.Hide.Visible = false
						KeyUI:Destroy()
					end)
					wait(0.51)
					Passthrough = true
					if Settings.KeySettings.SaveKey then
						if writefile then
							writefile(ArrayFieldFolder.."/Key System".."/"..Settings.KeySettings.FileName..ConfigurationExtension, Settings.KeySettings.Key)
						end
						ArrayFieldLibrary:Notify({Title = "Key System", Content = "The key for this script has been saved successfully"})
					end
				else
					if AttemptsRemaining == 0 then
						TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
						TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 467, 0, 175)}):Play()
						TweenService:Create(KeyMain.Shadow.Image, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
						TweenService:Create(KeyMain.Title, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
						TweenService:Create(KeyMain.Subtitle, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
						TweenService:Create(KeyMain.KeyNote, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
						TweenService:Create(KeyMain.Input, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
						TweenService:Create(KeyMain.Input.UIStroke, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
						TweenService:Create(KeyMain.Input.InputBox,TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
						TweenService:Create(KeyMain.Input.HidenInput, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
						TweenService:Create(KeyMain.NoteTitle, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
						TweenService:Create(KeyMain.NoteMessage, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
						TweenService:Create(KeyMain.Hide, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
						TweenService:Create(KeyMain.HideP, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
						wait(0.45)
						game.Players.LocalPlayer:Kick("No Attempts Remaining")
						game:Shutdown()
					end
					KeyMain.Input.InputBox.Text = ""
					AttemptsRemaining = AttemptsRemaining - 1
					TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 467, 0, 175)}):Play()
					TweenService:Create(KeyMain, TweenInfo.new(0.4, Enum.EasingStyle.Elastic), {Position = UDim2.new(0.495,0,0.5,0)}):Play()
					wait(0.1)
					TweenService:Create(KeyMain, TweenInfo.new(0.4, Enum.EasingStyle.Elastic), {Position = UDim2.new(0.505,0,0.5,0)}):Play()
					wait(0.1)
					TweenService:Create(KeyMain, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {Position = UDim2.new(0.5,0,0.5,0)}):Play()
					TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 500, 0, 187)}):Play()
				end
			end)
			local Hidden = true
			KeyMain.HideP.MouseButton1Click:Connect(function()
				if Hidden then
					TweenService:Create(KeyMain.Input.HidenInput,TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
					TweenService:Create(KeyMain.Input.InputBox,TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
					Hidden = false
				else
					TweenService:Create(KeyMain.Input.HidenInput,TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
					TweenService:Create(KeyMain.Input.InputBox,TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
					Hidden = true
				end
			end)

			KeyMain.Hide.MouseButton1Click:Connect(function()
				TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
				TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 467, 0, 175)}):Play()
				TweenService:Create(KeyMain.EShadow, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
				TweenService:Create(KeyMain.Title, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
				TweenService:Create(KeyMain.Subtitle, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
				TweenService:Create(KeyMain.KeyNote, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
				TweenService:Create(KeyMain.Input, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
				TweenService:Create(KeyMain.Input.UIStroke, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
				TweenService:Create(KeyMain.Input.InputBox, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
				TweenService:Create(KeyMain.NoteTitle, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
				TweenService:Create(KeyMain.Input.HidenInput,TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
				TweenService:Create(KeyMain.NoteMessage, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
				TweenService:Create(KeyMain.Hide, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
				TweenService:Create(KeyMain.HideP, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
				wait(0.51)
				ArrayFieldLibrary:Destroy()
				MobileToggle:Destroy()
				KeyUI:Destroy()
			end)
		else
			Passthrough = true
		end
	end
	if Settings.KeySystem then
		repeat wait() until Passthrough
	end
	ArrayField.Enabled = true
	for _,tabbtn in pairs(SideList:GetChildren()) do
		if tabbtn.ClassName == "Frame" and tabbtn.Name ~= "Placeholder" then
			TweenService:Create(tabbtn.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint),{TextTransparency = 1}):Play()
			TweenService:Create(tabbtn.Image, TweenInfo.new(0.3, Enum.EasingStyle.Quint),{ImageTransparency = 1}):Play()
		end
	end
	TweenService:Create(Main.SideTabList, TweenInfo.new(0, Enum.EasingStyle.Quint), {BackgroundTransparency = 1,Size = UDim2.new(0,160,0,285),Position = UDim2.new(0,14,0.5,22)}):Play()
	TweenService:Create(Main.SideTabList.UIStroke, TweenInfo.new(0, Enum.EasingStyle.Quint),{Transparency = 1}):Play()
	TweenService:Create(Main.SideTabList.RDMT, TweenInfo.new(0, Enum.EasingStyle.Quint),{TextTransparency = 1}):Play()

	TweenService:Create(InfoPrompt,TweenInfo.new(.3,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{
		Size = UDim2.fromOffset(212,254),BackgroundTransparency = 1
	}):Play()
	TweenService:Create(InfoPrompt.ImageLabel,TweenInfo.new(.25,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{
		ImageTransparency = 1
	}):Play()
	TweenService:Create(InfoPrompt.Description,TweenInfo.new(.25,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{
		TextTransparency = 1
	}):Play()
	TweenService:Create(InfoPrompt.Status,TweenInfo.new(.25,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{
		TextTransparency = 1
	}):Play()
	TweenService:Create(InfoPrompt.Title,TweenInfo.new(.25,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{
		TextTransparency = 1
	}):Play()

	TopList.Template.Visible = false
	SideList.SideTemplate.Visible = false
	Notifications.Template.Visible = false
	Notifications.Visible = true
	wait(0.5)
	TweenService:Create(Main, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
	TweenService:Create(Main.Shadow.Image, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageTransparency = 0.55}):Play()
	wait(0.1)
	TweenService:Create(LoadingFrame.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
	wait(0.05)
	TweenService:Create(LoadingFrame.Subtitle, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
	wait(0.05)
	TweenService:Create(LoadingFrame.Version, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()

	Elements.Template.LayoutOrder = 100000
	Elements.Template.Visible = false

	Elements.UIPageLayout.FillDirection = Enum.FillDirection.Horizontal

	local FirstTab = false
	local FirstTabObject = nil
	ArrayFieldQuality.Window = {Tabs = {}}
	local Window = ArrayFieldQuality.Window
    function Window:CreateTab(Name, Image)
        Window.Tabs[Name] = {Elements = {}}
        local Tab = Window.Tabs[Name]
        local SDone = false
        local TopTabButton, SideTabButton = TopList.Template:Clone(), SideList.SideTemplate:Clone()

        SideTabButton.Parent = SideList
        TopTabButton.Parent = TopList
        
        TopTabButton.Name = Name 
        SideTabButton.Name = Name
        
        TopTabButton.Title.Text = Name 
        SideTabButton.Title.Text = Name
        TopTabButton.Title.Font = SelectedTheme.TextFont
        SideTabButton.Title.Font = SelectedTheme.TextFont
        SideTabButton.Title.TextWrapped = false 
        TopTabButton.Title.TextWrapped = false
        
        TopTabButton.Size = UDim2.new(0, TopTabButton.Title.TextBounds.X + 30, 0, 30)
        
        if Image then
            if typeof(Image) == 'string' and not tonumber(Image) then
                local asset = getIcon(Image)
                
                TopTabButton.Image.Image = 'rbxassetid://' .. asset.id
                TopTabButton.Image.ImageRectOffset = asset.imageRectOffset
                TopTabButton.Image.ImageRectSize = asset.imageRectSize
                
                SideTabButton.Image.Image = 'rbxassetid://' .. asset.id
                SideTabButton.Image.ImageRectOffset = asset.imageRectOffset
                SideTabButton.Image.ImageRectSize = asset.imageRectSize
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
		SideTabButton.Shadow.ImageTransparency = 1
		SideTabButton.Image.ImageTransparency = 1
		SideTabButton.UIStroke.Transparency = 1

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
			FirstTab = Name
			FirstTabObject = TabPage
			Elements.UIPageLayout.Animated = false
			Elements.UIPageLayout:JumpTo(TabPage)
			Elements.UIPageLayout.Animated = true
		end

		if SelectedTheme ~= ArrayFieldLibrary.Theme.Default then
			TopTabButton.Shadow.Visible = false
		end
		TopTabButton.UIStroke.Color = SelectedTheme.TabStroke
		
		wait(0.1)
		if Name == FirstTab then
			TopTabButton.BackgroundColor3 = SelectedTheme.TabBackgroundSelected
			TopTabButton.Image.ImageColor3 = SelectedTheme.SelectedTabTextColor
			TopTabButton.Title.TextColor3 = SelectedTheme.SelectedTabTextColor
			TweenService:Create(TopTabButton.Shadow, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ImageTransparency = 0.9}):Play()
			TweenService:Create(TopTabButton.Image, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageTransparency = 0}):Play()
			TweenService:Create(TopTabButton, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
			TweenService:Create(TopTabButton.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()

			SideTabButton.Image.ImageColor3 = Color3.fromRGB(255, 255, 255)
			SideTabButton.Title.TextColor3 = Color3.fromRGB(255, 255, 255)
			TweenService:Create(SideTabButton.Image, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageTransparency = 0}):Play()
			TweenService:Create(SideTabButton.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
		else
			TopTabButton.BackgroundColor3 = SelectedTheme.TabBackground
			TopTabButton.Image.ImageColor3 = SelectedTheme.TabTextColor
			TopTabButton.Title.TextColor3 = SelectedTheme.TabTextColor
			TweenService:Create(TopTabButton, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0.7}):Play()
			TweenService:Create(TopTabButton.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0.2}):Play()
			TweenService:Create(TopTabButton.Image, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageTransparency = 0.2}):Play()
			TweenService:Create(TopTabButton.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
			TweenService:Create(TopTabButton.Shadow, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ImageTransparency = 0.7}):Play()

			TweenService:Create(SideTabButton.Image, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageTransparency = 0,ImageColor3 = Color3.fromRGB(205, 205, 205)}):Play()
			TweenService:Create(SideTabButton.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = .2,TextColor3 = Color3.fromRGB(205, 205, 205)}):Play()	
		end

		local function Pick()
			if Minimised then return end
			TweenService:Create(TopTabButton, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
			TweenService:Create(TopTabButton.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
			TweenService:Create(TopTabButton.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
			TweenService:Create(TopTabButton.Image, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageTransparency = 0}):Play()
			TweenService:Create(TopTabButton, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.TabBackgroundSelected}):Play()
			TweenService:Create(TopTabButton.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextColor3 = SelectedTheme.SelectedTabTextColor}):Play()
			TweenService:Create(TopTabButton.Image, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageColor3 = SelectedTheme.SelectedTabTextColor}):Play()
			TweenService:Create(TopTabButton.Shadow, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ImageTransparency = 0.9}):Play()

			TweenService:Create(SideTabButton.Image, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageTransparency = 0,ImageColor3 = Color3.fromRGB(255, 255, 255)}):Play()
			TweenService:Create(SideTabButton.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0,TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
			Elements.UIPageLayout:JumpTo(TabPage)
			for _, OtherTabButton in ipairs(TopList:GetChildren()) do
				spawn(function()
					if OtherTabButton.Name ~= "Template" and OtherTabButton.ClassName == "Frame" and OtherTabButton ~= TopTabButton and OtherTabButton.Name ~= "Placeholder" then
						TweenService:Create(OtherTabButton, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.TabBackground,BackgroundTransparency = .7}):Play()
						TweenService:Create(OtherTabButton.Image, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageColor3 = Color3.fromRGB(240, 240, 240)}):Play()
						TweenService:Create(OtherTabButton.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Transparency = 0,Color = Color3.fromRGB(85,85,85)}):Play()
						TweenService:Create(OtherTabButton.Shadow, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageTransparency = .85,ImageColor3 = Color3.fromRGB(20,20,20)}):Play()
						TweenService:Create(OtherTabButton.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextColor3 = Color3.fromRGB(240, 240, 240),TextTransparency = .2}):Play()
					end
				end)
			end
			for _,OtherTabButton in ipairs(SideList:GetChildren()) do
				spawn(function()
					if OtherTabButton.Name ~= "Template" and OtherTabButton.ClassName == "Frame" and OtherTabButton ~= SideTabButton and OtherTabButton.Name ~= "Placeholder" then
						TweenService:Create(OtherTabButton.Image, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageTransparency = 0,ImageColor3 = Color3.fromRGB(205, 205, 205)}):Play()
						TweenService:Create(OtherTabButton.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = .2,TextColor3 = Color3.fromRGB(205, 205, 205)}):Play()	
					end
				end)
			end
		end

		TopTabButton.Interact.MouseButton1Click:Connect(Pick)
		SideTabButton.Interact.MouseButton1Click:Connect(Pick)

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
    Button.Title.Font = SelectedTheme.TextFont
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
        
        if ButtonSettings.Description and DescriptionLabel and not DescriptionVisible then
            DescriptionVisible = true
            DescriptionLabel.Visible = true
            
            local NewTitleY = OriginalTitlePosition.Y.Scale
            local NewTitleYOffset = OriginalTitlePosition.Y.Offset - 15
            
            TweenService:Create(Button.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {
                Position = UDim2.new(OriginalTitlePosition.X.Scale, OriginalTitlePosition.X.Offset, NewTitleY, NewTitleYOffset)
            }):Play()
            
            local newHeight = 40 + DescriptionLabel.AbsoluteSize.Y + 12
            TweenService:Create(Button, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {
                Size = UDim2.new(0, 465, 0, newHeight)
            }):Play()
            
            TweenService:Create(DescriptionLabel, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
        end
    end)

    Button.MouseLeave:Connect(function()
        TweenService:Create(Button, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
        TweenService:Create(Button.ElementIndicator, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {TextTransparency = 0.9}):Play()
        
        if ButtonSettings.Description and DescriptionLabel and DescriptionVisible then
            DescriptionVisible = false
            
            TweenService:Create(Button.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {
                Position = OriginalTitlePosition
            }):Play()
            
            TweenService:Create(DescriptionLabel, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
            
            TweenService:Create(Button, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {
                Size = UDim2.new(0, 465, 0, 40)
            }):Play()
            
            wait(0.3)
            if not DescriptionVisible then
                DescriptionLabel.Visible = false
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
        if DescriptionLabel then
            DescriptionLabel.Text = NewDescription
            local textService = game:GetService("TextService")
            local textSize = textService:GetTextSize(NewDescription, 13, Enum.Font.Gotham, Vector2.new(400, math.huge))
            DescriptionLabel.Size = UDim2.new(0, math.min(textSize.X + 20, 420), 0, math.max(textSize.Y + 4, 20))
        elseif NewDescription then
            CreateDescriptionLabel()
        end
    end
    
    function ButtonValue:Destroy()
        if DescriptionLabel then
            DescriptionLabel:Destroy()
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
        if not ButtonValue.Locked then return end
        TweenService:Create(Button.Lock.Reason.Icon, TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {ImageTransparency = 0}):Play()
    end
    
    function ButtonValue:Unlock()
        if not ButtonValue.Locked then return end
        ButtonValue.Locked = false
        wait(0.2)
        TweenService:Create(Button.Lock.Reason.Icon, TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {ImageTransparency = 1}):Play()
        if ButtonValue.Locked then return end
        TweenService:Create(Button.Lock, TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
        TweenService:Create(Button.Lock.Reason, TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {TextTransparency = 1}):Play()
    end
    
    function ButtonValue:Visible(bool)
        Button.Visible = bool
    end

    return ButtonValue
end

		function Tab:CreateSection(SectionName,Display)

			local SectionValue = {
				Holder = ArrayField.Holding,
				Open = true
			}
			local Debounce = false
			local Section = Elements.Template.SectionTitle:Clone()
			SectionValue.Holder = Section.Holder
			Section.Title.Text = SectionName
			Section.Title.Font = SelectedTheme.TextFont
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
			TweenService:Create(Section.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()

			function SectionValue:Set(NewSection)
				Section.Title.Text = NewSection
			end
			if Display then
				Section._UIPadding_:Destroy()
				Section.Holder.Visible = false
				Section.BackgroundTransparency = 1
				SectionValue.Holder.Parent = ArrayField.Holding
				Section.Title.ImageButton.Visible = false
			end
			Section.Title.ImageButton.MouseButton1Down:Connect(function()
				if Debounce then return end
				if SectionValue.Open then
					Debounce = true
					TweenService:Create(Section._UIPadding_, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {PaddingBottom = UDim.new(0,0)}):Play()
					for _, element in ipairs(Section.Holder:GetChildren()) do
						if element.ClassName == "Frame" then
							if element.Name ~= "SectionSpacing" and element.Name ~= "Placeholder" and element.Name ~= 'Topholder' then
								if element.Name == "SectionTitle" then
									TweenService:Create(element.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
								else
									TweenService:Create(element, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
									TweenService:Create(element.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
									TweenService:Create(element.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
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
					TweenService:Create(Section.Title.ImageButton,TweenInfo.new(0.4,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{Rotation = 180}):Play()
					SectionValue.Open = false
					Debounce = false
				else
					Debounce = true
					TweenService:Create(Section._UIPadding_, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {PaddingBottom = UDim.new(0,8)}):Play()
					for _, element in ipairs(Section.Holder:GetChildren()) do
						if element.ClassName == "Frame" then
							if element.Name ~= "SectionSpacing" and element.Name ~= "Placeholder" and element.Name ~= 'Topholder' and not element:FindFirstChild('ColorPickerIs') then
								if element.Name == "SectionTitle" then
									TweenService:Create(element.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
								else
									TweenService:Create(element, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
									TweenService:Create(element.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
									TweenService:Create(element.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
								end
								for _, child in ipairs(element:GetChildren()) do
									if (child.ClassName == "Frame" or child.ClassName == "TextLabel" or child.ClassName == "TextBox" or child.ClassName == "ImageButton" or child.ClassName == "ImageLabel") then
										child.Visible = true
									end
								end
							elseif element:FindFirstChild('ColorPickerIs') then
								TweenService:Create(element, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
								TweenService:Create(element.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
								TweenService:Create(element.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
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
					TweenService:Create(Section.Title.ImageButton,TweenInfo.new(0.4,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{Rotation = 0}):Play()
					SectionValue.Open = true
					wait(.3)
					Debounce = false
				end
			end)
			SDone = true
			function SectionValue:Lock(Reason)

			end
			function SectionValue:Unlock(Reason)

			end

			return SectionValue
		end

		function Tab:CreateSpacing(SectionParent,Size)
			local Spacing = Elements.Template.SectionSpacing:Clone()
			Spacing.Visible = true
			Spacing.Parent = TabPage

			Spacing.Size = UDim2.fromOffset(475,Size or 6)

			if SectionParent then
				Spacing.Parent = SectionParent.Holder
			else
				Spacing.Parent = TabPage
			end
		end

function Tab:CreateLabel(LabelSettings, SectionParent)
    local LabelValue = {}
    
    local labelText, iconName
    if typeof(LabelSettings) == "table" then
        labelText = LabelSettings[1] or ""
        iconName = LabelSettings[2]
    else
        labelText = LabelSettings or ""
    end

    local Label = Elements.Template.Label:Clone()
    Label.Title.Text = labelText
    Label.Title.Font = SelectedTheme.TextFont
    
    Label.Title.RichText = true
    Label.Title.TextWrapped = true
    Label.Title.TextScaled = false
    
    Label.Visible = true
    
    local iconLabel = nil
    if iconName then
        iconLabel = Instance.new("ImageLabel")
        iconLabel.Name = "LabelIcon"
        iconLabel.Size = UDim2.new(0, 20, 0, 20)
        iconLabel.Position = UDim2.new(0, 20, 0.5, -10)
        iconLabel.BackgroundTransparency = 1
        iconLabel.ImageColor3 = SelectedTheme.TextColor
        iconLabel.Parent = Label
        
        if typeof(iconName) == "string" and not tonumber(iconName) then
            local success, asset = pcall(getIcon, iconName)
            if success then
                iconLabel.Image = "rbxassetid://" .. asset.id
                iconLabel.ImageRectOffset = asset.imageRectOffset
                iconLabel.ImageRectSize = asset.imageRectSize
            else
                iconLabel.Image = "rbxassetid://3944680095"
            end
        else
            iconLabel.Image = "rbxassetid://" .. tostring(iconName)
            iconLabel.ImageRectOffset = Vector2.new(0, 0)
            iconLabel.ImageRectSize = Vector2.new(0, 0)
        end
        
        Label.Title.TextXAlignment = Enum.TextXAlignment.Left
        local padding = Instance.new("UIPadding")
        padding.PaddingLeft = UDim.new(0, 38)
        padding.Parent = Label.Title
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

    Label.BackgroundColor3 = SelectedTheme.SecondaryElementBackground
    Label.UIStroke.Color = SelectedTheme.SecondaryElementStroke

    local function UpdateLabelSize()
        wait()
        local textHeight = Label.Title.TextBounds.Y
        local finalHeight = math.max(textHeight + 20, 40)
        
        if SectionParent then
            Label.Size = UDim2.new(1, -10, 0, finalHeight)
        else
            Label.Size = UDim2.new(0, 465, 0, finalHeight)
        end
    end

    UpdateLabelSize()

    TweenService:Create(Label, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
    TweenService:Create(Label.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
    TweenService:Create(Label.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()

    function LabelValue:Set(NewLabelSettings)
        local newText, newIcon
        if typeof(NewLabelSettings) == "table" then
            newText = NewLabelSettings[1] or ""
            newIcon = NewLabelSettings[2]
        else
            newText = NewLabelSettings or ""
        end
        
        Label.Title.Text = newText
        
        if newIcon and not iconLabel then
            iconLabel = Instance.new("ImageLabel")
            iconLabel.Name = "LabelIcon"
            iconLabel.Size = UDim2.new(0, 20, 0, 20)
            iconLabel.Position = UDim2.new(0, 12, 0.5, -10)
            iconLabel.BackgroundTransparency = 1
            iconLabel.ImageColor3 = SelectedTheme.TextColor
            iconLabel.Parent = Label
            
            Label.Title.TextXAlignment = Enum.TextXAlignment.Left
            if not Label.Title:FindFirstChild("UIPadding") then
                local padding = Instance.new("UIPadding")
                padding.Parent = Label.Title
            end
            Label.Title.UIPadding.PaddingLeft = UDim.new(0, 38)
        elseif not newIcon and iconLabel then
            iconLabel:Destroy()
            iconLabel = nil
            if Label.Title:FindFirstChild("UIPadding") then
                Label.Title.UIPadding.PaddingLeft = UDim.new(0, 0)
            end
        end
        
        if iconLabel and newIcon then
            if typeof(newIcon) == "string" and not tonumber(newIcon) then
                local success, asset = pcall(getIcon, newIcon)
                if success then
                    iconLabel.Image = "rbxassetid://" .. asset.id
                    iconLabel.ImageRectOffset = asset.imageRectOffset
                    iconLabel.ImageRectSize = asset.imageRectSize
                else
                    iconLabel.Image = "rbxassetid://3944680095"
                end
            else
                iconLabel.Image = "rbxassetid://" .. tostring(newIcon)
                iconLabel.ImageRectOffset = Vector2.new(0, 0)
                iconLabel.ImageRectSize = Vector2.new(0, 0)
            end
        end
        
        UpdateLabelSize()
    end

    return LabelValue
end

function Tab:CreateParagraph(ParagraphSettings, SectionParent)
    local ParagraphValue = {}
    
    local Paragraph = Elements.Template.Paragraph:Clone()
    Paragraph.Title.Text = ParagraphSettings.Title
    Paragraph.Title.Font = SelectedTheme.TextFont
    Paragraph.Content.Text = ParagraphSettings.Content
    Paragraph.Visible = true
    Paragraph.Content.RichText = true

    Tab.Elements[ParagraphSettings.Title] = {
        type = 'paragraph',
        section = SectionParent or ParagraphSettings.SectionParent,
        element = Paragraph
    }

    if SectionParent then
        Paragraph.Parent = SectionParent.Holder
    elseif ParagraphSettings.SectionParent and ParagraphSettings.SectionParent.Holder then
        Paragraph.Parent = ParagraphSettings.SectionParent.Holder
    else
        Paragraph.Parent = TabPage
    end

    Paragraph.Content.TextWrapped = true

    local function UpdateParagraphSize()
        local currentText = Paragraph.Content.Text
        Paragraph.Content.Text = currentText

        local textHeight = Paragraph.Content.TextBounds.Y

        textHeight = textHeight + 5
        
        if Paragraph.Parent == TabPage then
            Paragraph.Content.Size = UDim2.new(0, 438, 0, textHeight)
            Paragraph.Size = UDim2.new(0, 465, 0, textHeight + 40)
        else
            Paragraph.Content.Size = UDim2.new(0, 438, 0, textHeight)
            Paragraph.Size = UDim2.new(1, -10, 0, textHeight + 40)
        end
    end

    UpdateParagraphSize()

    Paragraph.BackgroundTransparency = 1
    Paragraph.UIStroke.Transparency = 1
    Paragraph.Title.TextTransparency = 1
    Paragraph.Content.TextTransparency = 1

    Paragraph.BackgroundColor3 = SelectedTheme.SecondaryElementBackground
    Paragraph.UIStroke.Color = SelectedTheme.SecondaryElementStroke
    
    TweenService:Create(Paragraph, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
    TweenService:Create(Paragraph.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
    TweenService:Create(Paragraph.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
    TweenService:Create(Paragraph.Content, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()

    function ParagraphValue:Set(NewParagraphSettings)
        Paragraph.Title.Text = NewParagraphSettings.Title
        Paragraph.Content.Text = NewParagraphSettings.Content

        UpdateParagraphSize()
    end
    
    return ParagraphValue
end      

function Tab:CreateInput(InputSettings)
    local Input = Elements.Template.Input:Clone()
    Input.Name = InputSettings.Name
    Input.Title.Text = InputSettings.Name
    Input.Title.Font = SelectedTheme.TextFont
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
    Input.InputFrame.BackgroundColor3 = SelectedTheme.InputBackground
    Input.InputFrame.UIStroke.Color = SelectedTheme.InputStroke
    
    local DescriptionLabel = nil
    local DescriptionVisible = false
    local OriginalTitlePosition = Input.Title.Position
    
    local function CreateDescriptionLabel()
        if not InputSettings.Description then return end
        
        DescriptionLabel = Instance.new("TextLabel")
        DescriptionLabel.Name = "DescriptionText"
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
        
        local textService = game:GetService("TextService")
        local textSize = textService:GetTextSize(InputSettings.Description, 13, Enum.Font.Gotham, Vector2.new(400, math.huge))
        
        DescriptionLabel.Size = UDim2.new(0, math.min(textSize.X + 20, 420), 0, math.max(textSize.Y + 4, 20))
        DescriptionLabel.Position = UDim2.new(0, 15, 0.46, 0)
    end
    
    if InputSettings.Description then
        CreateDescriptionLabel()
    end
    
    TweenService:Create(Input, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
    TweenService:Create(Input.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
    TweenService:Create(Input.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
    
    Input.InputFrame.InputBox.PlaceholderText = InputSettings.PlaceholderText
    Input.InputFrame.Size = UDim2.new(0, Input.InputFrame.InputBox.TextBounds.X + 24, 0, 30)

    local InputButton = Instance.new("TextButton")
    InputButton.Name = "InputButton"
    InputButton.BackgroundTransparency = 1
    InputButton.Size = UDim2.new(1, 0, 1, 0)
    InputButton.Text = ""
    InputButton.ZIndex = 10
    InputButton.Parent = Main.Elements

    InputButton.MouseButton1Click:Connect(function()
        if not InputSettings.Locked then
            Input.InputFrame.InputBox:CaptureFocus()
        end
    end)
    
    InputButton.TouchTap:Connect(function()
        if not InputSettings.Locked then
            Input.InputFrame.InputBox:CaptureFocus()
        end
    end)
    
    if InputSettings.NumbersOnly or InputSettings.CharacterLimit then
        Input.InputFrame.InputBox:GetPropertyChangedSignal('Text'):Connect(function()
            if Input.InputFrame.InputBox.Text == '' then return end
            if InputSettings.CharacterLimit then
                Input.InputFrame.InputBox.Text = Input.InputFrame.InputBox.Text:sub(1, InputSettings.CharacterLimit)
            end
            if InputSettings.NumbersOnly then
                Input.InputFrame.InputBox.Text = Input.InputFrame.InputBox.Text:gsub('%D+', '')
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
            wait(0.5)
            Input.Title.Text = InputSettings.Name
            TweenService:Create(Input, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
            TweenService:Create(Input.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
        end
        
        if InputSettings.RemoveTextAfterFocusLost then
            Input.InputFrame.InputBox.Text = ""
        end
        
        SaveConfiguration()
    end)
    
    Input.MouseEnter:Connect(function()
        TweenService:Create(Input, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
        
        if InputSettings.Description and DescriptionLabel and not DescriptionVisible then
            DescriptionVisible = true
            DescriptionLabel.Visible = true
            
            local NewTitleY = OriginalTitlePosition.Y.Scale
            local NewTitleYOffset = OriginalTitlePosition.Y.Offset - 15
            
            TweenService:Create(Input.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {
                Position = UDim2.new(OriginalTitlePosition.X.Scale, OriginalTitlePosition.X.Offset, NewTitleY, NewTitleYOffset)
            }):Play()
            
            local newHeight = 40 + DescriptionLabel.AbsoluteSize.Y + 12
            TweenService:Create(Input, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {
                Size = UDim2.new(0, 465, 0, newHeight)
            }):Play()
            
            TweenService:Create(DescriptionLabel, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
        end
    end)
    
    Input.MouseLeave:Connect(function()
        TweenService:Create(Input, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
        
        if InputSettings.Description and DescriptionLabel and DescriptionVisible then
            DescriptionVisible = false
            
            TweenService:Create(Input.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {
                Position = OriginalTitlePosition
            }):Play()
            
            TweenService:Create(DescriptionLabel, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
            
            TweenService:Create(Input, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {
                Size = UDim2.new(0, 465, 0, 40)
            }):Play()
            
            wait(0.3)
            if not DescriptionVisible then
                DescriptionLabel.Visible = false
            end
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
    
    function InputSettings:Destroy()
        Input:Destroy()
    end
    
    function InputSettings:Lock(Reason)
        if InputSettings.Locked then return end
        InputSettings.Locked = true
        Input.Lock.Reason.Text = Reason or 'Locked'
        TweenService:Create(Input.Lock, TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundTransparency = 0}):Play()
        TweenService:Create(Input.Lock.Reason, TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {TextTransparency = 0}):Play()
        wait(0.2)
        if not InputSettings.Locked then return end
        TweenService:Create(Input.Lock.Reason.Icon, TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {ImageTransparency = 0}):Play()
    end
    
    function InputSettings:Unlock()
        if not InputSettings.Locked then return end
        InputSettings.Locked = false
        wait(0.2)
        TweenService:Create(Input.Lock.Reason.Icon, TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {ImageTransparency = 1}):Play()
        if InputSettings.Locked then return end
        TweenService:Create(Input.Lock, TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
        TweenService:Create(Input.Lock.Reason, TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {TextTransparency = 1}):Play()
    end
    
    function InputSettings:Visible(bool)
        Input.Visible = bool
    end
    
    return InputSettings
end

function Tab:CreateDropdown(DropdownSettings)
    local Dropdown = Elements.Template.Dropdown:Clone()
    local SearchBar = Dropdown.List["-SearchBar"]
    local Required = 1
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
    
    DropdownSettings.Items = {
        Selected = {Default = DropdownSettings.Selected or nil}
    }
    DropdownSettings.Locked = false
    local Multi = DropdownSettings.MultiSelection or false
    if string.find(DropdownSettings.Name,"closed") then
        Dropdown.Name = "Dropdown"
    else
        Dropdown.Name = DropdownSettings.Name
    end
    Dropdown.Title.Text = DropdownSettings.Name
    Dropdown.Title.Font = SelectedTheme.TextFont
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

	Dropdown.Size = UDim2.new(0,465, 0, 44)

	TweenService:Create(Dropdown, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
	TweenService:Create(Dropdown.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
	TweenService:Create(Dropdown.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()	

	for _, ununusedoption in ipairs(Dropdown.List:GetChildren()) do
		if ununusedoption.ClassName == "Frame" and ununusedoption.Name ~= 'PlaceHolder' and ununusedoption.Name ~= "-SearchBar" then
			ununusedoption:Destroy()
		end
	end

	Dropdown.Toggle.Rotation = 180

	local function RefreshSelected()
		if #DropdownSettings.Items.Selected > 1 then
			local NT = {}
			for _,kj in ipairs(DropdownSettings.Items.Selected) do
				NT[#NT+1] = kj.Option.Name
			end
			Dropdown.Selected.Text = table.concat(NT, ", ")
		elseif DropdownSettings.Items.Selected[1] then
			Dropdown.Selected.Text = DropdownSettings.Items.Selected[1].Option.Name
		else
			Dropdown.Selected.Text = "Select an option"
		end
	end

	Dropdown.Interact.MouseButton1Click:Connect(function()
		if DropdownSettings.Locked then return end
		TweenService:Create(Dropdown, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
		TweenService:Create(Dropdown.UIStroke, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
		wait(0.1)
		TweenService:Create(Dropdown, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
		TweenService:Create(Dropdown.UIStroke, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
		if Debounce then return end
		if Dropdown.List.Visible then
			Debounce = true
			TweenService:Create(Dropdown, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Size = UDim2.new(0,465, 0, 44)}):Play()
			for _, DropdownOpt in ipairs(Dropdown.List:GetChildren()) do
				if DropdownOpt.ClassName == "Frame" and DropdownOpt.Name ~= 'PlaceHolder' and DropdownOpt~= SearchBar then
					TweenService:Create(DropdownOpt, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
					TweenService:Create(DropdownOpt.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
					TweenService:Create(DropdownOpt.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
				end
			end
			TweenService:Create(Dropdown.List, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ScrollBarImageTransparency = 1}):Play()
			TweenService:Create(Dropdown.Toggle, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Rotation = 180}):Play()    
			wait(0.35)
			Dropdown.List.Visible = false
			Debounce = false
		else
			TweenService:Create(Dropdown, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Size = UDim2.new(0,465, 0, 178)}):Play()
			Dropdown.List.Visible = true
			TweenService:Create(Dropdown.List, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ScrollBarImageTransparency = 0.7}):Play()
			TweenService:Create(Dropdown.Toggle, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Rotation = 0}):Play()    

			SearchBar.Input.Text = ""
			TweenService:Create(SearchBar, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
			TweenService:Create(SearchBar.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
			TweenService:Create(SearchBar.Input, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()

			for _, DropdownOpt in ipairs(Dropdown.List:GetChildren()) do
				if DropdownOpt.ClassName == "Frame" and DropdownOpt.Name ~= 'PlaceHolder' and DropdownOpt ~= SearchBar then
					TweenService:Create(DropdownOpt, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
					TweenService:Create(DropdownOpt.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
					TweenService:Create(DropdownOpt.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
				end
			end
		end
	end)

	Dropdown.List['-SearchBar'].Input:GetPropertyChangedSignal('Text'):Connect(function()
		local InputText=string.upper(Dropdown.List['-SearchBar'].Input.Text)
		for _,item in ipairs(Dropdown.List:GetChildren()) do
			if item:IsA('Frame') and item.Name ~= 'Template' and item ~= SearchBar and item.Name ~= 'PlaceHolder' then
				if InputText=="" or InputText==" "or string.find(string.upper(item.Name),InputText)~=nil then
					TweenService:Create(item, TweenInfo.new(0.15, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
					TweenService:Create(item.UIStroke, TweenInfo.new(0.15, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
					TweenService:Create(item.Title, TweenInfo.new(0.15, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
				else
					TweenService:Create(item, TweenInfo.new(0.15, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
					TweenService:Create(item.UIStroke, TweenInfo.new(0.15, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
					TweenService:Create(item.Title, TweenInfo.new(0.15, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
				end
			end
		end
	end)

	Dropdown.MouseEnter:Connect(function()
		if not Dropdown.List.Visible then
			TweenService:Create(Dropdown, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
		end
	end)

	Dropdown.MouseLeave:Connect(function()
		TweenService:Create(Dropdown, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
	end)

	local function Error(text)
		TweenService:Create(Dropdown, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = Color3.fromRGB(85, 0, 0)}):Play()
		TweenService:Create(Dropdown.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
		Dropdown.Title.Text = text
		wait(0.5)
		Dropdown.Title.Text = DropdownSettings.Name
		TweenService:Create(Dropdown, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
		TweenService:Create(Dropdown.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
	end

	local function AddOption(Option,Selecteds)
		local DropdownOption = Elements.Template.Dropdown.List.Template:Clone()
		DropdownOption:GetPropertyChangedSignal('BackgroundTransparency'):Connect(function()
			if DropdownOption.BackgroundTransparency == 1 then
				DropdownOption.Visible = false
			else
				DropdownOption.Visible = true
			end
		end)
		DropdownSettings.Items[Option] = {
			Option = DropdownOption,
			Selected = false
		}
		local OptionInTable = DropdownSettings.Items[Option]
		DropdownOption.Name = Option.Name or Option
		DropdownOption.Title.Text = Option.Name or Option
		DropdownOption.Title.Font = SelectedTheme.TextFont
		DropdownOption.Parent = Dropdown.List
		DropdownOption.Visible = true
		local IsSelected = OptionInTable.Selected
		if Selecteds and #Selecteds > 0 then
			if typeof(Selecteds) == 'string' then
				Selecteds = {Selecteds}
			end
			for index,Selected in pairs(Selecteds) do
				if Selected == Option then
					IsSelected = true
					OptionInTable.Selected = true
					table.insert(DropdownSettings.Items.Selected,OptionInTable)
					DropdownSettings.Items.Selected[table.find(DropdownSettings.Items.Selected,OptionInTable)].Selected = true
				end
			end
			RefreshSelected()
		end

		if IsSelected then
			DropdownOption.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
		end

		if Dropdown.Visible then
			DropdownOption.BackgroundTransparency = 0
			DropdownOption.UIStroke.Transparency = 0
			DropdownOption.Title.TextTransparency = 0
		else
			DropdownOption.BackgroundTransparency = 1
			DropdownOption.UIStroke.Transparency = 1
			DropdownOption.Title.TextTransparency = 1
		end

		DropdownOption.Interact.ZIndex = 50
		DropdownOption.Interact.MouseButton1Click:Connect(function()
			if DropdownSettings.Locked then return end
			if OptionInTable.Selected then
				OptionInTable.Selected = false
				table.remove(DropdownSettings.Items.Selected,table.find(DropdownSettings.Items.Selected,OptionInTable))
				RefreshSelected()
				TweenService:Create(DropdownOption, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundColor3 = Color3.fromRGB(30, 30, 30)}):Play()
				SaveConfiguration()
				return
			end
			if not Multi and DropdownSettings.Items.Selected[1] then
				DropdownSettings.Items.Selected[1].Selected = false
				TweenService:Create(DropdownSettings.Items.Selected[1].Option, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundColor3 = Color3.fromRGB(30, 30, 30)}):Play()
			end
			if not (Multi) then
				DropdownSettings.Items.Selected = {OptionInTable}
				Dropdown.Selected.Text = Option.Name or Option
			else
				table.insert(DropdownSettings.Items.Selected,OptionInTable)
				RefreshSelected()
			end

			local Success, Response = pcall(function()
				DropdownSettings.Callback(Option)
			end)
			if not Success then
				Error('Callback Error')
				print("ArrayField | "..DropdownSettings.Name.." Callback Error " ..tostring(Response))
			end

			OptionInTable.Selected = true

			if not (Multi) then
				for _,op in ipairs(DropdownSettings.Items.Selected) do
					TweenService:Create(op.Option, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundColor3 = Color3.fromRGB(30, 30, 30)}):Play()
				end
			end
			TweenService:Create(DropdownOption.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
			TweenService:Create(DropdownOption, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundColor3 = Color3.fromRGB(40, 40, 40)}):Play()
			Debounce = true
			wait(0.2)
			TweenService:Create(DropdownOption.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
			wait(0.1)
			if not Multi then
				TweenService:Create(Dropdown, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Size = UDim2.new(0,465, 0, 45)}):Play()
				for _, DropdownOpt in ipairs(Dropdown.List:GetChildren()) do
					if DropdownOpt.ClassName == "Frame" and DropdownOpt.Name ~= "PlaceHolder" and DropdownOpt ~= SearchBar then
						TweenService:Create(DropdownOpt, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
						TweenService:Create(DropdownOpt.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
						TweenService:Create(DropdownOpt.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
					end
				end
				TweenService:Create(Dropdown.List, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ScrollBarImageTransparency = 1}):Play()
				TweenService:Create(Dropdown.Toggle, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Rotation = 180}):Play()	
				wait(0.35)
				Dropdown.List.Visible = false

			end
			Debounce = false
			SaveConfiguration()
		end)
	end
	local function AddOptions(Options,Selected)
		if typeof(Options) == 'table' then
			for _, Option in ipairs(Options) do
				AddOption(Option,Selected)
			end
		else
			AddOption(Options,Selected)
		end
		if Settings.ConfigurationSaving then
			if Settings.ConfigurationSaving.Enabled and DropdownSettings.Flag then
				ArrayFieldLibrary.Flags[DropdownSettings.Flag] = DropdownSettings
			end
		end
	end
	function DropdownSettings:Add(Items,Selected)
		AddOptions(Items,Selected)
	end

	AddOptions(DropdownSettings.Options,DropdownSettings.CurrentOption)

	function DropdownSettings:Set(NewOption)

		for _,o in pairs(NewOption) do

			if typeof(NewOption) == 'table' then

				DropdownSettings.Items.Selected = NewOption
			else
				DropdownSettings.Items.Selected = {NewOption}
			end
			local Success, Response = pcall(function()
				DropdownSettings.Callback(NewOption)
			end)
			if not Success then
				TweenService:Create(Dropdown, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = Color3.fromRGB(85, 0, 0)}):Play()
				TweenService:Create(Dropdown.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
				Dropdown.Title.Text = "Callback Error"
				print("ArrayField | "..DropdownSettings.Name.." Callback Error " ..tostring(Response))
				wait(0.5)
				Dropdown.Title.Text = DropdownSettings.Name
				TweenService:Create(Dropdown, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
				TweenService:Create(Dropdown.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
			end
			if DropdownSettings.Items[NewOption] then
				local DropdownOption =  DropdownSettings.Items[NewOption]
				DropdownOption.BackgroundColor3 = Color3.fromRGB(40, 40, 40)

				if Dropdown.Visible then
					DropdownOption.BackgroundTransparency = 0
					DropdownOption.UIStroke.Transparency = 0
					DropdownOption.Title.TextTransparency = 0
				else
					DropdownOption.BackgroundTransparency = 1
					DropdownOption.UIStroke.Transparency = 1
					DropdownOption.Title.TextTransparency = 1
				end

			end
		end
	end
	function DropdownSettings:Error(text)
		Error(text)
	end
	function DropdownSettings:Refresh(NewOptions,Selecteds)
		DropdownSettings.Items = {}
		DropdownSettings.Items.Selected = {}
		for _, option in ipairs(Dropdown.List:GetChildren()) do
			if option.ClassName == "Frame" and option ~= SearchBar and option.Name ~= "Placeholder" then
				option:Destroy()
			end
		end
		AddOptions(NewOptions,Selecteds)
	end
	function DropdownSettings:Remove(Item)
		if Item.Name ~= "Placeholder" and Item ~= SearchBar then
			if DropdownSettings.Items[Item] then
				DropdownSettings.Items[Item].Option:Destroy()
				table.remove(DropdownSettings.Items,table.find(DropdownSettings.Items,Item))
			else
				Error('Option not found.')
			end
		else
			SearchBar:Destroy()
			Error("why you trynna remove the searchbar? FINE")
		end
		if Dropdown.Selected.Text == Item then
			Dropdown.Selected.Text = ''
		end
	end

	function DropdownSettings:Destroy()
		Dropdown:Destroy()
	end
	function DropdownSettings:Lock(Reason)
		if DropdownSettings.Locked then return end
		DropdownSettings.Locked = true
		Debounce = true
		TweenService:Create(Dropdown, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Size = UDim2.new(0,465, 0, 44)}):Play()
		for _, DropdownOpt in ipairs(Dropdown.List:GetChildren()) do
			if DropdownOpt.ClassName == "Frame" and DropdownOpt.Name ~= 'PlaceHolder' and DropdownOpt.Name ~= "-SearchBar" then
				TweenService:Create(DropdownOpt, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
				TweenService:Create(DropdownOpt.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
				TweenService:Create(DropdownOpt.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
			end
		end
		TweenService:Create(Dropdown.List, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ScrollBarImageTransparency = 1}):Play()
		TweenService:Create(Dropdown.Toggle, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Rotation = 180}):Play()	
		wait(0.35)
		Dropdown.List.Visible = false
		Debounce = false
		Dropdown.Lock.Reason.Text = Reason or 'Locked'
		TweenService:Create(Dropdown.Lock,TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{BackgroundTransparency = 0}):Play()
		TweenService:Create(Dropdown.Lock.Reason,TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{TextTransparency = 0}):Play()
		wait(0.2)
		if not DropdownSettings.Locked then return end
		TweenService:Create(Dropdown.Lock.Reason.Icon,TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{ImageTransparency = 0}):Play()
	end
	function DropdownSettings:Unlock()
		if not DropdownSettings.Locked then return end
		DropdownSettings.Locked = false
		wait(0.2)
		TweenService:Create(Dropdown.Lock.Reason.Icon,TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{ImageTransparency = 1}):Play()
		if DropdownSettings.Locked then return end
		TweenService:Create(Dropdown.Lock,TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{BackgroundTransparency = 1}):Play()
		TweenService:Create(Dropdown.Lock.Reason,TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{TextTransparency = 1}):Play()
	end
	function DropdownSettings:Visible(bool)
		Dropdown.Visible = bool
	end
	return DropdownSettings
end

		function Tab:CreateKeybind(KeybindSettings)
			local CheckingForKey = false
			local Keybind = Elements.Template.Keybind:Clone()
			Keybind.Name = KeybindSettings.Name
			Keybind.Title.Text = KeybindSettings.Name
			Keybind.Title.Font = SelectedTheme.TextFont
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

			Keybind.KeybindFrame.BackgroundColor3 = SelectedTheme.InputBackground
			Keybind.KeybindFrame.UIStroke.Color = SelectedTheme.InputStroke

			TweenService:Create(Keybind, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
			TweenService:Create(Keybind.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
			TweenService:Create(Keybind.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()	

			Keybind.KeybindFrame.KeybindBox.Text = KeybindSettings.CurrentKeybind
			Keybind.KeybindFrame.Size = UDim2.new(0, Keybind.KeybindFrame.KeybindBox.TextBounds.X + 24, 0, 30)

			Keybind.KeybindFrame.KeybindBox.Focused:Connect(function()
				if KeybindSettings.Locked then
					Keybind.KeybindFrame.KeybindBox:ReleaseFocus() return
				end
				CheckingForKey = true
				Keybind.KeybindFrame.KeybindBox.Text = ""
			end)
			Keybind.KeybindFrame.KeybindBox.FocusLost:Connect(function()
				CheckingForKey = false
				if Keybind.KeybindFrame.KeybindBox.Text == nil or "" then
					Keybind.KeybindFrame.KeybindBox.Text = KeybindSettings.CurrentKeybind
					SaveConfiguration()
				end
			end)

			Keybind.MouseEnter:Connect(function()
				TweenService:Create(Keybind, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
			end)

			Keybind.MouseLeave:Connect(function()
				TweenService:Create(Keybind, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
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
							wait(0.5)
							Keybind.Title.Text = KeybindSettings.Name
							TweenService:Create(Keybind, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
							TweenService:Create(Keybind.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
						end
					else
						wait(0.25)
						if Held then
							local Loop; Loop = RunService.Stepped:Connect(function()
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
			function KeybindSettings:Destroy()
				Keybind:Destroy()
			end
			function KeybindSettings:Lock(Reason)
				if KeybindSettings.Locked then return end
				KeybindSettings.Locked = true
				Keybind.Lock.Reason.Text = Reason or 'Locked'
				TweenService:Create(Keybind.Lock,TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{BackgroundTransparency = 0}):Play()
				TweenService:Create(Keybind.Lock.Reason,TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{TextTransparency = 0}):Play()
				wait(0.2)
				if not KeybindSettings.Locked then return end
				TweenService:Create(Keybind.Lock.Reason.Icon,TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{ImageTransparency = 0}):Play()
			end
			function KeybindSettings:Unlock()
				if not KeybindSettings.Locked then return end
				KeybindSettings.Locked = false
				wait(0.2)
				TweenService:Create(Keybind.Lock.Reason.Icon,TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{ImageTransparency = 1}):Play()
				if KeybindSettings.Locked then return end
				TweenService:Create(Keybind.Lock,TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{BackgroundTransparency = 1}):Play()
				TweenService:Create(Keybind.Lock.Reason,TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{TextTransparency = 1}):Play()
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

function Tab:CreateToggle(ToggleSettings)

    local Toggle = Elements.Template.Toggle:Clone()
    Toggle.Name = ToggleSettings.Name
    Toggle.Title.Text = ToggleSettings.Name
    Toggle.Title.Font = SelectedTheme.TextFont
    Toggle.Visible = true

    Toggle.BackgroundTransparency = 1
    Toggle.UIStroke.Transparency = 1
    Toggle.Title.TextTransparency = 1
    Toggle.Switch.BackgroundColor3 = SelectedTheme.ToggleBackground
    Tab.Elements[Toggle.Name] = {
        type = 'toggle',
        section = ToggleSettings.SectionParent,
        element = Toggle
    }
    
    if ToggleSettings.SectionParent then
        Toggle.Parent = ToggleSettings.SectionParent.Holder
    else
        Toggle.Parent = TabPage
    end
    if SelectedTheme ~= ArrayFieldLibrary.Theme.Default then
        Toggle.Switch.Shadow.Visible = false
    end
    ToggleSettings.Locked = false
    TweenService:Create(Toggle, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
    TweenService:Create(Toggle.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
    TweenService:Create(Toggle.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()	

    local DescriptionLabel = nil
    local DescriptionVisible = false
    local OriginalTitlePosition = Toggle.Title.Position
    
    local function CreateDescriptionLabel()
        if not ToggleSettings.Description then return end
        
        DescriptionLabel = Instance.new("TextLabel")
        DescriptionLabel.Name = "DescriptionText"
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
        
        local textService = game:GetService("TextService")
        local textSize = textService:GetTextSize(ToggleSettings.Description, 13, Enum.Font.Gotham, Vector2.new(400, math.huge))
        
        DescriptionLabel.Size = UDim2.new(0, math.min(textSize.X + 20, 420), 0, math.max(textSize.Y + 4, 20))
        DescriptionLabel.Position = UDim2.new(0, 15, 0.46, 0)
    end
    
    if ToggleSettings.Description then
        CreateDescriptionLabel()
    end

    if not ToggleSettings.CurrentValue then
        Toggle.Switch.Indicator.Position = UDim2.new(1, -40, 0.5, 0)
        Toggle.Switch.Indicator.UIStroke.Color = SelectedTheme.ToggleDisabledStroke
        Toggle.Switch.Indicator.BackgroundColor3 = SelectedTheme.ToggleDisabled
        Toggle.Switch.UIStroke.Color = SelectedTheme.ToggleDisabledOuterStroke
    else
        Toggle.Switch.Indicator.Position = UDim2.new(1, -20, 0.5, 0)
        Toggle.Switch.Indicator.UIStroke.Color = SelectedTheme.ToggleEnabledStroke
        Toggle.Switch.Indicator.BackgroundColor3 = SelectedTheme.ToggleEnabled
        Toggle.Switch.UIStroke.Color = SelectedTheme.ToggleEnabledOuterStroke
    end

    Toggle.MouseEnter:Connect(function()
        TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
        
        if ToggleSettings.Description and DescriptionLabel and not DescriptionVisible then
            DescriptionVisible = true
            DescriptionLabel.Visible = true
            
            local NewTitleY = OriginalTitlePosition.Y.Scale
            local NewTitleYOffset = OriginalTitlePosition.Y.Offset - 15
            
            TweenService:Create(Toggle.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {
                Position = UDim2.new(OriginalTitlePosition.X.Scale, OriginalTitlePosition.X.Offset, NewTitleY, NewTitleYOffset)
            }):Play()
            
            local newHeight = 40 + DescriptionLabel.AbsoluteSize.Y + 12
            TweenService:Create(Toggle, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {
                Size = UDim2.new(0, 465, 0, newHeight)
            }):Play()
            
            TweenService:Create(DescriptionLabel, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
        end
    end)

    Toggle.MouseLeave:Connect(function()
        TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
        
        if ToggleSettings.Description and DescriptionLabel and DescriptionVisible then
            DescriptionVisible = false
            
            TweenService:Create(Toggle.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {
                Position = OriginalTitlePosition
            }):Play()
            
            TweenService:Create(DescriptionLabel, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
            
            TweenService:Create(Toggle, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {
                Size = UDim2.new(0, 465, 0, 40)
            }):Play()
            
            wait(0.3)
            if not DescriptionVisible then
                DescriptionLabel.Visible = false
            end
        end
    end)

    Toggle.Interact.MouseButton1Click:Connect(function()
        if ToggleSettings.Locked then return end
        if ToggleSettings.CurrentValue then
            ToggleSettings.CurrentValue = false
            TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
            TweenService:Create(Toggle.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
            TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.45, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2.new(1, -40, 0.5, 0)}):Play()
            TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0,12,0,12)}):Play()
            TweenService:Create(Toggle.Switch.Indicator.UIStroke, TweenInfo.new(0.55, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Color = SelectedTheme.ToggleDisabledStroke}):Play()
            TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.8, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundColor3 = SelectedTheme.ToggleDisabled}):Play()
            TweenService:Create(Toggle.Switch.UIStroke, TweenInfo.new(0.55, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Color = SelectedTheme.ToggleDisabledOuterStroke}):Play()
            wait(0.05)
            TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0,17,0,17)}):Play()
            wait(0.15)
            TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
            TweenService:Create(Toggle.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 0}):Play()	
        else
            ToggleSettings.CurrentValue = true
            TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
            TweenService:Create(Toggle.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
            TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2.new(1, -20, 0.5, 0)}):Play()
            TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0,12,0,12)}):Play()
            TweenService:Create(Toggle.Switch.Indicator.UIStroke, TweenInfo.new(0.55, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Color = SelectedTheme.ToggleEnabledStroke}):Play()
            TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.8, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundColor3 = SelectedTheme.ToggleEnabled}):Play()
            TweenService:Create(Toggle.Switch.UIStroke, TweenInfo.new(0.55, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Color = SelectedTheme.ToggleEnabledOuterStroke}):Play()
            wait(0.05)
            TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.45, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0,17,0,17)}):Play()	
            wait(0.15)
            TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
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
            wait(0.5)
            Toggle.Title.Text = ToggleSettings.Name
            TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
            TweenService:Create(Toggle.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
        end

        SaveConfiguration()
    end)
    
    function ToggleSettings:Set(NewToggleValue)
        if NewToggleValue then
            ToggleSettings.CurrentValue = true
            TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
            TweenService:Create(Toggle.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
            TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2.new(1, -20, 0.5, 0)}):Play()
            TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0,12,0,12)}):Play()
            TweenService:Create(Toggle.Switch.Indicator.UIStroke, TweenInfo.new(0.55, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Color = SelectedTheme.ToggleEnabledStroke}):Play()
            TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.8, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundColor3 = SelectedTheme.ToggleEnabled}):Play()
            TweenService:Create(Toggle.Switch.UIStroke, TweenInfo.new(0.55, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Color = Color3.fromRGB(100,100,100)}):Play()
            wait(0.05)
            TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.45, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0,17,0,17)}):Play()	
            wait(0.15)
            TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
            TweenService:Create(Toggle.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 0}):Play()	
        else
            ToggleSettings.CurrentValue = false
            TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
            TweenService:Create(Toggle.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
            TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.45, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2.new(1, -40, 0.5, 0)}):Play()
            TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0,12,0,12)}):Play()
            TweenService:Create(Toggle.Switch.Indicator.UIStroke, TweenInfo.new(0.55, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Color = SelectedTheme.ToggleDisabledStroke}):Play()
            TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.8, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundColor3 = SelectedTheme.ToggleDisabled}):Play()
            TweenService:Create(Toggle.Switch.UIStroke, TweenInfo.new(0.55, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Color = Color3.fromRGB(65,65,65)}):Play()
            wait(0.05)
            TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0,17,0,17)}):Play()
            wait(0.15)
            TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
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
            wait(0.5)
            Toggle.Title.Text = ToggleSettings.Name
            TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
            TweenService:Create(Toggle.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
        end
        SaveConfiguration()
    end
    
    function ToggleSettings:SetDescription(NewDescription)
        ToggleSettings.Description = NewDescription
        if DescriptionLabel then
            DescriptionLabel.Text = NewDescription
            local textService = game:GetService("TextService")
            local textSize = textService:GetTextSize(NewDescription, 13, Enum.Font.Gotham, Vector2.new(400, math.huge))
            DescriptionLabel.Size = UDim2.new(0, math.min(textSize.X + 20, 420), 0, math.max(textSize.Y + 4, 20))
        elseif NewDescription then
            CreateDescriptionLabel()
        end
    end
    
    function ToggleSettings:Destroy()
        if DescriptionLabel then
            DescriptionLabel:Destroy()
        end
        Toggle:Destroy()
    end
    
    function ToggleSettings:Lock(Reason)
        if ToggleSettings.Locked then return end
        ToggleSettings.Locked = true
        Toggle.Lock.Reason.Text = Reason or 'Locked'
        TweenService:Create(Toggle.Lock,TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{BackgroundTransparency = 0}):Play()
        TweenService:Create(Toggle.Lock.Reason,TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{TextTransparency = 0}):Play()
        wait(0.2)
        if not ToggleSettings.Locked then return end
        TweenService:Create(Toggle.Lock.Reason.Icon,TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{ImageTransparency = 0}):Play()
    end
    
    function ToggleSettings:Unlock()
        if not ToggleSettings.Locked then return end
        ToggleSettings.Locked = false
        wait(0.2)
        TweenService:Create(Toggle.Lock.Reason.Icon,TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{ImageTransparency = 1}):Play()
        if ToggleSettings.Locked then return end
        TweenService:Create(Toggle.Lock,TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{BackgroundTransparency = 1}):Play()
        TweenService:Create(Toggle.Lock.Reason,TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{TextTransparency = 1}):Play()
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
			ColorPicker.ColorPickerIs.Value = false
			ColorPicker.ClipsDescendants = true
			ColorPicker.Name = ColorPickerSettings.Name
			ColorPicker.Title.Text = ColorPickerSettings.Name
			ColorPicker.Title.Font = SelectedTheme.TextFont
			ColorPickerSettings.Locked = false
			ColorPicker.Visible = true
			if ColorPickerSettings.SectionParent then
				ColorPicker.Parent = ColorPickerSettings.SectionParent.Holder
			else
				ColorPicker.Parent = TabPage
			end
			ColorPicker.Size = UDim2.new(0,465,0,40)
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
			local opened  = false 
			local mouse = game.Players.LocalPlayer:GetMouse()
			Main.Image = "http://www.roblox.com/asset/?id=11415645739"
			local mainDragging = false 
			local sliderDragging = false 
			ColorPicker.Interact.MouseButton1Down:Connect(function()
				if ColorPickerSettings.Locked then return end
				if not opened then
					ColorPicker.ColorPickerIs.Value = true
					opened = true 
					ColorPicker.ColorSlider.Visible = true
					ColorPicker.HexInput.Visible = true
					ColorPicker.RGB.Visible = true
					TweenService:Create(ColorPicker, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Size = UDim2.new(0,465, 0, 120)}):Play()
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
					ColorPicker.ColorPickerIs.Value = false
					opened = false
					ColorPicker.ColorSlider.Visible = false
					ColorPicker.HexInput.Visible = false
					ColorPicker.RGB.Visible = false
					TweenService:Create(ColorPicker, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Size = UDim2.new(0,465, 0,40)}):Play()
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

			game:GetService("UserInputService").InputEnded:Connect(function(input, gameProcessed) if input.UserInputType == Enum.UserInputType.MouseButton1 then 
					mainDragging = false
					sliderDragging = false
				end end)
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

			local h,s,v = ColorPickerSettings.Color:ToHSV()
			local color = Color3.fromHSV(h,s,v) 
			local hex = string.format("#%02X%02X%02X",color.R*0xFF,color.G*0xFF,color.B*0xFF)
			ColorPicker.HexInput.InputBox.Text = hex
			local function setDisplay()
				Main.MainPoint.Position = UDim2.new(s,-Main.MainPoint.AbsoluteSize.X/2,1-v,-Main.MainPoint.AbsoluteSize.Y/2)
				Main.MainPoint.ImageColor3 = Color3.fromHSV(h,s,v)
				Background.BackgroundColor3 = Color3.fromHSV(h,1,1)
				Display.BackgroundColor3 = Color3.fromHSV(h,s,v)
				local x = h * Slider.AbsoluteSize.X
				Slider.SliderPoint.Position = UDim2.new(0,x-Slider.SliderPoint.AbsoluteSize.X/2,0.5,0)
				Slider.SliderPoint.ImageColor3 = Color3.fromHSV(h,1,1)
				local color = Color3.fromHSV(h,s,v) 
				local r,g,b = math.floor((color.R*255)+0.5),math.floor((color.G*255)+0.5),math.floor((color.B*255)+0.5)
				ColorPicker.RGB.RInput.InputBox.Text = tostring(r)
				ColorPicker.RGB.GInput.InputBox.Text = tostring(g)
				ColorPicker.RGB.BInput.InputBox.Text = tostring(b)
				hex = string.format("#%02X%02X%02X",color.R*0xFF,color.G*0xFF,color.B*0xFF)
				ColorPicker.HexInput.InputBox.Text = hex
			end
			setDisplay()
			ColorPicker.HexInput.InputBox.FocusLost:Connect(function()
				if not pcall(function()
						local r, g, b = string.match(ColorPicker.HexInput.InputBox.Text, "^#?(%w%w)(%w%w)(%w%w)$")
						local rgbColor = Color3.fromRGB(tonumber(r, 16),tonumber(g, 16), tonumber(b, 16))
						h,s,v = rgbColor:ToHSV()
						hex = ColorPicker.HexInput.InputBox.Text
						setDisplay()
						ColorPickerSettings.Color = rgbColor
					end) 
				then 
					ColorPicker.HexInput.InputBox.Text = hex 
				end
				pcall(function()ColorPickerSettings.Callback(Color3.fromHSV(h,s,v))end)
				local r,g,b = math.floor((h*255)+0.5),math.floor((s*255)+0.5),math.floor((v*255)+0.5)
				ColorPickerSettings.Color = Color3.fromRGB(r,g,b)
				SaveConfiguration()
			end)
			
			local function rgbBoxes(box,toChange)
				local value = tonumber(box.Text) 
				local color = Color3.fromHSV(h,s,v) 
				local oldR,oldG,oldB = math.floor((color.R*255)+0.5),math.floor((color.G*255)+0.5),math.floor((color.B*255)+0.5)
				local save 
				if toChange == "R" then save = oldR;oldR = value elseif toChange == "G" then save = oldG;oldG = value else save = oldB;oldB = value end
				if value then 
					value = math.clamp(value,0,255)
					h,s,v = Color3.fromRGB(oldR,oldG,oldB):ToHSV()

					setDisplay()
				else 
					box.Text = tostring(save)
				end
				local r,g,b = math.floor((h*255)+0.5),math.floor((s*255)+0.5),math.floor((v*255)+0.5)
				ColorPickerSettings.Color = Color3.fromRGB(r,g,b)
				SaveConfiguration()
			end

			ColorPicker.RGB.RInput.InputBox.FocusLost:connect(function()
				rgbBoxes(ColorPicker.RGB.RInput.InputBox,"R")
				pcall(function()ColorPickerSettings.Callback(Color3.fromHSV(h,s,v))end)
			end)
			ColorPicker.RGB.GInput.InputBox.FocusLost:connect(function()
				rgbBoxes(ColorPicker.RGB.GInput.InputBox,"G")
				pcall(function()ColorPickerSettings.Callback(Color3.fromHSV(h,s,v))end)
			end)
			ColorPicker.RGB.BInput.InputBox.FocusLost:connect(function()
				rgbBoxes(ColorPicker.RGB.BInput.InputBox,"B")
				pcall(function()ColorPickerSettings.Callback(Color3.fromHSV(h,s,v))end)
			end)

			ColorPicker.HexInput.InputBox.Focused:Connect(function()
				if ColorPickerSettings.Locked then ColorPicker.HexInput.InputBox:ReleaseFocus() return end
			end)
			ColorPicker.RGB.RInput.InputBox.Focused:connect(function()
				if ColorPickerSettings.Locked then ColorPicker.RGB.RInput.InputBox:ReleaseFocus() return end
			end)
			ColorPicker.RGB.GInput.InputBox.Focused:connect(function()
				if ColorPickerSettings.Locked then ColorPicker.RGB.GInput.InputBox:ReleaseFocus() return end
			end)
			ColorPicker.RGB.BInput.InputBox.Focused:connect(function()
				if ColorPickerSettings.Locked then ColorPicker.RGB.BInput.InputBox:ReleaseFocus() return end
			end)

			game:GetService("RunService").RenderStepped:connect(function()
				if mainDragging then 
					local localX = math.clamp(mouse.X-Main.AbsolutePosition.X,0,Main.AbsoluteSize.X)
					local localY = math.clamp(mouse.Y-Main.AbsolutePosition.Y,0,Main.AbsoluteSize.Y)
					Main.MainPoint.Position = UDim2.new(0,localX-Main.MainPoint.AbsoluteSize.X/2,0,localY-Main.MainPoint.AbsoluteSize.Y/2)
					s = localX / Main.AbsoluteSize.X
					v = 1 - (localY / Main.AbsoluteSize.Y)
					Display.BackgroundColor3 = Color3.fromHSV(h,s,v)
					Main.MainPoint.ImageColor3 = Color3.fromHSV(h,s,v)
					Background.BackgroundColor3 = Color3.fromHSV(h,1,1)
					local color = Color3.fromHSV(h,s,v) 
					local r,g,b = math.floor((color.R*255)+0.5),math.floor((color.G*255)+0.5),math.floor((color.B*255)+0.5)
					ColorPicker.RGB.RInput.InputBox.Text = tostring(r)
					ColorPicker.RGB.GInput.InputBox.Text = tostring(g)
					ColorPicker.RGB.BInput.InputBox.Text = tostring(b)
					ColorPicker.HexInput.InputBox.Text = string.format("#%02X%02X%02X",color.R*0xFF,color.G*0xFF,color.B*0xFF)
					pcall(function()ColorPickerSettings.Callback(Color3.fromHSV(h,s,v))end)
					ColorPickerSettings.Color = Color3.fromRGB(r,g,b)
					SaveConfiguration()
				end
				if sliderDragging then 
					local localX = math.clamp(mouse.X-Slider.AbsolutePosition.X,0,Slider.AbsoluteSize.X)
					h = localX / Slider.AbsoluteSize.X
					Display.BackgroundColor3 = Color3.fromHSV(h,s,v)
					Slider.SliderPoint.Position = UDim2.new(0,localX-Slider.SliderPoint.AbsoluteSize.X/2,0.5,0)
					Slider.SliderPoint.ImageColor3 = Color3.fromHSV(h,1,1)
					Background.BackgroundColor3 = Color3.fromHSV(h,1,1)
					Main.MainPoint.ImageColor3 = Color3.fromHSV(h,s,v)
					local color = Color3.fromHSV(h,s,v) 
					local r,g,b = math.floor((color.R*255)+0.5),math.floor((color.G*255)+0.5),math.floor((color.B*255)+0.5)
					ColorPicker.RGB.RInput.InputBox.Text = tostring(r)
					ColorPicker.RGB.GInput.InputBox.Text = tostring(g)
					ColorPicker.RGB.BInput.InputBox.Text = tostring(b)
					ColorPicker.HexInput.InputBox.Text = string.format("#%02X%02X%02X",color.R*0xFF,color.G*0xFF,color.B*0xFF)
					pcall(function()ColorPickerSettings.Callback(Color3.fromHSV(h,s,v))end)
					ColorPickerSettings.Color = Color3.fromRGB(r,g,b)
					SaveConfiguration()
				end
			end)

			if Settings.ConfigurationSaving then
				if Settings.ConfigurationSaving.Enabled and ColorPickerSettings.Flag then
					ArrayFieldLibrary.Flags[ColorPickerSettings.Flag] = ColorPickerSettings
				end
			end

			function ColorPickerSettings:Set(RGBColor)
				ColorPickerSettings.Color = RGBColor
				h,s,v = ColorPickerSettings.Color:ToHSV()
				color = Color3.fromHSV(h,s,v)
				setDisplay()
			end
			function ColorPickerSettings:Destroy()
				ColorPicker:Destroy()
			end
			function ColorPickerSettings:Lock(Reason)
				if ColorPickerSettings.Locked then return end
				ColorPicker.ColorPickerIs.Value = false
				opened = false
				ColorPicker.ColorSlider.Visible = false
				ColorPicker.HexInput.Visible = false
				ColorPicker.RGB.Visible = false
				TweenService:Create(ColorPicker, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Size = UDim2.new(0,465, 0,40)}):Play()
				TweenService:Create(Background, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 39, 0, 22)}):Play()
				TweenService:Create(ColorPicker.Interact, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Size = UDim2.new(1, 0, 1, 0)}):Play()
				TweenService:Create(ColorPicker.Interact, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Position = UDim2.new(0.5, 0, 0.5, 0)}):Play()
				TweenService:Create(ColorPicker.RGB, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Position = UDim2.new(0, 17, 0, 70)}):Play()
				TweenService:Create(ColorPicker.HexInput, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Position = UDim2.new(0, 17, 0, 90)}):Play()
				TweenService:Create(Display, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
				TweenService:Create(Main.MainPoint, TweenInfo.new(0.2, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
				TweenService:Create(Main, TweenInfo.new(0.2, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
				TweenService:Create(Background, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
				ColorPicker.Lock.Reason.Text = Reason or 'Locked'
				ColorPickerSettings.Locked = true
				TweenService:Create(ColorPicker.Lock,TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{BackgroundTransparency = 0}):Play()
				TweenService:Create(ColorPicker.Lock.Reason,TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{TextTransparency = 0}):Play()
				wait(0.2)
				if not ColorPickerSettings.Locked then return end
				TweenService:Create(ColorPicker.Lock.Reason.Icon,TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{ImageTransparency = 0}):Play()
			end
			function ColorPickerSettings:Unlock()
				if not ColorPickerSettings.Locked then return end
				ColorPickerSettings.Locked = false
				wait(0.2)
				TweenService:Create(ColorPicker.Lock.Reason.Icon,TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{ImageTransparency = 1}):Play()
				if ColorPickerSettings.Locked then return end
				TweenService:Create(ColorPicker.Lock,TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{BackgroundTransparency = 1}):Play()
				TweenService:Create(ColorPicker.Lock.Reason,TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{TextTransparency = 1}):Play()
			end
			function ColorPickerSettings:Visible(bool)
				ColorPicker.Visible = bool
			end
			return ColorPickerSettings
		end

function Tab:CreateSlider(SliderSettings)
    local Dragging = false
    local Slider = Elements.Template.Slider:Clone()
    Slider.Name = SliderSettings.Name
    Slider.Title.Text = SliderSettings.Name
    Slider.Title.Font = SelectedTheme.TextFont
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

    if SelectedTheme ~= ArrayFieldLibrary.Theme.Default then
        Slider.Main.Shadow.Visible = false
    end

    Slider.Main.BackgroundColor3 = SelectedTheme.SliderBackground
    Slider.Main.UIStroke.Color = SelectedTheme.SliderStroke
    Slider.Main.Progress.BackgroundColor3 = SelectedTheme.SliderProgress

    local DescriptionLabel = nil
    local DescriptionVisible = false
    
    local function CreateDescriptionLabel()
        if not SliderSettings.Description then return end
        
        DescriptionLabel = Instance.new("TextLabel")
        DescriptionLabel.Name = "DescriptionText"
        DescriptionLabel.BackgroundTransparency = 1
        DescriptionLabel.Text = SliderSettings.Description
        DescriptionLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
        DescriptionLabel.TextSize = 13
        DescriptionLabel.Font = Enum.Font.Gotham
        DescriptionLabel.TextXAlignment = Enum.TextXAlignment.Left
        DescriptionLabel.TextYAlignment = Enum.TextYAlignment.Center
        DescriptionLabel.TextWrapped = true
        DescriptionLabel.TextTransparency = 1
        DescriptionLabel.Visible = false
        DescriptionLabel.Parent = Slider
        
        local textService = game:GetService("TextService")
        local textSize = textService:GetTextSize(SliderSettings.Description, 13, Enum.Font.Gotham, Vector2.new(400, math.huge))
        
        DescriptionLabel.Size = UDim2.new(0, math.min(textSize.X + 20, 420), 0, math.max(textSize.Y + 4, 20))
        DescriptionLabel.Position = UDim2.new(0, 15, 0.46, 0)
    end
    
    if SliderSettings.Description then
        CreateDescriptionLabel()
    end

    OriginalTitlePosition = Slider.Title.Position

    TweenService:Create(Slider, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
    TweenService:Create(Slider.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
    TweenService:Create(Slider.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()	

    Slider.Main.Progress.Size =	UDim2.new(0, Slider.Main.AbsoluteSize.X * ((SliderSettings.CurrentValue + SliderSettings.Range[1]) / (SliderSettings.Range[2] - SliderSettings.Range[1])) > 5 and Slider.Main.AbsoluteSize.X * (SliderSettings.CurrentValue / (SliderSettings.Range[2] - SliderSettings.Range[1])) or 5, 1, 0)

    if not SliderSettings.Suffix then
        Slider.Main.Information.Text = tostring(SliderSettings.CurrentValue)
    else
        Slider.Main.Information.Text = tostring(SliderSettings.CurrentValue) .. " " .. SliderSettings.Suffix
    end

    Slider.MouseEnter:Connect(function()
        TweenService:Create(Slider, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
        
        if SliderSettings.Description and DescriptionLabel and not DescriptionVisible then
            DescriptionVisible = true
            DescriptionLabel.Visible = true
            
            local NewTitleY = OriginalTitlePosition.Y.Scale
            local NewTitleYOffset = OriginalTitlePosition.Y.Offset - 5

            local newHeight = 40 + DescriptionLabel.AbsoluteSize.Y + 12
            TweenService:Create(Slider, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {
                Size = UDim2.new(0, 465, 0, newHeight)
            }):Play()
            
            TweenService:Create(DescriptionLabel, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
        end
    end)
    Slider.Main.Interact.MouseLeave:Connect(function()
        Dragging = false
    end)
    Slider.MouseLeave:Connect(function()
        TweenService:Create(Slider, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
        
        if SliderSettings.Description and DescriptionLabel and DescriptionVisible then
            DescriptionVisible = false
            
            TweenService:Create(Slider.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {
                Position = OriginalTitlePosition
            }):Play()

            TweenService:Create(DescriptionLabel, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
            
            TweenService:Create(Slider, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {
                Size = UDim2.new(0, 465, 0, 45)
            }):Play()
            
            wait(0.3)
            if not DescriptionVisible then
                DescriptionLabel.Visible = false
            end
        end
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
        if not SliderSettings.Suffix then
            Slider.Main.Information.Text = tostring(NewValue)
        else
            Slider.Main.Information.Text = tostring(NewValue) .. " " .. SliderSettings.Suffix
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
                wait(0.5)
                Slider.Title.Text = SliderSettings.Name
                TweenService:Create(Slider, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
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
    Slider.Main.Interact.MouseButton1Up:Connect(function(X) 
        Dragging = false 
    end)
    Slider.Main.Interact.MouseMoved:Connect(function(X)
        if SliderSettings.Locked then return end
        if Dragging then
            UpdateSlider(X)
        end
    end)
    
    function SliderSettings:Set(NewVal)
        TweenService:Create(Slider.Main.Progress, TweenInfo.new(0.45, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Size = UDim2.new(0, Slider.Main.AbsoluteSize.X * ((NewVal + SliderSettings.Range[1]) / (SliderSettings.Range[2] - SliderSettings.Range[1])) > 5 and Slider.Main.AbsoluteSize.X * (NewVal / (SliderSettings.Range[2] - SliderSettings.Range[1])) or 5, 1, 0)}):Play()
        Slider.Main.Information.Text = tostring(NewVal) .. " " .. SliderSettings.Suffix
        local Success, Response = pcall(function()
            SliderSettings.Callback(NewVal)
        end)
        if not Success then
            TweenService:Create(Slider, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = Color3.fromRGB(85, 0, 0)}):Play()
            TweenService:Create(Slider.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
            Slider.Title.Text = "Callback Error"
            print("ArrayField | "..SliderSettings.Name.." Callback Error " ..tostring(Response))
            wait(0.5)
            Slider.Title.Text = SliderSettings.Name
            TweenService:Create(Slider, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
            TweenService:Create(Slider.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
        end
        SliderSettings.CurrentValue = NewVal
        SaveConfiguration()
    end
    function SliderSettings:Destroy()
        Slider:Destroy()
    end
    function SliderSettings:Lock(Reason)
        if SliderSettings.Locked then return end
        SliderSettings.Locked = true
        Slider.Lock.Reason.Text = Reason or 'Locked'
        TweenService:Create(Slider.Lock,TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{BackgroundTransparency = 0}):Play()
        TweenService:Create(Slider.Lock.Reason,TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{TextTransparency = 0}):Play()
        wait(0.2)
        if not SliderSettings.Locked then return end
        TweenService:Create(Slider.Lock.Reason.Icon,TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{ImageTransparency = 0}):Play()
    end
    function SliderSettings:Unlock()
        if not SliderSettings.Locked then return end
        SliderSettings.Locked = false
        wait(0.2)
        TweenService:Create(Slider.Lock.Reason.Icon,TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{ImageTransparency = 1}):Play()
        if SliderSettings.Locked then return end
        TweenService:Create(Slider.Lock,TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{BackgroundTransparency = 1}):Play()
        TweenService:Create(Slider.Lock.Reason,TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{TextTransparency = 1}):Play()
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
		return Tab
	end

	function ArrayFieldLibrary:SetTheme(ThemeName)
		if ArrayFieldLibrary.Theme[ThemeName] then
			SelectedTheme = ArrayFieldLibrary.Theme[ThemeName]
			ApplyTheme()
		else
			warn("ArrayField: Theme '" .. ThemeName .. "' not found")
		end
	end

	Elements.Visible = true

	wait(1.2)
	TweenService:Create(LoadingFrame.Title, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
	TweenService:Create(LoadingFrame.Subtitle, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
	TweenService:Create(LoadingFrame.Version, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
	wait(0.2)
	TweenService:Create(Main, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 700, 0, 355)}):Play()
	TweenService:Create(Main.Shadow.Image, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageTransparency = 0.4}):Play()

	TweenService:Create(Main, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {
		Size = UDim2.new(0, 700, 0, 355)
	}):Play()

	task.delay(0.75, function()
		spawn(CloseSideBar)
		spawn(OpenSideBar)
	end)

	Topbar.BackgroundTransparency = 1
	Topbar.Divider.Size = UDim2.new(0, 0, 0, 1)
	Topbar.CornerRepair.BackgroundTransparency = 1
	Topbar.Title.TextTransparency = 1
	Topbar.Theme.ImageTransparency = 1
	Topbar.ChangeSize.ImageTransparency = 1
	Topbar.Hide.ImageTransparency = 1

	wait(0.8)
	Topbar.Visible = true
	TweenService:Create(Topbar, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
	TweenService:Create(Topbar.CornerRepair, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
	wait(0.1)
	TweenService:Create(Topbar.Divider, TweenInfo.new(1, Enum.EasingStyle.Quint), {Size = UDim2.new(1, 0, 0, 1)}):Play()
	wait(0.1)
	TweenService:Create(Topbar.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
	wait(0.1)
	TweenService:Create(Topbar.Theme, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageTransparency = 0.8}):Play()
	wait(0.1)
	TweenService:Create(Topbar.ChangeSize, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageTransparency = 0.8}):Play()
	wait(0.1)
	TweenService:Create(Topbar.Hide, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageTransparency = 0.8}):Play()
	wait(0.3)
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

		end
	end
	
	if FirstTabObject then
		Elements.UIPageLayout:JumpTo(FirstTabObject)
	end
	
	return Window
end

MobileToggle:Hide()

function ArrayFieldLibrary:Destroy()
	ArrayField:Destroy()
	if ArrayField:FindFirstChild("MobileToggleButton") then
		ArrayField:FindFirstChild("MobileToggleButton"):Destroy()
	end
end

Topbar.ChangeSize.MouseButton1Click:Connect(function()
	if Debounce then return end
	if Minimised then
		Minimised = false
		Maximise()
	else
		if not SearchHided then SearchHided = true spawn(CloseSearch)  end
		Minimised = true
		Minimise()
	end
end)
Topbar.Search.MouseButton1Click:Connect(function()
	if Debounce or Minimised then return end
	if SearchHided then
		OpenSearch()
		SearchHided = false
	else
		SearchHided = true
		CloseSearch()
	end
end)
Topbar.Type.MouseButton1Click:Connect(function()
	if Debounce or Minimised or not SideBarClosed then return end

	Topbar.Type.Image = "rbxassetid://"..6023565894
    ArrayFieldLibrary:Notify({
		Title = "ArrayField Library",
		Content = "This library was made by vqmpjay, for more scripts or libraries join Vadrifts: dsc.gg/vadriftz (in Browsers)",
		Image = "venetian-mask",
		Duration = 10
	})
end)

Topbar.Hide.MouseButton1Click:Connect(function()
    if Debounce then return end
    if Hidden then
        Hidden = false
        Minimised = false
        Unhide()
		MobileToggle:Hide()
    else
        if not SearchHided then SearchHided = true spawn(CloseSearch) end
        Hidden = true
        Hide()
		MobileToggle:Show()
    end
end)

UserInputService.InputBegan:Connect(function(input, processed)
    if (input.KeyCode == Enum.KeyCode.K and not processed) then
        if Debounce then return end
        if Hidden then
            Hidden = false
            Unhide()
        else
            if not SearchHided then spawn(CloseSearch) end
            Hidden = true
            Hide()
        end
    end
end)

for _, TopbarButton in ipairs(Topbar:GetChildren()) do
	if TopbarButton.ClassName == "ImageButton" then
		TopbarButton.MouseEnter:Connect(function()
			if TopbarButton.Name ~= 'Type' then
				TweenService:Create(TopbarButton, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageTransparency = 0}):Play()
			else
				TweenService:Create(TopbarButton, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageTransparency = 0.2}):Play()
			end
		end)
		TopbarButton.MouseLeave:Connect(function()
			if TopbarButton.Name ~= 'Type' then
				TweenService:Create(TopbarButton, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageTransparency = 0.8}):Play()
			else
				TweenService:Create(TopbarButton, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageTransparency = 0}):Play()
			end
		end)

		TopbarButton.MouseButton1Click:Connect(function()
			TweenService:Create(TopbarButton, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageTransparency = 0.8}):Play()
		end)
	end
end

function ArrayFieldLibrary:LoadConfiguration()
	if CEnabled then
		pcall(function()
			if isfile(ConfigurationFolder .. "/" .. CFileName .. ConfigurationExtension) then
				LoadConfiguration(readfile(ConfigurationFolder .. "/" .. CFileName .. ConfigurationExtension))
				ArrayFieldLibrary:Notify({Title = "Configuration Loaded", Content = "The configuration file for this script has been loaded from a previous session"})
			end
		end)
	end
end

task.delay(9, ArrayFieldLibrary.LoadConfiguration, ArrayFieldLibrary)

ArrayField.Main.Topbar.Theme.Visible = false
local Search = ArrayField.Main.Topbar:FindFirstChild("Search")

if Search then
    Search.Parent = nil
    
    Search.Parent = ArrayField.Main.Topbar 
    
    Search.Position = UDim2.new(0.84, 0, 0.5, 0)
else
    warn("Search button not found!")
end

local Sections = ArrayField.Main:GetChildren()
local PromptButtons = ArrayField.Main.Prompt.Prompt.Buttons
PromptButtons.Size = UDim2.new(0, 335, 0, 40)

local Elements = ArrayField.Main.Elements
Elements.Position = UDim2.new(0.5, 80, 0.55, 0)
Elements.Size = UDim2.new(1, -180, 0, 295)

return ArrayFieldLibrary
