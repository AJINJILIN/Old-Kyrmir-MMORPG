--[[
	Kyrmir MMORPG
	Plik Gіуwny
	Авторы: Bimbol, Kimior, Profesores
	Перевел: Нуар
]]

--require "Antycheat/hooks" --hooks
--require "Antycheat/ac"	--AC
--require "Antycheat/callbackac" -- callbacks of AC
require "MySQL_Lib/mysql_lib" -- MySQL BD
require "Monster-framework/monster-framework" -- Monster Lib
require "Monster-framework/monster" -- monster
require "NPC_Lib/pomoc" -- help
require "Monster-framework/safezone" -- safezone
require "Monster-framework/pk" -- playerkiller
require "MySQL_Lib/finditem" -- Table Saves
require "MySQL_Lib/getfood" -- Check Food
require "MySQL_Lib/autosave" -- Auto Save
require "NPC_Lib/trade_player" -- Handel
require "NPC_Lib/trade_player_gold" -- Handel gold
require "Function/GetSZbyWorld"
require "Function/GetPosByWorld"
require "NPC_Lib/lvl_armor"
require "Function/checknpcpos"
require "Function/adminek" -- admin filterscript
require "Function/gold"
require "Framework/createherbs"
require "Framework/herbs"

require "Function/GetHeadID"
require "NPC_Lib/npclist"

--require "Framework/map"


---------------------------------
-- Global Draws and Textures
---------------------------------

local Server_Name = CreateDraw(5800, 200, "Old Kyrmir MMORPG", "Font_Old_10_White_Hi.TGA", 0, 43, 255);
local Server_Link = CreateDraw(5590, 335, "Кто на R-9-2 тот чмо", "Font_Old_10_White_Hi.TGA", 0, 43, 255);
local Server_Menu = CreateDraw(5850, 600, "F7 - Меню.", "Font_Old_10_White_Hi.TGA", 255, 255, 0);
local Server_Quit = CreateDraw(5820, 600, "/выход (или /q) - для выхода из игры.", "Font_Old_10_White_Hi.TGA", 255, 0, 0);

local Texture_Menu_NPC = CreateTexture(1350, 6750, 6800, 8100, "Frame_GMPA.TGA");
local Menu_Texture = CreateTexture(3300, 2050, 6000, 4600, "Log_Paper.TGA");

local Player_Text = CreateTexture(3500, 4000, 5000, 6000, "Log_Paper.TGA");

local Wyglad_Text = CreateTexture(550, 3200, 2650, 5200, "Log_Paper.TGA");

local FocusNPC_Texture = CreateTexture(2600, 6650, 5750, 7350, "Frame_GMPA.TGA");
local FocusNPC_Draw = CreateDraw(3050, 6900, "Нажми CTRL для разговора с NPC", "Font_Old_10_White_Hi.TGA", 255, 255, 0);
local Restart_Draw = CreateDraw(1500, 3300, "Рестарт наступит через: 60","Font_Old_20_White_Hi.TGA", 255, 0, 0);

local Lvl_Draw = CreateDraw(150, 7050, "Ур.:", "Font_Old_10_White_Hi.TGA", 255, 255, 0);

---------------------------------
-- Menu
---------------------------------

local Menu_Game = CreateMenu(4, "Выход из игры", Menu_Texture, 3450, 2300, "Font_Old_20_White_Hi.TGA", 300, 255, 255, 255, 255, 255, 0, "menu_game");
local Menu_Wyglad = CreateMenu(4, "Сменить внешность", Wyglad_Text, 850, 3600, "Font_Old_20_White_Hi.TGA", 300, 255, 255, 255, 255, 255, 0, "menu_wyglad");
local Menu_Player = CreateMenu(4, "Информация о персонаже", Player_Text, 3900, 4300, "Font_Old_20_White_Hi.TGA", 300, 255, 255, 255, 255, 255, 0, "menu_player");
local Menu_Pray = CreateMenu(1, "", GetNPCMenuTexture(), 1450, 6850, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "menu_pray");

---------------------------------
-- Vars
---------------------------------

local Player = {};
local Start_Restart = false;
---------------------------------
-- Consts
---------------------------------

local Czat_time = 15;
local Restart = 60;

--[[local Runner = 95;
local Runner2 = 0;]]

---------------------------------
-- Player Class
---------------------------------

function CreatePlayer(playerid)

	local Player = {};
	
	Player.Talking = false;
	Player.NPC = false;
	Player.MenuPlayer = false;
	Player.Timer_Party = -1;
	Player.Timer_PVP = -1;
	Player.PVP = -1;
	Player.Party = -1;
	Player.Focus = -1;
	Player.Menu = -1;
	Player.Submenu = 0;
	Player.StandUp = false;
	
	Player.CheckItem = 0;
	Player.Fish = false;
	Player.Rzepa = false;
	Player.Counter = 0;
	Player.GCzat = 0;
	Player.Mute = false;
	Player.Pray = false;
	
	Player.Item = {};
	Player.Item_Amount = {};
	Player.Item_Equip = {};
	Player.Exiting = false;
	Player.HPs = 0;
	Player.FirstHit = true;
	Player.prosba = false; --телепортация VIP
	Player.kto = nil;
	Player.gchat = true;
	Player.chat = true;

	Player.FreeDraw = CreatePlayerDraw(playerid, 2550, 6850, "0", "Font_Old_10_White_Hi.TGA", 255, 255, 0);
	
	return Player;
	
end


function OnGamemodeInit()
	EnableExitGame(0);
	EnableDropAfterDeath(0);
	EnableChat(0);
	OpenLocks(1);
	Enable_OnPlayerKey(1);
	EnableNicknameID(0);
	SetRespawnTime(1000 * 12);
	SetGamemodeName("Old Kyrmir MMORPG");
	SetServerDescription("https://g2-mp.ru/mmo/");
	print("---------------------");
	print("Mordan MMORPG Engine");
	print("---------------------");

	SpawnNPC(); --Npc's
	SpawnMonsters(); -- Монстры
	SpawnHerbs() -- Трава
	
	SetTimer("RespawnItemOnGrund", 1000 * 60 * 20, 1); -- Респавн травы
	
	SetTimer("Prace", 1000, 1); -- Работа
	--SetTimer("UpdateMap", 1000, 1); -- Карта
	SetTimer("AI_Monster_Mordan", 550, 1); -- AI Monster
	SetTimer("AI_Monster_GD", 550, 1); -- AI Monster GD
	SetTimer("AI_Monster_3", 550, 1); -- AI Monster 3
	SetTimer("Respawn_Monster", 60 * 1000, 1); -- Respawn Monster
	SetTimer("AutoSave", 60 * 1000 * 3, 1); -- Auto Save
	
	MySQLInit();
	--init_ac(true);
	initAdmin();
	initTrade();
	
	print("Gamemode loaded completely");
end

function OnGamemodeExit()
	print("Mordan MMORPG Engine exit");
end

function OnPlayerConnect(playerid)
	if IsNPC(playerid) == 0 then
	
		if string.find(GetPlayerName(playerid).."", "'", 1) then
			SendPlayerMessage(playerid, 255, 0, 0, "Ник не может содержать странные символы ;)");
			_Kick(playerid);
			return;
		elseif string.find(GetPlayerName(playerid).."", "`", 1) then
			SendPlayerMessage(playerid, 255, 0, 0, "Ник не может содержать странные символы ;)");
			_Kick(playerid);
			return;
		elseif string.find(GetPlayerName(playerid)..'', '"', 1) then
			SendPlayerMessage(playerid, 255, 0, 0, "Ник не может содержать странные символы ;)");
			_Kick(playerid);
			return;
		end
		
		SetPlayerColor(playerid, 255, 255, 255);
		--if not(checkBan(playerid)) then --проверить бан
		
		SetPlayerWorld(playerid, "MMO.ZEN", "START");
		
		Player[playerid] = CreatePlayer(playerid); --создать базовую структуру игрока
		local name = GetPlayerName(playerid);
		SerwerInfo(playerid); --информация о сервере
		Menu_OnPlayerConnect(playerid); --создать структуру диалогов
		Monster_OnPlayerConnect(playerid); --это есть в monster-framework.lua xD
		PK_OnPlayerConnect(playerid); --создать структуру статистик
		TradePlayer_OnPlayerConnect(playerid); --zapewne tworzy strukture handlu ;P
		goldInit(playerid); -- Virtual Gold Init
		PartyInit(playerid); --strzelam, їe tworzy strukture grup
		MySQL_OnPlayerConnect(playerid); --Tworzy strukture gracza do obsіugi zapisu
		--OnPlayerLoggedInMap(playerid); --tworzy strukture do mini-mapy, zbкdne na razie!!!
		
		SendMessageToAll(0, 255, 0, name.." присоединился к серверу.");
		
		--[[if GetAccount(playerid) == false then
			SendPlayerMessage(playerid, 255, 255, 0, "Зарегистрируйся на форуме!");
			_Kick(playerid); --przed kickiem pojawi mu siк draw їeby siк zarejestrowaі, dziкki opcji wyїej ;P
		end
		
		GetMD5File(playerid,"data\\kyrmirv.vdf");
		GetMD5File(playerid,"VDFS.CFG");
		GetMD5File(playerid, "System\\kyrmir.dll");
		GetMD5File(playerid, "System\\Kyrmir-Launcher.exe");
		GetMD5File(playerid, "Accrescere\\Data\\gmpa.vdf");
		GetMD5File(playerid, "System\\Paths.d");]]
		
		--Anty-Gard
		--[[GetMD5File(playerid, "_WORK\\DATA\\SCRIPTS\\_COMPILED\\GOTHIC.DAT");
		GetMD5File(playerid, "DATA\\ANIMS.VDF");
		GetMD5File(playerid, "DATA\\ANIMS_ADDON.VDF");
		GetMD5File(playerid, "DATA\\MESHES.VDF");
		GetMD5File(playerid, "DATA\\MESHES_ADDON.VDF");
		GetMD5File(playerid, "DATA\\SOUNDS.VDF");
		GetMD5File(playerid, "DATA\\SOUNDS_ADDON.VDF");
		GetMD5File(playerid, "DATA\\SOUNDS_BIRD_01.VDF");
		GetMD5File(playerid, "DATA\\SPEECH1.VDF");
		GetMD5File(playerid, "DATA\\SPEECH2.VDF");
		GetMD5File(playerid, "DATA\\SPEECH_ADDON.VDF");
		GetMD5File(playerid, "DATA\\TEXTURES.VDF");
		GetMD5File(playerid, "DATA\\TEXTURES_ADDON.VDF");
		GetMD5File(playerid, "DATA\\WORLDS.VDF");
		GetMD5File(playerid, "DATA\\WORLD_ADDON.VDF");]]
		--End Of Anty-Gard
		
		if IsPlayerVIP(playerid) == 1 then
			SetPlayerColor(playerid, 102, 51, 255);
		end
		
		--end
	else
		SetPlayerColor(playerid, 51, 102, 255);

		end
		
		--[[if not(addRunner(playerid)) then
			SendPlayerMessage(playerid, 255, 0, 0, "Nie moїesz wejњж bez naszego launchera ;)");
			SendPlayerMessage(playerid, 255, 0, 0, "Launcher jest do pobrania na forum: 176.122.224.129");
			_Kick(playerid);
		end]]
		
		--[[if GetPlayerName(playerid) ~= "Profesores" then
			SendPlayerMessage(playerid, 255, 0, 0, "Jeszcze nie !");
			_Kick(playerid);
		end]]
	end
--end

