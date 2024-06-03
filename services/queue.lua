local Lib = require 'functions'
Queue = {  }
Queue.__index = Queue

function Queue:new()

    local queue = {
        partys = {  }
    }

    setmetatable(queue, Queue)

    return queue
end

function Queue:addParty(party)

    self.partys[#self.partys + 1] = party

    if self:getPlayerCount() >= 10 then
        self:canStartMatch()
    end
end

function Queue:removeParty(party)

    for partyIdx = 1, #self.partys do

        local queueParty = self.partys[partyIdx]

        if queueParty.id == party.id then
            table.remove(self.partys, partyIdx)
            return 
        end
    end
end

function Queue:getPartys()
    return self.partys
end

function Queue:getPlayerCount()

    local playerCount = 0

    for _, party in ipairs(self.partys) do
        playerCount = playerCount + party:getPlayerCount()
    end

    return playerCount
end

function Queue:matchmaker(players)

    local teamA, teamB = {  }, {  }

    local i = 1

    local function addPartyToTeam(team, party)

        for playerIdx = 1, #party do
            team[#team + 1] = party[playerIdx]
        end
    end

    while #teamA < 5 or #teamB < 5 do

        if i > #players then return end

        if #teamA + #players[i] <= 5 then
            addPartyToTeam(teamA, players[i])
        elseif #teamB + #players[i] <= 5 then
            addPartyToTeam(teamB, players[i])
        else
            i = i + 1
            goto continue
        end

        table.remove(players, i)
        i = 1

        ::continue::
    end

    if #teamA ~= 5 or #teamB ~= 5 then return end

    return {
        teamA,
        teamB
    }
end

function Queue:canStartMatch()

    local partys = Lib.GetPartys()

    local players = {  }

    for partyIdx = 1, #partys do

        local party = partys[partyIdx]:getPlayers()

        local partyPlayers = {  }

        for playerIdx = 1, #party do
            partyPlayers[#partyPlayers + 1] = party[playerIdx]
        end

        players[#players + 1] = partyPlayers
    end

    local teams = self:matchmaker(players)

    if not teams then return end

    local partyIds = {  }

    for teamIdx = 1, #teams do
        local team = teams[teamIdx]

        for playerIdx = 1, #team do
            local player = Lib.GetPlayerById(team[playerIdx])
            partyIds[tostring(player:getPartyId())] = {  }
        end
    end

    for partyId, _ in pairs(partyIds) do
        self:removeParty(Lib.GetPartyById(tonumber(partyId)))
    end

    self:startMatch(teams)
end

function Queue:startMatch(teams)

    local teamA = Lib.CreateTeam('Atacantes', teams[1], 'attacker')
    local teamB = Lib.CreateTeam('Defensores', teams[2], 'defender')

    local match = Lib.CreateMatch(Lib)
    match:addTeams(teamA:getId(), teamB:getId())

    print('--------------------------')
    print('Nome do time: ', teamA:getName())
    print('Tipo do time: ', teamA:getType())
    print('Id dos jogadores: ', ('[ %s | %s | %s | %s | %s ]'):format(table.unpack(teamA:getMembers())))
    print('Jogadores: ')
    for memberIdx = 1, #teamA:getMembers() do
        local player = Lib.GetPlayerById(memberIdx)
        print(('%s | %s'):format(player:getName(), player:getId()))
    end
    print('Quantidade no time: ', teamA:getMemberCount())
    print('--------------------------')
    print('Nome do time: ', teamB:getName())
    print('Tipo do time: ', teamB:getType())
    print('Id dos jogadores: ', ('[ %s | %s | %s | %s | %s ]'):format(table.unpack(teamB:getMembers())))
    print('Jogadores: ')
    for memberIdx = 1, #teamB:getMembers() do
        local player = Lib.GetPlayerById(memberIdx)
        print(('%s | %s'):format(player:getName(), player:getId()))
    end
    print('Quantidade no time: ', teamB:getMemberCount())
    print('--------------------------')
    print('Total de players na partida: ', match:getPlayerCount())

    -- SOLUÇÃO REQUERIDA
    -- 4. O consumo de uma função (Fictícia), quando os times estiverem prontos para iniciar a partida;
    match:start()
end

return Queue