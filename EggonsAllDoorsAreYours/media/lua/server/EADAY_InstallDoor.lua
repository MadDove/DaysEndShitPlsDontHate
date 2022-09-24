EADAY = EADAY or {}

local InstalledDoor = ISBuildingObject:derive("InstalledDoor")

-- InstalledDoor.create = ISWoodenDoor.create
InstalledDoor.render = ISWoodenDoor.render
InstalledDoor.isValidIWD = ISWoodenDoor.isValid
-- ISBuildAction.EADAY_Store_perform = ISBuildAction.perform
-- function ISBuildAction:perform()
--     self:EADAY_Store_perform()
--     local InstallDoorCopy = self.item
--     if not InstallDoorCopy.isEADAY then
--         return
--     end
--     -- local inventory = InstallDoorCopy.playerObj:getInventory()
--     -- inventory:DoRemoveItem(InstallDoorCopy.doorItem)
-- end

function InstalledDoor:removeMaterials()
    local inv = self.playerObj:getInventory()
    local DC = self.doorConfig
    local requiredMaterials
    if DC then
        -- print("DC: ", DC)
        requiredMaterials = DC.requires
    else
        -- print("Revert to defaults ")
        requiredMaterials = EADAY.Defaults.requiredMaterials
    end
    -- EggonsMU.printFuckingNormalObject(requiredMaterials, "requiredMaterials")
    for fullType, quantity in pairs(requiredMaterials) do
        for i = 1, quantity do
            local itemToRemove = inv:getFirstTypeRecurse(fullType)
            if itemToRemove then
                inv:DoRemoveItem(itemToRemove)
            end
        end
    end
    inv:DoRemoveItem(self.doorItem)
end

function InstalledDoor:create(x, y, z, north, sprite)
    local cell = getWorld():getCell()
    self.sq = cell:getGridSquare(x, y, z)
    local spriteName
    if north then
        spriteName = self.northSprite
    else
        spriteName = self.sprite
    end
    self.javaObject = IsoDoor.new(cell, self.sq, getSprite(spriteName), self.north)
    self.javaObject:setHealth(self.health)
    self.javaObject:setKeyId(self.keyId)
    self.sq:AddSpecialObject(self.javaObject)
    self.javaObject:transmitCompleteItemToServer()
    self.javaObject:setLockedByKey(false)
    cell:setDrag(nil, self.playerObj:getPlayerNum())
    self:removeMaterials()
    -- local inventory = self.playerObj:getInventory()
    -- inventory:DoRemoveItem(self.doorItem)
    -- local hinge = inventory:getFirstTypeRecurse("Base.Hinge")
    -- inventory:DoRemoveItem(hinge)
    -- hinge = inventory:getFirstTypeRecurse("Base.Hinge")
    -- inventory:DoRemoveItem(hinge)
end

-- function InstalledDoor:removeMaterials()
--     -- local player = getPlayer(self.player)
-- end

function InstalledDoor:new(doorItem, playerObj)
    local o = {}
    local sprite, northSprite, openSprite, openNorthSprite
    setmetatable(o, self)
    self.__index = self
    o:init()
    o.playerObj = playerObj
    o.player = playerObj:getPlayerNum()

    local doorData = doorItem:getModData().EADAY
    local doorConfig = EADAY.getDoorConfig(doorData)
    local orientation
    if doorConfig and EADAY.isFullConfig(doorConfig) then
        -- use config
        o.northValid = true
        o.westValid = true
        sprite = doorConfig.west.sprite
        openSprite = doorConfig.west.openSprite
        northSprite = doorConfig.north.sprite
        openNorthSprite = doorConfig.north.openSprite
    else
        -- use stored data
        if doorData.orientation == "north" then
            o.northValid = true
            o.north = true
            o.westValid = false
            sprite = ""
            openSprite = ""
            northSprite = doorData.closedSprite
            openNorthSprite = doorData.openSprite
        else
            o.northValid = false
            o.north = false
            o.westValid = true
            sprite = doorData.closedSprite
            openSprite = doorData.openSprite
            northSprite = ""
            openNorthSprite = ""
        end
    end

    o:setSprite(sprite)
    o:setNorthSprite(northSprite)
    -- o.isEADAY = true
    o.firstValidRun = true
    o.openSprite = openSprite
    o.openNorthSprite = openNorthSprite
    o.doorItem = doorItem
    o.doorConfig = doorConfig
    o.isDoor = true
    o.breakSound = doorData.breakSound or "BreakDoor"
    o.maxHealth = doorData.maxHealth
    o.health = doorData.health
    o.keyId = doorData.keyId
    o.name = doorData.name
    o.thumpDmg = doorData.thumpDmg
    o.isWallLike = true
    return o
end

function InstalledDoor:haveMaterial() -- mockup for vanilla isValid
    return true
end

function InstalledDoor:isValid(square)
    local vanillaValidity = self:isValidIWD(square)
    -- print("vanillaValidity: ", vanillaValidity)
    -- if first run and config not full rotate door to the valid orientation if necessary
    if self.firstValidRun then
        if not EADAY.isFullConfig(self.doorConfig) and self.north ~= self.northValid then
            local key = getCore():getKey("Rotate building")
            self:rotateKey(key)
            self.north = self.northValid
        end
        self.firstValidRun = false
    end
    if not vanillaValidity then
        return vanillaValidity
    end
    if self.north then
        return self.northValid
    else
        return self.westValid
    end
end

EADAY.installDoor = function(player)
    return function(doorItem)
        -- local player = getPlayer()
        local door = InstalledDoor:new(doorItem, player)
        door.canBarricade = true
        door.modData["xp:Woodwork"] = 3
        door.modData["need:Base.Hinge"] = "2"
        -- door.modData["need:Base.Plank"] = "4"
        -- door.modData["need:Base.Nails"] = "4"
        -- door.modData["need:Base.Doorknob"] = "1"
        -- door.player = player:getPlayerNum()
        door.completionSound = "BuildWoodenStructureLarge"
        getCell():setDrag(door, player:getPlayerNum())
    end
end
