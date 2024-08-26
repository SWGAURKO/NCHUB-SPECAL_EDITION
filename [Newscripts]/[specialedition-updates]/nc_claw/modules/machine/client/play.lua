Game = {}
CurrentGame = nil

function Game:new(machine)
    assert(machine ~= nil, "Machine cannot be nil")
    assert(machines[machine.uuid] ~= nil, "Machine does not exist")

    if machine:isBusy() then
        bridge.notify(locale('this_machine_is_busy'), 'error')
        return false
    end

    if not lib.callback.await("nc_claw:chargePlay", false, machine.uuid) then
        bridge.notify(locale('you_do_not_have_enough_money'), 'error')
        return false
    end

    setmetatable({}, self)

    self.__index = self

    -- Game vars
    self.isPlaying = false
    self.currentScene = nil
    self.nextScene = nil
    self.machine = machine
    self.controlsDisabled = false

    self.forwardVector = GetEntityForwardVector(NetToObj(self.machine.netId))
    self.coords = GetEntityCoords(NetToObj(self.machine.netId))

    self.won = false
    self.wonSpot = false

    self.stage = 1

    self.xFactor = -0.29
    self.yFactor = -0.07

    self.localId = NetToObj(self.machine.netId)

    self.moveVertically = false
    self.movingVertically = false
    self.moveHorizontally = false
    self.movingHorizontally = false

    self.waitingForClawToReturn = false

    self.moveDown = false

    self.maxYFactor = 0.58
    self.minYFactor = -0.07

    self.maxXFactor = 0.29
    self.minXFactor = -0.29

    self.shapeCoords = nil

    self.cam = nil

    self.exit = false

    while not RequestScriptAudioBank("DLC_HEIST3/ARCADE_GENERAL_01", false) do Wait(0) end
    while not RequestScriptAudioBank("DLC_HEIST3/CLAW_MACHINE", false) do Wait(0) end

    return self
end

function Game:setupCam()
    local transitionSpeed = 0.0
    self.cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
    SetCamActiveWithInterp(self.cam, GetRenderingCam(), 3000.0, 0.0, 0.0)
    ShakeCam(cam, "HAND_SHAKE", 0.1)

    if GetCamViewModeForContext(0) == 4 then
        local camCoords = GetGameplayCamCoord()
        local camRot = GetGameplayCamRot(2)
        SetCamParams(self.cam, camCoords.x, camCoords.y, camCoords.z, camRot.x, camRot.y, camRot.z, GetGameplayCamFov(), 0, 1, 1, 2)
        transitionSpeed = 1000
    end

    local machineCoords = GetEntityCoords(self.localId)
    local c1 = GetObjectOffsetFromCoords(machineCoords.x, machineCoords.y, machineCoords.z, GetEntityHeading(self.localId), -0.000732422, -0.862213, 1.571)
    SetCamParams(self.cam, c1.x, c1.y, c1.z, -18.6932, 0, GetEntityHeading(self.localId), 50.6788, transitionSpeed, 1, 1, 2)
    RenderScriptCams(true, true, 500, true, true)

    Citizen.CreateThread(function()
        while self.cam do
            SetEntityLocallyInvisible(cache.ped)
            Wait(0)
        end
    end)
end

function Game:destroyCam()
    SetCamActiveWithInterp(GetRenderingCam(), self.cam, 3000.0, 0.0, 0.0)
    RenderScriptCams(false, true, 500, true, false)
    DestroyCam(self.cam, false)

    self.cam = nil
end

function Game:destroy()
    self.exit = true
    self.isPlaying = false
    self.controlsDisabled = false

    if self.currentScene ~= nil then
        DisposeSynchronizedScene(self.currentScene)
    end

    if self.nextScene ~= nil then
        DisposeSynchronizedScene(self.nextScene)
    end

    self.machine:setBusy(false)
    self.machine:setupPoint()

    CurrentGame = nil
end

function Game:checkDistance()
    local pointForStart = self.coords - (self.forwardVector * 0.75)
    if #(GetEntityCoords(cache.ped) - pointForStart) > 1.5 then
        bridge.notify(locale('you_are_too_far_from_the_machine'))
        return false
    end

    return true
