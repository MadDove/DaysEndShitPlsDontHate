require "TimedActions/ISBaseTimedAction"

local RemoveDoor = ISBaseTimedAction:derive("RemoveDoor")

function RemoveDoor:isValid()
    return true
end

function RemoveDoor:waitToStart()
    return false
end

-- function TestAction:update()
--     log("update")
-- end

function RemoveDoor:start()
    if not self.door:IsOpen() then
        self.door:ToggleDoor(self.player)
    end
end

function RemoveDoor:perform()
    local door = self.door
    local square = door:getSquare()
    local objects = square:getObjects()

    local doorConfig = EADAY.getDoorConfig(door)
    -- local openSprite = door:getOpenSprite():getName()
    local orientation = EADAY.getObjectOrientation(door)
    local name, openSprite, closedSprite, fullType
    local inventory = self.player:getInventory()

    local carpentryLevel = self.player:getPerkLevel(Perks.Woodwork)
    local carpentryLevelAboveMin = math.max(0, carpentryLevel - EADAY.Options.minCarpentryLevel)

    -- min carpentry = 4 starts at 60%
    local successProbability = math.min(1, 0.75 + carpentryLevelAboveMin * 0.05)
    local removalSuccess = EggonsMU.functions.rollSuccess(successProbability, 1000)

    if removalSuccess.success then
        if doorConfig then
            closedSprite = doorConfig[orientation].sprite
            openSprite = doorConfig[orientation].openSprite
            name = doorConfig.name
            fullType = doorConfig.fullType or EADAY.Defaults.doorItem.fullType
        else
            if door:IsOpen() then
                door:ToggleDoor(self.player)
            end
            closedSprite = door:getSprite():getName()
            openSprite = door:getOpenSprite():getName()
            door:ToggleDoor(self.player)
            name = EADAY.Defaults.doorItem.name
            fullType = EADAY.Defaults.doorItem.fullType
        end

        -- print("fulltype: ", fullType)
        local doorItem = inventory:AddItem(fullType)
        local DMD = doorItem:getModData()

        DMD.EADAY = {
            maxHealth = door:getMaxHealth(),
            health = door:getHealth(),
            name = name,
            closedSprite = closedSprite,
            openSprite = openSprite,
            orientation = orientation,
            -- breakSound = door:getBreakSound(),
            keyId = door:getKeyId(),
            thumpDmg = 5
        }
        if EggonsMU.functions.rollSuccess(successProbability, 1000).success then
            inventory:AddItem("Base.Hinge")
        end
        if EggonsMU.functions.rollSuccess(successProbability, 1000).success then
            inventory:AddItem("Base.Hinge")
        end
    else -- removal failed
        inventory:AddItem("Base.UnusableWood")
        inventory:AddItem("Base.UnusableWood")
        self.player:Say("It is not as simple as it seems!")
    end
    square:transmitRemoveItemFromSquare(door)
    ISBaseTimedAction.perform(self)
end

-- function TestAction:stop()
--     log("stop")
--     ISBaseTimedAction.stop(self)
-- end

function RemoveDoor:new(door, player)
    local o = {}
    setmetatable(o, self)
    self.__index = self
    o.stopOnWalk = true
    o.stopOnRun = true
    o.door = door
    o.character = player
    o.player = player
    o.maxTime = 70
    return o
end

EADAY.RemoveDoor = RemoveDoor
