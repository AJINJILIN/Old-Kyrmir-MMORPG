--[[
	Piepszony mysql_lib
	Author: Bimbol
	Edited by Profesores and Kimior
	Mordan - 2013, Kyrmir MMORPG - 2014
]]

local Player = {};

require "Function/GetHeadID"
require "NPC_Lib/npclist"

-- Draws
local Draw_Login = CreateDraw(2150, 3700, "Чтобы войти пиши /лог (пароль)", "Font_Old_20_White.TGA", 0, 255, 0);
local Draw_Register = CreateDraw(2500, 3720, "Зарегистрируйся на http://92.63.102.185/", "Font_Old_20_White.TGA", 255, 0, 0);

-- Handler
local handler = mysql_connect("host", "user", "passwd", "bd");


-- Functions
function MySQLInit()
	if not(handler) then
		print("Nie mozna polaczyc z DB :(");
	else
		print("General Handler: ", handler);
		local res = mysql_query ( handler, "UPDATE `player` SET `online` = '0'");
		if res then
			mysql_free_result(res);
		end
		--[[res = mysql_query ( handler, "TRUNCATE TABLE lanczer");
		if res then
			mysql_free_result(res);
		end]]
	end
end

function reconnectMySQL()
	LogString("Logs_MySQL","MySQL utraciі poі№czenie. Ponowne і№czenie...");
	mysql_close(handler);
	handler = mysql_connect("host", "user", "passwd", "bd");
end

function checkMySQLConnection()
	if (mysql_ping(handler) == false) then 
		return false;
	end
	return true;
end

function CreatePlayerMySQL()
	local Player = {};
	
	Player.LoggedIn = false;
	Player.Account = true;
	Player.Row_Forum = nil;
	Player.Row = nil;
	Player.Row_Item = nil;
	Player.Row_Hunt = nil;
	Player.Trophy = nil;
	Player.NPC = nil;
	Player.Read = false;
	Player.Row_Gold = nil;
	
	Player.AdditionalVisual = {};
	Player.Fatness = 0;
	Player.Experience = 0;
	Player.ExperienceNextLevel = 0;
	Player.Level = 0;
	Player.LearnPoints = 0;
	Player.Health = 0;
	Player.MaxHealth = 0;
	Player.Mana = 0;
	Player.MaxMana = 0;
	Player.MagicLevel = 0;
	Player.SkillWeapon = {};
	Player.Str = 0;
	Player.Dexterity = 0;
	Player.Acrobatic = 0;
	Player.Angle = 0;
	Player.Pos = {};
	Player.Science = {};
	Player.goldek = 0;
	Player.vip = false;
	Player.adm = 0;
	Player.admin = 0;

	return Player;
end

function CheckNicknameMySQL(playerid)
	if string.find(GetPlayerName(playerid).."", "'", 1) then
		SendPlayerMessage(playerid, 255, 0, 0, "В нике не должно быть символов");
		_Kick(playerid);
		return;
	elseif string.find(GetPlayerName(playerid).."", "`", 1) then
		SendPlayerMessage(playerid, 255, 0, 0, "В нике не должно быть символов");
		_Kick(playerid);
		return;
	elseif string.find(GetPlayerName(playerid)..'', '"', 1) then
		SendPlayerMessage(playerid, 255, 0, 0, "В нике не должно быть символов");
		_Kick(playerid);
		return;
	end
end

function MySQL_OnPlayerConnect(playerid)
	if IsNPC(playerid) == 0 then
		NPC_OnPlayerConnect(playerid);
		Player[playerid] = CreatePlayerMySQL();
		
		if checkMySQLConnection() == true then
			CheckNicknameMySQL(playerid)
			if IsPlayerConnected(playerid) == 1 then
				ShowDraw(playerid, Draw_Login);
			end
		else
			CheckNicknameMySQL(playerid)
			reconnectMySQL();
			if IsPlayerConnected(playerid) == 1 then
				ShowDraw(playerid, Draw_Login);
			end
		end
	end
end