end

function Game:isFemale()
    return GetEntityModel(cache.ped) == GetHashKey('mp_f_freemode_01')
end

function Game:getDict()
    if self:isFemale() then
        return 'anim_heist@arcade@claw@female@'
    else
        return 'anim_heist@arcade@claw@male@'
    end
end

function Game:disableControls()
    self.controlsDisabled = true

    Citizen.CreateThread(function()
        while self.controlsDisabled do
            DisableControlAction(0, 32, true)
            DisableControlAction(0, 9, true)
            DisableControlAction(0, 200, true)
            DisableControlAction(0, 25, true)
            DisableControlAction(0, 25, true)
            DisableControlAction(0, 63, true)
            DisableControlAction(0, 64, true)
            DisableControlAction(0, 71, true)
            DisableControlAction(0, 72, true)
            DisableControlAction(0, 75, true)
            DisableControlAction(0, 106, true)
            DisableControlAction(0, 18, true)
            SetPauseMenuActive(false)
            Wait(0)
        end
    end)
end

function Game:idleToGameScene()
    lib.requestAnimDict(self:getDict())

    local coords = GetEntityCoords(self.localId)
    local rotation = GetEntityRotation(self.localId)

    self.currentScene = NetworkCreateSynchronisedScene(coords.x, coords.y, coords.z, rotation.x, rotation.y, rotation.z, 2, true, true, 1.0, 1000.0, 1.0)
    NetworkAddPedToSynchronisedScene(cache.ped, self.currentScene, self:getDict(), "idle_to_game", 8.0, 8.0, 0, 0, 1000.0, 0)
    NetworkStartSynchronisedScene(self.currentScene)
    while NetworkGetLocalSceneFromNetworkId(self.currentScene) == -1 do Wait(0) end
    local localscene = NetworkGetLocalSceneFromNetworkId(self.currentScene)


    while GetSynchronizedScenePhase(localscene) < 0.99 do
        Wait(0)
    end

    RemoveAnimDict(self:getDict())
end

function Game:verticalMovementHandler(goBack)
    self.moveVertically = true

    Citizen.CreateThread(function()
        local coords = GetEntityCoords(self.localId)
        local heading = GetEntityHeading(self.localId)

        local soundId = GetSoundId()
        PlayAmbientSpeechFromPositionNative("CLAW_MOVING_ARM", "CLAW_MACHINE", self.machine.coords.x, self.machine.coords.y, self.machine.coords.z, "SPEECH_PARAMS_STANDARD")
        PlaySoundFromCoord(soundId, "move", coords.x, coords.y, coords.z, "dlc_ch_claw_crane_sounds", true, 10, false)
        SetVariableOnSound(soundId, "claw_speed", 0.5)

        local newFirstRailCoords = GetObjectOffsetFromCoords(coords.x, coords.y, coords.z, heading, table.unpack({-0.29, self.yFactor, 1.723}))
        local newSecondRailCoords = GetObjectOffsetFromCoords(coords.x, coords.y, coords.z, heading, table.unpack({0.00, self.yFactor, 1.785}))
        local newClawCoords = GetObjectOffsetFromCoords(coords.x, coords.y, coords.z, heading, table.unpack({-0.29, self.yFactor, 1.68}))

        self.moveVertically = SetInterval(function()
            if not self.moveVertically then return end

            if self.yFactor >= self.maxYFactor and not goBack then
                ClearInterval(self.moveVertically)
                self.moveVertically = false
                self.stage = 2

                return
            end

            if self.yFactor <= self.minYFactor and goBack then
                ClearInterval(self.moveVertically)
                self.moveVertically = false

                return
            end

            self.yFactor = goBack and self.yFactor - 0.001 or self.yFactor + 0.001
            newFirstRailCoords = GetObjectOffsetFromCoords(coords.x, coords.y, coords.z, heading, table.unpack({-0.29, self.yFactor, 1.723}))
            newSecondRailCoords = GetObjectOffsetFromCoords(coords.x, coords.y, coords.z, heading, table.unpack({0.00, self.yFactor, 1.785}))
            newClawCoords = GetObjectOffsetFromCoords(coords.x, coords.y, coords.z, heading, table.unpack({-0.29, self.yFactor, 1.68}))

            SetEntityCoordsNoOffset(NetToObj(self.machine.claw.firstRailNetId), newFirstRailCoords.x, newFirstRailCoords.y, newFirstRailCoords.z, false, false, false)
            SetEntityCoordsNoOffset(NetToObj(self.machine.claw.secondRailNetId), newSecondRailCoords.x, newSecondRailCoords.y, newSecondRailCoords.z, false, false, false)
            SetEntityCoordsNoOffset(NetToObj(self.machine.claw.clawNetId), newClawCoords.x, newClawCoords.y, newClawCoords.z, false, false, false)

            TriggerServerEvent('nc_claw:updateVerticalMovementNearBy', self.machine.uuid, newFirstRailCoords, newSecondRailCoords, newClawCoords)
        end, 10)

        while self.moveVertically do Wait(0) end

        Wait(0)
        StopSound(soundId)
        ReleaseSoundId(soundId)
        TriggerServerEvent('nc_claw:updateVerticalMovement', self.machine.uuid, newFirstRailCoords, newSecondRailCoords, newClawCoords)
    end)
