require "ISUI/Maps/ISMap"

function ISMap:canWrite()
    local inv = self.character:getInventory();
    return inv:contains("Pen", true) or inv:contains("Pencil", true) or inv:contains("BluePen", true) or inv:contains("RedPen", true) or inv:contains("GreenPen", true) or inv:contains("MulticolorPen", true);
end