function OnPlayerMD5File(playerid, pathFile, hash)
	if IsNPC(playerid) == 0 then
		if pathFile == "data\\kyrmirv.vdf" then
			if hash ~= "9a77ad55d52e05f6c2098c0f31309abd" then
				SendPlayerMessage(playerid, 255, 255, 0, "Скачать kyrmirv.vdf с форума: ru.gothic-multiplayer.com");
				_Kick(playerid);
			end
		elseif pathFile == "VDFS.CFG" then
			if hash ~= "0e3501ba7260d12e21171d38abed5940" then
				SendPlayerMessage(playerid, 255, 255, 0, "Неверный VDFS.CFG!");
				SendPlayerMessage(playerid, 255, 255, 0, "Скачайте нужный с форума: ru.gothic-multiplayer.com");
				SendPlayerMessage(playerid, 255, 255, 0, "Последняя актуальная версия 18.02 ;)");
				_Kick(playerid);
			end
		--[[elseif pathFile == "System\\kyrmir.dll" then
			if hash ~= "5b353fdcdc6e1c3825dee14b9594fa8a" then
				SendPlayerMessage(playerid, 255, 0, 0, "Posiadasz nieprawidіowy plik: kyrmir.dll");
				SendPlayerMessage(playerid, 255, 0, 0, "Pobierz poprawn№ wersje z: 176.122.224.129");
				_Kick(playerid);
			end
		elseif pathFile == "System\\Kyrmir-Launcher.exe" then
			if hash ~= "479cc46e46d9aae96928b2dc7a1b364e" then
				SendPlayerMessage(playerid, 255, 0, 0, "Posiadasz nieprawidіowy plik: Kyrmir-Launcher.exe");
				SendPlayerMessage(playerid, 255, 0, 0, "Pobierz poprawn№ wersje z: 176.122.224.129");
				_Kick(playerid);
			end]]
		--[[elseif pathFile == "Accrescere\\Data\\gmpa.vdf" then-----------------------------------------------
			if hash ~= "4d36120d7fb329ff9b2f9f504f994d4f" then
				SendPlayerMessage(playerid, 255, 0, 0, "Неверный файл gmpa.vdf");
				SendPlayerMessage(playerid, 255, 0, 0, "Свали отсюда, блядь, зачем тебе мне видеть? ;)");
				_Kick(playerid);
				LogString("Попытка читерства", GetPlayerName(playerid).." мудак ибоный");
			end]]
		--[[elseif pathFile == "System\\Paths.d" then----------------------------------------------------------
			if hash ~= "45cbdeb109bf8e13925fb902a542ca94" then
				SendPlayerMessage(playerid, 255, 0, 0, "Неверный файл Paths.d");
				SendPlayerMessage(playerid, 255, 0, 0, "Мамку твою ебал, читер ;)");
				_Kick(playerid);
				LogString("Попытка читерства", GetPlayerName(playerid).." Замена: Paths.d");
			end]]
			
		--[[elseif pathFile == "_WORK\\DATA\\SCRIPTS\\_COMPILED\\GOTHIC.DAT" then
			if hash ~= "81aa52c0d2e22ca1140b0ac6ada6f48b" then
				SendPlayerMessage(playerid, 255, 0, 0, "Posiadasz nieprawidіowy plik GOTHIC.DAT");
				SendPlayerMessage(playerid, 255, 0, 0, "Zgіoњ siк na forum po poprawny ;)");
				_Kick(playerid);
			end
		elseif pathFile == "DATA\\ANIMS.VDF" then
			if hash ~= "0214de30fb89c9edd0feee7d027daa09" then
				SendPlayerMessage(playerid, 255, 0, 0, "Posiadasz nieprawidіowy plik ANIMS.VDF");
				SendPlayerMessage(playerid, 255, 0, 0, "Zgіoњ siк na forum po poprawny ;)");
				_Kick(playerid);
			end
		elseif pathFile == "DATA\\ANIMS_ADDON.VDF" then
			if hash ~= "dae68a4cb2826e365a4925567d151167" then
				SendPlayerMessage(playerid, 255, 0, 0, "Posiadasz nieprawidіowy plik ANIMS_ADDON.VDF");
				SendPlayerMessage(playerid, 255, 0, 0, "Zgіoњ siк na forum po poprawny ;)");
				_Kick(playerid);
			end
		elseif pathFile == "DATA\\MESHES.VDF" then
			if hash ~= "9bd6be1dced9f8e58bfa7adbe733fc78" then
				SendPlayerMessage(playerid, 255, 0, 0, "Posiadasz nieprawidіowy plik MESHES.VDF");
				SendPlayerMessage(playerid, 255, 0, 0, "Zgіoњ siк na forum po poprawny ;)");
				_Kick(playerid);
			end
		elseif pathFile == "DATA\\MESHES_ADDON.VDF" then
			if hash ~= "7921fc96579116c411737a6bc4c72451" then
				SendPlayerMessage(playerid, 255, 0, 0, "Posiadasz nieprawidіowy plik MESHES_ADDON.VDF");
				SendPlayerMessage(playerid, 255, 0, 0, "Zgіoњ siк na forum po poprawny ;)");
				_Kick(playerid);
			end
		elseif pathFile == "DATA\\SOUNDS.VDF" then
			if hash ~= "7f77f0f88200379fa9025389bdafa5d8" then
				SendPlayerMessage(playerid, 255, 0, 0, "Posiadasz nieprawidіowy plik SOUNDS.VDF");
				SendPlayerMessage(playerid, 255, 0, 0, "Zgіoњ siк na forum po poprawny ;)");
				_Kick(playerid);
			end
		elseif pathFile == "DATA\\SOUNDS_ADDON.VDF" then
			if hash ~= "2ef076015944b6c13d88657a3c8e1fc4" then
				SendPlayerMessage(playerid, 255, 0, 0, "Posiadasz nieprawidіowy plik SOUNDS_ADDON.VDF");
				SendPlayerMessage(playerid, 255, 0, 0, "Zgіoњ siк na forum po poprawny ;)");
				_Kick(playerid);
			end
		elseif pathFile == "DATA\\SOUNDS_BIRD_01.VDF" then
			if hash ~= "bfd3909e391ab7023fd7f082c2fd9808" then
				SendPlayerMessage(playerid, 255, 0, 0, "Posiadasz nieprawidіowy plik SOUNDS_BIRD_01.VDF");
				SendPlayerMessage(playerid, 255, 0, 0, "Zgіoњ siк na forum po poprawny ;)");
				_Kick(playerid);
			end
		elseif pathFile == "DATA\\SPEECH1.VDF" then
			if hash ~= "5cc27fca463e008447899be4589f1559" then
				SendPlayerMessage(playerid, 255, 0, 0, "Posiadasz nieprawidіowy plik SPEECH1.VDF");
				SendPlayerMessage(playerid, 255, 0, 0, "Zgіoњ siк na forum po poprawny ;)");
				_Kick(playerid);
			end
		elseif pathFile == "DATA\\SPEECH2.VDF" then
			if hash ~= "97bcf035a6d33ab0888d19daae59ff03" then
				SendPlayerMessage(playerid, 255, 0, 0, "Posiadasz nieprawidіowy plik SPEECH2.VDF");
				SendPlayerMessage(playerid, 255, 0, 0, "Zgіoњ siк na forum po poprawny ;)");
				_Kick(playerid);
			end
		elseif pathFile == "DATA\\SPEECH_ADDON.VDF" then
			if hash ~= "66b5884c185f21baa9c8d301695622bd" then
				SendPlayerMessage(playerid, 255, 0, 0, "Posiadasz nieprawidіowy plik SPEECH_ADDON.VDF");
				SendPlayerMessage(playerid, 255, 0, 0, "Zgіoњ siк na forum po poprawny ;)");
				_Kick(playerid);
			end
		elseif pathFile == "DATA\\TEXTURES.VDF" then
			if hash ~= "571c2052854449929dd2f5bf912d45a3" then
				SendPlayerMessage(playerid, 255, 0, 0, "Posiadasz nieprawidіowy plik TEXTURES.VDF");
				SendPlayerMessage(playerid, 255, 0, 0, "Zgіoњ siк na forum po poprawny ;)");
				_Kick(playerid);
			end
		elseif pathFile == "DATA\\TEXTURES_ADDON.VDF" then
			if hash ~= "198098d33bd048d069590f72d677aba7" then
				SendPlayerMessage(playerid, 255, 0, 0, "Posiadasz nieprawidіowy plik TEXTURES_ADDON.VDF");
				SendPlayerMessage(playerid, 255, 0, 0, "Zgіoњ siк na forum po poprawny ;)");
				_Kick(playerid);
			end
		elseif pathFile == "DATA\\WORLDS.VDF" then
			if hash ~= "45c7e412604304664314b7a0fd139e4f" then
				SendPlayerMessage(playerid, 255, 0, 0, "Posiadasz nieprawidіowy plik WORLDS.VDF");
				SendPlayerMessage(playerid, 255, 0, 0, "Zgіoњ siк na forum po poprawny ;)");
				_Kick(playerid);
			end
		elseif pathFile == "DATA\\WORLDS_ADDON.VDF" then
			if hash ~= "b70b2bd0ffe55d1d07ee79c980a3444a" then
				SendPlayerMessage(playerid, 255, 0, 0, "Posiadasz nieprawidіowy plik WORLDS_ADDON.VDF");
				SendPlayerMessage(playerid, 255, 0, 0, "Zgіoњ siк na forum po poprawny ;)");
				_Kick(playerid);
			end]]
		end
	end
end

function OnPlayerChangeClass(playerid, classid)
	if IsNPC(playerid) == 0 then
		SpawnPlayer(playerid);
	end
end

function OnPlayerSelectClass(playerid, classid)
	if IsNPC(playerid) == 0 then
		SpawnPlayer(playerid);
	end
end

function OnPlayerChangeWorld(playerid, world)
	if IsNPC(playerid) == 0 then
		if world ~= "MMO.ZEN" then
			SendPlayerMessage(playerid, 255, 255, 0, "Запрещена смена карты. До свидания!");
			makeBanWithReason(playerid, "Map Change", "Anty-World-Change");
			LogString("Logs_ChangeWorld",GetPlayerName(playerid).." "..world);
		else
			if not(checkBan(playerid)) then
				FreezePlayer(playerid, 1);
				SetPlayerPos(playerid, 0, 200,0);
				SetPlayerAngle(playerid, 181);
			end
		end
	end
end

function OnPlayerEnterWorld(playerid, world)
	if IsNPC(playerid) == 0 then
		if world == "MMO.ZEN" then
			FreezePlayer(playerid, 1);
			SetPlayerPos(playerid, 0, 200,0);
			SetPlayerAngle(playerid, 181);
		end
	end
end

function OnPlayerSpawn(playerid, classid)
	if IsNPC(playerid) == 0 then
		if GetPlayerLoggedIn(playerid) == true then
			Read_Statistic_and_Item(playerid);
		end
	end
end

function OnPlayerDisconnect(playerid, reason)
	if reason == 0 then
		--print("REASON 0");
		if getBanP or getKickP then
			MySQL_Save(playerid);
		end
		
		PartyExit(playerid);
		DestroyAllDraws(playerid);
		DestroyAllPlayerDraws(playerid);
		
		if GetPlayerPVP(playerid) == true then
			BreakPVP(playerid);
		end
		
		if getBanP or getKickP then
			DestroyTrade(playerid);
			DestroyGoldTrade(playerid);
		end
		
		SendMessageToAll(255, 0, 0, GetPlayerName(playerid).." отключился от сервера.");
		
	elseif reason == 1 then
		--print("REASON 1");
		MySQL_Save(playerid);
		PartyExit(playerid);
		DestroyAllDraws(playerid);
		DestroyAllPlayerDraws(playerid);
		
		if GetPlayerPVP(playerid) == true then
			BreakPVP(playerid);
		end
		
		DestroyTrade(playerid);
		DestroyGoldTrade(playerid);
		
		SendMessageToAll(255, 0, 0, GetPlayerName(playerid).." потерял соединение.");
	
	elseif reason == 2 then
		--print("REASON 2");
		MySQL_Save(playerid);
		PartyExit(playerid);
		DestroyAllDraws(playerid);
		DestroyAllPlayerDraws(playerid);
		
		if GetPlayerPVP(playerid) == true then
			BreakPVP(playerid);
		end
		
		DestroyTrade(playerid);
		DestroyGoldTrade(playerid);
		
		SendMessageToAll(255, 0, 0, GetPlayerName(playerid).." отключился от сервера.");
	
	elseif reason == 3 then
		--print("REASON 3");
		MySQL_Save(playerid);
		PartyExit(playerid);
		DestroyAllDraws(playerid);
		DestroyAllPlayerDraws(playerid);
		
		if GetPlayerPVP(playerid) == true then
			BreakPVP(playerid);
		end
		
		DestroyTrade(playerid);
		DestroyGoldTrade(playerid);
		
		SendMessageToAll(255, 0, 0, GetPlayerName(playerid).." отключился от сервера.");
	end
	
	--restart_ac(playerid); --czeba restartowaж AC xD
	restartGold(playerid);
	restarTrade(playerid);
	DestroyGoldTrade(playerid);
	DestroyTrade(playerid);
	--delOnlineRunner(playerid);
	MySQL_MakeOffline(playerid);
end