function MySQL_Login(playerid, params)
	if ExitingGame(playerid) == false then
		if Player[playerid].LoggedIn == false then
			local result, password = sscanf(params, "s");
			local login = GetPlayerName(playerid);
			if result == 1 then
				if checkMySQLConnection() == true then
					if string.find(login.."", "'", 1) then
						SendPlayerMessage(playerid, 255, 0, 0, "В нике не должно быть символов");
						_Kick(playerid);
						return;
					elseif string.find(login.."", "`", 1) then
						SendPlayerMessage(playerid, 255, 0, 0, "В нике не должно быть символов");
						_Kick(playerid);
						return;
					elseif string.find(login..'', '"', 1) then
						SendPlayerMessage(playerid, 255, 0, 0, "В нике не должно быть символов");
						_Kick(playerid);
						return;
					end
				
					local res =  mysql_query ( handler, "SELECT `game_password` FROM `phpbb_users` WHERE `username` = '"..login.."'");
					Player[playerid].Row_Forum = mysql_fetch_row(res);
					if res then
						mysql_free_result(res); --to po kaїdym zapytaniu ma byж!!
					end
					
					if Player[playerid].Row_Forum then -- jeњli gracz istnieje
						res = mysql_query ( handler, "SELECT * FROM player WHERE `nick` = '"..login.."'");
						Player[playerid].Row = mysql_fetch_row(res);
						if res then
							mysql_free_result(res);
						end
						
						res = mysql_query(handler, "SELECT `gold` FROM `player` WHERE `nick` = '"..login.."'");
						Player[playerid].Row_Gold = mysql_fetch_row(res);
						if res then
							mysql_free_result(res);
						end
						
						if Player[playerid].Row == nil then -- jeњli nil gracz nie logowaі siк jeszcze w grze
							res = mysql_query ( handler, "INSERT INTO `player` (`nick`, `world`, `pos_x`, `pos_y`, `pos_z`, `angle`, `body`, `head_model`, `head_texture`, `fat`, `exp`, `exp_next_lvl`, `lvl`, `PN`, `hp`, `max_hp`, `mp`, `max_mp`, `magic_lvl`, `skill_1h`, `skill_2h`, `skill_bow`, `skill_cbow`, `str`, `dex`, `acrobatic`, `science_0`, `science_1`, `science_2`, `science_3`, `science_4`, `science_5`, `science_6`, `rank`, `pk`, `playerkill`, `monsterkill`, `pvp_win`, `pvp_lose`, `body_model`, `gold`, `online`) VALUES ('"..login.."', 'MMO.ZEN', '992.57830810547', '897.88537597656', '-3209.0400390625', '181', '9', 'Hum_Head_FatBald', '18', '0', '0', '500', '0', '0', '40', '40', '0', '0', '0', '0', '0', '0', '0', '10', '10', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Hum_Body_Naked0', '0', '1')");
							if res then
								mysql_free_result(res);
							end
							
							res = mysql_query ( handler, "INSERT INTO `player_hunt` (`nick`, `hunt`, `hunt_lvl`, `hunt_0`, `hunt_1`, `hunt_2`, `hunt_3`, `hunt_4`) VALUES ('"..login.."', '0', '0', '0', '0', '0', '0', '0')");
							if res then
								mysql_free_result(res);
							end
							
							res = mysql_query ( handler, "CREATE TABLE items_"..login.." (slot int(11), item char(40), amount int(11), equipped int(1), PRIMARY KEY(slot)) DEFAULT CHARSET=utf8" );
							if res then
								mysql_free_result(res);
							end
							
							res = mysql_query ( handler, "INSERT INTO `items_"..login.."` (`slot`, `item`, `amount`, `equipped`) VALUES ('0', 'ITMW_1H_VLK_DAGGER', '1', '1')");
							if res then
								mysql_free_result(res);
							end
							
							res = mysql_query ( handler, "INSERT INTO `player_trophy` (`nick`, `Pazury`, `Zuwaczki`, `Plyty`, `Skora`, `Kly`, `Rog`, `Serca`, `Jezyki`, `Krew`, `Luski`, `Kosci`, `Glowy`) VALUES ('"..login.."', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0')");
							if res then
								mysql_free_result(res);
							end
							
							res = mysql_query ( handler, "INSERT INTO `player_npc` (`nick`, `Farim`, `Blyth`, `Will`, `Bob`, `Fred`, `Eowina`, `Tyrion`, `Eomer`, `Brandon`, `Bethan`, `Crosss`, `Hagan`, `Guy`, `Brain`, `Nieznajomy`, `Rafer`, `Jenifer`, `Dirkland`, `Greth`, `Cahan`, `Regin`, `Magnus`) VALUES ('"..login.."', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0')" );
							if res then
								mysql_free_result(res);
							end
						else
							res = mysql_query(handler, "UPDATE `player` SET `online` = '1' WHERE `nick` ='"..login.."'");
							if res then
								mysql_free_result(res);
							end
							
							
							
							res = mysql_query(handler, "SELECT `VIP` FROM player WHERE `nick` = '"..login.."'");
							Player[playerid].vip = mysql_fetch_row(res);
							if Player[playerid].vip[1] == "false" then
								table.remove(Player[playerid].vip , 1);
								Player[playerid].vip = false;
							else
								table.remove(Player[playerid].vip , 1);
								Player[playerid].vip = true;
							end
							if res then
								mysql_free_result(res);
							end
						end
						
						Player[playerid].Account = true
					else
						SendPlayerMessage(playerid, 255, 0, 0, "Нет такого аккаунта");
					end
				else
					SendPlayerMessage(playerid, 255, 0, 0, "MySQL потерял соединение...");
					SendPlayerMessage(playerid, 255, 0, 0, "Попробуйте заново.");
					Kick(playerid);
					reconnectMySQL();
				end
				
				if Player[playerid].Account then
					if MD5(password) == Player[playerid].Row_Forum[1] then
						SetPlayerName(playerid, login);
						SendPlayerMessage(playerid, 0, 255, 0, "Успешный вход!");
						HideDraw(playerid, Draw_Login);
						Player[playerid].LoggedIn = true;
						FreezePlayer(playerid, 0);
						MySQL_Read(playerid);
						ShowPlayerDraw(playerid, getGoldDrawID(playerid)); -- draw ze stanem golda
						ChangeDrawAfterLogin(playerid);
						--SendPlayerMessage(playerid, 255, 0, 0, "Jeњli widzisz, їe straciіeњ golda(prawy rуg) to nie panikuj, ani nie spamuj adminowi.");
						--SendPlayerMessage(playerid, 255, 0, 0, "Tylko wyjdџ awaryjnie bez nadpisywanie save'a: /aww");
						--SendPlayerMessage(playerid, 255, 0, 0, "Jeњli mimo to gold nie wrуci - stwуrz temat na forum.");
						
						local res = mysql_query(handler, "SELECT `group_id` FROM phpbb_users WHERE `username` = '"..GetPlayerName(playerid).."'");
							Player[playerid].adm = mysql_fetch_row(res);
					local adml = Player[playerid].adm
							if Player[playerid].adm[1] == "5" then
								table.remove(Player[playerid].adm , 1);
								Player[playerid].admin = 5;
								SendPlayerMessage(playerid,0,255,255,string.format("%s","Права доступа: Администратор"));
							elseif 
								Player[playerid].adm[1] == "4" then
								table.remove(Player[playerid].adm , 1);
								Player[playerid].admin = 4;
								SendPlayerMessage(playerid,0,255,255,string.format("%s","Права доступа: Гл. Модератор"));
							elseif 
								Player[playerid].adm[1] == "8" then
								table.remove(Player[playerid].adm , 1);
								Player[playerid].admin = 8;
								SendPlayerMessage(playerid,0,255,255,string.format("%s","Права доступа: Модератор"));
							else
								table.remove(Player[playerid].adm , 1);
								Player[playerid].admin = 0;
							end
							if res then
								mysql_free_result(res);
							end
						
					else
						SendPlayerMessage(playerid, 255, 0, 0, "Неправильный пароль!");
					end
				end
			else
				SendPlayerMessage(playerid, 255, 0, 0, "Используй /лог (пароль)");
			end
		else
			SendPlayerMessage(playerid, 255, 0, 0, "Вы уже вошли!");
		end
	end
