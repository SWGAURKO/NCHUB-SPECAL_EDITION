
local isUiOpen = false 
local userTurnedOff = false

AddEventHandler('onClientMapStart', function ()
  Citizen.CreateThread(function ()
    isUiOpen = true
    TriggerEvent('DisplayCenter', true) 
  end)
end)

RegisterNetEvent('DisplayWM', function (status)
  if status then 
    SendNUIMessage({displayWindow = 'true'})
    GetPlayerServerId(PlayerId())
    id = GetPlayerServerId(PlayerId())
    isUiOpen = true
    userTurnedOff = false
  else
    SendNUIMessage({displayWindow = 'false'})
    isUiOpen = false
    userTurnedOff = true
  end
end)
