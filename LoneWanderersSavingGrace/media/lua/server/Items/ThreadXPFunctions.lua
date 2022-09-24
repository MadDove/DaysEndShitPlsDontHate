function Recipe.OnGiveXP.Tailoring1(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Tailoring, 1);
end

function Recipe.OnGiveXP.Tailoring2(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Tailoring, 2);
end

function Recipe.OnGiveXP.Tailoring4(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Tailoring, 4);
end

function Recipe.OnGiveXP.Tailoring6(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Tailoring, 6);
end

function Recipe.OnGiveXP.Tailoring8(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Tailoring, 8);
end

function Recipe.OnGiveXP.Tailoring11(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Tailoring, 11);
end

-- These functions are defined to avoid breaking mods.
Get1TailoringXP = Recipe.OnGiveXP.Tailoring1
Get2TailoringXP = Recipe.OnGiveXP.Tailoring2
Get4TailoringXP = Recipe.OnGiveXP.Tailoring4
Get6TailoringXP = Recipe.OnGiveXP.Tailoring6
Get8TailoringXP = Recipe.OnGiveXP.Tailoring8
Get11TailoringXP = Recipe.OnGiveXP.Tailoring11

function Recipe.OnGiveXP.Doctor1(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Doctor, 1);
end

function Recipe.OnGiveXP.Doctor2(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Doctor, 2);
end

function Recipe.OnGiveXP.Doctor4(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Doctor, 4);
end

function Recipe.OnGiveXP.Doctor6(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Doctor, 6);
end

function Recipe.OnGiveXP.Doctor8(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Doctor, 8);
end

function Recipe.OnGiveXP.Doctor11(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Doctor, 11);
end

-- These functions are defined to avoid breaking mods.
Get1DoctorXP = Recipe.OnGiveXP.Doctor1
Get2DoctorXP = Recipe.OnGiveXP.Doctor2
Get4DoctorXP = Recipe.OnGiveXP.Doctor4
Get6DoctorXP = Recipe.OnGiveXP.Doctor6
Get8DoctorXP = Recipe.OnGiveXP.Doctor8
Get11DoctorXP = Recipe.OnGiveXP.Doctor11

function Recipe.OnGiveXP.Farming1(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Farming, 1);
end

function Recipe.OnGiveXP.Farming2(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Farming, 2);
end

function Recipe.OnGiveXP.Farming4(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Farming, 4);
end

function Recipe.OnGiveXP.Farming6(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Farming, 6);
end

function Recipe.OnGiveXP.Farming8(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Farming, 8);
end

function Recipe.OnGiveXP.Farming11(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Farming, 11);
end

-- These functions are defined to avoid breaking mods.
Get1FarmingXP = Recipe.OnGiveXP.Farming1
Get2FarmingXP = Recipe.OnGiveXP.Farming2
Get4FarmingXP = Recipe.OnGiveXP.Farming4
Get6FarmingXP = Recipe.OnGiveXP.Farming6
Get8FarmingXP = Recipe.OnGiveXP.Farming8
Get11FarmingXP = Recipe.OnGiveXP.Farming11
