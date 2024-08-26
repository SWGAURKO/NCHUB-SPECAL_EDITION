QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent("qb-prisonrental:vehiclelist")
AddEventHandler("qb-prisonrental:vehiclelist", function()
    local vehicles = {}
    for i = 1, #Config.vehicleList do
        table.insert(vehicles, {
            id = Config.vehicleList[i].model,
            header = Config.vehicleList[i].name,
            txt = "$"..Config.vehicleList[i].price..".00",
            params = {
              event = "qb-prisonrental:attemptvehiclespawn",
              args = {
                  id = Config.vehicleList[i].model,
                  price = Config.vehicleList[i].price,
              }
            }
        })
    end
    exports["qb-menu"]:openMenu(vehicles);
end)


-- RegisterNetEvent("qb-prisonrental:vehiclelist")
-- AddEventHandler("qb-prisonrental:vehiclelist", function()
--     for k,v in pairs(Config.vehicleList) do
--       exports["qb-menu"]:openMenu({
--           id = 2,
--           header = v.name,
--           txt = "$".. v.price ..".00",
--           params = {
--               event = "qb-prisonrental:attemptvehiclespawn",
--               args = {
--                   v.model,
--                   v.price,
--               }
--           }
--       })
--     end
-- end)

RegisterNetEvent("qb-prisonrental:vehiclelist2")
AddEventHandler("qb-prisonrental:vehiclelist2", function()
  local vehicles = {}
  for i = 1, #Config.vehicleListt do
      table.insert(vehicles, {
          id = Config.vehicleListt[i].model,
          header = Config.vehicleListt[i].name,
          txt = "$"..Config.vehicleListt[i].price..".00",
          params = {
            event = "qb-prisonrental:attemptvehiclespawn2",
            args = {
                id = Config.vehicleListt[i].model,
                price = Config.vehicleListt[i].price,
            }
          }
      })
  end
  exports["qb-menu"]:openMenu(vehicles);
end)


RegisterNetEvent("qb-prisonrental:attemptvehiclespawn2")
AddEventHandler("qb-prisonrental:attemptvehiclespawn2", function(vehicle)
    TriggerServerEvent("qb-prisonrental:attemptPurchase2",vehicle.id, vehicle.price)
end)

RegisterNetEvent("qb-prisonrental:attemptvehiclespawn")
AddEventHandler("qb-prisonrental:attemptvehiclespawn", function(vehicle)
    TriggerServerEvent("qb-prisonrental:attemptPurchase",vehicle.id, vehicle.price)
end)

RegisterNetEvent("qb-prisonrental:attemptvehiclespawnfail")
AddEventHandler("qb-prisonrental:attemptvehiclespawnfail", function()
  QBCore.Functions.Notify("Not enough money.", "error")
end)

local PlayerName = nil

RegisterNetEvent("qb-prisonrental:giverentalpaperClient")
AddEventHandler("qb-prisonrental:giverentalpaperClient", function(model, plate, name)

  local info = {
    data = "Model : "..tostring(model).." | Plate : "..tostring(plate)..""
  }
  TriggerServerEvent('QBCore:Server:AddItem', "rentalpapers", 1, info)
end)

RegisterNetEvent("qb-prisonrental:returnvehicle")
AddEventHandler("qb-prisonrental:returnvehicle", function()
  local car = GetVehiclePedIsIn(PlayerPedId(),true)

  if car ~= 0 then
    local plate = GetVehicleNumberPlateText(car)
    local vehname = string.lower(GetDisplayNameFromVehicleModel(GetEntityModel(car)))
    if string.find(tostring(plate), "MW") then
      QBCore.Functions.TriggerCallback('qb-prisonrental:server:hasrentalpapers', function(HasItem)
        if HasItem then
          TriggerServerEvent("QBCore:Server:RemoveItem", "rentalpapers", 1)
          TriggerServerEvent('qb-prisonrental:server:payreturn',vehname)
          DeleteVehicle(car)
          DeleteEntity(car)
        else
          QBCore.Functions.Notify("I cannot take a vehicle without its papers.", "error")
        end
      end)
    else
      QBCore.Functions.Notify("This is not a rented vehicle.", "error")
    end

  else
    QBCore.Functions.Notify("I don't see any rented vehicle, make sure its nearby.", "error")
  end
end)

