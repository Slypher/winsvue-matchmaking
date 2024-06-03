local Data = require 'data'

Party = {  }
Party.__index = Party

function Party:new(players)

    local party = {
        id = #Data.Partys + 1,
        players = players or {  }
    }

    Data.Partys[#Data.Partys + 1] = party

    setmetatable(party, Party)

    return party
end

function Party:getId()
    return self.id
end

function Party:addPlayer(playerId)
    self.players[#self.players + 1] = playerId
end

function Party:getPlayerCount()
    return #self.players
end

function Party:getPlayers()
    return self.players
end

return Party