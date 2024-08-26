local QBCore = exports['qb-core']:GetCoreObject()

RegisterCommand('loadt', function(source)
    QBCore.Functions.TriggerCallback('SmallTattoos:GetPlayerTattoos', function(tattooList)
        if tattooList then
            ClearPedDecorations(PlayerPedId())
            for k, v in pairs(tattooList) do
                if v.Count ~= nil then
                    for i = 1, v.Count do
                        AddPedDecorationFromHashes(PlayerPedId(), GetHashKey(v.collection), GetHashKey(Config.TattooList[v.collection][v.texture].nameHash))
                    end
                else
                    AddPedDecorationFromHashes(PlayerPedId(), GetHashKey(v.collection), GetHashKey(Config.TattooList[v.collection][v.texture].nameHash))
                end
            end
            currentTattoos = tattooList
        end
    end)
end)

function LoadTattoos()
    QBCore.Functions.TriggerCallback('SmallTattoos:GetPlayerTattoos', function(tattooList)
        if tattooList then
            ClearPedDecorations(PlayerPedId())
            for k, v in pairs(tattooList) do
                if v.Count ~= nil then
                    for i = 1, v.Count do
                        AddPedDecorationFromHashes(PlayerPedId(), GetHashKey(v.collection), GetHashKey(Config.TattooList[v.collection][v.texture].nameHash))
                    end
                else
                    AddPedDecorationFromHashes(PlayerPedId(), GetHashKey(v.collection), GetHashKey(Config.TattooList[v.collection][v.texture].nameHash))
                end
            end
            currentTattoos = tattooList
        end
    end)
end

if Config.Core == "ESX" then
    ESX = nil
    if Config.CoreDefine == "" then
        ESX = exports["es_extended"]:getSharedObject()
    else
        Citizen.CreateThread(function()
            while ESX == nil do
                TriggerEvent(Config.CoreDefine, function(definedCore)
                    ESX = definedCore
                end)
                Citizen.Wait(1)
            end
        end)
    end
elseif Config.Core == "QBCore" then
    QBCore = exports['qb-core']:GetCoreObject()
end

local CURRENT_TATTOOSHOP, CURRENT_CHAIR
local barberId, chairId
local PlayerData = {}
local Ped = nil
local currentTattoos = {}
local cam = nil
local canCancel

Citizen.CreateThread(function()
    for k, v in pairs(Config.Tattooshops) do
        local blip = AddBlipForCoord(v.position)
	    SetBlipSprite(blip, Config.Blip.Sprite)
	    SetBlipDisplay(blip, Config.Blip.Display)
	    SetBlipScale(blip, Config.Blip.Scale)
	    SetBlipColour(blip, Config.Blip.Color)
	    SetBlipAsShortRange(blip, true)
	    BeginTextCommandSetBlipName("STRING")
	    AddTextComponentString(Config.Translate[Config.Lang]["tattoo_blip"])
	    EndTextCommandSetBlipName(blip)
    end
end)

AddEventHandler(Config.PlayerLoaded, function()
    if Config.Core == "ESX" then
        ESX.TriggerServerCallback('vms_tattooshop:requestPlayerTattoos', function(tattooList)
            if tattooList then
                for k,v in pairs(tattooList) do
                    Config.TattooList[v.collection][v.texture].hasTattoo = true
                    ApplyPedOverlay(PlayerPedId(), GetHashKey(v.collection), GetHashKey(Config.TattooList[v.collection][v.texture].nameHash))
                end
                currentTattoos = tattooList
            end
        end)
    elseif Config.Core == "QBCore" then
        QBCore.Functions.TriggerCallback('vms_tattooshop:requestPlayerTattoos', function(tattooList)
            if tattooList then
                for k,v in pairs(tattooList) do
                    Config.TattooList[v.collection][v.texture].hasTattoo = true
                    ApplyPedOverlay(PlayerPedId(), GetHashKey(v.collection), GetHashKey(Config.TattooList[v.collection][v.texture].nameHash))
                end
                currentTattoos = tattooList
            end
        end)
    end
end)

