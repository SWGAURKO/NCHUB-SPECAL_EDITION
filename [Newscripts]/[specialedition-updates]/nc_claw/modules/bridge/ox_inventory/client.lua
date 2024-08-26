local resourceName = 'ox_inventory'

if not GetResourceState(resourceName):find('start') then return end

SetTimeout(0, function()
    exports('clawMachine', function(data, slot)
        if slot.metadata.uuid then
            exports[resourceName]:useItem(data, function(data)
                if data then
                    startPlacingClawMachine(slot.metadata.uuid, slot.metadata.durability)
                end
            end)
        end
    end)

    exports('usedPlushie', function(data, slot)
        if config.availableToys[data.name] then
            toyUsageDialog(data)
        end
    end)
end)
