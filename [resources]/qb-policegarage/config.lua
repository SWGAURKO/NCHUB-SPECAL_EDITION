Config = Config or {}

-- Dont forgot to setup the discord logs via the server.lua

Config.UseColors = false -- Want to use colors when player buys vehicle?

Config.UsePreviewMenuSync = true -- Sync for the prewview menu when player is inside the prewview menu other players cant get inside (can prevent bugs but not have to use)

Config.UseMarkerInsteadOfMenu = false -- Want to use the marker to return the vehice? if false you can do that by opening the menu

Config.SetVehicleTransparency = 'low' -- Want to make the vehicle more transparent? you have a lot of options to choose from: low, medium, high, none

Config.MS = 'high' -- MS for the script recommended using high if not the "close" will get a bit baggy. options high / low

Config.Job = 'police' --The job needed to open the menu

Config.CarItems = {
    [1] = {
        name = "heavyarmor",
        amount = 1,
        info = {},
        type = "item",
        slot = 2,
    },
    [2] = {
        name = "ifak",
        amount = 3,
        info = {},
        type = "item",
        slot = 2,
    },
}

--You Can Add As Many As You Like
--DO NOT add vehicles that are not in your shared ! otherwise the qb-garages wont work
Config.Vehicles = {
    [1] = {
        ['vehiclename'] = "2005 Ford Crown Victoria", --Name
        ['vehicle'] = "npolvic", --Model
        ['price'] = 1, --Price
        ['r'] = 0, --Vehicle Color (Optional)
        ['g'] = 0,
        ['b'] = 0,
    }, 
    [2] = {
        ['vehiclename'] = "2019 Ford Mustang", --Name
        ['vehicle'] = "npolstang", --Model
        ['price'] = 79000, --Price
        ['r'] = 0, --Vehicle Color (Optional)
        ['g'] = 0,
        ['b'] = 0,
    }, 
    [3] = {
        ['vehiclename'] = "2018 Dodge Challenger", --Name
        ['vehicle'] = "npolchal", --Model
        ['price'] = 89000, --Price
        ['r'] = 0, --Vehicle Color (Optional)
        ['g'] = 0,
        ['b'] = 0,
    }, 
    [4] = {
        ['vehiclename'] = "2015 Dodge Charger", --Name
        ['vehicle'] = "npolchar", --Model
        ['price'] = 69000, --Price
        ['r'] = 0, --Vehicle Color (Optional)
        ['g'] = 0,
        ['b'] = 0,
    },
    [5] = {
        ['vehiclename'] = "2012 Prison Bus", --Name
        ['vehicle'] = "npolcoach", --Model
        ['price'] = 62000, --Price
        ['r'] = 0, --Vehicle Color (Optional)
        ['g'] = 0,
        ['b'] = 0,
    },  
    [6] = {
        ['vehiclename'] = "2016 Ford Explorer", --Name
        ['vehicle'] = "npolexp", --Model
        ['price'] = 66000, --Price
        ['r'] = 0, --Vehicle Color (Optional)
        ['g'] = 0,
        ['b'] = 0,
    }, 
    [7] = {
        ['vehiclename'] = "2014 Police Bike", --Name
        ['vehicle'] = "npolmm", --Model
        ['price'] = 74000, --Price
        ['r'] = 0, --Vehicle Color (Optional)
        ['g'] = 0,
        ['b'] = 0,
    }, 
    [8] = {
        ['vehiclename'] = "2013 Vapid", --Name
        ['vehicle'] = "npolretinue", --Model
        ['price'] = 61500, --Price
        ['r'] = 0, --Vehicle Color (Optional)
        ['g'] = 0,
        ['b'] = 0,
    }, 
    [9] = {
        ['vehiclename'] = "2017 Chevrolet Corvette", --Name
        ['vehicle'] = "npolvette", --Model
        ['price'] = 119000, --Price
        ['r'] = 0, --Vehicle Color (Optional)
        ['g'] = 0,
        ['b'] = 0,
    }, 
    [10] = {
        ['vehiclename'] = "Police Riot", --Name
        ['vehicle'] = "bcat", --Model
        ['price'] = 10000, --Price
        ['r'] = 0, --Vehicle Color (Optional)
        ['g'] = 0,
        ['b'] = 0,
    },
}