if Config.Core == "ESX" then
    RegisterNetEvent(Config.PlayerLoaded)
    AddEventHandler(Config.PlayerLoaded, function(xPlayer)
        PlayerData = xPlayer
    end)

    RegisterNetEvent(Config.JobUpdated)
    AddEventHandler(Config.JobUpdated, function(job)
        PlayerData.job = job 
    end) 
elseif Config.Core == "QBCore" then
    RegisterNetEvent(Config.PlayerLoaded, function()
        CreateThread(function()
            QBCore.Functions.GetPlayerData(function(PlayerData)
                PlayerData = PlayerData
            end)
        end)
    end)

    RegisterNetEvent(Config.JobUpdated, function(JobInfo)
        PlayerData.job = JobInfo
    end)
end

function loadAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        RequestAnimDict(dict)
        Wait(5)
    end
end

function requestPedModel(model)
    if not HasModelLoaded(model) then
		RequestModel(model)
		while not HasModelLoaded(model) do
			Citizen.Wait(1)
		end
	end
end

Citizen.CreateThread(function()
    local inRange = false
    local shown = false
    while true do
        inRange = false
        local myPed = PlayerPedId()
        local myCoords = GetEntityCoords(myPed)
        local sleep = 2000
        for k, v in pairs(Config.Tattooshops) do
            for k2, v2 in pairs(Config.Tattooshops[k].Chairs) do
                local distance = #(myCoords - v2.position)
                if distance < Config.DistanceView then
                    sleep = 2
                    if not v2.busy then
                        DrawMarker(21, v2.position.x, v2.position.y, v2.position.z+.75, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.25, 0.25, 0.25, v.takeSitMarker.FreeColor[1], v.takeSitMarker.FreeColor[2], v.takeSitMarker.FreeColor[3], v.takeSitMarker.FreeColor[4], true, false, false, true)
                    else
                        if not v.business then
                            DrawMarker(21, v2.position.x, v2.position.y, v2.position.z+.75, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.25, 0.25, 0.25, v.takeSitMarker.BusyColor[1], v.takeSitMarker.BusyColor[2], v.takeSitMarker.BusyColor[3], v.takeSitMarker.BusyColor[4], true, false, false, true)
                        else
                            if PlayerData.job ~= nil and PlayerData.job.name == v.ownerJob then
                                DrawMarker(21, v2.position.x, v2.position.y, v2.position.z+.75, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.25, 0.25, 0.25, 255, v.takeSitMarker.BusyColor[2], v.takeSitMarker.BusyColor[3], v.takeSitMarker.BusyColor[4], true, false, false, true)
                            end
                        end
                    end
                end
                if distance < Config.DistanceAccess and not CURRENT_CHAIR then
                    if not v.business then
                        if Config.TextUI_Enabled then
                            inRange = Config.Translate[Config.Lang]["take_a_sit"]
                        else
                            if Config.Core == "ESX" then
                                ESX.ShowHelpNotification(Config.Translate[Config.Lang]["take_a_sit"])
                            end
                        end
                        if IsControlJustPressed(0, 38) then
                            inRange = false
                            barberId, chairId = k, k2
                            readyCutHair(v2)
                            createTattooPed(v, v2)
                            TriggerServerEvent("vms_tattooshop:sv:setBusyChair", barberId, chairId, true)
                        end
                    else
                        if v2.busy then
                            if PlayerData.job ~= nil and PlayerData.job.name == v.ownerJob then
                                if Config.TextUI_Enabled then
                                    inRange = Config.Translate[Config.Lang]["open_tattooshop"]
                                else
                                    if Config.Core == "ESX" then
                                        ESX.ShowHelpNotification(Config.Translate[Config.Lang]["open_tattooshop"])
                                    end
                                end
                            end
                        else
                            if Config.TextUI_Enabled then
                                inRange = Config.Translate[Config.Lang]["take_a_sit"]
                            else
                                if Config.Core == "ESX" then
                                    ESX.ShowHelpNotification(Config.Translate[Config.Lang]["take_a_sit"])
                                end
                            end
                        end
                        if IsControlJustPressed(0, 38) then
                            if PlayerData.job ~= nil and PlayerData.job.name == v.ownerJob and v2.busy then
                                inRange = false
                                barberId, chairId = k, k2
                                TriggerServerEvent("vms_tattooshop:getClientSkin", v2.busy)
                                TaskPedSlideToCoord(PlayerPedId(), v2.tattooerPos.x, v2.tattooerPos.y, v2.tattooerPos.z, v2.tattooerPos.w, 1.0)
                                Citizen.Wait(1200)
                                SetEntityCoords(PlayerPedId(), v2.tattooerPos.x, v2.tattooerPos.y, v2.tattooerPos.z)
                                SetEntityHeading(PlayerPedId(), v2.tattooerPos.w)
                            else
                                inRange = false
                                barberId, chairId = k, k2
                                readyCutHair(v2, true)
                                TriggerServerEvent("vms_tattooshop:sv:setBusyChair", barberId, chairId, true)
                            end
                        end
                    end
                end
            end
        end
        if inRange and not shown then
            shown = true
            Config.TextUI_Open(inRange)
        elseif not inRange and shown then
            shown = false
            Config.TextUI_Close()
        end
        Citizen.Wait(sleep)
    end
end)

