local Cow_Fields = {
    [1] = false,
    [2] = false,
    [3] = false,
    [4] = false,
    [5] = false,
    [6] = false,
    [7] = false,
    [8] = false,
    [9] = false,
    [10] = false,
    [11] = false,
    [12] = false
}

local DeleteTable = {}
local fields = {}

local function Entitydeleter(src)
    if DeleteTable[src] then
        for _,v in pairs(DeleteTable[src]) do 
            if DoesEntityExist(v) then 
                DeleteEntity(v)
            end
        end
        DeleteTable[src] = {}
    end
end

local function IsCowFieldFree(id)
    if not Cow_Fields[id] then
        return true
    end
    return false
end

QBCore.Functions.CreateCallback('qb-farming-get-cow-fields', function(source, cb)
    cb(Cow_Fields)
end)

QBCore.Functions.CreateCallback('qb-farming-start-cowfield', function(source, cb, FieldID)
    local src = source
    if IsCowFieldFree(FieldID) then
        cb(true)
    else
        cb(false)
    end
end)

RegisterServerEvent('qb-farming-cow-started', function(FieldID)
    Cow_Fields[FieldID] = true
    fields[source] = FieldID
    DeleteTable[source] = {}
end)

RegisterServerEvent('qb-farming-cowjob-finished', function(FieldID)
    Cow_Fields[FieldID] = false
end)

RegisterServerEvent('qb-farming-insert-cow', function(value)
    local src = source
    for i = 1, 10, 1 do 
        Wait(0)
        if NetworkGetEntityFromNetworkId(value) ~= 0 then
            table.insert(DeleteTable[src], NetworkGetEntityFromNetworkId(value))
            break 
        end
        Wait(100)
    end
end)

AddEventHandler('playerDropped', function()
    local src = source
    Entitydeleter(src)
    if fields[src] then
        Cow_Fields[fields[src]] = false
    end
end)

RegisterNetEvent('qb-farming-receive-milk', function()
    local src = source
    if MainShared.Inventory == 'qb' then
        exports['qb-inventory']:AddItem(src, 'milkbottle', CowShared.MilkBottle)
    elseif MainShared.Inventory == 'ox' then
        local ox_inventory = exports.ox_inventory
        ox_inventory:AddItem(src, 'milkbottle', CowShared.MilkBottle)
    end
end)

RegisterNetEvent('qb-farming-delete-churn', function()
    local src = source
    if MainShared.Inventory == 'qb' then
        exports['qb-inventory']:RemoveItem(src, 'churn', 1)
    elseif MainShared.Inventory == 'ox' then
        local ox_inventory = exports.ox_inventory
        ox_inventory:RemoveItem(src, 'churn', 1)
    end
end)