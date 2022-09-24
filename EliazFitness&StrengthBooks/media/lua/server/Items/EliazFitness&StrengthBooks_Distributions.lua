require "Items/Distributions"
require "Items/SuburbsDistributions"
require "Items/ProceduralDistributions"
require "Vehicles/VehicleDistributions"
require "Items/ItemPicker"	

--PROCEDURALDISTRIBUTIONS.LUA--

--BookstoreBooks
table.insert(ProceduralDistributions.list["BookstoreBooks"].items, "base.BookStrength1");
table.insert(ProceduralDistributions.list["BookstoreBooks"].items, 5);
table.insert(ProceduralDistributions.list["BookstoreBooks"].items, "base.BookStrength2");
table.insert(ProceduralDistributions.list["BookstoreBooks"].items, 4);
table.insert(ProceduralDistributions.list["BookstoreBooks"].items, "base.BookStrength3");
table.insert(ProceduralDistributions.list["BookstoreBooks"].items, 3);
table.insert(ProceduralDistributions.list["BookstoreBooks"].items, "base.BookStrength4");
table.insert(ProceduralDistributions.list["BookstoreBooks"].items, 2);
table.insert(ProceduralDistributions.list["BookstoreBooks"].items, "base.BookStrength5");
table.insert(ProceduralDistributions.list["BookstoreBooks"].items, 1);
table.insert(ProceduralDistributions.list["BookstoreBooks"].items, "base.BookFitness1");
table.insert(ProceduralDistributions.list["BookstoreBooks"].items, 5);
table.insert(ProceduralDistributions.list["BookstoreBooks"].items, "base.BookFitness2");
table.insert(ProceduralDistributions.list["BookstoreBooks"].items, 4);
table.insert(ProceduralDistributions.list["BookstoreBooks"].items, "base.BookFitness3");
table.insert(ProceduralDistributions.list["BookstoreBooks"].items, 3);
table.insert(ProceduralDistributions.list["BookstoreBooks"].items, "base.BookFitness4");
table.insert(ProceduralDistributions.list["BookstoreBooks"].items, 2);
table.insert(ProceduralDistributions.list["BookstoreBooks"].items, "base.BookFitness5");
table.insert(ProceduralDistributions.list["BookstoreBooks"].items, 1);

--ClassroomMisc
table.insert(ProceduralDistributions.list["ClassroomMisc"].items, "base.BookStrength1");
table.insert(ProceduralDistributions.list["ClassroomMisc"].items, 1);
table.insert(ProceduralDistributions.list["ClassroomMisc"].items, "base.BookStrength2");
table.insert(ProceduralDistributions.list["ClassroomMisc"].items, 0.5);
table.insert(ProceduralDistributions.list["ClassroomMisc"].items, "base.BookStrength3");
table.insert(ProceduralDistributions.list["ClassroomMisc"].items, 0.25);
table.insert(ProceduralDistributions.list["ClassroomMisc"].items, "base.BookStrength4");
table.insert(ProceduralDistributions.list["ClassroomMisc"].items, 0.05);
table.insert(ProceduralDistributions.list["ClassroomMisc"].items, "base.BookStrength5");
table.insert(ProceduralDistributions.list["ClassroomMisc"].items, 0.01);
table.insert(ProceduralDistributions.list["ClassroomMisc"].items, "base.BookFitness1");
table.insert(ProceduralDistributions.list["ClassroomMisc"].items, 1);
table.insert(ProceduralDistributions.list["ClassroomMisc"].items, "base.BookFitness2");
table.insert(ProceduralDistributions.list["ClassroomMisc"].items, 0.5);
table.insert(ProceduralDistributions.list["ClassroomMisc"].items, "base.BookFitness3");
table.insert(ProceduralDistributions.list["ClassroomMisc"].items, 0.25);
table.insert(ProceduralDistributions.list["ClassroomMisc"].items, "base.BookFitness4");
table.insert(ProceduralDistributions.list["ClassroomMisc"].items, 0.05);
table.insert(ProceduralDistributions.list["ClassroomMisc"].items, "base.BookFitness5");
table.insert(ProceduralDistributions.list["ClassroomMisc"].items, 0.01);

