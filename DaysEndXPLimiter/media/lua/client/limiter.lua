function limiter(player, perk, amount)
    local allPerks = {};
    for i=0, Perks.getMaxIndex() - 1 do
        local perk = PerkFactory.getPerk(Perks.fromIndex(i));
        if perk and perk:getParent() ~= Perks.None then
            local newPerk = {};
            newPerk.perk = Perks.fromIndex(i);
            --newPerk.name = perk:getName() .. " (" .. PerkFactory.getPerkName(perk:getParent()) .. ")";
			newPerk.name = perk:getName();
            newPerk.level = player:getPerkLevel(Perks.fromIndex(i));
            newPerk.xpToLevel = perk:getXpForLevel(newPerk.level + 1);
            newPerk.xpAdd = round(player:getXp():getXP(newPerk.perk) - ISSkillProgressBar.getPreviousXpLvl(perk, newPerk.level),2);
            newPerk.xpTotal = player:getXp():getXP(newPerk.perk);
			newPerk.last = ISSkillProgressBar.getPreviousXpLvl(perk, newPerk.level);
            newPerk.xpBoost = player:getXp():getPerkBoost(newPerk.perk);
            newPerk.multiplier = player:getXp():getMultiplier(newPerk.perk);
			allPerks[tostring(newPerk.name)]=newPerk
        end
    end
	if perk == Perks.Woodwork then
		if allPerks["Carpentry"].xpBoost == 0 and allPerks["Carpentry"].level >=5 then
			player:getXp():setXPToLevel(Perks.Woodwork, 5);
		elseif allPerks["Carpentry"].xpBoost == 1 and allPerks["Carpentry"].level >=7 then
			player:getXp():setXPToLevel(Perks.Woodwork, 7);
		elseif allPerks["Carpentry"].xpBoost == 2 and allPerks["Carpentry"].level >=9 then
			player:getXp():setXPToLevel(Perks.Woodwork, 9);
		end
	end
	if perk == Perks.Cooking then
		if allPerks["Cooking"].xpBoost == 0 and allPerks["Cooking"].level >=5 then
			player:getXp():setXPToLevel(Perks.Cooking, 5);
		elseif allPerks["Cooking"].xpBoost == 1 and allPerks["Cooking"].level >=7 then
			player:getXp():setXPToLevel(Perks.Cooking, 7);
		elseif allPerks["Cooking"].xpBoost == 2 and allPerks["Cooking"].level >=9 then
			player:getXp():setXPToLevel(Perks.Cooking, 9);
		end
	end
	if perk == Perks.Farming then
		if allPerks["Farming"].xpBoost == 0 and allPerks["Farming"].level >=5 then
			player:getXp():setXPToLevel(Perks.Farming, 5);
		elseif allPerks["Farming"].xpBoost == 1 and allPerks["Farming"].level >=7 then
			player:getXp():setXPToLevel(Perks.Farming, 7);
		elseif allPerks["Farming"].xpBoost == 2 and allPerks["Farming"].level >=9 then
			player:getXp():setXPToLevel(Perks.Farming, 9);
		end
	end
	if perk == Perks.Doctor then
		if allPerks["First Aid"].xpBoost == 0 and allPerks["First Aid"].level >=5 then
			player:getXp():setXPToLevel(Perks.Doctor, 5);
		elseif allPerks["First Aid"].xpBoost == 1 and allPerks["First Aid"].level >=7 then
			player:getXp():setXPToLevel(Perks.Doctor, 7);
		elseif allPerks["First Aid"].xpBoost == 2 and allPerks["First Aid"].level >=9 then
			player:getXp():setXPToLevel(Perks.Doctor, 9);
		end
	end
	if perk == Perks.Electrical then
		if allPerks["Electrical"].xpBoost == 0 and allPerks["Electrical"].level >=5 then
			player:getXp():setXPToLevel(Perks.Electrical, 5);
		elseif allPerks["Electrical"].xpBoost == 1 and allPerks["Electrical"].level >=7 then
			player:getXp():setXPToLevel(Perks.Electrical, 7);
		elseif allPerks["Electrical"].xpBoost == 2 and allPerks["Electrical"].level >=9 then
			player:getXp():setXPToLevel(Perks.Electrical, 9);
		end
	end
	if perk == Perks.MetalWelding then
		if allPerks["Metalworking"].xpBoost == 0 and allPerks["Metalworking"].level >=5 then
			player:getXp():setXPToLevel(Perks.MetalWelding, 5);
		elseif allPerks["Metalworking"].xpBoost == 1 and allPerks["Metalworking"].level >=7 then
			player:getXp():setXPToLevel(Perks.MetalWelding, 7);
		elseif allPerks["Metalworking"].xpBoost == 2 and allPerks["Metalworking"].level >=9 then
			player:getXp():setXPToLevel(Perks.MetalWelding, 9);
		end
	end
	if perk == Perks.Mechanics then
		if allPerks["Mechanics"].xpBoost == 0 and allPerks["Mechanics"].level >=5 then
			player:getXp():setXPToLevel(Perks.Mechanics, 5);
		elseif allPerks["Mechanics"].xpBoost == 1 and allPerks["Mechanics"].level >=7 then
			player:getXp():setXPToLevel(Perks.Mechanics, 7);
		elseif allPerks["Mechanics"].xpBoost == 2 and allPerks["Mechanics"].level >=9 then
			player:getXp():setXPToLevel(Perks.Mechanics, 9);
		end
	end
	if perk == Perks.Tailoring then
		if allPerks["Tailoring"].xpBoost == 0 and allPerks["Tailoring"].level >=5 then
			player:getXp():setXPToLevel(Perks.Tailoring, 5);
		elseif allPerks["Tailoring"].xpBoost == 1 and allPerks["Tailoring"].level >=7 then
			player:getXp():setXPToLevel(Perks.Tailoring, 7);
		elseif allPerks["Tailoring"].xpBoost == 2 and allPerks["Tailoring"].level >=9 then
			player:getXp():setXPToLevel(Perks.Tailoring, 9);
		end
	end
	if perk == Perks.Masonry then
		if allPerks["Masonry"].xpBoost == 0 and allPerks["Masonry"].level >=5 then
			player:getXp():setXPToLevel(Perks.Masonry, 5);
		elseif allPerks["Masonry"].xpBoost == 1 and allPerks["Masonry"].level >=7 then
			player:getXp():setXPToLevel(Perks.Masonry, 7);
		elseif allPerks["Masonry"].xpBoost == 2 and allPerks["Masonry"].level >=9 then
			player:getXp():setXPToLevel(Perks.Masonry, 9);
		end
	end
	if perk == Perks.Fishing then
		if allPerks["Fishing"].xpBoost == 0 and allPerks["Fishing"].level >=5 then
			player:getXp():setXPToLevel(Perks.Fishing, 5);
		elseif allPerks["Fishing"].xpBoost == 1 and allPerks["Fishing"].level >=7 then
			player:getXp():setXPToLevel(Perks.Fishing, 7);
		elseif allPerks["Fishing"].xpBoost == 2 and allPerks["Fishing"].level >=9 then
			player:getXp():setXPToLevel(Perks.Fishing, 9);
		end
	end
	if perk == Perks.Trapping then
		if allPerks["Trapping"].xpBoost == 0 and allPerks["Trapping"].level >=5 then
			player:getXp():setXPToLevel(Perks.Trapping, 5);
		elseif allPerks["Trapping"].xpBoost == 1 and allPerks["Trapping"].level >=7 then
			player:getXp():setXPToLevel(Perks.Trapping, 7);
		elseif allPerks["Trapping"].xpBoost == 2 and allPerks["Trapping"].level >=9 then
			player:getXp():setXPToLevel(Perks.Trapping, 9);
		end
	end
	if perk == Perks.PlantScavenging then
		if allPerks["Foraging"].xpBoost == 0 and allPerks["Foraging"].level >=5 then
			player:getXp():setXPToLevel(Perks.PlantScavenging, 5);
		elseif allPerks["Foraging"].xpBoost == 1 and allPerks["Foraging"].level >=7 then
			player:getXp():setXPToLevel(Perks.PlantScavenging, 7);
		elseif allPerks["Foraging"].xpBoost == 2 and allPerks["Foraging"].level >=9 then
			player:getXp():setXPToLevel(Perks.PlantScavenging, 9);
		end
	end
end
Events.AddXP.Add(limiter)