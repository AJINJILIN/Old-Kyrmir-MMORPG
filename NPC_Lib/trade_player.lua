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
	if result == 1 then -- jeїeli wszystkie parametry s№ wypeіnione
		if focus_id ~= -1 then -- jeїeli nie patrzysz na ziemie
			if IsNPC(focus_id) ~= 1 then -- jeїeli osoba na ktуr№ patrzysz nie jest botem
				if GetPlayerLoggedIn(playerid) == true then -- jeїeli jesteњ zalogowany
					if GetPlayerLoggedIn(focus_id) then -- jeїeli osoba na ktуr№ patrzysz jest zalogowana
						if Player[focus_id].Trade == false then -- jeїeli osoba na ktуr№ patrzysz nie handluje
							if Player[playerid].Trade == false then -- jeїeli Ty nie handlujesz
								if Player[playerid].Dialog == false then  -- jeїeli nie gadasz z їadnym npc(?)
									if slot > 0 then -- jeїeli slot jest wiкkszy od zera
										if amount > 0 then -- jeїeli iloњж sprzedawanego przedmiotu jest wiкksza od zera(iloњж tego co chcesz dac, a nie faktyczna)
											if gold > -1 then -- jeїeli cena nie jest minusowa
												Player[playerid].Trade = true;
												Player[focus_id].Trade = true;
												Player[playerid].Focus = focus_id;
												Player[focus_id].Focus = playerid;
												Player[playerid].Gold = gold;
												Player[playerid].Amount = amount;
												
												GetPlayerItem(playerid, slot - 1); -- sprawdzamy co teї za item gracz ma na tym slocie(funkcja GMP, ktуrej nie moїna ufaж)
											else
												SendPlayerMessage(playerid, 255, 0, 0, "Цена не может быть отрицательной!");
											end
										else
											SendPlayerMessage(playerid, 255, 0, 0, "Минимальное кол-во продаваемого предмета: 1");
										end
									else
										SendPlayerMessage(playerid, 255, 0, 0, "Слоты отсчитываются от одного, а не от нуля!");
									end
								else
									SendPlayerMessage(playerid, 255, 0, 0, "У Вас открыт диалог с NPC и Вы хотите торговать!")
									SendPlayerMessage(playerid, 255, 0, 0, "Настоятельно рекомендуется перезайти.");
								end
							else
								SendPlayerMessage(playerid, 255, 0, 0, "Вы уже с кем-то торгуете!");
							end
						else
							SendPlayerMessage(playerid, 255, 0, 0, "Человек, которому Вы хотите предложить сделку уже торгует с кем-то еще.");
						end
					else
						SendPlayerMessage(playerid, 255, 0, 0, "Этот игрок еще не вошел в систему.");
					end
				else
					SendPlayerMessage(playerid, 255, 0, 0, "Вы должны войти в игру, чтобы торговать.");
				end
			else
				SendPlayerMessage(playerid, 255, 0, 0, "Вы не можете предложить это боту!");
			end
		else
			SendPlayerMessage(playerid, 255, 0, 0, "Торговать с воздухом, ты поехавший?!");
		end
	else
		SendPlayerMessage(playerid, 255, 0, 0, "Используй: /продать (слот) (кол-во) (цена), чтобы торговать.");
	end
end

function TradeAccept(focid)
	if Player[focid].Trade == true then
		KillTimer(Player[Player[focid].Focus].Trade_Timer); -- koniec handlu ;E
		
		if GetPlayerGold(focid) >= Player[Player[focid].Focus].Gold then -- To drugie od focusa bo akceptuje ten komu zostaіo zaoferowane ;E
			GiveItem(focid, Player[Player[focid].Focus].Item, Player[Player[focid].Focus].Amount);
			RemoveItem(Player[focid].Focus, Player[Player[focid].Focus].Item, Player[Player[focid].Focus].Amount);
			
			GiveItem(Player[focid].Focus, "ITMI_GOLD", Player[Player[focid].Focus].Gold);
			RemoveItem(focid, "ITMI_GOLD", Player[Player[focid].Focus].Gold);
			
			SendPlayerMessage(focid, 0, 255, 0, "Сделка успешно воспроизведена.");
			SendPlayerMessage(Player[focid].Focus, 0, 255, 0, "Сделка успешно воспроизведена.");
			
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
			SendPlayerMessage(focid, 255, 0, 0, "Недостаточно золота!");
			DestroyTrade(focid);
		end
	else
		SendPlayerMessage(focid, 255, 0, 0, "Вы ни с кем не торгуете...");
	end
end

