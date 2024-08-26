machines = {}

lib.callback.register("nc_claw:setMachinePrice", function(source, uuid, price)
    if machines[uuid] == nil then
        return false
    end

    if machines[uuid].owner ~= bridge.getIdentifier(source) then
        return false
    end

    machines[uuid].price = price

    TriggerClientEvent('nc_claw:machinePriceUpdated', -1, uuid, price)

    return true
end)

lib.callback.register("nc_claw:isMachineBusy", function(source, uuid)
    if machines[uuid] == nil then
        return true
    end

    return machines[uuid].isBusy
end)

lib.callback.register("nc_claw:setMachineBusy", function(source, uuid, toggle)
    if machines[uuid] == nil then
        return false
    end

    machines[uuid].isBusy = toggle
    machines[uuid].isBusyBy = source

    return true
end)

lib.callback.register("nc_claw:givePrize", function(source, uuid, spot)
    if machines[uuid] == nil then
        return false
    end

    if machines[uuid].toys[spot] == nil then
        return false
    end

    local toy = machines[uuid].toys[spot]

    if DoesEntityExist(NetworkGetEntityFromNetworkId(toy.netId)) then
        DeleteEntity(NetworkGetEntityFromNetworkId(toy.netId))
    end

    bridge.addItem(source, toy.item, 1, {
        durability = 100,
    })

    machines[uuid].toys[spot] = nil
    machines[uuid].prize = {}

    TriggerClientEvent('nc_claw:toyRefilled', -1, uuid, machines[uuid].toys)
    saveMachines()

    return true
end)

lib.callback.register("nc_claw:refillToy", function(source, uuid, spot, item, chance, dropChance)
    if spot == nil or item == nil then
        return false
    end

    spot = tonumber(spot)

    if machines[uuid] == nil then
        return false
    end

    if machines[uuid].owner ~= bridge.getIdentifier(source) then
        return false
    end

    if machines[uuid].isBusy then
        return false
    end

    if machines[uuid].toys[spot] ~= nil then
        return false
    end

    if config.availableToys[item] == nil then
        return false
    end

    local offset = config.toySpotOffsets[spot]

    if offset == nil then
        return false
    end

    if config.needsToHaveToyInInventory and not bridge.hasItem(source, item, 1) then
        return false
    end

    if config.chargeForToyRefill and config.chargeForToyRefill > 0 and not bridge.removeMoney(source, config.chargeForToyRefill) then
        return false
    end

    if config.needsToHaveToyInInventory then
        bridge.removeItem(source, item, 1)
    end

    machines[uuid].toys[spot] = {
        item = item,
        chance = (tonumber(chance) < 0 or tonumber(chance) > 100) and config.chanceForPickup or tonumber(chance),
        dropChance = (tonumber(dropChance) < 0 or tonumber(dropChance) > 100) and config.chanceToDropItem or tonumber(dropChance),
    }

    local machineCoords = lib.callback.await("nc_claw:GetObjectOffsetFromCoords", source, machines[uuid].coords, machines[uuid].heading, offset)
    machines[uuid].toys[spot].object = CreateObjectNoOffset(GetHashKey(config.availableToys[item].model), machineCoords.x, machineCoords.y, machineCoords.z, true, true, false)

    while not DoesEntityExist(machines[uuid].toys[spot].object) do
        Wait(0)
    end

    SetEntityHeading(machines[uuid].toys[spot].object, machines[uuid].heading)
    machines[uuid].toys[spot].netId = NetworkGetNetworkIdFromEntity(machines[uuid].toys[spot].object)
    machines[uuid].toys[spot].coords = machineCoords
    machines[uuid].toys[spot].item = item

    FreezeEntityPosition(machines[uuid].toys[spot].object, true)

    TriggerClientEvent('nc_claw:toyRefilled', -1, uuid, machines[uuid].toys)
    saveMachines()

    return true
end)