end

function Game:horizontalMovementHandler(goBack)
    self.moveHorizontally = true

    Citizen.CreateThread(function()
        local coords = GetEntityCoords(self.localId)
        local heading = GetEntityHeading(self.localId)

        local soundId = GetSoundId()
        PlayAmbientSpeechFromPositionNative("CLAW_MOVING_ARM", "CLAW_MACHINE", self.machine.coords.x, self.machine.coords.y, self.machine.coords.z, "SPEECH_PARAMS_STANDARD")
        PlaySoundFromCoord(soundId, "move", coords.x, coords.y, coords.z, "dlc_ch_claw_crane_sounds", true, 10, false)
        SetVariableOnSound(soundId, "claw_speed", 0.5)

        local newFirstRailCoords = GetObjectOffsetFromCoords(coords.x, coords.y, coords.z, heading, table.unpack({self.xFactor, self.yFactor, 1.723}))
        local newClawCoords = GetObjectOffsetFromCoords(coords.x, coords.y, coords.z, heading, table.unpack({self.xFactor, self.yFactor, 1.68}))

        self.moveHorizontally = SetInterval(function()
            if not self.moveHorizontally then return end

            if self.xFactor >= self.maxXFactor and not goBack then
                ClearInterval(self.moveHorizontally)

                Wait(0)
                self.moveHorizontally = false
                self.stage = 3

                return
            end

            if self.xFactor <= self.minXFactor and goBack then
                ClearInterval(self.moveHorizontally)

                Wait(0)
                self.moveHorizontally = false

                return
            end

            self.xFactor = goBack and self.xFactor - 0.001 or self.xFactor + 0.001
            newFirstRailCoords = GetObjectOffsetFromCoords(coords.x, coords.y, coords.z, heading, table.unpack({self.xFactor, self.yFactor, 1.723}))
            newClawCoords = GetObjectOffsetFromCoords(coords.x, coords.y, coords.z, heading, table.unpack({self.xFactor, self.yFactor, 1.68}))

            SetEntityCoordsNoOffset(NetToObj(self.machine.claw.firstRailNetId), newFirstRailCoords.x, newFirstRailCoords.y, newFirstRailCoords.z, false, false, false)
            SetEntityCoordsNoOffset(NetToObj(self.machine.claw.clawNetId), newClawCoords.x, newClawCoords.y, newClawCoords.z, false, false, false)

            TriggerServerEvent('nc_claw:updateHorizontalMovementNearBy', self.machine.uuid, newFirstRailCoords, newClawCoords)
        end, 10)
        while self.moveHorizontally do Wait(0) end

        Wait(0)
        StopSound(soundId)
        ReleaseSoundId(soundId)
        TriggerServerEvent('nc_claw:updateHorizontalMovement', self.machine.uuid, newFirstRailCoords, newClawCoords)
    end)
