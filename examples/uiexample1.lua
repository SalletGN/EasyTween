-- Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

-- Get the EasyTween directory and import the module
local Directory = ReplicatedStorage:WaitForChild("Services").EasyTween
local EasyTween = require(Directory)

-- Gui Elements
local Gui = Players.LocalPlayer.PlayerGui:WaitForChild("ExampleGui")
local ExampleFrame = Gui:WaitForChild('ExampleFrame')

-- Tween code 
local TweenSpeed = 1
local YourEasingStyle = Enum.EasingStyle.Linear
local DoesReverse = false
local TweenGoal = { -- Each table is a tween for a single object
    {
        ExampleFrame, -- This table contains what property of the element you want to change
        {
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(0, 0),
            Rotation = 360,
            BackgroundColor3 = Color3.fromHSV(0.797389, 1, 1)
        }
    }
}
EasyTween.TweenObjects(TweenGoal, TweenSpeed, YourEasingStyle, DoesReverse)