function OnPlayerCommandText(playerid, cmdtext)
	local cmd, params = GetCommand(cmdtext);
	
	if cmd == "/лог" or cmd == "/log" then
		MySQL_Login(playerid, params);
	end
	
	if cmd == "/свобода" or cmd == "/freedom" then
		Svoboda(playerid);
	end

	if cmd == "/гвыход" or cmd == "/gexit" then
		PartyExit(playerid);
	end
	if cmd == "/гкик" or cmd == "/gkick" then
		PartyKick(playerid, params);
	end
	
	if cmd == "/бан" or cmd == "/ban" then
		CMD_Ban(playerid,params);
	end
	
	if cmd == "/банакк" or cmd == "/banacc" then
		CMD_BanAcc(playerid,params);
	end
	
	if cmd == "/адм" or cmd == "/adm" then
		local admm = Player[playerid].admin
		SendPlayerMessage(playerid,0,255,255,string.format("%s %s","ADM:",admm));
	end
	
	if cmd == "/выход" or cmd == "/q" then
		if GetPlayerLoggedIn(playerid) == false then
			ExitGame(playerid);
		end
	end
	
	if cmd == "/гвход" or cmd == "/gjoin" then
		if Player[playerid].Timer_Party ~= -1 then
			if Player[playerid].Party ~= -1 then
				ClearGametext(playerid, Player[playerid].Party);
				KillTimer(Player[playerid].Timer_Party);
				PartyJoin(playerid, Player[playerid].Party);
				ClearParty(playerid);
			end
		end
		end
	if cmd == "/готкл" or cmd == "/greject" then
		if Player[playerid].Party ~= -1 then
			InviteToPartyOff(playerid);
		end
		end
	if cmd == "/пвп" or cmd == "/pvp" then
		SendPlayerMessage(playerid, 255, 255, 0, "Данная команда временно отключена");
	--[[
		if Player[playerid].Timer_PVP ~= -1 then
			if Player[playerid].PVP ~= -1 then
				ClearGametext(playerid, Player[playerid].PVP);
				KillTimer(Player[playerid].Timer_PVP);
				StartPVP( playerid, Player[playerid].PVP );
				Player[playerid].StandUp = false;
				Player[Player[playerid].PVP].StandUp = false;
				ClearPVP(playerid);
			end
			
		end
	]]
	end
	if cmd == "/пвпоткл" or cmd == "/pvpreject" then
		if Player[playerid].PVP ~= -1 then
			InviteToPVPOff(playerid);
		end
		end
	if cmd == "/копать" or cmd == "/kop" then
		Kop(playerid);
		end
	if cmd == "/гчатофф" or cmd == "/gchatoff" then
		WylaczCzatGlobalny(playerid);
		end
	if cmd == "/чатофф" or cmd == "/chatoff" then
		WylaczCzat(playerid);
		end
	if cmd == "/г" or cmd == "/g" then
		GlobalChat(playerid, params);
		end
	if cmd == "/продать" or cmd == "/h" then
		StartPlayersTade(playerid, GetFocus(playerid), params);
		end
	if cmd == "/гпродать" or cmd == "/gh" then
		GoldTrade(playerid, GetFocus(playerid), params);
		end
	if cmd == "/гсогл" or cmd == "/gaccept" then
		AcceptGoldTrade(playerid);
		end
	if cmd == "/золота" or cmd == "/goldhave" then
		if IsPlayerAdmin(playerid) == 1 then
			SendPlayerMessage(playerid, 255, 0, 0, GetPlayerName(GetFocus(playerid)).." имеет: "..GetPlayerGold(GetFocus(playerid)).." золота.");
		end
		end
	if cmd == "/согл" or cmd == "/agree" then
		TradeAccept(playerid);
		end
	if cmd == "/мут" or cmd == "/mute" then
		Mute(playerid, params);
		end
	if cmd == "/унмут" or cmd == "/unmute" then
		UnMute(playerid, params);
	--elseif cmd == "/postime" then
		ChangeTimeCheck(params, playerid);
		end
	if cmd == "/чектайм" then
		ShowTimeCheck(playerid);
		end
	if cmd == "/рестарт" or cmd == "/restart" then
		if Player[playerid].adm == 5 then
			if Start_Restart == false then
				for i = 0, GetMaxPlayers() - 1 do
					if IsPlayerConnected(i) == 1 then
						ShowDraw(i, Restart_Draw);
					end
				end
				Start_Restart = true;
			end
		end
		end
	if cmd == "/п" or cmd == "/p" then
		ChatGroup(playerid, params);
		end
	if cmd == "/тпп" or cmd == "/tpp" then
		if IsPlayerVIP(playerid) == 1 then
			TeleportujVipa(playerid, params);
		else
			SendPlayerMessage(playerid, 255, 0, 0, "Игрок не является VIPом!");
		end
		end
	if cmd == "/атп" or cmd == "/atp" then
		if Player[playerid].kto ~= nil then
			local x,y,z = GetPlayerPos(playerid);
			SetPlayerPos(Player[playerid].kto, x, y,z);
			SendPlayerMessage(playerid, 0, 255, 0, "Телепортация удачна!");
			SendPlayerMessage(Player[playerid].kto, 0, 255, 0, "Телепортация удачна!");
			Player[Player[playerid].kto].prosba = false;
			Player[playerid].kto = nil;
		end
		end
	if cmd == "/отп" or cmd == "/otp" then
		if Player[playerid].kto ~= nil then
			SendPlayerMessage(playerid, 0, 255, 0, "Вы отклонили предложение телепорта от игрока "..GetPlayerName(Player[playerid].kto));
			SendPlayerMessage(Player[playerid].kto, 255, 0, 0, "Твоя просьба о телепортации к игроку "..GetPlayerName(playerid).." была отклонена!");
			Player[Player[playerid].kto].prosba = false;
			Player[playerid].kto = nil;
		end
		end
	--ADMIN
	
	
		if cmd == "/апомощь" or cmd == "/ahelp" then
		CMD_AdminHelp(playerid);
	elseif cmd == "/кик" or cmd == "/kick" then
		CMD_Kick(playerid,params);
end
if cmd == "/килл" or cmd == "/kill" then
		CMD_Kill(playerid,params);
end
if cmd == "/тп" or cmd == "/tp" then
		CMD_Teleport(playerid,params);
end
if cmd == "/give" then
		CMD_GiveItem(playerid,params);
end	
if cmd == "/givegold" then
		CMD_GiveGold(playerid, params);
end	
if cmd == "/тайм" or cmd == "/time" then
		CMD_Time(playerid,params);
end
if cmd == "/серв" or cmd == "/serv" then
		ServMSG(playerid, params);
end				
if cmd == "/тпалл" or cmd == "/tpall" then
CMD_TPAll(playerid, params);
end		
if cmd == "/размер" or cmd == "/scale" then	
		CMD_Scale(playerid, params);
end	
if cmd == "/ник" or cmd == "/name" then
		CMD_Name(playerid,params);
end	
if cmd == "/цвет" or cmd ==  "/color" then
		CMD_Color(playerid,params);
end
if cmd == "/sertes22" then
		SendPlayerMessage(playerid, 255, 0, 0, "Жопа!");
		local result, dds = sscanf(params, "d");
		local dds = 2;
		if result == 1 then
			SendPlayerMessage(playerid, 255, 0, 0, "rrrs");
			SetCameraBehindPlayer(playerid,dds);
		end
		end
if cmd == "/sertes33" then
		SendPlayerMessage(playerid, 255, 0, 0, "Кусок говна!");
		SetDefaultCamera(playerid);
		end
if cmd == "/sertes44" then
		local dup = GetFocus(playerid);
		if dup ~= -1 then
		SetCameraBehindPlayer(playerid,dup);
		end
		end
if cmd == "/reloadbans" or cmd == "/релоадбан" then
		reloadBans(playerid); -- przeіadowanie banlisty(w sensie tablicy przechowuj№cej bany)
		end
if cmd == "/aww" or cmd ==  "/авв" then
		DestroyTrade(playerid);
		DestroyGoldTrade(playerid);
		ExitGame(playerid);
	end
end

function Svoboda(playerid)
FreezePlayer(playerid, 0);
SendPlayerMessage(playerid,0,255,0, "Вы разморожены");
end

function OnPlayerHit(playerid, killerid)
	CheckPlayerArmorLvl(playerid, GetEquippedArmor(playerid));
	CheckPlayerArmorLvl(killerid, GetEquippedArmor(killerid));
	
	if IsNPC(killerid) ~= 1 then
		CitySafeZone(killerid, 3);
	end
	
	if playerid ~= killerid then
		SafeZoneControl(playerid, killerid);
	end
	
	--[[if IsNPC(playerid) == 0 then
		if Player[playerid].FirstHit then
			Player[playerid].HPs = GetPlayerHealth(playerid);
			Player[playerid].FirstHit = false;
		else
			if GetPlayerHealth(playerid) == Player[playerid].HPs then
				SendPlayerMessage(playerid, 255, 0, 0, "Wypierdalaj cziterze.");
				Ban(playerid);
				Kick(playerid);
				SendMessageToAll(255,0,0, GetPlayerName(playerid).." to cziter i dostaі bana ;)");
				LogString("Logs_Cziterzy", GetPlayerName(playerid).." "..GetPlayerName(killerid));
			else
				Player[playerid].HPs = GetPlayerHealth(playerid);
			end
		end]]
	--end
end

function WylaczCzatGlobalny(playerid)
	if IsNPC(playerid) == 0 then
		if GetPlayerLoggedIn(playerid) == true then
			if Player[playerid].gchat == true then
				Player[playerid].gchat = false;
				for i = 0,25 do
					SendPlayerMessage(playerid,255,255,255,"");
				end
				SendPlayerMessage(playerid,0,255,0, "Глобальный чат отключен!");
			else
				Player[playerid].gchat = true;
				SendPlayerMessage(playerid,0,255,0, "Глобальный чат включен!");
			end
		end
	end
end

function WylaczCzat(playerid)
	if IsNPC(playerid) == 0 then
		if GetPlayerLoggedIn(playerid) ==  true then
			if Player[playerid].chat == true then
				Player[playerid].chat = false;
				for i = 0,25 do
					SendPlayerMessage(playerid,255,255,255,"");
				end
				SendPlayerMessage(playerid,0,255,0, "Чат отключен!");
			else
				Player[playerid].chat = true;
				SendPlayerMessage(playerid,0, 255,0, "Чат включен!");
			end
		end
	end
end

function TeleportujVipa(playerid, params)
	if IsNPC(playerid) == 0 then
		local result, id = sscanf(params, "d");
		if result == 1 then
			if IsNPC(id) == 0 then
				SendPlayerMessage(id, 0, 255, 0, GetPlayerName(playerid).." просит телепортироваться к Вам.");
				SendPlayerMessage(id, 0, 255, 0, "Пиши /атп, для подтверждения телепорта, либо /отп для отклонения просьбы.");
				Player[playerid].prosba = true; --wysіaі prosbe
				Player[id].kto = playerid;
				SendPlayerMessage(playerid, 0, 255, 0, "Просьба подтверждена!");
			end
		end
	end
end

function OnPlayerDeath(playerid, p_classid, killerid, k_classid)
	if IsNPC(playerid) == 0 then
		if GetPlayerWorld(playerid) ~= "MMO.ZEN" then
			_Kick(playerid);
		end
	end
	
	if IsNPC(playerid) == 0 then
		CheckAllValue(playerid); --antyczit
	end
	
	if killerid ~= -1 then
		GivePlayerExp(killerid, playerid);
	end
	
	if IsNPC(playerid) ~= 1 then
		if Player[playerid].StandUp == true then
			Player[playerid].StandUp = false;
		end
	end
	
	PlayerDead(playerid, killerid);
	PlayerHit(playerid, killerid);

	if IsNPC(playerid) == 0 then
		if GetPlayerLoggedIn(playerid) == true then
			PlayerDeath_Set_Statistic(playerid);
		end
	end
end

function OnPlayerUnconscious(playerid, p_classid, killerid, k_classid)
	if IsNPC(playerid) ~= 1 then 
		PlayerUnconscious(playerid, killerid);
		if Player[playerid].StandUp == true then
			HitPlayer(killerid, killerid);
			SetPlayerHealth(killerid, 0);
		end
		
		UnequipMeleeWeapon(playerid);
		UnequipRangedWeapon(playerid);
	else
		GivePlayerExp(killerid, playerid);
		SetPlayerHealth(playerid, 0);
	end
	
	if IsNPC(killerid) == 1 then
		SetPlayerHealth(playerid, 0);
	end
end

function SetHPs(playerid)
	Player[playerid].FirstHit = true;
end

function OnPlayerStandUp(playerid)
	if IsNPC(playerid) ~= 1 then
		Player[playerid].StandUp = true;
	end
end

function OnPlayerWeaponMode(playerid, weaponmode)
	CitySafeZone(playerid, weaponmode);
	
	if IsNPC(playerid) ~= 1 then
		Player[playerid].StandUp = false;
	end
end

function OnPlayerResponseItem(playerid, slot, item_instance, amount, equipped)
	Trade_Response(playerid, slot, item_instance, amount, equipped);
end

