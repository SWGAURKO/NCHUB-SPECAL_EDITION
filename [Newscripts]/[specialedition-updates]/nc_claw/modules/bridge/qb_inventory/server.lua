local resourceName = 'qb-inventory'
local ljResourceName = 'lj-inventory'

if not GetResourceState(resourceName):find('start') and not GetResourceState(ljResourceName):find('start') then return end

if GetResourceState(ljResourceName):find('start') then
    resourceName = ljResourceName
end

SetTimeout(0, function()
    core.Functions.CreateUseableItem(config.clawMachineItemName, function(source, item)
        local started = lib.callback.await('nc_claw:startPlacingMachine', source, item.info?.uuid or utils:uuid(), item.info.durability or 100)

        if started then
            bridge.removeItem(source, config.clawMachineItemName, 1, item.slot)
        end
    end)

    for item, _ in pairs(config.availableToys) do
        core.Functions.CreateUseableItem(item, function(source, item)
            lib.callback.await('nc_claw:usedPlushie', source, item)
        end)
    end

    function bridge.addItem(source, name, amount, metadata)
        local player = core.Functions.GetPlayer(source)

        if not player then return false end

        local success = player.Functions.AddItem(name, amount, nil, metadata or {})

        if success then
            return true
        end

        return false
    end

    function bridge.removeItem(source, name, amount, slot)
        local player = core.Functions.GetPlayer(source)

        if not player then return false end

        local success = player.Functions.RemoveItem(name, amount, slot or nil)

        if success then
            return true
        end

        return false
    end

    function bridge.hasItem(source, item, amount)
        local Player = core.Functions.GetPlayer(source)

        if Player ~= nil then
            local item = Player.Functions.GetItemByName(item, amount)

            if not item then
                return false
            end

            local count = item.amount or item.count

            if count >= amount then
                return true
            end

            return false
        end

        return false
    end
end)
