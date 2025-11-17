--[[
    ╔═══════════════════════════════════════════════════════╗
    ║   VQMPJAYZ ARRAYFIELD KEY SYSTEM V3 - DOCUMENTATION   ║
    ║              Professional Key System for              ║
    ║              Open-Source Roblox Scripts               ║
    ╚═══════════════════════════════════════════════════════╝
    
    FEATURES:
    • Beautiful animated UI with smooth transitions
    • VIP/HWID whitelist system (bypass keys entirely)
    • SaveKey - users don't re-enter keys every time
    • GrabKeyFromSite - dynamic per-HWID keys from your website
    • Discord integration with copy buttons
    • Password visibility toggle
    • Mobile & PC support
    
    GITHUB: https://github.com/vqmpjayZ/laboratory
    DISCORD: https://discord.gg/VPhjH4Kntp
]]

local KeySystem = loadstring(game:HttpGet("https://raw.githubusercontent.com/vqmpjayZ/laboratory/refs/heads/main/ArrayField/Key/KeySystemV3.lua"))()

--[[
    ═══════════════════════════════════════════════════════
    EXAMPLE 1: BASIC KEY SYSTEM (Discord Method)
    ═══════════════════════════════════════════════════════
    Users get keys from your Discord server
    Simple static keys
]]

KeySystem:CreateKeyUI({
    Title = "My Script Key System",
    Subtitle = "Enter your key to continue",
    Note = "Join the Discord server to get a free key!",
    
    Keys = {"free-key-2025", "premium-key-abc123"},
    
    SaveKey = true,
    FileName = "MyScriptKey",
    
    Action = {
        Link = "https://discord.gg/yourserver"
    },
    
    Callback = function()
        print("✅ Key accepted! Loading script...")
        -- Your script code here
    end
})

--[[
    ═══════════════════════════════════════════════════════
    EXAMPLE 2: WEBSITE KEY SYSTEM (GrabKeyFromSite Method)
    ═══════════════════════════════════════════════════════
    Dynamic keys generated per HWID
    Users complete checkpoints/ads on your website
    Shows HWID copy button automatically
]]

--[[
KeySystem:CreateKeyUI({
    Title = "Vadrifts Hub Key System",
    Subtitle = "Complete the checkpoint to get your key",
    Note = "Your key is unique to your device!",
    
    Keys = {},  -- Leave empty when using GrabKeyFromSite
    
    SaveKey = true,
    FileName = "VadriftsHubKey",
    
    GrabKeyFromSite = {
        Enabled = true,
        KeyDestination = "https://vadrifts.onrender.com/create?hwid="
    },
    
    Action = {
        Link = "https://vadrifts.onrender.com"
    },
    
    Callback = function()
        print("✅ Authenticated! Loading Vadrifts Hub...")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/vqmpjayZ/Vadrifts-Hub/main/loader.lua"))()
    end
})
]]

--[[
    ═══════════════════════════════════════════════════════
    EXAMPLE 3: VIP WHITELIST (Bypass Keys Entirely)
    ═══════════════════════════════════════════════════════
    Premium users skip the key system completely
    Whitelist HWIDs from Pastebin or hardcode them
]]

--[[
KeySystem:CreateKeyUI({
    Title = "Premium Script",
    Subtitle = "VIP users bypass | Others enter key",
    Note = "Donate for permanent VIP access!",
    
    Keys = {"normal-user-key"},
    
    SaveKey = true,
    FileName = "PremiumScriptKey",
    
    VIP = {
        Enabled = true,
        PastebinURL = "https://pastebin.com/raw/yourVIPlist",  -- JSON array or line-separated HWIDs
        LocalList = {"hwid1-hardcoded-here", "hwid2-here"}     -- Optional: hardcode some VIPs
    },
    
    Action = {
        Link = "https://discord.gg/yourserver"
    },
    
    Callback = function()
        print("✅ Access granted!")
    end
})
]]

--[[
    ═══════════════════════════════════════════════════════
    FULL SETTINGS REFERENCE
    ═══════════════════════════════════════════════════════
    
    Title          (string)   - Main title text
    Subtitle       (string)   - Subtitle below title
    Note           (string)   - Instructions message
    Keys           (table)    - Array of valid keys {"key1", "key2"}
    SaveKey        (boolean)  - Save key locally (true/false)
    FileName       (string)   - Name of saved key file
    Callback       (function) - Function to run when key is correct
    
    GrabKeyFromSite (table):
        Enabled         (boolean) - Enable dynamic keys (true/false)
        KeyDestination  (string)  - Your API URL (ends with ?hwid=)
    
    VIP (table):
        Enabled      (boolean) - Enable VIP whitelist (true/false)
        PastebinURL  (string)  - Pastebin raw URL with HWIDs
        LocalList    (table)   - Hardcoded HWIDs {"hwid1", "hwid2"}
    
    Action (table):
        Link  (string) - Discord/website link to copy
    
    ═══════════════════════════════════════════════════════
    NOTES:
    ═══════════════════════════════════════════════════════
    
    • VIP users completely bypass the key system
    • When GrabKeyFromSite is enabled, an HWID copy button appears automatically
    • SaveKey only works on executors with filesystem (writefile/readfile)
    • Keys are case-sensitive
    • The "Action" button shows as "Click here to copy key link"
    • The "HWID" button shows as "Click here to copy your HWID" (only with GrabKeyFromSite)
    
    ═══════════════════════════════════════════════════════
    ANTI-PROTECTION NOTICE:
    ═══════════════════════════════════════════════════════
    
    This key system includes:
    ✅ Anti-tamper protection
    ✅ Anti-HTTP spy (protects VIP/key URLs from being logged)
    ✅ Obfuscation-ready code
    
    Created by vqmpjayZ | https://discord.gg/VPhjH4Kntp
]]
