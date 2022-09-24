

-- XP Functions
function Give10MechanicsXP(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Mechanics, 10);
end

function Give20MechanicsXP(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Mechanics, 20);
end