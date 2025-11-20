local Players = game:GetService("Players")
local RepStore = game:GetService("ReplicatedStorage")

local ClientFiles = RepStore.Client

Players.PlayerAdded:Connect(function(Plr)
    local ClientClone = ClientFiles:Clone()

    ClientFiles.Parent = Plr:WaitForChild("PlayerScripts")
end)