end

function MySQL_Read(playerid) -- Odczyt danych

	if IsNPC(playerid) ~= 1 then
		
		if checkMySQLConnection() == true then

		--if Player[playerid].LoggedIn == true then
			if Player[playerid].Row == nil then
				local res = mysql_query ( handler, "SELECT * FROM player WHERE `nick` = '"..GetPlayerName(playerid).."'");
				Player[playerid].Row = mysql_fetch_row(res);
				if res then
					mysql_free_result(res);
				end
				
				res = mysql_query(handler, "SELECT `gold` FROM `player` WHERE `nick` = '"..GetPlayerName(playerid).."'");
				Player[playerid].Row_Gold = mysql_fetch_row(res);
				if res then
					mysql_free_result(res);
				end
			end
			
			local res = mysql_query ( handler, "SELECT * FROM player_npc WHERE `nick` = '"..GetPlayerName(playerid).."'");
			Player[playerid].NPC = mysql_fetch_row(res);
			if res then
				mysql_free_result(res);
			end
			
			if GetPlayerWorld(playerid) ~= Player[playerid].Row[2] then
			
				SetPlayerWorld(playerid, Player[playerid].Row[2], "START");
				
			end
				
				SetPlayerAdditionalVisual(playerid, Player[playerid].Row[40], tonumber(Player[playerid].Row[7]), Player[playerid].Row[8], tonumber(Player[playerid].Row[9]));
				Player[playerid].AdditionalVisual = { Player[playerid].Row[40], tonumber(Player[playerid].Row[7]), (GetHeadNumber( Player[playerid].Row[8] ) - 1), tonumber(Player[playerid].Row[9]) };
				SetPlayerFatness(playerid, tonumber(Player[playerid].Row[10]));
				Player[playerid].Fatness = tonumber(Player[playerid].Row[10]);
				SetPlayerExperience(playerid, tonumber(Player[playerid].Row[11]));
				Player[playerid].Experience = tonumber(Player[playerid].Row[11]);
				SetExp(playerid, tonumber(Player[playerid].Row[11]));
				SetPlayerExperienceNextLevel(playerid, tonumber(Player[playerid].Row[12]));
				Player[playerid].ExperienceNextLevel = tonumber(Player[playerid].Row[12]);
				SetPlayerLevel(playerid, tonumber(Player[playerid].Row[13]));
				Player[playerid].Level = tonumber(Player[playerid].Row[13]);
				UpdateLvl(playerid, tonumber(Player[playerid].Row[13]));
				SetPlayerLearnPoints(playerid, tonumber(Player[playerid].Row[14]));
				Player[playerid].LearnPoints = tonumber(Player[playerid].Row[14]);
				SetPlayerHealth(playerid, tonumber(Player[playerid].Row[15]));
				Player[playerid].Health = tonumber(Player[playerid].Row[15]);
				SetPlayerMaxHealth(playerid, tonumber(Player[playerid].Row[16]));
				Player[playerid].MaxHealth = tonumber(Player[playerid].Row[16]);
				SetPlayerMana(playerid, tonumber(Player[playerid].Row[17]));
				Player[playerid].Mana = tonumber(Player[playerid].Row[17]);
				SetPlayerMaxMana(playerid, tonumber(Player[playerid].Row[18]));
				Player[playerid].MaxMana = tonumber(Player[playerid].Row[18]);
				SetPlayerMagicLevel(playerid, tonumber(Player[playerid].Row[19]));
				Player[playerid].MagicLevel = tonumber(Player[playerid].Row[19]);
				SetPlayerSkillWeapon(playerid, SKILL_1H, tonumber(Player[playerid].Row[20]));
				SetPlayerSkillWeapon(playerid, SKILL_2H, tonumber(Player[playerid].Row[21]));
				SetPlayerSkillWeapon(playerid, SKILL_BOW, tonumber(Player[playerid].Row[22]));
				SetPlayerSkillWeapon(playerid, SKILL_CBOW, tonumber(Player[playerid].Row[23]));
				Player[playerid].SkillWeapon = { tonumber(Player[playerid].Row[20]), tonumber(Player[playerid].Row[21]), tonumber(Player[playerid].Row[22]), tonumber(Player[playerid].Row[23]) };
				SetPlayerStrength(playerid, tonumber(Player[playerid].Row[24]));
				Player[playerid].Str = tonumber(Player[playerid].Row[24]);
				SetPlayerDexterity(playerid, tonumber(Player[playerid].Row[25]));
				Player[playerid].Dexterity = tonumber(Player[playerid].Row[25]);
				SetPlayerAcrobatic(playerid, tonumber(Player[playerid].Row[26]));
				Player[playerid].Acrobatic = tonumber(Player[playerid].Row[26]);
				SetPlayerAngle(playerid, tonumber(Player[playerid].Row[6]));
				Player[playerid].Angle = tonumber(Player[playerid].Row[6]);
				SetPlayerPos(playerid, tonumber(Player[playerid].Row[3]), tonumber(Player[playerid].Row[4]), tonumber(Player[playerid].Row[5]));
				Player[playerid].Pos = { tonumber(Player[playerid].Row[3]), tonumber(Player[playerid].Row[4]), tonumber(Player[playerid].Row[5]) }
				SetPlayerScience(playerid, 0, tonumber(Player[playerid].Row[27]));
				SetPlayerScience(playerid, 1, tonumber(Player[playerid].Row[28]));
				SetPlayerScience(playerid, 2, tonumber(Player[playerid].Row[29]));
				SetPlayerScience(playerid, 3, tonumber(Player[playerid].Row[30]));
				SetPlayerScience(playerid, 4, tonumber(Player[playerid].Row[31]));
				SetPlayerScience(playerid, 5, tonumber(Player[playerid].Row[32]));
				SetPlayerScience(playerid, 6, tonumber(Player[playerid].Row[33]));
				Player[playerid].Science = { tonumber(Player[playerid].Row[27]), tonumber(Player[playerid].Row[28]), tonumber(Player[playerid].Row[29]), tonumber(Player[playerid].Row[30]), tonumber(Player[playerid].Row[31]), tonumber(Player[playerid].Row[32]), tonumber(Player[playerid].Row[33]) };

				SetPlayerRank(playerid, tonumber(Player[playerid].Row[34]));
				SetPlayerPK(playerid, tonumber(Player[playerid].Row[35]));
				SetPlayerPlayerKill(playerid, tonumber(Player[playerid].Row[36]));
				SetPlayerMonsterKill(playerid, tonumber(Player[playerid].Row[37]));
				SetPlayerPVP(playerid, tonumber(Player[playerid].Row[38]), tonumber(Player[playerid].Row[39]));

				SetFarim(playerid, tonumber(Player[playerid].NPC[2]));
				SetBlyth(playerid, tonumber(Player[playerid].NPC[3]));
				SetWill(playerid, tonumber(Player[playerid].NPC[4]));
				SetBob(playerid, tonumber(Player[playerid].NPC[5]));
				SetFred(playerid, tonumber(Player[playerid].NPC[6]));
				SetEowina(playerid, tonumber(Player[playerid].NPC[7]));
				SetTyrion(playerid, tonumber(Player[playerid].NPC[9]));
				SetEomer(playerid, tonumber(Player[playerid].NPC[10]));
				SetBrandon(playerid, tonumber(Player[playerid].NPC[8]));		
				SetBethan(playerid, tonumber(Player[playerid].NPC[11]));
				SetCross(playerid, tonumber(Player[playerid].NPC[12]));		
				SetHagan(playerid, tonumber(Player[playerid].NPC[13]));
				SetGuy(playerid, tonumber(Player[playerid].NPC[14]));
				SetBrain(playerid, tonumber(Player[playerid].NPC[15]));
				SetNieznajomy(playerid, tonumber(Player[playerid].NPC[16]))
				SetRafer(playerid, tonumber(Player[playerid].NPC[17]));
				SetJenifer(playerid, tonumber(Player[playerid].NPC[18]));
				SetDirkland(playerid, tonumber(Player[playerid].NPC[19]));
				SetGreth(playerid, tonumber(Player[playerid].NPC[20]));
				SetCahan(playerid, tonumber(Player[playerid].NPC[21]));
				SetRegin(playerid, tonumber(Player[playerid].NPC[22]));
				SetMagnus(playerid, tonumber(Player[playerid].NPC[23]));
				
				
			
			res = mysql_query ( handler, "SELECT * FROM player_hunt WHERE `nick` = '"..GetPlayerName(playerid).."'");
			Player[playerid].Row_Hunt = mysql_fetch_row(res);
			if res then
				mysql_free_result(res);
			end
				
				SetPlayerHuntLvl( playerid, tonumber(Player[playerid].Row_Hunt[3]) );
				SetPlayerHunt( playerid, tonumber(Player[playerid].Row_Hunt[2]) );
				SetPlayerHuntAmount( playerid, tonumber(Player[playerid].Row_Hunt[4]), tonumber(Player[playerid].Row_Hunt[5]), tonumber(Player[playerid].Row_Hunt[6]), tonumber(Player[playerid].Row_Hunt[7]), tonumber(Player[playerid].Row_Hunt[8]) );
			
			res = mysql_query ( handler, "SELECT * FROM player_trophy WHERE `nick` = '"..GetPlayerName(playerid).."'");
			Player[playerid].Trophy = mysql_fetch_row(res);
			if res then
				mysql_free_result(res);
			end
						
				SetPlayerPazury( playerid, tonumber(Player[playerid].Trophy[2]) );
				SetPlayerZuwaczki( playerid, tonumber(Player[playerid].Trophy[3]) );
				SetPlayerPlyty( playerid, tonumber(Player[playerid].Trophy[4]) );
				SetPlayerSkora( playerid, tonumber(Player[playerid].Trophy[5]) );
				SetPlayerKly( playerid, tonumber(Player[playerid].Trophy[6]) );
				SetPlayerRog( playerid, tonumber(Player[playerid].Trophy[7]) );
				SetPlayerSerca( playerid, tonumber(Player[playerid].Trophy[8]) );
				SetPlayerJezyki( playerid, tonumber(Player[playerid].Trophy[9]) );
				SetPlayerKrew( playerid, tonumber(Player[playerid].Trophy[10]) );
				SetPlayerLuski( playerid, tonumber(Player[playerid].Trophy[11]) );
				SetPlayerKosci( playerid, tonumber(Player[playerid].Trophy[12]) );
				SetPlayerGlowy( playerid, tonumber(Player[playerid].Trophy[13]) );
				

			--[[local res = mysql_query ( handler, "SELECT COUNT(*) FROM `items_"..GetPlayerName(playerid).."`");
			local AmountItem = mysql_fetch_row(res);
			if res then
				mysql_free_result(res);
			end
			
			if not(AmountItem) then
			
				print("MySQL Bledy:", mysql_error ( handler ));
				LogString("Logs_MysqlError","MySQL AmountItem "..mysql_error ( handler ));
				
			else
			
			for i = 0, AmountItem[1] - 1 do
				local res = mysql_query ( handler, "SELECT * FROM items_"..GetPlayerName(playerid).." WHERE `slot` = '"..i.."'");
				if res then
					Player[playerid].Row_Item = mysql_fetch_row(res);
					mysql_free_result(res);
					GiveItem(playerid, Player[playerid].Row_Item[2], tonumber(Player[playerid].Row_Item[3]));
				else
					local res = mysql_query ( handler, "SELECT * FROM items_"..GetPlayerName(playerid).." WHERE `slot` = '"..tonumber(i + 1).."'");
					if res then
						Player[playerid].Row_Item = mysql_fetch_row(res);
						mysql_free_result(res);
						GiveItem(playerid, Player[playerid].Row_Item[2], tonumber(Player[playerid].Row_Item[3]));
					else
						LogString("Logs_eq", GetPlayerName(playerid).." nie mogк odczytaж eq :/");
					end
				end
			
			end
			end]]
			
			--Odczyt EQ
			local items = getMySQLTableAllRow("items_"..GetPlayerName(playerid))
			if items then
				for i in pairs(items) do
					GiveItem(playerid, items[i]["item"], tonumber(items[i]["amount"]))
				end
			end
			
			-- Gold
			if Player[playerid].Row_Gold[1] ~= "NULL" then
				SetPlayerGold(playerid, tonumber(Player[playerid].Row_Gold[1]));
				table.remove(Player[playerid].Row_Gold, 1);
			end
			
			--end
					
			else
				SendPlayerMessage(playerid, 255, 255, 0, "Потеряно соединение с MySQL. Перезайдите в игу");
				Kick(playerid);
				reconnectMySQL();
			end
				end
				if res ~= nil then
					mysql_free_result(res);
				end
			end

