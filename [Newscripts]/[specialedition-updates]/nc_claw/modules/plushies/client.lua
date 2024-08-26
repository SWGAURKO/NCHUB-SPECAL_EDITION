toys = {
    right_shoulder = nil,
    left_shoulder = nil,
    hug = nil
}

Toy = {}

function toyUsageDialog(data)
    local options = {}

    if config.availableToys[data.name].actions.shoulder then
        options[#options + 1] = {
            title = toys.right_shoulder ~= nil and locale('take_off_right_shoulder') or locale('put_on_right_shoulder'),
            icon = "fa-solid fa-hand-point-right",
            onSelect = function(args)
                Citizen.CreateThread(function()
                    data.action = "right_shoulder"

                    Toy:new(data)
                end)
            end
        }

        options[#options + 1] = {
            title = toys.left_shoulder ~= nil and locale('take_off_left_shoulder') or locale('put_on_left_shoulder'),
            icon = "fa-solid fa-hand-point-left",
            onSelect = function(args)
                Citizen.CreateThread(function()
                    data.action = "left_shoulder"

                    Toy:new(data)
                end)
            end
        }
    end

    if config.availableToys[data.name].actions.hug then
        options[#options + 1] = {
            title = toys.hug ~= nil and locale('stop_hugging') or locale('hug'),
            icon = "fa-solid fa-hands-holding",
            onSelect = function(args)
                Citizen.CreateThread(function()
                    data.action = "hug"

                    Toy:new(data)
                end)
            end
        }
    end

    lib.registerContext({
        id = "toy_usage",
        title = locale('choose_usage'),
        description = data.label,
        options = options
    })

    lib.showContext("toy_usage")
end

function Toy:new(data)
    data = data or {}

    setmetatable(data, self)

    self.model = config.availableToys[data.name].model
    self.shoulderModel = config.availableToys[data.name].shoulderModel or nil
    self.object = nil

    self.__index = self

    if toys[data.action] ~= nil then
        toys[data.action]:cleanUp()

        return
    end

    for _, toy in pairs(toys) do
        if toy.name == data.name then
            return
        end
    end

    toys[data.action] = data

    toys[data.action]:setup()

    return data
end

function Toy:cleanUp()
    self:delete()
    ClearPedTasks(cache.ped)

    toys[self.action] = nil
end

function Toy:delete()
    if self.object then
        DeleteObject(self.object)
    end
end

function Toy:setup()
    if self.action == "hug" then
        self:hug()
    end

    if self.action == 'right_shoulder' or self.action == 'left_shoulder' then
        self:shoulder()
    end
end

function Toy:hug()
    RequestModel(GetHashKey(self.model))
    while not HasModelLoaded(GetHashKey(self.model)) do
        Citizen.Wait(100)
    end

    local animDict = "rcmnigel1a_band_groupies"
    local animation = "base_m2"
    local placement = {0.25, 0.18, -0.10, -180.0, -90.0, 0.0}

    if Game:isFemale() then
        placement = {0.26, 0.21, -0.09, -180.0, -90.0, 0.0}
    end

    self.object = CreateObject(GetHashKey(self.model), 1.0, 1.0, 1.0, 1, 1, 0)
    AttachEntityToEntity(self.object, cache.ped, GetPedBoneIndex(cache.ped, 24817), placement[1], placement[2], placement[3], placement[4], placement[5], placement[6], true, true, false, true, 1, true)
    SetModelAsNoLongerNeeded(GetHashKey(self.model))

    lib.requestAnimDict(animDict)
    TaskPlayAnim(cache.ped, animDict, animation, 2.0, 2.0, -1, 51, 0, false, false, false)

    Wait(1000)
    self:hugAnimationChecking()
    self:itemChecking()
end

function Toy:shoulder()
    if not self.shoulderModel then
        return
    end

    RequestModel(GetHashKey(self.shoulderModel))
    while not HasModelLoaded(GetHashKey(self.shoulderModel)) do
        Citizen.Wait(100)
    end

    local placement = {0.23, -0.02, 0.16, -180.0, -105.0, 0.0}

    if self.action == 'right_shoulder' then
        placement = {0.23, -0.02, -0.16, -180.0, -75.0, 0.0}
    end

    lib.requestAnimDict('move_p_m_two_idles@generic')
    TaskPlayAnim(cache.ped, 'move_p_m_two_idles@generic', 'fidget_blow_snot', 2.0, 2.0, -1, 51, 0, false, false, false)

    Wait(1500)
    self.object = CreateObject(GetHashKey(self.shoulderModel), 1.0, 1.0, 1.0, 1, 1, 0)
    AttachEntityToEntity(self.object, cache.ped, GetPedBoneIndex(cache.ped, 24818), placement[1], placement[2], placement[3], placement[4], placement[5], placement[6], true, true, false, true, 1, true)
    SetModelAsNoLongerNeeded(GetHashKey(self.shoulderModel))

    Wait(1000)
    ClearPedTasks(cache.ped)
    self:itemChecking()
end

function Toy:hugAnimationChecking()
    Citizen.CreateThread(function()
        while toys.hug ~= nil do
            local IsPlayingAnim = IsEntityPlayingAnim(cache.ped, "rcmnigel1a_band_groupies", "base_m2", 1)

            if not IsPlayingAnim then
                self:cleanUp()
            end

            Wait(1000)
        end
    end)
end

function Toy:itemChecking()
    Citizen.CreateThread(function()
        while toys[self.action] ~= nil do
            local hasPlushie = lib.callback.await("nc_claw:hasItem", false, self.name, 1)

            if not hasPlushie then
                self:cleanUp()
            end

            Wait(1000)
        end
    end)
end

Citizen.CreateThread(function()
    SetTimeout(1000, function()
        ClearPedTasks(cache.ped)
    end)
end)
