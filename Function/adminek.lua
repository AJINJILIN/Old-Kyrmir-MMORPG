--[[
	Kyrmir MMORPG
	Admin
]]

require "MySQL_Lib/mysql_lib"

local handler = mysql_connect("host", "user", "passwd", "bd");
local Bans = {};

local function checkMySQLd()
	if (mysql_ping(handler) == false) then 
  
		return false;
	
	end
	
	return true;
	
end

local function recMySQLd()
	mysql_close(handler);
	handler = mysql_connect("92.63.102.185", "mmoadmin", "000000", "mmo");
end

function reloadBans(playerid)
	if Player[playerid].adm == 5 or Player[playerid].adm == 4 or Player[playerid].adm == 8 then
	if checkMySQLd() then
		local bans = loadBans();
		if bans then
			SendPlayerMessage(playerid, 255, 0, 0, "���� �������.");
			for i = 1, #Bans do
				table.remove(Bans, 1);
				--table.insert( Bans, { nick = bans[i][1], reason = bans[i][2], ip = bans[i][3], mac = bans[i][4], nmd5 = bans[i][5], nnick = bans[i][6] } );
			end
			for i in pairs(bans) do
				table.insert( Bans, { nick = bans[i][1], reason = bans[i][2], ip = bans[i][3], mac = bans[i][4], nmd5 = bans[i][5], nnick = bans[i][6] } );
			end
			SendPlayerMessage(playerid, 0, 255, 0, "������ ����� ������� ��������!");
		else
			LogString("Logs_BansERR", "�������� � ��������� �����. ����� ������������� ������!");
			SendPlayerMessage(playerid, "������������ �������� �� ���������, ���������� ��� ���!");
		end
	end
	end
end

function loadBans()
	if checkMySQLd() then
		local table_amount = "SELECT COUNT(*) FROM `BanList`";
		local result = mysql_query(handler, table_amount);
			if not(result) then
				LogString("Logs_ProbMysql", table_amount);
				return false;
			else
				local rows = {};
				local amount = mysql_fetch_row(result);
				mysql_free_result(result);
				result = mysql_query(handler, "SELECT * FROM BanList");
				for i = 1, amount[1] do
					local row = mysql_fetch_row(result);
					table.insert(rows, row);
				end
				mysql_free_result(result);
				return rows;
			end
	else
		recMySQLd();
	end
	return false;
end

function initAdmin()
	if not(handler) then
		print("CANT CONNECT WITH DB (ADMIN) :(");
	else
		print("�������� �����: ", handler);
		local sql = mysql_query (handler, "CREATE TABLE IF NOT EXISTS BanList (nick char(20), reason char(255), ip char(25), mac char(50), nmd5 char(32), PRIMARY KEY(nick)) DEFAULT CHARSET=utf8" );
		if sql then
			mysql_free_result(sql);
		end
		
		local bans = loadBans();
		if bans then
			for i in pairs(bans) do
				table.insert( Bans, { nick = bans[i][1], reason = bans[i][2], ip = bans[i][3], mac = bans[i][4], nmd5 = bans[i][5], nnick = bans[i][6] } );
			end
		else
			LogString("Logs_BansERR", "�������� � ������� �����, ����� ������������� ������!");
		end
	end
	
	if sql ~= nil then
		mysql_free_result(sql);
	end
end

function ServMSG(playerid, params)
	if Player[playerid].adm == 5 then
		local result, text = sscanf(params,"s");
		if result == 1 then
			GameTextForAll(50, 3500, "������: "..text.."" ,"Font_Old_20_White_Hi.TGA", 0, 255, 0, 60 * 1000 * 10);
		end
	end
end

function CMD_AdminHelp(playerid)

	if Player[playerid].adm == 5 or Player[playerid].adm == 4 or Player[playerid].adm == 8
	then
		for i = 0, 15
		do
			SendPlayerMessage(playerid,255,255,255,"");
		end

		SendPlayerMessage(playerid,255,255,255,"������ �������:");
		SendPlayerMessage(playerid,255,250,200,"/��� /��� /���� /�� /give /��� /����");
	else
		SendPlayerMessage(playerid,255,250,200,"(������): �� �� �����!");
	end