end

function Game:exitClawMachine()
    lib.requestAnimDict(self:getDict())

    local coords = GetEntityCoords(self.localId)
    local rotation = GetEntityRotation(self.localId)

    self.nextScene = NetworkCreateSynchronisedScene(coords.x, coords.y, coords.z, rotation.x, rotation.y, rotation.z, 2, true, true, 1.0, 1000.0, 1.0)
    NetworkAddPedToSynchronisedScene(cache.ped, self.nextScene, self:getDict(), "exit_game", 8.0, 8.0, 0, 0, 1000.0, 0)
    NetworkStartSynchronisedScene(self.nextScene)
    while NetworkGetLocalSceneFromNetworkId(self.nextScene) == -1 do Wait(0) end
    local localscene = NetworkGetLocalSceneFromNetworkId(self.nextScene)

    while GetSynchronizedScenePhase(localscene) < 0.99 do
        Wait(0)
    end

    DisposeSynchronizedScene(self.nextScene)
    ClearPedTasks(cache.ped)

    RemoveAnimDict(self:getDict())
end

function Game:playLooseScene()
    lib.requestAnimDict(self:getDict())

    local coords = GetEntityCoords(self.localId)
    local rotation = GetEntityRotation(self.localId)

    self.nextScene = NetworkCreateSynchronisedScene(coords.x, coords.y, coords.z, rotation.x, rotation.y, rotation.z, 2, true, true, 1.0, 1000.0, 1.0)
    NetworkAddPedToSynchronisedScene(cache.ped, self.nextScene, self:getDict(), "miss", 8.0, 8.0, 0, 0, 1000.0, 0)
    NetworkStartSynchronisedScene(self.nextScene)
    while NetworkGetLocalSceneFromNetworkId(self.nextScene) == -1 do Wait(0) end
    local localscene = NetworkGetLocalSceneFromNetworkId(self.nextScene)

    while GetSynchronizedScenePhase(localscene) < 0.99 do
        Wait(0)
    end

    DisposeSynchronizedScene(self.nextScene)
    ClearPedTasks(cache.ped)

    RemoveAnimDict(self:getDict())
end

function Game:playWinScene()
    lib.requestAnimDict(self:getDict())

    local prize = CreateObjectNoOffset(GetEntityModel(self.won), 0.0, 0.0, 0.0, true, false, false)
    while not DoesEntityExist(prize) do Wait(0) end

    local coords = GetEntityCoords(NetToObj(self.machine.netId))
    local rotation = GetEntityRotation(NetToObj(self.machine.netId))

    self.nextScene = NetworkCreateSynchronisedScene(coords.x, coords.y, coords.z, rotation.x, rotation.y, rotation.z, 2, true, true, 1.0, 1000.0, 1.0)
    NetworkAddPedToSynchronisedScene(cache.ped, self.nextScene, self:getDict(), "win", 8.0, 8.0, 0, 0, 1000.0, 0)
    NetworkAddEntityToSynchronisedScene(prize, self.nextScene, self:getDict(), "prop_prize_win", 8.0, 8.0, 0)
    NetworkStartSynchronisedScene(self.nextScene)

    while NetworkGetLocalSceneFromNetworkId(self.nextScene) == -1 do Wait(0) end
    local localscene = NetworkGetLocalSceneFromNetworkId(self.nextScene)

    while GetSynchronizedScenePhase(localscene) < 0.99 do
        Wait(0)
    end

    DeleteEntity(prize)

    DisposeSynchronizedScene(self.nextScene)
    ClearPedTasks(cache.ped)

    RemoveAnimDict(self:getDict())
end

