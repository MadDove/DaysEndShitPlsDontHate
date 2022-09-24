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
		print ("[NecroForge] - Adding SFCookingTime to NecroForge");
		--NecroList.Items.SFExplore1 = {"Mods", "SFCook", nil, "SFCook - Paper Bag", "filcher.Paperbag", "media/ui/Container_Sack.png", nil, nil, nil};
		NecroList.Items.SFExplore2 = {"Mods", "SFCook", nil, "SFCook - Good Cooking Magazine", "filcher.SFCookingMag1", "media/textures/Item_SFCookingMag1.png", nil, nil, nil};
		NecroList.Items.SFExplore3 = {"Mods", "SFCook", nil, "SFCook - Good Cooking Magazine", "filcher.SFCookingMag2", "media/textures/Item_SFCookMag2.png", nil, nil, nil};
		NecroList.Items.SFExplore4 = {"Mods", "SFCook", nil, "SFCook - Good Cooking Magazine", "filcher.SFCookingMag3", "media/textures/Item_SFCookMag3.png", nil, nil, nil};
		NecroList.Items.SFExplore5 = {"Mods", "SFCook", nil, "SFCook - Complete Cooking Guide", "filcher.SFCookingGuide", "media/textures/Item_SFBookCook.png", nil, nil, nil};
		NecroList.Items.SFExplore6 = {"Mods", "SFCook", nil, "SFCook - Barbecue Sauce", "filcher.SFBarbecue", "media/textures/Item_SFBarbecue.png", nil, nil, nil};
		NecroList.Items.SFExplore7 = {"Mods", "SFCook", nil, "SFCook - Basil", "filcher.SFBasil", "media/textures/Item_SFBasil.png", nil, nil, nil};
		NecroList.Items.SFExplore8 = {"Mods", "SFCook", nil, "SFCook - Beans", "filcher.SFBeans", "media/textures/Item_SFBeans.png", nil, nil, nil};
		NecroList.Items.SFExplore9 = {"Mods", "SFCook", nil, "SFCook - Bowl of Beans", "filcher.SFBeanBowl", "media/textures/Item_BowlFull.png", nil, nil, nil};
		NecroList.Items.SFExplore11 = {"Mods", "SFCook", nil, "SFCook - Beer Cheese", "filcher.Beercheese", "media/textures/Item_Beercheese.png", nil, nil, nil};
		NecroList.Items.SFExplore12 = {"Mods", "SFCook", nil, "SFCook - Beetroot", "filcher.Beetroot", "media/textures/Item_SFBeetroot.png", nil, nil, nil};
		NecroList.Items.SFExplore13 = {"Mods", "SFCook", nil, "SFCook - Box of Tea Bags", "filcher.SFBoxOfTea", "media/textures/Item_SFBoxTea.png", nil, nil, nil};
		NecroList.Items.SFExplore14 = {"Mods", "SFCook", nil, "SFCook - Bread Crumbs", "filcher.BreadPieces", "media/textures/Item_BreadPieces.png", nil, nil, nil};
		NecroList.Items.SFExplore15 = {"Mods", "SFCook", nil, "SFCook - Canned Ham", "filcher.CannedHam", "media/textures/Item_CannedHam.png", nil, nil, nil};
		NecroList.Items.SFExplore16 = {"Mods", "SFCook", nil, "SFCook - Canned Soup", "filcher.CannedSoup", "media/textures/Item_TinCan.png", nil, nil, nil};
		NecroList.Items.SFExplore17 = {"Mods", "SFCook", nil, "SFCook - Canned Spaghetti", "filcher.CannedSpagetti", "media/textures/Item_CannedSpagetti.png", nil, nil, nil};
		NecroList.Items.SFExplore18 = {"Mods", "SFCook", nil, "SFCook - Canned Spinach", "filcher.CannedSpinach", "media/textures/Item_CannedSpinach.png", nil, nil, nil};
		NecroList.Items.SFExplore19 = {"Mods", "SFCook", nil, "SFCook - Cat Food", "filcher.SFCatfood", "media/textures/Item_SFCatfood.png", nil, nil, nil};
		NecroList.Items.SFExplore20 = {"Mods", "SFCook", nil, "SFCook - Cauliflower", "filcher.Cauliflower", "media/textures/Item_Cauliflower.png", nil, nil, nil};
		NecroList.Items.SFExplore21 = {"Mods", "SFCook", nil, "SFCook - Cinnamon", "filcher.Cinnamon", "media/textures/Item_Cinnamon.png", nil, nil, nil};
		--NecroList.Items.SFExplore22 = {"Mods", "SFCook", nil, "SFCook - Cocoa Powder", "filcher.SFCocoaPowder", "media/textures/Item_SFCocoaPowder.png", nil, nil, nil};
		NecroList.Items.SFExplore23 = {"Mods", "SFCook", nil, "SFCook - Curry", "filcher.SFCurry", "media/textures/Item_SFCurry.png", nil, nil, nil};
		NecroList.Items.SFExplore24 = {"Mods", "SFCook", nil, "SFCook - Dried Apricots", "filcher.DriedApricots", "media/textures/Item_DriedApricots.png", nil, nil, nil};
		NecroList.Items.SFExplore25 = {"Mods", "SFCook", nil, "SFCook - Fig", "filcher.SFFig", "media/textures/Item_SFFig.png", nil, nil, nil};
		NecroList.Items.SFExplore26 = {"Mods", "SFCook", nil, "SFCook - Hazelnut Cream", "filcher.SFHazelnutCream", "media/textures/Item_SFHazelnutCream.png", nil, nil, nil};
		NecroList.Items.SFExplore27 = {"Mods", "SFCook", nil, "SFCook - Kiwi", "filcher.SFKiwi", "media/textures/Item_SFKiwi.png", nil, nil, nil};
		NecroList.Items.SFExplore28 = {"Mods", "SFCook", nil, "SFCook - Lemonade", "filcher.Lemonade", "media/textures/Item_Lemonade.png", nil, nil, nil};
		NecroList.Items.SFExplore29 = {"Mods", "SFCook", nil, "SFCook - Macaroni", "filcher.Macaroni", "media/textures/Item_MacaroniRaw.png", nil, nil, nil};
		--NecroList.Items.SFExplore30 = {"Mods", "SFCook", nil, "SFCook - Mango", "filcher.SFMango", "media/textures/Item_SFMango.png", nil, nil, nil};
		--NecroList.Items.SFExplore31 = {"Mods", "SFCook", nil, "SFCook - Maple Syrup", "filcher.SFMapleSyrup", "media/textures/Item_SFMapleSyrup.png", nil, nil, nil};
		--NecroList.Items.SFExplore32 = {"Mods", "SFCook", nil, "SFCook - Marshmallow", "filcher.SFMarshmallow", "media/textures/Item_TZ_Marshmallow.png", nil, nil, nil};
		NecroList.Items.SFExplore33 = {"Mods", "SFCook", nil, "SFCook - Olives", "filcher.Olives", "media/textures/Item_Olives.png", nil, nil, nil};
		NecroList.Items.SFExplore34 = {"Mods", "SFCook", nil, "SFCook - Oregano", "filcher.SFOregano", "media/textures/Item_SFOregano.png", nil, nil, nil};
		NecroList.Items.SFExplore35 = {"Mods", "SFCook", nil, "SFCook - Papaya", "filcher.SFPapaya", "media/textures/Item_SFPapaya.png", nil, nil, nil};
		NecroList.Items.SFExplore36 = {"Mods", "SFCook", nil, "SFCook - Paprika", "filcher.SFPaprika", "media/textures/Item_SFPaprika.png", nil, nil, nil};
		--NecroList.Items.SFExplore37 = {"Mods", "SFCook", nil, "SFCook - Pepperoni", "filcher.SFPepperoni", "media/textures/Item_SFPepperoni.png", nil, nil, nil};
		NecroList.Items.SFExplore38 = {"Mods", "SFCook", nil, "SFCook - Popsicle", "filcher.SFPopsicle", "media/textures/Item_SFPopsicle1.png", nil, nil, nil};
		NecroList.Items.SFExplore39 = {"Mods", "SFCook", nil, "SFCook - Popsicle", "filcher.SFPopsicle2", "media/textures/Item_SFPopsicle2.png", nil, nil, nil};
		NecroList.Items.SFExplore40 = {"Mods", "SFCook", nil, "SFCook - Popsicle", "filcher.SFPopsicle3", "media/textures/Item_SFPopsicle3.png", nil, nil, nil};
		NecroList.Items.SFExplore41 = {"Mods", "SFCook", nil, "SFCook - Popsicle", "filcher.SFPopsicle4", "media/textures/Item_SFPopsicle4.png", nil, nil, nil};
		NecroList.Items.SFExplore42 = {"Mods", "SFCook", nil, "SFCook - Popsicle", "filcher.SFPopsicle5", "media/textures/Item_SFPopsicle5.png", nil, nil, nil};
		NecroList.Items.SFExplore43 = {"Mods", "SFCook", nil, "SFCook - Pork Ribs", "filcher.SFPorkribs", "media/textures/Item_SFPorkribs.png", nil, nil, nil};
		--NecroList.Items.SFExplore44 = {"Mods", "SFCook", nil, "SFCook - Pumpkin", "filcher.Pumpkin", "media/textures/Item_Pumpkin.png", nil, nil, nil};
		NecroList.Items.SFExplore45 = {"Mods", "SFCook", nil, "SFCook - Rosemary", "filcher.SFRosemary", "media/textures/Item_SFRosemary.png", nil, nil, nil};
		--NecroList.Items.SFExplore46 = {"Mods", "SFCook", nil, "SFCook - Sausage", "filcher.SFSausage", "media/textures/Item_Hotdog.png", nil, nil, nil};
		NecroList.Items.SFExplore47 = {"Mods", "SFCook", nil, "SFCook - Spoonbread", "filcher.Spoonbread", "media/textures/Item_Spoonbread.png", nil, nil, nil};
		NecroList.Items.SFExplore48 = {"Mods", "SFCook", nil, "SFCook - Tomato Sauce", "filcher.SFTomatoSauce", "media/textures/Item_SFTomatoSauce.png", nil, nil, nil};
		NecroList.Items.SFExplore49 = {"Mods", "SFCook", nil, "SFCook - Turnip", "filcher.SFTurnip", "media/textures/Item_SFTurnip.png", nil, nil, nil};
		--NecroList.Items.SFExplore50 = {"Mods", "SFCook", nil, "SFCook - Vegetable Oil", "filcher.VegetableOil", "media/textures/Item_VegetableOil.png", nil, nil, nil};
		NecroList.Items.SFExplore51 = {"Mods", "SFCook", nil, "SFCook - Whipped Cream", "filcher.SFWhippedCream", "media/textures/Item_SFWhippedCream.png", nil, nil, nil};
		NecroList.Items.SFExplore52 = {"Mods", "SFCook", nil, "SFCook - Cupcake Tray", "filcher.SFCupcakeTray", "media/textures/Item_SFCupcakeTray.png", nil, nil, nil};
		--NecroList.Items.SFExplore53 = {"Mods", "SFCook", nil, "SFCook - Empty Glass", "filcher.EmptyGlass", "media/textures/Item_EmptyGlass.png", nil, nil, nil};
		NecroList.Items.SFExplore54 = {"Mods", "SFCook", nil, "SFCook - Thin Stick", "filcher.SFThinStick", "media/textures/Item_SFThinStick.png", nil, nil, nil};
	end
end)