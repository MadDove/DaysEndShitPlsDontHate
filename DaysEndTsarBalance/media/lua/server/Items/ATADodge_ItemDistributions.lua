require 'Items/ProceduralDistributions'

--[[table.insert(ProceduralDistributions.list["BookstoreBooks"].items, "Autotsar.ATADodgeTuningMag");
table.insert(ProceduralDistributions.list["BookstoreBooks"].items, 0.5);
table.insert(ProceduralDistributions.list["CrateMagazines"].items, "Autotsar.ATADodgeTuningMag");
table.insert(ProceduralDistributions.list["CrateMagazines"].items, 0.5);
table.insert(ProceduralDistributions.list["CrateMechanics"].items, "Autotsar.ATADodgeTuningMag");
table.insert(ProceduralDistributions.list["CrateMechanics"].items, 0.5);
table.insert(ProceduralDistributions.list["LibraryBooks"].items, "Autotsar.ATADodgeTuningMag");
table.insert(ProceduralDistributions.list["LibraryBooks"].items, 0.5);
table.insert(ProceduralDistributions.list["LivingRoomShelf"].items, "Autotsar.ATADodgeTuningMag");
table.insert(ProceduralDistributions.list["LivingRoomShelf"].items, 0.1);
table.insert(ProceduralDistributions.list["LivingRoomShelfNoTapes"].items, "Autotsar.ATADodgeTuningMag");
table.insert(ProceduralDistributions.list["LivingRoomShelfNoTapes"].items, 0.1);
table.insert(ProceduralDistributions.list["MagazineRackMixed"].items, "Autotsar.ATADodgeTuningMag");
table.insert(ProceduralDistributions.list["MagazineRackMixed"].items, 0.5);
table.insert(ProceduralDistributions.list["MechanicShelfBooks"].items, "Autotsar.ATADodgeTuningMag");
table.insert(ProceduralDistributions.list["MechanicShelfBooks"].items, 0.5);
table.insert(ProceduralDistributions.list["MechanicShelfBooks"].junk.items, "Autotsar.ATADodgeTuningMag");
table.insert(ProceduralDistributions.list["MechanicShelfBooks"].junk.items, 0.5);
table.insert(ProceduralDistributions.list["PostOfficeMagazines"].items, "Autotsar.ATADodgeTuningMag");
table.insert(ProceduralDistributions.list["PostOfficeMagazines"].items, 0.5);
table.insert(ProceduralDistributions.list["ShelfGeneric"].items, "Autotsar.ATADodgeTuningMag");
table.insert(ProceduralDistributions.list["ShelfGeneric"].items, 0.1);
table.insert(ProceduralDistributions.list["GarageMetalwork"].items, "Autotsar.ATADodgeTuningMag");
table.insert(ProceduralDistributions.list["GarageMetalwork"].items, 0.1);
table.insert(ProceduralDistributions.list["StoreShelfMechanics"].items, "Autotsar.ATADodgeTuningMag");
table.insert(ProceduralDistributions.list["StoreShelfMechanics"].items, 0.5);
table.insert(ProceduralDistributions.list["ToolStoreBooks"].items, "Autotsar.ATADodgeTuningMag");
table.insert(ProceduralDistributions.list["ToolStoreBooks"].items, 0.5);
table.insert(ProceduralDistributions.list["BookstoreMisc"].items, "Autotsar.ATADodgeTuningMag");
table.insert(ProceduralDistributions.list["BookstoreMisc"].items, 0.5);
table.insert(ProceduralDistributions.list["CampingStoreBooks"].items, "Autotsar.ATADodgeTuningMag");
table.insert(ProceduralDistributions.list["CampingStoreBooks"].items, 0.5);
table.insert(ProceduralDistributions.list["JanitorMisc"].items, "Autotsar.ATADodgeTuningMag");
table.insert(ProceduralDistributions.list["JanitorMisc"].items, 0.5);]]

table.insert(ProceduralDistributions.list["MechanicShelfBooks"].items, "Autotsar.ATADodgeTuningMag");
table.insert(ProceduralDistributions.list["MechanicShelfBooks"].items, 1);
table.insert(ProceduralDistributions.list["MechanicShelfMisc"].items, "Autotsar.ATADodgeTuningMag");
table.insert(ProceduralDistributions.list["MechanicShelfMisc"].items, 1);
table.insert(ProceduralDistributions.list["MechanicShelfTools"].items, "Autotsar.ATADodgeTuningMag");
table.insert(ProceduralDistributions.list["MechanicShelfTools"].items, 1);
ProceduralDistributions.list["MechanicShelfBooks"].rolls = ProceduralDistributions.list["MechanicShelfBooks"].rolls+2;
ProceduralDistributions.list["MechanicShelfMisc"].rolls = ProceduralDistributions.list["MechanicShelfMisc"].rolls+2;
ProceduralDistributions.list["MechanicShelfTools"].rolls = ProceduralDistributions.list["MechanicShelfMisc"].rolls+2;