utils = {}


function utils:tableLength(T)
    local count = 0
    for _ in pairs(T) do count = count + 1 end
    return count
end

function utils:chance()
    math.randomseed(tonumber(tostring(math.random(100000000, 900000000)):reverse():sub(1, 9)))
    return math.random()
end

function utils:randomKey(table)
    if table == nil then
        return nil
    end

    return table[math.random(1, #table)]
end
