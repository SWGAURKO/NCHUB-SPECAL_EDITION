Machine = {}
machines = {}

function Machine:new(data)
    data = data or {}

    assert(data.uuid ~= nil, "Machine uuid is nil")
    assert(data.netId ~= nil, "Machine netId is nil")
    assert(machines[data.uuid] == nil, "Machine already exists")

    setmetatable(data, self)

    self.__index = self

    return data
end

function Machine:setupPoint()
    local forwardVector = GetEntityForwardVector(NetToObj(self.netId))

    self.point = lib.points.new(self.coords - (forwardVector * 0.75), 2.0, {})
    self.menuShown = false
    local data = self

    function self.point:nearby()
        if config.drawPointPosition then
            DrawMarker(1, self.coords.x, self.coords.y, self.coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.6, 0.6, 0.6, 200, 20, 20, 50, false, true, 2, nil, nil, false)
        end

        if self.currentDistance < 1.1 and not self.menuShown then
            self.menuShown = true
            lib.showTextUI(locale('open_menu'))
        end

        if self.currentDistance > 1.1 and self.menuShown then
            self.menuShown = false
            lib.hideTextUI()
        end

        if self.currentDistance < 1.1 and IsControlJustReleased(0, 38) then
            if not cache.vehicle then
                openMenu(data)
            end
        end
    end
end

function Machine:removePoint()
    if self.point then
        self.point:remove()
    end
end

function Machine:zone()
    self.zone = lib.zones.box({
        coords = self.coords,
        size = vector3(5.0, 5.0, 10.0),
        rotation = self.heading,
        debug = false,
        onEnter = function()
            while not DoesEntityExist(NetToObj(self.netId)) do
                Wait(0)
            end
            while not NetworkDoesEntityExistWithNetworkId(self.claw.clawNetId) do
                Wait(0)
            end

            self:setupPoint()
        end,
        onExit = function()
            self:removePoint()
        end,
    })
end

function Machine:isBusy()
    local isBusy = lib.callback.await("nc_claw:isMachineBusy", false, self.uuid)

    return isBusy
end

function Machine:updateColected(amount)
    self.collected = amount
end

function Machine:setBusy(toggle)
    assert(type(toggle) == "boolean", "Invalid toggle type")

    local toggle = lib.callback.await("nc_claw:setMachineBusy", false, self.uuid, toggle)

    return toggle
end

function Machine:setup()
    while not NetworkDoesEntityExistWithNetworkId(self.netId) do
        Wait(0)
    end

    self:zone()
end

function Machine:newPrice()
    if lib.getOpenContextMenu ~= nil then
        lib.hideContext()
    end

    local input = lib.inputDialog(locale('set_price'), {
        { type = 'number', label = locale('how_much_you_want_to_charge_for_each_game'), default = tostring(self.price), min = 0 }
    })

    self:setBusy(false)

    if not input then return end

    if #(GetEntityCoords(cache.ped) - self.coords) > 10 then
        bridge.notify(locale('you_are_too_far_from_the_machine'), 'error')
        return
    end

    local newPrice = tonumber(input[1])

    if newPrice == nil then
        bridge.notify(locale('invalid_price') 'error')
        return
    end

    if newPrice < 0 then
        bridge.notify(locale('invalid_price') 'error')
        return
    end

    lib.callback("nc_claw:setMachinePrice", false, function(result)
        if result then
            bridge.notify(locale('price_set'), 'success')
        else
            bridge.notify(locale('failed_to_set_price'), 'error')
        end
    end, self.uuid, newPrice)
end

function Machine:getEmptySpots()
    local emptySpots = {}

    for i=1, 10, 1 do
        if self.toys[i] == nil then
            table.insert(emptySpots, {
                value = i,
                label = ("%s %s"):format(locale('spot'), i)
            })
        end
    end

    return emptySpots
end

function Machine:getAvailableToys()
    local availableToys = {}

    for item, toy in pairs(config.availableToys) do
        table.insert(availableToys, {
            value = item,
            label = toy.name
        })
    end

    return availableToys
end

function Machine:getCostText()
    if config.chargeForToyRefill > 0 and config.needsToHaveToyInInventory then
        return (locale('this_will_cost_you_item')):format(config.chargeForToyRefill)
    end

    if config.chargeForToyRefill > 0 then
        return (locale('this_will_cost_you')):format(config.chargeForToyRefill)
    end

    if config.needsToHaveToyInInventory then
        return locale('you_need_item')
    end

    return locale('refill_will_cost_nothing')
end

