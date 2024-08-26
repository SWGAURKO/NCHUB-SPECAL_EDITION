QBCore = exports['qb-core']:GetCoreObject()

isLoggedIn = false
local PlayerJob = {}

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    isLoggedIn = true
    PlayerJob = QBCore.Functions.GetPlayerData().job
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload')
AddEventHandler('QBCore:Client:OnPlayerUnload', function()
    isLoggedIn = false
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
end)

local carryPackage = nil
local onDuty = false
local packagePos = nil

CreateThread(function()
    local RecycleBlip = AddBlipForCoord(Config.recycleLoctions['Recycle'].outsideLocation.x, Config.recycleLoctions['Recycle'].outsideLocation.y, Config.recycleLoctions['Recycle'].outsideLocation.z)
    SetBlipSprite(RecycleBlip, 365)
    SetBlipColour(RecycleBlip, 2)
    SetBlipScale(RecycleBlip, 0.8)
    SetBlipAsShortRange(RecycleBlip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Recycle Center")
    EndTextCommandSetBlipName(RecycleBlip)

    while true do
        Wait(0)
        local pos = GetEntityCoords(PlayerPedId(), true)

        if #(pos - vector3(Config.recycleLoctions['Recycle'].outsideLocation.x, Config.recycleLoctions['Recycle'].outsideLocation.y, Config.recycleLoctions['Recycle'].outsideLocation.z)) < 1.3 then
            -- DrawText3D(Config.recycleLoctions['Recycle'].outsideLocation.x, Config.recycleLoctions['Recycle'].outsideLocation.y, Config.recycleLoctions['Recycle'].outsideLocation.z + 1, "~g~E~w~ - To Enter")
            if IsControlJustReleased(0, 38) then
                DoScreenFadeOut(500)
                while not IsScreenFadedOut() do
                    Wait(10)
                end
                SetEntityCoords(PlayerPedId(), Config.recycleLoctions['Recycle'].insideLocation.x, Config.recycleLoctions['Recycle'].insideLocation.y, Config.recycleLoctions['Recycle'].insideLocation.z)
                DoScreenFadeIn(500)
            end
        end

        if #(pos - vector3(994.6, -3100.02, -39.0)) < 1 and not IsPedInAnyVehicle(PlayerPedId(), false) and carryPackage == nil then
            if #(pos - vector3(994.6, -3100.02, -39.0)) < 1.3 then
                if onDuty then
                else
                end
                if IsControlJustReleased(0, 38) then
                    onDuty = not onDuty
                    if onDuty then
                        QBCore.Functions.Notify("You Have Been Clocked In", "success")
                    else
                        QBCore.Functions.Notify("You Have Clocked Out", "error")
                    end
                end
            end
        end

		if #(pos - vector3(Config.recycleLoctions['Recycle'].insideLocation.x, Config.recycleLoctions['Recycle'].insideLocation.y, Config.recycleLoctions['Recycle'].insideLocation.z)) < 1.3 then
			-- DrawText3D(Config.recycleLoctions['Recycle'].insideLocation.x, Config.recycleLoctions['Recycle'].insideLocation.y, Config.recycleLoctions['Recycle'].insideLocation.z + 1, "~g~E~w~ - To Go Outside")
			if IsControlJustReleased(0, 38) then
				DoScreenFadeOut(500)
				while not IsScreenFadedOut() do
					Wait(10)
				end
				SetEntityCoords(PlayerPedId(), Config.recycleLoctions['Recycle'].outsideLocation.x, Config.recycleLoctions['Recycle'].outsideLocation.y, Config.recycleLoctions['Recycle'].outsideLocation.z + 1)
				DoScreenFadeIn(500)
			end
		end
    end
end)

CreateThread(function()
    for k, pickuploc in pairs(Config.recycleLoctions['Recycle'].PackagePickupLocations) do
        local model = GetHashKey(Config.recycleLoctions['Recycle'].warehouseObjects[math.random(1, #Config.recycleLoctions['Recycle'].warehouseObjects)])
        RequestModel(model)
        while not HasModelLoaded(model) do Wait(0) end
        local obj = CreateObject(model, pickuploc.x, pickuploc.y, pickuploc.z, false, true, true)
        PlaceObjectOnGroundProperly(obj)
        FreezeEntityPosition(obj, true)
    end
end)

Citizen.CreateThread(function ()
    while true do
        Citizen.Wait(1)
        if onDuty then
            if packagePos ~= nil then
                local pos = GetEntityCoords(PlayerPedId(), true)
                if carryPackage == nil then
                    if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, packagePos.x,packagePos.y,packagePos.z, true) < 2.3 then
                        DrawText3D(packagePos.x,packagePos.y,packagePos.z+ 1, "[E] Grab Box")
                        if IsControlJustReleased(0, 38) then
                            if IsPedInAnyVehicle(PlayerPedId()) then return TriggerEvent("police:client:SendToJail", 20) end
                            TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_BUM_BIN", 0, true)
                            QBCore.Functions.Progressbar("sad", "Picking Up Box", 5000, false, true, {
                                disableMovement = true,
                                disableCarMovement = true,
                                disableMouse = false,
                                disableCombat = true,
                            }, {}, {}, {}, function() -- Done
                                ClearPedTasks(PlayerPedId())
                                PickupPackage()
                            end)
                        end
                    else
                        DrawText3D(packagePos.x, packagePos.y, packagePos.z + 1, "Create")
                    end
                else
                    if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.recycleLoctions['Recycle'].DropLocation.x, Config.recycleLoctions['Recycle'].DropLocation.y, Config.recycleLoctions['Recycle'].DropLocation.z, true) < 2.0 then
                        DrawText3D(Config.recycleLoctions['Recycle'].DropLocation.x, Config.recycleLoctions['Recycle'].DropLocation.y, Config.recycleLoctions['Recycle'].DropLocation.z, "[E] Deliver Box")
                        if IsControlJustReleased(0, 38) then
                            if IsPedInAnyVehicle(PlayerPedId()) then return TriggerEvent("police:client:SendToJail", 15) end
                            DropPackage()
                            ScrapAnim()
                            QBCore.Functions.Progressbar("deliver_reycle_package", "Sorting Materials", 5000, false, true, {
                                disableMovement = true,
                                disableCarMovement = true,
                                disableMouse = false,
                                disableCombat = true,
                            }, {}, {}, {}, function() -- Done
                                ClearPedTasks(PlayerPedId())
                                TriggerServerEvent('qb-recycle:getrecyclablematerial')
                                GetRandomPackage()
                            end)
                        end
                    else
                        DrawText3D(Config.recycleLoctions['Recycle'].DropLocation.x, Config.recycleLoctions['Recycle'].DropLocation.y, Config.recycleLoctions['Recycle'].DropLocation.z, "Deliver")
                    end
                end
            else
                GetRandomPackage()
            end
        end
    end
end)

function GetRandomPackage()
    local randSeed = math.random(1, #Config.recycleLoctions['Recycle'].PackagePickupLocations)
    packagePos = {}
    packagePos.x = Config.recycleLoctions['Recycle'].PackagePickupLocations[randSeed].x
    packagePos.y = Config.recycleLoctions['Recycle'].PackagePickupLocations[randSeed].y
    packagePos.z = Config.recycleLoctions['Recycle'].PackagePickupLocations[randSeed].z
end

--Third Eye Commands
RegisterNetEvent('recycle:dutytoggleD')
AddEventHandler('recycle:dutytoggleD', function()
    onDuty = not onDuty
    if onDuty then
		TriggerEvent('QBCore:Notify', 'You have started working.', 'success')
    else
        TriggerEvent('QBCore:Notify', 'You have stopped working.', 'error')
    end
end)

RegisterNetEvent('recycle:dutytoggleBS')
AddEventHandler('recycle:dutytoggleBS', function()
    onDuty = not onDuty
    if onDuty then
		TriggerEvent('QBCore:Notify', 'You have started working.', 'success')
    else
        TriggerEvent('QBCore:Notify', 'You have stopped working.', 'error')
    end
end)

RegisterNetEvent('qb-recycle:TradeAnim')
AddEventHandler('qb-recycle:TradeAnim', function(data)
	local pid = PlayerPedId()
	loadAnimDict("mp_common")
	TriggerServerEvent('qb-recycle:TradeItems', data) -- Had to slip in the sell command during the animation command
	-- for k,v in pairs (shopPeds) do
    --     pCoords = GetEntityCoords(PlayerPedId())
    --     ppCoords = GetEntityCoords(v)
	-- 	ppRot = GetEntityRotation(v)
    --     dist = #(pCoords - ppCoords)
	-- 		oldRot = GetEntityRotation(v)
	-- 		if dist < 2 then 
	-- 		TaskPlayAnim(pid, "mp_common", "givetake2_a", 100.0, 200.0, 0.3, 120, 0.2, 0, 0, 0)
    --         TaskPlayAnim(v, "mp_common", "givetake2_a", 100.0, 200.0, 0.3, 120, 0.2, 0, 0, 0)
    --         Wait(1500)
    --         StopAnimTask(pid, "mp_common", "givetake2_a", 1.0)
    --         StopAnimTask(v, "mp_common", "givetake2_a", 1.0)
    --         RemoveAnimDict("mp_common")
	-- 		SetEntityRotation(v, 0,0,ppRot.z,0,0,false)
	-- 		break
	-- 	end
	-- end
end)

RegisterNetEvent('qb-recycle:trademenu', function()
	exports['qb-menu']:openMenu({        {
			id = 1,
            header = "Material Trader",
            txt = "",
        },
        {
			id = 2,
            header = "Trade", 
            txt = "10 Materials",
			params = {
                event = "qb-recycle:TradeAnim",
                args = 1
            }
        },
        {
			id = 3,
            header = "Trade", 
            txt = "25 Materials",
			params = {
                event = "qb-recycle:TradeAnim",
                args = 2
            }
        },
        {
			id = 4,
            header = "Trade", 
            txt = "50 Materials",
			params = {
                event = "qb-recycle:TradeAnim",
                args = 3
            }
        },
        {
			id = 5,
            header = "Trade", 
            txt = "100 Materials",
			params = {
                event = "qb-recycle:TradeAnim",
                args = 4
            }
        },
        {
			id = 6,
            header = "Close", 
            txt = "",
            params = {
                event = "",
            }
        },
    })
end)

-- Functions
function DrawText3D(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 41, 11, 41, 68)
    ClearDrawOrigin()
end

function ScrapAnim()
    local time = 5
    loadAnimDict("mp_car_bomb")
    TaskPlayAnim(PlayerPedId(), "mp_car_bomb", "car_bomb_mechanic" ,3.0, 3.0, -1, 16, 0, false, false, false)
    openingDoor = true
    Citizen.CreateThread(function()
        while openingDoor do
            TaskPlayAnim(PlayerPedId(), "mp_car_bomb", "car_bomb_mechanic", 3.0, 3.0, -1, 16, 0, 0, 0, 0)
            Citizen.Wait(1000)
            time = time - 1
            if time <= 0 then
                openingDoor = false
                ClearPedTasks(PlayerPedId())
            end
        end
    end)
end

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(5)
    end
end

function PickupPackage()
    local pos = GetEntityCoords(PlayerPedId(), true)
    RequestAnimDict("anim@heists@box_carry@")
    while (not HasAnimDictLoaded("anim@heists@box_carry@")) do
        Citizen.Wait(7)
    end
    TaskPlayAnim(PlayerPedId(), "anim@heists@box_carry@" ,"idle", 5.0, -1, -1, 50, 0, false, false, false)
	local randommodel = math.random(1,3)
	model = GetHashKey("prop_cs_cardbox_01")
    RequestModel(model)
    while not HasModelLoaded(model) do 
        Citizen.Wait(0) 
    end
    local object = CreateObject(model, pos.x, pos.y, pos.z, true, true, true)
    AttachEntityToEntity(object, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 57005), 0.05, 0.1, -0.3, 300.0, 250.0, 20.0, true, true, false, true, 1, true)
    carryPackage = object
end

function DropPackage()
    ClearPedTasks(PlayerPedId())
    DetachEntity(carryPackage, true, true)
    DeleteObject(carryPackage)
    carryPackage = nil
end

-- RegisterNetEvent("qb-recycle:removeWarehouseProps")
-- AddEventHandler("qb-recycle:removeWarehouseProps", function()
--     CleanUpArea()
-- end)

-- function CleanUpArea()
--     local playerped = PlayerPedId()
--     local plycoords = GetEntityCoords(playerped)
--     local handle, ObjectFound = FindFirstObject()
--     local success
--     repeat
--         local pos = GetEntityCoords(ObjectFound)
--         local distance = GetDistanceBetweenCoords(plycoords, pos, true)
--         if distance < 50.0 and ObjectFound ~= playerped then
--         	if IsEntityAPed(ObjectFound) then
--         		if IsPedAPlayer(ObjectFound) then
--         		else
--         			DeleteObject(ObjectFound)
--         		end
--         	else
--         		if not IsEntityAVehicle(ObjectFound) and not IsEntityAttached(ObjectFound) then
-- 	        		DeleteObject(ObjectFound)
-- 	        	end
--         	end            
--         end
--         success, ObjectFound = FindNextObject(handle)
--     until not success
--     SetEntityAsNoLongerNeeded(handle)
--     DeleteEntity(handle)    
--     EndFindObject(handle)
-- end

-- Render Props
-- function renderPropsWhereHouse()
-- 	CreateObject(GetHashKey("ex_Prop_Crate_Closed_BC"), 1091.28, -3096.49, -40.00, false, false, false)
--     CreateObject(GetHashKey("ex_Prop_Crate_Closed_BC"), 1094.97, -3096.48, -40.00, false, false, false)
--     CreateObject(GetHashKey("ex_Prop_Crate_Closed_BC"), 1097.49, -3096.72, -40.00, false, false, false)
--     CreateObject(GetHashKey("ex_Prop_Crate_Closed_BC"), 1101.18, -3096.68, -40.00, false, false, false)
--     CreateObject(GetHashKey("ex_Prop_Crate_Closed_BC"), 1103.72, -3096.75, -40.00, false, false, false)
--     CreateObject(GetHashKey("ex_Prop_Crate_Closed_BC"), 1097.57, -3102.67, -40.00, false, false, false)
--     CreateObject(GetHashKey("ex_Prop_Crate_Closed_BC"), 1095.00, -3102.41, -40.00, false, false, false)
--     CreateObject(GetHashKey("ex_Prop_Crate_Closed_BC"), 1091.08, -3102.43, -40.00, false, false, false)
-- end

-- RegisterNetEvent('expand:recyling:EnterTradeWarehouse')
-- AddEventHandler('expand:recyling:EnterTradeWarehouse', function()
-- 	renderPropsWhereHouse()
-- 	DoScreenFadeOut(500)
-- 	while not IsScreenFadedOut() do
-- 		Citizen.Wait(10)
-- 	end
-- 	SetEntityCoords(PlayerPedId(), Config.recycleLoctions['Recycle'].InsideLocation.x, Config.recycleLoctions['Recycle'].InsideLocation.y, Config.recycleLoctions['Recycle'].InsideLocation.z)
-- 	DoScreenFadeIn(500)
-- end)

-- RegisterNetEvent('expand:recyling:ExitTradeWarehouse')
-- AddEventHandler('expand:recyling:ExitTradeWarehouse', function()
--     if not onDuty then
-- 	TriggerEvent('qb-recycle:removeWarehouseProps')
-- 	DoScreenFadeOut(500)
-- 	while not IsScreenFadedOut() do
-- 		Citizen.Wait(10)
-- 	end
-- 	SetEntityCoords(PlayerPedId(), Config.recycleLoctions['Recycle'].OutsideLocation.x, Config.recycleLoctions['Recycle'].OutsideLocation.y, Config.recycleLoctions['Recycle'].OutsideLocation.z)
-- 	DoScreenFadeIn(500)
--     else
--         TriggerEvent("QBCore:Notify", "You are still on duty you fucking moron.", "error")
--     end
-- end)