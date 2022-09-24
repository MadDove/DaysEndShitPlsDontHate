--How well items are insulated. (The rate of engery exchange)
InsulatedContainers = {
	Cooler = 0.0001,
	RedCooler = 0.0001,
	Bag_InsulatedPack = 0.0001,
	OrganCooler = 0.0001,
	Lunchbox = 0.0003,
	Lunchbox2 = 0.0003,
	FiendLunchbox = 0.0003,
	FlashLunchbox = 0.0003,
	BatmanLunchbox = 0.0003,
	DinoLunchbox = 0.0003,
	NightmareLunchbox = 0.0003,
	GargoylesLunchbox = 0.0003,
	MermaidLunchbox = 0.0003,
	RainbowLunchbox = 0.0003,
	SpiffoLunchbox = 0.0003,
	SpideyLunchbox = 0.0003,
	XMenLunchbox = 0.0003,
}

InsulatedCups = {
	Thermus = 0.001,
}

--the aging adjustment divider
local CoolerAge = 0 + SandboxVars['FridgeFactor']

--convert fridgefactor to a less harsh divider.
if CoolerAge == 1 then CoolerAge = 4 -- at "very low" atleast offer _some_ aging relief.
elseif CoolerAge == 2 then CoolerAge = 3
elseif CoolerAge == 3 then CoolerAge = 2
elseif CoolerAge == 4 then CoolerAge = 1.7
elseif CoolerAge == 5 then CoolerAge = 1.2 end

--these items exchange engergy slower, thus keeping averages overall higher, for longer.
SpecialCools = {
	LargeIcePack = {conservation=6, unfreezeRate=0.1},
	SmallIcePack = {conservation=4, unfreezeRate=0.3}
}

Coolers={}

Thermus={}

function CheckHeat()
	for ci,coolerData in pairs(Coolers) do
		local total_heat=0.0
		local total_items=0
		local cooler = coolerData.item
		if cooler == nil then
			Coolers[ci]=nil
		end
		if cooler:getContainer() == nil then
			--cooler is no longer in any inventory.
			Coolers[ci] = nil; -- dont process this cooler any more.
			return
		end
		for i=0,cooler:getItemContainer():getItems():size()-1 do
			local item = cooler:getItemContainer():getItems():get(i)
			total_items=total_items+1
			if item:getCategory() == "Food" then
				total_heat=total_heat+item:getHeat()
			else
				total_heat=total_heat+1
			end
		end
		if total_items > 0 then
			--set the container tempterature to the average of all the items inside.
			-- 1 = room tmep ... 0.25 = fridge temp .. 
			local ctemp = (coolerData.temp == nil and 1 or coolerData.temp)
			local averageTemp = joes_round(total_heat / total_items,4);
			local tempAdjust = InsulatedContainers[cooler:getType()]
			local minute = getGameTime():getMinutes()
			local difference = math.abs(ctemp - averageTemp)
			local offset = math.abs(1-averageTemp)
			--is the cooler a different temp than the contents?
			if ctemp == 1 and (offset > 0.01) then
				--first time we've adjusted temp.
				coolerData.temp=averageTemp -- we use this temp to step the heat of the contents.
				ctemp=averageTemp
				setContentsHeat(cooler,coolerData,false)
			elseif difference >= 0.11 then
				--print("Big change ... adjusting")
				if ctemp > averageTemp then newtemp = ctemp - (difference / 4)
				elseif ctemp < averageTemp then newtemp = ctemp + (difference / 4)
				else newtemp = ctemp end
				coolerData.temp=joes_round(newtemp,4) -- step the temp torward the average
				setContentsHeat(cooler,coolerData,false)
			elseif ctemp ~= 1 and offset > 0.1 and coolerData.lastCheck ~= minute then
				coolerData.lastCheck = minute
				--now check every minute
				--print(tostring(minute).." @ "..tostring(ctemp).." :: "..tostring(averageTemp).." :: "..tostring(tempAdjust))
				local newtemp=0
				if ctemp > 1 then newtemp=averageTemp-tempAdjust
				elseif ctemp < 1 then newtemp=averageTemp+tempAdjust
				else ctemp=1 end
				coolerData.temp=joes_round(newtemp,4) -- step the temp torward the average
				setContentsHeat(cooler,coolerData,true)
			elseif math.abs(ctemp - 1) < 0.01 then
				--we've run out of energy to store
				coolerData.temp=1
				setRoomTemp(cooler)
				cooler:getModData().coolerid = nil
				Coolers[ci] = nil; -- dont process this cooler any more.
			else
				--keep the contents heat updated but dont fiddle with the age.
				setContentsHeat(cooler,coolerData,false)
			end
		else
			--theres nothing inside.
			coolerData.temp=1
			setRoomTemp(cooler)
			cooler:getModData().coolerid = nil
			--print("removing cooler -- size")
			Coolers[ci] = nil; -- dont process this cooler any more.
		end
	end
