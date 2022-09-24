
-- Huge thanks to the modder AuthenticPeach! This piece of code has been took from his mod "AuthenticZ"
--This file is dedicated towards tweaking particular item scripts to have certain tags
local TweakItemData = {};

--Prep code to make the changes to all item in the TweakItemData table.
local function doTweaks()
    for k,v in pairs(TweakItemData) do
        for t,y in pairs(v) do
            local item = ScriptManager.instance:getItem(k);
            if item ~= nil then
                item:DoParam(t.." = "..y);
                print("Tweaking Item: " .. k..": "..t..", "..y);
            end
        end
    end
end

local function TweakItem(itemName, itemProperty, propertyValue)
    if not TweakItemData[itemName] then
        TweakItemData[itemName] = {};
    end
    TweakItemData[itemName][itemProperty] = propertyValue;
end
Events.OnGameBoot.Add(doTweaks);

TweakItem("Base.9mmClip", "AttachmentType", "GunMagazine");
TweakItem("Base.45Clip", "AttachmentType", "GunMagazine");
TweakItem("Base.44Clip", "AttachmentType", "GunMagazine");
TweakItem("Base.223Clip", "AttachmentType", "GunMagazine");
TweakItem("Base.308Clip", "AttachmentType", "GunMagazine");
TweakItem("Base.556Clip", "AttachmentType", "GunMagazine");
TweakItem("Base.M14Clip", "AttachmentType", "GunMagazine");

--Firearms Mod--
TweakItem("Base.Glock17Mag", "AttachmentType", "GunMagazine");
TweakItem("Base.MP5Mag", "AttachmentType", "GunMagazine");
TweakItem("Base.UZIMag", "AttachmentType", "GunMagazine");
TweakItem("Base.AK_Mag", "AttachmentType", "GunMagazine");
TweakItem("Base.M60Mag", "AttachmentType", "GunMagazine");
TweakItem("Base.FN_FAL_Mag", "AttachmentType", "GunMagazine");

