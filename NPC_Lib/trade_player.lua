local Player = {};

function CreateTradePlayer()
	local Player = {};
	
	Player.Dialog = false;
	Player.Trade = false;
	Player.Focus = -1;
	Player.Agree = false;
	Player.Item = nil;
	Player.Gold = 0;
	Player.Amount = -1;
	Player.Trade_Timer = -1;
	
	return Player;
end

function TradePlayer_OnPlayerConnect(playerid)
	if IsNPC(playerid) == 0 then
		Player[playerid] = CreateTradePlayer();
	end
end

function StartPlayersTade(playerid, focus_id, params)
	local result, slot, amount, gold = sscanf(params, "ddd");
	if result == 1 then -- je�eli wszystkie parametry s� wype�nione
		if focus_id ~= -1 then -- je�eli nie patrzysz na ziemie
			if IsNPC(focus_id) ~= 1 then -- je�eli osoba na kt�r� patrzysz nie jest botem
				if GetPlayerLoggedIn(playerid) == true then -- je�eli jeste� zalogowany
					if GetPlayerLoggedIn(focus_id) then -- je�eli osoba na kt�r� patrzysz jest zalogowana
						if Player[focus_id].Trade == false then -- je�eli osoba na kt�r� patrzysz nie handluje
							if Player[playerid].Trade == false then -- je�eli Ty nie handlujesz
								if Player[playerid].Dialog == false then  -- je�eli nie gadasz z �adnym npc(?)
									if slot > 0 then -- je�eli slot jest wi�kszy od zera
										if amount > 0 then -- je�eli ilo�� sprzedawanego przedmiotu jest wi�ksza od zera(ilo�� tego co chcesz dac, a nie faktyczna)
											if gold > -1 then -- je�eli cena nie jest minusowa
												Player[playerid].Trade = true;
												Player[focus_id].Trade = true;
												Player[playerid].Focus = focus_id;
												Player[focus_id].Focus = playerid;
												Player[playerid].Gold = gold;
												Player[playerid].Amount = amount;
												
												GetPlayerItem(playerid, slot - 1); -- sprawdzamy co te� za item gracz ma na tym slocie(funkcja GMP, kt�rej nie mo�na ufa�)
											else
												SendPlayerMessage(playerid, 255, 0, 0, "���� �� ����� ���� �������������!");
											end
										else
											SendPlayerMessage(playerid, 255, 0, 0, "����������� ���-�� ������������ ��������: 1");
										end
									else
										SendPlayerMessage(playerid, 255, 0, 0, "����� ������������� �� ������, � �� �� ����!");
									end
								else
									SendPlayerMessage(playerid, 255, 0, 0, "� ��� ������ ������ � NPC � �� ������ ���������!")
									SendPlayerMessage(playerid, 255, 0, 0, "������������ ������������� ���������.");
								end
							else
								SendPlayerMessage(playerid, 255, 0, 0, "�� ��� � ���-�� ��������!");
							end
						else
							SendPlayerMessage(playerid, 255, 0, 0, "�������, �������� �� ������ ���������� ������ ��� ������� � ���-�� ���.");
						end
					else
						SendPlayerMessage(playerid, 255, 0, 0, "���� ����� ��� �� ����� � �������.");
					end
				else
					SendPlayerMessage(playerid, 255, 0, 0, "�� ������ ����� � ����, ����� ���������.");
				end
			else
				SendPlayerMessage(playerid, 255, 0, 0, "�� �� ������ ���������� ��� ����!");
			end
		else
			SendPlayerMessage(playerid, 255, 0, 0, "��������� � ��������, �� ���������?!");
		end
	else
		SendPlayerMessage(playerid, 255, 0, 0, "���������: /������� (����) (���-��) (����), ����� ���������.");
	end
end

