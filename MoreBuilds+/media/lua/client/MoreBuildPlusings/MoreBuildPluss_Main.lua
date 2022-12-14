--
-- Created by IntelliJ IDEA.
-- User: ProjectSky
-- Date: 2017/7/11
-- Time: 13:10
-- Project Zomboid More Builds Mod
--

-- pull global functions to local
local getSpecificPlayer = getSpecificPlayer
local pairs = pairs
local split = string.split
local getItemNameFromFullType = getItemNameFromFullType
local PerkFactory = PerkFactory
local getMoveableDisplayName = Translator.getMoveableDisplayName
local getSprite = getSprite
local getFirstTypeEval = getFirstTypeEval
local getItemCountFromTypeRecurse = getItemCountFromTypeRecurse
local getText = getText

local MoreBuildPlus = {}
MoreBuildPlus.NAME = 'More Builds Plus'
MoreBuildPlus.AUTHOR = 'ProjectSky, SiderisAnon'
MoreBuildPlus.VERSION = '1.1.8a'

print('Mod Loaded: ' .. MoreBuildPlus.NAME .. ' by ' .. MoreBuildPlus.AUTHOR .. ' (v' .. MoreBuildPlus.VERSION .. ')')

MoreBuildPlus.neededMaterials = {}
MoreBuildPlus.neededTools = {}
MoreBuildPlus.toolsList = {}
MoreBuildPlus.playerSkills = {}
MoreBuildPlus.textSkillsRed = {}
MoreBuildPlus.textSkillsGreen = {}
MoreBuildPlus.playerCanPlaster = false
MoreBuildPlus.textTooltipHeader = ' <RGB:2,2,2> <LINE> <LINE>' .. getText('Tooltip_craft_Needs') .. ' : <LINE> '
MoreBuildPlus.textCanRotate = '<LINE> <RGB:1,1,1>' .. getText('Tooltip_craft_pressToRotate', Keyboard.getKeyName(getCore():getKey('Rotate building')))
MoreBuildPlus.textPlasterRed = '<RGB:1,0,0> <LINE> <LINE>' .. getText('Tooltip_PlasterRed_Description')
MoreBuildPlus.textPlasterGreen = '<RGB:1,1,1> <LINE> <LINE>' .. getText('Tooltip_PlasterGreen_Description')
MoreBuildPlus.textPlasterNever = '<RGB:1,0,0> <LINE> <LINE>' .. getText('Tooltip_PlasterNever_Description')

MoreBuildPlus.textWallDescription = getText('Tooltip_Wall_Description')
MoreBuildPlus.textPillarDescription = getText('Tooltip_Pillar_Description')
MoreBuildPlus.textDoorFrameDescription = getText('Tooltip_DoorFrame_Description')
MoreBuildPlus.textWindowFrameDescription = getText('Tooltip_WindowFrame_Description')
MoreBuildPlus.textFenceDescription = getText('Tooltip_Fence_Description')
MoreBuildPlus.textFencePostDescription = getText('Tooltip_FencePost_Description')
MoreBuildPlus.textDoorGenericDescription = getText('Tooltip_craft_woodenDoorDesc')
MoreBuildPlus.textDoorIndustrial = getText('Tooltip_DoorIndustrial_Description')
MoreBuildPlus.textDoorExterior = getText('Tooltip_DoorExterior_Description')
MoreBuildPlus.textStairsDescription = getText('Tooltip_craft_stairsDesc')
MoreBuildPlus.textFloorDescription = getText('Tooltip_Floor_Description')
MoreBuildPlus.textBarElementDescription = getText('Tooltip_BarElement_Description')
MoreBuildPlus.textBarCornerDescription = getText('Tooltip_BarCorner_Description')
MoreBuildPlus.textTrashCanDescription = getText('Tooltip_TrashCan_Description')
MoreBuildPlus.textLightPoleDescription = getText('Tooltip_LightPole_Description')
MoreBuildPlus.textSmallTableDescription = getText('Tooltip_SmallTable_Description')
MoreBuildPlus.textLargeTableDescription = getText('Tooltip_LargeTable_Description')
MoreBuildPlus.textCouchFrontDescription = getText('Tooltip_CouchFront_Description')
MoreBuildPlus.textCouchRearDescription = getText('Tooltip_CouchRear_Description')
MoreBuildPlus.textDresserDescription = getText('Tooltip_Dresser_Description')
MoreBuildPlus.textBedDescription = getText('Tooltip_Bed_Description')
MoreBuildPlus.textFlowerBedDescription = getText('Tooltip_FlowerBed_Description')