--ClassroomShelves
table.insert(ProceduralDistributions.list["ClassroomShelves"].items, "base.BookStrength1");
table.insert(ProceduralDistributions.list["ClassroomShelves"].items, 1);
table.insert(ProceduralDistributions.list["ClassroomShelves"].items, "base.BookStrength2");
table.insert(ProceduralDistributions.list["ClassroomShelves"].items, 0.5);
table.insert(ProceduralDistributions.list["ClassroomShelves"].items, "base.BookStrength3");
table.insert(ProceduralDistributions.list["ClassroomShelves"].items, 0.25);
table.insert(ProceduralDistributions.list["ClassroomShelves"].items, "base.BookStrength4");
table.insert(ProceduralDistributions.list["ClassroomShelves"].items, 0.05);
table.insert(ProceduralDistributions.list["ClassroomShelves"].items, "base.BookStrength5");
table.insert(ProceduralDistributions.list["ClassroomShelves"].items, 0.01);
table.insert(ProceduralDistributions.list["ClassroomShelves"].items, "base.BookFitness1");
table.insert(ProceduralDistributions.list["ClassroomShelves"].items, 1);
table.insert(ProceduralDistributions.list["ClassroomShelves"].items, "base.BookFitness2");
table.insert(ProceduralDistributions.list["ClassroomShelves"].items, 0.5);
table.insert(ProceduralDistributions.list["ClassroomShelves"].items, "base.BookFitness3");
table.insert(ProceduralDistributions.list["ClassroomShelves"].items, 0.25);
table.insert(ProceduralDistributions.list["ClassroomShelves"].items, "base.BookFitness4");
table.insert(ProceduralDistributions.list["ClassroomShelves"].items, 0.05);
table.insert(ProceduralDistributions.list["ClassroomShelves"].items, "base.BookFitness5");
table.insert(ProceduralDistributions.list["ClassroomShelves"].items, 0.01);

--CrateBooks
table.insert(ProceduralDistributions.list["CrateBooks"].items, "base.BookStrength1");
table.insert(ProceduralDistributions.list["CrateBooks"].items, 3);
table.insert(ProceduralDistributions.list["CrateBooks"].items, "base.BookStrength2");
table.insert(ProceduralDistributions.list["CrateBooks"].items, 2);
table.insert(ProceduralDistributions.list["CrateBooks"].items, "base.BookStrength3");
table.insert(ProceduralDistributions.list["CrateBooks"].items, 1);
table.insert(ProceduralDistributions.list["CrateBooks"].items, "base.BookStrength4");
table.insert(ProceduralDistributions.list["CrateBooks"].items, 0.5);
table.insert(ProceduralDistributions.list["CrateBooks"].items, "base.BookStrength5");
table.insert(ProceduralDistributions.list["CrateBooks"].items, 0.25);
table.insert(ProceduralDistributions.list["CrateBooks"].items, "base.BookFitness1");
table.insert(ProceduralDistributions.list["CrateBooks"].items, 3);
table.insert(ProceduralDistributions.list["CrateBooks"].items, "base.BookFitness2");
table.insert(ProceduralDistributions.list["CrateBooks"].items, 2);
table.insert(ProceduralDistributions.list["CrateBooks"].items, "base.BookFitness3");
table.insert(ProceduralDistributions.list["CrateBooks"].items, 1);
table.insert(ProceduralDistributions.list["CrateBooks"].items, "base.BookFitness4");
table.insert(ProceduralDistributions.list["CrateBooks"].items, 0.5);
table.insert(ProceduralDistributions.list["CrateBooks"].items, "base.BookFitness5");
table.insert(ProceduralDistributions.list["CrateBooks"].items, 0.25);

--LibraryBooks
table.insert(ProceduralDistributions.list["LibraryBooks"].items, "base.BookStrength1");
table.insert(ProceduralDistributions.list["LibraryBooks"].items, 4);
table.insert(ProceduralDistributions.list["LibraryBooks"].items, "base.BookStrength2");
table.insert(ProceduralDistributions.list["LibraryBooks"].items, 3);
table.insert(ProceduralDistributions.list["LibraryBooks"].items, "base.BookStrength3");
table.insert(ProceduralDistributions.list["LibraryBooks"].items, 2);
table.insert(ProceduralDistributions.list["LibraryBooks"].items, "base.BookStrength4");
table.insert(ProceduralDistributions.list["LibraryBooks"].items, 1);
table.insert(ProceduralDistributions.list["LibraryBooks"].items, "base.BookStrength5");
table.insert(ProceduralDistributions.list["LibraryBooks"].items, 0.5);
table.insert(ProceduralDistributions.list["LibraryBooks"].items, "base.BookFitness1");
table.insert(ProceduralDistributions.list["LibraryBooks"].items, 4);
table.insert(ProceduralDistributions.list["LibraryBooks"].items, "base.BookFitness2");
table.insert(ProceduralDistributions.list["LibraryBooks"].items, 3);
table.insert(ProceduralDistributions.list["LibraryBooks"].items, "base.BookFitness3");
table.insert(ProceduralDistributions.list["LibraryBooks"].items, 2);
table.insert(ProceduralDistributions.list["LibraryBooks"].items, "base.BookFitness4");
table.insert(ProceduralDistributions.list["LibraryBooks"].items, 1);
table.insert(ProceduralDistributions.list["LibraryBooks"].items, "base.BookFitness5");
table.insert(ProceduralDistributions.list["LibraryBooks"].items, 0.5);

