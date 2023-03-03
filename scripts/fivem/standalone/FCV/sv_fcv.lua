local everyoneAllowed = true -- AUTORIZE EVERYONE
local allowed = 
{
	"steam:110000115c5095e" -- STEAM HEX. DON'T FORGET THE COMMA, BUT NOT FOR THE LAST
}

AddEventHandler('chatMessage', function(source, n, msg)
	local msg = string.lower(msg)
	local identifier = GetPlayerIdentifiers(source)[1]
	if msg == "/fix" then
		CancelEvent()
		if everyoneAllowed == true then
			TriggerClientEvent('alzhe:fix', source)
		else
			if checkAllowed(identifier) then
				TriggerClientEvent('alzhe:fix', source)
			else
				TriggerClientEvent('alzhe:noPerms', source)
			end
		end
	end
	if msg == "/destroy" then
		CancelEvent()
		if everyoneAllowed == true then
			TriggerClientEvent('alzhe:destroy', source)
		else
			if checkAllowed(identifier) then
				TriggerClientEvent('alzhe:destroy', source)
			else
				TriggerClientEvent('alzhe:noPerms', source)
			end
		end
	end
	if msg == "/dirt" then
		CancelEvent()
		if everyoneAllowed == true then
			TriggerClientEvent('alzhe:dirt', source)
		else
			if checkAllowed(identifier) then
				TriggerClientEvent('alzhe:dirt', source)
			else
				TriggerClientEvent('alzhe:noPerms', source)
			end
		end
	end
	if msg == "/clean" then
		CancelEvent()
		if everyoneAllowed == true then
			TriggerClientEvent('alzhe:clean', source)
		else
			if checkAllowed(identifier) then
				TriggerClientEvent('alzhe:clean', source)
			else
				TriggerClientEvent('alzhe:noPerms', source)
			end
		end
	end
end)

function checkAllowed(id)
	for k, v in pairs(allowed) do
		if id == v then
			return true
		end
	end

	return false
end