end

function CMD_Kick(playerid, params)

	if Player[playerid].adm == 5 or Player[playerid].adm == 4 or Player[playerid].adm == 8
	then
		local result,id,reason = sscanf(params,"ds");

		if result == 1
		then
			if IsPlayerConnected(id) == 1
			then
					SendMessageToAll(255,0,0,string.format("%s %s %s %s%s %s %s","(������):����� ",GetPlayerName(id)," ��� ������ ",GetPlayerName(playerid),"."," �������: ",reason));

				Kick(id);
			else
				SendPlayerMessage(playerid,255,250,200,string.format("%s %d %s","(������): ����� � ���� ",id," �� ��������� � �������."));
			end
		else
			SendPlayerMessage(playerid,255,250,200,"���������: /��� (��������) (�������)");
		end
	else
		SendPlayerMessage(playerid,255,250,200,"(������): �� �� �����!");
	end
end

function CMD_Ban(playerid, params)

	if Player[playerid].adm == 5 or Player[playerid].adm == 4
	then
		local result,id,reason = sscanf(params,"ds");

		if result == 1
		then
			if IsPlayerConnected(id) == 1
			then
					if checkMySQLd() then
						SendMessageToAll(255,0,0,string.format("%s %s %s %s%s %s %s","(������):����� ",GetPlayerName(id)," ��� ������� ",GetPlayerName(playerid),"."," �������: ",reason));
						table.insert( Bans, { nick = GetPlayerName(id), reason = reason, ip = GetPlayerIP(id), mac = GetMacAddress(id), nmd5 = MD5(GetPlayerName(id)), nnick = GetPlayerName(playerid) } );
						local sql = mysql_query(handler, "INSERT INTO `BanList` (`nick`, `reason`, `ip`, `mac`, `nmd5`, `nnick`) VALUES ('"..GetPlayerName(id).."', '"..reason.."', '"..GetPlayerIP(id).."', '"..GetMacAddress(id).."', '"..MD5(GetPlayerName(id)).."', '"..GetPlayerName(playerid).."')");
						if sql then
							mysql_free_result(sql);
						end
						Ban(id);
						--Kick(id);
					else
						SendPlayerMessage(playerid, 255, 0, 0, "������ MySQL, ����� �� ��� �������� � �������!");
						recMySQLd();
					end
				--Ban(id);
				--Kick(id);
			else
				SendPlayerMessage(playerid,255,250,200,string.format("%s %d %s","(������): ����� � ���� ",id," �� ��������� � �������."));
			end
		else
			SendPlayerMessage(playerid,255,250,200,"���������: /��� (��������) (�������)");
		end
	else
		SendPlayerMessage(playerid,255,250,200,"(������): �� �� �����!");
	end
end

function CMD_Kill(playerid, params)

	if Player[playerid].adm == 5 or Player[playerid].adm == 4 or Player[playerid].adm == 8
	then
		local result,id = sscanf(params,"d");

		if result == 1
		then
			if IsPlayerConnected(id) == 1
			then
				SendPlayerMessage(id,255,250,200,string.format("%s %s","�� ���� ����� ������� ",GetPlayerName(playerid)));
				SendPlayerMessage(playerid,255,250,200,string.format("%s %s","�� ����� ������ ",GetPlayerName(id)));
				SetPlayerHealth(id,0);
			else
				SendPlayerMessage(playerid,255,250,200,string.format("%s %d %s","(������): ����� � ���� ",id," �� ��������� � �������."));
			end
		else
			SendPlayerMessage(playerid,255,250,200,"���������: /���� (��������)");
		end
	else
		SendPlayerMessage(playerid,255,250,200,"(������): �� �� �����!");
	end
