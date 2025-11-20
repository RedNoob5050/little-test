local RepStore = game:GetService("ReplicatedStorage")

local Remotes = RepStore.Remotes
local Modules = RepStore.Modules


local Funcs = {}


Funcs.CreateTag = function(Plr, TagName: string)
    Modules.CreateTag(Plr, TagName)
end


Remotes.PlrRemote.OnServerEvent:Connect(function(Plr, Method, ...)
    if not Funcs[Method] then warn(Method.." isnt a valid method.") return end

    Funcs[Method](Plr, ...)
end)