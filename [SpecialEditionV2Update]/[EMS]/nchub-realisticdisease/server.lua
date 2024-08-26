if GetResourceState('es_extended') ~= "missing" then
    Config.Framework = 'ESX'
    ESX = exports['es_extended']:getSharedObject()
    ESX.RegisterUsableItem(Config.ItemSelfTreatment, function(source)
        local xPlayer = ESX.GetPlayerFromId(source)
        if xPlayer.getInventoryItem(Config.ItemSelfTreatment).count >= 1 then
            xPlayer.removeInventoryItem(Config.ItemSelfTreatment, 1)
            TriggerClientEvent("nchub-realisticdisease:stopBlooding", source)
        end
    end)
else
    QBCore = exports['qb-core']:GetCoreObject()
    Config.Framework = 'QBCore'
    QBCore.Functions.CreateUseableItem(Config.ItemSelfTreatment, function(source)
        local xPlayer = QBCore.Functions.GetPlayer(source)
        if xPlayer.Functions.GetItemByName(Config.ItemSelfTreatment) ~= nil and xPlayer.Functions.GetItemByName(Config.ItemSelfTreatment).amount >= 1 then
            xPlayer.Functions.RemoveItem(Config.ItemSelfTreatment, 1)
            TriggerClientEvent("nchub-realisticdisease:stopBlooding", source)
        end
    end)
end


Players = {}
 
RegisterNetEvent("nchub-realisticdisease:hitPlayer")
AddEventHandler("nchub-realisticdisease:hitPlayer", function(t_pid, bone, damage)
    local source = source
    local damage = damage
    local takeDmg = false
 
    if bone == -1 then return end

    if damage.bone then 
        for k,v in pairs(Config.PlayerBones) do
            if v == damage.bone then takeDmg = true break end
        end
    end
   
    if takeDmg == false then return end

    local count = 2

    if damage.bone == 31086 then
        count = 6
    elseif damage.bone == 24818 then
        count = 3
    end
 
    if not Players[t_pid] then 
        Players[t_pid] = {}
        Players[t_pid].injures = {}
        Players[t_pid].info = {}
        Players[t_pid].hitdate = os.time()
        Players[t_pid].bleeding = false
    end 

    if damage.name == "weapon_fall" and Players[t_pid].bleeding == true then 
        return
    end
 
    if not Players[t_pid].injures[bone] then 
        Players[t_pid].injures[bone] = 0
    end

    if not Players[t_pid].info[damage.name] then 
        Players[t_pid].info[damage.name] = {
            name = damage.name,
            label = damage.label,
            bone = bone,
            count = 1
        }
        Players[t_pid].bleeding = true
    else 
        Players[t_pid].info[damage.name].count = Players[t_pid].info[damage.name].count + count
    end

    Players[t_pid].hitdate = os.time()

    -- damage.bone = bone

    -- table.insert(Players[t_pid].info[bone], damage)

    Players[t_pid].injures[bone] = Players[t_pid].injures[bone] + count

    table.shift(Players[t_pid].injures)
 
    TriggerClientEvent("nchub-realisticdisease:hitRecieve", t_pid, bone, Players[t_pid])
 
    if Config.DebugMode == true then 
        TriggerClientEvent("nchub-realisticdisease:hitRecieve", source, bone, Players[t_pid])
    end
end)
 
AddEventHandler('playerDropped', function(reason)
    local source = source
    Players[source] = nil
    -- table.shift(Players)
end)

RegisterNetEvent("nchub-realisticdisease:removeAllInjures")
AddEventHandler("nchub-realisticdisease:removeAllInjures", function()
    local source = source
    Players[source] = nil
    -- table.shift(Players)
end)

RegisterNetEvent("nchub-realisticdisease:qbrev")
AddEventHandler("nchub-realisticdisease:qbrev", function(pid)
    TriggerClientEvent('hospital:client:Revive', pid)
end)

RegisterNetEvent("nchub-realisticdisease:brutalrev")
AddEventHandler("nchub-realisticdisease:brutalrev", function(pid)
    TriggerClientEvent('brutal_ambulancejob:revive', pid)
end)


RegisterNetEvent('nchub-realisticdisease:stopBlooding', function(pid)
    Players[pid].bleeding = false
    TriggerClientEvent('nchub-realisticdisease:stopBlooding', pid)
end)