end

function CMD_Teleport(playerid, params)

	if Player[playerid].adm == 5 or Player[playerid].adm == 4 or Player[playerid].adm == 8
	then
		local result,from_id,to_id = sscanf(params,"dd");

		if result == 1
		then
			if IsPlayerConnected(from_id) == 1
			then
				if IsPlayerConnected(to_id) == 1
				then
					SendPlayerMessage(from_id,255,250,200,string.format("%s %s","�� ����������������� � ",GetPlayerName(to_id)));
					SendPlayerMessage(to_id,255,250,200,string.format("%s %s","� ��� ���������������� ",GetPlayerName(from_id)));

					local x,y,z = GetPlayerPos(to_id);
					SetPlayerPos(from_id,x + 50,y,z);
				else
					SendPlayerMessage(playerid,255,250,200,string.format("%s %d %s","(������): ����� � ���� ",to_id," �� ��������� � �������."));
				end
			else
				SendPlayerMessage(playerid,255,250,200,string.format("%s %d %s","(������): ����� � ���� ",from_id," �� ��������� � �������."));
			end
		else
			SendPlayerMessage(playerid,255,250,200,"���������: /�� (�� ������) (� ������)");
		end
	else
		SendPlayerMessage(playerid,255,250,200,"(������): �� �� �����!");
	end
end

function CMD_GiveItem(playerid, params)

	if Player[playerid].adm == 5 or Player[playerid].adm == 4 or Player[playerid].adm == 8
	then
		local result,id,item,amount = sscanf(params,"dsd");

		if result == 1
		then
			if IsPlayerConnected(id) == 1
			then
				SendPlayerMessage(id,255,250,200,string.format("%s %d %s %s %s","�� �������� ",amount,item," �� ",GetPlayerName(playerid)));
				SendPlayerMessage(playerid,255,250,200,string.format("%s %d %s %s %s","�� ������ ",amount,item," ������ ",GetPlayerName(id)));
				GiveItem(id,item,amount);
				LogString("Logs_GiveItem",GetPlayerName(playerid).." ����� "..GetPlayerName(id).." ������� "..item.." � ���������� "..amount); 
			else
				SendPlayerMessage(playerid,255,250,200,string.format("%s %d %s","(������): ����� � ���� ",id," �� ��������� � �������."));
			end
		else
			SendPlayerMessage(playerid,255,250,200,"���������: /give (��������) (����������) (���-��)");
		end
	else
		SendPlayerMessage(playerid,255,250,200,"(������): �� �� �����!");
	end
end

function CMD_GiveGold(playerid, params)

	if Player[playerid].adm == 5 or Player[playerid].adm == 4 or Player[playerid].adm == 8 
	then
		
		local result,id,amount, reason = sscanf(params,"dds");

		if result == 1 
		then
		
					
					SendPlayerMessage(id,255,250,200,string.format("%s %d %s %s %s","�� �������� ",amount," ������ ","�� ",GetPlayerName(playerid)));
					SendPlayerMessage(playerid,255,250,200,string.format("%s %d %s %s %s","�� ������ ",amount,"������ ","������ ",GetPlayerName(id)));
					GiveItem(id,"itmi_gold",amount);
					LogString("Logs_GiveGold",GetPlayerName(playerid).." ����� ������ "..GetPlayerName(id).." ������ � ���������� "..amount.." �� �������: "..reason);
			else
				SendPlayerMessage(playerid,255,250,200,"���������: /���� (��������) (���-��) (�������)");
			end
		else
			SendPlayerMessage(playerid,255,250,200,"(������): �� �� �����!");
	end
end