--From b-engine
function getMySQLTableAllRow(tablename)
	if tablename then		
		if checkMySQLConnection() == true then
			local arg = "";
			local table_amount = "SELECT COUNT(*) FROM `"..tablename.."`";
			local result = mysql_query(handler, table_amount);
			if not(result) then
				--mysql_free_result(result);
				LogString("Logs_MySQL", table_amount);
				return false;
			else
				local rows = {};
				local amount = mysql_fetch_row(result);
				mysql_free_result(result);
				result = mysql_query(handler, "SELECT * FROM "..tablename);
				for i = 1, amount[1] do
					local row = mysql_fetch_assoc(result);
					table.insert(rows, row);
				end
				mysql_free_result(result);
				return rows;
			end
		end
	else
		print("Error: Missing argument on function: insertMySQLTable");
	end
		return false;
end
--end from b-engine

function MySQL_MakeOffline(playerid)
	if checkMySQLConnection() == true then
		local res = mysql_query(handler, "UPDATE `player` SET `online` = '0' WHERE `nick` = '"..GetPlayerName(playerid).."'");
		if res then
			mysql_free_result(res);
		end
	else
		reconnectMySQL();
	end
	if res ~= nil then
		mysql_free_result(res);
	end
end

function MySQL_Save(playerid)
	
	if Player[playerid].LoggedIn == true then
	
		if checkMySQLConnection() == true then
			
			local x, y, z = GetPlayerPos(playerid);			
			local body_model, body, head_model, head_texture = GetPlayerAdditionalVisual(playerid);
			local world = "MMO.ZEN" --na sztywno i chooj
			local hunt_0, hunt_1, hunt_2, hunt_3, hunt_4 = GetPlayerHuntAmount(playerid);
			
			local res = mysql_query ( handler, "UPDATE `player` SET `world` = '"..world.."', `pos_x` = '"..x.."', `pos_y` = '"..y.."', `pos_z` = '"..z.."', `angle` = '"..GetPlayerAngle(playerid).."', `body` = '"..Player[playerid].AdditionalVisual[2].."', `head_model` = '"..GetHeadID( Player[playerid].AdditionalVisual[3] + 1 ).."', `head_texture` = '"..Player[playerid].AdditionalVisual[4].."', `fat` = '"..Player[playerid].Fatness.."', `exp` = '"..Player[playerid].Experience.."', `exp_next_lvl` = '"..Player[playerid].ExperienceNextLevel.."', `lvl` = '"..Player[playerid].Level.."', `PN` = '"..Player[playerid].LearnPoints.."', `hp` = '"..GetPlayerHealth(playerid).."', `max_hp` = '"..Player[playerid].MaxHealth.."', `mp` = '"..GetPlayerMana(playerid).."', `max_mp` = '"..Player[playerid].MaxMana.."', `magic_lvl` = '"..Player[playerid].MagicLevel.."', `skill_1h` = '"..Player[playerid].SkillWeapon[1].."', `skill_2h` = '"..Player[playerid].SkillWeapon[2].."', `skill_bow` = '"..Player[playerid].SkillWeapon[3].."', `skill_cbow` = '"..Player[playerid].SkillWeapon[4].."', `str` = '"..Player[playerid].Str.."', `dex` = '"..Player[playerid].Dexterity.."', `acrobatic` = '"..Player[playerid].Acrobatic.."', `science_0` = '"..Player[playerid].Science[1].."', `science_1` = '"..Player[playerid].Science[2].."', `science_2` = '"..Player[playerid].Science[3].."', `science_3` = '"..Player[playerid].Science[4].."', `science_4` = '"..Player[playerid].Science[5].."', `science_5` = '"..Player[playerid].Science[6].."', `science_6` = '"..Player[playerid].Science[7].."', `rank` = '"..GetPlayerRankPoints(playerid).."', `pk` = '"..GetPlayerPKPoints(playerid).."', `playerkill` = '"..GetPlayerPlayerKill(playerid).."', `monsterkill` = '"..GetPlayerMonsterKill(playerid).."', `pvp_win` = '"..GetPlayerPVPWin(playerid).."', `pvp_lose` = '"..GetPlayerPVPLose(playerid).."', `body_model` = '"..Player[playerid].AdditionalVisual[1].."' WHERE `nick` = '"..GetPlayerName(playerid).."'" );
			if res then
				mysql_free_result(res);
			end
			
			res = mysql_query ( handler, "UPDATE `player_npc` SET `Farim` = '"..GetFarim(playerid).."', `Blyth` = '"..GetBlyth(playerid).."', `Will` = '"..GetWill(playerid).."', `Bob` = '"..GetBob(playerid).."', `Fred` = '"..GetFred(playerid).."', `Eowina` = '"..GetEowina(playerid).."', `Tyrion` = '"..GetTyrion(playerid).."', `Eomer` = '"..GetEomer(playerid).."', `Brandon` = '"..GetBrandon(playerid).."', `Bethan` = '"..GetBethan(playerid).."', `Crosss` = '"..GetCross(playerid).."', `Hagan` = '"..GetHagan(playerid).."', `Guy` = '"..GetGuy(playerid).."', `Brain` = '"..GetBrain(playerid).."', `Nieznajomy` = '"..GetNieznajomy(playerid).."', `Rafer` = '"..GetRafer(playerid).."', `Jenifer` = '"..GetJenifer(playerid).."', `Dirkland` = '"..GetDirkland(playerid).."', `Greth` = '"..GetGreth(playerid).."', `Cahan` = '"..GetCahan(playerid).."', `Regin` = '"..GetRegin(playerid).."', `Magnus` = '"..GetMagnus(playerid).."' WHERE `nick` = '"..GetPlayerName(playerid).."'" );
			if res then
				mysql_free_result(res);
			end
			
			res = mysql_query ( handler, "UPDATE `player` SET `gold` = '"..GetPlayerGold(playerid).."' WHERE `nick` = '"..GetPlayerName(playerid).."'" );
			if res then
				mysql_free_result(res);
			else
				LogString("Logs_MySQL", GetPlayerName(playerid).."'owi nie zapisaіo golda w iloњci: "..GetPlayerGold(playerid).."");
			end
			
			res = mysql_query ( handler, "UPDATE `player_hunt` SET `hunt` = '"..GetPlayerHunt( playerid ).."', `hunt_lvl` = '"..GetPlayerHuntLvl( playerid ).."', `hunt_0` = '"..hunt_0.."', `hunt_1` = '"..hunt_1.."', `hunt_2` = '"..hunt_2.."', `hunt_3` = '"..hunt_3.."', `hunt_4` = '"..hunt_4.."' WHERE `nick` = '"..GetPlayerName(playerid).."'" );
			if res then
				mysql_free_result(res);
			end
			
			res = mysql_query ( handler, "UPDATE `player_trophy` SET `Pazury` = '"..GetPlayerPazury( playerid ).."', `Zuwaczki` = '"..GetPlayerZuwaczki( playerid ).."', `Plyty` = '"..GetPlayerPlyty( playerid ).."', `Skora` = '"..GetPlayerSkora( playerid ).."', `Kly` = '"..GetPlayerKly( playerid ).."', `Rog` = '"..GetPlayerRog( playerid ).."', `Serca` = '"..GetPlayerSerca( playerid ).."', `Jezyki` = '"..GetPlayerJezyki( playerid ).."', `Krew` = '"..GetPlayerKrew( playerid ).."', `Luski` = '"..GetPlayerLuski( playerid ).."', `Kosci` = '"..GetPlayerKosci( playerid ).."', `Glowy` = '"..GetPlayerGlowy( playerid ).."' WHERE `nick` = '"..GetPlayerName(playerid).."'" );
			if res then
				mysql_free_result(res);
			end
			
			res = mysql_query ( handler, "TRUNCATE TABLE items_"..GetPlayerName(playerid).."");
			if res then
				mysql_free_result(res);
			end
			
			for i = 1, GetTableItemLenght( playerid ) do
				if string.upper(GetItemPlayer(playerid, i)) ~= "ITMI_GOLD" then
			
				res = mysql_query ( handler, "INSERT INTO `items_"..GetPlayerName(playerid).."` (`slot`, `item`, `amount`, `equipped`) VALUES ('"..(i - 1).."', '"..GetItemPlayer( playerid, i ).."', '"..GetItemAmountPlayer( playerid, i ).."', '"..GetItemEquipPlayer( playerid, i ).."')");
				if res then
					mysql_free_result(res);
				end
				end
				
			end
			
		else
			SendPlayerMessage(playerid, 255, 255, 0, "Потеряно соединение с MySQL. Перезайдите в игу");
			reconnectMySQL();
			
		end
		
	end
	if res ~= nil then
		mysql_free_result(res);
	end

