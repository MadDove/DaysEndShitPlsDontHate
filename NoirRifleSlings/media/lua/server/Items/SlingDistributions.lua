local proceduralPlaces = {
    PoliceStorageOutfit = 10,
    PoliceLockers = 10,
    ArmyStorageOutfit = 15,
    LockerArmyBedroom = 15,

    FirearmWeapons = 10,
    PawnShopGunsSpecial = 10,
    ArmySurplusOutfit = 10,

    GunStoreShelf = 10,
    CampingStoreGear = 10,
    CampingStoreBackpacks = 10,
    WardrobeRedneck = 5,
}

local suburbsPlaces = {
    ["SurvivorCache1.SurvivorCrate"] = 5,
    ["SurvivorCache2.SurvivorCrate"] = 5,
    Bag_WeaponBag = 5,
    Bag_SurvivorBag = 5,
}

local vehiclePlaces = {
    ["Police.TruckBed"] = 10,
    SurvivalistTruckBed = 10,
    HunterTruckBed = 10,
}

local function hasDot(s)
    local dot = string.find(s,".",1,true)
    local v1,v2
    if dot then
        v1 = string.sub(s,1,dot-1)
        v2 = string.sub(s,dot+1,-1)
    end
    return dot,v1,v2
end

for k,v in pairs(proceduralPlaces) do 
    table.insert(ProceduralDistributions.list[k].items, "Base.SlingA");
    table.insert(ProceduralDistributions.list[k].items, v);
end

for k,v in pairs(suburbsPlaces) do 
    local found,k1,k2 = hasDot(k)
    if found then 
        table.insert(SuburbsDistributions[k1][k2].items, "Base.SlingA");
        table.insert(SuburbsDistributions[k1][k2].items, v);
    else
        table.insert(SuburbsDistributions[k].items, "Base.SlingA");
        table.insert(SuburbsDistributions[k].items, v);
    end
end

for k,v in pairs(vehiclePlaces) do 
    local found,k1,k2 = hasDot(k)
    if found then 
        table.insert(VehicleDistributions[k1][k2].items, "Base.SlingA");
        table.insert(VehicleDistributions[k1][k2].items, v);
    else
        table.insert(VehicleDistributions[k].items, "Base.SlingA");
        table.insert(VehicleDistributions[k].items, v);
    end
    
end