function readyCutHair(v2, isBusiness)
    DoScreenFadeOut(100)
    while not IsScreenFadedOut() do
        Citizen.Wait(0)
    end
    SetEntityCoords(PlayerPedId(), v2.chair_coord.x, v2.chair_coord.y, v2.chair_coord.z)
    SetEntityHeading(PlayerPedId(), v2.chair_coord.w)
    local myPed = PlayerPedId()
    loadAnimDict(Config.LiesAnims["backAnimDict"])
    TaskPlayAnim(myPed, Config.LiesAnims["backAnimDict"], Config.LiesAnims["backAnim"], 8.0, 8.0, -1, 1, 0, false, false, false)
    --FreezeEntityPosition(myPed, true)
    Citizen.Wait(400)
    DoScreenFadeIn(200)
    if isBusiness then
        CancelingThread(true)
    end
end

function CancelingThread(start)
    Citizen.CreateThread(function()
        canCancel = start
        while canCancel do
            Citizen.Wait(1)
            if Config.Core == "ESX" then
                ESX.ShowHelpNotification(Config.Translate[Config.Lang]["get_up"])
            end
            if IsControlJustPressed(0, 73) then
                DeleteSkinCam(true)
                break
            end
        end
    end)
end

function createTattooPed(v, v2)
    CURRENT_TATTOOSHOP = v
    if not v.business and v.pedModel then
        local pedModel = GetHashKey(v.pedModel)
        requestPedModel(pedModel)
        Ped = CreatePed(1, pedModel, v.tattooPedSpawnPos.x, v.tattooPedSpawnPos.y, v.tattooPedSpawnPos.z, v.tattooPedSpawnPos.w, true, true)
        SetEntityHeading(Ped, v.tattooPedSpawnPos.w)
        SetEntityInvincible(Ped, true)
        SetBlockingOfNonTemporaryEvents(Ped, true)
        TaskPedSlideToCoord(Ped, v2.position.x, v2.position.y, v2.position.z, v2.position.w, 1.0)
        Citizen.Wait(5000)
        TaskPedSlideToCoord(Ped, v2.tattooerPos.x, v2.tattooerPos.y, v2.tattooerPos.z, v2.tattooerPos.w, 1.0)
        Citizen.Wait(1000)
        SetEntityCoords(Ped, v2.tattooerPos.x, v2.tattooerPos.y, v2.tattooerPos.z)
        SetEntityHeading(Ped, v2.tattooerPos.w)
        FreezeEntityPosition(Ped, true)
    end
    if Config.Core == "ESX" then
        TriggerEvent('skinchanger:getSkin', function(skin)
            if skin.sex == 0 then
                TriggerEvent('skinchanger:loadSkin', Config.ClothesOff["male"])
            else
                TriggerEvent('skinchanger:loadSkin', Config.ClothesOff["female"])
            end
            CreateSkinCam()
        end)
    elseif Config.Core == "QBCore" then
        local gender = QBCore.Functions.GetPlayerData().charinfo.gender
        if gender == 0 then
            TriggerEvent('qb-clothing:client:loadOutfit', Config.ClothesOff["male"])
            
        else
            TriggerEvent('qb-clothing:client:loadOutfit', Config.ClothesOff["female"])
            
        end
    end
