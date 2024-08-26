function newClawMachine(source, data)
    if machines[data.uuid] ~= nil then
        return false
    end

    machines[data.uuid] = {
        coords = data.coords,
        heading = data.heading,
        uuid = data.uuid,
        durability = data.durability or 100,
        owner = bridge.getIdentifier(source),
        toys = {},
        busy = false,
        price = 0,
        collected = 0
    }

    CreateThread(function()
        machines[data.uuid].object = CreateObject(GetHashKey('ch_prop_arcade_claw_01a'), data.coords.x, data.coords.y, data.coords.z, true, true, false)
        SetEntityHeading(machines[data.uuid].object, data.heading)

        machines[data.uuid].claw = {}

        while not DoesEntityExist(machines[data.uuid].object) do
            Wait(0)
        end

        local machineCoords = GetEntityCoords(machines[data.uuid].object)
        local firstRailCoords = lib.callback.await("nc_claw:GetObjectOffsetFromCoords", source, machineCoords, data.heading, {-0.29, -0.07, 1.723})
        local secondRailCoords = lib.callback.await("nc_claw:GetObjectOffsetFromCoords", source, machineCoords, data.heading, {0.00, -0.07, 1.785})
        local clawCoords = lib.callback.await("nc_claw:GetObjectOffsetFromCoords", source, machineCoords, data.heading, {-0.29, -0.07, 1.68})

        machines[data.uuid].claw.firstRail = CreateObjectNoOffset(GetHashKey('ch_prop_arcade_claw_01a_r2'), firstRailCoords.x, firstRailCoords.y, firstRailCoords.z, true, true, false)
        while not DoesEntityExist(machines[data.uuid].claw.firstRail) do
            Wait(0)
        end
        machines[data.uuid].claw.firstRailCoords = firstRailCoords
        machines[data.uuid].claw.secondRail = CreateObjectNoOffset(GetHashKey('ch_prop_arcade_claw_01a_r1'), secondRailCoords.x, secondRailCoords.y, secondRailCoords.z, true, true, false)
        while not DoesEntityExist(machines[data.uuid].claw.secondRail) do
            Wait(0)
        end
        machines[data.uuid].claw.secondRailCoords = secondRailCoords
        machines[data.uuid].claw.claw = CreateObjectNoOffset(GetHashKey('ch_prop_arcade_claw_01a_c_d'), clawCoords.x, clawCoords.y, clawCoords.z, true, true, false)
        while not DoesEntityExist(machines[data.uuid].claw.claw) do
            Wait(0)
        end
        machines[data.uuid].claw.clawCoords = clawCoords


        SetEntityHeading(machines[data.uuid].claw.firstRail, data.heading)
        SetEntityHeading(machines[data.uuid].claw.secondRail, data.heading)
        SetEntityHeading(machines[data.uuid].claw.claw, data.heading)

        machines[data.uuid].originalCoords = {
            firstRail = firstRailCoords,
            secondRail = secondRailCoords,
            claw = clawCoords
        }


        machines[data.uuid].netId = NetworkGetNetworkIdFromEntity(machines[data.uuid].object)
        machines[data.uuid].claw.firstRailNetId = NetworkGetNetworkIdFromEntity(machines[data.uuid].claw.firstRail)
        machines[data.uuid].claw.secondRailNetId = NetworkGetNetworkIdFromEntity(machines[data.uuid].claw.secondRail)
        machines[data.uuid].claw.clawNetId = NetworkGetNetworkIdFromEntity(machines[data.uuid].claw.claw)


        TriggerClientEvent("nc_claw:newMachinePlaced", -1, machines[data.uuid])
        saveMachines()
    end)
end




-- callbacks
lib.callback.register("nc_claw:newMachinePlaced", function(source, data)
    newClawMachine(source, data)

    return true
end)
