local RepStore = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local RepMods = RepStore.Modules

local TagMaker = require(RepMods.CreateTag)


while wait(2) do
    TagMaker(Players.LocalPlayer, "TestingTag")
end