end

function CreateSkinCam()
    if not DoesCamExist(cam) then
        cam = CreateCam('DEFAULT_SCRIPTED_CAMERA', true)
    end
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    SendNUIMessage({
        action = "show",
        TattooList = Config.TattooList
    })
    SetCamActive(cam, true)
    RenderScriptCams(true, true, 1500, true, true)
    SetNuiFocus(true, true)
    SetCamCoord(cam, GetOffsetFromEntityInWorldCoords(PlayerPedId(), Config.StartingCam[1]))
    PointCamAtCoord(cam, GetOffsetFromEntityInWorldCoords(PlayerPedId(), Config.StartingCam[2]))
end

--[[ NUI - PODGLĄD TATUAŻU ]]
function DeleteSkinCam(isOwnerBarber)
    SetCamActive(cam, false)
    RenderScriptCams(false, true, 500, true, true)
    cam = nil
    PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FREEMODE_SOUNDSET", true)
    if not isOwnerBarber then
        SetNuiFocus(false, false)
        SendNUIMessage({action = "hide"})
        DeletePed(Ped)
        Ped = nil
    end
    if isOwnerBarber then
        local coords = Config.Tattooshops[barberId].Chairs[chairId].position
        SetEntityCoords(PlayerPedId(), coords.x, coords.y, coords.z)
    end
    TriggerServerEvent("vms_tattooshop:sv:setBusyChair", barberId, chairId, false)
    FreezeEntityPosition(PlayerPedId(),false)
    ClearPedTasks(PlayerPedId())
    reloadPlayerTattoos()
end

--[[ NUI - PODGLĄD TATUAŻU ]]
RegisterNUICallback("change", function(data)
    if data.clientId then
        TriggerServerEvent("vms_tattooshop:sv:updateClientSkin", data.clientId, data.item, data.collection)
    else
        drawTattoo(data.item, data.collection)
    end
    PlaySoundFrontend(-1, "Hit", "RESPAWN_ONLINE_SOUNDSET", true)
end)

RegisterNUICallback("switchCategory", function(data)
    PlaySoundFrontend(-1, "Hit_1", "LONG_PLAYER_SWITCH_SOUNDS", true)
    if not data.clientId then
        reloadPlayerTattoos()
    end
end)