--- ??????????????????
--- ????????????????????????????????? [??????] {??????1, ??????2, ...}
MoreBuildPlus.toolsList['Hammer'] = {'Base.Hammer', 'Base.HammerStone', 'Base.BallPeenHammer', 'Base.WoodenMallet', 'Base.ClubHammer'}
MoreBuildPlus.toolsList['Screwdriver'] = {'Base.Screwdriver'}
MoreBuildPlus.toolsList['HandShovel'] = {'farming.HandShovel'}
MoreBuildPlus.toolsList['Saw'] = {'Base.Saw'}
MoreBuildPlus.toolsList['Shovel'] = {'Base.Shovel', 'Base.Shovel2'}
MoreBuildPlus.toolsList['BlowTorch'] = {'Base.BlowTorch'}

--- ????????????????????????
--- @todo: ????????????
MoreBuildPlus.skillLevel = {
  simpleObject = 1,
  waterwellObject = 11,
  simpleDecoration = 1,
  landscaping = 1,
  lighting = 4,
  simpleContainer = 3,
  complexContainer = 5,
  advancedContainer = 7,
  simpleFurniture = 3,
  basicContainer = 1,
  basicFurniture = 1,
  moderateFurniture = 2,
  counterFurniture = 3,
  complexFurniture = 4,
  logObject = 0,
  floorObject = 4,
  wallObject = 7,
  doorObject = 3,
  garageDoorObject = 7,
  stairsObject = 7,
  stoneArchitecture = 5,
  metalArchitecture = 5,
  architecture = 5,
  complexArchitecture = 5,
  nearlyimpossible = 5,
  barbecueObject = 4,
  fridgeObject = 3,
  lightingObject = 2,
  generatorObject = 11,
  windowsObject = 4,
}

--- ??????????????????
--- @todo: ????????????
MoreBuildPlus.healthLevel = {
  stoneWall = 300,
  metalWall = 700,
  metalStairs = 400,
  woodContainer = 200,
  stoneContainer = 250,
  metalContainer = 350,
  wallDecoration = 50,
  woodenFence = 100,
  metalDoor = 700
}

--- ??????????????????
MoreBuildPlus.AccessLevel = {
  None = 1,
  Observer = 2,
  GM = 3,
  Overseer = 4,
  Moderator = 5,
  Admin = 6
}