--LivingRoomShelf
table.insert(ProceduralDistributions.list["LivingRoomShelf"].items, "base.BookStrength1");
table.insert(ProceduralDistributions.list["LivingRoomShelf"].items, 1);
table.insert(ProceduralDistributions.list["LivingRoomShelf"].items, "base.BookStrength2");
table.insert(ProceduralDistributions.list["LivingRoomShelf"].items, 0.5);
table.insert(ProceduralDistributions.list["LivingRoomShelf"].items, "base.BookStrength3");
table.insert(ProceduralDistributions.list["LivingRoomShelf"].items, 0.25);
table.insert(ProceduralDistributions.list["LivingRoomShelf"].items, "base.BookStrength4");
table.insert(ProceduralDistributions.list["LivingRoomShelf"].items, 0.05);
table.insert(ProceduralDistributions.list["LivingRoomShelf"].items, "base.BookStrength5");
table.insert(ProceduralDistributions.list["LivingRoomShelf"].items, 0.01);
table.insert(ProceduralDistributions.list["LivingRoomShelf"].items, "base.BookFitness1");
table.insert(ProceduralDistributions.list["LivingRoomShelf"].items, 1);
table.insert(ProceduralDistributions.list["LivingRoomShelf"].items, "base.BookFitness2");
table.insert(ProceduralDistributions.list["LivingRoomShelf"].items, 0.5);
table.insert(ProceduralDistributions.list["LivingRoomShelf"].items, "base.BookFitness3");
table.insert(ProceduralDistributions.list["LivingRoomShelf"].items, 0.25);
table.insert(ProceduralDistributions.list["LivingRoomShelf"].items, "base.BookFitness4");
table.insert(ProceduralDistributions.list["LivingRoomShelf"].items, 0.05);
table.insert(ProceduralDistributions.list["LivingRoomShelf"].items, "base.BookFitness5");
table.insert(ProceduralDistributions.list["LivingRoomShelf"].items, 0.01);

--LivingRoomShelfNoTapes
table.insert(ProceduralDistributions.list["LivingRoomShelfNoTapes"].items, "base.BookStrength1");
table.insert(ProceduralDistributions.list["LivingRoomShelfNoTapes"].items, 1);
table.insert(ProceduralDistributions.list["LivingRoomShelfNoTapes"].items, "base.BookStrength2");
table.insert(ProceduralDistributions.list["LivingRoomShelfNoTapes"].items, 0.5);
table.insert(ProceduralDistributions.list["LivingRoomShelfNoTapes"].items, "base.BookStrength3");
table.insert(ProceduralDistributions.list["LivingRoomShelfNoTapes"].items, 0.25);
table.insert(ProceduralDistributions.list["LivingRoomShelfNoTapes"].items, "base.BookStrength4");
table.insert(ProceduralDistributions.list["LivingRoomShelfNoTapes"].items, 0.05);
table.insert(ProceduralDistributions.list["LivingRoomShelfNoTapes"].items, "base.BookStrength5");
table.insert(ProceduralDistributions.list["LivingRoomShelfNoTapes"].items, 0.01);
table.insert(ProceduralDistributions.list["LivingRoomShelfNoTapes"].items, "base.BookFitness1");
table.insert(ProceduralDistributions.list["LivingRoomShelfNoTapes"].items, 1);
table.insert(ProceduralDistributions.list["LivingRoomShelfNoTapes"].items, "base.BookFitness2");
table.insert(ProceduralDistributions.list["LivingRoomShelfNoTapes"].items, 0.5);
table.insert(ProceduralDistributions.list["LivingRoomShelfNoTapes"].items, "base.BookFitness3");
table.insert(ProceduralDistributions.list["LivingRoomShelfNoTapes"].items, 0.25);
table.insert(ProceduralDistributions.list["LivingRoomShelfNoTapes"].items, "base.BookFitness4");
table.insert(ProceduralDistributions.list["LivingRoomShelfNoTapes"].items, 0.05);
table.insert(ProceduralDistributions.list["LivingRoomShelfNoTapes"].items, "base.BookFitness5");
table.insert(ProceduralDistributions.list["LivingRoomShelfNoTapes"].items, 0.01);