RegisterNUICallback("buy", function(data)
    local dataid = data.id+1
    if data.clientId then
        TriggerServerEvent("vms_tattooshop:sv:buyClient", data.clientId, data.collection, data.id)
        Config.Notification(Config.Translate["started_tattooing"], 2500, "success")
    else
        if Config.Core == "ESX" then
            ESX.TriggerServerCallback("vms_tattooshop:buyTattoo", function(callback)
                if callback then
                    currentTattoos[#currentTattoos+1] = {collection = data.collection, texture = dataid}
                    Config.TattooList[data.collection][dataid].hasTattoo = true
                    SendNUIMessage({action = "updateui", TattooList = Config.TattooList, collection = data.collection})
                    reloadPlayerTattoos()
                    PlaySoundFrontend(-1, 'REMOTE_PLYR_CASH_COUNTER_COMPLETE', 'DLC_HEISTS_GENERAL_FRONTEND_SOUNDS', 0)
                else
                    PlaySoundFrontend(-1, 'Place_Prop_Fail', 'DLC_Dmod_Prop_Editor_Sounds', 0)
                end
            end, currentTattoos, data.collection, dataid, Config.TattooList[data.collection][dataid].price)
        elseif Config.Core == "QBCore" then
            QBCore.Functions.TriggerCallback("vms_tattooshop:buyTattoo", function(callback)
                if callback then
                    currentTattoos[#currentTattoos+1] = {collection = data.collection, texture = dataid}
                    Config.TattooList[data.collection][dataid].hasTattoo = true
                    SendNUIMessage({action = "updateui", TattooList = Config.TattooList, collection = data.collection})
                    reloadPlayerTattoos()
                    PlaySoundFrontend(-1, 'REMOTE_PLYR_CASH_COUNTER_COMPLETE', 'DLC_HEISTS_GENERAL_FRONTEND_SOUNDS', 0)
                else
                    PlaySoundFrontend(-1, 'Place_Prop_Fail', 'DLC_Dmod_Prop_Editor_Sounds', 0)
                end
            end, currentTattoos, data.collection, dataid, Config.TattooList[data.collection][dataid].price)
        end
    end
end)

--[[ NUI - USUWANIE TATUAŻU ]]
RegisterNUICallback("remove", function(data)
    local dataid = data.id+1
    if data.clientId then
        TriggerServerEvent("vms_tattooshop:sv:removeClient", data.clientId, data.collection, dataid)
        Config.Notification(Config.Translate["removing_tattooing"], 2500, "success")
    else
        for k, v in pairs(currentTattoos) do
            if v.collection == data.collection and v.texture == dataid then
                table.remove(currentTattoos, k)
            end
        end
        Config.TattooList[data.collection][dataid].hasTattoo = false
        SendNUIMessage({action = "updateui", TattooList = Config.TattooList, collection = data.collection})
        TriggerServerEvent("vms_tattooshop:removeTattoo", currentTattoos, Config.TattooList[data.collection][dataid].removePrice)
        reloadPlayerTattoos()
    end
end)

--[[ NUI - ZAMYKANIE MENU ]]
RegisterNUICallback("hide", function(data)
    if data.clientId then
        TriggerServerEvent("vms_tattooshop:sv:closeCam", data.clientId)
        SetNuiFocus(false, false)
        SendNUIMessage({action = "hide"})
        SetCamActive(cam, false)
        RenderScriptCams(false, true, 500, true, true)
        cam = nil
    else
        DeleteSkinCam()
        if Config.Core == "ESX" then
            ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                TriggerEvent('skinchanger:loadSkin', skin) 
            end)
        elseif Config.Core == "QBCore" then
		    TriggerServerEvent('qb-clothes:loadPlayerSkin')
            LoadTattoos()
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        LoadTattoos()
    end
end)

--[[ ZAJĘCIE FOTELA ]]
RegisterNetEvent("vms_tattooshop:cl:setBusyChair")
AddEventHandler("vms_tattooshop:cl:setBusyChair", function(barberId, chairId, toggle)
    Config.Tattooshops[barberId].Chairs[chairId].busy = toggle
end)

RegisterNetEvent("vms_tattooshop:cl:updateClientSkin")
AddEventHandler("vms_tattooshop:cl:updateClientSkin", function(id, collection, tattooer)
    drawTattoo(id, collection, tattooer or nil)
end)

RegisterNetEvent("vms_tattooshop:cl:updateTattooerCam")
AddEventHandler("vms_tattooshop:cl:updateTattooerCam", function(data, client)
    if not DoesCamExist(cam) then
        cam = CreateCam('DEFAULT_SCRIPTED_CAMERA', true)
        SetCamActive(cam, true)
        RenderScriptCams(true, true, 500, true, true)
    end
    local playerindex = GetPlayerFromServerId(tonumber(client))
    local ped = GetPlayerPed(playerindex)

    if data.anim == "FRONT" then
        SetEntityHeading(ped, Config.Tattooshops[barberId].pedHeadingToChair)
        loadAnimDict(Config.LiesAnims["frontAnimDict"])
        TaskPlayAnim(ped, Config.LiesAnims["frontAnimDict"], Config.LiesAnims["frontAnim"], 8.0, 8.0, -1, 1, 1, true, true, true)
    elseif data.anim == "BACK" then
        SetEntityHeading(ped, Config.Tattooshops[barberId].pedHeadingToChairBack)
        loadAnimDict(Config.LiesAnims["backAnimDict"])
        TaskPlayAnim(ped, Config.LiesAnims["backAnimDict"], Config.LiesAnims["backAnim"], 8.0, 8.0, -1, 1, 1, true, true, true)
    end

    SetCamCoord(cam, GetOffsetFromEntityInWorldCoords(ped, data.camera[1]))
    PointCamAtCoord(cam, GetOffsetFromEntityInWorldCoords(ped, data.camera[2]))
end)

RegisterNetEvent("vms_tattooshop:cl:loadPlayerSkin")
AddEventHandler("vms_tattooshop:cl:loadPlayerSkin", function()
    if Config.Core == "ESX" then
        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
            TriggerEvent('skinchanger:loadSkin', skin) 
        end)
    elseif Config.Core == "QBCore" then
		TriggerServerEvent('qb-clothes:loadPlayerSkin')
        LoadTattoos()
    end
end)

