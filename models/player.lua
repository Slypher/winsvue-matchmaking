local Data = require 'data'

Player = {  }
Player.__index = Player

function Player:new(playerData)

    local player = {
        id = playerData.id,
        name = playerData.name,
        leader = playerData.leader,
        partyId = playerData.partyId,
        teamId = playerData.teamId
    }

    Data.Playes[#Data.Playes + 1] = player
    setmetatable(player, Player)

    return player
end

function Player:getId()
    return self.id
end

function Player:getName()
    return self.name
end

function Player:getPartyId()
    return self.partyId
end

function Player:isLeader()
    return self.leader
end

function Player:setTeamId(teamId)
    self.teamId = teamId
end

return Player