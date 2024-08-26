local playerLicenses, ownLicenses = {}, {}
local openedMenu = false
local lastVehHealth = nil
currentCheckpoint = nil
currentDriveVehicle = nil
local tempBlip, pointBlip = nil, nil
local isLicensesNotLoaded = false
examinerPed = nil
driveErrors = 0
currentExam = nil
currentExamType = nil

if Config.Core == "ESX" then
    ESX = Config.CoreExport()
    
    RegisterNetEvent('nchub_flightschool:cl:getLicenses')
	AddEventHandler('nchub_flightschool:cl:getLicenses', function(licenses)
		playerLicenses = licenses
	end)
elseif Config.Core == "QB-Core" then
    QBCore = Config.CoreExport()
    PlayerData = QBCore.Functions.GetPlayerData()

    RegisterNetEvent('nchub_flightschool:cl:getLicenses')
	AddEventHandler('nchub_flightschool:cl:getLicenses', function()
        PlayerData = QBCore.Functions.GetPlayerData()
	end)

    RegisterNetEvent(Config.PlayerLoaded)
    AddEventHandler(Config.PlayerLoaded, function()
        PlayerData = QBCore.Functions.GetPlayerData()
    end)
end

Citizen.CreateThread(function()
    Citizen.Wait(250)
    if Config.Zones["menu"].menuType == "ox_lib" then
        local import = LoadResourceFile('ox_lib', 'init.lua')
        local chunk = assert(load(import, '@@ox_lib/init.lua'))
        chunk()
    end
    if Config.UseTarget then
        Config.Target()
    end
end)

RegisterNetEvent('nchub_flightschool:cl:startExam', function(type, category)
    if type == "Theory" then
        startTheoretical(category)
    elseif type == "Practical" then
        startPractical(category)
    end
end)

