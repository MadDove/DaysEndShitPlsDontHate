function Recipe.OnCreate.ExtractSulfur(items, result, player)

	player:getInventory():AddItems("Base.Gravelbag", 1);

end

function Recipe.OnCreate.RecyclePlastic(items, result, player)

		local item = items:get(0)
		
		if item:getType() == "BleachEmpty" or item:getType() == "Cube" or item:getType() == "Razor" then

			player:getInventory():AddItems("ammomaker.ammomaker_RecPlastic", 1);

		elseif item:getType() == "Lunchbox" or item:getType() == "Lunchbox2" or item:getType() == "BucketEmpty" then

			player:getInventory():AddItems("ammomaker.ammomaker_RecPlastic", 9);
		
		elseif item:getType() == "Cooler" then

			player:getInventory():AddItems("ammomaker.ammomaker_RecPlastic", 14);

		end

end

function Recipe.OnCreate.RecycleMetal(items, result, player)

	local item = items:get(0)
	
	if item:getType() == "UnusableMetal" then

		player:getInventory():AddItems("Base.ScrapMetal", 8);
	
	end

end

function Recipe.OnGiveXP.MetalWelding5(recipe, ingredients, result, player)

    player:getXp():AddXP(Perks.MetalWelding, 5);

end

function Recipe.OnGiveXP.Reloading5(recipe, ingredients, result, player)

    player:getXp():AddXP(Perks.Reloading, 5);

end

function Recipe.OnGiveXP.Chemistry3(recipe, ingredients, result, player)

	player:getXp():AddXP(Perks.MetalWelding, 3);
	player:getXp():AddXP(Perks.Cooking, 3);

end