function OnPlayerFocus(playerid, focusid)
	if focusid ~= -1 then
		if IsNPC(focusid) == 1 and IsMonster(focusid) == false then
			ShowNPCFocus(playerid);
			HideDraw(playerid, Lvl_Draw);
			
			if Player[playerid].Focus ~= -1 then
				HidePlayerInfo(playerid, Player[playerid].Focus);
			end
		elseif IsNPC(focusid) == 1 and IsMonster(focusid) == true then
			HideNPCFocus(playerid);
			HideDraw(playerid, Lvl_Draw);
			
			if Player[playerid].Focus ~= -1 then
				HidePlayerInfo(playerid, Player[playerid].Focus);
			end
		elseif IsNPC(focusid) ~= 1 then
			HideNPCFocus(playerid);
			ShowDraw(playerid, Lvl_Draw);
			if Player[playerid].Focus ~= focusid then
				if Player[playerid].Focus ~= -1 then
					HidePlayerInfo(playerid, Player[playerid].Focus);
				end
			end
			
			ShowPlayerInfo(playerid, focusid);
			
			Player[playerid].Focus = focusid;
		end
	else
		if Player[playerid].Focus ~= -1 then
			HidePlayerInfo(playerid, Player[playerid].Focus);
		end
		
		HideDraw(playerid, Lvl_Draw);
		HideNPCFocus(playerid);
		Player[playerid].Focus = -1;
	end
end

function OnPlayerKey(playerid, keyDown, keyUp)
	if GetPlayerWorld(playerid) ~= "MMO.ZEN" then
		_Kick(playerid);
	end
	
	if GetPlayerLoggedIn(playerid) == true then
		if GetPlayerDialog(playerid) == false then
			if Player[playerid].Talking == false then
				if keyDown == KEY_F7 then
					if Player[playerid].Menu == -1 then
						ShowMenu(playerid, Menu_Game);
						Player[playerid].Menu = 0;
						FreezePlayer(playerid, 1);
						Player[playerid].Talking = true;
					end
				elseif keyDown == KEY_LSHIFT then
					if GetFocus(playerid) ~= -1 and Player[playerid].MenuPlayer == false then
						if IsNPC(GetFocus(playerid)) ~= 1 then
							ShowMenu(playerid, Menu_Player);
							Player[playerid].MenuPlayer = true;
							FreezePlayer(playerid, 1);
							Player[playerid].Talking = true;
						end
					end
					
					--[[if GetPlayerWorld(playerid) ~= "MMO.ZEN" then
						SendPlayerMessage(playerid, 255, 0, 0, "Poczekaj na zmiane mapy ;)");
						_Kick(playerid);
					end]]
				--[[elseif keyDown == KEY_RSHIFT then
					if GetPlayerWorld(playerid) ~= "MMO.ZEN" then
						SendPlayerMessage(playerid, 255, 0, 0, "Poczekaj na zmiane mapy ;)");
						_Kick(playerid);
					end]]
				elseif keyDown == KEY_LCONTROL then
					if GetFocus(playerid) ~= -1 and Player[playerid].MenuPlayer == false and IsNPC(GetFocus(playerid)) == 1 then
						if IsMonster(GetFocus(playerid)) == false then
							DestroyGoldTrade(playerid);
							DestroyTrade(playerid);
						
							ShowMenuNPC(playerid);
							HideNPCFocus(playerid);
							FreezePlayer(playerid, 1);
							Player[playerid].Talking = true;
							Player[playerid].NPC = true;
						end
					end
				elseif keyDown == KEY_M then
					--ShowMap(playerid);
					--Player[playerid].Talking = true;
				end
			else
				if keyDown == KEY_RETURN then
	

					if Player[playerid].NPC == true then
						StartDialog(playerid);
						if GetPlayerOptionsNPC(playerid) == GetMaxOptionsNPC(playerid) then
							EndNPC(playerid);
						end
					elseif Player[playerid].Pray == true then
						if GetPlayerActiveMenu(playerid, Menu_Pray) == 0 then
							if GetPlayerGold(playerid) >= (GetMaxHealth(playerid)-GetPlayerHealth(playerid))*0.80 then
								RemoveItem(playerid, "ITMI_GOLD", (GetMaxHealth(playerid)-GetPlayerHealth(playerid))*0.80);
								DestroyItemPlayer(playerid, "ITMI_GOLD", (GetMaxHealth(playerid)-GetPlayerHealth(playerid))*0.80);
								CompleteHeal(playerid);
								GameTextForPlayer(playerid, 2800, 3500, "Ваши раны были исцелены!","Font_Old_20_White_Hi.TGA", 0, 255, 0, 1000);
							else
								GameTextForPlayer(playerid, 3200, 3500, "Недостаточно золота.","Font_Old_20_White_Hi.TGA", 255, 255, 255, 500);
							end
						end
					elseif Player[playerid].Menu == 0 then
						if GetPlayerActiveMenu(playerid, Menu_Game) == 0 then
							HideMenu(playerid, Menu_Game);
							ShowMenu(playerid, Menu_Wyglad);
							
							PlayAnimation(playerid, "S_BENCH_S1");
							
							Player[playerid].Menu = 1;
						elseif GetPlayerActiveMenu(playerid, Menu_Game) == 1 then
							HideMenu(playerid, Menu_Game);
							ShowPomoc(playerid);
							
							Player[playerid].Menu = 2;
						elseif GetPlayerActiveMenu(playerid, Menu_Game) == 2 then
							HideMenu(playerid, Menu_Game);
							ShowStats(playerid);
							
							Player[playerid].Menu = 3;
						elseif GetPlayerActiveMenu(playerid, Menu_Game) == 3 then
							if GetPlayerHunt(playerid) == 1 then
								HideMenu(playerid, Menu_Game);
								ShowHunt(playerid);
								
								Player[playerid].Menu = 4;
							else
								HideMenu(playerid, Menu_Game);
								Player[playerid].Menu = -1;
								FreezePlayer(playerid, 0);
								Player[playerid].Talking = false;
								
								GameTextForPlayer(playerid, 2800, 3500, "У вас нет заданий","Font_Old_20_White_Hi.TGA", 255, 0, 0, 1500);
							end
						elseif GetPlayerActiveMenu(playerid, Menu_Game) == GetMenuMaxOptions(Menu_Game) then
							
							HideMenu(playerid, Menu_Game);
							
							if checkMySQLConnection() == true then
							
								MySQL_Save(playerid);
								ResetPlayerLoggedIn(playerid);
								Player[playerid].Exiting = true;
								GameTextForPlayer(playerid, 2800, 3500, "Выход из игры будет произведен через 5 сек..","Font_Old_20_White_Hi.TGA", 255, 0, 0, 5000);
								DestroyTrade(playerid);
								DestroyGoldTrade(playerid);
								SetTimerEx("ExitGame_Player", 5000, 0, playerid);
								
							else
								
								SendPlayerMessage(playerid, 0, 255, 0, "Потеряно соединение с MySQL. Попробуйте снова...");
								SendPlayerMessage(playerid, 0, 255, 0, "Попробуйте выйти в течении нескольки секунд.");
								reconnectMySQL();
								
							end
						
						end
						
					-- END Menu Game
						
					elseif Player[playerid].Menu == 1 then
						
						if GetPlayerActiveMenu(playerid, Menu_Wyglad) == GetMenuMaxOptions(Menu_Wyglad) then
						
							HideMenu(playerid, Menu_Wyglad);
							ShowMenu(playerid, Menu_Game);
							
							Player[playerid].Menu = 0;
						
						end
						
					elseif Player[playerid].Menu == 2 then
					
						ShowMenu(playerid, Menu_Game);
						HidePomoc(playerid);
						Player[playerid].Menu = 0;
						
					elseif Player[playerid].Menu == 3 then
					
						ShowMenu(playerid, Menu_Game);
						HideStats(playerid);
						Player[playerid].Menu = 0;
						
					elseif Player[playerid].Menu == 4 then
					
						ShowMenu(playerid, Menu_Game);
						HideHunt(playerid);
						Player[playerid].Menu = 0;
						
					elseif Player[playerid].MenuPlayer == true then
					
						if GetPlayerActiveMenu(playerid, Menu_Player) == 0 then
						
							if GetPlayerPVP( playerid ) == false then
							
								HidePlayerMenu(playerid);
							
								if GetFocus(playerid) ~= -1 then
								
									if GetPlayerPVP( GetFocus(playerid) ) == false then
									
										if Player[GetFocus(playerid)].PVP == -1 then
										
											SendPlayerInviteToPVP(playerid, GetFocus(playerid));
											
										else
											
											GameTextForPlayer(playerid, 2100, 3500, "Этому игроку уже бросили вызов!","Font_Old_20_White_Hi.TGA", 255, 0, 0, 1500);
											
										end
										
									else 
										
										GameTextForPlayer(playerid, 2100, 3500, "Игрок уже с кем-то в схватке!","Font_Old_20_White_Hi.TGA", 255, 0, 0, 1500);
									
									end
									
								else
									
									GameTextForPlayer(playerid, 2100, 3500, "Вы не зафиксировали взгляд!","Font_Old_20_White_Hi.TGA", 255, 0, 0, 1500);
									
								end
								
							else
								
								HidePlayerMenu(playerid);
								GameTextForPlayer(playerid, 2100, 3500, "Вы уже на поединке!","Font_Old_20_White_Hi.TGA", 255, 0, 0, 1500);
								
							end
					
						elseif GetPlayerActiveMenu(playerid, Menu_Player) == 1 then
						
							if GetPlayerParty(GetFocus(playerid)) == false then
								
								HidePlayerMenu(playerid);
								
								if Player[GetFocus(playerid)].Party == -1 then
									
									SendPlayerInviteToParty(playerid, GetFocus(playerid));
									
								else
									
									GameTextForPlayer(playerid, 1900, 3500, "Этот игрок приглашен в другую группу.","Font_Old_20_White_Hi.TGA", 255, 0, 0, 1500);
									
								end
								
							elseif GetPlayerParty(GetFocus(playerid)) == true then
												
								GameTextForPlayer(playerid, 2100, 3500, "Этот игрок уже находится в группе.","Font_Old_20_White_Hi.TGA", 255, 0, 0, 1500);
							
							end
					
						elseif GetPlayerActiveMenu(playerid, Menu_Player) == GetMenuMaxOptions(Menu_Player) then
							
							HidePlayerMenu(playerid);
						
						end
						
					end
					
				elseif keyDown == KEY_F7 then	
					
					if Player[playerid].Menu == 0 then
					
						HideMenu(playerid, Menu_Game);
						Player[playerid].Menu = -1;
						FreezePlayer(playerid, 0);
						Player[playerid].Talking = false;
					
					end
					
				elseif keyDown == KEY_UP then
				
					if Player[playerid].NPC == true then
					
						SwitchUpMenuNPC(playerid);
				
					elseif Player[playerid].Menu == 0 then
					
						SwitchUpMenu(playerid, Menu_Game);
						
					elseif Player[playerid].Menu == 1 then
					
						SwitchUpMenu(playerid, Menu_Wyglad);
						Player[playerid].Submenu = 0;
						
					elseif Player[playerid].MenuPlayer == true then
					
						SwitchUpMenu(playerid, Menu_Player);
					
					end
				
				elseif keyDown == KEY_DOWN then
				
					if Player[playerid].NPC == true then
					
						SwitchDownMenuNPC(playerid);
				
					elseif Player[playerid].Menu == 0 then
					
						SwitchDownMenu(playerid, Menu_Game);
						
					elseif Player[playerid].Menu == 1 then
					
						SwitchDownMenu(playerid, Menu_Wyglad);
						Player[playerid].Submenu = 0;
						
					elseif Player[playerid].MenuPlayer == true then
					
						SwitchDownMenu(playerid, Menu_Player);
					
					end
					
				elseif keyDown == KEY_LEFT then
				
					if Player[playerid].Menu == 1 then
					
						SwitchLeftAnim(playerid);
					
					end
				
				elseif keyDown == KEY_RIGHT then
				
					if Player[playerid].Menu == 1 then
					
						SwitchRightAnim(playerid);
					
					end
					
				elseif keyDown == KEY_M then
					
					--HideMap(playerid);
					--Player[playerid].Talking = false;
					
				end
			
			end
			
		else
		
			if keyDown == KEY_SPACE then
			
				ScrollDialog(playerid);
			
			end
			
		end
	
	end
end

		
function UseKey(playerid)	
									
	SetPlayerEnable_OnPlayerKey(playerid,1);
	
end
		
