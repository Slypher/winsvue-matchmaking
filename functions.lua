local Lib = {  }
local Data = require 'data'
local Player = require 'models.player'
local Party = require 'models.party'
local Team = require 'models.team'

function Lib.CreatePlayer(playerData)
    return Player:new(playerData)
end

function Lib.CreateParty()
    return Party:new()
end

function Lib.CreateTeam(attackers, defenders, type)
    return Team:new(attackers, defenders, type)
end

function Lib.CreateMatch(lib)
    local Match = require 'services.match'
    return Match:new(lib)
end

function Lib.GetPlayerById(playerId)

    for playerIdx = 1, #Data.Playes do

        local player = Data.Playes[playerIdx]

        if player.id == playerId then
            return player
        end
    end
end

function Lib.GetPartyById(partyId)

    for playerIdx = 1, #Data.Partys do

        local party = Data.Partys[playerIdx]

        if party.id == partyId then
            return party
        end
    end
end

function Lib.GetTeamById(teamId)

    for playerIdx = 1, #Data.Teams do

        local team = Data.Teams[playerIdx]

        if team.id == teamId then
            return team
        end
    end
end

function Lib.GetPartys()
    return Data.Partys
end

return Lib