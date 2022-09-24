require "Items/Distributions"
require "Items/ItemPicker"
require "Items/ProceduralDistributions"
require "Vehicles/VehicleDistributions"

local cooleritems = {
	OrganCooler = {areas={ArmyStorageMedical=1,MedicalClinicOutfit=1}},
	RedCooler ={areas={CampingStoreGear=1,CrateCamping=1,ClosetShelfGeneric=1}},
	Bag_InsulatedPack ={areas={CampingStoreGear=1,CrateCamping=1,ClosetShelfGeneric=1}},
	SmallIcePack = {areas={FreezerGeneric=2,FreezerTrailerPark=2,FreezerRich=2,GigamartHousewares=2}},
	LargeIcePack = {areas={FreezerGeneric=2,FreezerTrailerPark=2,FreezerRich=3,GigamartHousewares=2}}
}
local pitems = ProceduralDistributions.list;

for item,data in pairs(cooleritems) do
	for area,rate in pairs(data.areas) do
		local ilist = pitems[area].items
		table.insert(ilist,item)
		table.insert(ilist,rate)
	end
end

--lunchboxes sometimes contain an ice pack
table.insert(SuburbsDistributions["Lunchbox"].items,'SmallIcePack')
table.insert(SuburbsDistributions["Lunchbox"].items,2)
table.insert(SuburbsDistributions["Lunchbox2"].items,'SmallIcePack')
table.insert(SuburbsDistributions["Lunchbox2"].items,2)