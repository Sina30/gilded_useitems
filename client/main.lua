RegisterNetEvent("gilded_useitems:harvest")
RegisterNetEvent("gilded_useitems:harvest2")

--First item to open
AddEventHandler("gilded_useitems:harvest", function()
	local playerPed = PlayerPedId()
	local dict, anim = "mech_skin@chicken@field_dress", "success"
	RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		Wait(0)
	end
	TaskPlayAnim(playerPed, dict, anim, 1.0, 1.0, 4000, 16, 0.0, false, false, false, '', false)
	exports['progressBars']:startUI(5000, _U("Opening")) -- Opening is editable within language file
	Citizen.Wait(5000)
	ClearPedTasksImmediately(playerPed)
	RemoveAnimDict(dict)
	TriggerServerEvent("gilded_useitems:harvest")
end)

--Second item to open
AddEventHandler("gilded_useitems:harvest2", function()
	local playerPed = PlayerPedId()
	local dict, anim = "mech_skin@chicken@field_dress", "success"
	RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		Wait(0)
	end
	TaskPlayAnim(playerPed, dict, anim, 1.0, 1.0, 4000, 16, 0.0, false, false, false, '', false)
	exports['progressBars']:startUI(5000, _U("Opening")) -- Opening is editable within language file
	Citizen.Wait(5000)
	ClearPedTasksImmediately(playerPed)
	RemoveAnimDict(dict)
	TriggerServerEvent("gilded_useitems:harvest2")
end)
