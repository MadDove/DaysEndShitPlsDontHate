DiceD4Rolls = {
	
	"Zero",
	"One",
	"Two",
	"Three",
	"Four",
	}

function RollDiceD4_OnCreate(items, result, player)
	local roll1 = ZombRand(1,5)
	player:Say(tostring(roll1))
	player:Say(DiceD4Rolls[(roll1 + 1)] .. "!")
	local sq = player:getSquare()
	sq:AddWorldInventoryItem("Base.DiceD4", 0.0, 0.0, 0.0)
end


DiceD6Rolls = {
	
	"Zero",
	"One",
	"Two",
	"Three",
	"Four",
	"Five",
	"Six",
	}

function RollDiceD6_OnCreate(items, result, player)
	local roll1 = ZombRand(1,7)
	player:Say(tostring(roll1))
	player:Say(DiceD6Rolls[(roll1 + 1)] .. "!")
	local sq = player:getSquare()
	sq:AddWorldInventoryItem("Base.DiceD6", 0.0, 0.0, 0.0)
end

DiceD8Rolls = {
	
	"Zero",
	"One",
	"Two",
	"Three",
	"Four",
	"Five",
	"Six",
	"Seven",
	"Eight",
	}

function RollDiceD8_OnCreate(items, result, player)
	local roll1 = ZombRand(1,9)
	player:Say(tostring(roll1))
	player:Say(DiceD8Rolls[(roll1 + 1)] .. "!")
	local sq = player:getSquare()
	sq:AddWorldInventoryItem("Base.DiceD8", 0.0, 0.0, 0.0)
end

DiceD10Rolls = {
	
	"Zero",
	"One",
	"Two",
	"Three",
	"Four",
	"Five",
	"Six",
	"Seven",
	"Eight",
	"Nine",
	"Ten",
	}

function RollDiceD10_OnCreate(items, result, player)
	local roll1 = ZombRand(1,11)
	player:Say(tostring(roll1))
	player:Say(DiceD10Rolls[(roll1 + 1)] .. "!")
	local sq = player:getSquare()
	sq:AddWorldInventoryItem("Base.DiceD10", 0.0, 0.0, 0.0)
end

DiceD12Rolls = {
	
	"Zero",
	"One",
	"Two",
	"Three",
	"Four",
	"Five",
	"Six",
	"Seven",
	"Eight",
	"Nine",
	"Ten",
	"Eleven",
	"Twelve",
	}

function RollDiceD12_OnCreate(items, result, player)
	local roll1 = ZombRand(1,13)
	player:Say(tostring(roll1))
	player:Say(DiceD12Rolls[(roll1 + 1)] .. "!")
	local sq = player:getSquare()
	sq:AddWorldInventoryItem("Base.DiceD12", 0.0, 0.0, 0.0)
end

DiceD20Rolls = {
	
	"Zero",
	"One",
	"Two",
	"Three",
	"Four",
	"Five",
	"Six",
	"Seven",
	"Eight",
	"Nine",
	"Ten",
	"Eleven",
	"Twelve",
	"Thirteen",
	"Fourteen",
	"Fifteen",
	"Sixteen",
	"Seventeen",
	"Eighteen",
	"Nineteen",
	"Twenty",
	}

function RollDiceD20_OnCreate(items, result, player)
	local roll1 = ZombRand(1,21)
	player:Say(tostring(roll1))
	player:Say(DiceD20Rolls[(roll1 + 1)] .. "!")
	local sq = player:getSquare()
	sq:AddWorldInventoryItem("Base.DiceD20", 0.0, 0.0, 0.0)
end

DiceD100Rolls = {
	
	"One Hundred",
	"Ten",
	"Twenty",
	"Thirty",
	"Forty",
	"Fifty",
	"Sixty",
	"Seventy",
	"Eighty",
	"Ninety",
	}

function RollDiceD100_OnCreate(items, result, player)
	local roll1 = ZombRand(00,10,20,30,40,50,60,70,80,90)
	player:Say(tostring(roll1) .. "0")
	player:Say(DiceD100Rolls[(roll1 + 1)] .. "!")
	local sq = player:getSquare()
	sq:AddWorldInventoryItem("Base.DiceD100", 0.0, 0.0, 0.0)
end

	DiceRolls = {

		"Zero",
		"One",
		"Two, Snake Eyes",
		"Three",
		"Four",
		"Five",
		"Six",
		"Seven",
		"Eight",
		"Nine",
		"Ten",
		"Eleven",
		"Twelve",
		}
	
function RollDice_OnCreate(items, result, player)
		local roll1 = ZombRand(1,6)
		local roll2 = ZombRand(1,6)
		player:Say(tostring(roll1) .. " & " .. tostring(roll2))
		player:Say(DiceRolls[(roll1 + roll2 + 1)] .. "!")
		local sq = player:getSquare()
		sq:AddWorldInventoryItem("Base.Dice", 0.0, 0.0, 0.0)
end

function Get_Dice(items, result, player)
    player:getInventory():AddItem("DiceD6")
    player:getInventory():AddItem("DiceD8")
    player:getInventory():AddItem("DiceD10")
    player:getInventory():AddItem("DiceD12")
    player:getInventory():AddItem("DiceD20")
    player:getInventory():AddItem("DiceD100")
end