end
Events.EveryOneMinute.Add(CheckHeat)

function setContentsHeat(cooler,coolerData,doAging)
	local temp = coolerData.temp == nil and 1 or coolerData.temp
	for i=0,cooler:getItemContainer():getItems():size()-1 do
		local item = cooler:getItemContainer():getItems():get(i)
		if item:getCategory() == "Food" then
			--step torward the average.
			local item_temp = item:getHeat()
			local splitter = 3 -- standard multiple of heat/cold loss
			if SpecialCools[item:getType()] ~= nil and temp < 1 then -- only applies when the temp is cold. (for now)
				--item is special type, so it loses heat slower.
				splitter=SpecialCools[item:getType()].conservation
				if item:isFrozen() or item:getFreezingTime()>0 then splitter = splitter*1.5 end --even slower when frozen.
			elseif item:isFrozen() and SpecialCools[item:getType()] == nil then 
				splitter = splitter *1.2 -- normal frozen items still lose heat slower.
			end
			if item:getModData().lastCheck ~= getGameTime():getMinutes() and (item:isFrozen() or item:getFreezingTime()>0) then
				item:setFreezingTime(item:getFreezingTime()+(SpecialCools[item:getType()] == nil and 0.25 or (1-SpecialCools[item:getType()].unfreezeRate)))
				item:getModData().lastCheck = getGameTime():getMinutes()
				item:setLastAged(getGameTime():getWorldAgeHours())
			end
			-- slow item aging - only applies to cold items.
			if item_temp < 1 and doAging and SpecialCools[item:getType()] == nil and item:getModData().lastCheck ~= getGameTime():getMinutes() then
				local itemAge = item:getAge()
				local lastAge = item:getModData().lastAge ~= nil and item:getModData().lastAge or itemAge
				if itemAge ~= lastAge then
					--age has changed...adjust the change.
					local newAge = itemAge - (math.abs(itemAge - lastAge) / CoolerAge)
					if newAge > lastAge then
						item:setAge(newAge)
						item:setLastAged(getGameTime():getWorldAgeHours())
						item:getModData().lastAge=newAge
						--print("AGED :: "..tostring(newAge))
					end
				end
				item:getModData().lastCheck = getGameTime():getMinutes()
				item:getModData().lastAge=itemAge
				item:updateAge() -- this keeps the item aging when no one is "looking" at it.
			end
			if temp > 1.6 then temp = 1.5 end -- any higher and you're cooking food.
			if temp < 0.20 then temp = 0.20 end -- nothing needs to be this cold.
			if item_temp < 0.20 then item_temp = 0.20 end -- nothing needs to be this cold.
			if item:getCategory() == "Food" and (item:isFrozen() or item:getFreezingTime()>0) and item_temp > 0.35 then item_temp=0.35-((item:getFreezingTime() / 100) * 0.15) end -- this keeps "frozen" items from getting warm before they thaw.
			local newheat = (math.abs(temp -item_temp) / splitter)
			if temp > item_temp then
				item:setHeat(joes_round(item_temp + newheat,4))
			elseif temp < item_temp then
				item:setHeat(joes_round(item_temp - newheat,4))
			end
		end
	end
end

function setRoomTemp(cooler)
	for i=0,cooler:getItemContainer():getItems():size()-1 do
		local item = cooler:getItemContainer():getItems():get(i)
		item:setHeat(1)
	end
end

function joes_round(x, n)
return tonumber(string.format("%."..tostring(n ~= nil and n or 4).."f", x))
end