function OnPlayerHasItem(playerid, item_instance, amount, equipped, checkid)

    if checkid == 0 then
			
		--[[if item_instance ~= "NULL" then
		
		local sprawdz = FindItem(playerid, item_instance);
		
			if not(sprawdz) then
					SendPlayerMessage(playerid, 255, 0, 0, "Wypieprzaj oszuњcie!");
					Ban(playerid, 1);
					SendMessageToAll(255, 0, 0, GetPlayerName(playerid).." prуbowaі handlowaж przywoіanym przez czit przedmiotem.");
					SendMessageToAll(255, 0, 0, "I zostaі chuj pomyњlnie zbanowany!");
					LogString("cziterzy", GetPlayerName(playerid).." chciaі sprzedac przedmiot ktуrego nie ma w EQ...");
					return;
		end]]
		
		Player[playerid].Counter = Player[playerid].Counter + 1;
		
		if GetBuyItemDrop( item_instance ) == true then
		
			Player[playerid].CheckItem = true;
		
		end
		
	

				
		if CheckItem( playerid ) == true and BuyItem() == Player[playerid].Counter then
			
			DialogNieznajomySkup(playerid);
			RemoveBuyItemDrop( playerid );
			SetCheckItem( playerid, 0 );
			Player[playerid].Counter = 0;
			
				
		elseif Normal_BuyItem() == Player[playerid].Counter then
			
			Player[playerid].Counter = 0;
			DialogNieznajomyOdrzut(playerid);
			
		end	
		
	elseif checkid == 2 then
		
		Player[playerid].Counter = Player[playerid].Counter + 1;
		
		if GetBuyItemDrop_Normal( item_instance ) == true then
			
			Player[playerid].CheckItem = true;
		
		end
		
		if CheckItem( playerid ) == true and Normal_BuyItem() == Player[playerid].Counter then
			
			DialogBlythSkup(playerid);
			RemoveBuyItemDrop_Normal( playerid );
			SetCheckItem( playerid, 0 );
			Player[playerid].Counter = 0;
				
		elseif Normal_BuyItem() == Player[playerid].Counter then
			
			Player[playerid].Counter = 0;
			DialogBlythOdrzut(playerid);
			
		end	
		
	elseif checkid == 1 then --blyth
		local sprawdz = FindItem(playerid, item_instance);
		
			if not(sprawdz) then
					return;
			else
				if GetItemAmountPlayer(playerid, sprawdz) == amount then
		--for i = 0, 5 do
			RemoveItem(playerid, item_instance, amount);
		--end
		DestroyItemPlayer(playerid, item_instance, amount);
		
		if GetBuyItemDropCost_Normal(item_instance, amount ) ~= 0 then
			
			GiveItem(playerid, "ITMI_GOLD", GetBuyItemDropCost_Normal(item_instance, amount ));
			
		end
		
		else
			return
		end
		end
		
	elseif checkid == 3 then
			local sprawdz = FindItem(playerid, item_instance);
		
			if not(sprawdz) then
					return;
			else
				if GetItemAmountPlayer(playerid, sprawdz) == amount then
	
		RemoveItem(playerid, item_instance, amount);
		DestroyItemPlayer(playerid, item_instance, amount);
		
		if GetBuyItemDropCost(item_instance, amount ) ~= 0 then
			
			--SetPlayerGold(playerid, GetPlayerGold(playerid) + GetBuyItemDropCost(item_instance, amount ));
			GiveItem(playerid, "ITMI_GOLD", GetBuyItemDropCost(item_instance, amount ));
			
		end
		else
			return
		end
		end
	
	elseif checkid == 4 then
	
		if item_instance == "NULL" then
		
			DialogFredOddaj(playerid);
		
		else
			
			if amount >= 5 then
			
				DialogFredSkup(playerid);
				RemoveItem(playerid, item_instance, amount);
				DestroyItemPlayer(playerid, item_instance, amount);
				GiveItem(playerid, "ITMI_GOLD", math.ceil(amount/2));
				
			else
				
				DialogFredOddaj(playerid);
				
			end
			
		end
		
	elseif checkid == 5 then

		if item_instance == "NULL" then
		
			DialogFarimOdrzut(playerid);
		
		else
			
			if amount >= 5 then
			
				DialogFarimSkup(playerid);
				RemoveItem(playerid, item_instance, amount);
				DestroyItemPlayer(playerid, item_instance, amount);
				GiveItem(playerid, "ITMI_GOLD", math.ceil(amount*1000));
				
			else
			
				DialogFarimOdrzut(playerid);
			
			end
			
		end
		
	elseif checkid == 6 then
	
		Player[playerid].Counter = Player[playerid].Counter + 1;
		
		if GetBuyItemDrop_Random( item_instance ) == true then
		
			if equipped == 0 then
			
				Player[playerid].CheckItem = true;
				
			end
		
		end
		
		if CheckItem( playerid ) == true and Random_BuyItem() == Player[playerid].Counter then
			
			DialogReginSkup(playerid);
			RemoveBuyItemDrop_Random( playerid );
			SetCheckItem( playerid, 0 );
			Player[playerid].Counter = 0;
				
		elseif Random_BuyItem() == Player[playerid].Counter then
			
			Player[playerid].Counter = 0;
			DialogReginOdrzut(playerid);
			
		end	
	
	elseif checkid == 7 then --Regin
		
		if equipped == 0 then
					local sprawdz = FindItem(playerid, item_instance);
		
			if not(sprawdz) then
					return;
			else
				if GetItemAmountPlayer(playerid, sprawdz) == amount then
			
			DestroyItemPlayer(playerid, item_instance, amount);
			--for i = 0, 5 do
				RemoveItem(playerid, item_instance, amount);
			--end
			
			if GetBuyItemDropCost_Random(item_instance, amount ) ~= 0 then
				
				--SetPlayerGold(playerid, GetPlayerGold(playerid) + GetBuyItemDropCost_Random(item_instance, amount ));
				GiveItem(playerid, "ITMI_GOLD", GetBuyItemDropCost_Random(item_instance, amount ));
				
			end
			else
				return
			end
			end
		
		--end
	 end
    end
end

function OnPlayerTakeItem(playerid, itemID, itemInstance, amount, x, y, z, worldName)
	OnPlayerTakeHerb(playerid, itemID, itemInstance, x, y, z, worldName);
	
	if itemID == ITEM_GIFT or itemID >= 0 then
		if GetRead(playerid) == false then
			AddItemToPlayer(playerid, itemInstance, amount, 0);
		end
	else
		--[[for i = 0, 20 do
			SendPlayerMessage(playerid, 255, 0, 0, "Nie moїna podnosiж przedmiotуw z ziemi, ani braж ich ze skrzyс!");
		end]]
		--LogString("Logs_TakeItem", GetPlayerName(playerid));
		--Ban(playerid);
		--makeBanWithReason(playerid, "Podnoszenie niezsynchronizowanych przedmiotуw", "Anty-Item-Take");
		--Kick(playerid);
		if string.upper(itemInstance) ~= "ITMI_GOLD" then
			SendPlayerMessage(playerid, 255, 0, 0, "Этот предмет не синхронизирован ;)");
			SendPlayerMessage(playerid, 255, 0, 0, "Если каким-то чудом вам удалось одеть предмет - то не советую его продавать.");
		end
	end
end

function OnPlayerUseItem(playerid, itemInstance, amount, hand)
    if CheckFood( itemInstance ) == true then
		if (GetPlayerHealth(playerid) + GetFoodHealth( itemInstance )) <= GetMaxHealth(playerid) then
			SetPlayerHealth(playerid, GetPlayerHealth(playerid) + GetFoodHealth( itemInstance ));
			DestroyItemPlayerAmount(playerid, itemInstance, amount);
		else
			SetPlayerHealth(playerid, GetMaxHealth(playerid));
			DestroyItemPlayerAmount(playerid, itemInstance, amount);
		end
	end
end

function OnPlayerChangeArmor(playerid, currArmor, oldArmor)
	CheckPlayerArmorLvl(playerid, currArmor);
end

function OnPlayerChangeLevel(playerid, currLevel, oldLevel)
	MySQL_Save(playerid);
end

function K_OnPlayerChangeGold(playerid, currGold, oldGold)
	if GetHandel(playerid) == true then
		AddItemToPlayer(playerid, "ITMI_GOLD", currGold - oldGold, 0)
	end
end

function OnPlayerDropItem(playerid, itemid, item_instance, amount, x, y, z, worldName)
	--DestroyItemPlayer(playerid, item_instance, amount);
    DestroyItem(itemid);
	--[[if item_instance == "ITMI_GOLD" then
		SetPlayerGold(playerid, amount);
		return;
	else
		for i = 0, 7 do
			RemoveItem(playerid, item_instance, amount);
		end
		GiveItem(playerid, item_instance, amount);
	end]]
	if item_instance == "ITMI_GOLD" then
		SetPlayerGold(playerid, GetPlayerGold(playerid));
	else
		--GiveItem(playerid, item_instance, amount);
	end
end

function OnPlayerChangeHealth(playerid, currHealth, oldHealth)
    if GetPlayerParty(playerid) == true then
		UpdatePartyHealth(playerid, currHealth);
	end
end

function OnPlayerText(playerid, text)
	if GetPlayerLoggedIn(playerid) == true then
		for i = 0, GetMaxSlots() - 1 do
			if IsPlayerConnected(i) == 1 then
				if IsNPC(i) == 0 then
					if Player[i].chat == true then
						if GetPlayerWorld(playerid) == GetPlayerWorld(i) then
							if GetDistancePlayers(playerid,i) < 2500 then
								--SendPlayerMessage(i,230,230,230,string.format("%s %s %s",GetPlayerName(playerid),"сказал:",text));
								SendPlayerMessage(i,230,230,230, GetPlayerName(playerid).." (ID: "..playerid..")"..": "..text);
							end
						end
					end
				end
			end
		end
		LogString("Logs_Czat", ""..GetPlayerName(playerid)..": "..text.."");
	end
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------- Funkcje -----------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Menu Anim

function SwitchLeftAnim(playerid)

	if Player[playerid].Submenu > 0 then
		
		Player[playerid].Submenu = Player[playerid].Submenu - 1;
		
		if GetPlayerActiveMenu(playerid, Menu_Wyglad) == 0 then
		
			SetAdditionalVisual(playerid, 2, Player[playerid].Submenu);
		
		elseif GetPlayerActiveMenu(playerid, Menu_Wyglad) == 1 then
		
			SetAdditionalVisual(playerid, 4, Player[playerid].Submenu);
		
		elseif GetPlayerActiveMenu(playerid, Menu_Wyglad) == 2 then
		
			SetAdditionalVisual(playerid, 3, Player[playerid].Submenu);
			
		elseif GetPlayerActiveMenu(playerid, Menu_Wyglad) == 3 then
			
			SetAdditionalVisual(playerid, 1, "Hum_Body_Naked0");
		
		end

		SetPlayerAdditionalVisual(playerid, GetAdditionalVisual(playerid, 1), GetAdditionalVisual(playerid, 2), GetHeadID( GetAdditionalVisual(playerid, 3) + 1 ), GetAdditionalVisual(playerid, 4));
	
	end
	
end

function SwitchRightAnim(playerid)
	
	Player[playerid].Submenu = Player[playerid].Submenu + 1;
	
	if GetPlayerActiveMenu(playerid, Menu_Wyglad) == 0 then
	
		if Player[playerid].Submenu <= 12 then
	
			SetAdditionalVisual(playerid, 2, Player[playerid].Submenu);
			SetPlayerAdditionalVisual(playerid, GetAdditionalVisual(playerid, 1), GetAdditionalVisual(playerid, 2), GetHeadID( GetAdditionalVisual(playerid, 3) + 1 ), GetAdditionalVisual(playerid, 4));
			
		else 
			
			Player[playerid].Submenu = 12;
		
		end
	
	elseif GetPlayerActiveMenu(playerid, Menu_Wyglad) == 1 then
	
		if Player[playerid].Submenu <= 162 then
	
			SetAdditionalVisual(playerid, 4, Player[playerid].Submenu);
			SetPlayerAdditionalVisual(playerid, GetAdditionalVisual(playerid, 1), GetAdditionalVisual(playerid, 2), GetHeadID( GetAdditionalVisual(playerid, 3) + 1 ), GetAdditionalVisual(playerid, 4));
			
		else 
		
			Player[playerid].Submenu = 162;
		
		end
	
	elseif GetPlayerActiveMenu(playerid, Menu_Wyglad) == 2 then
		
		if Player[playerid].Submenu <= 6 then
			
			SetAdditionalVisual(playerid, 3, Player[playerid].Submenu);
			SetPlayerAdditionalVisual(playerid, GetAdditionalVisual(playerid, 1), GetAdditionalVisual(playerid, 2), GetHeadID( GetAdditionalVisual(playerid, 3) + 1 ), GetAdditionalVisual(playerid, 4));
			
		else 
		
			Player[playerid].Submenu = 6;
		
		end
		
	elseif GetPlayerActiveMenu(playerid, Menu_Wyglad) == 3 then
		
		SetAdditionalVisual(playerid, 1, "Hum_Body_Babe0");
		SetPlayerAdditionalVisual(playerid, GetAdditionalVisual(playerid, 1), GetAdditionalVisual(playerid, 2), GetHeadID( GetAdditionalVisual(playerid, 3) + 1 ), GetAdditionalVisual(playerid, 4));
	
	end
	
end

