ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('bmode', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_blackout:bmode', source)
	xPlayer.removeInventoryItem('bmode', 1)
end)
