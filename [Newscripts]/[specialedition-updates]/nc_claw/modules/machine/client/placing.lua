local tempMachines = {}
local count = 0

function startPlacingClawMachine(uuid, durability)
    local isTryingToPlace = true
    lib.showTextUI(([[
**%s** \
\
[%s] - %s \
[%s] - %s \
[%s] - %s \
[%s] - %s
]]):format(locale('instructions'), "E", locale('place'), "MWheelUp", locale('rotate'), "MWheelDown", locale('rotate'), "ESC", locale('exit')))

    local coords = GetEntityCoords(cache.ped)
    local tempObject = CreateObject(`ch_prop_arcade_claw_01a`, coords.x, coords.y, coords.z, false, false, false)
    local tempObjectHeading = 0.0
    local tempCoords = coords

    SetEntityHeading(tempObject, tempObjectHeading)
    SetEntityAlpha(tempObject, 100)
    SetEntityCollision(tempObject, false, false)


    local function removeTempObject(object)
        if DoesEntityExist(object) then
            DeleteObject(object)
        end
    end

    CreateThread(function()
        while isTryingToPlace do
            Wait(0)

            count = count + 1
            local index = ("machine_%s"):format(count)

            DisableControlAction(0, 22, true)

            local retval, hit, endCoords, _, entityHit = utils:cameraToWorld(1, tempObject)
            if hit and #(GetEntityCoords(cache.ped) - endCoords) < 10 then
                tempCoords = endCoords
            end

            SetEntityCoords(tempObject, tempCoords.x, tempCoords.y, tempCoords.z, false, false, false, false)
            PlaceObjectOnGroundProperly(tempObject)
            SetEntityHeading(tempObject, tempObjectHeading)

            if IsControlJustPressed(0, 38) then
                tempMachines[index] = {
                    uuid = uuid or nil,
                    durability = durability or nil,
                    object = tempObject,
                    coords = tempCoords,
                    heading = tempObjectHeading,
                    point = lib.points.new({
                        coords = tempCoords,
                        distance = 2.0,
                        machineIndex = index,
                    }),
                }

                local point = tempMachines[index].point

                function point:onEnter()
                    if cache.vehicle then return end
                    if not tempMachines[self.machineIndex] then return end

                    TaskTurnPedToFaceEntity(PlayerPedId(), tempMachines[self.machineIndex].object, 1000)
                    Wait(1100)

                    local done = bridge.progress({
                        label = locale('placing_machine'),
                        position = 'bottom',
                        duration = 1000,
                        canCancel = true,
                        disable = {
                            move = true,
                            car = true,
                            combat = true,
                        },
                        anim = {
                            dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@',
                            clip = 'machinic_loop_mechandplayer',
                        },
                    })

                    self:remove()

                    if done then
                        lib.callback("nc_claw:newMachinePlaced", false, nil, {
                            index = self.machineIndex,
                            coords = tempMachines[self.machineIndex].coords,
                            heading = tempMachines[self.machineIndex].heading,
                            uuid = tempMachines[self.machineIndex].uuid,
                            durability = tempMachines[self.machineIndex].durability or nil,
                        })

                        removeTempObject(tempMachines[self.machineIndex].object)
                        tempMachines[self.machineIndex] = nil
                        return
                    end

                    removeTempObject(tempMachines[self.machineIndex].object)
                    tempMachines[self.machineIndex] = nil
                    lib.callback("nc_claw:giveBackMachine", false, nil, uuid, durability)
                end

                isTryingToPlace = false
                lib.hideTextUI()
            end
            if IsControlJustPressed(0, 177) then
                isTryingToPlace = false
                removeTempObject(tempObject)
                lib.callback("nc_claw:giveBackMachine", false, nil, uuid, durability)
                lib.hideTextUI()
            end
            if IsControlJustPressed(0, 181) then
                tempObjectHeading = tempObjectHeading + 3
                if tempObjectHeading > 360 then tempObjectHeading = 0.0 end
            end
            if IsControlJustPressed(0, 180) then
                tempObjectHeading = tempObjectHeading - 3
                if tempObjectHeading < 0 then tempObjectHeading = 360.0 end
            end
        end
    end)
end

lib.callback.register('nc_claw:GetObjectOffsetFromCoords', function(coords, heading, offset)
    local newCoords = GetObjectOffsetFromCoords(coords.x, coords.y, coords.z, heading, table.unpack(offset))

    return newCoords
end)
