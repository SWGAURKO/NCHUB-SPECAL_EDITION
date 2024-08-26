QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent("qb-pboat:vehiclelist")
AddEventHandler("qb-pboat:vehiclelist", function()
    local vehicles = {}
    for i = 1, #Config.BoatList do
        table.insert(vehicles, {
            id = Config.BoatList[i].model,
            header = Config.BoatList[i].name,
            txt = "$"..Config.BoatList[i].price..".00",
            params = {
              event = "qb-pboat:attemptvehiclespawn",
              args = {
                  id = Config.BoatList[i].model,
                  price = Config.BoatList[i].price,
              }
            }
        })
    end
    exports["qb-menu"]:openMenu(vehicles);
end)


-- RegisterNetEvent("qb-pboat:vehiclelist")
-- AddEventHandler("qb-pboat:vehiclelist", function()
--     for k,v in pairs(Config.BoatList) do
--       exports["qb-menu"]:openMenu({
--           id = 2,
--           header = v.name,
--           txt = "$".. v.price ..".00",
--           params = {
--               event = "qb-pboat:attemptvehiclespawn",
--               args = {
--                   v.model,
--                   v.price,
--               }
--           }
--       })
--     end
-- end)

RegisterNetEvent("qb-pboat:vehiclelist2")
AddEventHandler("qb-pboat:vehiclelist2", function()
  local vehicles = {}
  for i = 1, #Config.PDBoatList do
      table.insert(vehicles, {
          id = Config.PDBoatList[i].model,
          header = Config.PDBoatList[i].name,
          txt = "$"..Config.PDBoatList[i].price..".00",
          params = {
            event = "qb-pboat:attemptvehiclespawn2",
            args = {
                id = Config.PDBoatList[i].model,
                price = Config.PDBoatList[i].price,
            }
          }
      })
  end
  exports["qb-menu"]:openMenu(vehicles);
end)


RegisterNetEvent("qb-pboat:attemptvehiclespawn2")
AddEventHandler("qb-pboat:attemptvehiclespawn2", function(vehicle)
    TriggerServerEvent("qb-pboat:attemptPurchase2",vehicle.id, vehicle.price)
end)

RegisterNetEvent("qb-pboat:attemptvehiclespawn")
AddEventHandler("qb-pboat:attemptvehiclespawn", function(vehicle)
    TriggerServerEvent("qb-pboat:attemptPurchase",vehicle.id, vehicle.price)
end)

RegisterNetEvent("qb-pboat:attemptvehiclespawnfail")
AddEventHandler("qb-pboat:attemptvehiclespawnfail", function()
  QBCore.Functions.Notify("Not enough money.", "error")
end)

local PlayerName = nil

RegisterNetEvent("qb-pboat:giverentalpaperClient")
AddEventHandler("qb-pboat:giverentalpaperClient", function(model, plate, name)

  local info = {
    data = "Model : "..tostring(model).." | Plate : "..tostring(plate)..""
  }
  TriggerServerEvent('QBCore:Server:AddItem', "rentalpapers", 1, info)
end)

RegisterNetEvent("qb-pboat:returnvehicle")
AddEventHandler("qb-pboat:returnvehicle", function()
  local car = GetVehiclePedIsIn(PlayerPedId(),true)

  if car ~= 0 then
    local plate = GetVehicleNumberPlateText(car)
    local vehname = string.lower(GetDisplayNameFromVehicleModel(GetEntityModel(car)))
    if string.find(tostring(plate), "MW") then
      QBCore.Functions.TriggerCallback('qb-pboat:server:hasrentalpapers', function(HasItem)
        if HasItem then
          TriggerServerEvent("QBCore:Server:RemoveItem", "rentalpapers", 1)
          TriggerServerEvent('qb-pboat:server:payreturn',vehname)
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

RegisterNetEvent("qb-pboat:vehiclespawn")
AddEventHandler("qb-pboat:vehiclespawn", function(data, cb)
  local model = data

  RequestModel(model)
  while not HasModelLoaded(model) do
      Citizen.Wait(0)
  end
  SetModelAsNoLongerNeeded(model)

  local veh = CreateVehicle(model, vector4(-1268.653, -1847.783, 0.8427011, 133.82366), true, false)
  Citizen.Wait(100)
  SetEntityAsMissionEntity(veh, true, true)
  SetModelAsNoLongerNeeded(model)
  SetVehicleOnGroundProperly(veh)
  SetVehicleNumberPlateText(veh, "MW"..tostring(math.random(1000, 9999)))
  local plate = GetVehicleNumberPlateText(veh)
  TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh), veh)
  exports['cdn-fuel']:SetFuel(veh, 100)
  local plateText = GetVehicleNumberPlateText(veh)
  TriggerServerEvent("qb-pboat:giverentalpaperServer",model ,plateText)

  local timeout = 10
  while not NetworkDoesEntityExistWithNetworkId(veh) and timeout > 0 do
      timeout = timeout - 1
      Wait(1000)
  end
end)

RegisterNetEvent("qb-pboat:vehiclespawn2")
AddEventHandler("qb-pboat:vehiclespawn2", function(data, cb)
  local model = data

  RequestModel(model)
  while not HasModelLoaded(model) do
      Citizen.Wait(0)
  end
  SetModelAsNoLongerNeeded(model)

  local veh = CreateVehicle(model, vector4(-1268.653, -1847.783, 0.8427011, 133.82366), true, false)
  Citizen.Wait(100)
  SetEntityAsMissionEntity(veh, true, true)
  SetModelAsNoLongerNeeded(model)
  SetVehicleOnGroundProperly(veh)
  SetVehicleNumberPlateText(veh, "MW"..tostring(math.random(1000, 9999)))
  local plate = GetVehicleNumberPlateText(veh)
  TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh), veh)
  exports['cdn-fuel']:SetFuel(veh, 100)
  local plateText = GetVehicleNumberPlateText(veh)
  TriggerServerEvent("qb-pboat:giverentalpaperServer",model ,plateText)

  local timeout = 10
  while not NetworkDoesEntityExistWithNetworkId(veh) and timeout > 0 do
      timeout = timeout - 1
      Wait(1000)
  end
end)

RegisterNetEvent("qb-pboat:vehiclespawn3")
AddEventHandler("qb-pboat:vehiclespawn3", function(data, cb)
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
  TriggerServerEvent("qb-pboat:giverentalpaperServer",model ,plateText)

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