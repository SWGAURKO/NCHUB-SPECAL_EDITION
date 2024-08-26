
exports["qb-target"]:AddCircleZone("recycle", vector3(994.6, -3100.02, -39.0), 2.0,
    {
        name = "recycle",
        debugPoly = false,
        useZ = true
    },
    {
        options = {
            {
                event = "recycle:dutytoggleBS",
                icon = "fas fa-clock",
                label = "Toggle Recycling Job",
                job = "all",
            },
            {
                event = "qb-recycle:trademenu",
                icon = "fas fa-recycle",
                label = "Trader",
                job = 'all',
            }
        },
        distance = 1.5
    }
)

