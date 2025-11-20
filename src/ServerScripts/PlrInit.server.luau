local Players = game:GetService("Players")
local RepStore = game:GetService("ReplicatedStorage")
local StarterPlayer = game:GetService("StarterPlayer")


local ClientFiles = RepStore.Client

for _, v in pairs(ClientFiles:GetChildren()) do
    v.Parent = StarterPlayer.StarterPlayerScripts
end

Players.PlayerAdded:Connect(function(Plr)
    Plr:LoadCharacter()
end)