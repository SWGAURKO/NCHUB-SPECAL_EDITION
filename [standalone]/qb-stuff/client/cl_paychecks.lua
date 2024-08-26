QBCore = exports['qb-core']:GetCoreObject()

local wait = 60000*10

Citizen.CreateThread(function()
    while true do
        Wait(wait)
        TriggerServerEvent('crfw-paychecks:Register')
    end
end)

RegisterNetEvent('crfw-paychecks:targetcollect')
AddEventHandler('crfw-paychecks:targetcollect', function()
    TriggerServerEvent('crfw-paychecks:Collect')
end)

CreateThread(function()
    exports['qb-target']:AddBoxZone('paychecks', vector3(269.29034, 217.27033, 106.28219), 1.4, 2.2, {
        name = 'paychecks',
        heading = 340,
        debugPoly = false,
    }, {
        options = {
            {
                type = "client",
                event = "crfw-paychecks:targetcollect",
                icon = "fas fa-money-check-alt",
                label = "Collect Paycheck",
            },
        },           
        distance = 4.0
    })
end)