function Game:playGameScene()
    lib.requestAnimDict(self:getDict())

    local coords = GetEntityCoords(self.localId)
    local rotation = GetEntityRotation(self.localId)

    self.nextScene = NetworkCreateSynchronisedScene(coords.x, coords.y, coords.z, rotation.x, rotation.y, rotation.z, 2, true, true, 1.0, 1000.0, 1.0)
    NetworkAddPedToSynchronisedScene(cache.ped, self.nextScene, self:getDict(), "game", 8.0, 8.0, 0, 0, 1000.0, 0)
    NetworkStartSynchronisedScene(self.nextScene)
    while NetworkGetLocalSceneFromNetworkId(self.nextScene) == -1 do Wait(0) end

    DisposeSynchronizedScene(self.currentScene)
    self.currentScene = self.nextScene
    self.nextScene = nil

    RemoveAnimDict(self:getDict())
end

function Game:playPressUpScene()
    lib.requestAnimDict(self:getDict())

    local coords = GetEntityCoords(self.localId)
    local rotation = GetEntityRotation(self.localId)

    self.nextScene = NetworkCreateSynchronisedScene(coords.x, coords.y, coords.z, rotation.x, rotation.y, rotation.z, 2, true, true, 1.0, 1000.0, 1.0)
    NetworkAddPedToSynchronisedScene(cache.ped, self.nextScene, self:getDict(), "press_up", 8.0, 8.0, 0, 0, 1000.0, 0)
    NetworkStartSynchronisedScene(self.nextScene)
    while NetworkGetLocalSceneFromNetworkId(self.nextScene) == -1 do Wait(0) end
    local localscene = NetworkGetLocalSceneFromNetworkId(self.nextScene)

    DisposeSynchronizedScene(self.currentScene)
    self.currentScene = self.nextScene
    self.nextScene = nil

    RemoveAnimDict(self:getDict())
end

function Game:playPressRightScene()
    lib.requestAnimDict(self:getDict())

    local coords = GetEntityCoords(self.localId)
    local rotation = GetEntityRotation(self.localId)

    self.nextScene = NetworkCreateSynchronisedScene(coords.x, coords.y, coords.z, rotation.x, rotation.y, rotation.z, 2, true, true, 1.0, 1000.0, 1.0)
    NetworkAddPedToSynchronisedScene(cache.ped, self.nextScene, self:getDict(), "press_right", 8.0, 8.0, 0, 0, 1000.0, 0)
    NetworkStartSynchronisedScene(self.nextScene)
    while NetworkGetLocalSceneFromNetworkId(self.nextScene) == -1 do Wait(0) end
    local localscene = NetworkGetLocalSceneFromNetworkId(self.nextScene)

    DisposeSynchronizedScene(self.currentScene)
    self.currentScene = self.nextScene
    self.nextScene = nil

    RemoveAnimDict(self:getDict())
end

function Game:playPressGrabScene()
    lib.requestAnimDict(self:getDict())

    local coords = GetEntityCoords(self.localId)
    local rotation = GetEntityRotation(self.localId)

    self.nextScene = NetworkCreateSynchronisedScene(coords.x, coords.y, coords.z, rotation.x, rotation.y, rotation.z, 2, true, true, 1.0, 1000.0, 1.0)
    NetworkAddPedToSynchronisedScene(cache.ped, self.nextScene, self:getDict(), "press_grab", 8.0, 8.0, 0, 0, 1000.0, 0)
    NetworkStartSynchronisedScene(self.nextScene)
    while NetworkGetLocalSceneFromNetworkId(self.nextScene) == -1 do Wait(0) end
    local localscene = NetworkGetLocalSceneFromNetworkId(self.nextScene)

    DisposeSynchronizedScene(self.currentScene)
    self.currentScene = self.nextScene
    self.nextScene = nil

    RemoveAnimDict(self:getDict())
end

function Game:startSequence()
    lib.showTextUI(([[
[%s] - %s \
[%s] - %s
]]):format("W", locale('to_move_forward'), "ESC", locale('to_exit')))
    while self.isPlaying and self.stage == 1 do
        if IsDisabledControlJustPressed(0, 32) and self.stage == 1 and not self.moveVertically then
            lib.hideTextUI()

            self:playPressUpScene()
            self:verticalMovementHandler()
        end

        if IsDisabledControlJustReleased(0, 32) and self.stage == 1 and self.moveVertically then
            ClearInterval(self.moveVertically)
            self.moveVertically = false
            self.stage = 2
            self:playGameScene()
        end

        if IsDisabledControlJustPressed(0, 200) and self.stage == 1 and not self.moveVertically then
            lib.hideTextUI()
            self:destroyCam()

            PlayAmbientSpeechFromPositionNative("CLAW_LEAVE", "CLAW_MACHINE", self.machine.coords.x, self.machine.coords.y, self.machine.coords.z, "SPEECH_PARAMS_STANDARD")
            self:exitClawMachine()
            self:destroy()
        end

        Wait(0)
    end
