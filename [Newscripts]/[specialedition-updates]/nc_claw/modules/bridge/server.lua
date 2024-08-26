lib.callback.register("nc_claw:hasItem", function(source, item, amount)
    return bridge.hasItem(source, item, amount)
end)