# ArrayField Key System V3

Readme written by chatgpt u rly think vqmpjay would write this 🤮🤮🤮🤮
A fully animated, feature-rich key system for Roblox scripts with multiple validation modes, built-in security, HWID support, and key persistence.

![ArrayField Key System](https://img.shields.io/badge/Version-3.0-purple?style=for-the-badge)
![Roblox](https://img.shields.io/badge/Platform-Roblox-blue?style=for-the-badge)
![Lua](https://img.shields.io/badge/Language-Lua-yellow?style=for-the-badge)

## Features

- **Three Validation Modes** — Static keys, server-validated keys, and Discord-linked keys
- **Animated UI** — Smooth tweened animations for open, close, and error states
- **Built-in Security** — Multiple layers of protection against common exploits and key theft
- **HWID Generation** — Salted hardware ID generation unique to each user
- **VIP Bypass** — Whitelist specific HWIDs to skip the key system entirely
- **Key Persistence** — Save validated keys locally with configurable expiration
- **Mobile Support** — Touch-friendly with mobile-specific interaction handling
- **Error Feedback** — Shake animation on incorrect key entry

## Installation

```lua
local KeySystem = loadstring(game:HttpGet("https://raw.githubusercontent.com/vqmpjayZ/laboratory/refs/heads/main/ArrayField/Key/KeySystemV3.lua"))()
```

## Quick Start

### Static Keys

The simplest setup. Define your keys directly in the script.

```lua
KeySystem:CreateKeyUI({
    Title = "My Script",
    Subtitle = "Enter Key",
    Note = "Join the Discord to get the key!",
    Keys = {"my-secret-key-123", "another-valid-key"},
    SaveKey = true,
    FileName = "MyScript",
    Callback = function()
        print("Key accepted! Loading script...")
    end
})
```

### Server Validation

Validate keys against a remote server. Works with key link services like work.ink, Linkvertise, or your own custom endpoint.

Your endpoint should return `true` or `false` as plain text when it receives a `?key=` query parameter.

```lua
KeySystem:CreateKeyUI({
    Title = "My Script",
    Subtitle = "Enter Key",
    Note = "Click below to get your key.",
    ValidateKeyFromServer = {
        Enabled = true,
        ValidateURL = "https://your-server.com/validate"
    },
    Action = {
        Link = "https://your-key-link.com"
    },
    SaveKey = true,
    SaveKeyDuration = 24,
    FileName = "MyScript",
    Callback = function()
        print("Key accepted! Loading script...")
    end
})
```

### Discord Validation

The most secure mode. Keys are generated per-user via a Discord bot command, locked to their HWID, and validated in real-time against Discord server membership. If a user leaves the server, their key dies instantly.

This prevents key sharing on any platform — whether someone posts it in a description, a comment, a forum, a group chat, or anywhere else. The key simply won't work for anyone other than the person it was generated for, on the device it was first used on.

This mode requires your own backend API and Discord bot. See the [Discord Validation Setup](#discord-validation-setup) section below.

```lua
KeySystem:CreateKeyUI({
    Title = "My Script",
    Subtitle = "Enter Key",
    Note = "Run /getkey in the Discord server to get your key.",
    DiscordValidation = {
        Enabled = true,
        ValidateURL = "https://your-server.com/api/validate-discord-key",
        APISecret = "your-api-secret"
    },
    SaveKey = true,
    SaveKeyDuration = 24,
    FileName = "MyScript",
    Callback = function()
        print("Key accepted! Loading script...")
    end
})
```

## Full Configuration Reference

```lua
KeySystem:CreateKeyUI({
    -- REQUIRED
    Callback = function() end,

    -- UI TEXT
    Title = "Key System",
    Subtitle = "Enter Key",
    Note = "Instructions for the user",

    -- MODE 1: STATIC KEYS
    Keys = {"key1", "key2", "key3"},

    -- MODE 2: SERVER VALIDATION
    ValidateKeyFromServer = {
        Enabled = true,
        ValidateURL = "https://your-server.com/validate"
    },

    -- MODE 3: DISCORD VALIDATION
    DiscordValidation = {
        Enabled = true,
        ValidateURL = "https://your-server.com/api/validate-discord-key",
        APISecret = "your-api-secret"
    },

    -- KEY PERSISTENCE
    SaveKey = true,
    SaveKeyDuration = 24,
    FileName = "UniqueNamePerScript",

    -- COPY KEY LINK BUTTON
    Action = {
        Link = "https://your-key-link.com"
    },

    -- VIP BYPASS
    VIP = {
        Enabled = true,
        PastebinURL = "https://pastebin.com/raw/your-vip-list",
        LocalList = {"hwid1", "hwid2"}
    },

    -- HWID
    HWIDSalt = "your-unique-salt"
})
```

## Configuration Details

### Callback (required)

The function that runs when a valid key is entered. This is where you load your script.

### Title / Subtitle / Note

Customize the text displayed on the key system UI.

### Keys

An array of valid key strings for static key mode. Not needed if using server or Discord validation.

### ValidateKeyFromServer

Enable to validate keys against a remote endpoint. Your server receives the key as a query parameter and should return `true` or `false` as plain text.

```
GET https://your-server.com/validate?key=user-entered-key
Response: true
```

### DiscordValidation

Enable to validate keys against a Discord-linked backend. Keys are generated per-user, HWID-locked, and require active Discord server membership. Your endpoint receives a JSON POST:

```json
{
    "key": "the-entered-key",
    "hwid": "users-hardware-id",
    "secret": "your-api-secret"
}
```

And should return:

```json
{
    "valid": true,
    "message": "Authenticated"
}
```

### SaveKey

When enabled, valid keys are saved locally so users don't have to re-enter them every time they run the script.

### SaveKeyDuration

How many hours a saved key remains valid. Set to `0` or omit for keys that never expire locally. When using Discord validation, saved keys are re-validated against the server on each load.

### FileName

A unique name for the saved key file. Use different names for different scripts to prevent key collisions.

### Action

Adds a clickable button to the UI that copies a link to the user's clipboard. Useful for directing users to key link pages.

### VIP

Allows specific HWIDs to bypass the key system entirely. Supports both a remote list (fetched from a URL) and a local list defined in the script. The remote list can be JSON array format or one HWID per line.

### HWIDSalt

A string used to salt the HWID generation. Different salts produce different HWIDs from the same machine. Use a unique salt per script to prevent HWID cross-referencing between different scripts.

## Discord Validation Setup

This section is for advanced users who want to set up the Discord validation mode with their own infrastructure.

### What You Need

- A Discord bot with Server Members Intent enabled
- A web server with an API endpoint
- A database or file storage for keys

### How It Works

```
1. User joins your Discord server
2. User requests a key through your bot
3. Bot generates a unique key tied to their Discord account
4. User enters the key in your Roblox script
5. Script sends the key + HWID to your API
6. API checks:
   - Is this key valid and not expired?
   - Is the Discord user still in the server?
   - Does the HWID match (or is this first use)?
7. All checks pass → authenticated
8. User leaves Discord → key is automatically revoked
```

### Security Properties

| Scenario | Result |
|---|---|
| Key shared on any platform | HWID mismatch — rejected |
| User not in Discord server | Membership check fails — rejected |
| User joins, gets key, leaves | Key auto-revoked on server leave |
| User rejoins after leaving | Must request a new key |
| Key expires | User must request a new key |
| HWID changes | User resets their key through the bot |

### API Endpoint Specification

**POST** `/api/validate-discord-key`

Request body:

```json
{
    "key": "string",
    "hwid": "string",
    "secret": "string"
}
```

Success response:

```json
{
    "valid": true,
    "message": "Authenticated"
}
```

Failure responses:

```json
{"valid": false, "message": "Invalid key"}
{"valid": false, "message": "Key expired. Run /getkey in Discord."}
{"valid": false, "message": "You must be in the Discord server."}
{"valid": false, "message": "Key is locked to a different device. Use /resetkey in Discord."}
{"valid": false, "message": "Unauthorized"}
{"valid": false, "message": "Missing key or HWID"}
```

## Validation Priority

When multiple validation modes are configured, the key system follows this priority:

```
1. VIP check → if HWID is whitelisted, skip everything
2. Saved key check → if a valid saved key exists, use it
   (Discord mode re-validates saved keys against the server)
3. User enters key → validate using the active mode:
   Discord Validation (highest priority)
   → Server Validation
   → Static Keys (lowest priority)
```

## Examples

### Minimal Setup (Static Key)

```lua
local KeySystem = loadstring(game:HttpGet("https://raw.githubusercontent.com/vqmpjayZ/laboratory/refs/heads/main/ArrayField/Key/KeySystemV3.lua"))()

KeySystem:CreateKeyUI({
    Title = "Cool Script",
    Note = "Key: free-key-123",
    Keys = {"free-key-123"},
    Callback = function()
        loadstring(game:HttpGet("your-script-url"))()
    end
})
```

### Full Setup (Server Validation + VIP + Saved Keys)

```lua
local KeySystem = loadstring(game:HttpGet("https://raw.githubusercontent.com/vqmpjayZ/laboratory/refs/heads/main/ArrayField/Key/KeySystemV3.lua"))()

KeySystem:CreateKeyUI({
    Title = "Premium Script",
    Subtitle = "Authentication Required",
    Note = "Complete the link below to get your key. Key lasts 24 hours.",
    ValidateKeyFromServer = {
        Enabled = true,
        ValidateURL = "https://your-server.com/validate"
    },
    Action = {
        Link = "https://work.ink/your-link"
    },
    SaveKey = true,
    SaveKeyDuration = 24,
    FileName = "PremiumScript",
    HWIDSalt = "premium-salt-2025",
    VIP = {
        Enabled = true,
        PastebinURL = "https://pastebin.com/raw/your-list"
    },
    Callback = function()
        loadstring(game:HttpGet("your-script-url"))()
    end
})
```

### Discord-Secured Setup

```lua
local KeySystem = loadstring(game:HttpGet("https://raw.githubusercontent.com/vqmpjayZ/laboratory/refs/heads/main/ArrayField/Key/KeySystemV3.lua"))()

KeySystem:CreateKeyUI({
    Title = "Exclusive Script",
    Subtitle = "Discord Members Only",
    Note = "Run /getkey in our Discord server to get your key.",
    DiscordValidation = {
        Enabled = true,
        ValidateURL = "https://your-server.com/api/validate-discord-key",
        APISecret = "your-secret-here"
    },
    SaveKey = true,
    SaveKeyDuration = 24,
    FileName = "ExclusiveScript",
    HWIDSalt = "exclusive-salt-2025",
    VIP = {
        Enabled = true,
        LocalList = {"owner-hwid-here"}
    },
    Callback = function()
        loadstring(game:HttpGet("your-script-url"))()
    end
})
```

## Notes

- Each script should use a unique `FileName` to prevent saved key conflicts
- Each script should use a unique `HWIDSalt` to prevent HWID cross-referencing
- The `Action` button is optional and only appears when configured
- Discord validation mode will re-validate saved keys on every script launch to ensure the user is still in the server
- VIP bypass is checked before anything else, including saved keys
