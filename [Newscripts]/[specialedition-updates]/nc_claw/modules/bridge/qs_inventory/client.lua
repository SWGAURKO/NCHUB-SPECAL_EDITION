local resourceName = 'qs-inventory'

if not GetResourceState(resourceName):find('start') then return end

SetTimeout(0, function()
    lib.callback.register("nc_claw:startPlacingMachine", function(uuid, durability)
        startPlacingClawMachine(uuid, durability)

        return true
    end)

    lib.callback.register("nc_claw:usedPlushie", function(data)
        if config.availableToys[data.name] then
            toyUsageDialog(data)
        end

        return true
    end)
end)
