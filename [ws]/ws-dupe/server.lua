RegisterServerEvent('dx:duopechecker')
AddEventHandler('dx:duopechecker', function()
  local player = source
  local license = tostring(GetPlayerIdentifier(player, 2))
  local count = 0
  for _, p in ipairs(GetPlayers()) do
    if p ~= player and tostring(GetPlayerIdentifier(p, 2)) == license then
      count = count + 1
    end
  end
  if count >= 2 then
    DropPlayer(player, "fuck you dog water.")
  end
end)