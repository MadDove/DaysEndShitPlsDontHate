local function removeDoor(door)
    local removeDoor = EADAY.RemoveDoor:new(door, getPlayer())
    ISTimedActionQueue.add(removeDoor)
end

local removalDictionary = {
    unlocked = "Door unlocked",
    carpentry = "Carpentry level: " .. tostring(EADAY.Options.minCarpentryLevel),
    screwdriver = "Screwdriver",
    crowbar = "Crowbar"
}

local function logDoorDataToConsole(door)
    local orientation, openSpriteName
    if door and (instanceof(door, "IsoDoor") or instanceof(door, "IsoThumpable")) then
        local openSprite = door:getOpenSprite()
        openSpriteName = openSprite:getName()
        orientation = EADAY.getObjectOrientation(door)
    elseif door then
        local DMD = door:getModData().EADAY
        openSpriteName = DMD.openSprite
        orientation = DMD.orientation
    end
    print("EADAY DOOR DATA:")
    print("Door orientation: ", orientation)
    print("Door sprite name: ", openSpriteName)
    print("***** END ******")
end

local function addWorldDoorOptions(player, context, worldObjects)
    local door = EADAY.getSpecificObjectFromWorldObjects(worldObjects, EADAY.isDoor)
    if door and EADAY.isValidEADAYDoor(door) then
        local doorConfig = EADAY.getDoorConfig(door)
        if doorConfig and doorConfig.disabled then
            return
        end
        local isFullConfig = EADAY.isFullConfig(doorConfig)
        local removeDoorOptionText = "Take door off hinges"
        local toolTipDescription
        local removeOption = context:addOption(removeDoorOptionText, door, removeDoor)

        if isFullConfig then
            -- removeDoorOptionText = removeDoorOptionText .. "(any orientation)"
            toolTipDescription = "This door can be installed in any orientation."
        else
            removeDoorOptionText = removeDoorOptionText .. " (can be installed in current orientation only)"
            toolTipDescription =
                "This door can be installed only in its current orientation - facing " ..
                EADAY.getObjectOrientation(door)
            local subMenu = ISContextMenu:getNew(context)
            context:addSubMenu(removeOption, subMenu)
            subMenu:addOption("Log door data to console", door, logDoorDataToConsole)
        end
        local toolTip = ISWorldObjectContextMenu.addToolTip()
        removeOption.toolTip = toolTip
        local validityCfg = EADAY.isRemovalValid(door)
        if validityCfg.valid then
            toolTip.description = toolTipDescription
        else
            toolTip.description = EADAY.buildTooltipDescription(validityCfg, removalDictionary)
            -- toolTip:setName("Tooltip name")
            removeOption.notAvailable = true
        end
    end
end

Events.OnFillWorldObjectContextMenu.Add(addWorldDoorOptions)

local installationDictionary = {
    carpentry = "Carpentry level: " .. tostring(EADAY.Options.minCarpentryLevel),
    screwdriver = "Screwdriver",
    crowbar = "Crowbar",
    materialsDetails = true
}

local function addInventoryContextOptions(player, context, items)
    local item
    if items[1].items then
        item = items[1].items[1]
    else -- if right-clicked in hotbar
        item = items[1]
    end
    player = getPlayer(player)
    local isValidItem = EADAY.isValidEADAYDoorItem(item)
    local doorConfig
    if isValidItem and item:getContainer() == player:getInventory() then
        doorConfig = EADAY.getDoorConfig(item)
        local installOption = context:addOption("Install door", item, EADAY.installDoor(player))
        local validityCfg = EADAY.isInstallationValid(doorConfig)
        -- EggonsMU.printFuckingNormalObject(validityCfg, "validityCfg")
        local toolTip = ISWorldObjectContextMenu.addToolTip()
        if validityCfg.valid then
        else
            installOption.toolTip = toolTip
            toolTip.description = EADAY.buildTooltipDescription(validityCfg, installationDictionary)
            installOption.notAvailable = true
        end
    end
    if isValidItem and not EADAY.isFullConfig(doorConfig) then
        context:addOption("Log door data to console", item, logDoorDataToConsole)
    end
end

Events.OnFillInventoryObjectContextMenu.Add(addInventoryContextOptions)