RegisterNetEvent("nchub-realisticdisease:checkTreatment")
AddEventHandler("nchub-realisticdisease:checkTreatment", function(data)
    local source = source
    if data.cacheid == nil then 
        print("nchub-realisticdisease:checkTreatment - cacheid is nil")
        return 
    end
    pid = data.cacheid
    if Config.Framework == "ESX" then
        local xPlayer = ESX.GetPlayerFromId(source)
        if xPlayer.getInventoryItem(data.item).count >= 1 then 
            if CheckTreatReqItems(data.item, data.area) then 
                Players[data.cacheid].injures[data.bone] = nil
                Players[data.cacheid].info[data.bone] = nil
                if IsInjuresEmpty(data.cacheid) then 
                    Players[data.cacheid].hitdate = nil
                    Players[data.cacheid].bleeding = false
                end
                -- table.shift(Players)
                xPlayer.removeInventoryItem(data.item, 1)
                TriggerClientEvent("nchub-realisticdisease:docStatus", source, "success")  
            else 
                TriggerClientEvent("nchub-realisticdisease:docStatus", source, "wrong") 
            end
        else
            TriggerClientEvent("nchub-realisticdisease:docStatus", source, "no_item") 
        end
        TriggerClientEvent("nchub-realisticdisease:updateInjures", source, Players[pid])    
    else
        local xPlayer = QBCore.Functions.GetPlayer(source)
        if xPlayer.Functions.GetItemByName(data.item) ~= nil and xPlayer.Functions.GetItemByName(data.item).amount >= 1 then
            if CheckTreatReqItems(data.item, data.area) then 
                Players[data.cacheid].injures[data.bone] = nil
                Players[data.cacheid].info[data.bone] = nil
                if IsInjuresEmpty(data.cacheid) then 
                    TriggerClientEvent('hospital:client:HealInjuries', tonumber(data.cacheid), 'full')
                    Players[data.cacheid].hitdate = nil
                    Players[data.cacheid].bleeding = false
                end
                -- table.shift(Players)
                xPlayer.Functions.RemoveItem(data.item, 1)
                TriggerClientEvent("nchub-realisticdisease:docStatus", source, "success")  
            else 
                TriggerClientEvent("nchub-realisticdisease:docStatus", source, "wrong") 
            end
        else
            TriggerClientEvent("nchub-realisticdisease:docStatus", source, "no_item") 
        end
        TriggerClientEvent("nchub-realisticdisease:updateInjures", source, Players[pid])   
    end
 
end)

function IsInjuresEmpty(cacheid)
    return next(Players[cacheid].injures) == nil
end


CheckTreatReqItems = function(item, area)
    x = false
    for k,v in pairs(Config.ItemsForHeal[area]) do
        if item == v then 
            x = true
        end
    end
    return x
end

RegisterNetEvent("nchub-realisticdisease:fastTreatPlayer")
AddEventHandler("nchub-realisticdisease:fastTreatPlayer", function(pid)
    Players[pid].injures = {}
    TriggerClientEvent("nchub-realisticdisease:updateInjures", pid, Players[pid])
end)
 
 
if Config.DebugMode == true then 
    RegisterCommand("needitems", function(src) 
        if Config.Framework == "ESX" then 
            local xPlayer = ESX.GetPlayerFromId(src)
            for k,v in pairs(Config.Treatment["Critical"]) do
                if xPlayer.getInventoryItem(v).count < 1 then 
                xPlayer.addInventoryItem(v, 1)
                end
            end
        else 
            local xPlayer = QBCore.Functions.GetPlayer(src)
            for k,v in pairs(Config.Treatment["Critical"]) do
                if xPlayer.Functions.GetItemByName(v) == nil then 
                xPlayer.Functions.AddItem(v, 1)
                end
            end
        end
    end)
end
 
function table.shift(t)
    local first = t[1]
    for i=1, #t-1 do
        t[i] = t[i+1]
    end
    t[#t] = nil
    return first
end
 
if Config.Framework == "ESX" then
    ESX.RegisterServerCallback("nchub-realisticdisease:getPlayerInfo", function(source, cb, data)
        local pid = data
        local xPlayer = ESX.GetPlayerFromId(pid)

        if not Players[pid] then 
            Players[pid] = {}
            Players[pid].injures = {}
            Players[pid].info = {}
            Players[pid].name = "Unknown"
        end 

        if Players[pid].name == "Unknown" then 
            Players[pid].name = xPlayer.getName()
            if Config.GetNameFromSQL == true then 
                result = {}
                result = MySQL.Sync.fetchAll("SELECT * FROM `users` WHERE identifier = '"..xPlayer.identifier.."' ")
                Players[pid].name = result[1].firstname.." "..result[1].lastname
            end
        end

        return cb({
            pid = pid,
            name = Players[pid].name,
            injures = Players[pid].injures,
            info = Players[pid].info,
            identifier = xPlayer.identifier,
            hitdate = Players[pid].hitdate
        })
    end)
else
    QBCore.Functions.CreateCallback('nchub-realisticdisease:getplayerinfo', function(source, cb, data)
        local pid = data
        local xPlayer = QBCore.Functions.GetPlayer(pid)
       
        if not Players[pid] then 
            Players[pid] = {}
            Players[pid].injures = {}
            Players[pid].info = {}
            Players[pid].name = "Unknown"
        end 

        if Players[pid].name == "Unknown" then 
            Players[pid].name = xPlayer.PlayerData.charinfo.firstname.." "..xPlayer.PlayerData.charinfo.lastname
        end

     
        return cb({
            pid = pid,
            name = Players[pid].name,
            injures = Players[pid].injures,
            info = Players[pid].info,
            identifier = xPlayer.PlayerData.citizenid,
            hitdate = Players[pid].hitdate
        })

        
    end)
end
 
if Config.Framework == "ESX" then
    ESX.RegisterServerCallback("nchub-realisticdisease:checkItems", function(source, cb, data)
        local xPlayer = ESX.GetPlayerFromId(source)
        local itemlist = {}
        for k,v in pairs(Config.items) do
            local item = xPlayer.getInventoryItem(k)
            if item then
                if item.count >= 1 then 
                    itemlist[item.name] = item
                end
            end
        end
        return cb(itemlist)
    end)
else 
    QBCore.Functions.CreateCallback('nchub-realisticdisease:checkItems', function(source, cb, data)
        local xPlayer = QBCore.Functions.GetPlayer(source)
        local itemlist = {}
        for k,v in pairs(Config.items) do
            local item = xPlayer.Functions.GetItemByName(k)
            if item ~= nil then 
                if item.amount >= 1 then 
                     item.count = item.amount
                     itemlist[item.name] = item
                end
            end
        end
        return cb(itemlist)
    end)
end