local VORP_INV = exports.vorp_inventory:vorp_inventoryApi()

RegisterServerEvent("gilded_useitems:harvest")
RegisterServerEvent("gilded_useitems:harvest2")
RegisterServerEvent("gilded_useitems:harvest3")
--Dont need to touch to add new items
local function InventoryCheck(_source, item, count)
	local itemsAvailable = true
	local done = false
	TriggerEvent("vorpCore:canCarryItem", _source, item, count, function(canCarryItem)
		if canCarryItem ~= true then
			itemsAvailable = false
		end
		done = true
	end)
	while done == false do
		Wait(500)
	end
	if not itemsAvailable then
		-- Carrying too many of item already.
		TriggerClientEvent("vorp:TipRight", _source, _U("inv_nospace"), 5000)
		return false
	end
	if not VORP_INV.canCarryItems(_source, count) then
		-- Not enough space available in inventory.
		TriggerClientEvent("vorp:TipRight", _source, _U("inv_nospace"), 5000)
		return false
	end
	return true
end

--First item to open
local harvesting = {}
AddEventHandler("gilded_useitems:harvest", function()
	local _source = source
	if not harvesting[_source] then return end
	VORP_INV.addItem(_source, Config.EndItemName1, harvesting[_source])
	TriggerClientEvent("vorp:TipRight", _source, _UP("Opened", { count = harvesting[_source], item = Config.EndItemLabel1 }),
		5000)
	harvesting[_source] = nil
end)

--Second item to open
local harvesting2 = {}
AddEventHandler("gilded_useitems:harvest2", function()
	local _source = source
	if not harvesting2[_source] then return end
	VORP_INV.addItem(_source, Config.EndItemName2, harvesting2[_source])
	TriggerClientEvent("vorp:TipRight", _source, _UP("Opened", { count = harvesting2[_source], item = Config.EndItemLabel2 }),
		5000)
	harvesting2[_source] = nil
end)

--Third item to open
local harvesting3 = {}
AddEventHandler("gilded_useitems:harvest3", function()
	local _source = source
	if not harvesting3[_source] then return end
	VORP_INV.addItem(_source, Config.EndItemName3, harvesting3[_source])
	TriggerClientEvent("vorp:TipRight", _source, _UP("Opened", { count = harvesting3[_source], item = Config.EndItemLabel3 }),
		5000)
		harvesting3[_source] = nil
end)


-- First item to open below
if not Config.OpenItem then
	VORP_INV.RegisterUsableItem(Config.StartItemName1, function(data)
		if harvesting[data.source] then return end
		local count
		if type(Config.ItemAmount1) == "table" then
			count = math.random(Config.ItemAmount1[1], Config.ItemAmount1[2])
		else
			count = Config.ItemAmount1
		end
		VORP_INV.subItem(data.source, Config.StartItemName1, 1)
		if not InventoryCheck(data.source, Config.EndItemName1, count) then
			VORP_INV.addItem(data.source, Config.StartItemName1, 1)
			return
		end
		harvesting[data.source] = count
		TriggerClientEvent("gilded_useitems:harvest", data.source)
	end)
end

-- Second item to open below
if not Config.OpenItem then
	VORP_INV.RegisterUsableItem(Config.StartItemName2, function(data)
		if harvesting[data.source] then return end
		local count
		if type(Config.ItemAmount2) == "table" then
			count = math.random(Config.ItemAmount2[1], Config.ItemAmount2[2])
		else
			count = Config.ItemAmount2
		end
		VORP_INV.subItem(data.source, Config.StartItemName2, 1)
		if not InventoryCheck(data.source, Config.EndItemName2, count) then
			VORP_INV.addItem(data.source, Config.StartItemName2, 1)
			return
		end
		harvesting[data.source] = count
		TriggerClientEvent("gilded_useitems:harvest2", data.source)
	end)
end
--third item to open below
if not Config.OpenItem then
	VORP_INV.RegisterUsableItem(Config.StartItemName3, function(data)
		if harvesting2[data.source] then return end
		local count
		if type(Config.ItemAmount3) == "table" then
			count = math.random(Config.ItemAmount3[1], Config.ItemAmount3[2])
		else
			count = Config.ItemAmount3
		end
		VORP_INV.subItem(data.source, Config.StartItemName3, 1)
		if not InventoryCheck(data.source, Config.EndItemName3, count) then
			VORP_INV.addItem(data.source, Config.StartItemName3, 1)
			return
		end
		harvesting2[data.source] = count
		TriggerClientEvent("gilded_useitems:harvest3", data.source)
	end)
end