lib.callback.register("nc_claw:pulloutToy", function(source, uuid, spot)
    spot = tonumber(spot)
    if machines[uuid] == nil then
        return false
    end

    if machines[uuid].toys[spot] == nil then
        return false
    end

    if machines[uuid].isBusy then
        return false
    end

    local toy = machines[uuid].toys[spot]

    if DoesEntityExist(NetworkGetEntityFromNetworkId(toy.netId)) then
        DeleteEntity(NetworkGetEntityFromNetworkId(toy.netId))
    end

    machines[uuid].toys[spot] = nil

    if config.needsToHaveToyInInventory then
        bridge.addItem(source, toy.item, 1, {
            durability = 100,
        })
    end

    if config.chargeForToyRefill then
        bridge.addMoney(source, config.chargeForToyRefill)
    end

    TriggerClientEvent('nc_claw:toyRefilled', -1, uuid, machines[uuid].toys)
    saveMachines()

    return true
end)

lib.callback.register("nc_claw:chargePlay", function(source, uuid)
    if machines[uuid] == nil then
        return false
    end

    if machines[uuid].price == nil or machines[uuid].price == 0 then
        return true
    end

    if not bridge.removeMoney(source, machines[uuid].price) then
        return false
    end

    if machines[uuid].collected == nil then
        machines[uuid].collected = 0
    end

    machines[uuid].collected = machines[uuid].collected + machines[uuid].price

    TriggerClientEvent("nc_claw:updateColected", -1, uuid, machines[uuid].collected)

    return true
end)

lib.callback.register("nc_claw:pickupMachine", function(source, uuid)
    if machines[uuid] == nil then
        return false
    end

    if machines[uuid].owner ~= bridge.getIdentifier(source) then
        return false
    end

    if utils:tableLength(machines[uuid].toys) > 0 then
        return false
    end

    if machines[uuid].owner ~= bridge.getIdentifier(source) then
        return false
    end

    bridge.addItem(source, config.clawMachineItemName, 1, {
        uuid = uuid,
        durability = machines[uuid].durability,
    })

    bridge.addMoney(source, machines[uuid].collected)

    if DoesEntityExist(NetworkGetEntityFromNetworkId(machines[uuid].netId)) then
        DeleteEntity(NetworkGetEntityFromNetworkId(machines[uuid].netId))
        DeleteEntity(machines[uuid].object)
        DeleteEntity(machines[uuid].claw.firstRail)
        DeleteEntity(machines[uuid].claw.secondRail)
        DeleteEntity(machines[uuid].claw.claw)
        DeleteEntity(machines[uuid].claw.claw2)
    end

    machines[uuid] = nil

    TriggerClientEvent("nc_claw:removeMachine", -1, uuid)

    saveMachines()

    return true
end)

lib.callback.register("nc_claw:collectMoney", function(source, uuid)
    if machines[uuid] == nil then
        return false
    end

    if machines[uuid].owner ~= bridge.getIdentifier(source) then
        return false
    end

    if utils:tableLength(machines[uuid].toys) > 0 then
        return false
    end

    if machines[uuid].owner ~= bridge.getIdentifier(source) then
        return false
    end

    if machines[uuid].collected == nil or machines[uuid].collected == 0 then
        return true
    end

    bridge.addMoney(source, machines[uuid].collected)

    machines[uuid].collected = 0

    TriggerClientEvent("nc_claw:updateColected", -1, uuid, machines[uuid].collected)

    return true
end)

lib.callback.register("nc_claw:isMachineOnCooldown", function(source, uuid)
    if machines[uuid] == nil then
        return false
    end

    if machines[uuid].cooldown == nil or machines[uuid].cooldown == 0 then
        return false
    end

    if machines[uuid].cooldown < GetGameTimer() then
        return false
    end

    return true
end)