function Machine:refillToys()
    if lib.getOpenContextMenu ~= nil then
        lib.hideContext()
    end

    local emptySpots = self:getEmptySpots()

    if #emptySpots == 0 then
        bridge.notify(locale('machine_is_full'), 'error')
        return
    end

    local availableToys = self:getAvailableToys()
    local text = self:getCostText()

    local input = lib.inputDialog((locale('Choose spot and a toy')):format(text), {
        { type = 'select', label = locale('select_spot'), options = emptySpots},
        { type = 'select', label = locale('select_toy'), options = availableToys},
        { type = 'select', label = locale('percent_to_pickup'), options = {
            { value = 100, label = '100%' },
            { value = 90, label = '90%' },
            { value = 80, label = '80%' },
            { value = 70, label = '70%' },
            { value = 60, label = '60%' },
            { value = 50, label = '50%' },
            { value = 40, label = '40%' },
            { value = 30, label = '30%' },
            { value = 20, label = '20%' },
            { value = 10, label = '10%' },
            { value = 0, label = '0%' },
        }},
        { type = 'select', label = locale('percent_to_drop'), options = {
            { value = 100, label = '100%' },
            { value = 90, label = '90%' },
            { value = 80, label = '80%' },
            { value = 70, label = '70%' },
            { value = 60, label = '60%' },
            { value = 50, label = '50%' },
            { value = 40, label = '40%' },
            { value = 30, label = '30%' },
            { value = 20, label = '20%' },
            { value = 10, label = '10%' },
            { value = 0, label = '0%' },
        }}
    })

    self:setBusy(false)

    if #(GetEntityCoords(PlayerPedId()) - self.coords) > 10 then
        bridge.notify(locale('you_are_too_far_from_the_machine'), 'error')
        return
    end

    if not input then return end

    lib.callback("nc_claw:refillToy", false, function(result)
        if result then
            bridge.notify(locale('toy_refilled'), 'success')
        else
            bridge.notify(locale('failed_to_refill_toy'), 'error')
        end
    end, self.uuid, input[1], input[2], input[3], input[4])
end

function Machine:pulloutToys()
    if lib.getOpenContextMenu ~= nil then
        lib.hideContext()
    end

    if self.toys == nil then
        bridge.notify(locale('machine_is_empty'), 'error')
        return
    end

    if utils:tableLength(self.toys) < 1 then
        bridge.notify(locale('machine_is_empty'), 'error')
        return
    end

    local spots = {}

    for spot, toy in pairs(self.toys) do
        if toy ~= nil then
            local toyName = config.availableToys[toy.item]?.name or 'Unknown'
            table.insert(spots, {
                value = spot,
                label = ("%s %s, %s: %s"):format(locale('spot'), spot, locale('toy'), toyName)
            })
        end
    end

    local input = lib.inputDialog(locale('choose_spot'), {
        { type = 'select', label = locale('select_spot'), options = spots},
    })

    self:setBusy(false)

    if #(GetEntityCoords(PlayerPedId()) - self.coords) > 10 then
        bridge.notify(locale('you_are_too_far_from_the_machine'), 'error')
        return
    end

    if not input then return end

    lib.callback("nc_claw:pulloutToy", false, function(result)
        if result then
            bridge.notify(locale('you_pulled_out_toy'), 'success')
        else
            bridge.notify(locale('failed_to_pull_out_toy'), 'error')
        end
    end, self.uuid, input[1])
end

function Machine:collectMoney()
    if lib.getOpenContextMenu ~= nil then
        lib.hideContext()
    end

    if #(GetEntityCoords(PlayerPedId()) - self.coords) > 10 then
        bridge.notify(locale('you_are_too_far_from_the_machine'), 'error')
        self:setBusy(false)

        return
    end

    lib.callback("nc_claw:collectMoney", false, function(result)
        self:setBusy(false)
        if result then
            bridge.notify(locale('money_collected'), 'success')
        else
            bridge.notify(locale('failed_to_collect_money'), 'error')
        end
    end, self.uuid)
end

function Machine:pickup()
    if lib.getOpenContextMenu ~= nil then
        lib.hideContext()
    end

    if #(GetEntityCoords(PlayerPedId()) - self.coords) > 10 then
        bridge.notify(locale('you_are_too_far_from_the_machine'), 'error')
        self:setBusy(false)

        return
    end

    local done = bridge.progress({
        label = locale('picking_up_machine'),
        position = 'bottom',
        duration = 5000,
        canCancel = true,
        disable = {
            move = true,
            car = true,
            combat = true,
        },
        anim = {
            dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@',
            clip = 'machinic_loop_mechandplayer',
        },
    })

    if not done then
        self:setBusy(false)
        return
    end

    lib.callback("nc_claw:pickupMachine", false, function(result)
        self:setBusy(false)
        if result then
            lib.hideTextUI()
            self:removePoint()

            self.zone:remove()

            bridge.notify(locale('machine_picked_up'), 'success')
        else
            bridge.notify(locale('failed_to_pick_up_machine'), 'error')
        end
    end, self.uuid)
end

function Machine:play()
    if #(GetEntityCoords(PlayerPedId()) - self.coords) > 10 then
        bridge.notify(locale('you_are_too_far_from_the_machine'), 'error')
        self:setBusy(false)

        return
    end

    self:setBusy(false)
    CurrentGame = Game:new(self)

    if CurrentGame then
        CurrentGame:play()
    end
