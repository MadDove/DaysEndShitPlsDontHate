require "Coolers"

function CoolerChecks(player)
	--wait for players to put something into an insulated container, or to come into contact with a new one.
	--look on floor for containers
	player_floor = ISInventoryPage.GetFloorContainer(player:getPlayerNum()):getItems()
	for i=0,player_floor:size()-1 do
		local item = player_floor:get(i)
		if InsulatedContainers[item:getType()] ~= nil then
			if item:getItemContainer():getItems():size() > 0 then
				local coolerid = tostring(item)
				if Coolers[coolerid] == nil then
					local avgtemp = getAvgTemp(item:getItemContainer():getItems()) 
					if avgtemp ~= 0 and (math.abs(1-avgtemp) > 0.1) then
						--its an insulated container and theres an item in it with some energy to store.
						--print("adding cooler "..coolerid)
						Coolers[coolerid] = {
							item=item,
							lastCheck=getGameTime():getMinutes(),
							lastSize=item:getItemContainer():getItems():size()
						}
					end
				end
			end
		end
	end
	--look in player inventory for containers
	player_inventory = player:getInventory():getItems()
	for pi=0,player_inventory:size()-1 do
		local item = player_inventory:get(pi)
		if InsulatedContainers[item:getType()] ~= nil then
			if item:getItemContainer():getItems():size() > 0 then
				local coolerid = tostring(item)
				if Coolers[coolerid] == nil then
					--print(tostring(getAvgTemp(item:getItemContainer():getItems())))
					local avgtemp = getAvgTemp(item:getItemContainer():getItems()) 
					if avgtemp ~= 0 and (math.abs(1-avgtemp) > 0.1) then
						--its an insulated container and theres an item in it.
						--print("adding cooler "..coolerid)
						Coolers[coolerid] = {
							item=item,
							lastCheck=getGameTime():getMinutes(),
							lastSize=item:getItemContainer():getItems():size()
						}
					end
				end
			end
		end
	end
end

function getAvgTemp(items)
	local total_items = 0;
	local total_heat = 0.0;
	for i=0,items:size()-1 do
		local item = items:get(i)
		if item:getCategory() == "Food" then
			total_heat=total_heat+item:getHeat()
		else
			total_heat=total_heat+1
		end
		total_items=total_items+1
	end
	return total_heat/total_items
end

function tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end

Events.OnPlayerUpdate.Add(CoolerChecks)