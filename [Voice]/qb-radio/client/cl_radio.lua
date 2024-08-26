local QBCore = exports['qb-core']:GetCoreObject()

local GuiOpened = false
local pRadioChannel = false

function pChannelActive()
  return pRadioChannel
end

exports('pChannel', function()
  return pChannelActive()
end)

RegisterNetEvent('radioGui')
AddEventHandler('radioGui', function()
  openGui()
end)

RegisterNetEvent('ChannelSet')
AddEventHandler('ChannelSet', function(chan)
  pRadioChannel = true
  SendNUIMessage({set = true, setChannel = chan})
end)

local function formattedChannelNumber(number)
  local power = 10 ^ 1
  return math.floor(number * power) / power
end

RegisterNetEvent('radio:resetNuiCommand')
AddEventHandler('radio:resetNuiCommand', function()
    SendNUIMessage({reset = true})
end)

function openGui()
  local radio = hasRadio()
  local job = QBCore.Functions.GetPlayerData().job.name
  local Emergency = false
  if job == "police" then
    Emergency = true
  elseif job == "ambulance" then
    Emergency = true
  elseif job == "doctor" then
    Emergency = true
  end

  if not GuiOpened and radio then
    GuiOpened = true
    SetNuiFocus(false,false)
    SetNuiFocus(true,true)
    SendNUIMessage({open = true, jobType = Emergency})
  else
    GuiOpened = false
    SetNuiFocus(false,false)
    SendNUIMessage({open = false, jobType = Emergency})
  end

  TriggerEvent("animation:radio",GuiOpened)
end

local function handleConnectionEvent(pChannel)
  local newChannel = formattedChannelNumber(pChannel)

  if newChannel < 1.0 then
    pRadioChannel = false
    exports['qb-voice']:removePlayerFromRadio()
    exports["qb-voice"]:setVoiceProperty("radioEnabled", false)
  else
    pRadioChannel = true
    exports['qb-voice']:addPlayerToRadio(newChannel)
    exports["qb-voice"]:setVoiceProperty("radioEnabled", true)
  end
end
local radioVolume = 100.0

function hasRadio()
  local retval = nil

  QBCore.Functions.TriggerCallback('QBCore:HasItem', function(result)
    retval = result
  end, 'radio')

  while retval == nil do
    Wait(1)
  end

  return retval