end

function Game:stageTwo()
    if self.exit then return end

    lib.showTextUI(([[
[%s] - %s \
[%s] - %s
]]):format("D", locale('to_move_right'), "ESC", locale('to_exit')))
    while self.isPlaying and self.stage == 2 do
        if IsDisabledControlJustPressed(0, 9) and self.stage == 2 and not self.moveHorizontally then
            lib.hideTextUI()

            self:playPressRightScene()
            self:horizontalMovementHandler()

        end

        if IsDisabledControlJustReleased(0, 9) and self.stage == 2 and self.moveHorizontally then
            ClearInterval(self.moveHorizontally)
            self.moveHorizontally = false
            self.stage = 3
            self:playGameScene()
        end

        if IsDisabledControlJustPressed(0, 200) and self.stage == 2 and not self.moveHorizontally then
            lib.hideTextUI()
            self:destroyCam()
            self:verticalMovementHandler(true)

            while self.moveVertically do
                Wait(0)
            end

            PlayAmbientSpeechFromPositionNative("CLAW_LEAVE", "CLAW_MACHINE", self.machine.coords.x, self.machine.coords.y, self.machine.coords.z, "SPEECH_PARAMS_STANDARD")
            self:exitClawMachine()
            self:destroy()
        end

        Wait(0)
    end
end

function Game:canPickUp(info)
    local chance = utils:chance()

    if chance < info.chance / 100 then
        return true
    end

    return false
end

function Game:willDrop(info)
    local chance = utils:chance()

    if chance < info.dropChance / 100 then
        return true
    end

    return false
end