Citizen.CreateThread(function()
    local schoolBlip = AddBlipForCoord(Config.Zones["menu"].coords)	
    SetBlipSprite(schoolBlip, Config.Zones["menu"].blip.sprite)
    SetBlipDisplay(schoolBlip, Config.Zones["menu"].blip.display)
    SetBlipScale(schoolBlip, Config.Zones["menu"].blip.scale)
    SetBlipColour(schoolBlip, Config.Zones["menu"].blip.color)
    SetBlipAsShortRange(schoolBlip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(Config.Zones["menu"].blip.name)
    EndTextCommandSetBlipName(schoolBlip)
end)

openMenu = function()
    if not isLicensesNotLoaded and Config.Core == "ESX" and ESX.GetPlayerData() then
        TriggerServerEvent('nchub_flightschool:sv:loadLicensesWithRestartScript')
        isLicensesNotLoaded = true
        Citizen.Wait(200)
    end
    if Config.Zones["menu"].menuType == "esx_menu_default" then
        openedMenu = true
        ESX.UI.Menu.CloseAll()
        ownLicenses = {}
        for k, v in pairs(playerLicenses) do
            ownLicenses[v.type] = true
        end
        local elements = {}
        if Config.Licenses.Theory['HELICOPTER'].enabled and not ownLicenses[Config.Licenses.Theory['HELICOPTER'].name] then
            elements[#elements + 1] = {icon = Config.Translate['menu.theory_helicopter'].icon, label = Config.Translate['menu.theory_helicopter'].label:format(Config.Licenses.Theory['HELICOPTER'].price), value = 'theory_helicopter'}
        else
            if Config.Licenses.Practical['HELICOPTER'].enabled and not ownLicenses[Config.Licenses.Practical['HELICOPTER'].name] then
                elements[#elements + 1] = {icon = Config.Translate['menu.practical_helicopter'].icon, label = Config.Translate['menu.practical_helicopter'].label:format(Config.Licenses.Practical['HELICOPTER'].price), value = 'practical_helicopter'}
            end
        end
        if Config.Licenses.Theory['PLANE'].enabled and not ownLicenses[Config.Licenses.Theory['PLANE'].name] then
            elements[#elements + 1] = {icon = Config.Translate['menu.theory_plane'].icon, label = Config.Translate['menu.theory_plane'].label:format(Config.Licenses.Theory['PLANE'].price), value = 'theory_plane'}
        else
            if Config.Licenses.Practical['PLANE'].enabled and not ownLicenses[Config.Licenses.Practical['PLANE'].name] then
                elements[#elements + 1] = {icon = Config.Translate['menu.practical_plane'].icon, label = Config.Translate['menu.practical_plane'].label:format(Config.Licenses.Practical['PLANE'].price), value = 'practical_plane'}
            end
        end
		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'menu', {
			title    = Config.Translate['menu.title'].label,
			elements = elements,
			align    = Config.Zones['menu'].menuPosition,
		}, function(data, menu)
            menu.close()
            if data.current.value == "theory_helicopter" then
                TriggerServerEvent('nchub_flightschool:sv:buyExam', {type = 'Theory', category = 'HELICOPTER'})
            elseif data.current.value == "theory_plane" then
                TriggerServerEvent('nchub_flightschool:sv:buyExam', {type = 'Theory', category = 'PLANE'})
            elseif data.current.value == "practical_helicopter" then
                ClearArea(Config.Practical.SpawnPoints['HELICOPTER'].x, Config.Practical.SpawnPoints['HELICOPTER'].y, Config.Practical.SpawnPoints['HELICOPTER'].z, 15.0, true, false, false, false)
                if Config.CheckIsStartAreaIsOccupied then
                    local isPointClear = ESX.Game.IsSpawnPointClear(vec(Config.Practical.SpawnPoints['HELICOPTER'].x, Config.Practical.SpawnPoints['HELICOPTER'].y, Config.Practical.SpawnPoints['HELICOPTER'].z), 8.0)
                    if not isPointClear then
                        Config.Notification(Config.Translate['the_start_area_is_occupied'], 'error')
                        openedMenu = false
                        return
                    end
                end
                TriggerServerEvent('nchub_flightschool:sv:buyExam', {type = 'Practical', category = 'HELICOPTER'})
            elseif data.current.value == "practical_plane" then
                ClearArea(Config.Practical.SpawnPoints['PLANE'].x, Config.Practical.SpawnPoints['PLANE'].y, Config.Practical.SpawnPoints['PLANE'].z, 15.0, true, false, false, false)
                if Config.CheckIsStartAreaIsOccupied then
                    local isPointClear = ESX.Game.IsSpawnPointClear(vec(Config.Practical.SpawnPoints['PLANE'].x, Config.Practical.SpawnPoints['PLANE'].y, Config.Practical.SpawnPoints['PLANE'].z), 8.0)
                    if not isPointClear then
                        Config.Notification(Config.Translate['the_start_area_is_occupied'], 'error')
                        openedMenu = false
                        return
                    end
                end
                TriggerServerEvent('nchub_flightschool:sv:buyExam', {type = 'Practical', category = 'PLANE'})
            end
		end, function(data, menu)
			menu.close()
            openedMenu = false
		end)
    elseif Config.Zones["menu"].menuType == "esx_context" then
        ESX.CloseContext()
        ownLicenses = {}
        for k, v in pairs(playerLicenses) do
            ownLicenses[v.type] = true
        end
        local elements = {
            {unselectable = true, icon = Config.Translate['menu.title'].icon, title = Config.Translate['menu.title'].label}
        }
        if Config.Licenses.Theory['HELICOPTER'].enabled and not ownLicenses[Config.Licenses.Theory['HELICOPTER'].name] then
            elements[#elements + 1] = {icon = Config.Translate['menu.theory_helicopter'].icon, title = Config.Translate['menu.theory_helicopter'].label:format(Config.Licenses.Theory['HELICOPTER'].price), value = 'theory_helicopter'}
        else
            if Config.Licenses.Practical['HELICOPTER'].enabled and not ownLicenses[Config.Licenses.Practical['HELICOPTER'].name] then
                elements[#elements + 1] = {icon = Config.Translate['menu.practical_helicopter'].icon, title = Config.Translate['menu.practical_helicopter'].label:format(Config.Licenses.Practical['HELICOPTER'].price), value = 'practical_helicopter'}
            end
        end
        if Config.Licenses.Theory['PLANE'].enabled and not ownLicenses[Config.Licenses.Theory['PLANE'].name] then
            elements[#elements + 1] = {icon = Config.Translate['menu.theory_plane'].icon, title = Config.Translate['menu.theory_plane'].label:format(Config.Licenses.Theory['PLANE'].price), value = 'theory_plane'}
        else
            if Config.Licenses.Practical['PLANE'].enabled and not ownLicenses[Config.Licenses.Practical['PLANE'].name] then
                elements[#elements + 1] = {icon = Config.Translate['menu.practical_plane'].icon, title = Config.Translate['menu.practical_plane'].label:format(Config.Licenses.Practical['PLANE'].price), value = 'practical_plane'}
            end
        end
        ESX.OpenContext(Config.Zones['menu'].menuPosition, elements, function(menu, element)
            ESX.CloseContext()
            if element.value == "theory_helicopter" then
                TriggerServerEvent('nchub_flightschool:sv:buyExam', {type = 'Theory', category = 'HELICOPTER'})
            elseif element.value == "theory_plane" then
                TriggerServerEvent('nchub_flightschool:sv:buyExam', {type = 'Theory', category = 'PLANE'})
            elseif element.value == "practical_helicopter" then
                ClearArea(Config.Practical.SpawnPoints['HELICOPTER'].x, Config.Practical.SpawnPoints['HELICOPTER'].y, Config.Practical.SpawnPoints['HELICOPTER'].z, 15.0, true, false, false, nil)
                if Config.CheckIsStartAreaIsOccupied then
                    local isPointClear = ESX.Game.IsSpawnPointClear(vec(Config.Practical.SpawnPoints['HELICOPTER'].x, Config.Practical.SpawnPoints['HELICOPTER'].y, Config.Practical.SpawnPoints['HELICOPTER'].z), 8.0)
                    if not isPointClear then
                        Config.Notification(Config.Translate['the_start_area_is_occupied'], 'error')
                        return
                    end
                end
                TriggerServerEvent('nchub_flightschool:sv:buyExam', {type = 'Practical', category = 'HELICOPTER'})
            elseif element.value == "practical_plane" then
                ClearArea(Config.Practical.SpawnPoints['PLANE'].x, Config.Practical.SpawnPoints['PLANE'].y, Config.Practical.SpawnPoints['PLANE'].z, 15.0, true, false, false, nil)
                if Config.CheckIsStartAreaIsOccupied then
                    local isPointClear = ESX.Game.IsSpawnPointClear(vec(Config.Practical.SpawnPoints['PLANE'].x, Config.Practical.SpawnPoints['PLANE'].y, Config.Practical.SpawnPoints['PLANE'].z), 8.0)
                    if not isPointClear then
                        Config.Notification(Config.Translate['the_start_area_is_occupied'], 'error')
                        return
                    end
                end
                TriggerServerEvent('nchub_flightschool:sv:buyExam', {type = 'Practical', category = 'PLANE'})
            end
        end)
    elseif Config.Zones["menu"].menuType == "qb-menu" then
        local elements = {
            {icon = Config.Translate['menu.title'].icon, header = Config.Translate['menu.title'].label, isMenuHeader = true},
        }
        if Config.Licenses.Theory['HELICOPTER'].enabled and not PlayerData.metadata['licences'][Config.Licenses.Theory['HELICOPTER'].name] then
            elements[#elements + 1] = {
                icon = Config.Translate['menu.theory_helicopter'].icon, 
                header = Config.Translate['menu.theory_helicopter'].label:format(Config.Licenses.Theory['HELICOPTER'].price),
                params = {
                    isAction = true,
                    event = function()
                        TriggerServerEvent('nchub_flightschool:sv:buyExam', {type = "Theory", category = "HELICOPTER"})
                    end
                },
            }
        else
            if Config.Licenses.Practical['HELICOPTER'].enabled and not PlayerData.metadata['licences'][Config.Licenses.Practical['HELICOPTER'].name] then
                elements[#elements + 1] = {
                    icon = Config.Translate['menu.practical_helicopter'].icon, 
                    header = Config.Translate['menu.practical_helicopter'].label:format(Config.Licenses.Practical['HELICOPTER'].price),
                    params = {
                        isAction = true,
                        event = function()
                            ClearArea(Config.Practical.SpawnPoints['HELICOPTER'].x, Config.Practical.SpawnPoints['HELICOPTER'].y, Config.Practical.SpawnPoints['HELICOPTER'].z, 15.0, true, false, false, nil)
                            if Config.CheckIsStartAreaIsOccupied then
                                local isPointClear = QBCore.Functions.SpawnClear(vec(Config.Practical.SpawnPoints['HELICOPTER'].x, Config.Practical.SpawnPoints['HELICOPTER'].y, Config.Practical.SpawnPoints['HELICOPTER'].z), 8.0)
                                if not isPointClear then
                                    Config.Notification(Config.Translate['the_start_area_is_occupied'], 'error')
                                    return
                                end
                            end
                            TriggerServerEvent('nchub_flightschool:sv:buyExam', {type = "Practical", category = "HELICOPTER"})
                        end
                    },
                }
            end
        end
        if Config.Licenses.Theory['PLANE'].enabled and not PlayerData.metadata['licences'][Config.Licenses.Theory['PLANE'].name] then
            elements[#elements + 1] = {
                icon = Config.Translate['menu.theory_plane'].icon, 
                header = Config.Translate['menu.theory_plane'].label:format(Config.Licenses.Theory['PLANE'].price),
                params = {
                    isAction = true,
                    event = function()
                        TriggerServerEvent('nchub_flightschool:sv:buyExam', {type = "Theory", category = "PLANE"})
                    end
                },
            }
        else
            if Config.Licenses.Practical['PLANE'].enabled and not PlayerData.metadata['licences'][Config.Licenses.Practical['PLANE'].name] then
                elements[#elements + 1] = {
                    icon = Config.Translate['menu.practical_plane'].icon, 
                    header = Config.Translate['menu.practical_plane'].label:format(Config.Licenses.Practical['PLANE'].price),
                    params = {
                        isAction = true,
                        event = function()
                            ClearArea(Config.Practical.SpawnPoints['PLANE'].x, Config.Practical.SpawnPoints['PLANE'].y, Config.Practical.SpawnPoints['PLANE'].z, 15.0, true, false, false, nil)
                            if Config.CheckIsStartAreaIsOccupied then
                                local isPointClear = QBCore.Functions.SpawnClear(vec(Config.Practical.SpawnPoints['PLANE'].x, Config.Practical.SpawnPoints['PLANE'].y, Config.Practical.SpawnPoints['PLANE'].z), 8.0)
                                if not isPointClear then
                                    Config.Notification(Config.Translate['the_start_area_is_occupied'], 'error')
                                    return
                                end
                            end
                            TriggerServerEvent('nchub_flightschool:sv:buyExam', {type = "Practical", category = "PLANE"})
                        end
                    },
                }
            end
        end
        exports['qb-menu']:openMenu(elements)	
    elseif Config.Zones["menu"].menuType == "ox_lib" then
        openedMenu = true
        ownLicenses = {}
        if Config.Core == "ESX" then
            for k, v in pairs(playerLicenses) do
                ownLicenses[v.type] = true
            end
        end
        local elements = {}
        if Config.Licenses.Theory['HELICOPTER'].enabled and (Config.Core == "ESX" and not ownLicenses[Config.Licenses.Theory['HELICOPTER'].name] or Config.Core == "QB-Core" and not PlayerData.metadata['licences'][Config.Licenses.Theory['HELICOPTER'].name]) then
            elements[#elements + 1] = {
                icon = Config.Translate['menu.theory_helicopter'].icon, 
                title = Config.Translate['menu.theory_helicopter'].label:format(Config.Licenses.Theory['HELICOPTER'].price), 
                onSelect = function()
                    TriggerServerEvent('nchub_flightschool:sv:buyExam', {type = 'Theory', category = 'HELICOPTER'})
                end,
                onExit = function()
                    openedMenu = false
                end
            }
        else
            if Config.Licenses.Practical['HELICOPTER'].enabled and (Config.Core == "ESX" and not ownLicenses[Config.Licenses.Practical['HELICOPTER'].name] or Config.Core == "QB-Core" and not PlayerData.metadata['licences'][Config.Licenses.Practical['HELICOPTER'].name]) then
                elements[#elements + 1] = {
                    icon = Config.Translate['menu.practical_helicopter'].icon, 
                    title = Config.Translate['menu.practical_helicopter'].label:format(Config.Licenses.Practical['HELICOPTER'].price), 
                    onSelect = function()
                        if Config.Core == "ESX" then
                            ClearArea(Config.Practical.SpawnPoints['HELICOPTER'].x, Config.Practical.SpawnPoints['HELICOPTER'].y, Config.Practical.SpawnPoints['HELICOPTER'].z, 15.0, true, false, false, false)
                            if Config.CheckIsStartAreaIsOccupied then
                                local isPointClear = ESX.Game.IsSpawnPointClear(vec(Config.Practical.SpawnPoints['HELICOPTER'].x, Config.Practical.SpawnPoints['HELICOPTER'].y, Config.Practical.SpawnPoints['HELICOPTER'].z), 8.0)
                                if not isPointClear then
                                    Config.Notification(Config.Translate['the_start_area_is_occupied'], 'error')
                                    openedMenu = false
                                    return
                                end
                            end
                            TriggerServerEvent('nchub_flightschool:sv:buyExam', {type = 'Practical', category = 'HELICOPTER'})
                        else
                            ClearArea(Config.Practical.SpawnPoints['HELICOPTER'].x, Config.Practical.SpawnPoints['HELICOPTER'].y, Config.Practical.SpawnPoints['HELICOPTER'].z, 15.0, true, false, false, nil)
                            if Config.CheckIsStartAreaIsOccupied then
                                local isPointClear = QBCore.Functions.SpawnClear(vec(Config.Practical.SpawnPoints['HELICOPTER'].x, Config.Practical.SpawnPoints['HELICOPTER'].y, Config.Practical.SpawnPoints['HELICOPTER'].z), 8.0)
                                if not isPointClear then
                                    Config.Notification(Config.Translate['the_start_area_is_occupied'], 'error')
                                    return
                                end
                            end
                            TriggerServerEvent('nchub_flightschool:sv:buyExam', {type = "Practical", category = "HELICOPTER"})
                        end
                    end,
                    onExit = function()
                        openedMenu = false
                    end
                }
            end
        end
        if Config.Licenses.Theory['PLANE'].enabled and (Config.Core == "ESX" and not ownLicenses[Config.Licenses.Theory['PLANE'].name] or Config.Core == "QB-Core" and not PlayerData.metadata['licences'][Config.Licenses.Theory['PLANE'].name]) then
            elements[#elements + 1] = {
                icon = Config.Translate['menu.theory_plane'].icon, 
                title = Config.Translate['menu.theory_plane'].label:format(Config.Licenses.Theory['PLANE'].price), 
                onSelect = function()
                    TriggerServerEvent('nchub_flightschool:sv:buyExam', {type = 'Theory', category = 'PLANE'})
                end,
                onExit = function()
                    openedMenu = false
                end
            }
        else
            if Config.Licenses.Practical['PLANE'].enabled and (Config.Core == "ESX" and not ownLicenses[Config.Licenses.Practical['PLANE'].name] or Config.Core == "QB-Core" and not PlayerData.metadata['licences'][Config.Licenses.Practical['PLANE'].name]) then
                elements[#elements + 1] = {
                    icon = Config.Translate['menu.practical_plane'].icon, 
                    title = Config.Translate['menu.practical_plane'].label:format(Config.Licenses.Practical['PLANE'].price), 
                    onSelect = function()
                        if Config.Core == "ESX" then
                            ClearArea(Config.Practical.SpawnPoints['PLANE'].x, Config.Practical.SpawnPoints['PLANE'].y, Config.Practical.SpawnPoints['PLANE'].z, 15.0, true, false, false, false)
                            if Config.CheckIsStartAreaIsOccupied then
                                local isPointClear = ESX.Game.IsSpawnPointClear(vec(Config.Practical.SpawnPoints['PLANE'].x, Config.Practical.SpawnPoints['PLANE'].y, Config.Practical.SpawnPoints['PLANE'].z), 8.0)
                                if not isPointClear then
                                    Config.Notification(Config.Translate['the_start_area_is_occupied'], 'error')
                                    openedMenu = false
                                    return
                                end
                            end
                            TriggerServerEvent('nchub_flightschool:sv:buyExam', {type = 'Practical', category = 'PLANE'})
                        else
                            ClearArea(Config.Practical.SpawnPoints['PLANE'].x, Config.Practical.SpawnPoints['PLANE'].y, Config.Practical.SpawnPoints['PLANE'].z, 15.0, true, false, false, nil)
                            if Config.CheckIsStartAreaIsOccupied then
                                local isPointClear = QBCore.Functions.SpawnClear(vec(Config.Practical.SpawnPoints['PLANE'].x, Config.Practical.SpawnPoints['PLANE'].y, Config.Practical.SpawnPoints['PLANE'].z), 8.0)
                                if not isPointClear then
                                    Config.Notification(Config.Translate['the_start_area_is_occupied'], 'error')
                                    return
                                end
                            end
                            TriggerServerEvent('nchub_flightschool:sv:buyExam', {type = "Practical", category = "PLANE"})
                        end
                    end,
                    onExit = function()
                        openedMenu = false
                    end
                }
            end
        end
        lib.registerContext({
            id = "flyschool-menu",
            title = Config.Translate['menu.title'].label,
            options = elements,
            onExit = function()
                openedMenu = false
            end
        })
        lib.showContext('flyschool-menu')
    end
end

RegisterNetEvent('nchub_flightschool:openMenu', function()
    openMenu()
end)

Citizen.CreateThread(function()
    local inRange = false
    local shown = false
    local sleep = true
    while Config.AccessOnMarker do
        inRange = false
        sleep = true
        local myPed = PlayerPedId()
        local myCoords = GetEntityCoords(myPed)
        local distance = #(Config.Zones["menu"].coords - myCoords)
        if distance < 25.0 then
            sleep = false
            if distance < 15.0 then
                if not isLicensesNotLoaded and Config.Core == "ESX" and ESX.GetPlayerData() then
                    TriggerServerEvent('nchub_flightschool:sv:loadLicensesWithRestartScript')
                    isLicensesNotLoaded = true
                end
                DrawMarker(Config.Zones["menu"].marker.id, Config.Zones["menu"].coords, 0, 0, 0, 0, 0, 0, Config.Zones["menu"].marker.scale, Config.Zones["menu"].marker.color[1], Config.Zones["menu"].marker.color[2], Config.Zones["menu"].marker.color[3], Config.Zones["menu"].marker.color[4], Config.Zones["menu"].marker.bobUpAndDown, false, false, Config.Zones["menu"].marker.rotate, false, false, false)
                if distance < Config.Zones["menu"].marker.scale.x+.15 then
                    if not openedMenu then
                        inRange = true
                        if Config.Core == "ESX" and not Config.Interact.Enabled then
                            ESX.ShowHelpNotification(Config.Translate['open_menu'])
                        end
                        if IsControlJustPressed(0, 38) then
                            openMenu()
                            inRange = false
                        end
                    end
                end
            end
        end
        if Config.Interact.Enabled then
            if inRange and not shown then
                shown = true
                Config.Interact.Open(Config.Translate['open_menu'])
            elseif not inRange and shown then
                shown = false
                Config.Interact.Close()
            end
        end
        Citizen.Wait(sleep and 2000 or 1)
    end
end)

startTheoretical = function(category)
    currentExam = Config.Licenses.Theory[category].name
    SendNUIMessage({action = 'openTheory', category = category, questions = Config.Questions[category]})
    SetNuiFocus(true, true)
    SetTimecycleModifier(Config.EnableBlur and 'hud_def_blur')
end

startErrorCounter = function()
    Citizen.CreateThread(function()
        while currentExam do
            local myPed = PlayerPedId()
            if IsPedInAnyVehicle(myPed,  false) then
                local vehicle = GetVehiclePedIsIn(myPed, false)
                local vehHealth = GetEntityHealth(vehicle)
                if vehHealth < lastVehHealth then
                    driveErrors = driveErrors + 1
                    Config.Notification(Config.Translate['vehicle_was_damaged']:format(driveErrors, Config.MaxDriveErrors), 'error')
                    Citizen.Wait(1000)
                    lastVehHealth = vehHealth
                end
                if driveErrors >= Config.MaxDriveErrors then
                    Config.Notification(Config.Translate['exceeded_error_limit'], 'error')
                    SendNUIMessage({action = 'closeTasks'})
                    if pointBlip then
                        RemoveBlip(pointBlip)
                    end
                    if currentCheckpoint then
                        DeleteCheckpoint(currentCheckpoint)
                    end
                    DeleteVehicle(currentDriveVehicle)
                    if examinerPed then
                        DeletePed(examinerPed)
                    end
                    if Config.TeleportPlayerAfterFailExam then
                        SetEntityCoords(myPed, Config.Zones['menu'].coords)
                    end
                    setBlipToSchool(false)
                    currentExam = nil
                    break
                end
            end
            if IsPlayerDead(myPed) or IsEntityDead(myPed) then
                if pointBlip then
                    RemoveBlip(pointBlip)
                end
                if currentCheckpoint then
                    DeleteCheckpoint(currentCheckpoint)
                end
                SendNUIMessage({action = 'closeTasks'})
                openedMenu = false
                currentExam = nil
                driveErrors = 0
                DeleteVehicle(currentDriveVehicle)
                if examinerPed then
                    DeletePed(examinerPed)
                end
            end
            Citizen.Wait(1)
        end
    end)
end

startPractical = function(type)
    currentExamType = type
    currentExam = Config.Licenses.Practical[type].name
    if Config.Core == "ESX" then
        SetEntityCoords(PlayerPedId(), Config.Practical.SpawnPoints[currentExamType].x, Config.Practical.SpawnPoints[currentExamType].y, Config.Practical.SpawnPoints[currentExamType].z)
        Citizen.Wait(200)
        ESX.Game.SpawnVehicle(Config.Practical.Vehicles[type], vec(Config.Practical.SpawnPoints[type].x, Config.Practical.SpawnPoints[type].y, Config.Practical.SpawnPoints[type].z), Config.Practical.SpawnPoints[type].w, function(vehicle)
            currentDriveVehicle = vehicle
            lastVehHealth = GetEntityHealth(vehicle)
            if Config.Examiner.Enabled then
                RequestModel(GetHashKey(Config.Examiner.PedModel))
                while not HasModelLoaded(GetHashKey(Config.Examiner.PedModel)) do
                    Wait(1)
                end
                examinerPed = CreatePedInsideVehicle(vehicle, 4, Config.Examiner.PedModel, 0, true, false)
                SetBlockingOfNonTemporaryEvents(examinerPed, true)
                SetPedCanBeDraggedOut(examinerPed, false)
                SetEntityInvincible(examinerPed, true)
                SetPedKeepTask(examinerPed, true)
                TaskWarpPedIntoVehicle(examinerPed, vehicle, 0)
            end
            Config.Notification(Config.Translate['started_practical'], 'success')
            SendNUIMessage({
                action = 'openTasks', 
                tasks = Config.Tasks[currentExamType],
                maxPoints = #Config.Tasks[currentExamType]
            })
            Config.OnVehicleSpawn(vehicle)
            startErrorCounter()
            for k, v in pairs(Config.PracticalTest[type]) do
                if not IsPlayerDead(PlayerPedId()) and not IsEntityDead(PlayerPedId()) then
                    v.action()
                end
            end
        end)
    elseif Config.Core == "QB-Core" then
        SetEntityCoords(PlayerPedId(), Config.Practical.SpawnPoints[currentExamType].x, Config.Practical.SpawnPoints[currentExamType].y, Config.Practical.SpawnPoints[currentExamType].z)
        Citizen.Wait(200)
        QBCore.Functions.SpawnVehicle(Config.Practical.Vehicles[type], function(vehicle)
            currentDriveVehicle = vehicle
            lastVehHealth = GetEntityHealth(vehicle)
			SetEntityHeading(vehicle, Config.Practical.SpawnPoints[currentExamType].w)
            if Config.Examiner.Enabled then
                RequestModel(GetHashKey(Config.Examiner.PedModel))
                while not HasModelLoaded(GetHashKey(Config.Examiner.PedModel)) do
                    Wait(1)
                end
                examinerPed = CreatePedInsideVehicle(vehicle, 4, GetHashKey(Config.Examiner.PedModel), 0, true, false)
                SetBlockingOfNonTemporaryEvents(examinerPed, true)
                SetPedCanBeDraggedOut(examinerPed, false)
                SetEntityInvincible(examinerPed, true)
                SetPedKeepTask(examinerPed, true)
                TaskWarpPedIntoVehicle(examinerPed, vehicle, 0)
            end
            Config.Notification(Config.Translate['started_practical'], 'success')
            SendNUIMessage({
                action = 'openTasks', 
                tasks = Config.Tasks[currentExamType],
                maxPoints = #Config.Tasks[currentExamType]
            })
            Config.OnVehicleSpawn(vehicle)
            startErrorCounter()
            for k, v in pairs(Config.PracticalTest[type]) do
                if not IsPlayerDead(PlayerPedId()) and not IsEntityDead(PlayerPedId()) then
                    v.action()
                end
            end
		end, vec(Config.Practical.SpawnPoints[type].x, Config.Practical.SpawnPoints[type].y, Config.Practical.SpawnPoints[type].z), true)
    end
end

setBlipToSchool = function(create)
    if create then
        if tempBlip then
            RemoveBlip(tempBlip)
        end
        tempBlip = AddBlipForCoord(Config.Zones["return_vehicle"][currentExamType].coords)	
	    SetBlipSprite(tempBlip, Config.Zones["return_vehicle"][currentExamType].blip.sprite)
	    SetBlipDisplay(tempBlip, Config.Zones["return_vehicle"][currentExamType].blip.display)
	    SetBlipScale(tempBlip, Config.Zones["return_vehicle"][currentExamType].blip.scale)
	    SetBlipColour(tempBlip, Config.Zones["return_vehicle"][currentExamType].blip.color)
	    SetBlipAsShortRange(tempBlip, true)
	    BeginTextCommandSetBlipName("STRING")
	    AddTextComponentString(Config.Zones["return_vehicle"][currentExamType].blip.name)
	    EndTextCommandSetBlipName(tempBlip)
    else
        RemoveBlip(tempBlip)
        TriggerServerEvent('nchub_flightschool:sv:addLicense', driveErrors < Config.MaxDriveErrors, currentExam)
        driveErrors = 0
        currentExamType = nil
        openedMenu = false
    end
end

setBlipToPoint = function(point)
    if pointBlip then
        RemoveBlip(pointBlip)
    end
    if point then
        local pointCoords = Config.PracticalTest[currentExamType][point].coords
        if pointCoords then
            pointBlip = AddBlipForCoord(pointCoords)
            SetBlipSprite(pointBlip, Config.Practical['Blip'].sprite)
            SetBlipDisplay(pointBlip, Config.Practical['Blip'].display)
            SetBlipScale(pointBlip, Config.Practical['Blip'].scale)
            SetBlipColour(pointBlip, Config.Practical['Blip'].color)
            SetBlipAsShortRange(pointBlip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(Config.Practical['Blip'].name)
            EndTextCommandSetBlipName(pointBlip)
        end
    end
end

RegisterNUICallback('action', function(data, cb)
    if data.action == "close" then
        SetNuiFocus(false, false)
        SendNUIMessage({action = 'closeTheory'})
        openedMenu = false
        TriggerServerEvent('nchub_flightschool:sv:addLicense', data.passed, currentExam)
        currentExam = nil
        SetTimecycleModifier(Config.EnableBlur and 'default')
    elseif data.action == "playSound" then
        if Config.UseSoundsUI then
            if data.type == "nextQuestion" then
                PlaySoundFrontend(-1, 'Boss_Message_Orange', 'GTAO_Boss_Goons_FM_Soundset', 0)
            elseif data.type == "passedExam" then
                PlaySoundFrontend(-1, 'OOB_Start', 'GTAO_FM_Events_Soundset', 0)
            elseif data.type == "failedExam" then
                PlaySoundFrontend(-1, 'OOB_Cancel', 'GTAO_FM_Events_Soundset', 0)
            end
        end
    end
end)

RegisterNetEvent('nchub_flightschool:notification', function(message, type, enableAccessMenu)
    Config.Notification(message, type)
    if enableAccessMenu then
        openedMenu = false
    end
end)