--[[ BUSINESS - NAŁOŻENIE TATUAŻU ]]
RegisterNetEvent("vms_tattooshop:cl:buyClient")
AddEventHandler("vms_tattooshop:cl:buyClient", function(collection, id, tattooer)
    local id = id + 1
    Config.Notification(Config.Translate[Config.Lang]["started_tattooing"], 2500, "success")
    currentTattoos[#currentTattoos+1] = {collection = collection, texture = id}
    Config.TattooList[collection][id].hasTattoo = true
    reloadPlayerTattoos()
    TriggerServerEvent("vms_tattooshop:sv:sendUpdated", Config.TattooList, collection, tattooer)
    TriggerServerEvent("vms_tattooshop:saveClientTattoos", currentTattoos)
end)

--[[ BUSINESS - USUNIĘCIE TATUAŻU ]]
RegisterNetEvent("vms_tattooshop:cl:removeClient")
AddEventHandler("vms_tattooshop:cl:removeClient", function(collection, id, tattooer)
    Config.Notification(Config.Translate[Config.Lang]["removing_tattooing"], 2500, "success")
    for k, v in pairs(currentTattoos) do
        if v.collection == collection and v.texture == id then
            table.remove(currentTattoos, k)
        end
    end
    Config.TattooList[collection][id].hasTattoo = false
    reloadPlayerTattoos()
    TriggerServerEvent("vms_tattooshop:sv:sendUpdated", Config.TattooList, collection, tattooer)
    TriggerServerEvent("vms_tattooshop:saveClientTattoos", currentTattoos)
end)

--[[ BUSINESS - PO KUPNIE / USUNIECIU ODŚWIEŻANIE UI ]]
RegisterNetEvent("vms_tattooshop:cl:updateUi")
AddEventHandler("vms_tattooshop:cl:updateUi", function(data, currentCollection)
    SendNUIMessage({action = "updateui", TattooList = data, collection = currentCollection})
end)

--[[ BUSINESS - WYŁĄCZENIE KAMERY KLIENTA ]]
RegisterNetEvent("vms_tattooshop:cl:closeCam")
AddEventHandler("vms_tattooshop:cl:closeCam", function()
    DeleteSkinCam(true)
    if Config.Core == "ESX" then
        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
            TriggerEvent('skinchanger:loadSkin', skin) 
        end)
    elseif Config.Core == "QBCore" then
		TriggerServerEvent('qb-clothes:loadPlayerSkin')
        LoadTattoos()
    end
end)

--[[ BUSINESS - TATUATOR OTWIERANIE MENU ]]
RegisterNetEvent("vms_tattooshop:openBusiness")
AddEventHandler("vms_tattooshop:openBusiness", function(data, clientId)
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = "show",
        TattooList = data,
        clientId = clientId
    })
