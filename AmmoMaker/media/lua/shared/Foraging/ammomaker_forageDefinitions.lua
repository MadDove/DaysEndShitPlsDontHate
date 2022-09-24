require 'Foraging/forageSystem'

Events.onAddForageDefs.Add(function()

	local ammomaker_BirdExcrement = {
		type = "ammomaker.ammomaker_BirdExcrement",
		minCount = 8,
		maxCount = 24,
		xp = 5,
		categories = { "Stones" },
		zones = {
			DeepForest      = 5,
			Forest          = 5,
			Vegitation      = 5,
			FarmLand        = 5,
			Farm            = 5,
			TrailerPark     = 5,
			TownZone        = 5,
			Nav             = 5,
		},
		months = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
		itemSizeModifier = 0.7,
	};

forageSystem.addItemDef(ammomaker_BirdExcrement);

forageSystem.generateLootTable()

end)