--- OnFillWorldObjectContextMenu??????
--- @param player number: IsoPlayer??????
--- @param context ISContextMenu: ?????????????????????
--- @param worldobjects table: ???????????????
--- @param test boolean: ????????????????????????????????????true, ????????????false
--- @todo ????????????, ISContextMenu????????????, ?????????, ??????300+ISContextMenu????????????????????????????????????0.24?????????, ?????????????????????????????????, ??????????????????
MoreBuildPlus.OnFillWorldObjectContextMenu = function(player, context, worldobjects, test)
  if getCore():getGameMode() == 'LastStand' then
    return
  end

  if test and ISWorldObjectContextMenu.Test then
    return true
  end

  local playerObj = getSpecificPlayer(player)
  if playerObj:getVehicle() then
    return
  end

  if MoreBuildPlus.checkPermission(playerObj) then return end

  local inv = playerObj:getInventory()

  if MoreBuildPlus.haveAToolToBuild(inv) then

    MoreBuildPlus.buildSkillsList(playerObj)

    if MoreBuildPlus.playerSkills["Woodwork"] > 6 or ISBuildMenu.cheat then
      MoreBuildPlus.playerCanPlaster = true
    else
      MoreBuildPlus.playerCanPlaster = false
    end
	-----------------------------------------------------------------------------------------------------------------
	local _firstTierMenu = context:addOption(getText('More Buildings+'))
    local _secondTierMenu = ISContextMenu:getNew(context)
    context:addSubMenu(_firstTierMenu, _secondTierMenu)

	local _architectureOption = _secondTierMenu:addOption(getText("Fancy Walls"))
    local _architectureThirdTierMenu = _secondTierMenu:getNew(_secondTierMenu)
    context:addSubMenu(_architectureOption, _architectureThirdTierMenu)

	local _wallsOption = _architectureThirdTierMenu:addOption(getText("Interior"))
    local _wallsSubMenu = _architectureThirdTierMenu:getNew(_architectureThirdTierMenu)

    context:addSubMenu(_wallsOption, _wallsSubMenu)
    MoreBuildPlus.wallsPlusMenuBuilder(_wallsSubMenu, player, context)

	local _wallsOption = _architectureThirdTierMenu:addOption(getText("Windows & DoorFrames"))
    local _wallsSubMenu = _architectureThirdTierMenu:getNew(_architectureThirdTierMenu)

    context:addSubMenu(_wallsOption, _wallsSubMenu)
    MoreBuildPlus.windowsPlusMenuBuilder(_wallsSubMenu, player, context)

	local _wallsOption = _architectureThirdTierMenu:addOption(getText("Pillars"))
    local _wallsSubMenu = _architectureThirdTierMenu:getNew(_architectureThirdTierMenu)

    context:addSubMenu(_wallsOption, _wallsSubMenu)
    MoreBuildPlus.pillarsPlusMenuBuilder(_wallsSubMenu, player, context)

	local _wallsOption = _architectureThirdTierMenu:addOption(getText("Exterior"))
    local _wallsSubMenu = _architectureThirdTierMenu:getNew(_architectureThirdTierMenu)

    context:addSubMenu(_wallsOption, _wallsSubMenu)
    MoreBuildPlus.wallsPlusExteriorMenuBuilder(_wallsSubMenu, player, context)

	local _wallsOption = _architectureThirdTierMenu:addOption(getText("Windows & DoorFrames"))
    local _wallsSubMenu = _architectureThirdTierMenu:getNew(_architectureThirdTierMenu)

    context:addSubMenu(_wallsOption, _wallsSubMenu)
    MoreBuildPlus.WindowsPlusExteriorMenuBuilder(_wallsSubMenu, player, context)

	local _wallsOption = _architectureThirdTierMenu:addOption(getText("Pillars"))
    local _wallsSubMenu = _architectureThirdTierMenu:getNew(_architectureThirdTierMenu)

    context:addSubMenu(_wallsOption, _wallsSubMenu)
    MoreBuildPlus.pillarsPlusExteriorMenuBuilder(_wallsSubMenu, player, context)

	local _architectureOption = _secondTierMenu:addOption(getText("Garage Walls"))
    local _architectureThirdTierMenu = _secondTierMenu:getNew(_secondTierMenu)
    context:addSubMenu(_architectureOption, _architectureThirdTierMenu)

	local _wallsOption = _architectureThirdTierMenu:addOption(getText("Walls"))
    local _wallsSubMenu = _architectureThirdTierMenu:getNew(_architectureThirdTierMenu)

    context:addSubMenu(_wallsOption, _wallsSubMenu)
    MoreBuildPlus.wallsGaragePlusMenuBuilder(_wallsSubMenu, player, context)

	local _wallsOption = _architectureThirdTierMenu:addOption(getText("Windows & DoorFrames"))
    local _wallsSubMenu = _architectureThirdTierMenu:getNew(_architectureThirdTierMenu)

    context:addSubMenu(_wallsOption, _wallsSubMenu)
    MoreBuildPlus.windowsGaragePlusMenuBuilder(_wallsSubMenu, player, context)

	local _wallsOption = _architectureThirdTierMenu:addOption(getText("Pillars"))
    local _wallsSubMenu = _architectureThirdTierMenu:getNew(_architectureThirdTierMenu)

    context:addSubMenu(_wallsOption, _wallsSubMenu)
    MoreBuildPlus.pillarsGaragePlusMenuBuilder(_wallsSubMenu, player, context)

	local _architectureOption = _secondTierMenu:addOption(getText("Roofs"))
    local _architectureThirdTierMenu = _secondTierMenu:getNew(_secondTierMenu)
    context:addSubMenu(_architectureOption, _architectureThirdTierMenu)

	local _wallsOption = _architectureThirdTierMenu:addOption(getText("Brown Shingles"))
    local _wallsSubMenu = _architectureThirdTierMenu:getNew(_architectureThirdTierMenu)

    context:addSubMenu(_wallsOption, _wallsSubMenu)
    MoreBuildPlus.roofThreePlusMenuBuilder(_wallsSubMenu, player, context)

	local _wallsOption = _architectureThirdTierMenu:addOption(getText("Blue Shingles"))
    local _wallsSubMenu = _architectureThirdTierMenu:getNew(_architectureThirdTierMenu)

    context:addSubMenu(_wallsOption, _wallsSubMenu)
    MoreBuildPlus.roofOnePlusMenuBuilder(_wallsSubMenu, player, context)

	local _wallsOption = _architectureThirdTierMenu:addOption(getText("Gray Shingles"))
    local _wallsSubMenu = _architectureThirdTierMenu:getNew(_architectureThirdTierMenu)

    context:addSubMenu(_wallsOption, _wallsSubMenu)
    MoreBuildPlus.roofFivePlusMenuBuilder(_wallsSubMenu, player, context)

	local _wallsOption = _architectureThirdTierMenu:addOption(getText("Wooden"))
    local _wallsSubMenu = _architectureThirdTierMenu:getNew(_architectureThirdTierMenu)

    context:addSubMenu(_wallsOption, _wallsSubMenu)
    MoreBuildPlus.roofTwoPlusMenuBuilder(_wallsSubMenu, player, context)

	local _wallsOption = _architectureThirdTierMenu:addOption(getText("Corrugated Steel"))
    local _wallsSubMenu = _architectureThirdTierMenu:getNew(_architectureThirdTierMenu)

    context:addSubMenu(_wallsOption, _wallsSubMenu)
    MoreBuildPlus.roofFourPlusMenuBuilder(_wallsSubMenu, player, context)

	local _wallsOption = _architectureThirdTierMenu:addOption(getText("Glass"))
    local _wallsSubMenu = _architectureThirdTierMenu:getNew(_architectureThirdTierMenu)

    context:addSubMenu(_wallsOption, _wallsSubMenu)
    MoreBuildPlus.roofGlassPlusMenuBuilder(_wallsSubMenu, player, context)

	local _architectureOption = _secondTierMenu:addOption(getText("Roof Walls"))
    local _architectureThirdTierMenu = _secondTierMenu:getNew(_secondTierMenu)
    context:addSubMenu(_architectureOption, _architectureThirdTierMenu)


	local _wallsOption = _architectureThirdTierMenu:addOption(getText("Wood"))
    local _wallsSubMenu = _architectureThirdTierMenu:getNew(_architectureThirdTierMenu)

    context:addSubMenu(_wallsOption, _wallsSubMenu)
    MoreBuildPlus.wallsRoofMenuBuilder(_wallsSubMenu, player, context)

	local _wallsOption = _architectureThirdTierMenu:addOption(getText("Brown Panels"))
    local _wallsSubMenu = _architectureThirdTierMenu:getNew(_architectureThirdTierMenu)

    context:addSubMenu(_wallsOption, _wallsSubMenu)
    MoreBuildPlus.wallsRoof5MenuBuilder(_wallsSubMenu, player, context)

	local _wallsOption = _architectureThirdTierMenu:addOption(getText("White Panels"))
    local _wallsSubMenu = _architectureThirdTierMenu:getNew(_architectureThirdTierMenu)

    context:addSubMenu(_wallsOption, _wallsSubMenu)
    MoreBuildPlus.wallsRoof2MenuBuilder(_wallsSubMenu, player, context)

	local _wallsOption = _architectureThirdTierMenu:addOption(getText("Beige Panels"))
    local _wallsSubMenu = _architectureThirdTierMenu:getNew(_architectureThirdTierMenu)

    context:addSubMenu(_wallsOption, _wallsSubMenu)
    MoreBuildPlus.wallsRoof32MenuBuilder(_wallsSubMenu, player, context)

	local _wallsOption = _architectureThirdTierMenu:addOption(getText("Blue Panels"))
    local _wallsSubMenu = _architectureThirdTierMenu:getNew(_architectureThirdTierMenu)

    context:addSubMenu(_wallsOption, _wallsSubMenu)
    MoreBuildPlus.wallsRoof4MenuBuilder(_wallsSubMenu, player, context)

	local _wallsOption = _architectureThirdTierMenu:addOption(getText("Gray Stone"))
    local _wallsSubMenu = _architectureThirdTierMenu:getNew(_architectureThirdTierMenu)

    context:addSubMenu(_wallsOption, _wallsSubMenu)
    MoreBuildPlus.wallsRoof6MenuBuilder(_wallsSubMenu, player, context)


	local _wallsOption = _architectureThirdTierMenu:addOption(getText("Brick"))
    local _wallsSubMenu = _architectureThirdTierMenu:getNew(_architectureThirdTierMenu)

    context:addSubMenu(_wallsOption, _wallsSubMenu)
    MoreBuildPlus.wallRoofBrickMenuBuilder(_wallsSubMenu, player, context)

	local _architectureOption = _secondTierMenu:addOption(getText("Moulding"))
    local _architectureThirdTierMenu = _secondTierMenu:getNew(_secondTierMenu)
    context:addSubMenu(_architectureOption, _architectureThirdTierMenu)

	local _wallsOption = _architectureThirdTierMenu:addOption(getText("Wood Moulding"))
    local _wallsSubMenu = _architectureThirdTierMenu:getNew(_architectureThirdTierMenu)

    context:addSubMenu(_wallsOption, _wallsSubMenu)
    MoreBuildPlus.mouldingMenuBuilder(_wallsSubMenu, player, context)

	local _wallsOption = _architectureThirdTierMenu:addOption(getText("Stone Moulding"))
    local _wallsSubMenu = _architectureThirdTierMenu:getNew(_architectureThirdTierMenu)

    context:addSubMenu(_wallsOption, _wallsSubMenu)
    MoreBuildPlus.mouldingMetalMenuBuilder(_wallsSubMenu, player, context)

	local _architectureOption = _secondTierMenu:addOption(getText("Fencing / Railing"))
    local _architectureThirdTierMenu = _secondTierMenu:getNew(_secondTierMenu)
    context:addSubMenu(_architectureOption, _architectureThirdTierMenu)

	local _wallsOption = _architectureThirdTierMenu:addOption(getText("Railing 1"))
    local _wallsSubMenu = _architectureThirdTierMenu:getNew(_architectureThirdTierMenu)

    context:addSubMenu(_wallsOption, _wallsSubMenu)
    MoreBuildPlus.railingPlusMenuBuilder(_wallsSubMenu, player, context)

	local _wallsOption = _architectureThirdTierMenu:addOption(getText("Railing 2"))
    local _wallsSubMenu = _architectureThirdTierMenu:getNew(_architectureThirdTierMenu)

    context:addSubMenu(_wallsOption, _wallsSubMenu)
    MoreBuildPlus.railingPlusTwoMenuBuilder(_wallsSubMenu, player, context)

	local _wallsOption = _architectureThirdTierMenu:addOption(getText("Railing 3"))
    local _wallsSubMenu = _architectureThirdTierMenu:getNew(_architectureThirdTierMenu)

    context:addSubMenu(_wallsOption, _wallsSubMenu)
    MoreBuildPlus.railingPlusThreeMenuBuilder(_wallsSubMenu, player, context)

	local _wallsOption = _architectureThirdTierMenu:addOption(getText("Railing 4"))
    local _wallsSubMenu = _architectureThirdTierMenu:getNew(_architectureThirdTierMenu)

    context:addSubMenu(_wallsOption, _wallsSubMenu)
    MoreBuildPlus.railingPlusFourMenuBuilder(_wallsSubMenu, player, context)

	local _wallsOption = _architectureThirdTierMenu:addOption(getText("Exterior Railing"))
    local _wallsSubMenu = _architectureThirdTierMenu:getNew(_architectureThirdTierMenu)

	context:addSubMenu(_wallsOption, _wallsSubMenu)
    MoreBuildPlus.railingPlus5MenuBuilder(_wallsSubMenu, player, context)

	local _wallsOption = _architectureThirdTierMenu:addOption(getText("Fence"))
    local _wallsSubMenu = _architectureThirdTierMenu:getNew(_architectureThirdTierMenu)

    context:addSubMenu(_wallsOption, _wallsSubMenu)
    MoreBuildPlus.metalFenceMenuBuilder(_wallsSubMenu, player, context)

	local _wallsOption = _architectureThirdTierMenu:addOption(getText("Large Iron Gate"))
    local _wallsSubMenu = _architectureThirdTierMenu:getNew(_architectureThirdTierMenu)

    context:addSubMenu(_wallsOption, _wallsSubMenu)
    MoreBuildPlus.doubleDoorMetalPlusMenuBuilder(_wallsSubMenu, player, context)




	local _architectureOption = _secondTierMenu:addOption(getText("Other"))
    local _architectureThirdTierMenu = _secondTierMenu:getNew(_secondTierMenu)
    context:addSubMenu(_architectureOption, _architectureThirdTierMenu)


	local _wallsOption = _architectureThirdTierMenu:addOption(getText("Shower"))
    local _wallsSubMenu = _architectureThirdTierMenu:getNew(_architectureThirdTierMenu)

    context:addSubMenu(_wallsOption, _wallsSubMenu)
    MoreBuildPlus.ShowerPlusMenuBuilder(_wallsSubMenu, player, context)

	local _wallsOption = _architectureThirdTierMenu:addOption(getText("Large Windows "))
    local _wallsSubMenu = _architectureThirdTierMenu:getNew(_architectureThirdTierMenu)

    context:addSubMenu(_wallsOption, _wallsSubMenu)
    MoreBuildPlus.otherTwoPlusMenuBuilder(_wallsSubMenu, player, context)

	local _wallsOption = _architectureThirdTierMenu:addOption(getText("Large Window Frames"))
    local _wallsSubMenu = _architectureThirdTierMenu:getNew(_architectureThirdTierMenu)

    context:addSubMenu(_wallsOption, _wallsSubMenu)
    MoreBuildPlus.largeWindowFramePlusMenuBuilder(_wallsSubMenu, player, context)

	local _wallsOption = _architectureThirdTierMenu:addOption(getText("Exterior Window Trim"))
    local _wallsSubMenu = _architectureThirdTierMenu:getNew(_architectureThirdTierMenu)

    context:addSubMenu(_wallsOption, _wallsSubMenu)
    MoreBuildPlus.mouldingWindowMenuBuilder(_wallsSubMenu, player, context)

	local _wallsOption = _architectureThirdTierMenu:addOption(getText("Vines"))
    local _wallsSubMenu = _architectureThirdTierMenu:getNew(_architectureThirdTierMenu)

    context:addSubMenu(_wallsOption, _wallsSubMenu)
    MoreBuildPlus.plantsPlusPlusMenuBuilder(_wallsSubMenu, player, context)

	local _wallsOption = _architectureThirdTierMenu:addOption(getText("Military Tent Walls"))
    local _wallsSubMenu = _architectureThirdTierMenu:getNew(_architectureThirdTierMenu)

    context:addSubMenu(_wallsOption, _wallsSubMenu)
    MoreBuildPlus.militaryTentWallsMenuBuilder(_wallsSubMenu, player, context)

	local _wallsOption = _architectureThirdTierMenu:addOption(getText("Military Tent Roofs"))
    local _wallsSubMenu = _architectureThirdTierMenu:getNew(_architectureThirdTierMenu)

    context:addSubMenu(_wallsOption, _wallsSubMenu)
    MoreBuildPlus.militaryTentRoofsMenuBuilder(_wallsSubMenu, player, context)

	local _wallsOption = _architectureThirdTierMenu:addOption(getText("Military Tent Detailing"))
    local _wallsSubMenu = _architectureThirdTierMenu:getNew(_architectureThirdTierMenu)

    context:addSubMenu(_wallsOption, _wallsSubMenu)
    MoreBuildPlus.militaryTentFlapsMenuBuilder(_wallsSubMenu, player, context)

	local _wallsOption = _architectureThirdTierMenu:addOption(getText("SandBag"))
    local _wallsSubMenu = _architectureThirdTierMenu:getNew(_architectureThirdTierMenu)

    context:addSubMenu(_wallsOption, _wallsSubMenu)
    MoreBuildPlus.SandbagPLusMenuBuilder(_wallsSubMenu, player, context)

	local _wallsOption = _architectureThirdTierMenu:addOption(getText("Exterior Detailing"))
    local _wallsSubMenu = _architectureThirdTierMenu:getNew(_architectureThirdTierMenu)

    context:addSubMenu(_wallsOption, _wallsSubMenu)
    MoreBuildPlus.otherPlusMenuBuilder(_wallsSubMenu, player, context)

	local _wallsOption = _architectureThirdTierMenu:addOption(getText("Second Floor Roof Test"))
    local _wallsSubMenu = _architectureThirdTierMenu:getNew(_architectureThirdTierMenu)

    context:addSubMenu(_wallsOption, _wallsSubMenu)
    MoreBuildPlus.roofTestMenuBuilder(_wallsSubMenu, player, context)




  end