lib.callback.register("nc_claw:hackedReward", function(source, uuid)
    if machines[uuid] == nil then
        return false
    end

    if machines[uuid].owner == bridge.getIdentifier(source) then
        return false
    end

    if machines[uuid].collected == nil or machines[uuid].collected == 0 then
        if config.cooldownAfterSuccessfulHack then
            machines[uuid].cooldown = GetGameTimer() + (config.cooldownAfterSuccessfulHack * 1000)
        end

        return true
    end

    local reward = math.floor(machines[uuid].collected * config.hackRewardPercentage)

    machines[uuid].collected = machines[uuid].collected - reward

    if machines[uuid].collected < 0 then
        machines[uuid].collected = 0
    end

    if config.cooldownAfterSuccessfulHack then
        machines[uuid].cooldown = GetGameTimer() + (config.cooldownAfterSuccessfulHack * 1000)
    end

    TriggerClientEvent("nc_claw:updateColected", -1, uuid, machines[uuid].collected)


    bridge.addMoney(source, reward)

    return true
end)

lib.callback.register("nc_claw:doesMachineNeedReset", function(source, uuid)
    if machines[uuid] == nil then
        return false
    end

    if not machines[uuid].isBusy then
        return false
    end

    if GetPlayerName(machines[uuid].isBusyBy) ~= nil and #(GetEntityCoords(GetEntityCoords(GetPlayerPed(source))) - machines[uuid].coords) < 5 then
        return false
    end

    local machine = machines[uuid]
    machine.isBusy = false
    machine.isBusyBy = nil

    SetEntityCoords(NetworkGetEntityFromNetworkId(machine.claw.firstRailNetId), machine.originalCoords.firstRail.x, machine.originalCoords.firstRail.y, machine.originalCoords.firstRail.z, false, false, false, false)
    SetEntityCoords(NetworkGetEntityFromNetworkId(machine.claw.secondRailNetId), machine.originalCoords.secondRail.x, machine.originalCoords.secondRail.y, machine.originalCoords.secondRail.z, false, false, false, false)
    SetEntityCoords(NetworkGetEntityFromNetworkId(machine.claw.clawNetId), machine.originalCoords.claw.x, machine.originalCoords.claw.y, machine.originalCoords.claw.z, false, false, false, false)

    if not machine.prize.netEntity then
        return true
    end

    if not DoesEntityExist(NetworkGetEntityFromNetworkId(machine.prize.netEntity)) then
        return true
    end

    DeleteEntity(NetworkGetEntityFromNetworkId(machine.prize.netEntity))

    local offset = config.toySpotOffsets[machine.prize.spot]

    local machineCoords = lib.callback.await("nc_claw:GetObjectOffsetFromCoords", source, machine.coords, machine.heading, offset)
    machine.toys[machine.prize.spot].object = CreateObjectNoOffset(GetHashKey(config.availableToys[machine.toys[machine.prize.spot].item].model), machineCoords.x, machineCoords.y, machineCoords.z, true, true, true)

    while not DoesEntityExist(machine.toys[machine.prize.spot].object) do
        Wait(0)
    end

    SetEntityHeading(machine.toys[machine.prize.spot].object, machine.heading)

    FreezeEntityPosition(machine.toys[machine.prize.spot].object, true)

    machine.prize = {}
end)

RegisterNetEvent("nc_claw:playerLoaded", function()
    local src = source

    Citizen.CreateThread(function()
        Wait(1000)

        for _, machine in pairs(machines) do
            TriggerClientEvent("nc_claw:newMachinePlaced", src, machine)
        end
    end)
end)

AddEventHandler("onResourceStop", function(resource)
    if resource == GetCurrentResourceName() then
        for _, machine in pairs(machines) do
            if DoesEntityExist(machine.object) then
                DeleteEntity(machine.object)
            end

            if DoesEntityExist(machine.claw.firstRail) then
                DeleteEntity(machine.claw.firstRail)
            end

            if DoesEntityExist(machine.claw.secondRail) then
                DeleteEntity(machine.claw.secondRail)
            end

            if DoesEntityExist(machine.claw.claw) then
                DeleteEntity(machine.claw.claw)
            end

            for _, toy in pairs(machine.toys) do
                if DoesEntityExist(toy.object) then
                    DeleteEntity(toy.object)
                end
            end
        end
    end
end)
