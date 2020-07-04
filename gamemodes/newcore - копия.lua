--[[
	Kyrmir MMORPG
	Plik G³ówny
	Authors: Bimbol, Kimior, Profesores
]]

require "Antycheat/hooks" --hooki
require "Antycheat/ac"	--AC
require "Antycheat/callbackac" --callbacki do AC
require "MySQL_Lib/mysql_lib" -- MySQL Baza Danych
require "Monster-framework/monster-framework" -- Monster Lib
require "Monster-framework/monster" --potfforki
require "NPC_Lib/pomoc"
require "Monster-framework/safezone"
require "Monster-framework/pk"
require "MySQL_Lib/finditem" -- Table Saves
require "MySQL_Lib/getfood" -- Check Food
require "MySQL_Lib/autosave" -- Auto Save
require "NPC_Lib/trade_player" -- Handel
require "NPC_Lib/trade_player_gold" -- Handel z³otem
require "Function/GetSZbyWorld"
require "Function/GetPosByWorld"
require "NPC_Lib/lvl_armor"
require "Function/checknpcpos"
require "Function/adminek" -- admin filterscript
require "Function/gold"
require "Framework/createherbs"
require "Framework/herbs"

--require "Framework/map"


---------------------------------
-- Global Draws and Textures
---------------------------------

local Server_Name = CreateDraw(5800, 200, "Kyrmir MMORPG", "Font_Old_10_White_Hi.TGA", 0, 43, 255);
local Server_Link = CreateDraw(5590, 335, "Kyrmir.Gothic-Multiplayer.com", "Font_Old_10_White_Hi.TGA", 0, 43, 255);
local Server_Menu = CreateDraw(5850, 600, "F7 - Menu", "Font_Old_10_White_Hi.TGA", 255, 255, 0);
local Server_Quit = CreateDraw(5820, 600, "/q - Wyjœcie", "Font_Old_10_White_Hi.TGA", 255, 0, 0);

local Texture_Menu_NPC = CreateTexture(1350, 6750, 6800, 8100, "Frame_GMPA.TGA");
local Menu_Texture = CreateTexture(3300, 2050, 5000, 4600, "Log_Paper.TGA");

local Player_Text = CreateTexture(3500, 4000, 5000, 6000, "Log_Paper.TGA");

local Wyglad_Text = CreateTexture(550, 3200, 2650, 5200, "Log_Paper.TGA");

local FocusNPC_Texture = CreateTexture(2600, 6650, 5750, 7350, "Frame_GMPA.TGA");
local FocusNPC_Draw = CreateDraw(3050, 6900, "Kliknij CTRL aby porozmawiaæ z NPC", "Font_Old_10_White_Hi.TGA", 255, 255, 0);
local Restart_Draw = CreateDraw(1500, 3300, "Restart nast¹pi za: 60","Font_Old_20_White_Hi.TGA", 255, 0, 0);

local Lvl_Draw = CreateDraw(150, 7050, "Lvl.", "Font_Old_10_White_Hi.TGA", 255, 255, 0);

---------------------------------
-- Menu
---------------------------------

local Menu_Game = CreateMenu(4, "Wyjœcie z gry", Menu_Texture, 3450, 2300, "Font_Old_20_White_Hi.TGA", 300, 255, 255, 255, 255, 255, 0, "menu_game");
local Menu_Wyglad = CreateMenu(4, "ZaatwierdŸ", Wyglad_Text, 850, 3600, "Font_Old_20_White_Hi.TGA", 300, 255, 255, 255, 255, 255, 0, "menu_wyglad");
local Menu_Player = CreateMenu(4, "Powrót", Player_Text, 3900, 4300, "Font_Old_20_White_Hi.TGA", 300, 255, 255, 255, 255, 255, 0, "menu_player");
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
	Player.prosba = false; --teleportacja vipów
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
	SetGamemodeName("Kyrmir v. 0.1a");
	--SetServerDescription(" Strona: Kyrmir.Gothic-Multiplayer.com\n Wspieramy rozdzielczoœæ: 1280x960+\n Polecamy: Gothic-Multiplayer.com\n Team Speak 3: ts3.kyrmir.gothic-multiplayer.com");
	
	print("---------------------");
	print("Mordan MMORPG Engine");
	print("---------------------");
	
	SpawnNPC(); --Npc'e
	SpawnMonsters(); -- Potwory
	SpawnHerbs() -- Roœliny
	
	SetTimer("RespawnItemOnGrund", 1000 * 60 * 20, 1); -- Respawn Herbs
	
	SetTimer("Prace", 1000, 1); -- Praca
	--SetTimer("UpdateMap", 1000, 1); -- Map
	SetTimer("AI_Monster_Mordan", 550, 1); -- AI Monster
	SetTimer("AI_Monster_GD", 550, 1); -- AI Monster GD
	SetTimer("AI_Monster_3", 550, 1); -- AI Monster 3
	SetTimer("Respawn_Monster", 60 * 1000, 1); -- Respawn Monster
	SetTimer("AutoSave", 60 * 1000 * 3, 1); -- Auto Save
	
	MySQLInit();
	init_ac(true);
	initAdmin();
	initTrade();
	print("Gamemode zostal pomyslnie zaladowany ;D");