end

--- ????????????????????????
--- @param item string: ????????????????????????
--- @return boolean: ???????????????????????????true, ????????????false
local function predicateNotBroken(item)
  return not item:isBroken()
end

--- ???????????????????????????????????????
--- @param sprite string: Sprite??????
--- @return string: ???????????????????????????
MoreBuildPlus.getMoveableDisplayName = function(sprite)
  local props = getSprite(sprite):getProperties()
  if props:Is('CustomName') then
    local name = props:Val('CustomName')
    if props:Is('GroupName') then
      name = props:Val('GroupName') .. ' ' .. name
    end
    return getMoveableDisplayName(name)
  end
end

--- ????????????????????????????????????
--- @param inv ItemContainer: ??????ItemContainer??????
--- @return boolean: ???????????????????????????????????????true????????????false
MoreBuildPlus.haveAToolToBuild = function(inv)
  local havaTools = nil

  havaTools = MoreBuildPlus.getAvailableTools(inv, 'Hammer')

  return havaTools or ISBuildMenu.cheat
end

--- ????????????????????????, ???????????????????????????
--- @param player IsoPlayer: IsoPlayer??????
--- @return boolean: ????????????????????????true????????????false
MoreBuildPlus.checkPermission = function(player)
  local level = player:getAccessLevel()
  local permission = SandboxVars.MoreBuildPluss.BuildingPermission
  return isClient() and not ISBuildMenu.cheat and MoreBuildPlus.AccessLevel[level] < permission
