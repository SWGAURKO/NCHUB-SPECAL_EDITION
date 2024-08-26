


QB = {
    allowedJob = { 'police' },
    webhook = "https://discord.com/api/webhooks/1166499862930522202/cAJjo3fLwVhto3fPeuZMB2o_GIxUTEZgzPmY3o7x4GoA-ORaoYSVn0HnHVfT6behA87m",
    Framework = "qb",
    Footer = "You can see the records of bodycam in this page.",
    Header = "LOS SANTOS POLICE DEPARTMENT BODYCAM RECORDS",
    recordDesc = "Police Department Bodycam Record",
    recordName = "Police Bodycam Record",

    Commands = {
        [1] = {
            command = "records",
            action = "recordmenu",
            desc = "Records Menu",
        },
        [2] = {
            command = "bodycam",
            action = "bodycam",
            desc = "Turn On/Off Bodycam"
        },
    }
}
