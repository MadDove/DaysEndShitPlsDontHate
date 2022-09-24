EggonsMU.config.enableEvent("OnBeforeFirstInventoryTooltipDisplay")

local function prepareTooltipData(item)
    if EADAY.isValidEADAYDoorItem(item) then
        local DMD = item:getModData().EADAY
        local newTooltip
        if DMD then
            newTooltip = DMD.name
        else
            newTooltip = "Door"
        end
        item:setTooltip(newTooltip)
    end
end

Events.OnBeforeFirstInventoryTooltipDisplay.Add(prepareTooltipData)
