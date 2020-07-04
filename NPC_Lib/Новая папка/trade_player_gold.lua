--[[
	Gold Trade xD
	Kyrmir MMORPG
]]

local Player = {};

function initTrade()
	for i = 0, GetMaxPlayers() - 1 do 
		Player[i] = {};
		Player[i].Ile = -1;
		Player[i].ZaIle = -1;
		Player[i].Handluje = false;
		Player[i].Focus = nil;
		Player[i].Trade_Timer = nil;
	end
end

function restarTrade(playerid)
	Player[playerid].Ile = -1;
	Player[playerid].ZaIle = -1;
	Player[playerid].Handluje = false;
	Player[playerid].Focus = nil;
	Player[playerid].Trade_Timer = nil;
end

function GoldTrade(playerid, focusid, params)
	local result, ile, zaile = sscanf(params, "dd");
	if result == 1 then
		if focusid ~= -1 then
			if IsNPC(focusid) == 0 then
				if GetPlayerLoggedIn(playerid) == true then
					if GetPlayerLoggedIn(focusid) == true then
						if Player[focusid].Handluje ~= true then
							if Player[playerid].Handluje ~= true then
								if ile > 0 then
									if zaile > -1 then
										if GetPlayerGold(playerid) >= ile then
											Player[playerid].Handluje = true;
											Player[focusid].Handluje = true;
											Player[focusid].Focus = playerid;
											Player[playerid].Focus = focusid;
											Player[playerid].Ile = ile;
											Player[playerid].ZaIle = zaile;
											
											SendPlayerMessage(focusid, 0, 255, 0, GetPlayerName(playerid).." ���������� ���: "..ile.." ������ ��: "..zaile.." ������.");
											SendPlayerMessage(playerid, 0, 255, 0, "�� ����������: "..ile.." ������ ��: "..zaile.." ������.");
											SendPlayerMessage(focusid, 0, 255, 0, "���� /�����, ����� ����������� ��������.");
											
											--LogString("Logs_GoldenTrade", GetPlayerName(playerid).." zaoferowa� "..GetPlayerName(Player[playerid].Focus).." "..Player[playerid].Ile.." golda".." za "..Player[playerid].ZaIle.." z�ociszy.");
											
											Player[playerid].Trade_Timer = SetTimerEx("DestroyGoldTrade", 10000, 0, playerid);
										else
											SendPlayerMessage(playerid, 255, 0, 0, "������������ ������ ������.");
										end
									else
										SendPlayerMessage(playerid, 255, 0, 0, "���� �� ����� ���� �������������.");
									end
								else
									SendPlayerMessage(playerid, 255, 0, 0, "�� �� ������ ���������� �����, ��� �� 1 ������� ������.");
								end
							else
								SendPlayerMessage(playerid, 255, 0, 0, "�� ��� ���������� ���-��.");
							end
						else
							SendPlayerMessage(playerid, 255, 0, 0, "�����, �������� �� ������ ���������� ������ ��� � ���-�� �������.");
						end
					else
						SendPlayerMessage(playerid, 255, 0, 0, "���� ����� ��� �� ����� � �������.");
					end
				else
					SendPlayerMessage(playerid, 255, 0, 0, "�� ������ ����� � ����, ����� ���������.");
				end
			else
				SendPlayerMessage(playerid, 255, 0, 0, "�� �� ������ ���������� ��� ����, genius -_-");
			end
		else
			SendPlayerMessage(playerid, 255, 0, 0, "��������� � ��������, �� ���������? ;D");
		end
	else
		SendPlayerMessage(playerid, 255, 0, 0, "����: /�������� (���� ������) (�� ������� ������), ����� ��������� �������.");
	end
end

function AcceptGoldTrade(playerid)
	if Player[playerid].Handluje == true then
		KillTimer(Player[Player[playerid].Focus].Trade_Timer);
		
		if GetPlayerGold(playerid) >= Player[Player[playerid].Focus].ZaIle then
			if Player[Player[playerid].Focus].ZaIle > 0 then
				SetPlayerGold( playerid, tonumber( GetPlayerGold(playerid) - Player[Player[playerid].Focus].ZaIle ) );
				SetPlayerGold( Player[playerid].Focus, tonumber( GetPlayerGold(Player[playerid].Focus) + Player[Player[playerid].Focus].ZaIle ) );
			end
			
			SetPlayerGold(	Player[playerid].Focus, tonumber( GetPlayerGold(Player[playerid].Focus) - Player[Player[playerid].Focus].Ile ) );
			SetPlayerGold( playerid, tonumber ( GetPlayerGold(playerid) + Player[Player[playerid].Focus].Ile ) );
			
			MySQL_Save(playerid);
			MySQL_Save(Player[playerid].Focus);
			
			SendPlayerMessage(playerid, 0, 255, 0, "������ �����������!");
			SendPlayerMessage(Player[playerid].Focus, 0, 255, 0, "������ �����������!");
			
			LogString("Logs_GoldenTrade", GetPlayerName(playerid).." kupi� od "..GetPlayerName(Player[playerid].Focus).." "..Player[Player[playerid].Focus].Ile.." golda".." za "..Player[Player[playerid].Focus].ZaIle.." z�ociszy.");
			
			restarTrade(Player[playerid].Focus);
			restarTrade(playerid);
		else
			SendPlayerMessage(playerid, 255, 0, 0, "������������ ������.");
		end
	else
		SendPlayerMessage(playerid, 255, 0, 0, "�� � ��� ��������� �������.");
	end
end

function DestroyGoldTrade(playerid)
	if Player[playerid].Handluje == true then
		SendPlayerMessage(playerid, 255, 0, 0, "��������� ����������� ������.");
		SendPlayerMessage(Player[playerid].Focus, 255, 0, 0, "��������� ����������� ������.");
		
		restarTrade(Player[playerid].Focus);
		restarTrade(playerid);
	end
end