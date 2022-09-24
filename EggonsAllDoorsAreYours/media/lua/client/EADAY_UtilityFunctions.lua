EADAY = EADAY or {}

function EADAY.isDoor(worldObject)
    return instanceof(worldObject, "IsoDoor") or (instanceof(worldObject, "IsoThumpable") and worldObject:isDoor())
end
function EADAY.isFrame(worldObject)
    return instanceof(worldObject, "IsoThumpable") and worldObject:isDoorFrame()
end
function EADAY.isValidEADAYDoor(door)
    local openSprite = door:getOpenSprite()
    if not openSprite then
        return false
    elseif openSprite:getProperties():Is("GarageDoor") or IsoDoor.getDoubleDoorIndex(door) > 0 then
        return false
    else
        return true
    end
end
function EADAY.isValidEADAYDoorItem(item)
    if item then
        return not (not item:getModData().EADAY)
    else
        return false
    end
end

function EADAY.getSpecificObjectFromWorldObjects(worldObjects, testFunction)
    local output, square
    for i, wo in ipairs(worldObjects) do
        if not square and wo then
            square = wo:getSquare()
        end
        if testFunction(wo) then
            output = wo
            break
        end
    end
    return output
end

function EADAY.getDoorConfig(door)
    -- local isOpen = door:IsOpen()
    -- print("door ", door)
    local openSprite, orientation
    if instanceof(door, "IsoDoor") or instanceof(door, "IsoThumpable") then
        openSprite = door:getOpenSprite():getName()
        orientation = EADAY.getObjectOrientation(door)
    elseif instanceof(door, "InventoryItem") then
        local DMD = door:getModData().EADAY
        openSprite = DMD.openSprite
        orientation = DMD.orientation
    else
        openSprite = door.openSprite
        orientation = door.orientation
    end

    local config
    -- print("orientation ", orientation)
    -- print("doorConfig ", doorConfig)

    for i, doorConfig in ipairs(EADAY.DoorConfigs) do
        if doorConfig[orientation].openSprite == openSprite then
            config = doorConfig
            break
        end
    end
    -- print("config ", config)
    -- print("...for door sprite: ", openSprite)
    return config
end

function EADAY.getObjectOrientation(door)
    local north = door:getNorth()
    local orientation
    if north then
        orientation = "north"
    else
        orientation = "west"
    end
    return orientation
end

function EADAY.isFullConfig(doorConfig)
    if not doorConfig then
        return false
    end
    return doorConfig.north.sprite and doorConfig.west.sprite
end

function EADAY.isInstallationValid(doorConfig)
    local player = getPlayer()
    local inv = player:getInventory()
    local scriptManager = getScriptManager()
    local requiredMaterials
    local output = {
        valid = true,
        carpentry = true,
        screwdriver = true,
        crowbar = true,
        materials = true,
        materialsDetails = {}
    }
    local carpentryLevel = player:getPerkLevel(Perks.Woodwork)
    if carpentryLevel < EADAY.Options.minCarpentryLevel then
        output.carpentry = false
    end
    local screwdriver = inv:containsTypeRecurse("Base.Screwdriver")
    if not screwdriver then
        output.screwdriver = false
    end
    local crowbar = inv:containsTypeRecurse("Base.Crowbar")
    if not crowbar then
        output.crowbar = false
    end
    if doorConfig then
        requiredMaterials = doorConfig.requires
    else
        requiredMaterials = EADAY.Defaults.requiredMaterials
    end
    -- EggonsMU.printFuckingNormalObject(requiredMaterials, "requiredMaterials")
    -- check for required materials
    for requiredItemFullType, quantity in pairs(requiredMaterials) do
        local hasQuantity = inv:getCountType(requiredItemFullType)
        output.materialsDetails[requiredItemFullType] = {}
        local entry = output.materialsDetails[requiredItemFullType]
        if hasQuantity < quantity then
            output.materials = false
            entry.hasEnough = false
        else
            entry.hasEnough = true
        end
        local itemName = scriptManager:FindItem(requiredItemFullType):getDisplayName()
        local having = tostring(hasQuantity) .. "/" .. tostring(quantity)
        entry.description = itemName .. " " .. having
    end
    -- print("Count hinges ", inv:getCountType("Base.Hinge"))
    output.valid = output.carpentry and output.crowbar and output.screwdriver and output.materials
    return output
end
function EADAY.isRemovalValid(door)
    local player = getPlayer()
    local inv = player:getInventory()
    local output = {
        valid = true,
        carpentry = true,
        screwdriver = true,
        crowbar = true,
        unlocked = true
    }
    local carpentryLevel = player:getPerkLevel(Perks.Woodwork)
    if carpentryLevel < EADAY.Options.minCarpentryLevel then
        output.carpentry = false
    end
    local screwdriver = inv:containsTypeRecurse("Base.Screwdriver")
    if not screwdriver then
        output.screwdriver = false
    end
    local crowbar = inv:containsTypeRecurse("Base.Crowbar")
    if not crowbar then
        output.crowbar = false
    end
    local unlocked = not door:isLockedByKey()
    if not unlocked then
        output.unlocked = false
    end
    output.valid = output.carpentry and output.crowbar and output.screwdriver and output.unlocked
    return output
end

local falseRGB = "<RGB:1,0,0>"
local trueRGB = "<RGB:0,1,0>"

function EADAY.buildTooltipDescription(validityCfg, tooltipDictionary)
    local output = "Required:"
    local text
    for k, textOrCfg in pairs(tooltipDictionary) do
        local RGB
        local validityCfgEntry = validityCfg[k]
        if validityCfgEntry == true then
            RGB = trueRGB
            text = textOrCfg
            output = output .. " <LINE> " .. RGB .. text
        elseif validityCfgEntry == false then
            RGB = falseRGB
            text = textOrCfg
            output = output .. " <LINE> " .. RGB .. text
        else -- materialDetails
            -- EggonsMU.printFuckingNormalObject(validityCfgEntry, "validityCfgEntry")
            for fullType, itemCfg in pairs(validityCfgEntry) do
                -- EggonsMU.printFuckingNormalObject(fullType, "fullType")
                -- EggonsMU.printFuckingNormalObject(itemCfg, "itemCfg")
                if itemCfg.hasEnough then
                    RGB = trueRGB
                else
                    RGB = falseRGB
                end
                output = output .. " <LINE> " .. RGB .. itemCfg.description
            end
        end
    end
    -- print("Built tooltip: ", output)
    return output
end

-- local function checkFrame()
--     local square = getPlayer():getSquare()
--     print("Square! ", square)
--     for i = 0, square:getSpecialObjects():size() - 1 do
--         local item = square:getSpecialObjects():get(i)
--         print("Item ", item)
--         if instanceof(item, "IsoThumpable") and item:isDoorFrame() then
--             hasFrame = true
--             print("Has Frame 2!")
--         end
--         if instanceof(item, "IsoThumpable") and item:isDoor() then
--             print("Has Door 2!")
--             hasDoor = true
--         end
--     end
-- end