function Game:stageThree()
    if self.exit then return end
    lib.showTextUI(([[
[%s] - %s
]]):format("ENTER", locale('to_move_down')))
        while self.isPlaying and self.stage == 3 do
            if IsDisabledControlJustPressed(0, 18) and self.stage == 3 and not self.moveDown then
                self.moveDown = true
                self:playPressGrabScene()
                lib.hideTextUI()
                lib.requestAnimDict('ch_prop_ch_arcade_claw')

                PlayAmbientSpeechFromPositionNative("CLAW_DESCENDING_ARM", "CLAW_MACHINE", self.machine.coords.x, self.machine.coords.y, self.machine.coords.z, "SPEECH_PARAMS_STANDARD")
                PlaySoundFromCoord(-1, "descend", self.machine.coords.x, self.machine.coords.y, self.machine.coords.z, "dlc_ch_claw_crane_sounds", true, 10, false)
                PlayEntityAnim(NetToObj(self.machine.claw.clawNetId), "ch_prop_arcade_claw_01a_c_d", "ch_prop_ch_arcade_claw", -8.0, false, true, false, 0, 0)
                TriggerServerEvent('nc_claw:playPickupAnimNearBy', self.machine.uuid)

                Wait(2000)
                PlaySoundFromCoord(-1, "ascend", self.machine.coords.x, self.machine.coords.y, self.machine.coords.z, "dlc_ch_claw_crane_sounds", true, 10, false)

                Wait(200)
                PlayAmbientSpeechFromPositionNative("CLAW_ATTRACT", "CLAW_MACHINE", self.machine.coords.x, self.machine.coords.y, self.machine.coords.z, "SPEECH_PARAMS_STANDARD")

                self.shapeCoords = GetOffsetFromEntityInWorldCoords(NetToObj(self.machine.claw.clawNetId), 0.0, 0.0, -0.7)
                local shapeTest = StartShapeTestCapsule(self.shapeCoords.x, self.shapeCoords.y, self.shapeCoords.z, self.shapeCoords.x, self.shapeCoords.y, self.shapeCoords.z, 0.01, 16, self.localId, 4)
                local _, hit, _, _, entityHit = GetShapeTestResult(shapeTest)
                local originalCoords = GetEntityCoords(entityHit)
                local originalRotation = GetEntityRotation(entityHit, 2)

                local isToy = false

                if hit then
                    for _, v in pairs(config.availableToys) do
                        if GetHashKey(v.model) == GetEntityModel(entityHit) then
                            isToy = true
                            break
                        end
                    end
                end

                if hit and DoesEntityExist(entityHit) and isToy then
                    local spot, info = self:findToySpot()

                    if self:canPickUp(info) then
                        PlayAmbientSpeechFromPositionNative("CLAW_HYPE", "CLAW_MACHINE", self.machine.coords.x, self.machine.coords.y, self.machine.coords.z, "SPEECH_PARAMS_STANDARD")
                        TriggerServerEvent("nc_claw:srv:pickupHandler", self.machine.uuid, NetworkGetNetworkIdFromEntity(entityHit))

                        Citizen.CreateThread(function()
                            if self:willDrop(info) then
                                Wait(math.random(1000, 1500))
                                TriggerServerEvent("nc_claw:srv:detachAndReturnHandler", self.machine.uuid, NetworkGetNetworkIdFromEntity(entityHit), originalRotation, originalCoords)
                            else
                                TriggerServerEvent("nc_claw:prizeWon", self.machine.uuid, NetworkGetNetworkIdFromEntity(entityHit), spot)
                                self.won = entityHit
                                self.wonSpot = spot
                            end
                        end)
                    end
                end

                Wait(1800)

                self.stage = 4
            end

            Wait(0)
        end

        -- Bring back claw
        self:horizontalMovementHandler(true)

        while self.moveHorizontally do
            Wait(0)
        end
        self:verticalMovementHandler(true)

        while self.moveVertically do
            Wait(0)
        end
end

function Game:findToySpot()
    local closestToy, closestDistance, closestInfo = nil, 100000, nil
    for k,v in pairs(self.machine.toys) do
        if not v then goto continue end

        local distance = #(v.coords - self.shapeCoords)
        if distance < closestDistance then
            closestToy, closestDistance, closestInfo = k, distance, v
        end

        ::continue::
    end
    if closestToy then
        return closestToy, closestInfo
    end

    return false
end

function Game:processLoose()
    self:destroyCam()
    PlayAmbientSpeechFromPositionNative("CLAW_FAIL", "CLAW_MACHINE", self.machine.coords.x, self.machine.coords.y, self.machine.coords.z, "SPEECH_PARAMS_STANDARD")
    PlaySoundFromCoord(-1, "lose", self.machine.coords.x, self.machine.coords.y, self.machine.coords.z, "dlc_ch_claw_crane_sounds", true, 10, false)

    self:playLooseScene()
    self:destroy()
end

function Game:processWin()
    self:destroyCam()
    PlayAmbientSpeechFromPositionNative("CLAW_WIN", "CLAW_MACHINE", self.machine.coords.x, self.machine.coords.y, self.machine.coords.z, "SPEECH_PARAMS_STANDARD")
    PlaySoundFromCoord(-1, "win", self.machine.coords.x, self.machine.coords.y, self.machine.coords.z, "dlc_ch_claw_crane_sounds", true, 10, false)

    TriggerServerEvent("nc_claw:srv:detachHandler", self.machine.uuid, NetworkGetNetworkIdFromEntity(self.won), true)
    self:playWinScene()

    lib.callback('nc_claw:givePrize', false, function() end, self.machine.uuid, self.wonSpot)

    self:destroy()
end

function Game:clawReturned()
    self.waitingForClawToReturn = false
end

