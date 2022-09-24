------------------------------------------------------------------------------------------------------------------
-- By Soul Filcher, modified from blindcoder's Necroforge Plugin.
--
------------------------------------------------------------------------------------------------------------------

Events.OnGameStart.Add( function ()
	if NecroList then
		print ("[NecroForge] - Adding SFLearningTime to NecroForge");
		NecroList.Items.SFLearn1 = {"Mods", "SFLearn", nil, "SFLearn - Maintenance for Beginners", "filcher.BookMaintenance1", "media/textures/Item_BookViolet.png", nil, nil, nil};
		NecroList.Items.SFLearn2 = {"Mods", "SFLearn", nil, "SFLearn - Maintenance for Intermediates", "filcher.BookMaintenance2", "media/textures/Item_BookViolet.png", nil, nil, nil};
		NecroList.Items.SFLearn3 = {"Mods", "SFLearn", nil, "SFLearn - Advanced Maintenance", "filcher.BookMaintenance3", "media/textures/Item_BookViolet.png", nil, nil, nil};
		NecroList.Items.SFLearn4 = {"Mods", "SFLearn", nil, "SFLearn - Expert Maintenance", "filcher.BookMaintenance4", "media/textures/Item_BookViolet.png", nil, nil, nil};
		NecroList.Items.SFLearn5 = {"Mods", "SFLearn", nil, "SFLearn - Master Maintenance", "filcher.BookMaintenance5", "media/textures/Item_BookViolet.png", nil, nil, nil};

		NecroList.Items.SFLearn6 = {"Mods", "SFLearn", nil, "SFLearn - Complete Cooking Guide", "filcher.SFGuideCooking", "media/textures/Item_SFBookCook.png", nil, nil, nil};
		NecroList.Items.SFLearn7 = {"Mods", "SFLearn", nil, "SFLearn - Complete Eletronics Guide", "filcher.SFGuideEletronics", "media/textures/Item_SFBookElectric.png", nil, nil, nil};
		NecroList.Items.SFLearn8 = {"Mods", "SFLearn", nil, "SFLearn - Complete Engineering Guide", "filcher.SFGuideEngineering", "media/textures/Item_SFBookEngine.png", nil, nil, nil};
		NecroList.Items.SFLearn9 = {"Mods", "SFLearn", nil, "SFLearn - Complete Fishing Guide", "filcher.SFGuideFishing", "media/textures/Item_SFBookFish.png", nil, nil, nil};
		NecroList.Items.SFLearn10 = {"Mods", "SFLearn", nil, "SFLearn - Complete Mechanics Guide", "filcher.SFGuideMechanics", "media/textures/Item_SFBookCars.png", nil, nil, nil};
		NecroList.Items.SFLearn11 = {"Mods", "SFLearn", nil, "SFLearn - Complete Metalworking Guide", "filcher.SFGuideMetalworking", "media/textures/Item_SFBookMetal.png", nil, nil, nil};
		NecroList.Items.SFLearn13 = {"Mods", "SFLearn", nil, "SFLearn - Complete Radio Guide", "filcher.SFGuideRadio", "media/textures/Item_SFBookRadio.png", nil, nil, nil};
		NecroList.Items.SFLearn14 = {"Mods", "SFLearn", nil, "SFLearn - Complete Trapping Guide", "filcher.SFGuideTrapping", "media/textures/Item_SFBookTrap.png", nil, nil, nil};

		NecroList.Items.SFLearn15 = {"Mods", "SFLearn", nil, "SFLearn - Notes On Aerosol Bombs", "filcher.EngineerNotes3", "media/textures/Item_SFNotesEng3.png", nil, nil, nil};
		NecroList.Items.SFLearn16 = {"Mods", "SFLearn", nil, "SFLearn - Notes On Flame Bombs", "filcher.EngineerNotes4", "media/textures/Item_SFNotesEng4.png", nil, nil, nil};
		NecroList.Items.SFLearn17 = {"Mods", "SFLearn", nil, "SFLearn - Notes On Pipe Bombs", "filcher.EngineerNotes5", "media/textures/Item_SFNotesEng1.png", nil, nil, nil};
	end
end)