local sm_reallastSec = nil
local LighterFire;
local LighterFireHand;
local counter_sec = 0;
local counter_burn_hand;
local sayphrase;

--********************************** Real-time tracking items *********************
Events.OnTick.Add(function()
	local datetime = os.date("!*t",os.time())
	local sec = (datetime.sec)
	local player = getSpecificPlayer(0)
	if not player then return end

--********************************** Replace Used Foil Lighter ********************
	local UsedFoilLighter = player:getInventory():FindAll("SMUsedFoilLighter");
	if UsedFoilLighter	~= nil and UsedFoilLighter:size() ~= 0 then
		local DATAPlayer = player:getModData();
		local DeltaBattery_Foil = DATAPlayer.DeltaBattery_FoilLigther;
		
		if DeltaBattery_Foil ~= nil and DeltaBattery_Foil >= 0.1 then
			local battery_add;
			battery_add = player:getInventory():AddItem("Base.Battery");
			battery_add:setUsedDelta(DeltaBattery_Foil - 0.05);
		end
		player:getInventory():Remove("SMUsedFoilLighter");
		DATAPlayer.DeltaBattery_FoilLigther = nil;
	end
--*********************************************************************************
--********************************** Replace Items For Other mod ******************
	if getActivatedMods():contains("Hydrocraft") or getActivatedMods():contains("jiggasGreenfireMod") then
		local gf_cigarette = player:getInventory():FindAll("GFCigarette"); -- for greenfire cigarettes
		local hydro_cigarette = player:getInventory():FindAll("HCCigarettepack"); -- for hydrocraft cigarettes normal
		local hydro_cigaretteL = player:getInventory():FindAll("HCCigaretteslights"); -- for hydrocraft cigarettes light
		local hydro_cigaretteM = player:getInventory():FindAll("HCCigarettesmenthol"); -- for hydrocraft cigarettes menthol

		if hydro_cigaretteL	~= nil and hydro_cigaretteL:size() ~= 0 then -- for hydrocraft cigarettes pack light
			local type_cigarette = "HCCigaretteslights";
			local type_cigarette_pack_add = "SMPackLight";
			SearchCigarettes(item, player, type_cigarette, type_cigarette_pack_add);

			elseif hydro_cigaretteM	~= nil and hydro_cigaretteM:size() ~= 0 then -- for hydrocraft cigarettes pack menthol
			local type_cigarette = "HCCigarettesmenthol";
			local type_cigarette_pack_add = "SMPackMenthol";
			SearchCigarettes(item, player, type_cigarette, type_cigarette_pack_add);
			
			elseif hydro_cigarette	~= nil and hydro_cigarette:size() ~= 0 then -- for hydrocraft cigarettes normal
			local type_cigarette = "HCCigarettepack";
			local type_cigarette_pack_add = "SMPack";
			SearchCigarettes(item, player, type_cigarette, type_cigarette_pack_add);

			elseif gf_cigarette	~= nil and gf_cigarette:size() ~= 0 then -- for greenfire cigarettes
			local type_cigarette = "GFCigarette";
			local type_cigarette_pack_add = "SMPack";
			SearchCigarettes(item, player, type_cigarette, type_cigarette_pack_add);
		end
	end

--********************************** timer - 1 time per second in real time *********************--
	if sec ~= sm_reallastSec then --- ???????????? ?????????????????????? 1 ?????? ?? ?????????????? ?????????????????? ??????????????
		sm_reallastSec = sec;
		SearchHandFireLighter(player);
		ReplaceItem(item, player);
	end
end)

