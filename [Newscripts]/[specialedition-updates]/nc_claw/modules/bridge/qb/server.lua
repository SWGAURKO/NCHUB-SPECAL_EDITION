local resourceName = 'qb-core'

if not GetResourceState(resourceName):find('start') then return end

SetTimeout(0, function()
    QB = exports[resourceName]:GetCoreObject()
    core = QB

    function bridge.getIdentifier(source)
        local player = core.Functions.GetPlayer(source)

        if player then
            return player.PlayerData.citizenid
        end

        return source
    end

    function bridge.addMoney(source, amount)
        local Player = core.Functions.GetPlayer(source)

        if Player and Player.Functions.AddMoney('cash', amount, 'Claw machine refund') then
            return true
        end

        return false
    end

    function bridge.removeMoney(source, amount)
        local Player = core.Functions.GetPlayer(source)

        if Player and Player.Functions.RemoveMoney('cash', amount, 'Claw machine payment') then
            return true
        end

        return false
    end

    shared.framework = 'qb'
end)
