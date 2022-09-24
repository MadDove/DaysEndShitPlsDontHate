if not ISHotbarAttachDefinition then
    return
end

local slot = {
	type = "Sling",
	name = "Sling",
	animset = "belt left",
	attachments = {
		Rifle = "SlingRifle",
		BigBlade = "SlingWeapon",
		BigWeapon = "SlingWeapon",
		Shovel = "SlingShovel",
	},
}
table.insert(ISHotbarAttachDefinition, slot);

slot = {
	type = "SlingAlt",
	name = "Sling",
	animset = "belt left",
	attachments = {
		Rifle = "SlingRifle2",
		BigBlade = "SlingWeapon2",
		BigWeapon = "SlingWeapon2",
		Shovel = "SlingShovel2",
	},
}
table.insert(ISHotbarAttachDefinition, slot);

slot = {
	type = "SlingAlt2",
	name = "Sling",
	animset = "belt left",
	attachments = {
		Rifle = "SlingRifle3",
		BigBlade = "SlingWeapon3",
		BigWeapon = "SlingWeapon3",
		Shovel = "SlingShovel3",
	},
}
table.insert(ISHotbarAttachDefinition, slot);