end

--- ????????????????????????????????????
--- @param inv ItemContainer: ??????ItemContainer??????
--- @param tool string: ????????????
--- @return InventoryItem: ?????????????????????, ????????????????????????nil
MoreBuildPlus.getAvailableTools = function(inv, tool)
  local tools = nil
  local toolList = MoreBuildPlus.toolsList[tool]
  for _, type in pairs (toolList) do
    tools = inv:getFirstTypeEval(type, predicateNotBroken)
    if tools then
      return tools
    end
  end
end

--- ??????????????????
--- @param object IsoObject: IsoObject??????
--- @param player number: IsoPlayer??????
--- @param tool string: ????????????
MoreBuildPlus.equipToolPrimary = function(object, player, tool)
  local tools = nil
  local inv = getSpecificPlayer(player):getInventory()
  tools = MoreBuildPlus.getAvailableTools(inv, tool)
  if tools then
    ISInventoryPaneContextMenu.equipWeapon(tools, true, false, player)
    object.noNeedHammer = true
  end
end

--- ??????????????????
--- @param object Isoobject: Isoobject??????
--- @param player number: IsoPlayer??????
--- @param tool string: ????????????
--- @info ?????????
MoreBuildPlus.equipToolSecondary = function(object, player, tool)
  local tools = nil
  local inv = getSpecificPlayer(player):getInventory()
  tools = MoreBuildPlus.getAvailableTools(inv, tool)
  if tools then
    ISInventoryPaneContextMenu.equipWeapon(tools, false, false, player)
  end