function CMD_Time(playerid, params)

	if Player[playerid].adm == 5 or Player[playerid].adm == 4 or Player[playerid].adm == 8
	then
		local result,hour,minute = sscanf(params,"dd");
		
		if result == 1
		then		
			SendMessageToAll(255,250,200,string.format("%s %s %s %d:%02d","(������):",GetPlayerName(playerid)," ������� ����� �� ",hour,minute));
			SetTime(hour,minute);
		else
			SendPlayerMessage(playerid,255,250,200,"���������: /����� (����) (������)");
		end
	else
		SendPlayerMessage(playerid,255,250,200,"(������): �� �� �����!");
	end
end

function CMD_TPAll(playerid, params)

	if Player[playerid].adm == 5 or Player[playerid].adm == 4
	then
		local result,id = sscanf(params,"d");
		
		if result == 1
		then
			if IsPlayerConnected(id) == 1 then
				local x, y, z = GetPlayerPos(id);
				SendMessageToAll(255,250,200,"�������� ������������ � "..GetPlayerName(id));
				for i = 0, GetMaxPlayers() - 1 do
				
					if IsPlayerConnected(i) == 1 then
					
						if i~= id then
							
							SetPlayerPos(i, x, y, z);
							
						end
					
					end
				
				end
			end
		else
			SendPlayerMessage(playerid,255,250,200,"���������: /����� (��)");
		end
	else
		SendPlayerMessage(playerid,255,250,200,"(������): �� �� �����!");
	end

end

function CMD_Scale(playerid, params)

	if Player[playerid].adm == 5 or Player[playerid].adm == 4
	then
		local result,id,x,x1,y,y1,z, z1 = sscanf(params,"ddddddd");
		
		if result == 1
		then
			if IsPlayerConnected(id) == 1 then
				x = x + x1/10;
				y = y + y1/10;
				z = z + z1/10;
				SetPlayerScale(id, x, y, z);
				SendPlayerMessage(id, 255, 255, 0, "������ ��� ������� � "..GetPlayerName(playerid).."'a");
			end
		else
			SendPlayerMessage(playerid,255,250,200,"���������: /������ (id) (x) (y) (z)");
		end
	else
		SendPlayerMessage(playerid,255,250,200,"(������): �� �� �����!");
	end

end

function CMD_Name(playerid, params)

	if Player[playerid].adm == 5 or Player[playerid].adm == 4 then
		local result,id,name = sscanf(params,"ds");

		if result == 1 then
		
			if IsPlayerConnected(id) == 1 then
			
				local adminname = GetPlayerName(playerid);
				local beforename = GetPlayerName(id);
				if SetPlayerName(id,name) == 1 then
				
					SendMessageToAll(0,255,0,string.format("%s %s %s %s %s %s","����� ",adminname," ������� ��� ������ ",beforename," �� ",name));
				else
					SendPlayerMessage(playerid,255,250,200,"(Server) Can't set name.");
				end
			else
				SendPlayerMessage(playerid,255,250,200,string.format("%s %d %s","(������): ����� � ���� ",id," �� ��������� � �������."));
			end
		else
			SendPlayerMessage(playerid,255,250,200,"���������: /��� (��������) (����� ���)");
		end
	else
		SendPlayerMessage(playerid,255,250,200,"(������): �� �� �����!");
	end
end

function CMD_Color(playerid, params)

	if Player[playerid].adm == 5 or Player[playerid].adm == 4 or Player[playerid].adm == 8 then
	
		local result,id,r,g,b = sscanf(params,"dddd");
	
		if result == 1 then
			if IsPlayerConnected(id) == 1 then
				
				local adminName = GetPlayerName(playerid);
				SendPlayerMessage(id,255,250,200,string.format("%s %d %d %d %s %s","��� ���� ��� ������� �� ",r,g,b," ������� ",adminName));
				SetPlayerColor(id,r,g,b);
			end
		else
			SendPlayerMessage(playerid,255,250,200,"���������: /���� (��������) (r) (g) (b)");
		end
	else
		SendPlayerMessage(playerid,255,250,200,"(������): �� �� �����!");
	end
end

