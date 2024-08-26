function saveMachines()
    local file = { "return {\n}" }
    file[1] = file[1]:gsub('}$', '')

    local fileSize = #file

    local format = [[
	['%s'] = {
        uuid = '%s',
        coords = %s,
        heading = %s,
        durability = %s,
        owner = '%s',
        toys = '%s',
        price = %s,
        collected = %s,
        claw = '%s'
	},
]]
    for _, machine in pairs(machines) do
        fileSize += 1
        file[fileSize] = (format):format(
            machine.uuid,
            machine.uuid,
            machine.coords,
            machine.heading,
            machine.durability,
            machine.owner,
            json.encode(machine.toys),
            machine.price,
            machine.collected,
            json.encode(machine.claw)
        )
    end

    file[fileSize + 1] = '}'
    SaveResourceFile(GetCurrentResourceName(), 'data/machines.lua', table.concat(file), -1)
end

function loadMachines()
    local chunk = LoadResourceFile(GetCurrentResourceName(), 'data/machines.lua')

    if chunk then
        local func, err = load(chunk, file)

        if err then
            return
        end

        local loaded = func()

        while GetNumPlayerIndices() < 1 do
            Wait(1000)
        end

        for _, machine in pairs(loaded) do
            machine.claw = json.decode(machine.claw)

            local tempMachine = {
                coords = machine.coords,
                heading = machine.heading,
                uuid = machine.uuid,
                durability = machine.durability or 100,
                owner = machine.owner,
                toys = json.decode(machine.toys) or {},
                busy = false,
                price = 0,
                collected = 0
            }

            CreateThread(function()
                tempMachine.object = CreateObject(GetHashKey('ch_prop_arcade_claw_01a'), machine.coords.x, machine.coords.y, machine.coords.z, true, true, false)
                SetEntityHeading(tempMachine.object, machine.heading)

                tempMachine.claw = {}

                while not DoesEntityExist(tempMachine.object) do
                    Wait(0)
                end

                SetEntityHeading(tempMachine.object, machine.heading)

                tempMachine.claw.firstRail = CreateObjectNoOffset(GetHashKey('ch_prop_arcade_claw_01a_r2'), machine.claw.firstRailCoords.x, machine.claw.firstRailCoords.y, machine.claw.firstRailCoords.z, true, true, false)
                tempMachine.claw.firstRailCoords = machine.claw.firstRailCoords

                while not DoesEntityExist(tempMachine.claw.firstRail) do
                    Wait(0)
                end

                tempMachine.claw.secondRail = CreateObjectNoOffset(GetHashKey('ch_prop_arcade_claw_01a_r1'), machine.claw.secondRailCoords.x, machine.claw.secondRailCoords.y, machine.claw.secondRailCoords.z, true, true, false)
                tempMachine.claw.secondRailCoords = machine.claw.secondRailCoords

                while not DoesEntityExist(tempMachine.claw.secondRail) do
                    Wait(0)
                end

                tempMachine.claw.claw = CreateObjectNoOffset(GetHashKey('ch_prop_arcade_claw_01a_c_d'), machine.claw.clawCoords.x, machine.claw.clawCoords.y, machine.claw.clawCoords.z, true, true, false)
                tempMachine.claw.clawCoords = machine.claw.clawCoords

                while not DoesEntityExist(tempMachine.claw.claw) do
                    Wait(0)
                end

                SetEntityHeading(tempMachine.claw.firstRail, machine.heading)
                SetEntityHeading(tempMachine.claw.secondRail, machine.heading)
                SetEntityHeading(tempMachine.claw.claw, machine.heading)

                tempMachine.originalCoords = {
                    firstRail = machine.claw.firstRailCoords,
                    secondRail = machine.claw.secondRailCoords,
                    claw = machine.claw.clawCoords
                }

                tempMachine.netId = NetworkGetNetworkIdFromEntity(tempMachine.object)
                print(tempMachine.netId)
                tempMachine.claw.firstRailNetId = NetworkGetNetworkIdFromEntity(tempMachine.claw.firstRail)
                tempMachine.claw.secondRailNetId = NetworkGetNetworkIdFromEntity(tempMachine.claw.secondRail)
                tempMachine.claw.clawNetId = NetworkGetNetworkIdFromEntity(tempMachine.claw.claw)

                for _, toy in pairs(json.decode(machine.toys)) do
                    if not toy then
                        goto continue
                    end

                    tempMachine.toys[_] = {
                        item = toy.item,
                        chance = (tonumber(toy.chance) < 0 or tonumber(toy.chance) > 100) and config.chanceForPickup or tonumber(toy.chance),
                        dropChance = (tonumber(toy.dropChance) < 0 or tonumber(toy.dropChance) > 100) and config.chanceToDropItem or tonumber(toy.dropChance),
                    }

                    tempMachine.toys[_].object = CreateObjectNoOffset(GetHashKey(config.availableToys[toy.item].model), toy.coords.x, toy.coords.y, toy.coords.z, true, true, false)

                    while not DoesEntityExist(tempMachine.toys[_].object) do
                        Wait(0)
                    end

                    SetEntityHeading(tempMachine.toys[_].object, tempMachine.heading)
                    tempMachine.toys[_].netId = NetworkGetNetworkIdFromEntity(tempMachine.toys[_].object)
                    tempMachine.toys[_].coords = vector3(toy.coords.x, toy.coords.y, toy.coords.z)
                    tempMachine.toys[_].item = toy.item

                    FreezeEntityPosition(tempMachine.toys[_].object, true)

                    ::continue::
                end

                machines[machine.uuid] = tempMachine

                TriggerClientEvent("nc_claw:newMachinePlaced", -1, machines[machine.uuid])
            end)
        end
    end

end

Citizen.CreateThread(function()
    Wait(1000)
    loadMachines()
end)