function ShowNPCFocus(playerid)

	ShowTexture(playerid, FocusNPC_Texture);
	ShowDraw(playerid, FocusNPC_Draw);

end

function HideNPCFocus(playerid)

	HideTexture(playerid, FocusNPC_Texture);
	HideDraw(playerid, FocusNPC_Draw);

end

function ShowPlayerInfo(playerid, focusid)
	
	ShowLvlDraw(playerid, focusid);
	ShowRankDraw(playerid, focusid);
	
end

function HidePlayerInfo(playerid, focusid)

	HideLvlDraw(playerid, focusid)
	HideRankDraw(playerid, focusid);

end

function HidePlayerMenu(playerid)

	HideMenu(playerid, Menu_Player);
	FreezePlayer(playerid, 0);
	Player[playerid].MenuPlayer = false;
	Player[playerid].Talking = false;

end

function SendPlayerInviteToParty(playerid, focusid)

	GameTextForPlayer(playerid, 2100, 3500, "Выслано приглашение в группу.","Font_Old_20_White_Hi.TGA", 0, 255, 0, 4000);
	GameTextForPlayer(focusid, 2100, 3500, ""..GetPlayerName(playerid).." приглашает Вас в группу.","Font_Old_20_White_Hi.TGA", 0, 255, 0, 10000);
	Player[focusid].Timer_Party = SetTimerEx("InviteToPartyOff", 10000, 0, focusid);
	Player[focusid].Party = playerid;

end

function SendPlayerInviteToPVP(playerid, focusid)

	GameTextForPlayer(playerid, 2100, 3500, "Игрок "..GetPlayerName(focusid).." вызван Вами на поединок!","Font_Old_20_White_Hi.TGA", 0, 255, 0, 4000);
	GameTextForPlayer(focusid, 2100, 3500, ""..GetPlayerName(playerid).." вызывает Вас на поединок!","Font_Old_20_White_Hi.TGA", 0, 255, 0, 10000);
	Player[focusid].Timer_PVP = SetTimerEx("InviteToPVPOff", 10000, 0, focusid);
	Player[focusid].PVP = playerid;
	Player[playerid].PVP = focusid;

end

function InviteToPartyOff(playerid)
	
	if Player[playerid].Timer_Party ~= -1 then
	
		KillTimer(Player[playerid].Timer_Party);
	
	end
	
	GameTextForPlayer(playerid, 2300, 3500, "Предложение отклонено.","Font_Old_20_White_Hi.TGA", 255, 0, 0, 1500);
	GameTextForPlayer(Player[playerid].Party, 2300, 3500, "Предложение отклонено.","Font_Old_20_White_Hi.TGA", 255, 0, 0, 1500);
	Player[playerid].Party = -1;
	Player[playerid].Timer_Party = -1;

end

function InviteToPVPOff(playerid)
	
	if Player[playerid].Timer_PVP ~= -1 then
	
		KillTimer(Player[playerid].Timer_PVP);
	
	end
	
	GameTextForPlayer(playerid, 2300, 3500, "Предложение отклонено.","Font_Old_20_White_Hi.TGA", 255, 0, 0, 1500);
	GameTextForPlayer(Player[playerid].PVP, 2300, 3500, "Предложение отклонено.","Font_Old_20_White_Hi.TGA", 255, 0, 0, 1500);
	Player[Player[playerid].PVP].PVP = -1;
	Player[playerid].PVP = -1;
	Player[playerid].Timer_PVP = -1;

end

function ClearPVP(playerid)
	
	Player[Player[playerid].PVP].PVP = -1;
	Player[Player[playerid].PVP].Timer_PVP = -1;
	Player[playerid].PVP = -1;
	Player[playerid].Timer_PVP = -1;

end

function ClearParty(playerid)
	
	Player[playerid].Party = -1;
	Player[playerid].Timer_Party = -1;

end

function ClearGametext(playerid, focusid)

	GameTextForPlayer(playerid, 3500, 2100, " ","Font_Old_20_White_Hi.TGA", 0, 255, 0, 500);
	GameTextForPlayer(focusid, 3500, 2100, " ","Font_Old_20_White_Hi.TGA", 0, 255, 0, 500);
	
end

function SafeZoneControl(playerid, killerid)

	if IsNPC(killerid) ~= 1 then
	
		if IsNPC(playerid) == 1 then
			
			if IsMonster(playerid) == true then
			
				HitMonster(killerid, playerid);
				
			else
				
				SetPlayerHealth(playerid, GetPlayerMaxHealth(playerid));
				SetPlayerHealth(killerid, 0);
				SendPlayerMessage(killerid, 255, 255, 0, "Иннос покарал Вас!");
			
			end
		
		else
			
			--[[if GetSafeZone( playerid ) == true then			Safe zone
			
				if GetPlayerPVP( playerid ) == false and GetPlayerPVP( killerid ) == false then
					
					SafeZoneHealt( playerid, killerid );
					
				else
					
					PlayerHitSafeZone(playerid, killerid);
					
				end
				
			else]]--
				
				PlayerHit(playerid, killerid);
		
			--end
			
		end
		
	end

end

function SerwerInfo(playerid)

	ShowDraw(playerid, Server_Name);
	ShowDraw(playerid, Server_Link);
	ShowDraw(playerid, Server_Quit);

end

function CheckItem( playerid )

	return Player[playerid].CheckItem;
	
end

function SetCheckItem( playerid, set )

	Player[playerid].CheckItem = set;
	
end

function Prace()
	
	Res();	
	--CheckNPCPos();

	for i = 0, GetMaxPlayers() - 1 do
	
		if IsPlayerConnected(i) == 1 then
		
			if IsSpawned(i) == 1 then
			
				CheckPlayerPrayer(i);
				
				if Player[i].Kop == true then
					
					Player[i].Counter = Player[i].Counter + 1;
					
					if Player[i].Counter == 2 then
						
						KopRude(i);
						Player[i].Counter = 0;
						
					end
				
				end
				
				if Player[i].GCzat > 0 and Player[i].GCzat <= (Czat_time - 1) then
				
					Player[i].GCzat = Player[i].GCzat + 1;
					
				elseif Player[i].GCzat == Czat_time then
				
					Player[i].GCzat = 0;
				
				end
			
			end
			
		end
		
	end
	
	-- Launcher
	--[[if Runner2 >= Runner then
		delRunner();
		Runner2 = 0;
	else
		Runner2 = Runner2 + 1;
	end]]
	-- End Of Launcher

end

function Kop(playerid)

	if Player[playerid].Fish == false then

		if GetFarimMenu(playerid) == 2 or GetFarimMenu(playerid) == 5 then
			
			local x, y, z = GetPlayerPos(playerid);
			
			if GetDistance2D(14146.434570312, -32344.37890625, x, z) <= 505 then
				
				Player[playerid].Fish = true;
				PlayAnimation(playerid, "T_PLUNDER");
				
			end

		end
		
	end
	
end

function KopRude(playerid)

	Player[playerid].Kop = false;
	local rand = random(3);
	
	if rand == 0 then
	
		GameTextForPlayer(playerid, 3000, 3500, "Неудачная попытка!","Font_Old_20_White_Hi.TGA", 255, 0, 0, 1000);
		
	elseif rand == 1 then
	
		GameTextForPlayer(playerid, 3000, 3500, "Найдено: "..rand.." рыбы.","Font_Old_20_White_Hi.TGA", 0, 255, 0, 1000);
		GiveItem(playerid, "ITFO_FISH", rand);
		
	else
	
		GameTextForPlayer(playerid, 3000, 3500, "Найдено: "..rand.." рыбы.","Font_Old_20_White_Hi.TGA", 0, 255, 0, 1000);
		GiveItem(playerid, "ITFO_FISH", rand);
		
	end
	
end

function EndNPC(playerid)

	ShowNPCFocus(playerid);
	FreezePlayer(playerid, 0);
	Player[playerid].Talking = false;
	Player[playerid].NPC = false;
	
end

function GlobalChat(playerid, params)

	if GetPlayerLoggedIn(playerid) == true then

		local result, message = sscanf(params, "s");
		
		if result == 1 then
		
			if Player[playerid].Mute == false then
			
				local name = GetPlayerName(playerid);
			
				if Player[playerid].GCzat == 0 then
				
					Player[playerid].GCzat = 1;
					
					if name == "Нуар" or name == "Silvio" or name == "Ульфрик" or name == "Брафф" or name == "Сантьяго" then
						--SendMessageToAll(255, 25, 15, ""..GetPlayerName(playerid).." (ID: "..playerid.."): "..message.."");
						for i = 0, GetMaxPlayers() - 1 do
							if IsNPC(i) == 0 and IsPlayerConnected(i) == 1 then
								if Player[i].gchat == true then
									SendPlayerMessage(i, 255, 25, 15, GetPlayerName(playerid).." (ID: "..playerid.."): "..message);
								end
							end
						end
					else
						for i = 0, GetMaxPlayers() - 1 do
							if IsNPC(i) == 0 and IsPlayerConnected(i) == 1 then
								if Player[i].gchat == true then
									SendPlayerMessage(i, 0, 154, 255, GetPlayerName(playerid).." (ID: "..playerid.."): "..message);
								end
							end
						end
					end
					LogString("Logs_Czat", ""..GetPlayerName(playerid)..": "..message.."");
				
				else
					if name == "Нуар" or name == "Silvio" or name == "Ульфрик" or name == "Брафф" or name == "Сантьяго" then
						for i = 0, GetMaxPlayers() - 1 do
							if IsNPC(i) == 0 and IsPlayerConnected(i) == 1 then
								if Player[i].gchat == true then
									SendPlayerMessage(i, 255, 25, 15, GetPlayerName(playerid).." (ID: "..playerid.."): "..message);
								end
							end
						end
						LogString("Logs_Czat", ""..GetPlayerName(playerid)..": "..message.."");
					else
				
					SendPlayerMessage(playerid, 255, 0, 0, "Вы не можете отправлять сообщения так часто.");
					end
				
				end
				
			else
			
				SendPlayerMessage(playerid, 255, 0, 0, "Вам был выдан мут в глобальном чате.");
			
			end
		
		else
		
			SendPlayerMessage(playerid, 255, 0, 0, "Пиши /г (текст сообщения)");
		
		end
	
	end

end

function ExitGame_Player(playerid)
	
	ExitGame(playerid);

end

function GetTableItemLenght( playerid )
	
	return #Player[playerid].Item;
	
end

function GetItemPlayerTable( playerid )
	
	return Player[playerid].Item;
	
end

function GetItemAmountPlayerTable( playerid )
	
	return Player[playerid].Item_Amount;
	
end

function GetItemEquipPlayerTable( playerid )
	
	return Player[playerid].Item_Equip;
	
end

function GetItemPlayer( playerid, slot )
	
	return Player[playerid].Item[slot];
	
end

function GetItemAmountPlayer( playerid, slot )
	
	return Player[playerid].Item_Amount[slot];
	
end

function GetItemEquipPlayer( playerid, slot )
	
	return Player[playerid].Item_Equip[slot];
	
end

function SetItemAmountPlayer( playerid, i, amount )

	Player[playerid].Item_Amount[i] = amount;

end

function ChangeDrawAfterLogin(playerid)

	HideDraw(playerid, Server_Quit);
	ShowDraw(playerid, Server_Menu);

end

function CitySafeZone(playerid, weaponmode)
		
	if CitySafeZoneDistance(playerid) == true then
		
		if weaponmode == 1 then

			SendPlayerMessage(playerid, 255, 255, 0, "В замке запрещена агрессия!");
			SetPlayerWeaponMode(playerid, WEAPON_NONE);
		
		elseif weaponmode == 3 then

			SendPlayerMessage(playerid, 255, 255, 0, "Не доставайте оружие в замке!");
			SetPlayerWeaponMode(playerid, WEAPON_NONE);

		elseif weaponmode == 4 then

			SendPlayerMessage(playerid, 255, 255, 0, "Не доставайте оружие в замке!");
			SetPlayerWeaponMode(playerid, WEAPON_NONE);		

		elseif weaponmode == 5 then

			SendPlayerMessage(playerid, 255, 255, 0, "Не доставайте оружие в замке!"); 
			SetPlayerWeaponMode(playerid, WEAPON_NONE);

		elseif weaponmode == 6 then

			SendPlayerMessage(playerid, 255, 255, 0, "Не доставайте оружие в замке!"); 
			SetPlayerWeaponMode(playerid, WEAPON_NONE);

		elseif weaponmode == 7 then
		
			SendPlayerMessage(playerid, 255, 255, 0, "Не доставайте оружие в замке!"); 
			SetPlayerWeaponMode(playerid, WEAPON_NONE);
		
		end
		
	end

end

