function OnFilterscriptInit()
	print("-----------------------------");
	print("Private message system loaded");
	print("-----------------------------");
end

function OnFilterscriptExit()
	print("------------------------------------");
	print("Module 'PW System' has been unloaded.");
	print("------------------------------------");
end

function OnPlayerCommandText(playerid, cmdtext)

	local cmd,params = GetCommand(cmdtext);
	
	if cmd == "/pm"
	then
		PrivateMessage(playerid,params);
	end
end

function OnPlayerConnect(playerid)

end

function PrivateMessage(playerid, params)

	local result,sendid,message = sscanf(params,"ds");
	
	if result == 1
	then
		if playerid == sendid
		then
			SendPlayerMessage(playerid,230,230,230,"(Сервер): Вы не можете послать сообщение самому себе.");
		else
			if IsPlayerConnected(sendid) == 1
			then
				local format_playerid = string.format("%s %s %s%d%s %s %s","(( >>",GetPlayerName(sendid),"(",sendid,"):",message,"))");
				SendPlayerMessage(playerid,239,226,108,format_playerid);
				
				local format_id = string.format("%s %s %s%d%s %s %s","((",GetPlayerName(playerid),"(",playerid,"):",message,"))");
				SendPlayerMessage(sendid,255,140,0,format_id);
			else
				SendPlayerMessage(playerid,230,230,230,string.format("%s %d %s","(Server): Игрок ID",sendid,"не подключен к серверу."));
			end
		end
	else
		SendPlayerMessage(playerid,230,230,230,"Используйте: /лс (ид) (сообщение)");
	end
end