function Game:play()
    if CurrentGame == nil then
        return
    end

    if not self:checkDistance() then
        return
    end

    self.machine:setBusy(true)
    self.machine:removePoint()

    self:disableControls()

    Citizen.CreateThread(function()
        PlayAmbientSpeechFromPositionNative("CLAW_START_PLAY", "CLAW_MACHINE", self.machine.coords.x, self.machine.coords.y, self.machine.coords.z, "SPEECH_PARAMS_STANDARD")
        PlaySoundFromCoord(-1, "start", self.machine.coords.x, self.machine.coords.y, self.machine.coords.z, "dlc_ch_claw_crane_sounds", true, 10, false)

        self:idleToGameScene()
        self:setupCam()
        self:playGameScene()

        self.isPlaying = true
        self.stage = 1

        self:startSequence()
        self:stageTwo()
        self:stageThree()
        if self.exit then return end

        if self.won and type(self.won) ~= 'boolean' then
            self:processWin()
        else
            self:processLoose()
        end

        self.machine:setupPoint()
        self.machine:setBusy(false)
    end)
end

RegisterNetEvent("nc_claw:playPickupAnimNearBy", function(sender, uuid)
    if cache.serverId == sender then
        return false
    end

    if machines[uuid] == nil then
        return false
    end

    local machine = machines[uuid]

    if #(machine.coords - GetEntityCoords(cache.ped)) > 50.0 then
        return false
    end

    PlayEntityAnim(NetToObj(machine.claw.clawNetId), "ch_prop_arcade_claw_01a_c_d", "ch_prop_ch_arcade_claw", -8.0, false, true, false, 0, 0)
end)

RegisterNetEvent("nc_claw:pickupHandler", function(uuid, entityNetId)
    if machines[uuid] == nil then
        return false
    end

    local machine = machines[uuid]

    if #(machine.coords - GetEntityCoords(cache.ped)) > 50.0 then
        return false
    end

    local entityHit = NetToObj(entityNetId)
    local originalRotation = GetEntityRotation(entityHit, 2)

    NetworkAllowLocalEntityAttachment(entityHit, true)

    FreezeEntityPosition(entityHit, false)

    AttachEntityToEntity(entityHit, NetToObj(machine.claw.clawNetId), 2, 0.0, 0.00, -0.25, originalRotation.x, originalRotation.y, originalRotation.z, false, false, false, false, 2, false)

    Wait(50)

    while not IsEntityAttachedToAnyObject(entityHit) do
        AttachEntityToEntity(entityHit, NetToObj(machine.claw.clawNetId), 2, 0.0, 0.00, -0.25, originalRotation.x, originalRotation.y, originalRotation.z, false, false, false, false, 2, false)
        Wait(10)
    end
end)

RegisterNetEvent("nc_claw:detachAndReturnHandler", function(uuid, entityNetId, originalRotation, originalCoords)
    if machines[uuid] == nil then
        return false
    end

    local machine = machines[uuid]

    if #(machine.coords - GetEntityCoords(cache.ped)) > 50.0 then
        return false
    end

    local entityHit = NetToObj(entityNetId)
    DetachEntity(entityHit, true, true)
    Wait(500)
    FreezeEntityPosition(entityHit, true)
    SetEntityRotation(entityHit, originalRotation.x, originalRotation.y, originalRotation.z, 2, true)
    SetEntityCoords(entityHit, originalCoords.x, originalCoords.y, originalCoords.z, false, false, false, false)
end)

RegisterNetEvent("nc_claw:detachHandler", function(uuid, entityNetId, delete)
    if machines[uuid] == nil then
        return false
    end

    local machine = machines[uuid]

    if #(machine.coords - GetEntityCoords(cache.ped)) > 50.0 then
        return false
    end

    local entityHit = NetToObj(entityNetId)
    DetachEntity(entityHit, true, true)

    PlaySoundFromCoord(-1, "release_toy", machine.coords.x, machine.coords.y, machine.coords.z, "dlc_ch_claw_crane_sounds", true, 10, false)

    if delete then
        DeleteEntity(entityHit)
    end
end)

RegisterNetEvent("nc_claw:clawReturned", function(uuid)
    if machines[uuid] == nil then
        return false
    end

    if CurrentGame.machine.uuid ~= uuid then
        return false
    end

    CurrentGame:clawReturned()
end)
