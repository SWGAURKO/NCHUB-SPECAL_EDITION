local resourceName = 'qs-inventory'

if not GetResourceState(resourceName):find('start') then return end

SetTimeout(0, function()
    if shared.framework == 'esx' then
        local QS = nil
        TriggerEvent('qs-core:getSharedObject', function(library) QS = library end)

        while not QS do Citizen.Wait(0) end

        QS.RegisterUsableItem(config.clawMachineItemName, function(source, item)
            local started = lib.callback.await('nc_claw:startPlacingMachine', source, item.info?.uuid or utils:uuid(), item.info.durability or 100)

            if started then
                bridge.removeItem(source, config.clawMachineItemName, 1, item.slot)
            end
        end)

        for item, _ in pairs(config.availableToys) do
            QS.RegisterUsableItem(item, function(source, item)
                lib.callback.await('nc_claw:usedPlushie', source, item)
            end)
        end

        function bridge.addItem(source, name, amount, metadata)
            local player = core.GetPlayerFromId(source)

            if not player then return false end

            TriggerEvent('qs-inventory:addItem', source, name, amount, false, metadata)

            return true
        end

        function bridge.removeItem(source, name, amount, slot)
            local qplayer = QS.GetPlayerFromId(source)

            if not qplayer then return false end

            local success = qplayer.removeItem(name, amount, slot or nil)

            if success then
                return true
            end

            return false
        end

        function bridge.hasItem(source, item, amount)
            local Player = QS.GetPlayerFromId(source)

            if Player ~= nil then
                local found = Player.GetItemByName(item)

                if not found then
                    return false
                end

                local count = found.amount or found.count

                if count >= amount then
                    return true
                end

                return false
            end

            return false
        end
    end

    if shared.framework == 'qb' then
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
                local found = Player.Functions.GetItemByName(item, amount)

                if not found then
                    return false
                end

                local count = found.amount or found.count

                if count >= amount then
                    return true
                end

                return false
            end

            return false
        end
    end
end)
