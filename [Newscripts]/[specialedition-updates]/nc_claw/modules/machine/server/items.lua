-- callbacks
lib.callback.register('nc_claw:giveBackMachine', function(source, uuid, durability)
    bridge.addItem(source, config.clawMachineItemName, 1, {
        uuid = uuid,
        durability = durability or nil,
    })

    return true
end)