function checkBan(playerid)
	if IsNPC(playerid) == 0 then
		for i = 1, #Bans do
			if GetPlayerName(playerid) == Bans[i].nick or GetPlayerIP(playerid) == Bans[i].ip or GetMacAddress(playerid) == Bans[i].mac or 
			MD5(GetPlayerName(playerid)) == Bans[i].nmd5 then
				SendPlayerMessage(playerid, 255, 51, 204, "�������: "..Bans[i].nnick);
				SendPlayerMessage(playerid, 255, 51, 204, "�������: "..Bans[i].reason);
				_Kick(playerid);
				return true;
			end
		end
	end
	return false;
end

function addBan(playerid)
	if checkMySQLd() then
		table.insert( Bans, { nick = GetPlayerName(playerid), reason = "Cheats", ip = GetPlayerIP(playerid), mac = GetMacAddress(playerid), nmd5 = MD5(GetPlayerName(playerid)), nnick = "Anty-Cheat" } );
		local sql = mysql_query(handler, "INSERT INTO `BanList` (`nick`, `reason`, `ip`, `mac`, `nmd5`) VALUES ('"..GetPlayerName(playerid).."', 'Cheats', '"..GetPlayerIP(playerid).."', '"..GetMacAddress(playerid).."', '"..MD5(GetPlayerName(playerid)).."')");
		if sql then
			mysql_free_result(sql);
		end
	else
		recMySQLd();
		if checkMySQLd() then
			table.insert( Bans, { nick = GetPlayerName(playerid), reason = "Cheats", ip = GetPlayerIP(playerid), mac = GetMacAddress(playerid), nmd5 = MD5(GetPlayerName(playerid)), nnick = "Anty-Cheat" } );
			local sql = mysql_query(handler, "INSERT INTO `BanList` (`nick`, `reason`, `ip`, `mac`, `nmd5`) VALUES ('"..GetPlayerName(playerid).."', 'Cheats', '"..GetPlayerIP(playerid).."', '"..GetMacAddress(playerid).."', '"..MD5(GetPlayerName(playerid)).."')");
			if sql then
				mysql_free_result(sql);
			end
		end
	end
end

function makeBanWithReason(playerid, reason, nnick)
	if checkMySQLd() then
		if playerid and reason and nnick then
			table.insert(Bans, { nick = GetPlayerName(playerid), reason = reason, ip = GetPlayerIP(playerid), mac = GetMacAddress(playerid), nmd5 = MD5(GetPlayerName(playerid)), nnick = nnick } );
			local sql = mysql_query(handler, "INSERT INTO `BanList` (`nick`, `reason`, `ip`, `mac`, `nmd5`, `nnick`) VALUES ('"..GetPlayerName(playerid).."', '"..reason.."', '"..GetPlayerIP(playerid).."', '"..GetMacAddress(playerid).."', '"..MD5(GetPlayerName(playerid)).."', '"..nnick.."')");
			if sql then
				mysql_free_result(sql);
			end
			Ban(playerid);
		else
			print("Missing argument on function: makeBanWithReason!");
		end
	else
		if playerid and reason and nnick then
			recMySQLd();
			if checkMySQLd() then
				table.insert(Bans, { nick = GetPlayerName(playerid), reason = reason, ip = GetPlayerIP(playerid), mac = GetMacAddress(playerid), nmd5 = MD5(GetPlayerName(playerid)), nnick = nnick } );
				local sql = mysql_query(handler, "INSERT INTO `BanList` (`nick`, `reason`, `ip`, `mac`, `nmd5`, `nnick`) VALUES ('"..GetPlayerName(playerid).."', '"..reason.."', '"..GetPlayerIP(playerid).."', '"..GetMacAddress(playerid).."', '"..MD5(GetPlayerName(playerid)).."', '"..nnick.."')");
				if sql then
					mysql_free_result(sql);
				end
				Ban(playerid);
			end
		else
			print("Missing argument on function: makeBanWithReason!");
		end
	end
end

print(debug.getinfo(1).source.." has been loaded.");	