--***********************************************************
--**                    ROBERT JOHNSON                     **
--***********************************************************

ISWoodenWindow = ISBuildingObject:derive("ISWoodenWindow");

--************************************************************************--
--** ISWoodenWindow:new
--**
--************************************************************************--
function ISWoodenWindow:create(x, y, z, north, sprite)
	local cell = getWorld():getCell();
	self.sq = cell:getGridSquare(x, y, z);
	local openSprite = self.openSprite;
	if north then
		openSprite = self.openNorthSprite;
	end
	self.javaObject = IsoWindow.new(cell, self.sq, sprite, openSprite, north, self);
	buildUtil.setInfo(self.javaObject, self);
	local consumedItems = buildUtil.consumeMaterial(self);
	-- the wooden wall have 200 base health + 100 per carpentry lvl
	--self.javaObject:setMaxHealth(self:getHealth());
	--self.javaObject:setHealth(self.javaObject:getMaxHealth());
	-- the sound that will be played when our door will be broken
	--self.javaObject:setBreakSound("BreakWindow");
	-- add the item to the ground
    self.sq:AddSpecialObject(self.javaObject);

	self.javaObject:transmitCompleteItemToServer();
end

function ISWoodenWindow:new(sprite, northSprite, openSprite, openNorthSprite)
	local o = {};
	setmetatable(o, self);
	self.__index = self;
	o:init();
	o:setSprite(sprite);
	o:setNorthSprite(northSprite);
	o.openSprite = openSprite;
	o.openNorthSprite = openNorthSprite;
	o.isWindow = true;
	o.thumpDmg = 5;
	o.name = "Wooden Window";
	return o;
end

-- return the health of the new wall, it's 300 + 100 per carpentry lvl
function ISWoodenWindow:getHealth()
	return 300 + buildUtil.getWoodHealth(self);
end

-- the door can be placed only if it's on a door frame
function ISWoodenWindow:isValid(square)
	if not self:haveMaterial(square) then return false end
	if not square:isFreeOrMidair(false) or not square:hasFloor(self.north) then return false end
	if square:isVehicleIntersecting() then return false end
	local hasFrame = false
	local hasWindow = false
	for i = 0, square:getSpecialObjects():size() - 1 do
		local item = square:getSpecialObjects():get(i);
		if instanceof(item, "IsoThumpable") and item.hoppable == true and item:getNorth() == self.north then
			hasFrame = true
		end
		if instanceof(item, "IsoThumpable") and item:isWindow() and item:getNorth() == self.north then
			hasWindow = true
		end
	end
	for i=0,square:getObjects():size()-1 do
		local o = square:getObjects():get(i)
		if instanceof(o, 'IsoObject') then
			if self.north and o:getType() == IsoObjectType.windowN then
				hasFrame = true
			end
			if not self.north and o:getType() == IsoObjectType.windowW then
				hasFrame = true
			end
			local sprite = o:getSprite()
			if self.north and sprite and sprite:getProperties():Is("WindowN") then
				hasFrame = true
			end
			if not self.north and sprite and sprite:getProperties():Is("WindowW") then
				hasFrame = true
			end
		end
		if instanceof(o, 'IsoWindow') and o:getNorth() == self.north then
			hasWindow = true
		end
	end

    if self.dontNeedFrame then return not hasWindow; end
	return hasFrame and not hasWindow
end

-- used to render more tile for example
function ISWoodenWindow:render(x, y, z, square)
	ISBuildingObject.render(self, x, y, z, square)
end