RegisterNetEvent("qb-prisonrental:vehiclespawn")
AddEventHandler("qb-prisonrental:vehiclespawn", function(data, cb)
  local model = data

  RequestModel(model)
  while not HasModelLoaded(model) do
      Citizen.Wait(0)
  end
  SetModelAsNoLongerNeeded(model)

  local veh = CreateVehicle(model, vector4(3838.7619, -47.23254, 0.6715892, 88.956848), true, false)
  Citizen.Wait(100)
  SetEntityAsMissionEntity(veh, true, true)
  SetModelAsNoLongerNeeded(model)
  SetVehicleOnGroundProperly(veh)
  SetVehicleNumberPlateText(veh, "MW"..tostring(math.random(1000, 9999)))
  local plate = GetVehicleNumberPlateText(veh)
  TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh), veh)
  exports['cdn-fuel']:SetFuel(veh, 100)
  local plateText = GetVehicleNumberPlateText(veh)
  TriggerServerEvent("qb-prisonrental:giverentalpaperServer",model ,plateText)

  local timeout = 10
  while not NetworkDoesEntityExistWithNetworkId(veh) and timeout > 0 do
      timeout = timeout - 1
      Wait(1000)
  end
end)

RegisterNetEvent("qb-prisonrental:vehiclespawn2")
AddEventHandler("qb-prisonrental:vehiclespawn2", function(data, cb)
  local model = data

  RequestModel(model)
  while not HasModelLoaded(model) do
      Citizen.Wait(0)
  end
  SetModelAsNoLongerNeeded(model)

  local veh = CreateVehicle(model, vector4(2853.0422, 211.51966, 2.4672164, 50.271766), true, false)
  Citizen.Wait(100)
  SetEntityAsMissionEntity(veh, true, true)
  SetModelAsNoLongerNeeded(model)
  SetVehicleOnGroundProperly(veh)
  SetVehicleNumberPlateText(veh, "MW"..tostring(math.random(1000, 9999)))
  local plate = GetVehicleNumberPlateText(veh)
  TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh), veh)
  exports['cdn-fuel']:SetFuel(veh, 100)
  local plateText = GetVehicleNumberPlateText(veh)
  TriggerServerEvent("qb-prisonrental:giverentalpaperServer",model ,plateText)

  local timeout = 10
  while not NetworkDoesEntityExistWithNetworkId(veh) and timeout > 0 do
      timeout = timeout - 1
      Wait(1000)
  end
end)

RegisterNetEvent("qb-prisonrental:vehiclespawn3")
AddEventHandler("qb-prisonrental:vehiclespawn3", function(data, cb)
  local model = data

  RequestModel(model)
  while not HasModelLoaded(model) do
      Citizen.Wait(0)
  end
  SetModelAsNoLongerNeeded(model)

  local veh = CreateVehicle(model, vector4(1855.11, 2578.81, 45.67, 270.86), true, false)
  Citizen.Wait(100)
  SetEntityAsMissionEntity(veh, true, true)
  SetModelAsNoLongerNeeded(model)
  SetVehicleOnGroundProperly(veh)
  SetVehicleNumberPlateText(veh, "MW"..tostring(math.random(1000, 9999)))
  local plate = GetVehicleNumberPlateText(veh)
  TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh), veh)
  exports['cdn-fuel']:SetFuel(veh, 100)
  local plateText = GetVehicleNumberPlateText(veh)
  TriggerServerEvent("qb-prisonrental:giverentalpaperServer",model ,plateText)

  local timeout = 10
  while not NetworkDoesEntityExistWithNetworkId(veh) and timeout > 0 do
      timeout = timeout - 1
      Wait(1000)
  end
end)


AddEventHandler("qb-inventory:itemUsed", function(item, info)
  if item == "rentalpapers" then

    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
      data = json.decode(info)
      local vin = GetVehicleNumberPlateText(plyVeh)
      local isRental = vin ~= nil and string.sub(vin, 2, 3) == "NC"
      if isRental then
        TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(plyVeh))
        QBCore.Functions.Notify("You received the vehicle keys.", "success")
      else
        QBCore.Functions.Notify("This rental does not exist.", "success")
      end
  end
end)