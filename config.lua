--To add new items you will need to edit the code in here, client, server and in en.lua.
Config = {}

Config.defaultlang = "en"
Config.OpenItem = false

-- Cigarette Packs into cigs
Config.StartItemName1 = "cigarette_pack" --DB name for item you want to use in inventory
Config.EndItemName1 = "cigarette" -- DB name for item you want to revieve once using the item
Config.StartItemLabel1 = _U("startitem_1") -- Set startitem_1 in language file
Config.EndItemLabel1 = _U("enditem_1") -- Set enditem_1 in your language file
Config.ItemAmount1 = 10 -- Amount of items added once Config.StartItemName1 is used

-- Example Item 2:
Config.StartItemName2 = "crate_whiskey" --DB name for item you want to use in inventory
Config.EndItemName2 = "consumable_rye_whiskey" -- DB name for item you want to revieve once using the item
Config.StartItemLabel2 = _U("startitem_2") -- Edit your language file
Config.EndItemLabel2 = _U("enditem_2") -- Edit language file for the given item
Config.ItemAmount2 = 8 -- Amount of items added once Config.StartItemName is used

-- Example Item 3:
Config.StartItemName3 = "cigarette_carton" --DB name for item you want to use in inventory
Config.EndItemName3 = "cigarette_pack" -- DB name for item you want to revieve once using the item
Config.StartItemLabel3 = _U("startitem_3") -- Edit your language file
Config.EndItemLabel3 = _U("enditem_3") -- Edit language file for the given item
Config.ItemAmount3 = 6 -- Amount of items added once Config.StartItemName is used