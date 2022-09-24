-- This code is made by "Afterworlds" and has took from his mod "They Knew"
-- It makes Prepper Zombies spawn with  ammonition sometimes
function CheckDrops(zombie)
	if not zombie:getOutfitName() then return false end
	local outfit = tostring(zombie:getOutfitName());
	local inv = zombie:getInventory();
	if outfit == "Prepper" then
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.Bullets9mmBox", 1);
		end
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.Bullets44Box", 1);
		end
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.Bullets45Box", 1);
		end
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.Bullets9mmBox", 1);
		end
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.Bullets44Box", 1);
		end
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.Bullets45Box", 1);
		end
	end
end

Events.OnZombieDead.Add(CheckDrops);