end

-- Table Save(Lua, not MySQL)
function Read_Statistic_and_Item(playerid)

	Player[playerid].Read = true;
	
	SetPlayerAdditionalVisual(playerid, Player[playerid].AdditionalVisual[1], Player[playerid].AdditionalVisual[2], GetHeadID( Player[playerid].AdditionalVisual[3] + 1 ), Player[playerid].AdditionalVisual[4]);
	SetPlayerFatness(playerid, Player[playerid].Fatness);
	SetPlayerExperience(playerid, Player[playerid].Experience);
	SetPlayerExperienceNextLevel(playerid, Player[playerid].ExperienceNextLevel);
	SetPlayerLevel(playerid, Player[playerid].Level);
	SetPlayerLearnPoints(playerid, Player[playerid].LearnPoints);
	SetPlayerHealth(playerid, Player[playerid].Health);
	SetPlayerMaxHealth(playerid, Player[playerid].MaxHealth);
	SetPlayerMana(playerid, Player[playerid].Mana);
	SetPlayerMaxMana(playerid, Player[playerid].MaxMana);
	SetPlayerMagicLevel(playerid, Player[playerid].MagicLevel);
	SetPlayerSkillWeapon(playerid, SKILL_1H, Player[playerid].SkillWeapon[1]);
	SetPlayerSkillWeapon(playerid, SKILL_2H, Player[playerid].SkillWeapon[2]);
	SetPlayerSkillWeapon(playerid, SKILL_BOW, Player[playerid].SkillWeapon[3]);
	SetPlayerSkillWeapon(playerid, SKILL_CBOW, Player[playerid].SkillWeapon[4]);
	SetPlayerStrength(playerid, Player[playerid].Str);
	SetPlayerDexterity(playerid, Player[playerid].Dexterity);
	SetPlayerAcrobatic(playerid, Player[playerid].Acrobatic);
	SetPlayerAngle(playerid, Player[playerid].Angle);
	SetPlayerPos(playerid, Player[playerid].Pos[1], Player[playerid].Pos[2], Player[playerid].Pos[3]);
	SetPlayerScience(playerid, 0, Player[playerid].Science[1]);
	SetPlayerScience(playerid, 1, Player[playerid].Science[2]);
	SetPlayerScience(playerid, 2, Player[playerid].Science[3]);
	SetPlayerScience(playerid, 3, Player[playerid].Science[4]);
	SetPlayerScience(playerid, 4, Player[playerid].Science[5]);
	SetPlayerScience(playerid, 5, Player[playerid].Science[6]);
	SetPlayerScience(playerid, 6, Player[playerid].Science[7]);
				
	for i = 1, GetTableItemLenght( playerid ) do
		if string.upper(GetItemPlayer(playerid, i)) ~= "ITMI_GOLD" then
	
		GiveItem(playerid, GetItemPlayer( playerid, i ), GetItemAmountPlayer( playerid, i ), GetItemEquipPlayer( playerid, i ));
		
		end
		
	end
	
	--SetPlayerGold(playerid, Player[playerid].goldek);
	
	Player[playerid].Read = false;