--PostOfficeBooks
table.insert(ProceduralDistributions.list["PostOfficeBooks"].items, "base.BookStrength1");
table.insert(ProceduralDistributions.list["PostOfficeBooks"].items, 3);
table.insert(ProceduralDistributions.list["PostOfficeBooks"].items, "base.BookStrength2");
table.insert(ProceduralDistributions.list["PostOfficeBooks"].items, 2);
table.insert(ProceduralDistributions.list["PostOfficeBooks"].items, "base.BookStrength3");
table.insert(ProceduralDistributions.list["PostOfficeBooks"].items, 1);
table.insert(ProceduralDistributions.list["PostOfficeBooks"].items, "base.BookStrength4");
table.insert(ProceduralDistributions.list["PostOfficeBooks"].items, 0.5);
table.insert(ProceduralDistributions.list["PostOfficeBooks"].items, "base.BookStrength5");
table.insert(ProceduralDistributions.list["PostOfficeBooks"].items, 0.25);
table.insert(ProceduralDistributions.list["PostOfficeBooks"].items, "base.BookFitness1");
table.insert(ProceduralDistributions.list["PostOfficeBooks"].items, 3);
table.insert(ProceduralDistributions.list["PostOfficeBooks"].items, "base.BookFitness2");
table.insert(ProceduralDistributions.list["PostOfficeBooks"].items, 2);
table.insert(ProceduralDistributions.list["PostOfficeBooks"].items, "base.BookFitness3");
table.insert(ProceduralDistributions.list["PostOfficeBooks"].items, 1);
table.insert(ProceduralDistributions.list["PostOfficeBooks"].items, "base.BookFitness4");
table.insert(ProceduralDistributions.list["PostOfficeBooks"].items, 0.5);
table.insert(ProceduralDistributions.list["PostOfficeBooks"].items, "base.BookFitness5");
table.insert(ProceduralDistributions.list["PostOfficeBooks"].items, 0.25);

--ShelfGeneric
table.insert(ProceduralDistributions.list["ShelfGeneric"].items, "base.BookStrength1");
table.insert(ProceduralDistributions.list["ShelfGeneric"].items, 1);
table.insert(ProceduralDistributions.list["ShelfGeneric"].items, "base.BookStrength2");
table.insert(ProceduralDistributions.list["ShelfGeneric"].items, 0.5);
table.insert(ProceduralDistributions.list["ShelfGeneric"].items, "base.BookStrength3");
table.insert(ProceduralDistributions.list["ShelfGeneric"].items, 0.25);
table.insert(ProceduralDistributions.list["ShelfGeneric"].items, "base.BookStrength4");
table.insert(ProceduralDistributions.list["ShelfGeneric"].items, 0.05);
table.insert(ProceduralDistributions.list["ShelfGeneric"].items, "base.BookStrength5");
table.insert(ProceduralDistributions.list["ShelfGeneric"].items, 0.01);
table.insert(ProceduralDistributions.list["ShelfGeneric"].items, "base.BookFitness1");
table.insert(ProceduralDistributions.list["ShelfGeneric"].items, 1);
table.insert(ProceduralDistributions.list["ShelfGeneric"].items, "base.BookFitness2");
table.insert(ProceduralDistributions.list["ShelfGeneric"].items, 0.5);
table.insert(ProceduralDistributions.list["ShelfGeneric"].items, "base.BookFitness3");
table.insert(ProceduralDistributions.list["ShelfGeneric"].items, 0.25);
table.insert(ProceduralDistributions.list["ShelfGeneric"].items, "base.BookFitness4");
table.insert(ProceduralDistributions.list["ShelfGeneric"].items, 0.05);
table.insert(ProceduralDistributions.list["ShelfGeneric"].items, "base.BookFitness5");
table.insert(ProceduralDistributions.list["ShelfGeneric"].items, 0.01);


