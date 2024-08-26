Citizen.CreateThread(function()
	while true do
        Wait(150)
        SetVehicleModelIsSuppressed(GetHashKey("rubble"), true)
        SetVehicleModelIsSuppressed(GetHashKey("taco"), true)
        SetVehicleModelIsSuppressed(GetHashKey("biff"), true)
        SetVehicleModelIsSuppressed(GetHashKey("blimp"), true)
        SetVehicleModelIsSuppressed(GetHashKey("blimp2"), true)
        SetVehicleModelIsSuppressed(GetHashKey("frogger"), true)
        SetVehicleModelIsSuppressed(GetHashKey("frogger2"), true)
    end
end)