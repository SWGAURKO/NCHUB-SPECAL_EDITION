-- CLOSE APP
function SetInterfaceFocus(hasKeyboard, hasMouse)
  SetNuiFocus(hasKeyboard, hasMouse)
end

exports('SetInterfaceFocus', SetInterfaceFocus)

RegisterNUICallback("qb-interface:closeApp", function(data, cb)
    SetInterfaceFocus(false, false)
    cb({data = {}, meta = {ok = true, message = 'done'}})
    Wait(800)
    TriggerEvent("attachedItems:block",false)
end)

RegisterNUICallback("qb-interface:applicationClosed", function(data, cb)
    TriggerEvent("qb-interface:application-closed", data.name, data)
    cb({data = {}, meta = {ok = true, message = 'done'}})
end)



RegisterCommand("qb-interface:debug:show", function()
    SendInterfaceMessage({ source = "qb-nui", app = "debuglogs", data = { display = true } });
end, false)

RegisterCommand("qb-interface:debug:hide", function()
    SendInterfaceMessage({ source = "qb-nui", app = "debuglogs", data = { display = false } });
end, false)

RegisterNUICallback("qb-interface:resetApp", function(data, cb)
    SetInterfaceFocus(false, false)
    cb({data = {}, meta = {ok = true, message = 'done'}})
    --sendCharacterData()
end)

RegisterNetEvent("qb-interface:server-relay")
AddEventHandler("qb-interface:server-relay", function(data)
    SendInterfaceMessage(data)
end)