function CitySafeZoneDistance(playerid)
	
	local x, y, z = GetPlayerPos(playerid);
	local SZ_x, SZ_z, SZ_dist = GetSZParametrs( playerid );
	
	if GetDistance2D(SZ_x, SZ_z, x, z) <= SZ_dist then
		
		return true;
		
	else
	
		return false;
	
	end

end

function Mute(playerid, params)

	if IsPlayerAdmin(playerid) == 1 then
	
		local result, id = sscanf(params, "d");
		
		if result == 1 then
		
			Player[id].Mute = true;
			SendPlayerMessage(playerid, 0, 255, 0, "Заблокирован чат у "..GetPlayerName(id).."");
			SendPlayerMessage(id, 0, 255, 0, "Вам заблокировал чат администратор: "..GetPlayerName(playerid).."");
		
		end
	
	end

end

function UnMute(playerid, params)

	if IsPlayerAdmin(playerid) == 1 then
	
		local result, id = sscanf(params, "d");
		
		if result == 1 then
		
			Player[id].Mute = false;
			SendPlayerMessage(playerid, 0, 255, 0, "Разблокирован чат у "..GetPlayerName(id).."");
			SendPlayerMessage(id, 0, 255, 0, "Вам разблокировал чат администратор: "..GetPlayerName(playerid).."");
		
		end
	
	end

end

function DestroyAllDraws(playerid)

	DestroyRankDraw(playerid);
	DestroyLvlDraw(playerid);
	
end

function Res()

	if Start_Restart == true then
	
		Restart = Restart - 1;
		UpdateDraw(Restart_Draw, 1500, 3300, "Рестарт наступит через: "..Restart.."","Font_Old_20_White_Hi.TGA", 255, 0, 0);
		print("Restart za: "..Restart.."");
		
		if Restart == 0 then
			
			Restart = 60;
			Start_Restart = false;
			
			for i = 0, GetMaxPlayers() - 1 do
			
				if IsPlayerConnected(i) == 1 then
				
					HideDraw(i, Restart_Draw);
				
				end
			
			end
			
			UpdateDraw(Restart_Draw, 1500, 3300, "Рестарт наступит через: 60","Font_Old_20_White_Hi.TGA", 255, 0, 0);
			
		end
	
	end

end

function CheckPlayerPrayer(playerid)

	if GetPlayerAnimationID(playerid) == 210 then
	
		if Player[playerid].Pray == false then
		
			UpdatePlayerDraw(playerid, Player[playerid].FreeDraw, 2950, 6850, "Цена: "..((GetMaxHealth(playerid)-GetPlayerHealth(playerid))*0.80).."", "Font_Old_10_White_Hi.TGA", 255, 255, 255);
			Player[playerid].Talking = true;
			Player[playerid].Pray = true;
			
			ShowMenu(playerid, Menu_Pray);
			ShowPlayerDraw(playerid, Player[playerid].FreeDraw);
			
		end
		
	elseif GetPlayerAnimationID(playerid) == 265 and Player[playerid].Pray == true then
	
		HideMenu(playerid, Menu_Pray);
		HidePlayerDraw(playerid, Player[playerid].FreeDraw);
		Player[playerid].Talking = false;
		Player[playerid].Pray = false;
		
	end

end

function ExitingGame(playerid)
	return Player[playerid].Exiting;
end

function KiedyPlejerCzituje(playerid, bloczek, starawartosc, nowawartosc)
	--print(GetPlayerName(playerid),czituje);
	--SendPlayerMessage(playerid,255,0,0,"Nie czituj: "..bloczek.."!!!!");
	SendMessageToAll(255,0,0, GetPlayerName(playerid).." читер и был забанен ;)");
	Ban(playerid, 1);
	--Kick(playerid);
	LogString("Logs_Cheaters", GetPlayerName(playerid).." "..bloczek.." "..starawartosc.." "..nowawartosc);
end

--[[
	Kyrmir MMORPG
	Admin
]]

--require "MySQL_Lib/mysql_lib"

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
	handler = mysql_connect("host", "user", "passwd", "bd");
end

function reloadBans(playerid)
	if IsPlayerADM(playerid) or IsPlayerADM(playerid) == 4 or IsPlayerADM(playerid) == 8 then
	if checkMySQLd() then
		local bans = loadBans();
		if bans then
			SendPlayerMessage(playerid, 255, 0, 0, "Баны очищены.");
			for i = 1, #Bans do
				table.remove(Bans, 1);
				--table.insert( Bans, { nick = bans[i][1], reason = bans[i][2], ip = bans[i][3], mac = bans[i][4], nmd5 = bans[i][5], nnick = bans[i][6] } );
			end
			for i in pairs(bans) do
				table.insert( Bans, { nick = bans[i][1], reason = bans[i][2], ip = bans[i][3], mac = bans[i][4], nmd5 = bans[i][5], nnick = bans[i][6] } );
			end
			SendPlayerMessage(playerid, 0, 255, 0, "Список банов успешно загружен!");
		else
			LogString("Logs_BansERR", "Проблема с загрузкой банов. Лучше перезапустить сервер!");
			SendPlayerMessage(playerid, "Перезагрузка банлиста не сработала, попробуйте еще раз!");
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
		print("CANT CONNECT WITH DB (CORE) :(");
	else
		print("Редактор банов: ", handler);
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
			LogString("Logs_BansERR", "Проблема с чтением банов, лучше перезапустить сервер!");
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
			GameTextForAll(50, 3500, "Сервер: "..text.."" ,"Font_Old_20_White_Hi.TGA", 0, 255, 0, 60 * 1000 * 10);
		end
	end
end

function CMD_AdminHelp(playerid)

	if IsPlayerADM(playerid) == 5 or IsPlayerADM(playerid) == 4 or IsPlayerADM(playerid) == 8
	then
		for i = 0, 15
		do
			SendPlayerMessage(playerid,255,255,255,"");
		end

		SendPlayerMessage(playerid,255,255,255,"Помощь админам:");
		SendPlayerMessage(playerid,255,250,200,"/кик /бан /килл /тп /give /ник /цвет");
	else
		SendPlayerMessage(playerid,255,250,200,"(Сервер): Ты не админ!");
	end
end

function CMD_Kick(playerid, params)

	if IsPlayerADM(playerid) == 5 or IsPlayerADM(playerid) == 4 or IsPlayerADM(playerid) == 8
	then
		local result,id,reason = sscanf(params,"ds");

		if result == 1
		then
			if IsPlayerConnected(id) == 1
			then
					SendMessageToAll(255,0,0,string.format("%s %s %s %s%s %s %s","(Сервер):игрок ",GetPlayerName(id)," был кикнут ",GetPlayerName(playerid),"."," Причина: ",reason));

				Kick(id);
			else
				SendPlayerMessage(playerid,255,250,200,string.format("%s %d %s","(Сервер): Игрок с идом ",id," не подключен к серверу."));
			end
		else
			SendPlayerMessage(playerid,255,250,200,"Используй: /кик (идигрока) (причина)");
		end
	else
		SendPlayerMessage(playerid,255,250,200,"(Сервер): Ты не админ!");
	end
end

function CMD_Ban(playerid, params)

	if IsPlayerADM(playerid) == 5 or IsPlayerADM(playerid) == 4
	then
		local result,id,reason = sscanf(params,"ds");

		if result == 1
		then
			if IsPlayerConnected(id) == 1
			then
					if checkMySQLd() then
						SendMessageToAll(255,0,0,string.format("%s %s %s %s%s %s %s","(Сервер):игрок ",GetPlayerName(id)," был забанен ",GetPlayerName(playerid),"."," Причина: ",reason));
						table.insert( Bans, { nick = GetPlayerName(id), reason = reason, ip = GetPlayerIP(id), mac = GetMacAddress(id), nmd5 = MD5(GetPlayerName(id)), nnick = GetPlayerName(playerid) } );
						local sql = mysql_query(handler, "INSERT INTO `BanList` (`nick`, `reason`, `ip`, `mac`, `nmd5`, `nnick`) VALUES ('"..GetPlayerName(id).."', '"..reason.."', '"..GetPlayerIP(id).."', '"..GetMacAddress(id).."', '"..MD5(GetPlayerName(id)).."', '"..GetPlayerName(playerid).."')");
						if sql then
							mysql_free_result(sql);
						end
						Ban(id);
						--Kick(id);
					else
						SendPlayerMessage(playerid, 255, 0, 0, "Ошибка MySQL, игрок не был добавлен в банлист!");
						recMySQLd();
					end
				--Ban(id);
				--Kick(id);
			else
				SendPlayerMessage(playerid,255,250,200,string.format("%s %d %s","(Сервер): Игрок с идом ",id," не подключен к серверу."));
			end
		else
			SendPlayerMessage(playerid,255,250,200,"Используй: /бан (идигрока) (причина)");
		end
	else
		SendPlayerMessage(playerid,255,250,200,"(Сервер): Ты не админ!");
	end
end

function CMD_BanAcc(playerid, params)

	if IsPlayerADM(playerid) == 5 or IsPlayerADM(playerid) == 4 or IsPlayerADM(playerid) == 8
	then
		local result,id,reason = sscanf(params,"ds");

		if result == 1
		then
			if IsPlayerConnected(id) == 1
			then
					if checkMySQLd() then
						SendMessageToAll(255,0,0,string.format("%s %s %s %s%s %s %s","(Сервер):игрок ",GetPlayerName(id)," был забанен ",GetPlayerName(playerid),"."," Причина: ",reason));
						table.insert( Bans, { nick = GetPlayerName(id), reason = reason, ip = GetPlayerIP(id), mac = GetMacAddress(id), nmd5 = MD5(GetPlayerName(id)), nnick = GetPlayerName(playerid) } );
						local sql = mysql_query(handler, "INSERT INTO `BanList` (`nick`, `reason`, `ip`, `mac`, `nmd5`, `nnick`) VALUES ('"..GetPlayerName(id).."', '"..reason.."', '"..GetPlayerIP(id).."', '"..GetMacAddress(id).."', '"..MD5(GetPlayerName(id)).."', '"..GetPlayerName(playerid).."')");
						if sql then
							mysql_free_result(sql);
						end
						--Ban(id);
						--Kick(id);
					else
						SendPlayerMessage(playerid, 255, 0, 0, "Ошибка MySQL, игрок не был добавлен в банлист!");
						recMySQLd();
					end
				--Ban(id);
				--Kick(id);
			else
				SendPlayerMessage(playerid,255,250,200,string.format("%s %d %s","(Сервер): Игрок с идом ",id," не подключен к серверу."));
			end
		else
			SendPlayerMessage(playerid,255,250,200,"Используй: /банакк (идигрока) (причина)");
		end
	else
		SendPlayerMessage(playerid,255,250,200,"(Сервер): Ты не админ!");
	end
end

function CMD_Kill(playerid, params)

	if IsPlayerADM(playerid) == 5 or IsPlayerADM(playerid) == 4 or IsPlayerADM(playerid) == 8
	then
		local result,id = sscanf(params,"d");

		if result == 1
		then
			if IsPlayerConnected(id) == 1
			then
				SendPlayerMessage(id,255,250,200,string.format("%s %s","Вы были убиты игроком ",GetPlayerName(playerid)));
				SendPlayerMessage(playerid,255,250,200,string.format("%s %s","Вы убили игрока ",GetPlayerName(id)));
				SetPlayerHealth(id,0);
			else
				SendPlayerMessage(playerid,255,250,200,string.format("%s %d %s","(Сервер): Игрок с идом ",id," не подключен к серверу."));
			end
		else
			SendPlayerMessage(playerid,255,250,200,"Используй: /килл (идигрока)");
		end
	else
		SendPlayerMessage(playerid,255,250,200,"(Сервер): Ты не админ!");
	end
end

function CMD_Teleport(playerid, params)

	if IsPlayerADM(playerid) == 5 or IsPlayerADM(playerid) == 4 or IsPlayerADM(playerid) == 8
	then
		local result,from_id,to_id = sscanf(params,"dd");

		if result == 1
		then
			if IsPlayerConnected(from_id) == 1
			then
				if IsPlayerConnected(to_id) == 1
				then
					SendPlayerMessage(from_id,255,250,200,string.format("%s %s","Вы телепортировались к ",GetPlayerName(to_id)));
					SendPlayerMessage(to_id,255,250,200,string.format("%s %s","К Вам телепортировался ",GetPlayerName(from_id)));

					local x,y,z = GetPlayerPos(to_id);
					SetPlayerPos(from_id,x + 50,y,z);
				else
					SendPlayerMessage(playerid,255,250,200,string.format("%s %d %s","(Сервер): Игрок с идом ",to_id," не подключен к серверу."));
				end
			else
				SendPlayerMessage(playerid,255,250,200,string.format("%s %d %s","(Сервер): Игрок с идом ",from_id," не подключен к серверу."));
			end
		else
			SendPlayerMessage(playerid,255,250,200,"Используй: /тп (от игрока) (к игроку)");
		end
	else
		SendPlayerMessage(playerid,255,250,200,"(Сервер): Ты не админ!");
	end
