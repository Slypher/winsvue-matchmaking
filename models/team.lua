local Data = require 'data'

Team = {  }
Team.__index = Team

function Team:new(name, members, type)

    local team = {
        id = #Data.Teams + 1,
        name = name,
        type = type,
        members = members or {  }
    }

    Data.Teams[#Data.Teams + 1] = team
    setmetatable(team, Team)

    return team
end

function Team:getId()
    return self.id
end

function Team:getName()
    return self.name
end

function Team:getType()
    return self.type
end

function Team:getMembers()
    return self.members
end

function Team:getMemberCount()
    return #self.members
end

function Team:addMember(playerId)
    self.members[#self.members + 1] = playerId
end

return Team