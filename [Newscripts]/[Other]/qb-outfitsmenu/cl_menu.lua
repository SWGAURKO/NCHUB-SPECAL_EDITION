exports("openMenu",function(items)
    local newitems = {}
    for index = 1, #items do
        if not ((items[index].func ~= nil) and (not items[index].func())) then
            table.insert(newitems,items[index])
        end
    end

    if(#newitems <= 0) then return end

    SetNuiFocus(true, true)
    SendNUIMessage({
        action = "createMenu",
        payload={
            items = newitems
        }
    })
end)

RegisterNUICallback('closeMenu', function(data, cb)
    if(data.eventType == "client") then
        TriggerEvent(data.event,data.args)
    else
        TriggerServerEvent(data.event,data.args)
    end

    if(data.close == true) then
        SetNuiFocus(false, false)
    end
end)

RegisterNUICallback('closeNui', function(data, cb)
    SetNuiFocus(false, false)
end)

exports("hideMenu", function()
    SendNUIMessage({
        action="hideMenu"
    })
end)