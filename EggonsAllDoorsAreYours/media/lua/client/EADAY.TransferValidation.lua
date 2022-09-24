EggonsMU.config.enableEvent("OnBeforeItemTransfer")
local function interceptDoorTransfer(eventData)
    if not SandboxVars.eggonsAllDoorsAreYours.AllowTransportInLargeTrunksOnly then
        return
    end
    local item = eventData.item
    local destContainer = eventData.destContainer
    -- print("EggonsMU.functions.getMainInventory() ", EggonsMU.functions.getMainInventory())
    -- print("getPlayer:getInventory() ", getPlayer():getInventory())
    if
        EADAY.isValidEADAYDoorItem(item) and destContainer:getType() ~= "floor" and destContainer:getCapacity() < 90 and
            destContainer ~= getPlayer():getInventory()
     then
        eventData.cancel = true
        getPlayer():Say("This is a door. It won't fit in such a small space.")
    end
end

Events.OnBeforeItemTransfer.Add(interceptDoorTransfer)
