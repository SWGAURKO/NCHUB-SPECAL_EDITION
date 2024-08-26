print("wsemotes by TayMcKenzieNZ, Mathhu_Imn & MadsL loaded sucessfully.")

SetTimeout( 1000, function ()
    if GetResourceState('dpemotes') == 'started' then
        for i = 1, 10 do
            print("wsemotes: Warning! dpemotes is on the server, this WILL cause issues.")
        end
    end
end)
