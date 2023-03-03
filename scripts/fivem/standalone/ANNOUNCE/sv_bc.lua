msg = ""
RegisterCommand('bc', function(source, args, user)
	if IsPlayerAceAllowed(source, "command") then
			for i,v in pairs(args) do
				msg = msg .. " " .. v
			end
			TriggerClientEvent("bc", -1, msg)
			msg = ""
    end
end)