function openMenu(machine)
    lib.callback.await("nc_claw:doesMachineNeedReset", false, machine.uuid)

    if machine:isBusy() then
        bridge.notify(locale('this_machine_is_busy'), 'error')
        return
    end

    machine:setBusy(true)

    options = {
        {
            title = locale('play'),
            description = locale('play_description'),
            icon = "fa-solid fa-play",
            onSelect = function(args)
                machine:play()
            end
        },
    }

    -- if config.machinesCanBeHacked and machine.owner ~= bridge.getIdentifier() and lib.callback.await("nc_claw:hasItem", false, config.itemNeededForHack, 1) then
    if config.machinesCanBeHacked and machine.owner ~= bridge.getIdentifier() then
        if config.itemNeededForHack and lib.callback.await("nc_claw:hasItem", false, config.itemNeededForHack, 1) then
            options[#options + 1] = {
                title = locale('hack'),
                description = locale('hack_description'),
                icon = "fa-solid fa-robot",
                onSelect = function(args)
                    machine:hack()
                end
            }
        elseif not config.itemNeededForHack then
            options[#options + 1] = {
                title = locale('hack'),
                description = locale('hack_description'),
                icon = "fa-solid fa-robot",
                onSelect = function(args)
                    machine:hack()
                end
            }
        end
    end

    if machine.owner == bridge.getIdentifier() then
        options[#options + 1] = {
            title = locale('set_price'),
            description = locale('set_price_of_the_machine', machine.price),
            icon = "fa-solid fa-money-bill",
            onSelect = function(args)
                machine:newPrice()
            end
        }

        options[#options+1] = {
            title = locale('collect_money'),
            description = locale('collect_money_description', machine.collected),
            icon = "fa-solid fa-sack-dollar",
            onSelect = function(args)
                machine:collectMoney()
            end
        }

        options[#options+1] = {
            title = locale('refill_toys'),
            description = locale('refill_toys_description', machine:getCostText()),
            icon = "fa-solid fa-gamepad",
            onSelect = function(args)
                machine:refillToys()
            end
        }

        if utils:tableLength(machine.toys) > 0 then
            options[#options+1] = {
                title = locale('pullout_toy'),
                description = locale('pullout_toy_description'),
                icon = "fa-solid fa-hand",
                onSelect = function(args)
                    machine:pulloutToys()
                end
            }
        end

        if utils:tableLength(machine.toys) < 1 then
            options[#options+1] = {
                title = locale('pick_up_machine'),
                description = locale('pick_up_machine_description'),
                icon = "fa-solid fa-hand",
                onSelect = function(args)
                    machine:pickup()
                end
            }
        end
    end

    lib.registerContext({
        id = "machine_menu",
        title = locale('claw_machine'),
        options = options,
        onExit = function()
            machine:setBusy(false)
        end
    })

    lib.showContext("machine_menu")
end