end

function OnGamemodeExit()
	print("Mordan MMORPG Engine exit");
end

function OnPlayerConnect(playerid)
	if IsNPC(playerid) == 0 then
		if string.find(GetPlayerName(playerid).."", "'", 1) then
			SendPlayerMessage(playerid, 255, 0, 0, "Nick nie mo¿e zawieraæ dziwnych znaków ;)");
			_Kick(playerid);
			return;
		elseif string.find(GetPlayerName(playerid).."", "`", 1) then
			SendPlayerMessage(playerid, 255, 0, 0, "Nick nie mo¿e zawieraæ dziwnych znaków ;)");
			_Kick(playerid);
			return;
		elseif string.find(GetPlayerName(playerid)..'', '"', 1) then
			SendPlayerMessage(playerid, 255, 0, 0, "Nick nie mo¿e zawieraæ dziwnych znaków ;)");
			_Kick(playerid);
			return;
		end
		
		SetPlayerColor(playerid, 255, 255, 255);
		--if not(checkBan(playerid)) then --sprawdzamy czy ma bana
		
		SetPlayerWorld(playerid, "KYRMIR.ZEN", "zupkachinskanajlepszanaswiecie");
		
		Player[playerid] = CreatePlayer(playerid); --Tworzy podstawow¹ strukture gracza
		local name = GetPlayerName(playerid);
		SerwerInfo(playerid); --wyœwietla draw'y
		Menu_OnPlayerConnect(playerid); --Tworzy strukture dialogów
		Monster_OnPlayerConnect(playerid); --To jest w monster-framework.lua xD
		PK_OnPlayerConnect(playerid); --Tworzy strukture statystyk
		TradePlayer_OnPlayerConnect(playerid); --zapewne tworzy strukture handlu ;P
		goldInit(playerid); -- Virtual Gold Init
		PartyInit(playerid); --strzelam, ¿e tworzy strukture grup
		MySQL_OnPlayerConnect(playerid); --Tworzy strukture gracza do obs³ugi zapisu
		--OnPlayerLoggedInMap(playerid); --tworzy strukture do mini-mapy, zbêdne na razie!!!
		
		SendMessageToAll(0, 255, 0, name.." po³¹czy³(a) siê z serwerem.");
		
		GetMD5File(playerid,"data\\kyrmirv.vdf");
		GetMD5File(playerid,"VDFS.CFG");
		--[[GetMD5File(playerid, "System\\kyrmir.dll");
		GetMD5File(playerid, "System\\Kyrmir-Launcher.exe");]]
		GetMD5File(playerid, "Accrescere\\Data\\gmpa.vdf");
		GetMD5File(playerid, "System\\Paths.d");
		
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
			SendPlayerMessage(playerid, 255, 0, 0, "Nie mo¿esz wejœæ bez naszego launchera ;)");
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
				SendPlayerMessage(playerid, 255, 255, 0, "Pobierz kyrmirv.vdf z forum: 176.122.224.129");
				_Kick(playerid);
			end
		elseif pathFile == "VDFS.CFG" then
			if hash ~= "0e3501ba7260d12e21171d38abed5940" then
				SendPlayerMessage(playerid, 255, 255, 0, "Posiadasz nieprawid³owy plik VDFS.CFG!");
				SendPlayerMessage(playerid, 255, 255, 0, "Pobierz poprawn¹ wersje z: 176.122.224.215");
				SendPlayerMessage(playerid, 255, 255, 0, "By³a aktualizacja 18.02 ;)");
				_Kick(playerid);
			end
		--[[elseif pathFile == "System\\kyrmir.dll" then
			if hash ~= "5b353fdcdc6e1c3825dee14b9594fa8a" then
				SendPlayerMessage(playerid, 255, 0, 0, "Posiadasz nieprawid³owy plik: kyrmir.dll");
				SendPlayerMessage(playerid, 255, 0, 0, "Pobierz poprawn¹ wersje z: 176.122.224.129");
				_Kick(playerid);
			end
		elseif pathFile == "System\\Kyrmir-Launcher.exe" then
			if hash ~= "479cc46e46d9aae96928b2dc7a1b364e" then
				SendPlayerMessage(playerid, 255, 0, 0, "Posiadasz nieprawid³owy plik: Kyrmir-Launcher.exe");
				SendPlayerMessage(playerid, 255, 0, 0, "Pobierz poprawn¹ wersje z: 176.122.224.129");
				_Kick(playerid);
			end]]
		elseif pathFile == "Accrescere\\Data\\gmpa.vdf" then
			if hash ~= "4d36120d7fb329ff9b2f9f504f994d4f" then
				SendPlayerMessage(playerid, 255, 0, 0, "Masz z³y plik gmpa.vdf");
				SendPlayerMessage(playerid, 255, 0, 0, "Mam wyjebane jak, ale za³atw sobie poprawny albo spierdalaj ;)");
				_Kick(playerid);
				LogString("probaoszustwa", GetPlayerName(playerid).." chcia³ mnie wychujaæ");
			end
		elseif pathFile == "System\\Paths.d" then
			if hash ~= "45cbdeb109bf8e13925fb902a542ca94" then
				SendPlayerMessage(playerid, 255, 0, 0, "Masz z³y plik Paths.d");
				SendPlayerMessage(playerid, 255, 0, 0, "Mam wyjebane jak, ale za³atw sobie poprawny albo spierdalaj ;)");
				_Kick(playerid);
				LogString("probaoszustwa", GetPlayerName(playerid).." z³y plik: Paths.d");
			end
			
		--[[elseif pathFile == "_WORK\\DATA\\SCRIPTS\\_COMPILED\\GOTHIC.DAT" then
			if hash ~= "81aa52c0d2e22ca1140b0ac6ada6f48b" then
				SendPlayerMessage(playerid, 255, 0, 0, "Posiadasz nieprawid³owy plik GOTHIC.DAT");
				SendPlayerMessage(playerid, 255, 0, 0, "Zg³oœ siê na forum po poprawny ;)");
				_Kick(playerid);
			end
		elseif pathFile == "DATA\\ANIMS.VDF" then
			if hash ~= "0214de30fb89c9edd0feee7d027daa09" then
				SendPlayerMessage(playerid, 255, 0, 0, "Posiadasz nieprawid³owy plik ANIMS.VDF");
				SendPlayerMessage(playerid, 255, 0, 0, "Zg³oœ siê na forum po poprawny ;)");
				_Kick(playerid);
			end
		elseif pathFile == "DATA\\ANIMS_ADDON.VDF" then
			if hash ~= "dae68a4cb2826e365a4925567d151167" then
				SendPlayerMessage(playerid, 255, 0, 0, "Posiadasz nieprawid³owy plik ANIMS_ADDON.VDF");
				SendPlayerMessage(playerid, 255, 0, 0, "Zg³oœ siê na forum po poprawny ;)");
				_Kick(playerid);
			end
		elseif pathFile == "DATA\\MESHES.VDF" then
			if hash ~= "9bd6be1dced9f8e58bfa7adbe733fc78" then
				SendPlayerMessage(playerid, 255, 0, 0, "Posiadasz nieprawid³owy plik MESHES.VDF");
				SendPlayerMessage(playerid, 255, 0, 0, "Zg³oœ siê na forum po poprawny ;)");
				_Kick(playerid);
			end
		elseif pathFile == "DATA\\MESHES_ADDON.VDF" then
			if hash ~= "7921fc96579116c411737a6bc4c72451" then
				SendPlayerMessage(playerid, 255, 0, 0, "Posiadasz nieprawid³owy plik MESHES_ADDON.VDF");
				SendPlayerMessage(playerid, 255, 0, 0, "Zg³oœ siê na forum po poprawny ;)");
				_Kick(playerid);
			end
		elseif pathFile == "DATA\\SOUNDS.VDF" then
			if hash ~= "7f77f0f88200379fa9025389bdafa5d8" then
				SendPlayerMessage(playerid, 255, 0, 0, "Posiadasz nieprawid³owy plik SOUNDS.VDF");
				SendPlayerMessage(playerid, 255, 0, 0, "Zg³oœ siê na forum po poprawny ;)");
				_Kick(playerid);
			end
		elseif pathFile == "DATA\\SOUNDS_ADDON.VDF" then
			if hash ~= "2ef076015944b6c13d88657a3c8e1fc4" then
				SendPlayerMessage(playerid, 255, 0, 0, "Posiadasz nieprawid³owy plik SOUNDS_ADDON.VDF");
				SendPlayerMessage(playerid, 255, 0, 0, "Zg³oœ siê na forum po poprawny ;)");
				_Kick(playerid);
			end
		elseif pathFile == "DATA\\SOUNDS_BIRD_01.VDF" then
			if hash ~= "bfd3909e391ab7023fd7f082c2fd9808" then
				SendPlayerMessage(playerid, 255, 0, 0, "Posiadasz nieprawid³owy plik SOUNDS_BIRD_01.VDF");
				SendPlayerMessage(playerid, 255, 0, 0, "Zg³oœ siê na forum po poprawny ;)");
				_Kick(playerid);
			end
		elseif pathFile == "DATA\\SPEECH1.VDF" then
			if hash ~= "5cc27fca463e008447899be4589f1559" then
				SendPlayerMessage(playerid, 255, 0, 0, "Posiadasz nieprawid³owy plik SPEECH1.VDF");
				SendPlayerMessage(playerid, 255, 0, 0, "Zg³oœ siê na forum po poprawny ;)");
				_Kick(playerid);
			end
		elseif pathFile == "DATA\\SPEECH2.VDF" then
			if hash ~= "97bcf035a6d33ab0888d19daae59ff03" then
				SendPlayerMessage(playerid, 255, 0, 0, "Posiadasz nieprawid³owy plik SPEECH2.VDF");
				SendPlayerMessage(playerid, 255, 0, 0, "Zg³oœ siê na forum po poprawny ;)");
				_Kick(playerid);
			end
		elseif pathFile == "DATA\\SPEECH_ADDON.VDF" then
			if hash ~= "66b5884c185f21baa9c8d301695622bd" then
				SendPlayerMessage(playerid, 255, 0, 0, "Posiadasz nieprawid³owy plik SPEECH_ADDON.VDF");
				SendPlayerMessage(playerid, 255, 0, 0, "Zg³oœ siê na forum po poprawny ;)");
				_Kick(playerid);
			end
		elseif pathFile == "DATA\\TEXTURES.VDF" then
			if hash ~= "571c2052854449929dd2f5bf912d45a3" then
				SendPlayerMessage(playerid, 255, 0, 0, "Posiadasz nieprawid³owy plik TEXTURES.VDF");
				SendPlayerMessage(playerid, 255, 0, 0, "Zg³oœ siê na forum po poprawny ;)");
				_Kick(playerid);
			end
		elseif pathFile == "DATA\\TEXTURES_ADDON.VDF" then
			if hash ~= "198098d33bd048d069590f72d677aba7" then
				SendPlayerMessage(playerid, 255, 0, 0, "Posiadasz nieprawid³owy plik TEXTURES_ADDON.VDF");
				SendPlayerMessage(playerid, 255, 0, 0, "Zg³oœ siê na forum po poprawny ;)");
				_Kick(playerid);
			end
		elseif pathFile == "DATA\\WORLDS.VDF" then
			if hash ~= "45c7e412604304664314b7a0fd139e4f" then
				SendPlayerMessage(playerid, 255, 0, 0, "Posiadasz nieprawid³owy plik WORLDS.VDF");
				SendPlayerMessage(playerid, 255, 0, 0, "Zg³oœ siê na forum po poprawny ;)");
				_Kick(playerid);
			end
		elseif pathFile == "DATA\\WORLDS_ADDON.VDF" then
			if hash ~= "b70b2bd0ffe55d1d07ee79c980a3444a" then
				SendPlayerMessage(playerid, 255, 0, 0, "Posiadasz nieprawid³owy plik WORLDS_ADDON.VDF");
				SendPlayerMessage(playerid, 255, 0, 0, "Zg³oœ siê na forum po poprawny ;)");
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
		if world ~= "KYRMIR.ZEN" then
			SendPlayerMessage(playerid, 255, 255, 0, "Zakaz zmieniania mapy. ¯egnamy!");
			makeBanWithReason(playerid, "Zmiana mapy", "Anty-World-Change");
			LogString("Logs_ChangeWorld",GetPlayerName(playerid).." "..world);
		else
			if not(checkBan(playerid)) then
				FreezePlayer(playerid, 1);
				SetPlayerPos(playerid, 992.57830810547, 897.88537597656, -3209.0400390625);
				SetPlayerAngle(playerid, 181);
			end
		end
		
		if GetAccount(playerid) == false then
			SendPlayerMessage(playerid, 255, 255, 0, "Zarejestruj sie na forum!");
			_Kick(playerid); --przed kickiem pojawi mu siê draw ¿eby siê zarejestrowa³, dziêki opcji wy¿ej ;P
		end
	end
end

function OnPlayerEnterWorld(playerid, world)
	if IsNPC(playerid) == 0 then
		if world == "KYRMIR.ZEN" then
			FreezePlayer(playerid, 1);
			SetPlayerPos(playerid, 992.57830810547, 897.88537597656, -3209.0400390625);
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
		
		SendMessageToAll(255, 0, 0, GetPlayerName(playerid).." roz³¹czy³(a) siê z serwerem.");
		
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
		
		SendMessageToAll(255, 0, 0, GetPlayerName(playerid).." utraci³(a) po³¹czenie.");
	
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
		
		SendMessageToAll(255, 0, 0, GetPlayerName(playerid).." roz³¹czy³(a) siê z serwerem.");
	
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
		
		SendMessageToAll(255, 0, 0, GetPlayerName(playerid).." roz³¹czy³(a) siê z serwerem.");
	end
	
	restart_ac(playerid); --czeba restartowaæ AC xD
	restartGold(playerid);
	restarTrade(playerid);
	DestroyGoldTrade(playerid);
	DestroyTrade(playerid);
	--delOnlineRunner(playerid);
	MySQL_MakeOffline(playerid);
end

function OnPlayerCommandText(playerid, cmdtext)
	local cmd, params = GetCommand(cmdtext);
	
	if cmd == "/zaloguj" then
		MySQL_Login(playerid, params);
	elseif cmdtext == "/gexit" then
		PartyExit(playerid);
	elseif cmd == "/gkick" then
		PartyKick(playerid, params);
	elseif cmdtext == "/gjoin" then
		if Player[playerid].Timer_Party ~= -1 then
			if Player[playerid].Party ~= -1 then
				ClearGametext(playerid, Player[playerid].Party);
				KillTimer(Player[playerid].Timer_Party);
				PartyJoin(playerid, Player[playerid].Party);
				ClearParty(playerid);
			end
		end
	elseif cmdtext == "/q" then
		if GetPlayerLoggedIn(playerid) == false then
			ExitGame(playerid);
		end
	elseif cmdtext == "/greject" then
		if Player[playerid].Party ~= -1 then
			InviteToPartyOff(playerid);
		end
	elseif cmdtext == "/pvp" then
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
	elseif cmdtext == "/pvpreject" then
		if Player[playerid].PVP ~= -1 then
			InviteToPVPOff(playerid);
		end
	elseif cmdtext == "/kop" then
		Kop(playerid);
	elseif cmdtext == "/gchatoff" then
		WylaczCzatGlobalny(playerid);
	elseif cmdtext == "/chatoff" then
		WylaczCzat(playerid);
	elseif cmd == "/g" then
		GlobalChat(playerid, params);
	elseif cmd == "/h" then
		StartPlayersTade(playerid, GetFocus(playerid), params);
	elseif cmd == "/gh" then
		GoldTrade(playerid, GetFocus(playerid), params);
	elseif cmdtext == "/gagree" then
		AcceptGoldTrade(playerid);
	elseif cmdtext == "/patrzgold" then
		if IsPlayerAdmin(playerid) == 1 then
			SendPlayerMessage(playerid, 255, 0, 0, GetPlayerName(GetFocus(playerid)).." ma: "..GetPlayerGold(GetFocus(playerid)).." golda.");
		end
	elseif cmdtext == "/agree" then
		TradeAccept(playerid);
	elseif cmd == "/mute" then
		Mute(playerid, params);
	elseif cmd == "/unmute" then
		UnMute(playerid, params);
	--[[elseif cmd == "/postime" then
		ChangeTimeCheck(params, playerid);
	elseif cmdtext == "/checktime" then
		ShowTimeCheck(playerid);]]
	elseif cmdtext == "/restart" then
		if IsPlayerAdmin(playerid) == 1 then
			if Start_Restart == false then
				for i = 0, GetMaxPlayers() - 1 do
					if IsPlayerConnected(i) == 1 then
						ShowDraw(i, Restart_Draw);
					end
				end
				Start_Restart = true;
			end
		end
	elseif cmd == "/p" then
		ChatGroup(playerid, params);
	elseif cmd == "/tpp" then
		if IsPlayerVIP(playerid) == 1 then
			TeleportujVipa(playerid, params);
		else
			SendPlayerMessage(playerid, 255, 0, 0, "Nie jesteœ vipem!");
		end
	elseif cmd == "/atp" then
		if Player[playerid].kto ~= nil then
			local x,y,z = GetPlayerPos(playerid);
			SetPlayerPos(Player[playerid].kto, x, y,z);
			SendPlayerMessage(playerid, 0, 255, 0, "Teleportacja udana!");
			SendPlayerMessage(Player[playerid].kto, 0, 255, 0, "Teleportacja udana!");
			Player[Player[playerid].kto].prosba = false;
			Player[playerid].kto = nil;
		end
	elseif cmd == "/otp" then
		if Player[playerid].kto ~= nil then
			SendPlayerMessage(playerid, 0, 255, 0, "Pomyœlnie odrzuci³eœ proœbê o teleportacje od gracza "..GetPlayerName(Player[playerid].kto));
			SendPlayerMessage(Player[playerid].kto, 255, 0, 0, "Twoja proœba o teleportacje do "..GetPlayerName(playerid).." zosta³a odrzucona!");
			Player[Player[playerid].kto].prosba = false;
			Player[playerid].kto = nil;
		end
	--ADMIN
		elseif cmdtext == "/ahelp" then
		CMD_AdminHelp(playerid);

	elseif cmd == "/kick" then
		CMD_Kick(playerid,params);

	elseif cmd == "/ban" then
		CMD_Ban(playerid,params);

	elseif cmd == "/kill" then
		CMD_Kill(playerid,params);

	elseif cmd == "/tp" then
		CMD_Teleport(playerid,params);

	elseif cmd == "/giveitem" then
		CMD_GiveItem(playerid,params);
	
	elseif cmd == "/givegold" then
		CMD_GiveGold(playerid, params);
	
	elseif cmd == "/time" then
		CMD_Time(playerid,params);

	elseif cmd == "/serv" then
		ServMSG(playerid, params);
				
	elseif cmd == "/tpall" then
	
		CMD_TPAll(playerid, params);
		
	elseif cmd == "/scale" then
	
		CMD_Scale(playerid, params);
	
	elseif cmd == "/name" then
		CMD_Name(playerid,params);
	
	elseif cmd == "/color" then
		CMD_Color(playerid,params);
	elseif cmd == "/sertes22" then
		SendPlayerMessage(playerid, 255, 0, 0, "dupa!");
		local result, dds = sscanf(params, "d");
		local dds = 2;
		if result == 1 then
			SendPlayerMessage(playerid, 255, 0, 0, "rrrs");
			SetCameraBehindPlayer(playerid,dds);
		end
	elseif cmd == "/sertes33" then
		SendPlayerMessage(playerid, 255, 0, 0, "dupencja!");
		SetDefaultCamera(playerid);
	elseif cmd == "/sertes44" then
		local dup = GetFocus(playerid);
		if dup ~= -1 then
		SetCameraBehindPlayer(playerid,dup);
		end
	elseif cmd == "/reloadbans" then
		reloadBans(playerid); -- prze³adowanie banlisty(w sensie tablicy przechowuj¹cej bany)
	elseif cmd == "/aww" then
		DestroyTrade(playerid);
		DestroyGoldTrade(playerid);
		ExitGame(playerid);
	end
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
				SendMessageToAll(255,0,0, GetPlayerName(playerid).." to cziter i dosta³ bana ;)");
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
				SendPlayerMessage(playerid,0,255,0, "Chat globalny zosta³ pomyœlnie wy³¹czony!");
			else
				Player[playerid].gchat = true;
				SendPlayerMessage(playerid,0,255,0, "Chat globalny zosta³ pomyœlnie w³¹czony!");
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
				SendPlayerMessage(playerid,0,255,0, "Chat zosta³ pomyœlnie wy³¹czony!");
			else
				Player[playerid].chat = true;
				SendPlayerMessage(playerid,0, 255,0, "Chat zosta³ pomyœlnie w³¹czony!");
			end
		end
	end
end

function TeleportujVipa(playerid, params)
	if IsNPC(playerid) == 0 then
		local result, id = sscanf(params, "d");
		if result == 1 then
			if IsNPC(id) == 0 then
				SendPlayerMessage(id, 0, 255, 0, GetPlayerName(playerid).." prosi ciebie o teleportacje");
				SendPlayerMessage(id, 0, 255, 0, "Wpisz /atp, aby zaakcpetowaæ proœbê, lub /otp aby odrzuciæ");
				Player[playerid].prosba = true; --wys³a³ prosbe
				Player[id].kto = playerid;
				SendPlayerMessage(playerid, 0, 255, 0, "proœba zosta³a wys³ana pomyœlnie");
			end
		end
	end
end

function OnPlayerDeath(playerid, p_classid, killerid, k_classid)
	if IsNPC(playerid) == 0 then
		if GetPlayerWorld(playerid) ~= "KYRMIR.ZEN" then
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
	if GetPlayerWorld(playerid) ~= "KYRMIR.ZEN" then
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
					
					--[[if GetPlayerWorld(playerid) ~= "KYRMIR.ZEN" then
						SendPlayerMessage(playerid, 255, 0, 0, "Poczekaj na zmiane mapy ;)");
						_Kick(playerid);
					end]]
				--[[elseif keyDown == KEY_RSHIFT then
					if GetPlayerWorld(playerid) ~= "KYRMIR.ZEN" then
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
								GameTextForPlayer(playerid, 2800, 3500, "Twoje rany zosta³y wyleczone!","Font_Old_20_White_Hi.TGA", 0, 255, 0, 1000);
							else
								GameTextForPlayer(playerid, 3200, 3500, "Brakuje z³ota","Font_Old_20_White_Hi.TGA", 255, 255, 255, 500);
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
								
								GameTextForPlayer(playerid, 2800, 3500, "Brak Polowañ","Font_Old_20_White_Hi.TGA", 255, 0, 0, 1500);
							end
						elseif GetPlayerActiveMenu(playerid, Menu_Game) == GetMenuMaxOptions(Menu_Game) then
							
							HideMenu(playerid, Menu_Game);
							
							if checkMySQLConnection() == true then
							
								MySQL_Save(playerid);
								ResetPlayerLoggedIn(playerid);
								Player[playerid].Exiting = true;
								GameTextForPlayer(playerid, 2800, 3500, "Wylogowanie nast¹pi po 5 sek.","Font_Old_20_White_Hi.TGA", 255, 0, 0, 5000);
								DestroyTrade(playerid);
								DestroyGoldTrade(playerid);
								SetTimerEx("ExitGame_Player", 5000, 0, playerid);
								
							else
								
								SendPlayerMessage(playerid, 0, 255, 0, "MySQL utraci³ po³¹czenie. £¹czenie ponowne...");
								SendPlayerMessage(playerid, 0, 255, 0, "Spróbuj wyjœæ za kilka sekund.");
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
											
											GameTextForPlayer(playerid, 2100, 3500, "Ten gracz ju¿ zosta³ wyzwany","Font_Old_20_White_Hi.TGA", 255, 0, 0, 1500);
											
										end
										
									else 
										
										GameTextForPlayer(playerid, 2100, 3500, "Ten gracz ju¿ z kimœ walczy!","Font_Old_20_White_Hi.TGA", 255, 0, 0, 1500);
									
									end
									
								else
									
									GameTextForPlayer(playerid, 2100, 3500, "Na nikogo nie wskazujesz!","Font_Old_20_White_Hi.TGA", 255, 0, 0, 1500);
									
								end
								
							else
								
								HidePlayerMenu(playerid);
								GameTextForPlayer(playerid, 2100, 3500, "Aktualnie jesteœ w trakcie pojedynku!","Font_Old_20_White_Hi.TGA", 255, 0, 0, 1500);
								
							end
					
						elseif GetPlayerActiveMenu(playerid, Menu_Player) == 1 then
						
							if GetPlayerParty(GetFocus(playerid)) == false then
								
								HidePlayerMenu(playerid);
								
								if Player[GetFocus(playerid)].Party == -1 then
									
									SendPlayerInviteToParty(playerid, GetFocus(playerid));
									
								else
									
									GameTextForPlayer(playerid, 1900, 3500, "Ten gracz zosta³ zaproszony do innej grupy","Font_Old_20_White_Hi.TGA", 255, 0, 0, 1500);
									
								end
								
							elseif GetPlayerParty(GetFocus(playerid)) == true then
												
								GameTextForPlayer(playerid, 2100, 3500, "Ten gracz aktualnie posiada grupe","Font_Old_20_White_Hi.TGA", 255, 0, 0, 1500);
							
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
					SendPlayerMessage(playerid, 255, 0, 0, "Wypieprzaj oszuœcie!");
					Ban(playerid, 1);
					SendMessageToAll(255, 0, 0, GetPlayerName(playerid).." próbowa³ handlowaæ przywo³anym przez czit przedmiotem.");
					SendMessageToAll(255, 0, 0, "I zosta³ chuj pomyœlnie zbanowany!");
					LogString("cziterzy", GetPlayerName(playerid).." chcia³ sprzedac przedmiot którego nie ma w EQ...");
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
			SendPlayerMessage(playerid, 255, 0, 0, "Nie mo¿na podnosiæ przedmiotów z ziemi, ani braæ ich ze skrzyñ!");
		end]]
		--LogString("Logs_TakeItem", GetPlayerName(playerid));
		--Ban(playerid);
		--makeBanWithReason(playerid, "Podnoszenie niezsynchronizowanych przedmiotów", "Anty-Item-Take");
		--Kick(playerid);
		if string.upper(itemInstance) ~= "ITMI_GOLD" then
			SendPlayerMessage(playerid, 255, 0, 0, "Ten item jest niezsynchronizowany ;)");
			SendPlayerMessage(playerid, 255, 0, 0, "Jeœli jakimœ cudem doda³o ci go do EQ - Nie polecam nim handlowaæ.");
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
								--SendPlayerMessage(i,230,230,230,string.format("%s %s %s",GetPlayerName(playerid),"mówi:",text));
								SendPlayerMessage(i,230,230,230, GetPlayerName(playerid).." (ID: "..playerid..")".." mówi: "..text);
							end
						end
					end
				end
			end
		end
		LogString("Logs_Czat", ""..GetPlayerName(playerid).." mówi: "..text.."");
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

	GameTextForPlayer(playerid, 2100, 3500, "Wys³ano zaproszenie do grupy","Font_Old_20_White_Hi.TGA", 0, 255, 0, 4000);
	GameTextForPlayer(focusid, 2100, 3500, ""..GetPlayerName(playerid).." zaprasza Ciê do grupy.","Font_Old_20_White_Hi.TGA", 0, 255, 0, 10000);
	Player[focusid].Timer_Party = SetTimerEx("InviteToPartyOff", 10000, 0, focusid);
	Player[focusid].Party = playerid;

end

function SendPlayerInviteToPVP(playerid, focusid)

	GameTextForPlayer(playerid, 2100, 3500, "Wyzwa³eœ "..GetPlayerName(focusid).." na pojedynek!","Font_Old_20_White_Hi.TGA", 0, 255, 0, 4000);
	GameTextForPlayer(focusid, 2100, 3500, ""..GetPlayerName(playerid).." wyzywa na pojedynek!","Font_Old_20_White_Hi.TGA", 0, 255, 0, 10000);
	Player[focusid].Timer_PVP = SetTimerEx("InviteToPVPOff", 10000, 0, focusid);
	Player[focusid].PVP = playerid;
	Player[playerid].PVP = focusid;

end

function InviteToPartyOff(playerid)
	
	if Player[playerid].Timer_Party ~= -1 then
	
		KillTimer(Player[playerid].Timer_Party);
	
	end
	
	GameTextForPlayer(playerid, 2300, 3500, "Odrzucono zaproszenie","Font_Old_20_White_Hi.TGA", 255, 0, 0, 1500);
	GameTextForPlayer(Player[playerid].Party, 2300, 3500, "Odrzucono zaproszenie","Font_Old_20_White_Hi.TGA", 255, 0, 0, 1500);
	Player[playerid].Party = -1;
	Player[playerid].Timer_Party = -1;

end

function InviteToPVPOff(playerid)
	
	if Player[playerid].Timer_PVP ~= -1 then
	
		KillTimer(Player[playerid].Timer_PVP);
	
	end
	
	GameTextForPlayer(playerid, 2300, 3500, "Odrzucono wyzwanie","Font_Old_20_White_Hi.TGA", 255, 0, 0, 1500);
	GameTextForPlayer(Player[playerid].PVP, 2300, 3500, "Odrzucono wyzwanie","Font_Old_20_White_Hi.TGA", 255, 0, 0, 1500);
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
				SendPlayerMessage(killerid, 255, 255, 0, "Innos zsy³a na Ciebie kare!");
			
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
	CheckNPCPos();

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
	
		GameTextForPlayer(playerid, 3000, 3500, "Nieudane wykopaliska!","Font_Old_20_White_Hi.TGA", 255, 0, 0, 1000);
		
	elseif rand == 1 then
	
		GameTextForPlayer(playerid, 3000, 3500, "Otrzymano: "..rand.." bry³kê.","Font_Old_20_White_Hi.TGA", 0, 255, 0, 1000);
		GiveItem(playerid, "ITFO_FISH", rand);
		
	else
	
		GameTextForPlayer(playerid, 3000, 3500, "Otrzymano: "..rand.." bry³kê.","Font_Old_20_White_Hi.TGA", 0, 255, 0, 1000);
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
					
					if name == "Profesores" or name == "Kimior" or name == "Fingers" then
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
					if name == "Profesores" or name == "Kimior" or name == "Fingers" then
						for i = 0, GetMaxPlayers() - 1 do
							if IsNPC(i) == 0 and IsPlayerConnected(i) == 1 then
								if Player[i].gchat == true then
									SendPlayerMessage(i, 255, 25, 15, GetPlayerName(playerid).." (ID: "..playerid.."): "..message);
								end
							end
						end
						LogString("Logs_Czat", ""..GetPlayerName(playerid)..": "..message.."");
					else
				
					SendPlayerMessage(playerid, 255, 0, 0, "Nie mo¿esz wys³aæ kolejnej wiadomoœci w tak krótkim czasie.");
					end
				
				end
				
			else
			
				SendPlayerMessage(playerid, 255, 0, 0, "Zosta³eœ wyciszony na globalnym czacie.");
			
			end
		
		else
		
			SendPlayerMessage(playerid, 255, 0, 0, "Wpisz /g (wiadomoœæ)");
		
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

			SendPlayerMessage(playerid, 255, 255, 0, "W zamku agresja jest zabroniona !");
			SetPlayerWeaponMode(playerid, WEAPON_NONE);
		
		elseif weaponmode == 3 then

			SendPlayerMessage(playerid, 255, 255, 0, "Nie wyci¹gaj broni w zamku !");
			SetPlayerWeaponMode(playerid, WEAPON_NONE);

		elseif weaponmode == 4 then

			SendPlayerMessage(playerid, 255, 255, 0, "Nie wyci¹gaj broni w zamku !");
			SetPlayerWeaponMode(playerid, WEAPON_NONE);		

		elseif weaponmode == 5 then

			SendPlayerMessage(playerid, 255, 255, 0, "Nie wyci¹gaj broni w zamku !"); 
			SetPlayerWeaponMode(playerid, WEAPON_NONE);

		elseif weaponmode == 6 then

			SendPlayerMessage(playerid, 255, 255, 0, "Nie wyci¹gaj broni w zamku !"); 
			SetPlayerWeaponMode(playerid, WEAPON_NONE);

		elseif weaponmode == 7 then
		
			SendPlayerMessage(playerid, 255, 255, 0, "Nie wyci¹gaj broni w zamku !"); 
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
			SendPlayerMessage(playerid, 0, 255, 0, "Wyciszy³eœ "..GetPlayerName(id).."");
			SendPlayerMessage(id, 0, 255, 0, "Zosta³eœ wyciszony przez "..GetPlayerName(playerid).."");
		
		end
	
	end

end

function UnMute(playerid, params)

	if IsPlayerAdmin(playerid) == 1 then
	
		local result, id = sscanf(params, "d");
		
		if result == 1 then
		
			Player[id].Mute = false;
			SendPlayerMessage(playerid, 0, 255, 0, "Odciszy³eœ "..GetPlayerName(id).."");
			SendPlayerMessage(id, 0, 255, 0, "Zosta³eœ odciszony przez "..GetPlayerName(playerid).."");
		
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
		UpdateDraw(Restart_Draw, 1500, 3300, "Restart nast¹pi za: "..Restart.."","Font_Old_20_White_Hi.TGA", 255, 0, 0);
		print("Restart za: "..Restart.."");
		
		if Restart == 0 then
			
			Restart = 60;
			Start_Restart = false;
			
			for i = 0, GetMaxPlayers() - 1 do
			
				if IsPlayerConnected(i) == 1 then
				
					HideDraw(i, Restart_Draw);
				
				end
			
			end
			
			UpdateDraw(Restart_Draw, 1500, 3300, "Restart nast¹pi za: 60","Font_Old_20_White_Hi.TGA", 255, 0, 0);
			
		end
	
	end

end

function CheckPlayerPrayer(playerid)

	if GetPlayerAnimationID(playerid) == 210 then
	
		if Player[playerid].Pray == false then
		
			UpdatePlayerDraw(playerid, Player[playerid].FreeDraw, 2950, 6850, "Cena: "..((GetMaxHealth(playerid)-GetPlayerHealth(playerid))*0.80).."", "Font_Old_10_White_Hi.TGA", 255, 255, 255);
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
	SendMessageToAll(255,0,0, GetPlayerName(playerid).." to cziter i dosta³ bana ;)");
	Ban(playerid, 1);
	--Kick(playerid);
	LogString("Logs_Cheaters", GetPlayerName(playerid).." "..bloczek.." "..starawartosc.." "..nowawartosc);
end