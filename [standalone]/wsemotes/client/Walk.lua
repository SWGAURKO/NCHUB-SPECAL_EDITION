local canChange = true
local unable_message = "You are unable to change your walking style right now."

function WalkMenuStart(name)
    if not canChange then
        EmoteChatMessage(unable_message)
        return
    end
    if Config.PersistentWalk then SetResourceKvp("walkstyle", name) end
    RequestWalking(name)
    SetPedMovementClipset(PlayerPedId(), name, 0.2)
    RemoveAnimSet(name)
end

function ResetWalk()
    if not canChange then
        EmoteChatMessage(unable_message)
        return
    end
    ResetPedMovementClipset(PlayerPedId())
end

function RequestWalking(set)
    local timeout = GetGameTimer() + 5000
    while not HasAnimSetLoaded(set) and GetGameTimer() < timeout do
        RequestAnimSet(set)
        Wait(5)
    end
end

function WalksOnCommand(source, args, raw)
    local WalksCommand = ""
    for a in pairsByKeys(RP.Walks) do
        WalksCommand = WalksCommand .. "" .. string.lower(a) .. ", "
    end
    EmoteChatMessage(WalksCommand)
    EmoteChatMessage("To reset do /walk reset")
end

function WalkCommandStart(source, args, raw)

    if not canChange then
        EmoteChatMessage(unable_message)
        return
    end
    local name = firstToUpper(string.lower(args[1]))

    if name == "Reset" then
        ResetPedMovementClipset(PlayerPedId())
        return
    end

    if tableHasKey(RP.Walks, name) then
        local name2 = table.unpack(RP.Walks[name])
        WalkMenuStart(name2)
    elseif name == "Injured" then
        WalkMenuStart("move_m@injured")
    else
        EmoteChatMessage("'" .. name .. "' is not a valid walk")
    end
end

function tableHasKey(table, key)
    return table[key] ~= nil
end

if Config.WalkingStylesEnabled and Config.PersistentWalk then
    AddEventHandler('playerSpawned', function()
        local kvp = GetResourceKvpString("walkstyle")

        if kvp ~= nil then
            WalkMenuStart(kvp)
        end
    end)
end

if Config.WalkingStylesEnabled then
    RegisterCommand('walks', function() WalksOnCommand() end, false)
    RegisterCommand('walk', function(source, args, raw) WalkCommandStart(source, args, raw) end, false)
    TriggerEvent('chat:addSuggestion', '/walk', 'Set your walkingstyle.', { { name = "style", help = "/walks for a list of valid styles" } })
    TriggerEvent('chat:addSuggestion', '/walks', 'List available walking styles.')
end

function toggleWalkstyle(bool, message)
    canChange = bool
    if message then
        unable_message = message
    end
end

exports('toggleWalkstyle', toggleWalkstyle)

local WalkstickUsed = false
local WalkstickObject = nil

RegisterNetEvent('dp:Client:UseWalkingStick')
AddEventHandler('dp:Client:UseWalkingStick', function()
  if not WalkstickUsed then
    local ped = PlayerPedId()
    RequestAnimSet('move_heist_lester')
    while not HasAnimSetLoaded('move_heist_lester') do
      Citizen.Wait(1)
    end
    SetPedMovementClipset(ped, 'move_heist_lester', 1.0) 
    WalkstickObject = CreateObject(GetHashKey("prop_cs_walking_stick"), 0, 0, 0, true, true, true)
    AttachEntityToEntity(WalkstickObject, ped, GetPedBoneIndex(ped, 57005), 0.16, 0.06, 0.0, 335.0, 300.0, 120.0, true, true, false, true, 5, true)
  else
    local ped = PlayerPedId()
    if PreviousWalkset ~= nil then
      RequestAnimSet(PreviousWalkset)
      while not HasAnimSetLoaded(PreviousWalkset) do
        Citizen.Wait(1)
      end
      SetPedMovementClipset(ped, PreviousWalkset, 1.0)
    end
    DetachEntity(WalkstickObject, 0, 0)
    DeleteEntity(WalkstickObject)
  end
  WalkstickUsed = not WalkstickUsed
end)