local resourceName = 'es_extended'

if not GetResourceState(resourceName):find('start') then return end

SetTimeout(0, function()
    ESX = exports[resourceName]:getSharedObject()
    core = ESX

    function bridge.getIdentifier(source)
        local player = core.GetPlayerFromId(source)

        if player then
            return player.identifier
        end

        return source
    end

    function bridge.addMoney(source, amount, reason)
        local Player = core.GetPlayerFromId(source)

        if Player ~= nil then
            Player.addAccountMoney('money', amount, reason or 'Claw machine')

            return true
        end

        return false
    end

    function bridge.removeMoney(source, amount, reason)
        local Player = core.GetPlayerFromId(source)

        if Player ~= nil then
            local money = Player.getAccount('money').money

            if money >= amount then
                Player.removeAccountMoney('money', amount, reason or 'Claw machine')

                return true
            end

            return false
        end

        return false
    end

    shared.framework = 'esx'
end)