function TradeAccept(focid)
	if Player[focid].Trade == true then
		KillTimer(Player[Player[focid].Focus].Trade_Timer); -- koniec handlu ;E
		
		if GetPlayerGold(focid) >= Player[Player[focid].Focus].Gold then -- To drugie od focusa bo akceptuje ten komu zosta�o zaoferowane ;E
			GiveItem(focid, Player[Player[focid].Focus].Item, Player[Player[focid].Focus].Amount);
			RemoveItem(Player[focid].Focus, Player[Player[focid].Focus].Item, Player[Player[focid].Focus].Amount);
			
			GiveItem(Player[focid].Focus, "ITMI_GOLD", Player[Player[focid].Focus].Gold);
			RemoveItem(focid, "ITMI_GOLD", Player[Player[focid].Focus].Gold);
			
			SendPlayerMessage(focid, 0, 255, 0, "������ ������� ��������������.");
			SendPlayerMessage(Player[focid].Focus, 0, 255, 0, "������ ������� ��������������.");
			
			DestroyItemPlayerAmount(Player[focid].Focus, Player[Player[focid].Focus].Item, Player[Player[focid].Focus].Amount);
			DestroyItemPlayerAmount(focid, "ITMI_GOLD", Player[Player[focid].Focus].Gold);
			
			MySQL_Save(Player[focid].Focus);
			MySQL_Save(focid);
			
			LogString("Logs_Trade", GetPlayerName(focid).." buyed "..GetPlayerName(Player[focid].Focus).." "..GetItemName(Player[Player[focid].Focus].Item).." amout: "..Player[Player[focid].Focus].Amount.." for: "..Player[Player[focid].Focus].Gold.." gold");
			
			Player[focid].Trade = false;
			Player[Player[focid].Focus].Trade = false;
			
			Player[Player[focid].Focus].Focus = -1;
			
			Player[Player[focid].Focus].Gold = 0;
			Player[Player[focid].Focus].Item = nil;
			Player[Player[focid].Focus].Amount = -1;
			
			Player[focid].Focus = -1;
		else
			SendPlayerMessage(focid, 255, 0, 0, "������������ ������!");
			DestroyTrade(focid);
		end
	else
		SendPlayerMessage(focid, 255, 0, 0, "�� �� � ��� �� ��������...");
	end
end

