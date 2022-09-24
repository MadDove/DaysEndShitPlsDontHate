require 'Foraging/ISForageAction'

function ISForageAction:forage()
	forageSystem.doFatiguePenalty(self.character);
	forageSystem.doEndurancePenalty(self.character);
	forageSystem.giveItemXP(self.character, self.itemDef, 0.75);
	--
	-- add the items to player inventory
	-- these items are generated when the icon is first spotted in self.forageIcon.itemList
	local itemsAdded = forageSystem.addOrDropItems(self.character, self.targetContainer, self.forageIcon.itemList, self.discardItems);
	local itemsTable = {};
	for i = 0, itemsAdded:size() - 1 do
		local item = itemsAdded:get(i);
		if not itemsTable[item:getFullType()] then itemsTable[item:getFullType()] = {item = item, count = 0}; end;
		itemsTable[item:getFullType()].count = itemsTable[item:getFullType()].count + 1;
	end;
	--
	--create the halo note, injecting the item image
	--TODO: this requires item images to be in media/textures - should get the image location from the texture here instead
	local itemTexture;
	for _, itemData in pairs(itemsTable) do
		local item = itemData.item;
		local count = itemData.count;
		if getTexture(item:getTexture():getName()) then
			itemTexture = "[img="..tostring(item:getTexture():getName()).."]";
		end
		if not self.discardItems then
			table.insert(self.manager.haloNotes,itemTexture.."    "..count.. " "..item:getDisplayName());
		end;
	end;
end