end

function CMD_GiveItem(playerid, params)

	if IsPlayerADM(playerid) == 5 or IsPlayerADM(playerid) == 4 or IsPlayerADM(playerid) == 8
	then
		local result,id,item,amount = sscanf(params,"dsd");

		if result == 1
		then
			if IsPlayerConnected(id) == 1
			then
				SendPlayerMessage(id,255,250,200,string.format("%s %d %s %s %s","Вы получили ",amount,item," от ",GetPlayerName(playerid)));
				SendPlayerMessage(playerid,255,250,200,string.format("%s %d %s %s %s","Вы выдали ",amount,item," игроку ",GetPlayerName(id)));
				GiveItem(id,item,amount);
				LogString("Logs_GiveItem",GetPlayerName(playerid).." выдал "..GetPlayerName(id).." предмет "..item.." в количестве "..amount); 
			else
				SendPlayerMessage(playerid,255,250,200,string.format("%s %d %s","(Сервер): Игрок с идом ",id," не подключен к серверу."));
			end
		else
			SendPlayerMessage(playerid,255,250,200,"Используй: /give (идигрока) (идпредмета) (кол-во)");
		end
	else
		SendPlayerMessage(playerid,255,250,200,"(Сервер): Ты не админ!");
	end
end

function CMD_GiveGold(playerid, params)

	if IsPlayerADM(playerid) == 5 or IsPlayerADM(playerid) == 4 or IsPlayerADM(playerid) == 8 
	then
		
		local result,id,amount, reason = sscanf(params,"dds");

		if result == 1 
		then
		
					
					SendPlayerMessage(id,255,250,200,string.format("%s %d %s %s %s","Вы получили ",amount," золота ","от ",GetPlayerName(playerid)));
					SendPlayerMessage(playerid,255,250,200,string.format("%s %d %s %s %s","Вы выдали ",amount,"золота ","игроку ",GetPlayerName(id)));
					GiveItem(id,"itmi_gold",amount);
					LogString("Logs_GiveGold",GetPlayerName(playerid).." выдал игроку "..GetPlayerName(id).." золото в количестве "..amount.." по причине: "..reason);
			else
				SendPlayerMessage(playerid,255,250,200,"Используй: /зото (идигрока) (кол-во) (причина)");
			end
		else
			SendPlayerMessage(playerid,255,250,200,"(Сервер): Ты не админ!");
	end
end


function CMD_Time(playerid, params)

	if IsPlayerADM(playerid) == 5 or IsPlayerADM(playerid) == 4 or IsPlayerADM(playerid) == 8
	then
		local result,hour,minute = sscanf(params,"dd");
		
		if result == 1
		then		
			SendMessageToAll(255,250,200,string.format("%s %s %s %d:%02d","(Сервер):",GetPlayerName(playerid)," изменил время на ",hour,minute));
			SetTime(hour,minute);
		else
			SendPlayerMessage(playerid,255,250,200,"Используй: /время (часы) (минуты)");
		end
	else
		SendPlayerMessage(playerid,255,250,200,"(Сервер): Ты не админ!");
	end
end

function CMD_TPAll(playerid, params)

	if IsPlayerADM(playerid) == 5 or IsPlayerADM(playerid) == 4
	then
		local result,id = sscanf(params,"d");
		
		if result == 1
		then
			if IsPlayerConnected(id) == 1 then
				local x, y, z = GetPlayerPos(id);
				SendMessageToAll(255,250,200,"Массовая телепортация к "..GetPlayerName(id));
				for i = 0, GetMaxPlayers() - 1 do
				
					if IsPlayerConnected(i) == 1 then
					
						if i~= id then
							
							SetPlayerPos(i, x, y, z);
							
						end
					
					end
				
				end
			end
		else
			SendPlayerMessage(playerid,255,250,200,"Используй: /тпалл (ид)");
		end
	else
		SendPlayerMessage(playerid,255,250,200,"(Сервер): Ты не админ!");
	end

end

function CMD_Scale(playerid, params)

	if IsPlayerADM(playerid) == 5 or IsPlayerADM(playerid) == 4
	then
		local result,id,x,x1,y,y1,z, z1 = sscanf(params,"ddddddd");
		
		if result == 1
		then
			if IsPlayerConnected(id) == 1 then
				x = x + x1/10;
				y = y + y1/10;
				z = z + z1/10;
				SetPlayerScale(id, x, y, z);
				SendPlayerMessage(id, 255, 255, 0, "Размер был изменен у "..GetPlayerName(playerid).."'a");
			end
		else
			SendPlayerMessage(playerid,255,250,200,"Используй: /размер (id) (x) (y) (z)");
		end
	else
		SendPlayerMessage(playerid,255,250,200,"(Сервер): Ты не админ!");
	end

end

function CMD_Name(playerid, params)

	if IsPlayerADM(playerid) == 5 or IsPlayerADM(playerid) == 4 then
		local result,id,name = sscanf(params,"ds");

		if result == 1 then
		
			if IsPlayerConnected(id) == 1 then
			
				local adminname = GetPlayerName(playerid);
				local beforename = GetPlayerName(id);
				if SetPlayerName(id,name) == 1 then
				
					SendMessageToAll(0,255,0,string.format("%s %s %s %s %s %s","Админ ",adminname," изменил имя игрока ",beforename," на ",name));
				else
					SendPlayerMessage(playerid,255,250,200,"(Server) Can't set name.");
				end
			else
				SendPlayerMessage(playerid,255,250,200,string.format("%s %d %s","(Сервер): Игрок с идом ",id," не подключен к серверу."));
			end
		else
			SendPlayerMessage(playerid,255,250,200,"Используй: /ник (идигрока) (новый ник)");
		end
	else
		SendPlayerMessage(playerid,255,250,200,"(Сервер): Ты не админ!");
	end
end

function CMD_Color(playerid, params)

	if IsPlayerADM(playerid) == 5 or IsPlayerADM(playerid) == 4 or IsPlayerADM(playerid) == 8 then
	
		local result,id,r,g,b = sscanf(params,"dddd");
	
		if result == 1 then
			if IsPlayerConnected(id) == 1 then
				
				local adminName = GetPlayerName(playerid);
				SendPlayerMessage(id,255,250,200,string.format("%s %d %d %d %s %s","Ваш цвет был изменен на ",r,g,b," админом ",adminName));
				SetPlayerColor(id,r,g,b);
			end
		else
			SendPlayerMessage(playerid,255,250,200,"Используй: /цвет (идигрока) (r) (g) (b)");
		end
	else
		SendPlayerMessage(playerid,255,250,200,"(Сервер): Ты не админ!");
	end
end

function checkBan(playerid)
	if IsNPC(playerid) == 0 then
		for i = 1, #Bans do
			if GetPlayerName(playerid) == Bans[i].nick or GetPlayerIP(playerid) == Bans[i].ip or GetMacAddress(playerid) == Bans[i].mac or 
			MD5(GetPlayerName(playerid)) == Bans[i].nmd5 then
				SendPlayerMessage(playerid, 255, 51, 204, "Забанил: "..Bans[i].nnick);
				SendPlayerMessage(playerid, 255, 51, 204, "Причина: "..Bans[i].reason);
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

--print(debug.getinfo(1).source.." has been loaded.");	


--[[
	Piepszony mysql_lib
	Author: Bimbol
	Edited by Profesores and Kimior
	Mordan - 2013, Kyrmir MMORPG - 2014
]]

local Player = {};

-- Draws
local Draw_Login = CreateDraw(2150, 3700, "Чтобы войти пиши /лог (пароль)", "Font_Old_20_White.TGA", 0, 255, 0);
local Draw_Register = CreateDraw(2500, 3720, "Зарегистрируйся на http://31.220.49.197:28281/", "Font_Old_20_White.TGA", 255, 0, 0);

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

--[[function addRunner(playerid)
	if IsNPC(playerid) == 0 then
		if checkMySQLConnection() == true then
			local Player = {};
			
			local sql = mysql_query(handler, "SELECT `nick` FROM `lanczer` WHERE `nick`='"..GetPlayerName(playerid).."'");
			Player = mysql_fetch_row(sql);
			if sql then
				mysql_free_result(sql);
			end
			
			if Player then
				sql = mysql_query(handler, "UPDATE `lanczer` SET `online`='1' WHERE `nick`='"..GetPlayerName(playerid).."'");
				if sql then
					mysql_free_result(sql);
				end
				return true;
			else
				return false;
			end
		else
			SendPlayerMessage(playerid, 255, 0, 0, "MySQL utraciі poі№czenie. Ponowne і№czenie...");
			SendPlayerMessage(playerid, 255, 0, 0, "Proszк sprуbowaж ponownie.");
			_Kick(playerid);
			reconnectMySQL();
		end
	end
end

function delRunner()
	if checkMySQLConnection() == true then
		local Player = {};
		
		local sql = mysql_query(handler, "SELECT `nick` from `lanczer` WHERE `online`='0'");
		if sql then
			Player = mysql_fetch_row(sql);
			mysql_free_result(sql);
		else
			LogString("launcher_error", "(Fatal Error): Nie udaіo siк wykonaж zapytania do tabeli launchera!");
			return;
		end
		
		if Player then
			for i = 1, #Player do
				sql = mysql_query(handler, "DELETE FROM `lanczer` WHERE `nick`='"..Player[i].."'");
				if sql then
					mysql_free_result(sql);
				end
				table.remove(Player, i);
			end
		end
	else
		LogString("launcher_error", "(Fatal Error): MySQL utraciіo poі№czenie!!!");
	end
end

function delOnlineRunner(playerid)
	if IsNPC(playerid) == 0 then
		if checkMySQLConnection() == true then
			local sql = mysql_query(handler, "DELETE FROM `lanczer` WHERE `nick`='"..GetPlayerName(playerid).."'");
			if sql then
				mysql_free_result(sql);
			else
				LogString("launcher_error", "(Fatal Error): Nie udaіo siк usun№ж gracza.");
			end
		else
			SendPlayerMessage(playerid, 255, 0, 0, "MySQL utraciі poі№czenie. Ponowne і№czenie...");
			SendPlayerMessage(playerid, 255, 0, 0, "Proszк sprуbowaж ponownie.");
			_Kick(playerid);
			reconnectMySQL();
			LogString("launcher_error", "(Fatal Errrrrrrrrrrrrrrrror):  MySQL utraciіo poі№czonko.");
		end
	end
end]]

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
				
					local res = mysql_query(handler, "SELECT `member_id` FROM `core_members` WHERE `name` = '"..GetPlayerName(playerid).."'");
						Player[playerid].Row = mysql_fetch_row(res);
						if res then
							mysql_free_result(res);
						end
					
						local res =  mysql_query ( handler, "SELECT `field_2` FROM `core_pfields_content` WHERE `member_id` = '"..Player[playerid].Row[1].."'");
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
					--if MD5(password) == Player[playerid].Row_Forum[1] then
					if password == Player[playerid].Row_Forum[1] then
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
						
						local res = mysql_query(handler, "SELECT `member_group_id` FROM core_members WHERE `name` = '"..GetPlayerName(playerid).."'");
							Player[playerid].adm = mysql_fetch_row(res);
					local adml = Player[playerid].adm
							if Player[playerid].adm[1] == "4" then
								table.remove(Player[playerid].adm , 1);
								Player[playerid].admin = 4;
								SendPlayerMessage(playerid,0,255,255,string.format("%s","Права доступа: Администратор"));
							elseif 
								Player[playerid].adm[1] == "6" then
								table.remove(Player[playerid].adm , 1);
								Player[playerid].admin = 6;
								SendPlayerMessage(playerid,0,255,255,string.format("%s","Права доступа: Гл. Модератор"));
							elseif 
								Player[playerid].adm[1] == "7" then
								table.remove(Player[playerid].adm , 1);
								Player[playerid].admin = 7;
								SendPlayerMessage(playerid,0,255,255,string.format("%s","Права доступа: Модератор"));
							else
								table.remove(Player[playerid].adm , 1);
								Player[playerid].admin = 0;
							end
							--[[if res then
								mysql_free_result(res);
							end]]
						
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
			
				--SetPlayerWorld(playerid, Player[playerid].Row[2], "START");
				
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
				--SetPlayerPVP(playerid, tonumber(Player[playerid].Row[38]), tonumber(Player[playerid].Row[39]));

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

function IsPlayerADM(playerid)
	if Player[playerid].admin == 5 then
		return 5;
	elseif Player[playerid].admin == 4 then
		return 4;
	elseif Player[playerid].admin == 8 then
		return 8;
	else
		return 0;
	end
end

--
-- Set
--

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

--print(debug.getinfo(1).source.." has been loaded.");