function Trade_Response(playerid, slot, item_instance, amount, equipped)
	if Player[playerid].Trade == true then
		if item_instance ~= "NULL" then
			local sprawdz = FindItem(playerid, item_instance); -- to normalnie musi dzia�a�, definiuje w ko�cu na samej g�rze!
			
			if string.upper(item_instance) ~= "ITMI_GOLD" then
				if not(sprawdz) then
					SendPlayerMessage(playerid, 255, 0, 0, "����� ���, ����� ���������!");
					Ban(playerid, 1);
					SendMessageToAll(255, 0, 0, GetPlayerName(playerid).." ������� �������� ���������");
					SendMessageToAll(255, 0, 0, "� ������� ���!");
					LogString("Logs_Cheaters", GetPlayerName(playerid).." chcia� sprzedac przedmiot kt�rego nie ma w EQ...");
					return;
				end
			end
			
			if equipped == 1 then
				SendPlayerMessage(playerid, 255, 0, 0, "�� �� ������ ������� ������������ �������.");
				DestroyTrade(playerid);
			else
				if string.upper(item_instance) == "ITMI_GOLD" then
					if Player[playerid].Amount <= GetPlayerGold(playerid) then
						Player[playerid].Item = item_instance;
						Player[playerid].Trade_Timer = SetTimerEx("DestroyTrade", 10000, 0, playerid);
						
						SendPlayerMessage(playerid, 0, 255, 0, "�� ����������: "..GetItemName(item_instance).." ���-��: "..Player[playerid].Amount.." ����: "..Player[playerid].Gold.."");
						SendPlayerMessage(Player[playerid].Focus, 0, 255, 0, ""..GetPlayerName(playerid).." ��������� ���: "..GetItemName(item_instance).." ���-��: "..Player[playerid].Amount.." ����: "..Player[playerid].Gold.."");
						SendPlayerMessage(Player[playerid].Focus, 0, 255, 0, "Wpisz /agree, aby przyj�� oferte");
						
						LogString("Logs_GoldenTrade_old", GetPlayerName(playerid).." zaoferowa� "..GetPlayerName(Player[playerid].Focus).." "..Player[playerid].Amount.." golda".." za "..Player[playerid].Gold.." z�ociszy.");
					else
						Player[Player[playerid].Focus].Trade = false;
						Player[playerid].Trade = false;
						
						Player[Player[playerid].Focus].Focus = -1;
						Player[playerid].Focus = -1;
						
						Player[playerid].Gold = 0;
						Player[playerid].Item = nil;
						Player[playerid].Amount = -1;
						
						SendPlayerMessage(playerid, 255, 0, 0, "������������ ������.");
					end
				else
					if Player[playerid].Amount <= amount then
						if not(Player[playerid].Amount <= GetItemAmountPlayer(playerid, sprawdz)) then
							SendPlayerMessage(playerid, 255, 0, 0, "����������, �������!");
							Ban(playerid, 1);
							SendMessageToAll(255, 0, 0, GetPlayerName(playerid).." ������� �����������, � ������� �������� � �����.");
							SendMessageToAll(255, 0, 0, "�� ��� ������������� � ������ �� � ����, ��������� ����-����!");
							LogString("Logs_Cheaters", GetPlayerName(playerid).." zbyt du�a ilo�� danego przedmiotu w EQ...");
							return;
						end
						
						Player[playerid].Item = item_instance;
						Player[playerid].Trade_Timer = SetTimerEx("DestroyTrade", 10000, 0, playerid);
						
						SendPlayerMessage(playerid, 0, 255, 0, "�� ����������: "..GetItemName(item_instance).." ���-��: "..Player[playerid].Amount.." ����: "..Player[playerid].Gold.."");
						SendPlayerMessage(Player[playerid].Focus, 0, 255, 0, ""..GetPlayerName(playerid).." ��������� ���: "..GetItemName(item_instance).." ���-��: "..Player[playerid].Amount.." ����: "..Player[playerid].Gold.."");
						SendPlayerMessage(Player[playerid].Focus, 0, 255, 0, "��������� ������� /����, ����� ����������� ������.");
						
						--LogString("Logs_Trade", GetPlayerName(playerid).." zaoferowa� "..GetPlayerName(Player[playerid].Focus).." "..GetItemName(item_instance).." w ilo�ci: "..Player[playerid].Amount.." za: "..Player[playerid].Gold.." golda");
					else
						Player[Player[playerid].Focus].Trade = false;
						Player[playerid].Trade = false;
						
						Player[Player[playerid].Focus].Focus = -1;
						Player[playerid].Focus = -1;
						
						Player[playerid].Gold = 0;
						Player[playerid].Item = nil;
						Player[playerid].Amount = -1;
						
						SendPlayerMessage(playerid, 255, 0, 0, "������������� ���-�� ��������.");
					end
				end
			end
		else
			SendPlayerMessage(playerid, 255, 0, 0, "���� ���� ����.");
			Player[Player[playerid].Focus].Trade = false;
			Player[playerid].Trade = false;
			
			Player[Player[playerid].Focus].Focus = -1;
			Player[playerid].Focus = -1;
			
			Player[playerid].Gold = 0;
			Player[playerid].Item = nil;
			Player[playerid].Amount = -1;
		end
	end
end

function DestroyTrade(playerid)
	if Player[playerid].Trade == true then
		
		SendPlayerMessage(playerid, 255, 0, 0, "����������� ���������.");
		SendPlayerMessage(Player[playerid].Focus, 255, 0, 0, "����������� ���������.");
		
		Player[Player[playerid].Focus].Trade = false;
		Player[playerid].Trade = false;
		
		Player[Player[playerid].Focus].Focus = -1;
		Player[playerid].Focus = -1;
		
		Player[playerid].Gold = 0;
		Player[playerid].Item = nil;
		Player[playerid].Amount = -1;
		
	end
end