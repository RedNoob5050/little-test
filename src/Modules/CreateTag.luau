local RunService = game:GetService("RunService")
local RepStore = game:GetService("ReplicatedStorage")

local Remotes = RepStore.Remotes

return function(Plr: player, TagName: string)
    if RunService:IsClient() == true then
        print("Ran CreateTag on the client, sending request to the server.")
        --[[
        basically to keep things consistent, im making it so this can only be ran on the server
        its fine because running it on the client just requests the server to do it instead, so you can still call it from anywhere
        ]]
        Remotes.PlrRemote:FireServer("CreateTag", TagName)

    else -- on the server
        if not Plr.Character then warn("No character exists for "..Plr.Name..", returning...") return end -- no character #LOL

        local Char = Plr.Character

        if not Char:FindFirstChild("TagFolder") then -- never had a tag before on this character
            local Folder = Instance.new("Folder")
            Folder.Name = "TagFolder"
            Folder.Parent = Char
        end

        local TagFolder = Char:WaitForChild("TagFolder") -- they'll always have one if this is ever called on their player

        if TagFolder:FindFirstChild(TagName) then -- already had this tag applied onto their character
            TagFolder:WaitForChild(TagName).Value += 1
        else -- never had this tag applied
            local Tag = Instance.new("IntValue")
            Tag.Name = TagName
            Tag.Parent = TagFolder
        end
    end
end