end

function PlayerDeath_Set_Statistic(playerid)

	if IsNPC(playerid) ~= 1 then
	
		if GetPK(playerid) == true then
		
			if IsDeathByMonster(playerid) == false then
		
				local exp_drop, gold_drop = GetPlayerPKofKarma(playerid);
				SetExp(playerid, GetExp(playerid)*(1-exp_drop));
				if tonumber((GetPlayerGold(playerid)) * (1 - gold_drop)) > 0 then
					SetPlayerGold(playerid, tonumber((GetPlayerGold(playerid)) * (1 - gold_drop)));
				else
					SetPlayerGold(playerid, 0);
				end
				SendPlayerMessage(playerid, 0, 255, 0, "Штраф за карму -"..(100*exp_drop).."% опыта и -"..(100*gold_drop).."% золота");
				
			else
			
				ResetDeathByMonster(playerid);
				
			end
			
		end	
		
		local x, y, z, angle = GetPosByWorld( playerid );
		
		Player[playerid].Pos = { x, y, z };
		Player[playerid].Angle = angle;
		Player[playerid].Health = Player[playerid].MaxHealth * 0.4;
		
		--Player[playerid].goldek = GetPlayerGold(playerid);
		
	end

end

function GetPlayerLoggedIn(playerid)

	if Player[playerid].LoggedIn ~= nil then

		return Player[playerid].LoggedIn;
		
	else
	
		return false;
	
	end