function Trade_Response(playerid, slot, item_instance, amount, equipped)
	if Player[playerid].Trade == true then
		if item_instance ~= "NULL" then
			local sprawdz = FindItem(playerid, item_instance); -- to normalnie musi dziaіaж, definiuje w koсcu na samej gуrze!
			
			if string.upper(item_instance) ~= "ITMI_GOLD" then
				if not(sprawdz) then
					SendPlayerMessage(playerid, 255, 0, 0, "Пошел вон, кусок обманщика!");
					Ban(playerid, 1);
					SendMessageToAll(255, 0, 0, GetPlayerName(playerid).." пытался надюпать торговлей");
					SendMessageToAll(255, 0, 0, "И получил бан!");
					LogString("Logs_Cheaters", GetPlayerName(playerid).." chciaі sprzedac przedmiot ktуrego nie ma w EQ...");
					return;
				end
			end
			
			if equipped == 1 then
				SendPlayerMessage(playerid, 255, 0, 0, "Вы не можете продать используемый предмет.");
				DestroyTrade(playerid);
			else
				if string.upper(item_instance) == "ITMI_GOLD" then
					if Player[playerid].Amount <= GetPlayerGold(playerid) then
						Player[playerid].Item = item_instance;
						Player[playerid].Trade_Timer = SetTimerEx("DestroyTrade", 10000, 0, playerid);
						
						SendPlayerMessage(playerid, 0, 255, 0, "Вы предложили: "..GetItemName(item_instance).." Кол-во: "..Player[playerid].Amount.." Цена: "..Player[playerid].Gold.."");
						SendPlayerMessage(Player[playerid].Focus, 0, 255, 0, ""..GetPlayerName(playerid).." предложил Вам: "..GetItemName(item_instance).." Кол-во: "..Player[playerid].Amount.." Цена: "..Player[playerid].Gold.."");
						SendPlayerMessage(Player[playerid].Focus, 0, 255, 0, "Wpisz /agree, aby przyj№ж oferte");
						
						LogString("Logs_GoldenTrade_old", GetPlayerName(playerid).." zaoferowaі "..GetPlayerName(Player[playerid].Focus).." "..Player[playerid].Amount.." golda".." za "..Player[playerid].Gold.." zіociszy.");
					else
						Player[Player[playerid].Focus].Trade = false;
						Player[playerid].Trade = false;
						
						Player[Player[playerid].Focus].Focus = -1;
						Player[playerid].Focus = -1;
						
						Player[playerid].Gold = 0;
						Player[playerid].Item = nil;
						Player[playerid].Amount = -1;
						
						SendPlayerMessage(playerid, 255, 0, 0, "Недостаточно золота.");
					end
				else
					if Player[playerid].Amount <= amount then
						if not(Player[playerid].Amount <= GetItemAmountPlayer(playerid, sprawdz)) then
							SendPlayerMessage(playerid, 255, 0, 0, "Проваливай, задница!");
							Ban(playerid, 1);
							SendMessageToAll(255, 0, 0, GetPlayerName(playerid).." пытался сжульничать, с помощью торговли и багов.");
							SendMessageToAll(255, 0, 0, "Но все предусмотрено и теперь он в бане, благодаря анти-читу!");
							LogString("Logs_Cheaters", GetPlayerName(playerid).." zbyt duїa iloњж danego przedmiotu w EQ...");
							return;
						end
						
						Player[playerid].Item = item_instance;
						Player[playerid].Trade_Timer = SetTimerEx("DestroyTrade", 10000, 0, playerid);
						
						SendPlayerMessage(playerid, 0, 255, 0, "Вы предложили: "..GetItemName(item_instance).." Кол-во: "..Player[playerid].Amount.." Цена: "..Player[playerid].Gold.."");
						SendPlayerMessage(Player[playerid].Focus, 0, 255, 0, ""..GetPlayerName(playerid).." предложил Вам: "..GetItemName(item_instance).." Кол-во: "..Player[playerid].Amount.." Цена: "..Player[playerid].Gold.."");
						SendPlayerMessage(Player[playerid].Focus, 0, 255, 0, "Используй команду /согл, чтобы подтвердить сделку.");
						
						--LogString("Logs_Trade", GetPlayerName(playerid).." zaoferowaі "..GetPlayerName(Player[playerid].Focus).." "..GetItemName(item_instance).." w iloњci: "..Player[playerid].Amount.." za: "..Player[playerid].Gold.." golda");
					else
						Player[Player[playerid].Focus].Trade = false;
						Player[playerid].Trade = false;
						
						Player[Player[playerid].Focus].Focus = -1;
						Player[playerid].Focus = -1;
						
						Player[playerid].Gold = 0;
						Player[playerid].Item = nil;
						Player[playerid].Amount = -1;
						
						SendPlayerMessage(playerid, 255, 0, 0, "Недостаточное кол-во предмета.");
					end
				end
			end
		else
			SendPlayerMessage(playerid, 255, 0, 0, "Этот слот пуст.");
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
		
		SendPlayerMessage(playerid, 255, 0, 0, "Предложение отклонено.");
		SendPlayerMessage(Player[playerid].Focus, 255, 0, 0, "Предложение отклонено.");
		
		Player[Player[playerid].Focus].Trade = false;
		Player[playerid].Trade = false;
		
		Player[Player[playerid].Focus].Focus = -1;
		Player[playerid].Focus = -1;
		
		Player[playerid].Gold = 0;
		Player[playerid].Item = nil;
		Player[playerid].Amount = -1;
		
	end
end