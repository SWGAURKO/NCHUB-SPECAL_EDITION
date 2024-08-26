--[[

	Holograms / Floating text Script by Meh
	
	Just put in the coordinates you get when standing on the ground, it's above the ground then
	By default, you only see the hologram when you are within 10m of it, to change that, edit the 10.0 infront of the "then"
	The Default holograms are at the Observatory.
	
	If you want to add a line to the hologram, just make a new Draw3DText line with the same coordinates, and edit the vertical offset.
	
	Formatting:
			Draw3DText( x, y, z  vertical offset, "text", font, text size, text size)
			
			
	To add a new hologram, copy paste this example under the existing ones, and put coordinates and text into it.
	
		if GetDistanceBetweenCoords( X, Y, Z, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText( X, Y, Z,  -1.400, "TEXT", 4, 0.1, 0.1)
			Draw3DText( X, Y, Z,  -1.600, "TEXT", 4, 0.1, 0.1)
			Draw3DText( X, Y, Z,  -1.800, "TEXT", 4, 0.1, 0.1)		
		end


]]--

Citizen.CreateThread(function()
    Holograms()
end)

function Holograms()
		while true do
			Citizen.Wait(0)			
				-- Hologram No. 1
		if GetDistanceBetweenCoords( -579.0914, -1070.947, 22.329557, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText( -579.0914, -1070.947, 22.329557  -1.400, "NCHub - Special Edition #V2.0 Beta [2024]", 4, 0.1, 0.1)
			Draw3DText( -579.0914, -1070.947, 22.329557  -1.600, "Discord - discord.gg/sgx", 4, 0.1, 0.1)
			Draw3DText( -579.0914, -1070.947, 22.329557  -1.800, "Youtube - Youtube.com/@NCHub", 4, 0.1, 0.1)		
		end		

		if GetDistanceBetweenCoords( -1179.102, -887.7924, 13.887522, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText( -1179.102, -887.7924, 11.887522, "NCHub - Special Edition #V2.0 Beta [2024]", 4, 0.1, 0.1)
			Draw3DText( -1179.102, -887.7924, 13.887522  -1.600, "Discord - discord.gg/sgx", 4, 0.1, 0.1)
			Draw3DText( -1179.102, -887.7924, 13.887522  -1.800, "Youtube - Youtube.com/@NCHub", 4, 0.1, 0.1)		
		end	

		if GetDistanceBetweenCoords( -1208.177, -1132.715, 7.7468986, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then 
			Draw3DText( -1208.177, -1132.715, 6.3168986, "NCHub - Special Edition #V2.0 Beta [2024]", 4, 0.1, 0.1)
			Draw3DText( -1208.177, -1132.715, 7.7468986  -1.600, "Discord - discord.gg/sgx", 4, 0.1, 0.1)
			Draw3DText( -1208.177, -1132.715, 7.7468986  -1.800, "Youtube - Youtube.com/@NCHub", 4, 0.1, 0.1)		
		end	

		if GetDistanceBetweenCoords( -1347.779, -1081.401, 6.9383039, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then  
			Draw3DText( -1347.779, -1081.401, 5.5383039, "NCHub - Special Edition [2024]", 4, 0.1, 0.1)
			Draw3DText( -1347.779, -1081.401, 6.9383039  -1.600, "Discord - discord.gg/sgx", 4, 0.1, 0.1)
			Draw3DText( -1347.779, -1081.401, 6.9383039  -1.800, "Youtube - Youtube.com/@NCHub", 4, 0.1, 0.1)		
		end	
				--Hologram No. 2
		if GetDistanceBetweenCoords( 387.89099, -326.5239, 46.897838, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then 
			Draw3DText( 387.89099, -326.5239, 45.47838, "NCHub - Special Edition [2024]", 4, 0.1, 0.1)
			Draw3DText( 387.89099, -326.5239, 46.897838  -1.600, "Discord - discord.gg/sgx", 4, 0.1, 0.1)
			Draw3DText( 387.89099, -326.5239, 46.897838  -1.800, "Youtube - Youtube.com/@NCHub", 4, 0.1, 0.1)	
		end	
	end
end

-------------------------------------------------------------------------------------------------------------------------
function Draw3DText(x,y,z,textInput,fontId,scaleX,scaleY)
         local px,py,pz=table.unpack(GetGameplayCamCoords())
         local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)    
         local scale = (1/dist)*20
         local fov = (1/GetGameplayCamFov())*100
         local scale = scale*fov   
         SetTextScale(scaleX*scale, scaleY*scale)
         SetTextFont(fontId)
         SetTextProportional(1)
         SetTextColour(250, 250, 250, 255)		-- You can change the text color here
         SetTextDropshadow(1, 1, 1, 1, 255)
         SetTextEdge(2, 0, 0, 0, 150)
         SetTextDropShadow()
         SetTextOutline()
         SetTextEntry("STRING")
         SetTextCentre(1)
         AddTextComponentString(textInput)
         SetDrawOrigin(x,y,z+2, 0)
         DrawText(0.0, 0.0)
         ClearDrawOrigin()
        end
