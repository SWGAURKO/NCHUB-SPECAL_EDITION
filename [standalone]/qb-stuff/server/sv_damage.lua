RegisterServerEvent('NCHub-funTime', function(dmg, acc)
    local src = source
    local reason = 'Useing Damage Boost | Damage: ' .. dmg .. ' | Accuracy Get Fucked ' .. acc
    DropPlayer(src, reason)
end)    