--******************************************************************************************--
--********************************** for replace cigarettes other mods *********************--
--******************************************************************************************--
function SearchCigarettes(item, player, type_cigarette, type_cigarette_pack_add)
	local player = getSpecificPlayer(0)
	if not player then return end
	local cigarette = player:getInventory():FindAll(type_cigarette);

	if cigarette:size() > 1 then
		for i = 0, player:getInventory():getItems():size() - 1 do 
			local item = player:getInventory():getItems():get(i);
			if item:getType() == type_cigarette then
				player:getInventory():Remove(item);
				break
			end
		end

		elseif cigarette:size() == 1 then

		for i = 0, player:getInventory():getItems():size() - 1 do 
			local item = player:getInventory():getItems():get(i);
			if item:getType() == type_cigarette then
				player:getInventory():Remove(item);
				AddSMPack(item, player, type_cigarette_pack_add);
				break
			end
		end
	end
end

--******************************************************************************************--
--************************************** Smoker Mod ***************************************--
--************************** ???????????????????? ?????????? ?????????????? Smoker Mod ***************************--
--**************************   Adding Cigarette Pack Smoker Mod    *************************--
--******************************************************************************************--
function AddSMPack(item, player, type_cigarette_pack_add)
	local player = getSpecificPlayer(0);
	if not player then return end
	player:getInventory():AddItem("SM." .. type_cigarette_pack_add);
	local NumCigarettesInPack = ZombRand(0,20)/20;

	if NumCigarettesInPack == 0 then player:Say(getText("IGUI_Empty"))
		elseif NumCigarettesInPack == 0.05 then player:Say(getText("IGUI_One_cigarette"));
		elseif NumCigarettesInPack == 0.1 then player:Say(getText("IGUI_Two_cigarettes"));
		elseif NumCigarettesInPack >= 0.15 and NumCigarettesInPack <= 0.25 then player:Say(getText("IGUI_There_is_some"));
		elseif NumCigarettesInPack >= 0.25 and NumCigarettesInPack <= 0.35 then player:Say(getText("IGUI_Less_than_half"));
		elseif NumCigarettesInPack >= 0.4 and NumCigarettesInPack <= 0.6 then player:Say(getText("IGUI_Almost_half_a_pack"));
		elseif NumCigarettesInPack >= 0.65 and NumCigarettesInPack <= 0.8 then player:Say(getText("IGUI_More_than_a_half"));
		elseif NumCigarettesInPack >= 0.85 and NumCigarettesInPack <= 0.95 then player:Say(getText("IGUI_Almost_a_complete_pack"));
		elseif NumCigarettesInPack == 1 then player:Say(getText("IGUI_Full_pack"));
	end

	for i = 0, player:getInventory():getItems():size() -1 do 
		local item = player:getInventory():getItems():get(i);
		if (item:getType() == (type_cigarette_pack_add)) and (item:hasModData() == false) then
			item:setUsedDelta(NumCigarettesInPack);
			local DATASmokerCigarettePack = item:getModData();
			DATASmokerCigarettePack.Smoker = true;
			DATASmokerCigarettePack.Foil = true;
			break
		end
	end
end

-- ************************** Replace Item Empty Lighter And Bulbulyator And Empty Matchbox ************************** --
function ReplaceItem(item, player)
	local player = getSpecificPlayer(0);
	if not player then return end
	local num_rand;
	local counter_item = player:getInventory():FindAll("LighterEmpty"); -- Littering Lighter Empty
	
	if counter_item:size() ~= nil and counter_item:size() ~= 0 then
		local searchitem = "LighterEmpty" -- Littering Lighter Empty
		local additem = "SM.SMEmptyLighter" -- Smoker Lighter Empty

		-- *************** Replace Empty Lighter *************** --	
		for i = 0, player:getInventory():getItems():size() - 1 do 
			local item = player:getInventory():getItems():get(i);
			if item:getType() == searchitem then
				player:getInventory():Remove(item);
				player:getInventory():AddItem(additem);
				break
			end
		end
	end

