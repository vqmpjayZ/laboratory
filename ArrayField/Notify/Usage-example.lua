local Notify = loadstring(game:HttpGet("https://raw.githubusercontent.com/vqmpjayZ/laboratory/refs/heads/main/ArrayField/Notify/NotificationModule.lua"))()

Notify:Notify({
    Title = "Hello",
    Content = "This is a test notification",
    Duration = 5,
    Image = "3944680095",
})

Notify:Notify({
    Title = "With Actions",
    Content = "Pick one",
    Actions = {
        {Name = "Accept", Callback = function() print("Accepted") end},
        {Name = "Decline", Callback = function() print("Declined") end},
    }
})
