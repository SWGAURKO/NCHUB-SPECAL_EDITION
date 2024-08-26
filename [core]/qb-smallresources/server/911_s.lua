local policeTimeouts = {}
local towtruckTruck = {};
local emsTimeouts = {}

local policeCalls = {}
local emsCalls = {}
local towtruckCalls = {};
QBCore = exports['qb-core']:GetCoreObject()



QBCore.Commands.Add('pchat', 'Officers Chat', {}, false, function(source, args)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local hasphone = Player.Functions.GetItemByName('chattablet') ~= nil and true or false
    
    if not Player.PlayerData.metadata["ishandcuffed"] and not Player.PlayerData.metadata["isdead"] and not Player.PlayerData.metadata["inlaststand"] then
        if hasphone == true then
            if Player and (Player.PlayerData.job.name == 'police' and Player.PlayerData.job.onduty) then
                TriggerClientEvent('police:chatMessage', -1, {(Player.PlayerData.charinfo.firstname .. ' ' .. Player.PlayerData.charinfo.lastname .. ' (' .. Player.PlayerData.metadata.callsign .. ')'), table.concat(args, " ")})
                TriggerClientEvent('qb-911:client:justcalled', src)
            else
                TriggerClientEvent('chat:addMessage', src, {
                    template = '<div class="chat-message server">SYSTEM: {0}</div>',
                    args = { 'This command is for emergency services!' }
                })
            end
        else
            TriggerClientEvent('QBCore:Notify', src, "You dont have a MDT Tablet!", 'error')
        end
    else
        TriggerClientEvent('QBCore:Notify', src, "You cant do it while you're dead/cuffed!", 'error')
    end
end)

QBCore.Commands.Add('911', 'Send emergancy signal to ambulance/police.', {{name = 'firstname', help = 'First Name'}, {name = 'lastname', help = 'Last Name'}, {name = 'content', help = 'Message Content'}}, true, function(source, args)
    local src = source
    local xPlayer = QBCore.Functions.GetPlayer(src)
    if not xPlayer.PlayerData.metadata["ishandcuffed"] then
        if policeTimeouts[src] == nil or policeTimeouts[src] == true then
            CreateThread(function()
                policeTimeouts[src] = false
                Wait(60000)
                policeTimeouts[src] = true
            end)

            local item1 = xPlayer.Functions.GetItemByName('phone')
            local item2 = xPlayer.Functions.GetItemByName('classic_phone')
            local item3 = xPlayer.Functions.GetItemByName('black_phone')
            local item4 = xPlayer.Functions.GetItemByName('blue_phone')
            local item5 = xPlayer.Functions.GetItemByName('gold_phone')
            local item6 = xPlayer.Functions.GetItemByName('green_phone')
            local item7 = xPlayer.Functions.GetItemByName('greenlight_phone')
            local item8 = xPlayer.Functions.GetItemByName('red_phone')
            local item9 = xPlayer.Functions.GetItemByName('pink_phone')
            local item10 = xPlayer.Functions.GetItemByName('white_phone')

            if (item1 ~= nil and item1.amount > 0) or (item2 ~= nil and item2.amount > 0) or (item3 ~= nil and item3.amount > 0) or (item4 ~= nil and item4.amount > 0) or (item5 ~= nil and item5.amount > 0) or (item6 ~= nil and item6.amount > 0) or (item7 ~= nil and item7.amount > 0) or (item8 ~= nil and item8.amount > 0) or (item9 ~= nil and item9.amount > 0) or (item10 ~= nil and item10.amount > 0) then
                local id = #policeCalls + 1
                policeTimeouts[src] = GetGameTimer()

                local coords = GetEntityCoords(GetPlayerPed(src))
                local name = args[1] .. ' ' .. args[2]
                
                table.remove(args, 1)
                table.remove(args, 1)
                local message = table.concat(args, ' ')

                policeCalls[id] = { name = name, message = message, source = src }

                TriggerClientEvent('qb-911:client:createBlip', -1, 'police' or "ems", coords, name, message, id, src)
                TriggerClientEvent('qb-911:client:justcalled', src)

               -- TriggerEvent('qb-logs:server:createLog', 'emergency', 'Command "911"', "Used the command **911**\n**Name:** " .. name .."\n**Message:** " .. message, src)
            else
                TriggerClientEvent('QBCore:Notify', src, "You don't have a phone.", "error")
            end
        else
            TriggerClientEvent('QBCore:Notify', src, "Please wait until your next message.", "error")
        end
    else
        TriggerClientEvent('QBCore:Notify', src, "You can't do that while cuffed!", "error")
    end
end)

QBCore.Commands.Add('911r', 'Reply to 911 call. (Police Only)', {{name = 'id', help = 'Call #ID'}, {name = 'content', help = 'Message Content'}}, true, function(source, args)
    local src = source
    local xPlayer = QBCore.Functions.GetPlayer(src)

    if xPlayer.PlayerData.job.name == 'police' then
        local item1 = xPlayer.Functions.GetItemByName('phone')
        local item2 = xPlayer.Functions.GetItemByName('classic_phone')
        local item3 = xPlayer.Functions.GetItemByName('black_phone')
        local item4 = xPlayer.Functions.GetItemByName('blue_phone')
        local item5 = xPlayer.Functions.GetItemByName('gold_phone')
        local item6 = xPlayer.Functions.GetItemByName('green_phone')
        local item7 = xPlayer.Functions.GetItemByName('greenlight_phone')
        local item8 = xPlayer.Functions.GetItemByName('red_phone')
        local item9 = xPlayer.Functions.GetItemByName('pink_phone')
        local item10 = xPlayer.Functions.GetItemByName('white_phone')
        if (item1 ~= nil and item1.amount > 0) or (item2 ~= nil and item2.amount > 0) or (item3 ~= nil and item3.amount > 0) or (item4 ~= nil and item4.amount > 0) or (item5 ~= nil and item5.amount > 0) or (item6 ~= nil and item6.amount > 0) or (item7 ~= nil and item7.amount > 0) or (item8 ~= nil and item8.amount > 0) or (item9 ~= nil and item9.amount > 0) or (item10 ~= nil and item10.amount > 0) then
            local id = tonumber(args[1])
            table.remove(args, 1)
            local message = table.concat(args, ' ')
            if policeCalls[id] then
                if not policeCalls[id].reply then
                    policeCalls[id].reply = true
                    TriggerClientEvent('qb-911:client:justcalled', src)
                    TriggerClientEvent('qb-911:client:reply', -1, 'police', id, message,xPlayer.PlayerData.charinfo.firstname:sub(1,1) .. '. ' .. xPlayer.PlayerData.charinfo.lastname, policeCalls[id].source)
                else
                    TriggerClientEvent('QBCore:Notify', src, "Message already replied.", "error")
                end
            else
                TriggerClientEvent('QBCore:Notify', src, "Invaild call #ID.", "error")
            end
        else
            TriggerClientEvent('QBCore:Notify', src, "You dont have phone.", "error")
        end
    end
end)


