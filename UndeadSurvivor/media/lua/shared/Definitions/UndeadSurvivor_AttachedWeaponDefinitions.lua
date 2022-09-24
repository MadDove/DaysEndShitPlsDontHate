require "Definitions/AttachedWeaponDefinitions"

AttachedWeaponDefinitions.StalkerKnife= {
	chance = 100,
	outfit = {"Stalker"},
	weaponLocation = {"Blade On Back"},
	bloodLocations = nil,
	addHoles = false,
	daySurvived = 0,
	weapons = {
		"UndeadSurvivor.StalkerKnife",
	},
}

AttachedWeaponDefinitions.attachedWeaponCustomOutfit.Stalker = {
	chance = 25;
	weapons = {
		AttachedWeaponDefinitions.StalkerKnife,
	},
}



AttachedWeaponDefinitions.PrepperFlashlight= {
	chance = 100,
	outfit = {"Prepper"},
	weaponLocation = {"PrepperFlashlight"},
	bloodLocations = nil,
	addHoles = false,
	daySurvived = 0,
	weapons = {
		"UndeadSurvivor.PrepperFlashlight",
	},
}

AttachedWeaponDefinitions.PrepperHolster= {
	chance = 100,
	outfit = {"Prepper"},
	weaponLocation = {"PrepperHolster"},
	bloodLocations = nil,
	addHoles = false,
	daySurvived = 0,
	weapons = {
		"Base.Pistol",
		"Base.Pistol2",
		"Base.Pistol3",
	},
}

AttachedWeaponDefinitions.PrepperKnife= {
	chance = 100,
	outfit = {"Prepper"},
	weaponLocation = {"PrepperKnife"},
	bloodLocations = nil,
	addHoles = false,
	daySurvived = 0,
	weapons = {
		"UndeadSurvivor.PrepperKnife",
	},
}

AttachedWeaponDefinitions.GunMagazine1= {
	chance = 100,
	outfit = {"Prepper"},
	weaponLocation = {"GunMagazine1"},
	bloodLocations = nil,
	addHoles = false,
	daySurvived = 0,
	weapons = {
		"Base.9mmClip",
		"Base.45Clip",
		"Base.44Clip",
	},
}

AttachedWeaponDefinitions.GunMagazine2= {
	chance = 100,
	outfit = {"Prepper"},
	weaponLocation = {"GunMagazine2"},
	bloodLocations = nil,
	addHoles = false,
	daySurvived = 0,
	weapons = {
		"Base.9mmClip",
		"Base.45Clip",
		"Base.44Clip",
	},
}

AttachedWeaponDefinitions.GunMagazine3= {
	chance = 100,
	outfit = {"Prepper"},
	weaponLocation = {"GunMagazine3"},
	bloodLocations = nil,
	addHoles = false,
	daySurvived = 0,
	weapons = {
		"Base.9mmClip",
		"Base.45Clip",
		"Base.44Clip",
	},
}

AttachedWeaponDefinitions.GunMagazine4= {
	chance = 100,
	outfit = {"Prepper"},
	weaponLocation = {"GunMagazine4"},
	bloodLocations = nil,
	addHoles = false,
	daySurvived = 0,
	weapons = {
		"Base.9mmClip",
		"Base.45Clip",
		"Base.44Clip",
	},
}



AttachedWeaponDefinitions.attachedWeaponCustomOutfit.Prepper = {
	chance = 90;
	maxitem = 7;
	weapons = {
		AttachedWeaponDefinitions.PrepperKnife,
		AttachedWeaponDefinitions.PrepperFlashlight,
		AttachedWeaponDefinitions.PrepperHolster,
		AttachedWeaponDefinitions.GunMagazine1,
		AttachedWeaponDefinitions.GunMagazine2,
		AttachedWeaponDefinitions.GunMagazine3,
		AttachedWeaponDefinitions.GunMagazine4,
	},
}