-- pull in the original farming code
require "Farming/SFarmingSystem"
-- store farming code
local Original_SFarmingSystem_growPlant = SFarmingSystem.growPlant;
-- this will be added to growplant function
function SFarmingSystem:growPlant(luaObject, ...)
	-- match seeded check, add check for growth stage before rot and force it to stay at stage.
	if luaObject.state == "seeded" and luaObject.nbOfGrow > 6 then
		luaObject.nbOfGrow = 6;
	end
	return Original_SFarmingSystem_growPlant(self, luaObject, ...);
end
