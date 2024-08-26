
--[[
	["vehicleshots"] -> dispatchcodename that you pass with the event of AlertGunShot
	displayCode -> Code to be displayed on the blip message
	description -> Description of the blip message
	radius -> to draw a circle with radius around blip ( the number need to have a  .0  behind it, for example 150.0 or 75.0 )
        -> if u want to have the radius without the blip just make the blipScale = 0
        -> if u want to have the radius centered, disable the offset
	recipientList -> list of job names that can see the blip
	blipSprite -> blip sprite
	blipColour -> blip colour
	blipScale -> blip scale
	blipLength -> time in seconds at which the blip will fade down, lower the time, faster it will fade. Cannot be 0
        offset -> enable or disable the offset for the radius ( radius on 0 and offset on true does nothing )
]]--

dispatchCodes = {

    ["vehicleshots"] =  {displayCode = '10-13', description = "Shots Fired from Vehicle", radius = 0, recipientList = {'police'}, blipSprite = 119, blipColour = 1, blipScale = 0.9, blipLength = 2, sound = "Lose_1st", sound2 = "GTAO_FM_Events_Soundset", offset = "false"},
	["shooting"] =  {displayCode = '10-13', description ="Shots Fired", radius = 0, recipientList = {'police'}, blipSprite = 110, blipColour = 1, blipScale = 0.9, blipLength = 2, sound = "Lose_1st", sound2 = "GTAO_FM_Events_Soundset", offset = "false"},
	["speeding"] =  {displayCode = '10-13', description = "Speeding", radius = 0, recipientList = {'police'}, blipSprite = 326, blipColour = 84, blipScale = 1.0, blipLength = 2, sound = "Lose_1st", sound2 = "GTAO_FM_Events_Soundset", offset = "false"},
    ["fight"] =  {displayCode = '10-10', description = "Fight In Progress", radius = 0, recipientList = {'police'}, blipSprite = 685, blipColour = 69, blipScale = 1.0, blipLength = 2, sound = "Lose_1st", sound2 = "GTAO_FM_Events_Soundset", offset = "false"},
	["civdown"] =  {displayCode = '10-69', description = "Civilan Down", radius = 0, recipientList = {'ambulance'}, blipSprite = 126, blipColour = 3, blipScale = 1.0, blipLength = 2, sound = "dispatch"},
	["officerdown"] =  {displayCode = '10-99', description = "Officer Down", radius = 15.0, recipientList = {'police'}, blipSprite = 526, blipColour = 1, blipScale = 1.0, blipLength = 2, sound = "robberysound", offset = "false"},
	["panicbutton"] =  {displayCode = '10-99', description = "Panic Button", radius = 15.0, recipientList = {'police'}, blipSprite = 570, blipColour = 17, blipScale = 0.9, blipLength = 2, sound = "robberysound", offset = "false"},
	["gpsbutton"] =  {displayCode = '10-99', description = "Gps Location", radius = 15.0, recipientList = {'police'}, blipSprite = 162, blipColour = 0, blipScale = 0.9, blipLength = 2, sound = "robberysound", offset = "false"},
	["emsdown"] =  {displayCode = '10-99', description = "EMS Down", radius = 15.0, recipientList = {'police', 'ambulance'}, blipSprite = 526, blipColour = 3, blipScale = 1.0, blipLength = 2, sound = "robberysound", offset = "false"},
    ["corner"] =  {displayCode = '10-12', description = "Corner Selling In Progress", radius = 0, recipientList = {'police'}, blipSprite = 514, blipColour = 5, blipScale = 1.0, blipLength = 2, sound = "Lose_1st", sound2 = "GTAO_FM_Events_Soundset", offset = "false"},
	["truckrobbery"] =  {displayCode = '10-90', description = "Truck Robbery In Progress", radius = 0, recipientList = {'police'}, blipSprite = 67, blipColour = 1, blipScale = 1.0, blipLength = 2, sound = "Lose_1st", sound2 = "GTAO_FM_Events_Soundset", offset = "false"},
	["artrobberygallery"] =  {displayCode = '10-90', description = "Art Robbery In Progress", radius = 0, recipientList = {'police'}, blipSprite = 67, blipColour = 1, blipScale = 1.0, blipLength = 2, sound = "Lose_1st", sound2 = "GTAO_FM_Events_Soundset", offset = "false"},
	["truck"] =  {displayCode = '10-36', description ="Truck Robbery", radius = 0, recipientList = {'police'}, blipSprite = 52, blipColour = 1, blipScale = 1.0, blipLength = 1.5, sound = "Lose_1st", sound2 = "GTAO_FM_Events_Soundset"},
	["bankrobbery"] =  {displayCode = '10-90', description = "Fleeca Bank Robbery In Progress", radius = 0, recipientList = {'police'}, blipSprite = 500, blipColour = 2, blipScale = 1.0, blipLength = 2, sound = "robberysound", offset = "false"},
	["paletobankrobbery"] =  {displayCode = '10-90', description = "Paleto Bank Robbery In Progress", radius = 0, recipientList = {'police'}, blipSprite = 500, blipColour = 12, blipScale = 1.0, blipLength = 2, sound = "robberysound", offset = "false"},
	["pacificbankrobbery"] =  {displayCode = '10-90', description = "Pacific Bank Robbery In Progress", radius = 0, recipientList = {'police'}, blipSprite = 500, blipColour = 5, blipScale = 1.0, blipLength = 2, sound = "robberysound", offset = "false"},
	["store"] =  {displayCode = '10-90', description = "Store Robbery In Progress", radius = 0, recipientList = {'police'}, blipSprite = 59, blipColour = 1, blipScale = 1.0, blipLength = 2, sound = "robberysound", offset = "false"},
	["lockpickdoor"] =  {displayCode = '10-890', description = "Breaking in the police doors", radius = 0, recipientList = {'police'}, blipSprite = 285, blipColour = 54, blipScale = 0.8, blipLength = 2, sound = "robberysound", offset = "false"},
	["prisonbreak"] =  {displayCode = '10-90', description = "Prison Break In Progress", radius = 0, recipientList = {'police'}, blipSprite = 189, blipColour = 59, blipScale = 1.0, blipLength = 2, sound = "robberysound", offset = "false"},
	["vangelicorobbery"] =  {displayCode = '10-90', description = "Vangelico Robbery In Progress", radius = 0, recipientList = {'police'}, blipSprite = 434, blipColour = 5, blipScale = 1.0, blipLength = 2, sound = "robberysound", offset = "false"},
	["houserobbery"] =  {displayCode = '10-90', description = "House Robbery In Progress", radius = 0, recipientList = {'police'}, blipSprite = 40, blipColour = 5, blipScale = 1.0, blipLength = 2, sound = "Lose_1st", sound2 = "GTAO_FM_Events_Soundset", offset = "false"},
	["drugtrafficking"] =  {displayCode = '10-31', description = "Drug Activity", radius = 0, recipientList = {'police'}, blipSprite = 51, blipColour = 17, blipScale = 1.5, blipLength = 2, sound = "robberysound", offset = "false"},
	["suspicioushandoff"] =  {displayCode = '10-60', description = "Suspicious Hand off", radius = 120.0, recipientList = {'police'}, blipSprite = 469, blipColour = 52, blipScale = 0, blipLength = 2, sound = "Lose_1st", sound2 = "GTAO_FM_Events_Soundset", offset = "true"},
	["vehicletheft"] =  {displayCode = '10-35', description = "Car Theft In Progress", radius = 0, recipientList = {'police'}, blipSprite = 595, blipColour = 60, blipScale = 1.0, blipLength = 2, sound = "Lose_1st", sound2 = "GTAO_FM_Events_Soundset", offset = "false"},
	["oxyruns"] =  {displayCode = '10-31', description = "Drug Activity", radius = 0, recipientList = {'police'}, blipSprite = 51, blipColour = 17, blipScale = 1.5, blipLength = 2, sound = "robberysound", offset = "false"},
	-- Rainmad Heists

	["artgalleryrobbery"] =  {displayCode = '10-90', description = "Art Gallery Robbery In Progress", radius = 0, recipientList = {'police'}, blipSprite = 269, blipColour = 59, blipScale = 1.0, blipLength = 2, sound = "robberysound", offset = "false"},
	["humanelabsrobbery"] =  {displayCode = '10-90', description = "Humane Labs Robbery In Progress", radius = 0, recipientList = {'police'}, blipSprite = 499, blipColour = 1, blipScale = 1.0, blipLength = 2, sound = "robberysound", offset = "false"},
	["trainrobbery"] =  {displayCode = '10-90', description = "Truck Robbery In Progress", radius = 0, recipientList = {'police'}, blipSprite = 667, blipColour = 78, blipScale = 1.0, blipLength = 2, sound = "robberysound", offset = "false"},
	["vanrobbery"] =  {displayCode = '10-90', description = "Security Van Robbery In Progress", radius = 0, recipientList = {'police'}, blipSprite = 67, blipColour = 59, blipScale = 1.0, blipLength = 2, sound = "robberysound", offset = "false"},
	["undergroundrobbery"] =  {displayCode = '10-90', description = "Underground Tunnels Robbery In Progress", radius = 0, recipientList = {'police'}, blipSprite = 486, blipColour = 59, blipScale = 1.0, blipLength = 2, sound = "robberysound", offset = "false"},
	["drugboatrobbery"] =  {displayCode = '10-31', description = "Suspicious Activity On Boat", radius = 0, recipientList = {'police'}, blipSprite = 427, blipColour = 26, blipScale = 1.0, blipLength = 2, sound = "robberysound", offset = "false"},
	["unionrobbery"] =  {displayCode = '10-90', description = "Union Depository Robbery In Progress", radius = 0, recipientList = {'police'}, blipSprite = 500, blipColour = 60, blipScale = 1.0, blipLength = 2, sound = "robberysound", offset = "false"},
	["carboosting"] =  {displayCode = '10-50', description = "Car Boosting In Progress", radius = 0, recipientList = {'police'}, blipSprite = 532, blipColour = 60, blipScale = 1.0, blipLength = 2, sound = "Lose_1st", sound2 = "GTAO_FM_Events_Soundset", offset = "false"},
	["carjack"] =  {displayCode = '10-35', description = "Car Theft In Progress", radius = 0, recipientList = {'police'}, blipSprite = 595, blipColour = 60, blipScale = 1.0, blipLength = 2, sound = "Lose_1st", sound2 = "GTAO_FM_Events_Soundset", offset = "false"},
	["explosion"] =  {displayCode = '10-80', description = "Explosion Reported", radius = 0, recipientList = {'police'}, blipSprite = 436, blipColour = 1, blipScale = 1.0, blipLength = 2, sound = "Lose_1st", sound2 = "GTAO_FM_Events_Soundset", offset = "false"},
}
