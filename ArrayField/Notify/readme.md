# Standalone Notification Module

A completely standalone notification system extracted from ArrayField Library. Works independently without requiring the full ArrayField setup.

## Features

- Clean, animated notifications with blur effects
- Support for Lucide icons by name (e.g., "bell", "home", "user")
- Support for custom rbxassetid icons
- Action buttons with callbacks
- Automatic stacking of multiple notifications
- Compatible with existing ArrayField notifications (they'll stack together)
- Uses HUI folder if available for better compatibility with exploits

## Installation

```lua
local NotificationModule = loadstring(game:HttpGet("YOUR_URL_HERE"))()
```

## Basic Usage

### Simple Notification
```lua
NotificationModule:Notify({
    Title = "Hello World",
    Content = "This is a notification",
    Duration = 5
})
```

### With Lucide Icon
```lua
NotificationModule:Notify({
    Title = "Success!",
    Content = "Operation completed",
    Duration = 5,
    Image = "check-circle"
})
```

### With Custom Icon (rbxassetid)
```lua
NotificationModule:Notify({
    Title = "Custom Icon",
    Content = "Using a custom image",
    Duration = 5,
    Image = "1234567890"
})
```

### With Action Buttons
```lua
NotificationModule:Notify({
    Title = "Confirm Action",
    Content = "Do you want to proceed?",
    Actions = {
        {
            Name = "Yes",
            Callback = function()
                print("User clicked Yes")
            end
        },
        {
            Name = "No",
            Callback = function()
                print("User clicked No")
            end
        }
    }
})
```

## API Reference

### NotificationModule:Init()
Initializes the notification system. Should be called once before using notifications.

### NotificationModule:Notify(settings)
Creates and displays a notification.

**Settings:**
- `Title` (string): Notification title
- `Content` (string): Notification description
- `Duration` (number, optional): How long to show in seconds (default: 5) - **Note: Ignored for notifications with Actions**
- `Image` (string/number, optional): Either a Lucide icon name or rbxassetid
- `Actions` (table, optional): Array of action buttons

**Action Format:**
```lua
{
    Name = "Button Text",
    Callback = function()
        -- Your code here
    end
}
```

### NotificationModule:SetDuration(duration)
Sets the default duration for all notifications.

```lua
NotificationModule:SetDuration(10)
```

### NotificationModule:Destroy()
Destroys the notification GUI and cleans up.

## Popular Lucide Icons

- bell
- check
- check-circle
- x-circle
- alert-triangle
- info
- settings
- user
- home
- star
- heart
- trash
- download
- upload
- lock
- unlock

Full list: https://lucide.dev/icons/

## Notes

- Notifications automatically stack vertically
- Works alongside original ArrayField notifications
- **Notifications with Actions ignore the Duration parameter** - they stay visible until an action is clicked
- Text automatically wraps to prevent overflow
- Blur effects require graphics quality set appropriately
- Uses the neon module for glassmorphism effects
- Icons are loaded from the Rayfield icon library
