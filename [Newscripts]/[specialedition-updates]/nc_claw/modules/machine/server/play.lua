RegisterNetEvent("nc_claw:updateVerticalMovementNearBy", function(uuid, newFirstRailCoords, newSecondRailCoords, newClawCoords)
    if machines[uuid] == nil then
        return
    end

    machines[uuid].claw.firstRailCoords = newFirstRailCoords
    machines[uuid].claw.secondRailCoords = newSecondRailCoords
    machines[uuid].claw.clawCoords = newClawCoords

    TriggerClientEvent("nc_claw:updateVerticalMovementNearBy", -1, source, uuid, newFirstRailCoords, newSecondRailCoords, newClawCoords)
end)

RegisterNetEvent("nc_claw:updateHorizontalMovementNearBy", function(uuid, newFirstRailCoords, newClawCoords)
    if machines[uuid] == nil then
        return
    end

    machines[uuid].claw.firstRailCoords = newFirstRailCoords
    machines[uuid].claw.clawCoords = newClawCoords

    TriggerClientEvent("nc_claw:updateHorizontalMovementNearBy", -1, source, uuid, newFirstRailCoords, newClawCoords)

    return
end)

RegisterNetEvent("nc_claw:updateVerticalMovement", function(uuid, newFirstRailCoords, newSecondRailCoords, newClawCoords, continue)
    if machines[uuid] == nil then
        return
    end

    machines[uuid].claw.firstRailCoords = newFirstRailCoords
    machines[uuid].claw.secondRailCoords = newSecondRailCoords
    machines[uuid].claw.clawCoords = newClawCoords

    SetEntityCoords(machines[uuid].claw.firstRail, newFirstRailCoords.x, newFirstRailCoords.y, newFirstRailCoords.z, false, false, false, false)
    SetEntityCoords(machines[uuid].claw.secondRail, newSecondRailCoords.x, newSecondRailCoords.y, newSecondRailCoords.z, false, false, false, false)
    SetEntityCoords(machines[uuid].claw.claw, newClawCoords.x, newClawCoords.y, newClawCoords.z, false, false, false, false)

    if continue then
        TriggerClientEvent("nc_claw:clawReturned", source, uuid)
    end
end)

RegisterNetEvent("nc_claw:updateHorizontalMovement", function(uuid, newFirstRailCoords, newClawCoords)
    if machines[uuid] == nil then
        return
    end

    machines[uuid].claw.firstRailCoords = newFirstRailCoords
    machines[uuid].claw.clawCoords = newClawCoords

    SetEntityCoords(machines[uuid].claw.firstRail, newFirstRailCoords.x, newFirstRailCoords.y, newFirstRailCoords.z, false, false, false, false)
    SetEntityCoords(machines[uuid].claw.claw, newClawCoords.x, newClawCoords.y, newClawCoords.z, false, false, false, false)
end)

RegisterNetEvent("nc_claw:prizeWon", function(uuid, netEntity, spot)
    if machines[uuid] == nil then
        return false
    end

    if machines[uuid].toys[spot] == nil then
        return false
    end

    machines[uuid].prize = {}
    machines[uuid].prize.netEntity = netEntity
    machines[uuid].prize.spot = spot
end)

RegisterNetEvent("nc_claw:playPickupAnimNearBy", function(uuid)
    if machines[uuid] == nil then
        return
    end

    TriggerClientEvent("nc_claw:playPickupAnimNearBy", -1, source, uuid)
end)

RegisterNetEvent("nc_claw:srv:pickupHandler", function(uuid, entityHit)
    TriggerClientEvent("nc_claw:pickupHandler", -1, uuid, entityHit)
end)

RegisterNetEvent("nc_claw:srv:detachHandler", function(uuid, entityHit, delete)
    TriggerClientEvent("nc_claw:detachHandler", -1, uuid, entityHit, delete)
end)

RegisterNetEvent("nc_claw:srv:detachAndReturnHandler", function(uuid, entityHit, originalRotation, originalCoords)
    TriggerClientEvent("nc_claw:detachAndReturnHandler", -1, uuid, entityHit, originalRotation, originalCoords)
end)