-- Bulbulyator -- ???????????????????? ???????????? ?? ???????????????????????? --
	local DATAPlayer = player:getModData();
	if DATAPlayer.Smoke == true then
		DATAPlayer.Smoke = false -- ???????????????? ??????????????
		if DATAPlayer.CounterSmoke == nil then
			DATAPlayer.CounterSmoke = 0;
		end
		local counter_smoke = DATAPlayer.CounterSmoke;	
		counter_smoke = counter_smoke+1;
		DATAPlayer.CounterSmoke = counter_smoke;
		if DATAPlayer.ItemSmoke == "Bulbulyator" then
			for i = 0, player:getInventory():getItems():size() - 1 do 
				local item = player:getInventory():getItems():get(i);
				if item:getType() == "SMCrumpledWithFoilCap2" then -- ?????????????? ?? ?????????????? ?? ?????????????????????? ?? ????????????
					DATAPlayer.ItemSmoke = nil;
					local DATABulbulyator = item:getModData();
					DATABulbulyator.CounterSmoke = DATAPlayer.CounterSmoke;
					DATABulbulyator.Foil = 0;

					if DATABulbulyator.CounterSmoke > 2 then
						if player:HasTrait("Lucky") then num_rand = 3;
							elseif player:HasTrait("Unlucky") then num_rand = 1;
							else
							num_rand = 2;
						end
						local chance = ZombRand(num_rand);
						if chance == 0 then
							player:getInventory():Remove(item);
							player:getInventory():AddItem("SM.SMCrumpledBottle2"); --???????????? ?????????????? ?? ????????????????????
							getPlayer():Say(getText("IGUI_The_foil_burned_out"));
							DATAPlayer.CounterSmoke = 0;
						end
					end
					break
				end
			end
		end
	end
-- MatchBox ----	
	local counter_empty_matchbox = player:getInventory():FindAll("EmptyMatchbox");
	if counter_empty_matchbox:size() ~= nil and counter_empty_matchbox:size() ~= 0 then
		local searchitem = "EmptyMatchbox";
		local additem = "SM.Matches";
		local matchbox_add;
		for i = 0, player:getInventory():getItems():size() - 1 do 
			local item = player:getInventory():getItems():get(i);
			if item:getType() == searchitem then
				player:getInventory():Remove(item);
				matchbox_add = player:getInventory():AddItem(additem);
				matchbox_add:setUsedDelta(0);
				break
			end
		end	
	end
end

-- ?????????? ???????????????????? ?????????????????? ?? ?????????? / Finding the included lighter in your hands --
function SearchHandFireLighter(player)
	if not player then 
	return end

	local rightHandItem = player:getPrimaryHandItem();
	local leftHandItem = player:getSecondaryHandItem();

	if (rightHandItem ~= nil and rightHandItem:isEmittingLight()) then
		if rightHandItem:getType() == "Lighter" then
			LighterFire = true;
			LighterFireHand = "Right";
			counter_burn_hand = player:getBodyDamage():getBodyPart(BodyPartType.Hand_R):getBurnTime();
		end

		elseif (leftHandItem ~= nil and leftHandItem:isEmittingLight()) then
			if leftHandItem:getType() == "Lighter" then
				LighterFire = true;
				LighterFireHand = "Left";
				counter_burn_hand = player:getBodyDamage():getBodyPart(BodyPartType.Hand_L):getBurnTime();
			end

			else
			LighterFire = false;
			counter_sec = 0;
			sayphrase = false;
			
	end

	if LighterFire == true then
		counter_sec = counter_sec + 1;
		if counter_sec > 20 then -- Burns to Hand -- ???????? ?????????? ???????? ?? ?????????????? ?????????????????? --
			counter_burn_hand = counter_burn_hand + 0.0005;
			if sayphrase == nil or sayphrase == false then 
				player:Say(getText("IGUI_Oh_Hand_Hot"));
				sayphrase = true;
			end
			player:getStats():setPanic(player:getStats():getPanic() + 10);
			if LighterFireHand == "Right" then 
				player:getBodyDamage():getBodyPart(BodyPartType.Hand_R):setBurnTime(counter_burn_hand);
				elseif LighterFireHand == "Left" then
				player:getBodyDamage():getBodyPart(BodyPartType.Hand_L):setBurnTime(counter_burn_hand);
			end
		end
	end
end