end

--- ??????????????????
--- @param player IsoPlayer: IsoPlayer??????
MoreBuildPlus.buildSkillsList = function(player)
  local perks = PerkFactory.PerkList
  local perkID = nil
  local perkType = nil
  for i = 0, perks:size() - 1 do
    perkID = perks:get(i):getId()
    perkType = perks:get(i):getType()
    MoreBuildPlus.playerSkills[perkID] = player:getPerkLevel(perks:get(i))
    MoreBuildPlus.textSkillsRed[perkID] = ' <RGB:1,0,0>' .. PerkFactory.getPerkName(perkType) .. ' ' .. MoreBuildPlus.playerSkills[perkID] .. '/'
    MoreBuildPlus.textSkillsGreen[perkID] = ' <RGB:1,1,1>' .. PerkFactory.getPerkName(perkType) .. ' '
  end
end

--- ??????&????????????????????????
--- @param inv ItemContainer: ??????ItemContainer??????
--- @param material string: ????????????
--- @param amount number: ?????????????????????
--- @param tooltip ISToolTip: ??????????????????
--- @return boolean: ?????????????????????????????????true????????????false
--- @info ISBuildMenu.countMaterial????????????, ??????????????????????????????????????????????????????, ???????????????
MoreBuildPlus.tooltipCheckForMaterial = function(inv, material, amount, tooltip)
  local type = split(material, '\\.')[2]
  local invItemCount = 0
  local groundItem = ISBuildMenu.materialOnGround
  if amount > 0 then
    invItemCount = inv:getItemCountFromTypeRecurse(material)

    if material == "Base.Nails" then
      invItemCount = invItemCount + inv:getItemCountFromTypeRecurse("Base.NailsBox") * 100
      if groundItem["Base.NailsBox"] then
        invItemCount = invItemCount + groundItem["Base.NailsBox"] * 100
      end
    end

    -- ISBuildUtil not support boxed screws, later solve it
    --[[
    if material == "Base.Screws" then
      invItemCount = invItemCount + inv:getItemCountFromTypeRecurse("Base.ScrewsBox") * 100
      if groundItem["Base.ScrewsBox"] then
        invItemCount = invItemCount + groundItem["Base.ScrewsBox"] * 100
      end
    end
    --]]

    -- why #groundItem 0?
    for groundItemType, groundItemCount in pairs(groundItem) do
      if groundItemType == type then
        invItemCount = invItemCount + groundItemCount
      end
    end

    if invItemCount < amount then
      tooltip.description = tooltip.description .. ' <RGB:1,0,0>' .. getItemNameFromFullType(material) .. ' ' .. invItemCount .. '/' .. amount .. ' <LINE>'
      return false
    else
      tooltip.description = tooltip.description .. ' <RGB:1,1,1>' .. getItemNameFromFullType(material) .. ' ' .. invItemCount .. '/' .. amount .. ' <LINE>'
      return true
    end
  end