end

function ResetPlayerLoggedIn(playerid)
	
	Player[playerid].LoggedIn = false;

end

function GetAccount(playerid)

	return Player[playerid].Account;

end

function GetRead(playerid)

	return Player[playerid].Read;

end

--
-- Get
--

function GetExp(playerid)
	
	return Player[playerid].Experience;
	
end

function GetLP(playerid)

	return Player[playerid].LearnPoints;

end

function GetMaxHealth(playerid)

	return Player[playerid].MaxHealth;

end

function GetLevel(playerid)

	return Player[playerid].Level;

end

function GetSkillWeapon(playerid, id)
	
	return Player[playerid].SkillWeapon[id];
	
end

function GetStrength(playerid)

	return Player[playerid].Str;

end

function GetDexterity(playerid)

	return Player[playerid].Dexterity;

end

function GetMana(playerid)

	return Player[playerid].Mana;

end

function GetHealth(playerid)

	return Player[playerid].Health;

end

function GetMagicLevel(playerid)

	return Player[playerid].MagicLevel;

end

function GetExperienceNextLevel(playerid)

	return Player[playerid].ExperienceNextLevel;

end

function GetAdditionalVisual(playerid, id)

	return Player[playerid].AdditionalVisual[id];

end

function IsPlayerVIP(playerid)
	if Player[playerid].vip == true then
		return 1;
	else
		return 0;
	end
