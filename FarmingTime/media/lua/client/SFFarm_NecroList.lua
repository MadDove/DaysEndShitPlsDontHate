------------------------------------------------------------------------------------------------------------------
-- Notes:
-- All Mod Items should appear in "Mods" Category. 
-- Until they get their own Buttons, they get a Prefix in name.
-- Mod Item Icons - keep the "media/textures/Item_IconName.png" format, it's good for performance.
------------------------------------------------------------------------------------------------------------------
-- {"Category Name" x 3, "Display Name", "Module.ItemID", "Item_(Icon)", R, G, B, Function, State, Extra, X, Y, Z}
------------------------------------------------------------------------------------------------------------------
-- Plug-In Code based on NF Plug-In code by blindcoder.
------------------------------------------------------------------------------------------------------------------
-- Supported Mods: By Mod ID
--
------------------------------------------------------------------------------------------------------------------

Events.OnGameStart.Add( function ()
	if NecroList then
		print ("[NecroForge] - Adding SFExploringTime to NecroForge");
		NecroList.Items.SFFarm1 = {"Mods", "SFFarm", nil, "SFFarm - Beetroot", "filcher.Beetroot", "media/textures/Item_SFBeetroot.png", nil, nil, nil};
		NecroList.Items.SFFarm2 = {"Mods", "SFFarm", nil, "SFFarm - Beet Seeds Packet", "filcher.BeetBagSeed", "media/textures/Item_SFBeetSeedBag.png", nil, nil, nil};
		NecroList.Items.SFFarm4 = {"Mods", "SFFarm", nil, "SFFarm - Cauliflower Seeds Packet", "filcher.CauliflowerBagSeed", "media/textures/Item_SFCauliflowerSeedBag.png", nil, nil, nil};
		NecroList.Items.SFFarm5 = {"Mods", "SFFarm", nil, "SFFarm - Corn Seeds Packet", "filcher.CornBagSeed", "media/textures/Item_TZ_SeedpackCarrots.png", nil, nil, nil};
		NecroList.Items.SFFarm6 = {"Mods", "SFFarm", nil, "SFFarm - Lemon Grass Seeds Packet", "filcher.SFLemonGrassBagSeed", "media/textures/Item_SFLemonGrassSeedBag.png", nil, nil, nil};
		NecroList.Items.SFFarm7 = {"Mods", "SFFarm", nil, "SFFarm - Wheat", "filcher.SFWheat", "media/textures/Item_SFWheat.png", nil, nil, nil};
		NecroList.Items.SFFarm8 = {"Mods", "SFFarm", nil, "SFFarm - Wheat Grain Packet", "filcher.SFWheatBagSeed", "media/textures/Item_SFWheatSeedBag.png", nil, nil, nil};
		NecroList.Items.SFFarm9 = {"Mods", "SFFarm", nil, "SFFarm - Complete Farming Guide", "filcher.SFBookFarm", "media/textures/Item_SFBookFlour.png", nil, nil, nil};
		NecroList.Items.SFFarm10 = {"Mods", "SFFarm", nil, "SFFarm - The Farming Magazine 2", "filcher.SFFarmMag2", "media/textures/Item_SFFarmMag2.png", nil, nil, nil};
		NecroList.Items.SFFarm11 = {"Mods", "SFFarm", nil, "SFFarm - The Farming Magazine 3", "filcher.SFFarmMag3", "media/textures/Item_SFFarmMag3.png", nil, nil, nil};
		NecroList.Items.SFFarm12 = {"Mods", "SFFarm", nil, "SFFarm - Insecticide Spray", "filcher.GardeningSprayCigarettes", "media/textures/Item_SFInsectSpray.png", nil, nil, nil};
		NecroList.Items.SFFarm13 = {"Mods", "SFFarm", nil, "SFFarm - Mildew Spray", "filcher.GardeningSprayMilk", "media/textures/Item_SFMildewSpray.png", nil, nil, nil};
		NecroList.Items.SFFarm14 = {"Mods", "SFFarm", nil, "SFFarm - Grain Grinder", "filcher.SFGrainGrinder", "media/textures/Item_SFGrainGrinder.png", nil, nil, nil};
		NecroList.Items.SFFarm15 = {"Mods", "SFFarm", nil, "SFFarm - Cloth", "filcher.SFCloth", "media/textures/Item_SFCloth.png", nil, nil, nil};
		NecroList.Items.SFFarm16 = {"Mods", "SFFarm", nil, "SFFarm - Lettuce Seeds Packet", "filcher.LettuceBagSeed", "media/textures/Item_SFLettuceSeedBag.png", nil, nil, nil};
	end
end)