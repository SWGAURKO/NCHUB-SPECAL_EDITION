RegisterNetEvent('nc-chopshop:StartMenu', function()
    exports['qb-menu']:openMenu({
        {
            header = 'Chop Parts',
            -- icon = 'fas fa-code',
            isMenuHeader = true, -- Set to true to make a nonclickable title
        },
        {
            header = 'Door',
            icon = 'fas fa-code-merge',
            txt = 'Print a message!',
            params = {
                event = "nc-chopshop:chopdoor",
                args = {
                    number = 1,
                    id = 2
                }
            }
        },  
        {
            header = 'Wheel',
            icon = 'fas fa-code-merge',
            txt = 'Print a message!',
            params = {
                event = "nc-chopshop:chopwheel",
                args = {
                    number = 1,
                    id = 2
                }
            }
        }, 
        {
            header = 'Hood',
            icon = 'fas fa-code-merge',
            params = {
                event = "nc-chopshop:chophood",
                args = {
                    number = 1,
                    id = 2
                }
            }
        }, 
        {
            header = 'Trunk',
            icon = 'fas fa-code-merge',
            params = {
                event = "nc-chopshop:choptrunk",
                args = {
                    number = 1,
                    id = 2
                }
            }
        }, 

    })
end)

RegisterNetEvent('nc-chopshop:chopdoor')
AddEventHandler('nc-chopshop:chopdoor', function()
    TriggerServerEvent("nc-chopshop:server:chopdoor")
end)

RegisterNetEvent('nc-chopshop:chopwheel')
AddEventHandler('nc-chopshop:chopwheel', function()
    TriggerServerEvent("nc-chopshop:server:chopwheel")
end)

RegisterNetEvent('nc-chopshop:chophood')
AddEventHandler('nc-chopshop:chophood', function()
    TriggerServerEvent("nc-chopshop:server:chophood")
end)

RegisterNetEvent('nc-chopshop:choptrunk')
AddEventHandler('nc-chopshop:choptrunk', function()
    TriggerServerEvent("nc-chopshop:server:choptrunk")
end)