end

--
-- Set
--

function SetAdm(playerid, adm)

	Player[playerid].adm = adm;

end

function SetExp(playerid, _exp)

	Player[playerid].Experience = _exp;

end

function SetLP(playerid, lp)

	Player[playerid].LearnPoints = lp;

end

function SetMaxHealth(playerid, max_h)

	Player[playerid].MaxHealth = max_h;
	
	CheckValue(playerid, block, value);

end

function SetLevel(playerid, lvl)

	Player[playerid].Level = lvl;

end

function SetSkillWeapon(playerid, id, skill)
	
	Player[playerid].SkillWeapon[id] = skill;
	
end

function SetStrength(playerid, str)

	Player[playerid].Str = str;

end

function SetDexterity(playerid, dex)

	Player[playerid].Dexterity = dex;

end

function SetMana(playerid, mana)

	Player[playerid].Mana = mana;

end

function SetHealth(playerid, health)

	Player[playerid].Health = health;
	
	CheckValue(playerid, block, value);

end

function SetMagicLevel(playerid, magic_lvl)

	Player[playerid].MagicLevel = magic_lvl;

end

function SetExpNextLevel(playerid, _exp)

	Player[playerid].ExperienceNextLevel =  _exp;

end

function SetAdditionalVisual(playerid, id, value)

	Player[playerid].AdditionalVisual[id] = value;

end

print(debug.getinfo(1).source.." has been loaded.");