end)

--[[ BUSINESS - POBIERANIE INFORMACJI O GRACZU ]]
RegisterNetEvent("vms_tattooshop:getData")
AddEventHandler("vms_tattooshop:getData", function(plBarberId)
    TriggerServerEvent("vms_tattooshop:sendData", Config.TattooList, plBarberId)
    if not DoesCamExist(cam) then
        cam = CreateCam('DEFAULT_SCRIPTED_CAMERA', true)
    end
    local playerPed = PlayerPedId()
    SetCamActive(cam, true)
    RenderScriptCams(true, true, 500, true, true)
    canCancel = false
    if Config.Core == "ESX" then
        TriggerEvent('skinchanger:getSkin', function(skin)
            if skin.sex == 0 then
                TriggerEvent('skinchanger:loadSkin', Config.ClothesOff["male"])
            else
                TriggerEvent('skinchanger:loadSkin', Config.ClothesOff["female"])
            end
        end)
    elseif Config.Core == "QBCore" then
        local gender = QBCore.Functions.GetPlayerData().charinfo.gender
        if gender == 0 then
            TriggerEvent('qb-clothing:client:loadOutfit', Config.ClothesOff["male"])
            
        else
            TriggerEvent('qb-clothing:client:loadOutfit', Config.ClothesOff["female"])
            
        end
    end
    SetCamCoord(cam, GetOffsetFromEntityInWorldCoords(PlayerPedId(), Config.StartingCam[1]))
    PointCamAtCoord(cam, GetOffsetFromEntityInWorldCoords(PlayerPedId(), Config.StartingCam[2]))
end)

drawTattoo = function(current, collection, tattooer)
    local current = current + 1
	ClearPedDecorations(PlayerPedId())
    for k,v in pairs(currentTattoos) do
		ApplyPedOverlay(PlayerPedId(), GetHashKey(v.collection), GetHashKey(Config.TattooList[v.collection][v.texture].nameHash))
	end
    selectedCamera(collection, current, tattooer or nil)
	ApplyPedOverlay(PlayerPedId(), GetHashKey(collection), GetHashKey(Config.TattooList[collection][current].nameHash))
end

reloadPlayerTattoos = function()
    ClearPedDecorations(PlayerPedId())
    for k,v in pairs(currentTattoos) do
		ApplyPedOverlay(PlayerPedId(), GetHashKey(v.collection), GetHashKey(Config.TattooList[v.collection][v.texture].nameHash))
	end
end

selectedCamera = function(collection, id, tattooer)
    local selectedTattoo = Config.TattooList[collection][id]
    local myPed = PlayerPedId()
    if selectedTattoo.anim == "FRONT" then
        SetEntityHeading(myPed, Config.Tattooshops[barberId].pedHeadingToChair)
        loadAnimDict(Config.LiesAnims["frontAnimDict"])
        TaskPlayAnim(myPed, Config.LiesAnims["frontAnimDict"], Config.LiesAnims["frontAnim"], 3.0, 3.0, -1, 1, 0, false, false, false)
    elseif selectedTattoo.anim == "BACK" then
        SetEntityHeading(myPed, Config.Tattooshops[barberId].pedHeadingToChairBack)
        loadAnimDict(Config.LiesAnims["backAnimDict"])
        TaskPlayAnim(myPed, Config.LiesAnims["backAnimDict"], Config.LiesAnims["backAnim"], 3.0, 3.0, -1, 1, 0, false, false, false)
    end
    SetCamCoord(cam, GetOffsetFromEntityInWorldCoords(myPed, selectedTattoo.camera[1]))
    PointCamAtCoord(cam, GetOffsetFromEntityInWorldCoords(myPed, selectedTattoo.camera[2]))
    if tattooer then
        TriggerServerEvent("vms_tattooshop:sv:updateTattooerCam", tattooer, selectedTattoo)
    end
end

RegisterNetEvent("vms_tattooshop:cl:notification", function(message, time, type)
    Config.Notification(message, time, type)
end)