local RepStore = game:GetService("ReplicatedStorage")

local Remotes = RepStore.Remotes
local Modules = RepStore.Modules

local TagModule = require(Modules.CreateTag)

local Funcs = {}


Funcs.CreateTag = function(Plr, TagName: string)
    TagModule(Plr, TagName)
end


Remotes.PlrRemote.OnServerEvent:Connect(function(Plr, Method, ...)
    if not Funcs[Method] then warn(Method.." isnt a valid method.") return end

    Funcs[Method](Plr, ...)
end)