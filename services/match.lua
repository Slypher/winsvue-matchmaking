local Data = require 'data'

Match = {  }
Match.__index = Match

function Match:new(lib)

    local match = {
        id = #Data.Matches + 1,
        lib = lib
    }

    Data.Matches[#Data.Matches + 1] = match

    setmetatable(match, Match)

    return match
end

function Match:getId()
    return self.id
end

function Match:addTeams(teamA, teamB)
    self.teamA = teamA
    self.teamB = teamB
end

function Match:getPlayerCount()
    local teamA = self.lib.GetTeamById(self:getTeamA())
    local teamB = self.lib.GetTeamById(self:getTeamB())

    return teamA:getMemberCount() + teamB:getMemberCount()
end

function Match:getTeamA()
    return self.teamA
end

function Match:getTeamB()
    return self.teamB
end

function Match:getTeams()

    return {
        teamA = self.teamA,
        teamB = self.teamB
    }
end

function Match:start()
    -- SOLUÇÃO REQUERIDA
    -- 4. O consumo de uma função (Fictícia), quando os times estiverem prontos para iniciar a partida;
end

return Match