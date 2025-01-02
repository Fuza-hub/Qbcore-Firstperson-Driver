QBCore = exports['qb-core']:GetCoreObject()

local function stringsplit(inputstr, sep)
	if sep == nil then
		sep = "%s"
	end
	local t={} ; i=1
	for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
		t[i] = str
		i = i + 1
	end
	return t
end

RegisterServerEvent("alert:sv")
AddEventHandler("alert:sv", function (msg, msg2)
	TriggerClientEvent("SendAlert", -1, msg, msg2)
end)

AddEventHandler('chatMessage', function(source, name, msg)
	local command = stringsplit(msg, " ")[1];

	if command == "/alert" then
		local src = source
		local Player = QBCore.Functions.GetPlayer(src)
		if Player.PlayerData.job.name == Config.Job and Player.PlayerData.job.grade.level >= Config.MinimumRank then
			CancelEvent()
			TriggerClientEvent("alert:Send", source, string.sub(msg, 8), Config.TitleDepartment)
		end
	end
end)
