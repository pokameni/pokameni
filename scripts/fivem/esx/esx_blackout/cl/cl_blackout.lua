ESX = nil
local PlayerData = {}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData = xPlayer
end)

local state = false

RegisterNetEvent('esx_blackout:bmode')
AddEventHandler('esx_blackout:bmode',function()
	state = true
	PlaySoundFrontend(-1, "Power_Down", "DLC_HEIST_HACKING_SNAKE_SOUNDS", 1)
	Citizen.Wait(48000) -- 1000 = 1s | 48000 = 48s
	state = false
	PlaySoundFrontend(-1, "police_notification", "DLC_AS_VNT_Sounds", 1)
end)

Citizen.CreateThread(function()
	while true do
		if state == true then
			SetArtificialLightsState(state)
			DisableControlAction(0, 19, true) --Left Alt
			DisableControlAction(0, 288, true) --F1
			DisableControlAction(0, 177, true) --ESC
			DisableControlAction(0, 200, true) --ESC
			DisableControlAction(0, 202, true) --ESC
			DisableControlAction(0, 322, true) --ESC
			DisableControlAction(0, 199, true) --P
		end
		Citizen.Wait(0)
	end
end)