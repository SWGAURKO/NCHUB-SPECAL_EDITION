local resourceName = 'ox_inventory'

if not GetResourceState(resourceName):find('start') then return end

SetTimeout(0, function()
    exports[resourceName]:registerHook('createItem', function(payload)
        local metadata = payload.metadata

        if not metadata.uuid then
            metadata.uuid = utils:uuid()
        end

        return metadata
    end, {
        print = false,
        itemFilter = {
            claw_machine = true,
        },
    })

    function bridge.addItem(source, name, amount, metadata)
        local success, _ = exports[resourceName]:AddItem(source, name, amount, metadata or {})

        if success then
            return true
        end

        local playerPed = GetPlayerPed(source)
        local coords = GetEntityCoords(playerPed)

        if coords then
            exports[resourceName]:CustomDrop('claw', {
                {name, amount, metadata}
            }, coords)
        end

        return false
    end

    function bridge.removeItem(source, name, amount)
        local success = exports[resourceName]:RemoveItem(source, name, amount)

        if success then
            return true
        end

        return false
    end

    function bridge.hasItem(source, item, amount)
        local count = exports[resourceName]:Search(source, 'count', item)
        if count >= amount then
            return true
        end

        return false
    end
end)
