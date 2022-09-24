require 'Items/ProceduralDistributions'

MoreDice = MoreDice or {};

-- Dice Bag
MoreDice.Procedural_DiceBag  = function(x,count)
    ProceduralDistributions = ProceduralDistributions or {};
    ProceduralDistributions.list = ProceduralDistributions.list or {};
    ProceduralDistributions.list[x] = ProceduralDistributions.list[x] or {};
    ProceduralDistributions.list[x].items = ProceduralDistributions.list[x].items or {};
    table.insert(ProceduralDistributions.list[x].items,"Base.DiceBag");
    table.insert(ProceduralDistributions.list[x].items, count);      
end
-- DiceD
MoreDice.Procedural_DiceD  = function(x,count)
    ProceduralDistributions = ProceduralDistributions or {};
    ProceduralDistributions.list = ProceduralDistributions.list or {};
    ProceduralDistributions.list[x] = ProceduralDistributions.list[x] or {};
    ProceduralDistributions.list[x].items = ProceduralDistributions.list[x].items or {};
    table.insert(ProceduralDistributions.list[x].items,"Base.DiceD4");
    table.insert(ProceduralDistributions.list[x].items, count);
    table.insert(ProceduralDistributions.list[x].items,"Base.DiceD6");
    table.insert(ProceduralDistributions.list[x].items, count);
    table.insert(ProceduralDistributions.list[x].items,"Base.DiceD8");
    table.insert(ProceduralDistributions.list[x].items, count);
    table.insert(ProceduralDistributions.list[x].items,"Base.DiceD10");  
    table.insert(ProceduralDistributions.list[x].items, count);
    table.insert(ProceduralDistributions.list[x].items,"Base.DiceD12");
    table.insert(ProceduralDistributions.list[x].items, count);  
    table.insert(ProceduralDistributions.list[x].items,"Base.DiceD20");
    table.insert(ProceduralDistributions.list[x].items, count);
    table.insert(ProceduralDistributions.list[x].items,"Base.DiceD100");
    table.insert(ProceduralDistributions.list[x].items, count);       
end

MoreDice.Procedural_DiceBag("BarCounterMisc",0.2);
MoreDice.Procedural_DiceBag("ClassroomMisc",0.2);
MoreDice.Procedural_DiceBag("CrateRandomJunk",0.1);
MoreDice.Procedural_DiceBag("CrateToys",1);
MoreDice.Procedural_DiceBag("DaycareCounter",0.3);
MoreDice.Procedural_DiceBag("DaycareShelves",0.3);
MoreDice.Procedural_DiceBag("GigamartSchool",1);
MoreDice.Procedural_DiceBag("GigamartToys",1);
MoreDice.Procedural_DiceBag("KitchenRandom",0.5);
MoreDice.Procedural_DiceBag("LibraryCounter",1);
MoreDice.Procedural_DiceBag("LivingRoomShelf",0.5);
MoreDice.Procedural_DiceBag("PrisonCellRandom",1);
MoreDice.Procedural_DiceBag("WardrobeChild",0.5);

MoreDice.Procedural_DiceD("BarCounterMisc",0.5);
MoreDice.Procedural_DiceD("ClassroomMisc",0.5);
MoreDice.Procedural_DiceD("CrateRandomJunk",0.5);
MoreDice.Procedural_DiceD("CrateToys",3);
MoreDice.Procedural_DiceD("DaycareCounter",0.5);
MoreDice.Procedural_DiceD("DaycareShelves",0.5);
MoreDice.Procedural_DiceD("GigamartSchool",2);
MoreDice.Procedural_DiceD("GigamartToys",3);
MoreDice.Procedural_DiceD("KitchenRandom",0.5);
MoreDice.Procedural_DiceD("LibraryCounter",2);
MoreDice.Procedural_DiceD("LivingRoomShelf",0.5);
MoreDice.Procedural_DiceD("PrisonCellRandom",0.5);
MoreDice.Procedural_DiceD("WardrobeChild",1);