end

--- ??????&????????????????????????
--- @param inv ItemContainer: ??????ItemContainer??????
--- @param tool string: ????????????
--- @param tooltip ISToolTip: ??????????????????
--- @return boolean: ?????????????????????????????????true????????????false
MoreBuildPlus.tooltipCheckForTool = function(inv, tool, tooltip)
  local tools = MoreBuildPlus.getAvailableTools(inv, tool)
  if tools then
    tooltip.description = tooltip.description .. ' <RGB:1,1,1>' .. tools:getName() .. ' <LINE>'
    return true
  else
    for _, type in pairs (MoreBuildPlus.toolsList[tool]) do
      tooltip.description = tooltip.description .. ' <RGB:1,0,0>' .. getItemNameFromFullType(type) .. ' <LINE>'
      return false
    end
  end
end

--- ??????????????????????????????
--- @param skills table: ?????????????????????, ?????????????????? {Woodwork = 1, Strength = 2, ...}
--- @param option ISContextMenu: ?????????????????????
--- @return ISToolTip: ????????????????????????
MoreBuildPlus.canBuildObject = function(skills, option, player)
  local _tooltip = ISToolTip:new()
  _tooltip:initialise()
  _tooltip:setVisible(false)
  option.toolTip = _tooltip

  local inv = getSpecificPlayer(player):getInventory()

  local _canBuildResult = true

  _tooltip.description = MoreBuildPlus.textTooltipHeader

  local _currentResult = true

  for _, _currentMaterial in pairs(MoreBuildPlus.neededMaterials) do
    if _currentMaterial['Material'] and _currentMaterial['Amount'] then
      _currentResult = MoreBuildPlus.tooltipCheckForMaterial(inv, _currentMaterial['Material'], _currentMaterial['Amount'], _tooltip)
    else
      _tooltip.description = _tooltip.description .. ' <RGB:1,0,0> Error in required material definition. <LINE>'
      _canBuildResult = false
    end

    if not _currentResult then
      _canBuildResult = false
    end
  end

  for _, _currentTool in pairs(MoreBuildPlus.neededTools) do
    _currentResult = MoreBuildPlus.tooltipCheckForTool(inv, _currentTool, _tooltip)

    if not _currentResult then
      _canBuildResult = false
    end
  end

  for skill, level in pairs (skills) do
    if (MoreBuildPlus.playerSkills[skill] < level) then
      _tooltip.description = _tooltip.description .. MoreBuildPlus.textSkillsRed[skill]
      _canBuildResult = false
    else
      _tooltip.description = _tooltip.description .. MoreBuildPlus.textSkillsGreen[skill]
    end
    _tooltip.description = _tooltip.description .. level .. ' <LINE>'
  end

  if not _canBuildResult and not ISBuildMenu.cheat then
    option.onSelect = nil
    option.notAvailable = true
  end
  return _tooltip
end

--- ??????MoreBuildPlus??????
--- @return table: MoreBuildPlus table
function getMoreBuildPlusInstance()
  return MoreBuildPlus
end

--- ??????OnFillWorldObjectContextMenu??????
-- @callback1 player number: ?????????IsoPlayer??????
-- @callback2 context ISContextMenu: ?????????????????????
-- @callback3 worldobjects table: ???????????????
-- @callback4 test Boolean: ????????????????????????????????????true, ????????????false
Events.OnFillWorldObjectContextMenu.Add(MoreBuildPlus.OnFillWorldObjectContextMenu)