end
RegisterNUICallback('click', function(data, cb)
  PlaySound(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
end)

RegisterNUICallback('volumeUp', function(data, cb)
  radioVolume = radioVolume + 10
  if radioVolume >= 100.0 then
    radioVolume = 100.0
  end
  TriggerEvent('qb-voice:updateRoutineAudio', radioVolume)
  QBCore.Functions.Notify('Radio Volume is now: ' ..radioVolume)
end)

RegisterNUICallback('volumeDown', function(data, cb)
  radioVolume = radioVolume - 10
  if radioVolume < 10 then
    radioVolume = 10
  end
  TriggerEvent('qb-voice:updateRoutineAudio', radioVolume)
  QBCore.Functions.Notify('Radio Volume is now: ' ..radioVolume)
end)

RegisterNUICallback('cleanClose', function(data, cb)
  TriggerEvent("InteractSound_CL:PlayOnOne","radioclick",0.6)
  GuiOpened = false
  SetNuiFocus(false,false)
  SendNUIMessage({open = false})
  TriggerEvent("animation:radio",GuiOpened)
end)

RegisterNUICallback('poweredOn', function(data, cb)
  TriggerEvent("qb-hud:setOnRadio",true)
  cb("ok")
end)

RegisterNUICallback('poweredOff', function(data, cb)
  TriggerEvent("qb-hud:setOnRadio",false)
  pRadioChannel = false
  exports['qb-voice']:removePlayerFromRadio()
  exports["qb-voice"]:setVoiceProperty("radioEnabled", false)
end)

function closeGui()
  TriggerEvent("InteractSound_CL:PlayOnOne","radioclick",0.6)
  GuiOpened = false
  SetCustomNuiFocus(false,false)
  SendNUIMessage({open = false})
  TriggerEvent("animation:radio",GuiOpened)
end

RegisterNUICallback('close', function(data, cb)
  TriggerEvent("qb-hud:setOnRadio",true)
  handleConnectionEvent(data.channel)
  closeGui()
  cb('ok')
end)

RegisterNetEvent('animation:radio')
AddEventHandler('animation:radio', function(enable)
  TriggerEvent("destroyPropRadio")
  local lPed = PlayerPedId()
  inPhone = enable

  RequestAnimDict("cellphone@")
  while not HasAnimDictLoaded("cellphone@") do
    Citizen.Wait(0)
  end
  Citizen.Wait(300)
  if inPhone then
    TriggerEvent("attachItemRadio","radio01")
    Citizen.Wait(150)
    while inPhone do

      local dead = QBCore.Functions.GetPlayerData().metadata["isdead"]
      if dead then
        closeGui()
        inPhone = false
      end
      if not IsEntityPlayingAnim(lPed, "cellphone@", "cellphone_text_read_base", 3) and not IsEntityPlayingAnim(lPed, "cellphone@", "cellphone_swipe_screen", 3) then
        TaskPlayAnim(lPed, "cellphone@", "cellphone_text_read_base", 2.0, 3.0, -1, 49, 0, 0, 0, 0)
      end    
      Citizen.Wait(1)
    end
  else
    ClearPedTasks(lPed)
    TriggerEvent("destroyPropRadio")
  end
  TriggerEvent("destroyPropRadio")
end)

Citizen.CreateThread(function()

  while true do
    if GuiOpened then
      Citizen.Wait(1)
      DisableControlAction(0, 1, GuiOpened) -- LookLeftRight
      DisableControlAction(0, 2, GuiOpened) -- LookUpDown
      DisableControlAction(0, 14, GuiOpened) -- INPUT_WEAPON_WHEEL_NEXT
      DisableControlAction(0, 15, GuiOpened) -- INPUT_WEAPON_WHEEL_PREV
      DisableControlAction(0, 16, GuiOpened) -- INPUT_SELECT_NEXT_WEAPON
      DisableControlAction(0, 17, GuiOpened) -- INPUT_SELECT_PREV_WEAPON
      DisableControlAction(0, 99, GuiOpened) -- INPUT_VEH_SELECT_NEXT_WEAPON
      DisableControlAction(0, 100, GuiOpened) -- INPUT_VEH_SELECT_PREV_WEAPON
      DisableControlAction(0, 115, GuiOpened) -- INPUT_VEH_FLY_SELECT_NEXT_WEAPON
      DisableControlAction(0, 116, GuiOpened) -- INPUT_VEH_FLY_SELECT_PREV_WEAPON
      DisableControlAction(0, 142, GuiOpened) -- MeleeAttackAlternate
      DisableControlAction(0, 106, GuiOpened) -- VehicleMouseControlOverride
    else
      Citizen.Wait(100)
    end    
  end
end)

RegisterNetEvent('remove:radio')
AddEventHandler('remove:radio', function()
   exports['qb-voice']:setRadioChannel(0)
   exports["qb-voice"]:setVoiceProperty("radioEnabled", false)
   pRadioChannel = false
end)

function SetCustomNuiFocus(hasKeyboard, hasMouse)
  HasNuiFocus = hasKeyboard or hasMouse

  SetNuiFocus(hasKeyboard, hasMouse)
  SetNuiFocusKeepInput(HasNuiFocus)

  TriggerEvent("qb-voice:focus:set", HasNuiFocus, hasKeyboard, hasMouse)
end

RegisterNetEvent("qb-radio:radialmenu", function(newChannel)
  -- TriggerServerEvent("TokoVoip:removePlayerFromAllRadio",pId)
  -- TriggerServerEvent("TokoVoip:addPlayerToRadio", newChannel, pId)
  exports['qb-voice']:removePlayerFromRadio()
  Wait(500)
  exports['qb-voice']:addPlayerToRadio(newChannel)
  exports["qb-voice"]:setVoiceProperty("radioEnabled", true)
  print(newChannel)
end)