end

function Machine:hack()
    if GetResourceState('glow_minigames') ~= 'started' then
        self:setBusy(false)
        bridge.notify(locale('you_cannot_hack_this_machine'), 'error')

        return
    end

    if lib.getOpenContextMenu ~= nil then
        lib.hideContext()
    end

    if not config.machinesCanBeHacked then
        self:setBusy(false)
        bridge.notify(locale('you_cannot_hack_this_machine'), 'error')

        return
    end

    if lib.callback.await("nc_claw:isMachineOnCooldown", false, self.uuid) then
        self:setBusy(false)
        bridge.notify(locale('this_machine_is_on_cooldown'), 'error')

        return
    end

    lib.requestAnimDict('anim@amb@clubhouse@tutorial@bkr_tut_ig3@', 5000)

    TaskPlayAnim(cache.ped, 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', 'machinic_loop_mechandplayer', 8.0, 8.0, -1, 1, 0, false, false, false)

    exports["glow_minigames"]:StartMinigame(function(success)
        if success then
            local hacked = lib.callback.await("nc_claw:hackedReward", false, self.uuid)

            if hacked then
                bridge.notify(locale('you_hacked_this_machine'), 'success')
            else
                bridge.notify(locale('you_failed_to_hack'), 'error')
            end

            self:setBusy(false)
        else
            bridge.notify(locale('you_failed_to_hack'), 'error')
            self:setBusy(false)
        end

        ClearPedTasks(cache.ped)
    end, "spot", { gridSize = 6, timeLimit = 10000, charSet = "alphabet", required = 10 })
end

function Machine:setNewPrice(price)
    self.price = price
end

function Machine:setToys(toys)
    self.toys = toys
end

function Machine:remove()
    self:removePoint()

    self.zone:remove()

    machines[self.uuid] = nil
end

function removeMachine(data)
    machines[data.uuid]:remove()
end

function priceUpdated(uuid, price)
    if machines[uuid] ~= nil then
        machines[uuid]:setNewPrice(price)
    end
end

function refillToys(uuid, toys)
    if machines[uuid] ~= nil then
        machines[uuid]:setToys(toys)
    end
end

RegisterNetEvent("nc_claw:newMachinePlaced", function(data)
    if machines[data.uuid] ~= nil then
        return
    end

    machines[data.uuid] = Machine:new(data)
    machines[data.uuid]:setup()
end)

RegisterNetEvent("nc_claw:machineRmoved", removeMachine)
RegisterNetEvent("nc_claw:machinePriceUpdated", priceUpdated)
RegisterNetEvent("nc_claw:toyRefilled", refillToys)

RegisterNetEvent("nc_claw:updateColected", function(uuid, amount)
    if machines[uuid] ~= nil then
        machines[uuid]:updateColected(amount)
    end
end)

RegisterNetEvent("nc_claw:updateVerticalMovementNearBy", function(sender, uuid, newFirstRailCoords, newSecondRailCoords, newClawCoords)

    if cache.serverId == sender then
        return false
    end

    if machines[uuid] == nil then
        return false
    end

    local machine = machines[uuid]

    if #(machine.coords - GetEntityCoords(cache.ped)) > 50.0 then
        return false
    end

    if DoesEntityExist(NetToObj(machine.claw.firstRailNetId)) then
        SetEntityCoords(NetToObj(machine.claw.firstRailNetId), newFirstRailCoords)
    end

    if DoesEntityExist(NetToObj(machine.claw.secondRailNetId)) then
        SetEntityCoords(NetToObj(machine.claw.secondRailNetId), newSecondRailCoords)
    end

    if DoesEntityExist(NetToObj(machine.claw.clawNetId)) then
        SetEntityCoords(NetToObj(machine.claw.clawNetId), newClawCoords)
    end
end)


RegisterNetEvent("nc_claw:updateHorizontalMovementNearBy", function(sender, uuid, newFirstRailCoords, newClawCoords)
    if cache.serverId == sender then
        return false
    end

    if machines[uuid] == nil then
        return false
    end

    local machine = machines[uuid]

    if #(machine.coords - GetEntityCoords(cache.ped)) > 50.0 then
        return false
    end

    if DoesEntityExist(NetToObj(machine.claw.firstRailNetId)) then
        SetEntityCoords(NetToObj(machine.claw.firstRailNetId), newFirstRailCoords)
    end

    if DoesEntityExist(NetToObj(machine.claw.clawNetId)) then
        SetEntityCoords(NetToObj(machine.claw.clawNetId), newClawCoords)
    end
end)

RegisterNetEvent("nc_claw:removeMachine", function(uuid)
    if machines[uuid] ~= nil then
        machines[uuid].zone:remove()
        machines[uuid]:removePoint()
        machines[uuid] = nil
    end
end)
