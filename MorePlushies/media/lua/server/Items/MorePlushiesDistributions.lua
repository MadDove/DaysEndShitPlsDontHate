require 'Items/ProceduralDistributions'

MorePlushies = MorePlushies or {};

-- Plushies
MorePlushies.Procedural_Plushies  = function(x,count)
    ProceduralDistributions = ProceduralDistributions or {};
    ProceduralDistributions.list = ProceduralDistributions.list or {};
    ProceduralDistributions.list[x] = ProceduralDistributions.list[x] or {};
    ProceduralDistributions.list[x].items = ProceduralDistributions.list[x].items or {};
    table.insert(ProceduralDistributions.list[x].items,"Base.PigPlushie");
    table.insert(ProceduralDistributions.list[x].items, count);
    table.insert(ProceduralDistributions.list[x].items,"Base.AxolotlPlushie");
    table.insert(ProceduralDistributions.list[x].items, count);
    table.insert(ProceduralDistributions.list[x].items,"Base.RoyalePlushie");
    table.insert(ProceduralDistributions.list[x].items, count);
    table.insert(ProceduralDistributions.list[x].items,"Base.BioPlushie");  
    table.insert(ProceduralDistributions.list[x].items, count);
    table.insert(ProceduralDistributions.list[x].items,"Base.BatmanPlushie");
    table.insert(ProceduralDistributions.list[x].items, count);   
    table.insert(ProceduralDistributions.list[x].items,"Base.StitchesPlushie");
    table.insert(ProceduralDistributions.list[x].items, count);    
    table.insert(ProceduralDistributions.list[x].items,"Base.ChocobiPlushie");
    table.insert(ProceduralDistributions.list[x].items, count); 
    table.insert(ProceduralDistributions.list[x].items,"Base.GrebdiozPlushie");
    table.insert(ProceduralDistributions.list[x].items, count); 
    table.insert(ProceduralDistributions.list[x].items,"Base.GIRPlushie");
    table.insert(ProceduralDistributions.list[x].items, count); 
    table.insert(ProceduralDistributions.list[x].items,"Base.DeathBeePlushie");
    table.insert(ProceduralDistributions.list[x].items, count); 
    table.insert(ProceduralDistributions.list[x].items,"Base.GroguPlushie");
    table.insert(ProceduralDistributions.list[x].items, count); 
    table.insert(ProceduralDistributions.list[x].items,"Base.MiniMoosePlushie");
    table.insert(ProceduralDistributions.list[x].items, count); 
end


MorePlushies.Procedural_Plushies("ClassroomMisc",0.1);
MorePlushies.Procedural_Plushies("CrateRandomJunk",0.5);
MorePlushies.Procedural_Plushies("CrateToys",2);
MorePlushies.Procedural_Plushies("DaycareCounter",0.5);
MorePlushies.Procedural_Plushies("DaycareShelves",0.5);
MorePlushies.Procedural_Plushies("GigamartSchool",0.5);
MorePlushies.Procedural_Plushies("GigamartToys",2);
MorePlushies.Procedural_Plushies("KitchenRandom",0.2);
MorePlushies.Procedural_Plushies("PrisonCellRandom",0.5);
MorePlushies.Procedural_Plushies("WardrobeChild",0.5);