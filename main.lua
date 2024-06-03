local Lib = require 'functions'
local Queue = require 'services.queue'

local queue = Queue:new()

do

    local party = Lib.CreateParty()

    local players = {
        { id = 1, partyId = party.id, name = 'ViperGT', leader = true }
    }

    for playerIdx = 1, #players do
        local player = Lib.CreatePlayer(players[playerIdx])
        party:addPlayer(player:getId())
    end

    queue:addParty(party)
end

do

    local party = Lib.CreateParty()

    local players = {
        { id = 2, partyId = party.id, name = 'BlazeGamer' },
        { id = 3, partyId = party.id, name = 'SpeedRacer' },
        { id = 4, partyId = party.id, name = 'ShadowNinja', leader = true },
        { id = 5, partyId = party.id, name = 'PhoenixFire' }
    }

    for playerIdx = 1, #players do
        local player = Lib.CreatePlayer(players[playerIdx])
        party:addPlayer(player:getId())
    end

    queue:addParty(party)
end

do

    local party = Lib.CreateParty()

    local players = {
        { id = 6, partyId = party.id, name = 'ThunderBolt', leader = true },
        { id = 7, partyId = party.id, name = 'GhostRider' }
    }

    for playerIdx = 1, #players do
        local player = Lib.CreatePlayer(players[playerIdx])
        party:addPlayer(player:getId())
    end

    queue:addParty(party)
end

do

    local party = Lib.CreateParty()

    local players = {
        { id = 8, partyId = party.id, name = 'NeonSpectre' },
        { id = 9, partyId = party.id, name = 'DriftKing', leader = true }
    }

    for playerIdx = 1, #players do
        local player = Lib.CreatePlayer(players[playerIdx])
        party:addPlayer(player:getId())
    end

    queue:addParty(party)
end

do

    local party = Lib.CreateParty()

    local players = {
        { id = 10, partyId = party.id, name = 'MidnightWolf', leader = true }
    }

    for playerIdx = 1, #players do
        local player = Lib.CreatePlayer(players[playerIdx], party)
        party:addPlayer(player:getId())
    end

    queue:addParty(party)
end

-- do

--     local party = Lib.CreateParty()

--     local players = {
--         { id = 11, partyId = party.id, name = 'MidnightWolf2', leader = true }
--     }

--     for playerIdx = 1, #players do
--         local player = Lib.CreatePlayer(players[playerIdx], party)
--         party:addPlayer(player:getId())
--     end

--     queue:addParty(party)
-- end