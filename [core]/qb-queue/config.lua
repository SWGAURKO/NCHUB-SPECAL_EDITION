-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------

local seconds = 1000
Config = {}

Config.checkForUpdates = false -- Check for updates?

Config.DiscordInfo = {
    botToken = 'MTI3MTkxMjU1MDU0MzM5MjgxMQ.Gu0B6K.wJMFk2YIxkh3QNVLs9Ui7F9WHkkP5HGTD-EW1c', -- Your Discord bot token here
    guildID = '1053230196326666270', -- Your Discord's server ID here(Aka Guild ID)
}

Config.DiscordWhitelist = { -- Restrict if someone can fly in if they lack specific Discord role(s)
    enabled = true, -- Enable?
    deniedMessage = 'https://discord.gg/TnZbSDQNUk : Join our Discord server and verify to play!', -- Message for those who lack whitelisted role(s)
    whitelistedRoles = {
      --'ROLE_ID_HERE',
        '1053668225596002404', -- Maybe like a civilian role or whitelisted role(can add multiple to table)
    }
}

Config.DiscordQueue = {
    enabled = true, -- Enable? Requires
    refreshTime = 2.5 * seconds, -- How long between queue refreshes(Default: 2.5 * seconds)
    maxConnections = GetConvar('sv_maxclients', 180), -- How many slots do you have avaliable in total for server
    title = 'VLife RP', -- Maybe server name here?

    image = { -- Image shown on adaptive card
        link = 'https://i.ibb.co/5MjhdjB/LVUYWac.gif', -- Link to image, maybe like a server logo? 
        width = '600px', -- Width of image(would not go much higher than this)
        height = '338px' -- Height
    },

    currentQueueText = 'Current queue', -- Title above queue but below image

    currentSpotText = 'Current queue: %s | Online Total: %s/%s', -- Current queue place text

    footerText = 'Visit our discord to reserve a priority queue!', -- The text right above the buttons on the adaptive card

    overflowQueueText = 'and %s more players!\n',

    buttons = { -- The little buttons at the bottom of the screen
        button1 = { -- Webstore button config
            title = 'WebStore',
            iconUrl = 'https://discord.gg/M2JKpTBxQk', -- Little button icon image link
            url = '' -- Link button goes to
        },
        button2 = {
            title = 'Discord',
            iconUrl = 'https://i.imgur.com/4a1Rdgf.png',
            url = 'https://discord.gg/M2JKpTBxQk'
        }
    },
    roles = {

        { -- This ones provided by default are purely for example
            name = 'Citizen', -- Name you want displayed as role on queue card
            roleId = '1053668225596002404', -- Role ID of role
            points = 0 -- Points to add to queue(Higher the number, higher the queue)
        },

        {
            name = 'Owner',
            roleId = '1053388027436736523',
            points = 100
        },
        {
            name = 'Developer',
            roleId = '1053242447322423320',
            points = 100
        },
    }
}

strings = {
    verifyConnection = '[vLifeRP] Verifying connection...',
    verifyLauncher = '[vLifeRP] Verifying Launcher...',
    verifyDiscord = '[vLifeRP] Verifying Discord...',
    verifyQueue = '[vLifeRP] Adding to queue...',
    notInDiscord = '[vLifeRP] You must join the discord: https://discord.gg/M2JKpTBxQk to fly in!',
    noDiscord = '[vLifeRP] You must have Discord downloaded, installed, and running to connect!',
    error = '[vLifeRP] An error has occured, please try again!',
    noSteam = '[vLifeRP] You must have Steam downloaded, installed and running to connect!',
}
