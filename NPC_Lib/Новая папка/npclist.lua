require "NPC_Lib/trening"
require "NPC_Lib/trade"
require "NPC_Lib/tp"

local NPC = { TP = {} };

function SpawnNPC()

	NPC.Farim = AddNPC("Фарим", 3664.3010253906, 454.35369873047, -475.42483520508, 132, "ITAR_PAL_M", "ItMw_FrancisDagger_Mis", "ItRw_Crossbow_H_02", "S_HGUARD", "Hum_Body_Naked0", 2, "Hum_Head_Pony", 104, "KYRMIR.ZEN");
	NPC.Blyth = AddNPC("Блитз", 446.30444335938, 348.87619018555, 2316.92578125, 207, "ITAR_LEATHER_L", "ITMW_1H_SWORD_L_03", "ITRW_BOW_M_01", "S_LGUARD", "Hum_Body_Naked0", 26, "Hum_Head_Pony", 104, "KYRMIR.ZEN");
	NPC.Will = AddNPC("Вилл", -16.403942108154, 223.79046630859, 739.87188720703, 160, "ITAR_DJG_L", "ItMw_FrancisDagger_Mis", "ItRw_Bow_H_04", "S_LGUARD", "Hum_Body_Naked0", 2, "Hum_Head_BALD", 95, "KYRMIR.ZEN");

	--NPC.Bob = AddNPC("Боб", -10126.669921875, 200.03742218018, -19527.0703125, 120, "ITAR_BAU_L", "ItMw_1h_Bau_Axe", "", "S_RUN", "Hum_Body_Naked0", 4, "Hum_Head_FatBald", 136, "KYRMIR.ZEN");
	--NPC.Fred = AddNPC("Фред", -9081.962890625, 217.50938415527, -18284.45703125, 14, "ITAR_BAU_M", "ITMW_1H_BAU_MACE", "", "S_LGUARD", "Hum_Body_Naked0", 2, "Hum_Head_Bald", 80, "KYRMIR.ZEN");
	NPC.Eowina = AddNPC("Аннет", -3217.0178222656, 148.23522949219, -1902.5109863281, 273, "ITAR_BauBabe_L", "ItMw_1h_Bau_Axe", "", "S_STOVE_S1", "Hum_Body_Babe0", 6, "Hum_Head_Babe", 138, "KYRMIR.ZEN");
	SetPlayerWeaponMode(NPC.Eowina, WEAPON_1H);

	-----zamek-----
	NPC.Tyrion = AddNPC("Тирион", 433.15853881836, 247.73025512695, 1203.2509765625, 307, "ITAR_VLK_L", "ItMw_FrancisDagger_Mis", "", "S_LGUARD", "Hum_Body_Naked0", 2, "Hum_Head_Bald", 43, "KYRMIR.ZEN");
	NPC.Eomer = AddNPC("Йомер", -4904.4272460938, -312.60787963867, -3352.5693359375, 340, "ITAR_PAL_M", "ItMw_1h_Pal_Sword", "", "T_search", "Hum_Body_Naked0", 2, "Hum_Head_FatBald", 114, "KYRMIR.ZEN");
	NPC.Brandon = AddNPC("Брэндон", 1326.7355957031, 248.09197998047, 620.65490722656, 146, "ITAR_SMITH", "ItMw_1H_Mace_L_04", "", "S_BSANVIL_S1", "Hum_Body_Naked0", 1, "Hum_Head_Bald", 46, "KYRMIR.ZEN");
	SetPlayerWeaponMode(NPC.Brandon, WEAPON_1H);
	NPC.Bethan = AddNPC("Безан", 1012.2388305664, 344.84603881836, -1342.1375732422, 359, "ITAR_KDF_H", "ItMW_Addon_Stab02", "", "S_LGUARD", "Hum_Body_Naked0", 2, "Hum_Head_Pony", 130, "KYRMIR.ZEN");
	NPC.Cross = AddNPC("Кросс", 2160.2995605469, 248.19995117188, 336.73760986328, 190, "ITAR_PAL_M", "ItMw_FrancisDagger_Mis", "ItRw_Crossbow_H_02", "S_LGUARD", "Hum_Body_Naked0", 2, "Hum_Head_Pony", 64, "KYRMIR.ZEN");
	NPC.Hagan = AddNPC("Хаган", -675.79534912109, 247.70199584961, 1.5098875761032, 91, "ITAR_MIL_L", "ITMW_SCHWERT1", "", "S_LGUARD", "Hum_Body_Naked0", 2, "Hum_Head_Bald", 1, "KYRMIR.ZEN");
	NPC.Guy = AddNPC("Гай", -4643.3208007812, -283.47695922852, -2245.6696777344, 29, "ITAR_MIL_L", "ITMW_2H_PAL_SWORD", "", "S_LGUARD", "Hum_Body_Naked0", 2, "Hum_Head_Pony", 65, "KYRMIR.ZEN");
	NPC.Brain = AddNPC("Брайан", -4519.8525390625, -151.80868530273, -414.53967285156, 107, "ITAR_PAL_M", "ItMw_2h_Pal_Sword", "", "S_LGUARD", "Hum_Body_Naked0", 2, "Hum_Head_Pony", 66, "KYRMIR.ZEN");
	NPC.Nieznajomy = AddNPC("Коркалам", 1330.5307617188, 345.74334716797, -3387.4819335938, 181, "ITAR_SMITH", "", "", "S_LAB_S1", "Hum_Body_Naked0", 1, "Hum_Head_Bald", 31, "KYRMIR.ZEN");
	NPC.Regin = AddNPC("Регин", 2859.4909667969, 248.18772888184, 157.05989074707, 174, "ITAR_MIL_L", "ItMw_1h_Pal_Sword", "", "T_SEARCH", "Hum_Body_Naked0", 2, "Hum_Head_Bald", 26, "KYRMIR.ZEN");
	--NPC.Magnus = AddNPC("Магнус", -1051.0052490234, 98.178428649902, 5522.8081054688, 146, "ITAR_KDW_H", "", "", "S_LGUARD", "Hum_Body_Naked0", 2, "Hum_Head_Pony", 52, "KYRMIR.ZEN");
	NPC.Fagar = AddNPC("Фагар", -405.00778198242, 347.70385742188, 2664.8015136719, 359, "ITAR_VLK_H", "", "", "S_LGUARD", "Hum_Body_Naked0", 4, "Hum_Head_Bald", 84, "KYRMIR.ZEN");
	-- Jpe gerald zyskuje nowa role
	NPC.Gerald = AddNPC("Геральд", -849.43017578125, 247.73121643066, 1203.8854980469, -3, "ITAR_VLK_H", "", "", "S_HGUARD", "Hum_Body_Naked0", 6, "Hum_Head_Bald", 124, "KYRMIR.ZEN");
	NPC.Vasilas = AddNPC("Василий", -1262.3657226562, 243.33187866211, 1429.6555175781, 89, "ITAR_VLK_H", "", "", "S_HGUARD", "Hum_Body_Naked0", 6, "Hum_Head_Bald", 124, "KYRMIR.ZEN");
	NPC.Urgan = AddNPC("Урган", -1106.9105224609, 247.71984863281, 2384.1872558594, 177, "ITAR_VLK_H", "", "", "S_HGUARD", "Hum_Body_Naked0", 6, "Hum_Head_Bald", 124, "KYRMIR.ZEN");
	NPC.Rudin = AddNPC("Рудин", -11.413331031799, 247.92950439453, -1385.8715820312, 42, "HUM_KYRMIR31", "", "ItMw_2h_Pal_Sword", "S_HGUARD", "Hum_Body_Naked0", 2, "Hum_Head_Bald", 86, "KYRMIR.ZEN");	
	NPC.Nefarus = AddNPC("Нефариус", -2027.0030517578, 248.24755859375, -1988.3745117188, 359, "ITAR_VLK_H", "", "", "S_HGUARD", "Hum_Body_Naked0", 6, "Hum_Head_Bald", 124, "KYRMIR.ZEN");
	
	-----zamek-----
	NPC.Rafer = AddNPC("Рафер", 985.5478515625, 247.85075378418, 998.18194580078, 309, "ITAR_SMITH", "ItMw_1H_Mace_L_04", "", "S_BSFIRE_S1", "Hum_Body_Naked0", 2, "Hum_Head_Thief", 57, "KYRMIR.ZEN");
	SetPlayerWeaponMode(NPC.Rafer, WEAPON_1H);
	NPC.Jenifer = AddNPC("Дженнифер", -3107.0656738281, 49.205837249756, -3201.2966308594, 87, "ITAR_PAL_H", "ItMw_2H_Blessed_02", "", "S_HGUARD", "Hum_Body_Babe0", 6, "Hum_Head_Babe", 137, "KYRMIR.ZEN");
	NPC.Dirkland = AddNPC("Диркланд", 2806.5300292969, 244.85255432129, -1549.7038574219, 330 , "ITAR_PAL_M", "ITMW_ELBASTARDO", "", "T_1HSFREE", "Hum_Body_Naked0", 11, "Hum_Head_Bald", 9, "KYRMIR.ZEN");
	SetPlayerWeaponMode(NPC.Dirkland, WEAPON_1H);
	NPC.Greth = AddNPC("Грет", -427.68786621094, 237.51821899414, -1031.646484375, 43, "ITAR_CORANGAR", "ItMw_Zweihaender4", "", "S_LGUARD", "Hum_Body_Naked0", 11, "Hum_Head_FatBald", 2, "KYRMIR.ZEN");
	NPC.Cahan = AddNPC("Кахан", -2047.8784179688, 786.16918945312, -2325.2336425781, 6, "ITAR_PAL_M", "ItMw_2h_Pal_Sword", "ItRw_Crossbow_M_02", "S_LGUARD", "Hum_Body_Naked0", 3, "Hum_Head_FatBald", 123, "KYRMIR.ZEN");

	-----GD------
	--NPC.Cheamel = AddNPC("Чимел", 0, 350, 0, 266, "ITAR_MIL_M", "ItMw_Addon_BanditTrader", "", "S_RUN", "Hum_Body_Naked0", 3, "Hum_Head_FatBald", 123, "KYRMIR.ZEN");
	
	----Монастырь----
	
	--NPC.Garik = AddNPC("Гарик", 778.11822509766, 347.59741210938, -3350.1037597656, 140, "ITAR_KDF_L", "", "", "S_BOOK_S1", "Hum_Body_Naked0", 1, "Hum_Head_Pony", 93, "KYRMIR.ZEN");
	
	-----TP------
	--Монастырь
	--[[NPC.TP[1] = AddNPC("Телепортер", 47202.11328125, 4990.96875, 18054.1640625, 282, "ITAR_DEMENTOR", "ItMw_Addon_BanditTrader", "", "S_LGUARD", "Hum_Body_Naked0", 3, "Hum_Head_FatBald", 123, "KYRMIR.ZEN");
	--Okolice Latarni Morskiej
	NPC.TP[2] = AddNPC("Телепортер", 4236.4760742188, 2981.2963867188, 25280.318359375, 102, "ITAR_DEMENTOR", "ItMw_Addon_BanditTrader", "", "S_LGUARD", "Hum_Body_Naked0", 3, "Hum_Head_FatBald", 123, "KYRMIR.ZEN");
	--К Хоринису
	NPC.TP[3] = AddNPC("Телепортер", 1400.4260253906, 409.82638549805, 3983.7099609375, 282, "ITAR_DEMENTOR", "ItMw_Addon_BanditTrader", "", "S_LGUARD", "Hum_Body_Naked0", 3, "Hum_Head_FatBald", 123, "KYRMIR.ZEN");
	--Около фермы Лобарта
	NPC.TP[4] = AddNPC("Телепортер", 12730.499023438, 1641.9216308594, -23140.955078125, 356, "ITAR_DEMENTOR", "ItMw_Addon_BanditTrader", "", "S_LGUARD", "Hum_Body_Naked0", 3, "Hum_Head_FatBald", 123, "KYRMIR.ZEN");
	--На ферму Акила
	NPC.TP[5] = AddNPC("Телепортер", 30450.845703125, 2663.5402832031, 20661.509765625, 109, "ITAR_DEMENTOR", "ItMw_Addon_BanditTrader", "", "S_LGUARD", "Hum_Body_Naked0", 3, "Hum_Head_FatBald", 123, "KYRMIR.ZEN");
	--К дороге к монастырю
	NPC.TP[6] = AddNPC("Телепортер", 37131.33984375, 3393.6225585938, 2561.0395507812, 132, "ITAR_DEMENTOR", "ItMw_Addon_BanditTrader", "", "S_LGUARD", "Hum_Body_Naked0", 3, "Hum_Head_FatBald", 123, "KYRMIR.ZEN");
	--К таверне "Мертвая гарпия"
	NPC.TP[7] = AddNPC("Телепортер", 31185.361328125, 4224.5971679688, -5553.8950195313, 220, "ITAR_DEMENTOR", "ItMw_Addon_BanditTrader", "", "S_LGUARD", "Hum_Body_Naked0", 3, "Hum_Head_FatBald", 123, "KYRMIR.ZEN");
	--Okolice Przeікczy
	NPC.TP[8] = AddNPC("Телепортер", 45618.859375, 2978.08203125, -26747.21875, 106, "ITAR_DEMENTOR", "ItMw_Addon_BanditTrader", "", "S_LGUARD", "Hum_Body_Naked0", 3, "Hum_Head_FatBald", 123, "KYRMIR.ZEN");
	--К башне Декстера
	NPC.TP[9] = AddNPC("Телепортер", 64652.234375, 2469.326171875, -18583.4140625, 163, "ITAR_DEMENTOR", "ItMw_Addon_BanditTrader", "", "S_LGUARD", "Hum_Body_Naked0", 3, "Hum_Head_FatBald", 123, "KYRMIR.ZEN");
	--К ферме Онара
	NPC.TP[10] = AddNPC("Телепортер", 62718.5078125, 1899.5607910156, 7684.1196289063, 230, "ITAR_DEMENTOR", "ItMw_Addon_BanditTrader", "", "S_LGUARD", "Hum_Body_Naked0", 3, "Hum_Head_FatBald", 123, "KYRMIR.ZEN");
	--К заброшенному лагерю
	NPC.TP[11] = AddNPC("Teleporter", 48583.47265625, 3699.1018066406, 11292.814453125, 109, "ITAR_DEMENTOR", "ItMw_Addon_BanditTrader", "", "S_LGUARD", "Hum_Body_Naked0", 3, "Hum_Head_FatBald", 123, "KYRMIR.ZEN");
	--К мосту, перед бандитами
	NPC.TP[12] = AddNPC("Teleporter", 59281.765625, 3187.3981933594, 11460.61328125, 310, "ITAR_DEMENTOR", "ItMw_Addon_BanditTrader", "", "S_LGUARD", "Hum_Body_Naked0", 3, "Hum_Head_FatBald", 123, "KYRMIR.ZEN");
	--К храму Аданоса
	NPC.TP[13] = AddNPC("Teleporter", 70554.8125, 4458.9716796875, 22014.388671875, 43, "ITAR_DEMENTOR", "ItMw_Addon_BanditTrader", "", "S_LGUARD", "Hum_Body_Naked0", 3, "Hum_Head_FatBald", 123, "KYRMIR.ZEN");
	--К яме огненного голема
	NPC.TP[14] = AddNPC("Teleporter", 60329.8359375, 6824.1743164063, 41089.98046875, 326, "ITAR_DEMENTOR", "ItMw_Addon_BanditTrader", "", "S_LGUARD", "Hum_Body_Naked0", 3, "Hum_Head_FatBald", 123, "KYRMIR.ZEN");]]
	
end

local Player = {};
local Texture_Menu_NPC = CreateTexture(1350, 6750, 6800, 8100, "Frame_GMPA.TGA");
local Texture_Handel_NPC = CreateTexture(1800, 1800, 6000, 8000, "Frame_GMPA.TGA");

local GD_Gothic2_Lvl = 25; -- od 25 lvl
local TP_Cost = 12;

function CreatePlayerNPC(playerid)

	local Player = {};
	
	Player.Farim = 0;
	Player.Blyth = 0;
	Player.Will = 0;
	Player.Bob = 0;
	Player.Fred = 0;
	Player.Eowina = 0;
	Player.Tyrion = 0;
	Player.Eomer = 0;
	Player.Brandon = 0;
	Player.Bethan = 0;
	Player.Cross = 0;
	Player.Hagan = 0;
	Player.Guy = 0;
	Player.Brain = 0;
	Player.Nieznajomy = 0;
	Player.Rafer = 0;
	Player.Jenifer = 0;
	Player.Dirkland = 0;
	Player.Greth = 0;
	Player.Cahan = 0;
	Player.Regin = 0;
	Player.Magnus = 0;
	Player.Cheamel = 0;
	Player.Fagar = 0;
	Player.Gerald = 0;
	Player.Vasilas = 0;
	Player.Rudin = 0;
	Player.Urgan = 0;
	Player.Nefarus = 0;
	
	Player.Last_Menu = 0;
	Player.Dialog = false;
	Player.Trening = false;
	Player.Handel = false;
	Player.Set = false;
	Player.TP = false;
	
	Player.Draw = {};
	Player.Draw[0] = CreatePlayerDraw(playerid, 2950, 6850, "| 10 PN | 0 Золото", "Font_Old_10_White_Hi.TGA", 255, 255, 0);
	Player.Draw[1] = CreatePlayerDraw(playerid, 2950, 7050, "| 10 PN | 0 Золото", "Font_Old_10_White_Hi.TGA", 255, 255, 0);
	
	return Player;

end

function NPC_OnPlayerConnect(playerid)

	if IsNPC(playerid) ~= 1 then

		Player[playerid] = CreatePlayerNPC(playerid);
	
	end

end

function GetPlayerDialog(playerid)
	
	return Player[playerid].Dialog;
	
end

function GetHandel(playerid)

	return Player[playerid].Handel;

end

function SetHandel(playerid, set)

	Player[playerid].Handel = set;

end

--NPC Get

function GetFarim(playerid)

	return Player[playerid].Farim;

end

function GetBlyth(playerid)

	return Player[playerid].Blyth;

end

function GetWill(playerid)

	return Player[playerid].Will;

end

function GetBob(playerid)

	return Player[playerid].Bob;

end

function GetFred(playerid)

	return Player[playerid].Fred;

end

function GetEowina(playerid)

	return Player[playerid].Eowina;

end

function GetBrandon(playerid)

	return Player[playerid].Brandon;

end

function GetTyrion(playerid)

	return Player[playerid].Tyrion;

end

function GetEomer(playerid)

	return Player[playerid].Eomer;

end

function GetBethan(playerid)

	return Player[playerid].Bethan;

end

function GetCross(playerid)

	return Player[playerid].Cross;

end

function GetHagan(playerid)

	return Player[playerid].Hagan;

end

function GetGuy(playerid)

	return Player[playerid].Guy;

end

function GetBrain(playerid)

	return Player[playerid].Brain;

end

function GetRafer(playerid)

	return Player[playerid].Rafer;

end

function GetJenifer(playerid)

	return Player[playerid].Jenifer;

end

function GetDirkland(playerid)

	return Player[playerid].Dirkland;

end

function GetGreth(playerid)

	return Player[playerid].Greth;

end

function GetCahan(playerid)

	return Player[playerid].Cahan;

end

function GetRegin(playerid)

	return Player[playerid].Regin;

end

function GetMagnus(playerid)

	return Player[playerid].Magnus;

end

function GetNieznajomy(playerid)

	return Player[playerid].Nieznajomy;

end



--NPC Set

function SetFarim(playerid, set)

	Player[playerid].Farim = set;

end

function SetBlyth(playerid, set)

	Player[playerid].Blyth = set;

end

function SetWill(playerid, set)

	Player[playerid].Will = set;

end

function SetBob(playerid, set)

	Player[playerid].Bob = set;

end

function SetFred(playerid, set)

	Player[playerid].Fred = set;

end

function SetEowina(playerid, set)

	Player[playerid].Eowina = set;

end

function SetBrandon(playerid, set)

	Player[playerid].Brandon = set;

end

function SetTyrion(playerid, set)

	Player[playerid].Tyrion = set;

end

function SetEomer(playerid, set)

	Player[playerid].Eomer = set;

end

function SetBethan(playerid, set)

	Player[playerid].Bethan = set;

end

function SetCross(playerid, set)

	Player[playerid].Cross = set;

end

function SetHagan(playerid, set)

	Player[playerid].Hagan = set;

end

function SetGuy(playerid, set)

	Player[playerid].Guy = set;

end

function SetBrain(playerid, set)

	Player[playerid].Brain = set;

end

function SetRafer(playerid, set)

	Player[playerid].Rafer = set;

end

function SetJenifer(playerid, set)

	Player[playerid].Jenifer = set;

end

function SetDirkland(playerid, set)

	Player[playerid].Dirkland = set;

end

function SetGreth(playerid, set)

	Player[playerid].Greth = set;

end

function SetCahan(playerid, set)

	Player[playerid].Cahan = set;

end

function SetRegin(playerid, set)

	Player[playerid].Regin = set;

end

function SetMagnus(playerid, set)

	Player[playerid].Magnus = set;

end

function SetNieznajomy(playerid, set)

	Player[playerid].Nieznajomy = set;

end

--Menu nauk
local Menu_Trening = {};
Menu_Trening["Skill_1H"] = CreateMenu(2, "(НАЗАД)", Texture_Menu_NPC, 1450, 6850, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "Skill_1H");
Menu_Trening["Skill_2H"] = CreateMenu(2, "(НАЗАД)", Texture_Menu_NPC, 1450, 6850, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "Skill_2H");
Menu_Trening["Skill_Bow"] = CreateMenu(2, "(НАЗАД)", Texture_Menu_NPC, 1450, 6850, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "Skill_Bow");
Menu_Trening["Skill_CBow"] = CreateMenu(2, "(НАЗАД)", Texture_Menu_NPC, 1450, 6850, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "Skill_CBow");
Menu_Trening["Str"] = CreateMenu(2, "(НАЗАД)", Texture_Menu_NPC, 1450, 6850, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "Str");
Menu_Trening["Dex"] = CreateMenu(2, "(НАЗАД)", Texture_Menu_NPC, 1450, 6850, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "Dex");
Menu_Trening["Mana"] = CreateMenu(2, "(НАЗАД)", Texture_Menu_NPC, 1450, 6850, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "Mana");
Menu_Trening["Health"] = CreateMenu(2, "(НАЗАД)", Texture_Menu_NPC, 1450, 6850, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "Health");
Menu_Trening["MagicLvl"] = CreateMenu(1, "(НАЗАД)", Texture_Menu_NPC, 1450, 6850, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "MagicLvl");


function UpdatePlayerDraw_Stat(playerid, _type)
	
	if _type == "Skill" then
	
		UpdatePlayerDraw(playerid, Player[playerid].Draw[0], 2750, 6850, "| 10 PN | "..GetGoldItem( playerid, Player[playerid].Trening, 10 ).." Золото", "Font_Old_10_White_Hi.TGA", 255, 145, 0);
		UpdatePlayerDraw(playerid, Player[playerid].Draw[1], 2750, 7050, "| 5  PN | "..GetGoldItem( playerid, Player[playerid].Trening, 5 ).." Золото", "Font_Old_10_White_Hi.TGA", 255, 145, 0);

	elseif _type == "Statistic" then	
	
		UpdatePlayerDraw(playerid, Player[playerid].Draw[0], 2750, 6850, "| 10 PN | "..GetGoldItem( playerid, Player[playerid].Trening, 1 ).." Золото", "Font_Old_10_White_Hi.TGA", 255, 145, 0);
		UpdatePlayerDraw(playerid, Player[playerid].Draw[1], 2750, 7050, "| 5  PN | "..GetGoldItem( playerid, Player[playerid].Trening, 2 ).." Золото", "Font_Old_10_White_Hi.TGA", 255, 145, 0);
		
	end	
		
end

function UpdateGoldItem(playerid)
	
	UpdatePlayerDraw_Stat(playerid, GetTypeTrening(Player[playerid].Trening));

end

function UpdatePlayerDraw100(playerid)

	UpdatePlayerDraw(playerid, Player[playerid].Draw[0], 2750, 6850, "| Мастер", "Font_Old_10_White_Hi.TGA", 255, 145, 0);
	UpdatePlayerDraw(playerid, Player[playerid].Draw[1], 2750, 7050, "| Мастер", "Font_Old_10_White_Hi.TGA", 255, 145, 0);

end

function ShowCost(playerid, amount)
	
	for i = 0, amount - 1 do
		
		ShowPlayerDraw(playerid, Player[playerid].Draw[i]);
		
	end

end

function HideCost(playerid, amount)

	for i = 0, amount - 1 do
		
		HidePlayerDraw(playerid, Player[playerid].Draw[i]);
		
	end

end

function ShowMenuTrening(playerid)
	
	ShowMenu(playerid, Menu_Trening[Player[playerid].Trening]);
	
end

function HideMenuTrening(playerid)
	
	HideMenuDraws(playerid, Menu_Trening[Player[playerid].Trening]);
	HideCost(playerid, GetCostAmount(Player[playerid].Trening));

end

function SwithMenuDownTrening(playerid)

	SwitchDownMenu(playerid, Menu_Trening[Player[playerid].Trening]);

end

function SwithMenuUpTrening(playerid)

	SwitchUpMenu(playerid, Menu_Trening[Player[playerid].Trening]);

end

function StartTrening(playerid)
	
	if Player[playerid].Trening == "Skill_1H" then
	
		if GetPlayerActiveMenu(playerid, Menu_Trening["Skill_1H"]) == 0 then
		
			Player[playerid].Set = Set1H( playerid, 10, 10 );
			
		elseif GetPlayerActiveMenu(playerid, Menu_Trening["Skill_1H"]) == 1 then
		
			Player[playerid].Set = Set1H( playerid, 5, 5 );
		
		end
		
	elseif Player[playerid].Trening == "Skill_2H" then
	
		if GetPlayerActiveMenu(playerid, Menu_Trening["Skill_2H"]) == 0 then
		
			Player[playerid].Set = Set2H( playerid, 10, 10 );
			
		elseif GetPlayerActiveMenu(playerid, Menu_Trening["Skill_2H"]) == 1 then
			
			Player[playerid].Set = Set2H( playerid, 5, 5 );

		end
	
	elseif Player[playerid].Trening == "Skill_Bow" then
	
		if GetPlayerActiveMenu(playerid, Menu_Trening["Skill_Bow"]) == 0 then
		
			Player[playerid].Set = SetBow( playerid, 10, 10 );
			
		elseif GetPlayerActiveMenu(playerid, Menu_Trening["Skill_Bow"]) == 1 then
		
			Player[playerid].Set = SetBow( playerid, 5, 5 );
		
		end
	
	elseif Player[playerid].Trening == "Skill_CBow" then
	
		if GetPlayerActiveMenu(playerid, Menu_Trening["Skill_CBow"]) == 0 then
		
			Player[playerid].Set = SetCBow( playerid, 10, 10 );
			
		elseif GetPlayerActiveMenu(playerid, Menu_Trening["Skill_CBow"]) == 1 then
		
			Player[playerid].Set = SetCBow( playerid, 5, 5 );
		
		end
	
	elseif Player[playerid].Trening == "Str" then
	
		if GetPlayerActiveMenu(playerid, Menu_Trening["Str"]) == 0 then
		
			Player[playerid].Set = SetStr( playerid, 10, 1 );
			
		elseif GetPlayerActiveMenu(playerid, Menu_Trening["Str"]) == 1 then
		
			Player[playerid].Set = SetStr( playerid, 5, 2 );
		
		end
	
	elseif Player[playerid].Trening == "Dex" then
	
		if GetPlayerActiveMenu(playerid, Menu_Trening["Dex"]) == 0 then
		
			Player[playerid].Set = SetDex( playerid, 10, 1 );
			
		elseif GetPlayerActiveMenu(playerid, Menu_Trening["Dex"]) == 1 then
		
			Player[playerid].Set = SetDex( playerid, 5, 2 );
		
		end
	
	elseif Player[playerid].Trening == "Mana" then
	
		if GetPlayerActiveMenu(playerid, Menu_Trening["Mana"]) == 0 then
		
			Player[playerid].Set = SetMana( playerid, 10, 1 );
			
		elseif GetPlayerActiveMenu(playerid, Menu_Trening["Mana"]) == 1 then
		
			Player[playerid].Set = SetMana( playerid, 5, 2 );	

		end
	
	elseif Player[playerid].Trening == "Health" then
	
		if GetPlayerActiveMenu(playerid, Menu_Trening["Health"]) == 0 then
		
			Player[playerid].Set = SetHealth( playerid, 10, 1 );
			
		elseif GetPlayerActiveMenu(playerid, Menu_Trening["Health"]) == 1 then
		
			Player[playerid].Set = SetHealth( playerid, 5, 2 );
		
		end
	
	elseif Player[playerid].Trening == "MagicLvl" then
	
		if GetPlayerActiveMenu(playerid, Menu_Trening["MagicLvl"]) == 0 then
		
			Player[playerid].Set = SetMagicLvl( playerid, 1, 1 );
			
		end
		
	end
	
	if GetPlayerActiveMenu(playerid, Menu_Trening[Player[playerid].Trening]) == GetMenuMaxOptions(Menu_Trening[Player[playerid].Trening]) then
		
		
		if Player[playerid].Set ~= false then
			
			SetPlayerStatistic(playerid, Player[playerid].Trening, Player[playerid].Set);
			Player[playerid].Set = false;
			
		end
		
		HideMenuTrening(playerid);
		Player[playerid].Trening = false;
		ShowMenuNPC(playerid);

	end
		
end

--Menu i Dialog--
local Menu_Farim = {};
local Dialog_Farim = {};

--Farim
Menu_Farim[0] = CreateMenu(1, "(КОНЕЦ)", Texture_Menu_NPC, 1450, 6850, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "farim_0");
Menu_Farim[1] = CreateMenu(2, "(КОНЕЦ)", Texture_Menu_NPC, 1450, 6850, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "farim_1");
Menu_Farim[2] = CreateMenu(3, "(КОНЕЦ)", Texture_Menu_NPC, 1450, 6850, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "farim_2");
Menu_Farim[3] = CreateMenu(2, "(КОНЕЦ)", Texture_Menu_NPC, 1450, 6850, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "farim_2_wyspa");
Menu_Farim[4] = CreateMenu(2, "(КОНЕЦ)", Texture_Menu_NPC, 1450, 6850, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "farim_2_ryby");
Menu_Farim[5] = CreateMenu(3, "(КОНЕЦ)", Texture_Menu_NPC, 1450, 6850, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "farim_3");
Menu_Farim[6] = CreateMenu(2, "(КОНЕЦ)", Texture_Menu_NPC, 1450, 6850, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "farim_3_ryby");
Menu_Farim[7] = CreateMenu(5, "(НАЗАД)", Texture_Menu_NPC, 1450, 6850, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "farim_roz");

--Farim Dialog
Dialog_Farim[0] = CreateDialog("Farim_0", "Фарим");
Dialog_Farim[1] = CreateDialog("Farim_1_0", "Фарим");
Dialog_Farim[2] = CreateDialog("Farim_1_1", "Фарим");
Dialog_Farim[3] = CreateDialog("Farim_praca", "Фарим");
Dialog_Farim[4] = CreateDialog("Farim_roz", "Фарим");
Dialog_Farim[5] = CreateDialog("Farim_roz_0", "Фарим");
Dialog_Farim[6] = CreateDialog("Farim_roz_1", "Фарим");
Dialog_Farim[7] = CreateDialog("Farim_roz_2", "Фарим");
Dialog_Farim[8] = CreateDialog("Farim_roz_3", "Фарим");
Dialog_Farim[9] = CreateDialog("Farim_roz_4", "Фарим");
Dialog_Farim[10] = CreateDialog("Farim_rybu", "Фарим");
Dialog_Farim[11] = CreateDialog("Farim_rybu_brak", "Фарим");

--Farim
function GetFarimMenu(playerid)

	return Player[playerid].Farim;

end

function DialogFarimSkup(playerid)

	DialogStart(playerid, Dialog_Farim[10], Menu_Farim[Player[playerid].Farim], 1, 0);

end

function DialogFarimOdrzut(playerid)

	DialogStart(playerid, Dialog_Farim[11], Menu_Farim[Player[playerid].Farim], 1, 0);

end

function ShowMenuFarim(playerid)
	
	ShowMenu(playerid, Menu_Farim[Player[playerid].Farim]);

end

function HideMenuFarim(playerid)

	HideMenu(playerid, Menu_Farim[Player[playerid].Farim]);

end

function SwithMenuDownFarim(playerid)

	SwitchDownMenu(playerid, Menu_Farim[Player[playerid].Farim])

end

function SwithMenuUpFarim(playerid)

	SwitchUpMenu(playerid, Menu_Farim[Player[playerid].Farim])

end

function StartDialogFarim(playerid)
	
	if Player[playerid].Farim == 0 then
	
		if GetPlayerActiveMenu(playerid, Menu_Farim[0]) == 0 then
			
			HideMenuFarim(playerid);
			DialogStart(playerid, Dialog_Farim[0], Menu_Farim[1], 1, 0);
			Player[playerid].Farim = 1;
			Player[playerid].Dialog = true;
		
		end
		
	elseif Player[playerid].Farim == 1 then
	
		if GetPlayerActiveMenu(playerid, Menu_Farim[1]) == 0 then
			
			HideMenuFarim(playerid);
			DialogStart(playerid, Dialog_Farim[1], Menu_Farim[2], 1, 0);
			Player[playerid].Farim = 2;
			Player[playerid].Dialog = true;
			
		elseif GetPlayerActiveMenu(playerid, Menu_Farim[1]) == 1 then
			
			HideMenuFarim(playerid);
			DialogStart(playerid, Dialog_Farim[2], Menu_Farim[3], 1, 0);
			Player[playerid].Farim = 3;
			Player[playerid].Dialog = true;
		
		end
		
	elseif Player[playerid].Farim == 2 then
	
		if GetPlayerActiveMenu(playerid, Menu_Farim[2]) == 0 then
			
			HideMenuFarim(playerid);
			DialogStart(playerid, Dialog_Farim[3], Menu_Farim[2], 1, 0);
			Player[playerid].Dialog = true;
			
		elseif GetPlayerActiveMenu(playerid, Menu_Farim[2]) == 1 then
			
			HideMenuFarim(playerid);
			HasItem(playerid, "ITFO_FISH", 5);
			Player[playerid].Dialog = true;
			
		elseif GetPlayerActiveMenu(playerid, Menu_Farim[2]) == 2 then
			
			HideMenuFarim(playerid);
			DialogStart(playerid, Dialog_Farim[2], Menu_Farim[5], 1, 0);
			Player[playerid].Farim = 5;
			Player[playerid].Dialog = true;
		
		end
		
	elseif Player[playerid].Farim == 3 then
	
		if GetPlayerActiveMenu(playerid, Menu_Farim[3]) == 0 then
			
			HideMenuFarim(playerid);
			DialogStart(playerid, Dialog_Farim[1], Menu_Farim[5], 1, 0);
			Player[playerid].Farim = 5;
			Player[playerid].Dialog = true;
			
		elseif GetPlayerActiveMenu(playerid, Menu_Farim[3]) == 1 then
			
			HideMenuFarim(playerid);
			DialogStart(playerid, Dialog_Farim[4], Menu_Farim[7], 1, 0);
			Player[playerid].Last_Menu = 3;
			Player[playerid].Farim = 7;
			Player[playerid].Dialog = true;
		
		end
		
	elseif Player[playerid].Farim == 4 then
	
		if GetPlayerActiveMenu(playerid, Menu_Farim[4]) == 0 then
			
			HideMenuFarim(playerid);
			DialogStart(playerid, Dialog_Farim[10], Menu_Farim[2], 1, 0);
			Player[playerid].Farim = 2;
			Player[playerid].Dialog = true;
			
		elseif GetPlayerActiveMenu(playerid, Menu_Farim[4]) == 1 then
			
			HideMenuFarim(playerid);
			DialogStart(playerid, Dialog_Farim[2], Menu_Farim[6], 1, 0);
			Player[playerid].Farim = 6;
			Player[playerid].Dialog = true;
		
		end
		
	elseif Player[playerid].Farim == 5 then
	
		if GetPlayerActiveMenu(playerid, Menu_Farim[5]) == 0 then
			
			HideMenuFarim(playerid);
			DialogStart(playerid, Dialog_Farim[3], Menu_Farim[5], 1, 0);
			Player[playerid].Dialog = true;
			
		elseif GetPlayerActiveMenu(playerid, Menu_Farim[5]) == 1 then
		
			HideMenuFarim(playerid);
			HasItem(playerid, "ITMI_NUGGET", 5);
			Player[playerid].Dialog = true;
			
		elseif GetPlayerActiveMenu(playerid, Menu_Farim[5]) == 2 then	
			
			HideMenuFarim(playerid);
			DialogStart(playerid, Dialog_Farim[4], Menu_Farim[7], 1, 0);
			Player[playerid].Last_Menu = 5;
			Player[playerid].Farim = 7;
			Player[playerid].Dialog = true;
		
		end
		
	elseif Player[playerid].Farim == 6 then
	
		if GetPlayerActiveMenu(playerid, Menu_Farim[4]) == 0 then
			
			HideMenuFarim(playerid);
			DialogStart(playerid, Dialog_Farim[10], Menu_Farim[5], 1, 0);
			Player[playerid].Farim = 5;
			Player[playerid].Dialog = true;
			
		elseif GetPlayerActiveMenu(playerid, Menu_Farim[4]) == 1 then
			
			HideMenuFarim(playerid);
			DialogStart(playerid, Dialog_Farim[4], Menu_Farim[7], 1, 0);
			Player[playerid].Last_Menu = 6;
			Player[playerid].Farim = 7;
			Player[playerid].Dialog = true;
		
		end
	
	elseif Player[playerid].Farim == 7 then
	
		if GetPlayerActiveMenu(playerid, Menu_Farim[7]) == 0 then
			
			HideMenuFarim(playerid);
			DialogStart(playerid, Dialog_Farim[5], Menu_Farim[7], 1, 0);
			Player[playerid].Dialog = true;
			
		elseif GetPlayerActiveMenu(playerid, Menu_Farim[7]) == 1 then
			
			HideMenuFarim(playerid);
			DialogStart(playerid, Dialog_Farim[6], Menu_Farim[7], 1, 0);
			Player[playerid].Dialog = true;
			
		elseif GetPlayerActiveMenu(playerid, Menu_Farim[7]) == 2 then
			
			HideMenuFarim(playerid);
			DialogStart(playerid, Dialog_Farim[7], Menu_Farim[7], 1, 0);
			Player[playerid].Dialog = true;
			
		elseif GetPlayerActiveMenu(playerid, Menu_Farim[7]) == 3 then
			
			HideMenuFarim(playerid);
			DialogStart(playerid, Dialog_Farim[8], Menu_Farim[7], 1, 0);
			Player[playerid].Dialog = true;
			
		elseif GetPlayerActiveMenu(playerid, Menu_Farim[7]) == 4 then
			
			HideMenuFarim(playerid);
			DialogStart(playerid, Dialog_Farim[9], Menu_Farim[7], 1, 0);
			Player[playerid].Dialog = true;
			
		elseif GetPlayerActiveMenu(playerid, Menu_Farim[7]) == 5 then -- НАЗАД
			
			HideMenuFarim(playerid);
			Player[playerid].Farim = Player[playerid].Last_Menu;
			ShowMenuFarim(playerid);
		
		end
	
	end
	
	if GetPlayerActiveMenu(playerid, Menu_Farim[Player[playerid].Farim]) == GetMenuMaxOptions(Menu_Farim[Player[playerid].Farim]) then
		
		if Player[playerid].Farim ~= 7 then
		
			HideMenuFarim(playerid);	
			
		end
			
	end
	
end

function GetFocusFarim(playerid)

	return NPC.Farim;

end

--Menu i Dialog--
local Menu_Blyth = {};
local Dialog_Blyth = {};

--Blyth

Menu_Blyth[0] = CreateMenu(1, "(КОНЕЦ)", Texture_Menu_NPC, 1450, 6850, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "blyth_0");
Menu_Blyth[1] = CreateMenu(3, "(КОНЕЦ)", Texture_Menu_NPC, 1450, 6850, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "blyth_1");
Menu_Blyth[2] = CreateMenu(5, "(НАЗАД)", Texture_Menu_NPC, 1450, 6850, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "blyth_nauka");
Menu_Blyth[3] = CreateMenu(3, "(КОНЕЦ)", Texture_Menu_NPC, 1450, 6850, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "blyth_2");
Menu_Blyth[4] = CreateMenu(3, "(КОНЕЦ)", Texture_Menu_NPC, 1450, 6850, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "blyth_3");
Menu_Blyth[5] = CreateMenu(2, "(КОНЕЦ)", Texture_Menu_NPC, 1450, 6850, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "Blyth_5");

--Blyth Dialog
Dialog_Blyth[0] = CreateDialog("Blyth_0", "Блитз");
Dialog_Blyth[1] = CreateDialog("Blyth_nauka", "Блитз");
Dialog_Blyth[2] = CreateDialog("Blyth_zadania", "Блитз");
Dialog_Blyth[3] = CreateDialog("Blyth_nauka_0", "Блитз");
Dialog_Blyth[4] = CreateDialog("Blyth_nauka_1", "Блитз");
Dialog_Blyth[5] = CreateDialog("Blyth_nauka_6", "Блитз");
Dialog_Blyth[6] = CreateDialog("Blyth_nauka_3", "Блитз");
Dialog_Blyth[7] = CreateDialog("Blyth_nauka_4", "Блитз");
Dialog_Blyth[8] = CreateDialog("Blyth_lvl0_end", "Блитз");
Dialog_Blyth[9] = CreateDialog("Blyth_lvl0", "Блитз");
Dialog_Blyth[10] = CreateDialog("Blyth_skup", "Блитз");
Dialog_Blyth[11] = CreateDialog("Blyth_odrzut", "Блитз");
Dialog_Blyth[12] = CreateDialog("Blyth_hunt_true", "Блитз");
Dialog_Blyth[13] = CreateDialog("Blyth_hunt_false", "Блитз");
Dialog_Blyth[14] = CreateDialog("Blyth_low_lvl", "Блитз");
Dialog_Blyth[15] = CreateDialog("Blyth_end_hunt", "Блитз");

--Blyth

function DialogBlythSkup(playerid)

	DialogStart(playerid, Dialog_Blyth[10], Menu_Blyth[Player[playerid].Blyth], 1, 0);
	
end

function DialogBlythOdrzut(playerid)

	DialogStart(playerid, Dialog_Blyth[11], Menu_Blyth[Player[playerid].Blyth], 1, 0);
	
end

function ShowMenuBlyth(playerid)
	
	ShowMenu(playerid, Menu_Blyth[Player[playerid].Blyth]);

end

function HideMenuBlyth(playerid)

	HideMenu(playerid, Menu_Blyth[Player[playerid].Blyth]);

end

function SwithMenuDownBlyth(playerid)

	SwitchDownMenu(playerid, Menu_Blyth[Player[playerid].Blyth])

end

function SwithMenuUpBlyth(playerid)

	SwitchUpMenu(playerid, Menu_Blyth[Player[playerid].Blyth])

end

function StartDialogBlyth(playerid)
	
	if Player[playerid].Blyth == 0 then
	
		if GetPlayerActiveMenu(playerid, Menu_Blyth[0]) == 0 then
			
			HideMenuBlyth(playerid);
			DialogStart(playerid, Dialog_Blyth[0], Menu_Blyth[1], 1, 0);
			Player[playerid].Blyth = 1;
			Player[playerid].Dialog = true;
		
		end
		
	elseif Player[playerid].Blyth == 1 then
	
		if GetPlayerActiveMenu(playerid, Menu_Blyth[1]) == 0 then
			
			HideMenuBlyth(playerid);
			DialogStart(playerid, Dialog_Blyth[1], Menu_Blyth[2], 1, 0);
			Player[playerid].Last_Menu = 1;
			Player[playerid].Blyth = 2;
			Player[playerid].Dialog = true;
			
		elseif GetPlayerActiveMenu(playerid, Menu_Blyth[1]) == 1 then
			
			HideMenuBlyth(playerid);
			GetBuyItem_Normal( playerid );
			Player[playerid].Dialog = true;
			
		elseif GetPlayerActiveMenu(playerid, Menu_Blyth[1]) == 2 then
			
			HideMenuBlyth(playerid);
			DialogStart(playerid, Dialog_Blyth[2], Menu_Blyth[3], 1, 0);
			Player[playerid].Blyth = 3;
			Player[playerid].Dialog = true;
		
		end
		
	elseif Player[playerid].Blyth == 2 then
	
		if GetPlayerActiveMenu(playerid, Menu_Blyth[2]) == 0 then
			
			SetPazury( playerid, "Pazury" );
			
		elseif GetPlayerActiveMenu(playerid, Menu_Blyth[2]) == 1 then
			
			SetZuwaczki( playerid, "Zuwaczki" );
			
		elseif GetPlayerActiveMenu(playerid, Menu_Blyth[2]) == 2 then
			
			SetJezyki( playerid, "Jezyki" );
			
		elseif GetPlayerActiveMenu(playerid, Menu_Blyth[2]) == 3 then
			
			SetSkora( playerid, "Skora" );
			
		elseif GetPlayerActiveMenu(playerid, Menu_Blyth[2]) == 4 then
			
			SetKly( playerid, "Kly" );
			
		elseif GetPlayerActiveMenu(playerid, Menu_Blyth[2]) == 5 then -- НАЗАД
			
			HideMenuBlyth(playerid);
			SetPlayerLearnPoints(playerid, GetLP(playerid));
			Player[playerid].Blyth = Player[playerid].Last_Menu;
			ShowMenuBlyth(playerid);
		
		end
		
	elseif Player[playerid].Blyth == 3 then
	
		if GetPlayerActiveMenu(playerid, Menu_Blyth[3]) == 0 then
			
			HideMenuBlyth(playerid);
			DialogStart(playerid, Dialog_Blyth[1], Menu_Blyth[2], 1, 0);
			Player[playerid].Last_Menu = 3;
			Player[playerid].Blyth = 2;
			Player[playerid].Dialog = true;
		
		elseif GetPlayerActiveMenu(playerid, Menu_Blyth[3]) == 1 then		
		
			HideMenuBlyth(playerid);
			GetBuyItem_Normal( playerid );
			Player[playerid].Dialog = true;
			
		elseif GetPlayerActiveMenu(playerid, Menu_Blyth[3]) == 2 then
			
			HideMenuBlyth(playerid);
			
			if GetPlayerHuntLvl( playerid ) <= GetPlayerLevel(playerid) then
			
				DialogStart(playerid, Dialog_Blyth[9], Menu_Blyth[4], 1, 0);
				Player[playerid].Blyth = 4;
				StartHunt(playerid);
				
			else
				
				DialogStart(playerid, Dialog_Blyth[14], Menu_Blyth[3], 1, 0);				 
				
			end

			Player[playerid].Dialog = true;
			
		end
		
	elseif Player[playerid].Blyth == 4 then
	
		if GetPlayerActiveMenu(playerid, Menu_Blyth[4]) == 0 then
			
			HideMenuBlyth(playerid);
			DialogStart(playerid, Dialog_Blyth[1], Menu_Blyth[2], 1, 0);
			Player[playerid].Last_Menu = 4;
			Player[playerid].Blyth = 2;
			Player[playerid].Dialog = true;
			
		elseif GetPlayerActiveMenu(playerid, Menu_Blyth[4]) == 1 then		
		
			HideMenuBlyth(playerid);
			GetBuyItem_Normal( playerid );
			Player[playerid].Dialog = true;
			
		elseif GetPlayerActiveMenu(playerid, Menu_Blyth[4]) == 2 then
			
			HideMenuBlyth(playerid);
			
			if GetPlayerHunting( playerid ) == false then
			
				DialogStart(playerid, Dialog_Blyth[13], Menu_Blyth[4], 1, 0);
				
			else
				
				if GetPlayerHuntLvl( playerid ) < 41 then
				
					DialogStart(playerid, Dialog_Blyth[12], Menu_Blyth[3], 1, 0);
					EndHunt(playerid);
					Player[playerid].Blyth = 3;
					
				else
					
					DialogStart(playerid, Dialog_Blyth[15], Menu_Blyth[5], 1, 0);
					EndHunt(playerid);
					
				end
				
			end
			
			Player[playerid].Dialog = true;	
			
		end
		
	elseif Player[playerid].Blyth == 5 then
	
		if GetPlayerActiveMenu(playerid, Menu_Blyth[5]) == 0 then
			
			HideMenuBlyth(playerid);
			DialogStart(playerid, Dialog_Blyth[1], Menu_Blyth[2], 1, 0);
			Player[playerid].Last_Menu = 3;
			Player[playerid].Blyth = 2;
			Player[playerid].Dialog = true;
		
		elseif GetPlayerActiveMenu(playerid, Menu_Blyth[5]) == 1 then		
		
			HideMenuBlyth(playerid);
			GetBuyItem_Normal( playerid );
			Player[playerid].Dialog = true;
			
		end
	
	end
	
	if GetPlayerActiveMenu(playerid, Menu_Blyth[Player[playerid].Blyth]) == GetMenuMaxOptions(Menu_Blyth[Player[playerid].Blyth]) then
		
		if Player[playerid].Blyth ~= 2 then
		
			HideMenuBlyth(playerid);		
			
		end
			
	end
	
end

function GetFocusBlyth(playerid)

	return NPC.Blyth;

end

--Menu i Dialog--
local Menu_Will = {};
local Dialog_Will = {};

--Will
Menu_Will[0] = CreateMenu(1, "(КОНЕЦ)", Texture_Menu_NPC, 1450, 6850, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "will_0");
Menu_Will[1] = CreateMenu(3, "(КОНЕЦ)", Texture_Menu_NPC, 1450, 6850, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "will_1");
Menu_Will["Handel"] = CreateMenu(16, "(КОНЕЦ)", Texture_Handel_NPC, 2000, 2000, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "Will_Handel");


--Will Dialog
Dialog_Will[0] = CreateDialog("Will_start", "Вилл");
Dialog_Will[1] = CreateDialog("Will_zr", "Вилл");
Dialog_Will[2] = CreateDialog("Will_luk", "Вилл");
Dialog_Will[3] = CreateDialog("Will_Handel", "Вилл");



--Will

function ShowMenuWill(playerid)
	
	ShowMenu(playerid, Menu_Will[Player[playerid].Will]);

end

function HideMenuWill(playerid)

	HideMenu(playerid, Menu_Will[Player[playerid].Will]);

end

function SwithMenuDownWill(playerid)

	SwitchDownMenu(playerid, Menu_Will[Player[playerid].Will]);

end

function SwithMenuUpWill(playerid)

	SwitchUpMenu(playerid, Menu_Will[Player[playerid].Will]);

end

function StartDialogWill(playerid)
	
	if Player[playerid].Will == 0 then
	
		if GetPlayerActiveMenu(playerid, Menu_Will[0]) == 0 then
			
			HideMenuWill(playerid);
			DialogStart(playerid, Dialog_Will[0], Menu_Will[1], 1, 0);
			Player[playerid].Will = 1;
			Player[playerid].Dialog = true;
		
		end
	
	elseif Player[playerid].Will == 1 then

		if GetPlayerActiveMenu(playerid, Menu_Will[1]) == 0 then
			
			HideMenuWill(playerid);
			DialogStart(playerid, Dialog_Will[2], Menu_Trening["Skill_Bow"], 1, 0); -- лук
			Player[playerid].Dialog = true;
			Player[playerid].Trening = "Skill_Bow";
			
		elseif GetPlayerActiveMenu(playerid, Menu_Will[1]) == 1 then
		
			HideMenuWill(playerid);
			DialogStart(playerid, Dialog_Will[1], Menu_Trening["Dex"], 1, 0); -- ловкость
			Player[playerid].Dialog = true;
			Player[playerid].Trening = "Dex";
			
		elseif GetPlayerActiveMenu(playerid, Menu_Will[1]) == 2 then
		
			HideMenuWill(playerid);
			DialogStart(playerid, Dialog_Will[3], Menu_Will["Handel"], 1, 0); -- торговля
			Player[playerid].Dialog = true;
			Player[playerid].Handel = true;
			Player[playerid].Last_Menu = 1;
			Player[playerid].Will = "Handel";
			
		end
		
	elseif Player[playerid].Will == "Handel" then
	
		if GetPlayerActiveMenu(playerid, Menu_Will["Handel"]) >= 0 
		and GetPlayerActiveMenu(playerid, Menu_Will["Handel"]) < GetMenuMaxOptions(Menu_Will[Player[playerid].Will]) then
			
			GiveItemTrade( playerid );
		
		end
			
	end
	
	
	if GetPlayerActiveMenu(playerid, Menu_Will[Player[playerid].Will]) == GetMenuMaxOptions(Menu_Will[Player[playerid].Will]) then
	
		if Player[playerid].Handel ~= false then
			
			HideHandel(playerid, "Will");
			HideMenuWill(playerid);
			Player[playerid].Handel = false;
			Player[playerid].Will = Player[playerid].Last_Menu;
			ShowMenuWill(playerid);
		
		else
		
			HideMenuWill(playerid);
			
		end

	end
	
end

function GetFocusWill(playerid)

	return NPC.Will;

end

--Menu i Dialog--
local Dialog_Bob = {};

--Bob

--Bob Dialog
Dialog_Bob[0] = CreateDialog("Bob_0", "Боб");




--Bob

function ShowMenuBob(playerid)
	
	DialogStart(playerid, Dialog_Bob[0], "NULL", 0, 0);
	Player[playerid].Dialog = true;

end

function HideMenuBob(playerid)

	HideMenu(playerid, Menu_Bob[Player[playerid].Bob]);

end

function SwithMenuDownBob(playerid)

	--SwitchDownMenu(playerid, Menu_Bob[Player[playerid].Bob]);

end

function SwithMenuUpBob(playerid)

	--SwitchUpMenu(playerid, Menu_Bob[Player[playerid].Bob]);

end

function StartDialogBob(playerid)
	
end

function GetFocusBob(playerid)

	return NPC.Bob;

end

--Menu i Dialog--
local Menu_Fred = {};
local Dialog_Fred = {};

--Fred
Menu_Fred[0] = CreateMenu(1, "(КОНЕЦ)", Texture_Menu_NPC, 1450, 6850, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "Fred_0");
Menu_Fred[1] = CreateMenu(1, "(КОНЕЦ)", Texture_Menu_NPC, 1450, 6850, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "Fred_1");
Menu_Fred[2] = CreateMenu(3, "(КОНЕЦ)", Texture_Menu_NPC, 1450, 6850, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "Fred_2_0");
Menu_Fred[3] = CreateMenu(3, "(КОНЕЦ)", Texture_Menu_NPC, 1450, 6850, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "Fred_2_1");
Menu_Fred[4] = CreateMenu(3, "(КОНЕЦ)", Texture_Menu_NPC, 1450, 6850, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "Fred_2_2");


--Fred Dialog
Dialog_Fred[0] = CreateDialog("Fred_0", "Фред");
Dialog_Fred[1] = CreateDialog("Fred_1", "Фред");
Dialog_Fred[2] = CreateDialog("Fred_2_rzepa", "Фред");
Dialog_Fred[3] = CreateDialog("Fred_pyt", "Фред");
Dialog_Fred[4] = CreateDialog("Fred_zad_1", "Фред");
Dialog_Fred[5] = CreateDialog("Fred_2_rzepa_skup", "Фред");
Dialog_Fred[6] = CreateDialog("Fred_2_rzepa_brak", "Фред");
Dialog_Fred[7] = CreateDialog("Fred_ubranie_skup", "Фред");
Dialog_Fred[8] = CreateDialog("Fred_ubranie_brak", "Фред");

--Fred

function GetFredMenu(playerid)
	
	return Player[playerid].Fred;

end

function DialogFredSkup(playerid)

	DialogStart(playerid, Dialog_Fred[5], Menu_Fred[Player[playerid].Fred], 1, 0);

end

function DialogFredOddaj(playerid)

	DialogStart(playerid, Dialog_Fred[6], Menu_Fred[Player[playerid].Fred], 1, 0);

end

function ShowMenuFred(playerid)
	
	ShowMenu(playerid, Menu_Fred[Player[playerid].Fred]);

end

function HideMenuFred(playerid)

	HideMenu(playerid, Menu_Fred[Player[playerid].Fred]);

end

function SwithMenuDownFred(playerid)

	SwitchDownMenu(playerid, Menu_Fred[Player[playerid].Fred]);

end

function SwithMenuUpFred(playerid)

	SwitchUpMenu(playerid, Menu_Fred[Player[playerid].Fred]);

end

function StartDialogFred(playerid)
	
	if Player[playerid].Fred == 0 then
	
		if GetPlayerActiveMenu(playerid, Menu_Fred[0]) == 0 then
			
			HideMenuFred(playerid);
			DialogStart(playerid, Dialog_Fred[0], Menu_Fred[1], 1, 0);
			Player[playerid].Fred = 1;
			Player[playerid].Dialog = true;
		
		end
		
	elseif Player[playerid].Fred == 1 then	
		
		if GetPlayerActiveMenu(playerid, Menu_Fred[1]) == 0 then
			
			HideMenuFred(playerid);
			DialogStart(playerid, Dialog_Fred[1], Menu_Fred[2], 1, 0);
			Player[playerid].Fred = 2;
			Player[playerid].Dialog = true;
			
		end
		
	elseif Player[playerid].Fred == 2 then
		
		if GetPlayerActiveMenu(playerid, Menu_Fred[2]) == 0 then
			
			HideMenuFred(playerid);
			DialogStart(playerid, Dialog_Fred[2], Menu_Fred[2], 1, 0);
			Player[playerid].Dialog = true;
			
		elseif GetPlayerActiveMenu(playerid, Menu_Fred[2]) == 1 then
			
			HideMenuFred(playerid);
			HasItem(playerid, "ITPL_BEET", 4);
			Player[playerid].Dialog = true;
			
		elseif GetPlayerActiveMenu(playerid, Menu_Fred[2]) == 2 then
			
			HideMenuFred(playerid);
			DialogStart(playerid, Dialog_Fred[3], Menu_Fred[3], 1, 0);
			Player[playerid].Fred = 3;
			Player[playerid].Dialog = true;
			
		end
		
	elseif Player[playerid].Fred == 3 then
		
		if GetPlayerActiveMenu(playerid, Menu_Fred[3]) == 0 then
			
			HideMenuFred(playerid);
			DialogStart(playerid, Dialog_Fred[2], Menu_Fred[3], 1, 0);
			Player[playerid].Dialog = true;
			
		elseif GetPlayerActiveMenu(playerid, Menu_Fred[3]) == 1 then
		
			HideMenuFred(playerid);
			HasItem(playerid, "ITPL_BEET", 4);
			Player[playerid].Dialog = true;
			
		elseif GetPlayerActiveMenu(playerid, Menu_Fred[3]) == 2 then
			
			HideMenuFred(playerid);
			DialogStart(playerid, Dialog_Fred[4], Menu_Fred[4], 1, 0);
			Player[playerid].Last_Menu = "4";
			Player[playerid].Dialog = true;
			
		end
		
	elseif Player[playerid].Fred == 4 then
	
		if GetPlayerActiveMenu(playerid, Menu_Fred[4]) == 0 then
			
			HideMenuFred(playerid);
			DialogStart(playerid, Dialog_Fred[2], Menu_Fred[4], 1, 0);
			Player[playerid].Dialog = true;
			
		elseif GetPlayerActiveMenu(playerid, Menu_Fred[3]) == 1 then
			
			HideMenuFred(playerid);
			HasItem(playerid, "ITPL_BEET", 4);
			Player[playerid].Dialog = true;
			
		elseif GetPlayerActiveMenu(playerid, Menu_Fred[3]) == 2 then
			
			HideMenuFred(playerid);
			Player[playerid].Dialog = true;
			if GetPlayerGold(playerid) >= 65 then
			
				DialogStart(playerid, Dialog_Fred[7], Menu_Fred[4], 1, 0);
				GiveItem(playerid, "ITAR_BAU_L", 1);
				RemoveItem(playerid, "ITMI_GOLD", 65);
			
			else
			
				DialogStart(playerid, Dialog_Fred[8], Menu_Fred[4], 1, 0);
			
			end
			
		end
		
	end
		
	
	if GetPlayerActiveMenu(playerid, Menu_Fred[Player[playerid].Fred]) == GetMenuMaxOptions(Menu_Fred[Player[playerid].Fred]) then

		HideMenuFred(playerid);		

	end
	
end

function GetFocusFred(playerid)

	return NPC.Fred;

end

--Menu i Dialog--
local Menu_Eowina = {};
local Dialog_Eowina = {};

--Eowina
Menu_Eowina[0] = CreateMenu(1, "(КОНЕЦ)", Texture_Menu_NPC, 1450, 6850, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "Eowina_0");
Menu_Eowina[1] = CreateMenu(2, "(КОНЕЦ)", Texture_Menu_NPC, 1450, 6850, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "Eowina_1");
Menu_Eowina["Handel"] = CreateMenu(5, "(НАЗАД)", Texture_Handel_NPC, 2000, 2000, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "Eowina_Handel");


--Eowina Dialog
Dialog_Eowina[0] = CreateDialog("Eowina_0", "Аннет");
Dialog_Eowina[1] = CreateDialog("Eowina_1", "Аннет");
Dialog_Eowina[2] = CreateDialog("Eowina_1_mieso", "Аннет");
Dialog_Eowina[3] = CreateDialog("Eowina_1_mieso_brak", "Аннет");


--Аннет

function ShowMenuEowina(playerid)
	
	ShowMenu(playerid, Menu_Eowina[Player[playerid].Eowina]);

end

function HideMenuEowina(playerid)

	HideMenu(playerid, Menu_Eowina[Player[playerid].Eowina]);

end

function SwithMenuDownEowina(playerid)

	SwitchDownMenu(playerid, Menu_Eowina[Player[playerid].Eowina]);

end

function SwithMenuUpEowina(playerid)

	SwitchUpMenu(playerid, Menu_Eowina[Player[playerid].Eowina]);

end

function StartDialogEowina(playerid)
	
	if Player[playerid].Eowina == 0 then
	
		if GetPlayerActiveMenu(playerid, Menu_Eowina[0]) == 0 then
			
			HideMenuEowina(playerid);
			DialogStart(playerid, Dialog_Eowina[0], Menu_Eowina[1], 1, 0);
			Player[playerid].Eowina = 1;
			Player[playerid].Dialog = true;
		
		end
		
	elseif Player[playerid].Eowina == 1 then
	
		if GetPlayerActiveMenu(playerid, Menu_Eowina[1]) == 0 then
			
			HideMenuEowina(playerid);
			DialogStart(playerid, Dialog_Eowina[1], Menu_Eowina["Handel"], 1, 0);
			Player[playerid].Dialog = true;
			Player[playerid].Last_Menu = 1;
			Player[playerid].Eowina = "Handel";
			Player[playerid].Handel = true;
			
		elseif GetPlayerActiveMenu(playerid, Menu_Eowina[1]) == 1 then
			
			HideMenuEowina(playerid);
			
			if FindItem(playerid, "ITFOMUTTONRAW") == false then
			
				DialogStart(playerid, Dialog_Eowina[3], Menu_Eowina[1], 1, 0);
				Player[playerid].Dialog = true;
				
			else
				
				DialogStart(playerid, Dialog_Eowina[2], Menu_Eowina[1], 1, 0);
				Player[playerid].Dialog = true;
				GiveItem(playerid, "ITFOMUTTON", math.ceil(GetItemAmountPlayer( playerid, FindItem(playerid, "ITFOMUTTONRAW"))/2));
				RemoveItem(playerid, "ITFOMUTTONRAW", GetItemAmountPlayer( playerid, FindItem(playerid, "ITFOMUTTONRAW")));
				DestroyItemPlayer(playerid, "ITFOMUTTONRAW", GetItemAmountPlayer( playerid, FindItem(playerid, "ITFOMUTTONRAW") ));		

			end
			
		end
		
	elseif Player[playerid].Eowina == "Handel" then
	
		if GetPlayerActiveMenu(playerid, Menu_Eowina["Handel"]) >= 0 
		and GetPlayerActiveMenu(playerid, Menu_Eowina["Handel"]) < GetMenuMaxOptions(Menu_Eowina[Player[playerid].Eowina]) then
			
			GiveItemTrade( playerid );
			
		end
		
	end
	
	if GetPlayerActiveMenu(playerid, Menu_Eowina[Player[playerid].Eowina]) == GetMenuMaxOptions(Menu_Eowina[Player[playerid].Eowina]) then

		if Player[playerid].Handel ~= false then
			
			HideHandel(playerid, "Eowina");
			HideMenuEowina(playerid);
			Player[playerid].Handel = false;
			Player[playerid].Eowina = Player[playerid].Last_Menu;
			ShowMenuEowina(playerid);
		
		else
		
			HideMenuEowina(playerid);
		
		end		

	end
	
end

function GetFocusEowina(playerid)

	return NPC.Eowina;

end

--Menu i Dialog--
local Menu_Tyrion = {};
local Dialog_Tyrion = {};

--Tyrion
Menu_Tyrion[0] = CreateMenu(1, "(КОНЕЦ)", Texture_Menu_NPC, 1450, 6850, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "Tyrion_0");
Menu_Tyrion[1] = CreateMenu(1, "(КОНЕЦ)", Texture_Menu_NPC, 1450, 6850, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "Tyrion_1");
Menu_Tyrion["Handel"] = CreateMenu(7, "(НАЗАД)", Texture_Handel_NPC, 2000, 2000, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "Tyrion_Handel");


--Tyrion Dialog
Dialog_Tyrion[0] = CreateDialog("Tyrion_0", "Тирион");
Dialog_Tyrion[1] = CreateDialog("Tyrion_1", "Тирион");


--Tyrion

function ShowMenuTyrion(playerid)
	
	ShowMenu(playerid, Menu_Tyrion[Player[playerid].Tyrion]);

end

function HideMenuTyrion(playerid)
	
	HideMenu(playerid, Menu_Tyrion[Player[playerid].Tyrion]);

end

function SwithMenuDownTyrion(playerid)

	SwitchDownMenu(playerid, Menu_Tyrion[Player[playerid].Tyrion]);

end

function SwithMenuUpTyrion(playerid)

	SwitchUpMenu(playerid, Menu_Tyrion[Player[playerid].Tyrion]);

end

function StartDialogTyrion(playerid)
	
	if Player[playerid].Tyrion == 0 then
	
		if GetPlayerActiveMenu(playerid, Menu_Tyrion[0]) == 0 then
			
			HideMenuTyrion(playerid);
			DialogStart(playerid, Dialog_Tyrion[0], Menu_Tyrion[1], 1, 0);
			Player[playerid].Tyrion = 1;
			Player[playerid].Dialog = true;
		
		end
		
	elseif Player[playerid].Tyrion == 1 then
	
		if GetPlayerActiveMenu(playerid, Menu_Tyrion[1]) == 0 then
			
			HideMenuTyrion(playerid);
			DialogStart(playerid, Dialog_Tyrion[1], Menu_Tyrion["Handel"], 1, 0);
			Player[playerid].Dialog = true;
			Player[playerid].Last_Menu = 1;
			Player[playerid].Tyrion = "Handel";
			Player[playerid].Handel = true;
			
		end
			
	elseif Player[playerid].Tyrion == "Handel" then
	
		if GetPlayerActiveMenu(playerid, Menu_Tyrion["Handel"]) >= 0 
		and GetPlayerActiveMenu(playerid, Menu_Tyrion["Handel"]) < GetMenuMaxOptions(Menu_Tyrion[Player[playerid].Tyrion]) then
			
			GiveItemTrade( playerid );
		
		end
		
	end
	
	if GetPlayerActiveMenu(playerid, Menu_Tyrion[Player[playerid].Tyrion]) == GetMenuMaxOptions(Menu_Tyrion[Player[playerid].Tyrion]) then

		if Player[playerid].Handel ~= false then
			
			HideHandel(playerid, "Tyrion");
			HideMenuTyrion(playerid);
			Player[playerid].Handel = false;
			Player[playerid].Tyrion = Player[playerid].Last_Menu;
			ShowMenuTyrion(playerid);
		
		else
		
			HideMenuTyrion(playerid);
		
		end;		

	end
	
end

function GetFocusTyrion(playerid)

	return NPC.Tyrion;

end

--Menu i Dialog--
local Menu_Eomer = {};
local Dialog_Eomer = {};

--Eomer
Menu_Eomer[0] = CreateMenu(1, "(КОНЕЦ)", Texture_Menu_NPC, 1450, 6850, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "Eomer_0");
Menu_Eomer[1] = CreateMenu(1, "(КОНЕЦ)", Texture_Menu_NPC, 1450, 6850, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "Eomer_1");
Menu_Eomer["Handel"] = CreateMenu(22, "(НАЗАД)", Texture_Handel_NPC, 2000, 2000, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "Eomer_Handel");

--Eomer Dialog
Dialog_Eomer[0] = CreateDialog("Eomer_0", "Йомер");
Dialog_Eomer[1] = CreateDialog("Eomer_1", "Йомер");


--Eomer

function ShowMenuEomer(playerid)
	
	ShowMenu(playerid, Menu_Eomer[Player[playerid].Eomer]);

end

function HideMenuEomer(playerid)

	HideMenu(playerid, Menu_Eomer[Player[playerid].Eomer]);

end

function SwithMenuDownEomer(playerid)

	SwitchDownMenu(playerid, Menu_Eomer[Player[playerid].Eomer]);

end

function SwithMenuUpEomer(playerid)

	SwitchUpMenu(playerid, Menu_Eomer[Player[playerid].Eomer]);

end

function StartDialogEomer(playerid)
	
	if Player[playerid].Eomer == 0 then
	
		if GetPlayerActiveMenu(playerid, Menu_Eomer[0]) == 0 then
			
			HideMenuEomer(playerid);
			DialogStart(playerid, Dialog_Eomer[0], Menu_Eomer[1], 1, 0);
			Player[playerid].Eomer = 1;
			Player[playerid].Dialog = true;
		
		end
		
	elseif Player[playerid].Eomer == 1 then
	
		if GetPlayerActiveMenu(playerid, Menu_Eomer[1]) == 0 then
			
			HideMenuEomer(playerid);
			DialogStart(playerid, Dialog_Eomer[1], Menu_Eomer["Handel"], 1, 0);
			Player[playerid].Dialog = true;
			Player[playerid].Last_Menu = 1;
			Player[playerid].Eomer = "Handel";
			Player[playerid].Handel = true;
		
		end
		
	elseif Player[playerid].Eomer == "Handel" then
	
		if GetPlayerActiveMenu(playerid, Menu_Eomer["Handel"]) >= 0 
		and GetPlayerActiveMenu(playerid, Menu_Eomer["Handel"]) < GetMenuMaxOptions(Menu_Eomer[Player[playerid].Eomer]) then
			
			GiveItemTrade( playerid );
		
		end
		
	end
	
	if GetPlayerActiveMenu(playerid, Menu_Eomer[Player[playerid].Eomer]) == GetMenuMaxOptions(Menu_Eomer[Player[playerid].Eomer]) then
		
		if Player[playerid].Handel ~= false then
			
			HideHandel(playerid, "Eomer");
			HideMenuEomer(playerid);
			Player[playerid].Handel = false;
			Player[playerid].Eomer = Player[playerid].Last_Menu;
			ShowMenuEomer(playerid);
		
		else
		
			HideMenuEomer(playerid);
		
		end

	end
	
end

function GetFocusEomer(playerid)

	return NPC.Eomer;

end


--Menu i Dialog--
local Menu_Brandon = {};
local Dialog_Brandon = {};

--Brandon
Menu_Brandon[0] = CreateMenu(1, "(КОНЕЦ)", Texture_Menu_NPC, 1450, 6850, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "Brandon_0");
Menu_Brandon[1] = CreateMenu(1, "(КОНЕЦ)", Texture_Menu_NPC, 1450, 6850, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "Brandon_1");
Menu_Brandon["Handel"] = CreateMenu(13, "(КОНЕЦ)", Texture_Handel_NPC, 2000, 2000, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "Brandon_Handel");


--Brandon Dialog
Dialog_Brandon[0] = CreateDialog("Brandon_0", "Брэндон");
Dialog_Brandon[1] = CreateDialog("Brandon_1", "Брэндон");


--Brandon

function ShowMenuBrandon(playerid)
	
	ShowMenu(playerid, Menu_Brandon[Player[playerid].Brandon]);

end

function HideMenuBrandon(playerid)

	HideMenu(playerid, Menu_Brandon[Player[playerid].Brandon]);

end

function SwithMenuDownBrandon(playerid)

	SwitchDownMenu(playerid, Menu_Brandon[Player[playerid].Brandon]);

end

function SwithMenuUpBrandon(playerid)

	SwitchUpMenu(playerid, Menu_Brandon[Player[playerid].Brandon]);

end

function StartDialogBrandon(playerid)
	
	if Player[playerid].Brandon == 0 then
	
		if GetPlayerActiveMenu(playerid, Menu_Brandon[0]) == 0 then
			
			HideMenuBrandon(playerid);
			DialogStart(playerid, Dialog_Brandon[0], Menu_Brandon[1], 1, 0);
			Player[playerid].Brandon = 1;
			Player[playerid].Dialog = true;
		
		end
		
	elseif Player[playerid].Brandon == 1 then
	
		if GetPlayerActiveMenu(playerid, Menu_Brandon[1]) == 0 then
			
			HideMenuBrandon(playerid);
			DialogStart(playerid, Dialog_Brandon[1], Menu_Brandon["Handel"], 1, 0);
			Player[playerid].Dialog = true;
			Player[playerid].Last_Menu = 1;
			Player[playerid].Brandon = "Handel";
			Player[playerid].Handel = true;
		
		end
		
	elseif Player[playerid].Brandon == "Handel" then
	
		if GetPlayerActiveMenu(playerid, Menu_Brandon["Handel"]) >= 0 
		and GetPlayerActiveMenu(playerid, Menu_Brandon["Handel"]) < GetMenuMaxOptions(Menu_Brandon[Player[playerid].Brandon]) then
			
			GiveItemTrade( playerid );
		
		end
		
	end
	
	if GetPlayerActiveMenu(playerid, Menu_Brandon[Player[playerid].Brandon]) == GetMenuMaxOptions(Menu_Brandon[Player[playerid].Brandon]) then
		
		if Player[playerid].Handel ~= false then
			
			HideHandel(playerid, "Brandon");
			HideMenuBrandon(playerid);	
			Player[playerid].Handel = false;
			Player[playerid].Brandon = Player[playerid].Last_Menu;
			ShowMenuBrandon(playerid);
		
		else
		
			HideMenuBrandon(playerid);		
		
		end
		
	end
	
end

function GetFocusBrandon(playerid)

	return NPC.Brandon;

end

--Menu i Dialog--
local Menu_Bethan = {};
local Dialog_Bethan = {};

--Bethan
Menu_Bethan[0] = CreateMenu(1, "(КОНЕЦ)", Texture_Menu_NPC, 1450, 6850, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "Bethan_0");
Menu_Bethan[1] = CreateMenu(1, "(КОНЕЦ)", Texture_Menu_NPC, 1450, 6850, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "Bethan_1");


--Brandon Dialog
Dialog_Bethan[0] = CreateDialog("Bethan_0", "Безан");
Dialog_Bethan[1] = CreateDialog("Bethan_1", "Безан");


--Brandon

function ShowMenuBethan(playerid)
	
	ShowMenu(playerid, Menu_Bethan[Player[playerid].Bethan]);

end

function HideMenuBethan(playerid)

	HideMenu(playerid, Menu_Bethan[Player[playerid].Bethan]);

end

function SwithMenuDownBethan(playerid)

	SwitchDownMenu(playerid, Menu_Bethan[Player[playerid].Bethan]);

end

function SwithMenuUpBethan(playerid)

	SwitchUpMenu(playerid, Menu_Bethan[Player[playerid].Bethan]);

end

function StartDialogBethan(playerid)
	
	if Player[playerid].Bethan == 0 then
	
		if GetPlayerActiveMenu(playerid, Menu_Bethan[0]) == 0 then
			
			HideMenuBethan(playerid);
			DialogStart(playerid, Dialog_Bethan[0], Menu_Bethan[1], 1, 0);
			Player[playerid].Bethan = 1;
			Player[playerid].Dialog = true;
		
		end
		
	elseif Player[playerid].Bethan == 1 then
	
		if GetPlayerActiveMenu(playerid, Menu_Bethan[1]) == 0 then
			
			HideMenuBethan(playerid);
			DialogStart(playerid, Dialog_Bethan[1], Menu_Bethan[1], 1, 0);
			SetPlayerHealth(playerid, GetPlayerMaxHealth(playerid));
			Player[playerid].Dialog = true;
		
		end
		
	end
	
	if GetPlayerActiveMenu(playerid, Menu_Bethan[Player[playerid].Bethan]) == GetMenuMaxOptions(Menu_Bethan[Player[playerid].Bethan]) then

		HideMenuBethan(playerid);		

	end
	
end

function GetFocusBethan(playerid)

	return NPC.Bethan;

end

--Menu i Dialog--
local Menu_Cross = {};
local Dialog_Cross = {};

--Cross
Menu_Cross[0] = CreateMenu(1, "(КОНЕЦ)", Texture_Menu_NPC, 1450, 6850, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "Cross_0");
Menu_Cross[1] = CreateMenu(1, "(КОНЕЦ)", Texture_Menu_NPC, 1450, 6850, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "Cross_1");


--Cross Dialog
Dialog_Cross[0] = CreateDialog("Cross_0", "Кросс");
Dialog_Cross[1] = CreateDialog("Cross_1", "Кросс");


--Cross

function ShowMenuCross(playerid)
	
	ShowMenu(playerid, Menu_Cross[Player[playerid].Cross]);

end

function HideMenuCross(playerid)

	HideMenu(playerid, Menu_Cross[Player[playerid].Cross]);

end

function SwithMenuDownCross(playerid)

	SwitchDownMenu(playerid, Menu_Cross[Player[playerid].Cross]);

end

function SwithMenuUpCross(playerid)

	SwitchUpMenu(playerid, Menu_Cross[Player[playerid].Cross]);

end

function StartDialogCross(playerid)
	
	if Player[playerid].Cross == 0 then
	
		if GetPlayerActiveMenu(playerid, Menu_Cross[0]) == 0 then
			
			HideMenuCross(playerid);
			DialogStart(playerid, Dialog_Cross[0], Menu_Cross[1], 1, 0);
			Player[playerid].Cross = 1;
			Player[playerid].Dialog = true;
		
		end
		
	elseif Player[playerid].Cross == 1 then
	
		if GetPlayerActiveMenu(playerid, Menu_Cross[1]) == 0 then
			
			HideMenuCross(playerid);
			DialogStart(playerid, Dialog_Cross[1], Menu_Trening["Skill_CBow"], 1, 0);
			Player[playerid].Dialog = true;
			Player[playerid].Trening = "Skill_CBow";
		
		end
		
	end
	
	if GetPlayerActiveMenu(playerid, Menu_Cross[Player[playerid].Cross]) == GetMenuMaxOptions(Menu_Cross[Player[playerid].Cross]) then

		HideMenuCross(playerid);		

	end
	
end

function GetFocusCross(playerid)

	return NPC.Cross;

end

--Menu i Dialog--
local Menu_Hagan = {};
local Dialog_Hagan = {};

--Hagan
Menu_Hagan[0] = CreateMenu(1, "(КОНЕЦ)", Texture_Menu_NPC, 1450, 6850, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "Hagan_0");
Menu_Hagan[1] = CreateMenu(1, "(КОНЕЦ)", Texture_Menu_NPC, 1450, 6850, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "Hagan_1");


--Hagan Dialog
Dialog_Hagan[0] = CreateDialog("Hagan_0", "Хаган");
Dialog_Hagan[1] = CreateDialog("Hagan_1", "Хаган");


--Hagan

function ShowMenuHagan(playerid)
	
	ShowMenu(playerid, Menu_Hagan[Player[playerid].Hagan]);

end

function HideMenuHagan(playerid)

	HideMenu(playerid, Menu_Hagan[Player[playerid].Hagan]);

end

function SwithMenuDownHagan(playerid)

	SwitchDownMenu(playerid, Menu_Hagan[Player[playerid].Hagan]);

end

function SwithMenuUpHagan(playerid)

	SwitchUpMenu(playerid, Menu_Hagan[Player[playerid].Hagan]);

end

function StartDialogHagan(playerid)
	
	if Player[playerid].Hagan == 0 then
	
		if GetPlayerActiveMenu(playerid, Menu_Hagan[0]) == 0 then
			
			HideMenuHagan(playerid);
			DialogStart(playerid, Dialog_Hagan[0], Menu_Hagan[1], 1, 0);
			Player[playerid].Hagan = 1;
			Player[playerid].Dialog = true;
		
		end
		
	elseif Player[playerid].Hagan == 1 then
	
		if GetPlayerActiveMenu(playerid, Menu_Hagan[1]) == 0 then
			
			HideMenuHagan(playerid);
			DialogStart(playerid, Dialog_Hagan[1], Menu_Trening["Skill_1H"], 1, 0);
			Player[playerid].Dialog = true;
			Player[playerid].Trening = "Skill_1H";
		
		end
		
	end
	
	if GetPlayerActiveMenu(playerid, Menu_Hagan[Player[playerid].Hagan]) == GetMenuMaxOptions(Menu_Hagan[Player[playerid].Hagan]) then

		HideMenuHagan(playerid);		

	end
	
end

function GetFocusHagan(playerid)

	return NPC.Hagan;

end

--Menu i Dialog--
local Menu_Guy = {};
local Dialog_Guy = {};

--Guy
Menu_Guy[0] = CreateMenu(1, "(КОНЕЦ)", Texture_Menu_NPC, 1450, 6850, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "Guy_0");
Menu_Guy[1] = CreateMenu(1, "(КОНЕЦ)", Texture_Menu_NPC, 1450, 6850, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "Guy_1");


--Guy Dialog
Dialog_Guy[0] = CreateDialog("Guy_0", "Гай");
Dialog_Guy[1] = CreateDialog("Guy_1", "Гай");


--Guy

function ShowMenuGuy(playerid)
	
	ShowMenu(playerid, Menu_Guy[Player[playerid].Guy]);

end

function HideMenuGuy(playerid)

	HideMenu(playerid, Menu_Guy[Player[playerid].Guy]);

end

function SwithMenuDownGuy(playerid)

	SwitchDownMenu(playerid, Menu_Guy[Player[playerid].Guy]);

end

function SwithMenuUpGuy(playerid)

	SwitchUpMenu(playerid, Menu_Guy[Player[playerid].Guy]);

end

function StartDialogGuy(playerid)
	
	if Player[playerid].Guy == 0 then
	
		if GetPlayerActiveMenu(playerid, Menu_Guy[0]) == 0 then
			
			HideMenuGuy(playerid);
			DialogStart(playerid, Dialog_Guy[0], Menu_Guy[1], 1, 0);
			Player[playerid].Guy = 1;
			Player[playerid].Dialog = true;
		
		end
		
	elseif Player[playerid].Guy == 1 then
	
		if GetPlayerActiveMenu(playerid, Menu_Guy[1]) == 0 then
			
			HideMenuGuy(playerid);
			DialogStart(playerid, Dialog_Guy[1], Menu_Trening["Skill_2H"], 1, 0);
			Player[playerid].Dialog = true;
			Player[playerid].Trening = "Skill_2H";
		
		end
		
	end
	
	if GetPlayerActiveMenu(playerid, Menu_Guy[Player[playerid].Guy]) == GetMenuMaxOptions(Menu_Guy[Player[playerid].Guy]) then

		HideMenuGuy(playerid);		

	end
	
end

function GetFocusGuy(playerid)

	return NPC.Guy;

end

--Menu i Dialog--
local Menu_Brain = {};
local Dialog_Brain = {};

--Brain
Menu_Brain[0] = CreateMenu(1, "(КОНЕЦ)", Texture_Menu_NPC, 1450, 6850, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "Brain_0");
Menu_Brain[1] = CreateMenu(1, "(КОНЕЦ)", Texture_Menu_NPC, 1450, 6850, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "Brain_1");


--Brain Dialog
Dialog_Brain[0] = CreateDialog("Brain_0", "Брайан");
Dialog_Brain[1] = CreateDialog("Brain_1", "Брайан");


--Brain

function ShowMenuBrain(playerid)
	
	ShowMenu(playerid, Menu_Brain[Player[playerid].Brain]);

end

function HideMenuBrain(playerid)

	HideMenu(playerid, Menu_Brain[Player[playerid].Brain]);

end

function SwithMenuDownBrain(playerid)

	SwitchDownMenu(playerid, Menu_Brain[Player[playerid].Brain]);

end

function SwithMenuUpBrain(playerid)

	SwitchUpMenu(playerid, Menu_Brain[Player[playerid].Brain]);

end

function StartDialogBrain(playerid)
	
	if Player[playerid].Brain == 0 then
	
		if GetPlayerActiveMenu(playerid, Menu_Brain[0]) == 0 then
			
			HideMenuBrain(playerid);
			DialogStart(playerid, Dialog_Brain[0], Menu_Brain[1], 1, 0);
			Player[playerid].Brain = 1;
			Player[playerid].Dialog = true;
		
		end
		
	elseif Player[playerid].Brain == 1 then
	
		if GetPlayerActiveMenu(playerid, Menu_Brain[1]) == 0 then
			
			HideMenuBrain(playerid);
			DialogStart(playerid, Dialog_Brain[1], Menu_Trening["Str"], 1, 0);
			Player[playerid].Dialog = true;
			Player[playerid].Trening = "Str";
		
		end
		
	end
	
	if GetPlayerActiveMenu(playerid, Menu_Brain[Player[playerid].Brain]) == GetMenuMaxOptions(Menu_Brain[Player[playerid].Brain]) then

		HideMenuBrain(playerid);		

	end
	
end

function GetFocusBrain(playerid)

	return NPC.Brain;

end

--Menu i Dialog--
local Menu_Nieznajomy = {};
local Dialog_Nieznajomy = {};

--Nieznajomy
Menu_Nieznajomy[0] = CreateMenu(1, "(КОНЕЦ)", Texture_Menu_NPC, 1450, 6850, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "Nieznajomy_0");
Menu_Nieznajomy[1] = CreateMenu(2, "(КОНЕЦ)", Texture_Menu_NPC, 1450, 6850, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "Nieznajomy_1");
Menu_Nieznajomy[2] = CreateMenu(5, "(НАЗАД)", Texture_Menu_NPC, 1450, 6850, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "Nieznajomy_roz");


--Nieznajomy Dialog
Dialog_Nieznajomy[0] = CreateDialog("Nieznajomy_0", "Загадочный отшельник");
Dialog_Nieznajomy[1] = CreateDialog("Nieznajomy_1", "Загадочный отшельник");
Dialog_Nieznajomy[2] = CreateDialog("Nieznajomy_roz_1", "Загадочный отшельник");
Dialog_Nieznajomy[3] = CreateDialog("Nieznajomy_roz_2", "Загадочный отшельник");
Dialog_Nieznajomy[4] = CreateDialog("Nieznajomy_roz_3", "Загадочный отшельник");
Dialog_Nieznajomy[5] = CreateDialog("Nieznajomy_roz_4", "Загадочный отшельник");
Dialog_Nieznajomy[6] = CreateDialog("Nieznajomy_roz_5", "Загадочный отшельник");
Dialog_Nieznajomy[7] = CreateDialog("Nieznajomy_skup", "Загадочный отшельник");
Dialog_Nieznajomy[8] = CreateDialog("Nieznajomy_odrzucenie", "Загадочный отшельник");


--Nieznajomy

function DialogNieznajomySkup(playerid)

	DialogStart(playerid, Dialog_Nieznajomy[7], Menu_Nieznajomy[Player[playerid].Nieznajomy], 1, 0);
	
end

function DialogNieznajomyOdrzut(playerid)

	DialogStart(playerid, Dialog_Nieznajomy[8], Menu_Nieznajomy[Player[playerid].Nieznajomy], 1, 0);
	
end

function ShowMenuNieznajomy(playerid)
	
	ShowMenu(playerid, Menu_Nieznajomy[Player[playerid].Nieznajomy]);

end

function HideMenuNieznajomy(playerid)

	HideMenu(playerid, Menu_Nieznajomy[Player[playerid].Nieznajomy]);

end

function SwithMenuDownNieznajomy(playerid)

	SwitchDownMenu(playerid, Menu_Nieznajomy[Player[playerid].Nieznajomy]);

end

function SwithMenuUpNieznajomy(playerid)

	SwitchUpMenu(playerid, Menu_Nieznajomy[Player[playerid].Nieznajomy]);

end

function StartDialogNieznajomy(playerid)
	
	if Player[playerid].Nieznajomy == 0 then
	
		if GetPlayerActiveMenu(playerid, Menu_Nieznajomy[0]) == 0 then
			
			HideMenuNieznajomy(playerid);
			DialogStart(playerid, Dialog_Nieznajomy[0], Menu_Nieznajomy[1], 1, 0);
			Player[playerid].Nieznajomy = 1;
			Player[playerid].Dialog = true;
		
		end
		
	elseif Player[playerid].Nieznajomy == 1 then
	
		if GetPlayerActiveMenu(playerid, Menu_Nieznajomy[1]) == 0 then
			
			HideMenuNieznajomy(playerid);
			DialogStart(playerid, Dialog_Nieznajomy[1], Menu_Nieznajomy[2], 1, 0);
			Player[playerid].Last_Menu = 1;
			Player[playerid].Nieznajomy = 2;
			Player[playerid].Dialog = true;
			
		elseif GetPlayerActiveMenu(playerid, Menu_Nieznajomy[1]) == 1 then
			
			HideMenuNieznajomy(playerid);
			GetBuyItem( playerid );
			Player[playerid].Dialog = true;
		
		end
		
	elseif Player[playerid].Nieznajomy == 2 then
	
		if GetPlayerActiveMenu(playerid, Menu_Nieznajomy[2]) == 0 then
			
			SetSerca( playerid, "Serca" );
			
		elseif GetPlayerActiveMenu(playerid, Menu_Nieznajomy[2]) == 1 then
			
			SetKrew( playerid, "Krew" );
			
		elseif GetPlayerActiveMenu(playerid, Menu_Nieznajomy[2]) == 2 then
			
			SetLuski( playerid, "Luski" );
			
		elseif GetPlayerActiveMenu(playerid, Menu_Nieznajomy[2]) == 3 then
			
			SetKosci( playerid, "Kosci" );
			
		elseif GetPlayerActiveMenu(playerid, Menu_Nieznajomy[2]) == 4 then
			
			SetGlowy( playerid, "Glowy" );
			
		elseif GetPlayerActiveMenu(playerid, Menu_Nieznajomy[2]) == 5 then
			
			HideMenuNieznajomy(playerid);
			SetPlayerLearnPoints(playerid, GetLP(playerid));
			Player[playerid].Nieznajomy = Player[playerid].Last_Menu;
			ShowMenuNieznajomy(playerid);
		
		end
		
	end
	
	if GetPlayerActiveMenu(playerid, Menu_Nieznajomy[Player[playerid].Nieznajomy]) == GetMenuMaxOptions(Menu_Nieznajomy[Player[playerid].Nieznajomy]) then
		
		if Player[playerid].Nieznajomy ~= 2 then
		
			HideMenuNieznajomy(playerid);

		end

	end
	
end

function GetFocusNieznajomy(playerid)

	return NPC.Nieznajomy;

end

--Menu i Dialog--
local Menu_Rafer = {};
local Dialog_Rafer = {};

--Rafer
Menu_Rafer[0] = CreateMenu(1, "(КОНЕЦ)", Texture_Menu_NPC, 1450, 6850, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "Rafer_0");
Menu_Rafer[1] = CreateMenu(1, "(КОНЕЦ)", Texture_Menu_NPC, 1450, 6850, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "Rafer_1");
Menu_Rafer["Handel"] = CreateMenu(16, "(КОНЕЦ)", Texture_Handel_NPC, 2000, 2000, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "Rafer_Handel");

--Rafer Dialog
Dialog_Rafer[0] = CreateDialog("Rafer_0", "Рафер");
Dialog_Rafer[1] = CreateDialog("Rafer_1", "Рафер");


--Rafer

function ShowMenuRafer(playerid)
	
	ShowMenu(playerid, Menu_Rafer[Player[playerid].Rafer]);

end

function HideMenuRafer(playerid)

	HideMenu(playerid, Menu_Rafer[Player[playerid].Rafer]);

end

function SwithMenuDownRafer(playerid)

	SwitchDownMenu(playerid, Menu_Rafer[Player[playerid].Rafer]);

end

function SwithMenuUpRafer(playerid)

	SwitchUpMenu(playerid, Menu_Rafer[Player[playerid].Rafer]);

end

function StartDialogRafer(playerid)
	
	if Player[playerid].Rafer == 0 then
	
		if GetPlayerActiveMenu(playerid, Menu_Rafer[0]) == 0 then
			
			HideMenuRafer(playerid);
			DialogStart(playerid, Dialog_Rafer[0], Menu_Rafer[1], 1, 0);
			Player[playerid].Rafer = 1;
			Player[playerid].Dialog = true;
		
		end
		
	elseif Player[playerid].Rafer == 1 then
	
		if GetPlayerActiveMenu(playerid, Menu_Rafer[1]) == 0 then
			
			HideMenuRafer(playerid);
			DialogStart(playerid, Dialog_Rafer[1], Menu_Rafer["Handel"], 1, 0);
			Player[playerid].Dialog = true;
			Player[playerid].Last_Menu = 1;
			Player[playerid].Rafer = "Handel";
			Player[playerid].Handel = true;
		
		end
		
	elseif Player[playerid].Rafer == "Handel" then
	
		if GetPlayerActiveMenu(playerid, Menu_Rafer["Handel"]) >= 0 
		and GetPlayerActiveMenu(playerid, Menu_Rafer["Handel"]) < GetMenuMaxOptions(Menu_Rafer[Player[playerid].Rafer]) then
			
			GiveItemTrade( playerid );
		
		end
		
	end
	
	if GetPlayerActiveMenu(playerid, Menu_Rafer[Player[playerid].Rafer]) == GetMenuMaxOptions(Menu_Rafer[Player[playerid].Rafer]) then
		
		if Player[playerid].Handel ~= false then
			
			HideHandel(playerid, "Rafer");
			HideMenuRafer(playerid);	
			Player[playerid].Handel = false;
			Player[playerid].Rafer = Player[playerid].Last_Menu;
			ShowMenuRafer(playerid);
		
		else
		
			HideMenuRafer(playerid);		
		
		end
		
	end
	
end

function GetFocusRafer(playerid)

	return NPC.Rafer;

end

--Menu i Dialog--
local Menu_Jenifer = {};
local Dialog_Jenifer = {};

--Jenifer
Menu_Jenifer[0] = CreateMenu(1, "(КОНЕЦ)", Texture_Menu_NPC, 1450, 6850, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "Jenifer_0");
Menu_Jenifer[1] = CreateMenu(1, "(КОНЕЦ)", Texture_Menu_NPC, 1450, 6850, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "Jenifer_1");


--Jenifer Dialog
Dialog_Jenifer[0] = CreateDialog("Jenifer_0", "Дженнифер");
Dialog_Jenifer[1] = CreateDialog("Jenifer_1", "Дженнифер");


--Jenifer

function ShowMenuJenifer(playerid)
	
	ShowMenu(playerid, Menu_Jenifer[Player[playerid].Jenifer]);

end

function HideMenuJenifer(playerid)

	HideMenu(playerid, Menu_Jenifer[Player[playerid].Jenifer]);

end

function SwithMenuDownJenifer(playerid)

	SwitchDownMenu(playerid, Menu_Jenifer[Player[playerid].Jenifer]);

end

function SwithMenuUpJenifer(playerid)

	SwitchUpMenu(playerid, Menu_Jenifer[Player[playerid].Jenifer]);

end

function StartDialogJenifer(playerid)
	
	if Player[playerid].Jenifer == 0 then
	
		if GetPlayerActiveMenu(playerid, Menu_Jenifer[0]) == 0 then
			
			HideMenuJenifer(playerid);
			DialogStart(playerid, Dialog_Jenifer[0], Menu_Jenifer[1], 1, 0);
			Player[playerid].Jenifer = 1;
			Player[playerid].Dialog = true;
		
		end
		
	elseif Player[playerid].Jenifer == 1 then
	
		if GetPlayerActiveMenu(playerid, Menu_Jenifer[1]) == 0 then
			
			HideMenuJenifer(playerid);
			DialogStart(playerid, Dialog_Jenifer[1], Menu_Jenifer[1], 1, 0);
			Player[playerid].Dialog = true;
		
		end
		
	end
	
	if GetPlayerActiveMenu(playerid, Menu_Jenifer[Player[playerid].Jenifer]) == GetMenuMaxOptions(Menu_Jenifer[Player[playerid].Jenifer]) then

		HideMenuJenifer(playerid);		

	end
	
end

function GetFocusJenifer(playerid)

	return NPC.Jenifer;

end

--Menu i Dialog--
local Menu_Dirkland = {};
local Dialog_Dirkland = {};

--Dirkland
Menu_Dirkland[0] = CreateMenu(1, "(КОНЕЦ)", Texture_Menu_NPC, 1450, 6850, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "Dirkland_0");
Menu_Dirkland[1] = CreateMenu(1, "(КОНЕЦ)", Texture_Menu_NPC, 1450, 6850, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "Dirkland_1");


--Dirkland Dialog
Dialog_Dirkland[0] = CreateDialog("Dirkland_0", "Диркланд");
Dialog_Dirkland[1] = CreateDialog("Dirkland_1", "Диркланд");


--Dirkland

function ShowMenuDirkland(playerid)
	
	ShowMenu(playerid, Menu_Dirkland[Player[playerid].Dirkland]);

end

function HideMenuDirkland(playerid)

	HideMenu(playerid, Menu_Dirkland[Player[playerid].Dirkland]);

end

function SwithMenuDownDirkland(playerid)

	SwitchDownMenu(playerid, Menu_Dirkland[Player[playerid].Dirkland]);

end

function SwithMenuUpDirkland(playerid)

	SwitchUpMenu(playerid, Menu_Dirkland[Player[playerid].Dirkland]);

end

function StartDialogDirkland(playerid)
	
	if Player[playerid].Dirkland == 0 then
	
		if GetPlayerActiveMenu(playerid, Menu_Dirkland[0]) == 0 then
			
			HideMenuDirkland(playerid);
			DialogStart(playerid, Dialog_Dirkland[0], Menu_Dirkland[1], 1, 0);
			Player[playerid].Dirkland = 1;
			Player[playerid].Dialog = true;
		
		end
		
	elseif Player[playerid].Dirkland == 1 then
	
		if GetPlayerActiveMenu(playerid, Menu_Dirkland[1]) == 0 then
			
			HideMenuDirkland(playerid);
			DialogStart(playerid, Dialog_Dirkland[1], Menu_Trening["Skill_1H"], 1, 0);
			Player[playerid].Dialog = true;
			Player[playerid].Trening = "Skill_1H";
		
		end
		
	end
	
	if GetPlayerActiveMenu(playerid, Menu_Dirkland[Player[playerid].Dirkland]) == GetMenuMaxOptions(Menu_Dirkland[Player[playerid].Dirkland]) then

		HideMenuDirkland(playerid);		

	end
	
end

function GetFocusDirkland(playerid)

	return NPC.Dirkland;

end

--Menu i Dialog--
local Menu_Greth = {};
local Dialog_Greth = {};

--Greth
Menu_Greth[0] = CreateMenu(1, "(КОНЕЦ)", Texture_Menu_NPC, 1450, 6850, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "Greth_0");
Menu_Greth[1] = CreateMenu(1, "(КОНЕЦ)", Texture_Menu_NPC, 1450, 6850, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "Greth_1");


--Greth Dialog
Dialog_Greth[0] = CreateDialog("Greth_0", "Грет");
Dialog_Greth[1] = CreateDialog("Greth_1", "Грет");


--Greth

function ShowMenuGreth(playerid)
	
	ShowMenu(playerid, Menu_Greth[Player[playerid].Greth]);

end

function HideMenuGreth(playerid)

	HideMenu(playerid, Menu_Greth[Player[playerid].Greth]);

end

function SwithMenuDownGreth(playerid)

	SwitchDownMenu(playerid, Menu_Greth[Player[playerid].Greth]);

end

function SwithMenuUpGreth(playerid)

	SwitchUpMenu(playerid, Menu_Greth[Player[playerid].Greth]);

end

function StartDialogGreth(playerid)
	
	if Player[playerid].Greth == 0 then
	
		if GetPlayerActiveMenu(playerid, Menu_Greth[0]) == 0 then
			
			HideMenuGreth(playerid);
			DialogStart(playerid, Dialog_Greth[0], Menu_Greth[1], 1, 0);
			Player[playerid].Greth = 1;
			Player[playerid].Dialog = true;
		
		end
		
	elseif Player[playerid].Greth == 1 then
	
		if GetPlayerActiveMenu(playerid, Menu_Greth[1]) == 0 then
			
			HideMenuGreth(playerid);
			DialogStart(playerid, Dialog_Greth[1], Menu_Trening["Skill_2H"], 1, 0);
			Player[playerid].Dialog = true;
			Player[playerid].Trening = "Skill_2H";
		
		end
		
	end
	
	if GetPlayerActiveMenu(playerid, Menu_Greth[Player[playerid].Greth]) == GetMenuMaxOptions(Menu_Greth[Player[playerid].Greth]) then

		HideMenuGreth(playerid);		

	end
	
end

function GetFocusGreth(playerid)

	return NPC.Greth;

end

--Menu i Dialog--
local Menu_Cahan = {};
local Dialog_Cahan = {};

--Cahan
Menu_Cahan[0] = CreateMenu(1, "(КОНЕЦ)", Texture_Menu_NPC, 1450, 6850, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "Cahan_0");
Menu_Cahan[1] = CreateMenu(1, "(КОНЕЦ)", Texture_Menu_NPC, 1450, 6850, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "Cahan_1");


--Cahan Dialog
Dialog_Cahan[0] = CreateDialog("Cahan_0", "Кахан");
Dialog_Cahan[1] = CreateDialog("Cahan_1", "Кахан");


--Cahan

function ShowMenuCahan(playerid)
	
	ShowMenu(playerid, Menu_Cahan[Player[playerid].Cahan]);

end

function HideMenuCahan(playerid)

	HideMenu(playerid, Menu_Cahan[Player[playerid].Cahan]);

end

function SwithMenuDownCahan(playerid)

	SwitchDownMenu(playerid, Menu_Cahan[Player[playerid].Cahan]);

end

function SwithMenuUpCahan(playerid)

	SwitchUpMenu(playerid, Menu_Cahan[Player[playerid].Cahan]);

end

function StartDialogCahan(playerid)
	
	if Player[playerid].Cahan == 0 then
	
		if GetPlayerActiveMenu(playerid, Menu_Cahan[0]) == 0 then
			
			HideMenuCahan(playerid);
			DialogStart(playerid, Dialog_Cahan[0], Menu_Cahan[1], 1, 0);
			Player[playerid].Cahan = 1;
			Player[playerid].Dialog = true;
		
		end
		
	elseif Player[playerid].Cahan == 1 then
	
		if GetPlayerActiveMenu(playerid, Menu_Cahan[1]) == 0 then
			
			HideMenuCahan(playerid);
			DialogStart(playerid, Dialog_Cahan[1], Menu_Trening["Str"], 1, 0);
			Player[playerid].Dialog = true;
			Player[playerid].Trening = "Str";
		
		end
		
	end
	
	if GetPlayerActiveMenu(playerid, Menu_Cahan[Player[playerid].Cahan]) == GetMenuMaxOptions(Menu_Cahan[Player[playerid].Cahan]) then

		HideMenuCahan(playerid);		

	end
	
end

function GetFocusCahan(playerid)

	return NPC.Cahan;

end

--Menu i Dialog--
local Menu_Regin = {};
local Dialog_Regin = {};

--Regin
Menu_Regin[0] = CreateMenu(1, "(КОНЕЦ)", Texture_Menu_NPC, 1450, 6850, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "Regin_0");
Menu_Regin[1] = CreateMenu(1, "(КОНЕЦ)", Texture_Menu_NPC, 1450, 6850, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "Regin_1");

--Regin Dialog
Dialog_Regin[0] = CreateDialog("Regin_0", "Регин");
Dialog_Regin[1] = CreateDialog("Regin_skup", "Регин");
Dialog_Regin[2] = CreateDialog("Regin_odrzucenie", "Регин");


--Regin

function DialogReginSkup(playerid)

	DialogStart(playerid, Dialog_Regin[1], Menu_Regin[Player[playerid].Regin], 1, 0);
	
end

function DialogReginOdrzut(playerid)

	DialogStart(playerid, Dialog_Regin[2], Menu_Regin[Player[playerid].Regin], 1, 0);
	
end

function ShowMenuRegin(playerid)
	
	ShowMenu(playerid, Menu_Regin[Player[playerid].Regin]);

end

function HideMenuRegin(playerid)

	HideMenu(playerid, Menu_Regin[Player[playerid].Regin]);

end

function SwithMenuDownRegin(playerid)

	SwitchDownMenu(playerid, Menu_Regin[Player[playerid].Regin]);

end

function SwithMenuUpRegin(playerid)

	SwitchUpMenu(playerid, Menu_Regin[Player[playerid].Regin]);

end

function StartDialogRegin(playerid)
	
	if Player[playerid].Regin == 0 then
	
		if GetPlayerActiveMenu(playerid, Menu_Regin[0]) == 0 then
			
			HideMenuRegin(playerid);
			DialogStart(playerid, Dialog_Regin[0], Menu_Regin[1], 1, 0);
			Player[playerid].Regin = 1;
			Player[playerid].Dialog = true;
		
		end
		
	elseif Player[playerid].Regin == 1 then
	
		if GetPlayerActiveMenu(playerid, Menu_Regin[1]) == 0 then
			
			HideMenuRegin(playerid);
			GetBuyItem_Random( playerid );
			Player[playerid].Dialog = true;
		
		end
		
	end
	
	if GetPlayerActiveMenu(playerid, Menu_Regin[Player[playerid].Regin]) == GetMenuMaxOptions(Menu_Regin[Player[playerid].Regin]) then
		
		HideMenuRegin(playerid);

	end
	
end

function GetFocusRegin(playerid)

	return NPC.Regin;

end


--Menu i Dialog--
local Menu_Magnus = {};
local Dialog_Magnus = {};

--Magnus
Menu_Magnus[0] = CreateMenu(1, "(КОНЕЦ)", Texture_Menu_NPC, 1450, 6850, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "Magnus_0");
Menu_Magnus[1] = CreateMenu(1, "(КОНЕЦ)", Texture_Menu_NPC, 1450, 6850, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "Magnus_1");

--Magnus Dialog
Dialog_Magnus[0] = CreateDialog("Magnus_0", "Магнус");
Dialog_Magnus[1] = CreateDialog("Magnus_tp_true", "Магнус");
Dialog_Magnus[2] = CreateDialog("Magnus_tp_false", "Магнус");

--Magnus

function ShowMenuMagnus(playerid)
	
	ShowMenu(playerid, Menu_Magnus[Player[playerid].Magnus]);

end

function HideMenuMagnus(playerid)

	HideMenu(playerid, Menu_Magnus[Player[playerid].Magnus]);

end

function SwithMenuDownMagnus(playerid)

	SwitchDownMenu(playerid, Menu_Magnus[Player[playerid].Magnus]);

end

function SwithMenuUpMagnus(playerid)

	SwitchUpMenu(playerid, Menu_Magnus[Player[playerid].Magnus]);

end

function StartDialogMagnus(playerid)
	
	if Player[playerid].Magnus == 0 then
	
		if GetPlayerActiveMenu(playerid, Menu_Magnus[0]) == 0 then
			
			HideMenuMagnus(playerid);
			DialogStart(playerid, Dialog_Magnus[0], Menu_Magnus[1], 1, 0);
			Player[playerid].Magnus = 1;
			Player[playerid].Dialog = true;
		
		end
		
	elseif Player[playerid].Magnus == 1 then
	
		if GetPlayerActiveMenu(playerid, Menu_Magnus[1]) == 0 then
			
			HideMenuMagnus(playerid);
			
			if GetPlayerLevel(playerid) >= GD_Gothic2_Lvl then
			
				DialogStart(playerid, Dialog_Magnus[1], Menu_Magnus[1], 0, 0);
				Player[playerid].TP = true;
				
			else
				
				DialogStart(playerid, Dialog_Magnus[2], Menu_Magnus[1], 1, 0);
				
			end
			
			Player[playerid].Dialog = true;
		
		end
		
	end
	
	if GetPlayerActiveMenu(playerid, Menu_Magnus[Player[playerid].Magnus]) == GetMenuMaxOptions(Menu_Magnus[Player[playerid].Magnus]) then
		
		HideMenuMagnus(playerid);

	end
	
end

function GetFocusMagnus(playerid)

	return NPC.Magnus;

end

--Menu i Dialog--
local Menu_Cheamel = {};
local Dialog_Cheamel = {};

--Cheamel
Menu_Cheamel[0] = CreateMenu(1, "(КОНЕЦ)", Texture_Menu_NPC, 1450, 6850, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "Cheamel_0");
Menu_Cheamel[1] = CreateMenu(1, "(КОНЕЦ)", Texture_Menu_NPC, 1450, 6850, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "Cheamel_1");

--Cheamel Dialog
Dialog_Cheamel[0] = CreateDialog("Cheamel_0", "Чимел");
Dialog_Cheamel[1] = CreateDialog("Cheamel_tp", "Чимел");

--Cheamel

function ShowMenuCheamel(playerid)
	
	ShowMenu(playerid, Menu_Cheamel[Player[playerid].Cheamel]);

end

function HideMenuCheamel(playerid)

	HideMenu(playerid, Menu_Cheamel[Player[playerid].Cheamel]);

end

function SwithMenuDownCheamel(playerid)

	SwitchDownMenu(playerid, Menu_Cheamel[Player[playerid].Cheamel]);

end

function SwithMenuUpCheamel(playerid)

	SwitchUpMenu(playerid, Menu_Cheamel[Player[playerid].Cheamel]);

end

function StartDialogCheamel(playerid)
	
	if Player[playerid].Cheamel == 0 then
	
		if GetPlayerActiveMenu(playerid, Menu_Cheamel[0]) == 0 then
			
			HideMenuCheamel(playerid);
			DialogStart(playerid, Dialog_Cheamel[0], Menu_Cheamel[1], 1, 0);
			Player[playerid].Cheamel = 1;
			Player[playerid].Dialog = true;
		
		end
		
	elseif Player[playerid].Cheamel == 1 then
	
		if GetPlayerActiveMenu(playerid, Menu_Cheamel[1]) == 0 then
			
			HideMenuCheamel(playerid);	
			DialogStart(playerid, Dialog_Cheamel[1], Menu_Cheamel[1], 0, 0);
			Player[playerid].TP = true;
			Player[playerid].Dialog = true;
		
		end
		
	end
	
	if GetPlayerActiveMenu(playerid, Menu_Cheamel[Player[playerid].Cheamel]) == GetMenuMaxOptions(Menu_Cheamel[Player[playerid].Cheamel]) then
		
		HideMenuCheamel(playerid);

	end
	
end

function GetFocusCheamel(playerid)

	return NPC.Cheamel;

end

--Menu i Dialog--
local Menu_Fagar = {};
local Dialog_Fagar = {};

--Fagar
Menu_Fagar[0] = CreateMenu(1, "(КОНЕЦ)", Texture_Menu_NPC, 1450, 6850, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "Fagar_0");
Menu_Fagar[1] = CreateMenu(1, "(КОНЕЦ)", Texture_Menu_NPC, 1450, 6850, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "Fagar_1");
Menu_Fagar[2] = CreateMenu(24, "(НАЗАД)", Texture_Handel_NPC, 2000, 2000, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "Fagar_skup");
Menu_Fagar[3] = CreateMenu(23, "(НАЗАД)", Texture_Handel_NPC, 2000, 2000, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "Fagar_skup_2");
Menu_Fagar[4] = CreateMenu(22, "(НАЗАД)", Texture_Handel_NPC, 2000, 2000, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "Fagar_skup_3");

--Fagar Dialog
Dialog_Fagar[0] = CreateDialog("Fagar_0", "Фагар");
Dialog_Fagar[1] = CreateDialog("Fagar_1", "Фагар");

--Fagar

function ShowMenuFagar(playerid)
	
	ShowMenu(playerid, Menu_Fagar[Player[playerid].Fagar]);

end

function HideMenuFagar(playerid)

	HideMenu(playerid, Menu_Fagar[Player[playerid].Fagar]);

end

function HideMenuDrawsFagar(playerid)

	HideMenuDraws(playerid, Menu_Fagar[Player[playerid].Fagar]);

end

function SwithMenuDownFagar(playerid)

	SwitchDownMenu(playerid, Menu_Fagar[Player[playerid].Fagar]);

end

function SwithMenuUpFagar(playerid)

	SwitchUpMenu(playerid, Menu_Fagar[Player[playerid].Fagar]);

end

function StartDialogFagar(playerid)
	
	if Player[playerid].Fagar == 0 then
	
		if GetPlayerActiveMenu(playerid, Menu_Fagar[0]) == 0 then
			
			HideMenuFagar(playerid);
			DialogStart(playerid, Dialog_Fagar[0], Menu_Fagar[1], 1, 0);
			Player[playerid].Fagar = 1;
			Player[playerid].Dialog = true;
		
		end
		
	elseif Player[playerid].Fagar == 1 then
	
		if GetPlayerActiveMenu(playerid, Menu_Fagar[1]) == 0 then
			
			HideMenuFagar(playerid);
			DialogStart(playerid, Dialog_Fagar[1], Menu_Fagar[2], 1, 0);
			Player[playerid].Fagar = 2;
			Player[playerid].Last_Menu = 1;
			Player[playerid].Handel = "skup"; -- Wyj№tkowo nie true poniewaї to skup
			Player[playerid].Dialog = true;
		
		end
		
	elseif Player[playerid].Fagar == 2 then
		
		if GetPlayerActiveMenu(playerid, Menu_Fagar[2]) == GetMenuMaxOptions(Menu_Fagar[Player[playerid].Fagar]) - 1 then
			
			HideMenuDrawsFagar(playerid);
			HideHandel(playerid, "Fagar" .. Player[playerid].Fagar);
			Player[playerid].Fagar = 3;
			ShowMenuFagar(playerid);
			ShowHandel(playerid, "Fagar" .. Player[playerid].Fagar);
			
		else
		
			SellItemFagar( playerid, Player[playerid].Fagar, GetPlayerActiveMenu(playerid, Menu_Fagar[2]) );
		
		end
		
	elseif Player[playerid].Fagar == 3 then
	
		if GetPlayerActiveMenu(playerid, Menu_Fagar[3]) == GetMenuMaxOptions(Menu_Fagar[Player[playerid].Fagar]) - 1 then
			
			HideMenuDrawsFagar(playerid);
			HideHandel(playerid, "Fagar" .. Player[playerid].Fagar);
			Player[playerid].Fagar = 4;
			ShowMenuFagar(playerid);
			ShowHandel(playerid, "Fagar" .. Player[playerid].Fagar);
			
		else
		
			SellItemFagar( playerid, Player[playerid].Fagar, GetPlayerActiveMenu(playerid, Menu_Fagar[3]) );
		
		end
		
	elseif Player[playerid].Fagar == 4 then
	
		if GetPlayerActiveMenu(playerid, Menu_Fagar[4]) == GetMenuMaxOptions(Menu_Fagar[Player[playerid].Fagar]) - 1 then
			
			HideMenuDrawsFagar(playerid);
			HideHandel(playerid, "Fagar" .. Player[playerid].Fagar);
			Player[playerid].Fagar = 2;
			ShowMenuFagar(playerid);
			ShowHandel(playerid, "Fagar" .. Player[playerid].Fagar);
			
		else
		
			SellItemFagar( playerid, Player[playerid].Fagar, GetPlayerActiveMenu(playerid, Menu_Fagar[4]) );
		
		end	
			
	end
	
	if GetPlayerActiveMenu(playerid, Menu_Fagar[Player[playerid].Fagar]) == GetMenuMaxOptions(Menu_Fagar[Player[playerid].Fagar]) then
		
		if Player[playerid].Handel ~= false then
			
			HideHandel(playerid, "Fagar" .. Player[playerid].Fagar);
			HideMenuFagar(playerid);	
			Player[playerid].Handel = false;
			Player[playerid].Fagar = Player[playerid].Last_Menu;
			ShowMenuFagar(playerid);
		
		else
		
			HideMenuFagar(playerid);
			
		end

	end
	
end

function GetFocusFagar(playerid)

	return NPC.Fagar;

end

--Menu i Dialog--
local Menu_Gerald = {};
local Dialog_Gerald = {};

--Gerald
Menu_Gerald[0] = CreateMenu(1, "(КОНЕЦ)", Texture_Menu_NPC, 1450, 6850, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "Gerald_0");
Menu_Gerald[1] = CreateMenu(1, "(КОНЕЦ)", Texture_Menu_NPC, 1450, 6850, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "Gerald_1");
Menu_Gerald["Handel"] = CreateMenu(10, "(НАЗАД)", Texture_Handel_NPC, 2000, 2000, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "Gerald_Handel");

--Gerald Dialog
Dialog_Gerald[0] = CreateDialog("Gerald_0", "Геральд");
Dialog_Gerald[1] = CreateDialog("Gerald_1", "Геральд");


--Gerald

function ShowMenuGerald(playerid)
	
	ShowMenu(playerid, Menu_Gerald[Player[playerid].Gerald]);

end

function HideMenuGerald(playerid)

	HideMenu(playerid, Menu_Gerald[Player[playerid].Gerald]);

end

function SwithMenuDownGerald(playerid)

	SwitchDownMenu(playerid, Menu_Gerald[Player[playerid].Gerald]);

end

function SwithMenuUpGerald(playerid)

	SwitchUpMenu(playerid, Menu_Gerald[Player[playerid].Gerald]);

end

function StartDialogGerald(playerid)
	
	if Player[playerid].Gerald == 0 then
	
		if GetPlayerActiveMenu(playerid, Menu_Gerald[0]) == 0 then
			
			HideMenuGerald(playerid);
			DialogStart(playerid, Dialog_Gerald[0], Menu_Gerald[1], 1, 0);
			Player[playerid].Gerald = 1;
			Player[playerid].Dialog = true;
		
		end
		
	elseif Player[playerid].Gerald == 1 then
	
		if GetPlayerActiveMenu(playerid, Menu_Gerald[1]) == 0 then
			
			HideMenuGerald(playerid);
			DialogStart(playerid, Dialog_Gerald[1], Menu_Gerald["Handel"], 1, 0);
			Player[playerid].Dialog = true;
			Player[playerid].Last_Menu = 1;
			Player[playerid].Gerald = "Handel";
			Player[playerid].Handel = true;
		
		end
		
	elseif Player[playerid].Gerald == "Handel" then
	
		if GetPlayerActiveMenu(playerid, Menu_Gerald["Handel"]) >= 0 
		and GetPlayerActiveMenu(playerid, Menu_Gerald["Handel"]) < GetMenuMaxOptions(Menu_Gerald[Player[playerid].Gerald]) then
			
			GiveItemTrade( playerid );
		
		end
		
	end
	
	if GetPlayerActiveMenu(playerid, Menu_Gerald[Player[playerid].Gerald]) == GetMenuMaxOptions(Menu_Gerald[Player[playerid].Gerald]) then
		
		if Player[playerid].Handel ~= false then
			
			HideHandel(playerid, "Gerald");
			HideMenuGerald(playerid);
			Player[playerid].Handel = false;
			Player[playerid].Gerald = Player[playerid].Last_Menu;
			ShowMenuGerald(playerid);
		
		else
		
			HideMenuGerald(playerid);
		
		end

	end
	
end

function GetFocusGerald(playerid)

	return NPC.Gerald;

end

--Menu i Dialog--
local Menu_Vasilas = {};
local Dialog_Vasilas = {};

--Vasilas
Menu_Vasilas[0] = CreateMenu(1, "(КОНЕЦ)", Texture_Menu_NPC, 1450, 6850, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "Vasilas_0");
Menu_Vasilas[1] = CreateMenu(1, "(КОНЕЦ)", Texture_Menu_NPC, 1450, 6850, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "Vasilas_1");
Menu_Vasilas["Handel"] = CreateMenu(14, "(НАЗАД)", Texture_Handel_NPC, 2000, 2000, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "Vasilas_Handel");

--Vasilas Dialog
Dialog_Vasilas[0] = CreateDialog("Vasilas_0", "Василий");
Dialog_Vasilas[1] = CreateDialog("Vasilas_1", "Василий");


--Vasilas

function ShowMenuVasilas(playerid)
	
	ShowMenu(playerid, Menu_Vasilas[Player[playerid].Vasilas]);

end

function HideMenuVasilas(playerid)

	HideMenu(playerid, Menu_Vasilas[Player[playerid].Vasilas]);

end

function SwithMenuDownVasilas(playerid)

	SwitchDownMenu(playerid, Menu_Vasilas[Player[playerid].Vasilas]);

end

function SwithMenuUpVasilas(playerid)

	SwitchUpMenu(playerid, Menu_Vasilas[Player[playerid].Vasilas]);

end

function StartDialogVasilas(playerid)
	
	if Player[playerid].Vasilas == 0 then
	
		if GetPlayerActiveMenu(playerid, Menu_Vasilas[0]) == 0 then
			
			HideMenuVasilas(playerid);
			DialogStart(playerid, Dialog_Vasilas[0], Menu_Vasilas[1], 1, 0);
			Player[playerid].Vasilas = 1;
			Player[playerid].Dialog = true;
		
		end
		
	elseif Player[playerid].Vasilas == 1 then
	
		if GetPlayerActiveMenu(playerid, Menu_Vasilas[1]) == 0 then
			
			HideMenuVasilas(playerid);
			DialogStart(playerid, Dialog_Vasilas[1], Menu_Vasilas["Handel"], 1, 0);
			Player[playerid].Dialog = true;
			Player[playerid].Last_Menu = 1;
			Player[playerid].Vasilas = "Handel";
			Player[playerid].Handel = true;
		
		end
		
	elseif Player[playerid].Vasilas == "Handel" then
	
		if GetPlayerActiveMenu(playerid, Menu_Vasilas["Handel"]) >= 0 
		and GetPlayerActiveMenu(playerid, Menu_Vasilas["Handel"]) < GetMenuMaxOptions(Menu_Vasilas[Player[playerid].Vasilas]) then
			
			GiveItemTrade( playerid );
		
		end
		
	end
	
	if GetPlayerActiveMenu(playerid, Menu_Vasilas[Player[playerid].Vasilas]) == GetMenuMaxOptions(Menu_Vasilas[Player[playerid].Vasilas]) then
		
		if Player[playerid].Handel ~= false then
			
			HideHandel(playerid, "Vasilas");
			HideMenuVasilas(playerid);
			Player[playerid].Handel = false;
			Player[playerid].Vasilas = Player[playerid].Last_Menu;
			ShowMenuVasilas(playerid);
		
		else
		
			HideMenuVasilas(playerid);
		
		end

	end
	
end

function GetFocusVasilas(playerid)

	return NPC.Vasilas;

end

--Menu i Dialog--
local Menu_Rudin = {};
local Dialog_Rudin = {};

--Rudin
Menu_Rudin[0] = CreateMenu(1, "(КОНЕЦ)", Texture_Menu_NPC, 1450, 6850, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "Rudin_0");
Menu_Rudin[1] = CreateMenu(1, "(КОНЕЦ)", Texture_Menu_NPC, 1450, 6850, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "Rudin_1");
Menu_Rudin["Handel"] = CreateMenu(11, "(НАЗАД)", Texture_Handel_NPC, 2000, 2000, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "Rudin_Handel");

--Rudin Dialog
Dialog_Rudin[0] = CreateDialog("Rudin_0", "Рудин");
Dialog_Rudin[1] = CreateDialog("Rudin_1", "Рудин");


--Rudin

function ShowMenuRudin(playerid)
	
	ShowMenu(playerid, Menu_Rudin[Player[playerid].Rudin]);

end

function HideMenuRudin(playerid)

	HideMenu(playerid, Menu_Rudin[Player[playerid].Rudin]);

end

function SwithMenuDownRudin(playerid)

	SwitchDownMenu(playerid, Menu_Rudin[Player[playerid].Rudin]);

end

function SwithMenuUpRudin(playerid)

	SwitchUpMenu(playerid, Menu_Rudin[Player[playerid].Rudin]);

end

function StartDialogRudin(playerid)
	
	if Player[playerid].Rudin == 0 then
	
		if GetPlayerActiveMenu(playerid, Menu_Rudin[0]) == 0 then
			
			HideMenuRudin(playerid);
			DialogStart(playerid, Dialog_Rudin[0], Menu_Rudin[1], 1, 0);
			Player[playerid].Rudin = 1;
			Player[playerid].Dialog = true;
		
		end
		
	elseif Player[playerid].Rudin == 1 then
	
		if GetPlayerActiveMenu(playerid, Menu_Rudin[1]) == 0 then
			
			HideMenuRudin(playerid);
			DialogStart(playerid, Dialog_Rudin[1], Menu_Rudin["Handel"], 1, 0);
			Player[playerid].Dialog = true;
			Player[playerid].Last_Menu = 1;
			Player[playerid].Rudin = "Handel";
			Player[playerid].Handel = true;
		
		end
		
	elseif Player[playerid].Rudin == "Handel" then
	
		if GetPlayerActiveMenu(playerid, Menu_Rudin["Handel"]) >= 0 
		and GetPlayerActiveMenu(playerid, Menu_Rudin["Handel"]) < GetMenuMaxOptions(Menu_Rudin[Player[playerid].Rudin]) then
			
			GiveItemTrade( playerid );
		
		end
		
	end
	
	if GetPlayerActiveMenu(playerid, Menu_Rudin[Player[playerid].Rudin]) == GetMenuMaxOptions(Menu_Rudin[Player[playerid].Rudin]) then
		
		if Player[playerid].Handel ~= false then
			
			HideHandel(playerid, "Rudin");
			HideMenuRudin(playerid);
			Player[playerid].Handel = false;
			Player[playerid].Rudin = Player[playerid].Last_Menu;
			ShowMenuRudin(playerid);
		
		else
		
			HideMenuRudin(playerid);
		
		end

	end
	
end

function GetFocusRudin(playerid)

	return NPC.Rudin;

end

--Menu i Dialog--
local Menu_Urgan = {};
local Dialog_Urgan = {};

--Urgan
Menu_Urgan[0] = CreateMenu(1, "(КОНЕЦ)", Texture_Menu_NPC, 1450, 6850, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "Urgan_0");
Menu_Urgan[1] = CreateMenu(1, "(КОНЕЦ)", Texture_Menu_NPC, 1450, 6850, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "Urgan_1");
Menu_Urgan["Handel"] = CreateMenu(21, "(НАЗАД)", Texture_Handel_NPC, 2000, 2000, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "Urgan_Handel");

--Urgan Dialog
Dialog_Urgan[0] = CreateDialog("Urgan_0", "Урган");
Dialog_Urgan[1] = CreateDialog("Urgan_1", "Урган");


--Urgan

function ShowMenuUrgan(playerid)
	
	ShowMenu(playerid, Menu_Urgan[Player[playerid].Urgan]);

end

function HideMenuUrgan(playerid)

	HideMenu(playerid, Menu_Urgan[Player[playerid].Urgan]);

end

function SwithMenuDownUrgan(playerid)

	SwitchDownMenu(playerid, Menu_Urgan[Player[playerid].Urgan]);

end

function SwithMenuUpUrgan(playerid)

	SwitchUpMenu(playerid, Menu_Urgan[Player[playerid].Urgan]);

end

function StartDialogUrgan(playerid)
	
	if Player[playerid].Urgan == 0 then
	
		if GetPlayerActiveMenu(playerid, Menu_Urgan[0]) == 0 then
			
			HideMenuUrgan(playerid);
			DialogStart(playerid, Dialog_Urgan[0], Menu_Urgan[1], 1, 0);
			Player[playerid].Urgan = 1;
			Player[playerid].Dialog = true;
		
		end
		
	elseif Player[playerid].Urgan == 1 then
	
		if GetPlayerActiveMenu(playerid, Menu_Urgan[1]) == 0 then
			
			HideMenuUrgan(playerid);
			DialogStart(playerid, Dialog_Urgan[1], Menu_Urgan["Handel"], 1, 0);
			Player[playerid].Dialog = true;
			Player[playerid].Last_Menu = 1;
			Player[playerid].Urgan = "Handel";
			Player[playerid].Handel = true;
		
		end
		
	elseif Player[playerid].Urgan == "Handel" then
	
		if GetPlayerActiveMenu(playerid, Menu_Urgan["Handel"]) >= 0 
		and GetPlayerActiveMenu(playerid, Menu_Urgan["Handel"]) < GetMenuMaxOptions(Menu_Urgan[Player[playerid].Urgan]) then
			
			GiveItemTrade( playerid );
		
		end
		
	end
	
	if GetPlayerActiveMenu(playerid, Menu_Urgan[Player[playerid].Urgan]) == GetMenuMaxOptions(Menu_Urgan[Player[playerid].Urgan]) then
		
		if Player[playerid].Handel ~= false then
			
			HideHandel(playerid, "Urgan");
			HideMenuUrgan(playerid);
			Player[playerid].Handel = false;
			Player[playerid].Urgan = Player[playerid].Last_Menu;
			ShowMenuUrgan(playerid);
		
		else
		
			HideMenuUrgan(playerid);
		
		end

	end
	
end

function GetFocusUrgan(playerid)

	return NPC.Urgan;

end


--[[Nefarus
Menu_Nefarus[0] = CreateMenu(1, "(КОНЕЦ)", Texture_Menu_NPC, 1450, 6850, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "Nefarus_0");
Menu_Nefarus[1] = CreateMenu(1, "(КОНЕЦ)", Texture_Menu_NPC, 1450, 6850, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "Nefarus_1");
Menu_Nefarus[2] = CreateMenu(2, "(НАЗАД)", Texture_Menu_NPC, 1450, 6850, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "Nefarus_roz");

--Nefarus Dialog
Dialog_Nefarus[0] = CreateDialog("Nefarus_0", "Нефариус");
Dialog_Nefarus[1] = CreateDialog("Nefarus_1", "Нефариус");
Dialog_Nefarus[2] = CreateDialog("Nefarus_roz_1", "Нефариус");
Dialog_Nefarus[3] = CreateDialog("Nefarus_roz_2", "Нефариус");]]

--Nefarus

--Menu i Dialog--
local Menu_Nefarus = {};
local Dialog_Nefarus = {};

--Nefarus
Menu_Nefarus[0] = CreateMenu(1, "(КОНЕЦ)", Texture_Menu_NPC, 1450, 6850, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "Nefarus_0");
Menu_Nefarus[1] = CreateMenu(1, "(КОНЕЦ)", Texture_Menu_NPC, 1450, 6850, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "Nefarus_1");
Menu_Nefarus[2] = CreateMenu(2, "(КОНЕЦ)", Texture_Menu_NPC, 1450, 6850, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "Nefarus_roz");

--Nefarus Dialog
Dialog_Nefarus[0] = CreateDialog("Nefarus_0", "Нефариус");
Dialog_Nefarus[1] = CreateDialog("Nefarus_1", "Нефариус");
Dialog_Nefarus[2] = CreateDialog("Nefarus_roz_1", "Нефариус");
Dialog_Nefarus[3] = CreateDialog("Nefarus_roz_2", "Нефариус");


--Nefarus


function ShowMenuNefarus(playerid)
	
	ShowMenu(playerid, Menu_Nefarus[Player[playerid].Nefarus]);

end

function HideMenuNefarus(playerid)

	HideMenu(playerid, Menu_Nefarus[Player[playerid].Nefarus]);

end

function SwithMenuDownNefarus(playerid)

	SwitchDownMenu(playerid, Menu_Nefarus[Player[playerid].Nefarus]);

end

function SwithMenuUpNefarus(playerid)

	SwitchUpMenu(playerid, Menu_Nefarus[Player[playerid].Nefarus]);

end

function StartDialogNefarus(playerid)
	
	if Player[playerid].Nefarus == 0 then
	
		if GetPlayerActiveMenu(playerid, Menu_Nefarus[0]) == 0 then
			
			HideMenuNefarus(playerid);
			DialogStart(playerid, Dialog_Nefarus[0], Menu_Nefarus[1], 1, 0);
			Player[playerid].Nefarus = 1;
			Player[playerid].Dialog = true;
		
		end
		
	elseif Player[playerid].Nefarus == 1 then
	
		if GetPlayerActiveMenu(playerid, Menu_Nefarus[1]) == 0 then
			
			HideMenuNefarus(playerid);
			DialogStart(playerid, Dialog_Nefarus[1], Menu_Nefarus[2], 1, 0);
			Player[playerid].Last_Menu = 1;
			Player[playerid].Nefarus = 2;
			Player[playerid].Dialog = true;
			
		elseif GetPlayerActiveMenu(playerid, Menu_Nefarus[1]) == 1 then
			
			HideMenuNefarus(playerid);
			GetBuyItem( playerid );
		
		end
		
	elseif Player[playerid].Nefarus == 2 then
	
		if GetPlayerActiveMenu(playerid, Menu_Nefarus[2]) == 0 then
			
			SetRog( playerid, "Rog" );
			SetPlayerLearnPoints(playerid, GetLP(playerid));
			
		elseif GetPlayerActiveMenu(playerid, Menu_Nefarus[2]) == 1 then
			
			SetPlyty( playerid, "Plyty" );
			SetPlayerLearnPoints(playerid, GetLP(playerid));

		elseif GetPlayerActiveMenu(playerid, Menu_Nefarus[2]) == 2 then

			HideMenuNefarus(playerid);
		
		end
		
	end
	
	if GetPlayerActiveMenu(playerid, Menu_Nefarus[Player[playerid].Nefarus]) == GetMenuMaxOptions(Menu_Nefarus[Player[playerid].Nefarus]) then
		
		if Player[playerid].Nefarus ~= 2 then
		
			HideMenuNefarus(playerid);

		end

	end
	
end

function GetFocusNefarus(playerid)

	return NPC.Nefarus;

end


--Menu i Dialog--
local Menu_TP = {};

--TP

Menu_TP[1] = CreateMenu(3, "(КОНЕЦ)", Texture_Menu_NPC, 1450, 6850, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "TP1");
Menu_TP[2] = CreateMenu(3, "(КОНЕЦ)", Texture_Menu_NPC, 1450, 6850, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "TP2");
Menu_TP[3] = CreateMenu(3, "(КОНЕЦ)", Texture_Menu_NPC, 1450, 6850, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "TP3");
Menu_TP[4] = CreateMenu(3, "(КОНЕЦ)", Texture_Menu_NPC, 1450, 6850, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "TP4");
Menu_TP[5] = CreateMenu(3, "(КОНЕЦ)", Texture_Menu_NPC, 1450, 6850, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "TP5");
Menu_TP[6] = CreateMenu(3, "(КОНЕЦ)", Texture_Menu_NPC, 1450, 6850, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "TP6");
Menu_TP[7] = CreateMenu(3, "(КОНЕЦ)", Texture_Menu_NPC, 1450, 6850, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "TP7");
Menu_TP[8] = CreateMenu(3, "(КОНЕЦ)", Texture_Menu_NPC, 1450, 6850, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "TP8");
Menu_TP[9] = CreateMenu(3, "(КОНЕЦ)", Texture_Menu_NPC, 1450, 6850, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "TP9");
Menu_TP[10] = CreateMenu(3, "(КОНЕЦ)", Texture_Menu_NPC, 1450, 6850, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "TP10");
Menu_TP[11] = CreateMenu(3, "(КОНЕЦ)", Texture_Menu_NPC, 1450, 6850, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "TP11");
Menu_TP[12] = CreateMenu(3, "(КОНЕЦ)", Texture_Menu_NPC, 1450, 6850, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "TP12");
Menu_TP[13] = CreateMenu(3, "(КОНЕЦ)", Texture_Menu_NPC, 1450, 6850, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "TP13");
Menu_TP[14] = CreateMenu(3, "(КОНЕЦ)", Texture_Menu_NPC, 1450, 6850, "Font_Old_10_White_Hi.TGA", 200, 255, 255, 255, 255, 255, 0, "TP14");

function ShowMenuTP(playerid)
	
	UpdatePlayerDraw(playerid, Player[playerid].Draw[0], 3450, 7050, "Цена: "..(GetLevel(playerid)*TP_Cost), "Font_Old_20_White_Hi.TGA", 255, 145, 0);
	ShowPlayerDraw(playerid, Player[playerid].Draw[0]);
	ShowMenu(playerid, Menu_TP[GetFocusTP(playerid)]);

end

function HideMenuTP(playerid)
	
	HidePlayerDraw(playerid, Player[playerid].Draw[0]);
	HideMenu(playerid, Menu_TP[GetFocusTP(playerid)]);

end

function SwithMenuDownTP(playerid)

	SwitchDownMenu(playerid, Menu_TP[GetFocusTP(playerid)]);

end

function SwithMenuUpTP(playerid)

	SwitchUpMenu(playerid, Menu_TP[GetFocusTP(playerid)]);

end

function StartDialogTP(playerid)
	
	if GetPlayerActiveMenu(playerid, Menu_TP[GetFocusTP(playerid)]) == GetMenuMaxOptions(Menu_TP[GetFocusTP(playerid)]) then
		
		HideMenuTP(playerid);
		
	else
		
		if GetPlayerGold(playerid) >= (GetLevel(playerid)*TP_Cost) then
			
			RemoveItem(playerid, "ITMI_GOLD", (GetLevel(playerid)*TP_Cost)); 
			DestroyItemPlayer(playerid, "ITMI_GOLD", (GetLevel(playerid)*TP_Cost));
			HideMenuTP(playerid);
			EndNPC(playerid);
			TeleportPlayer(playerid, GetPlayerActiveMenu(playerid, Menu_TP[GetFocusTP(playerid)]), GetFocusTP(playerid));
			
		else
		
			GameTextForPlayer(playerid, 3200, 3500, "Не хватает золота.","Font_Old_20_White_Hi.TGA", 255, 255, 255, 500);
		
		end

	end
	
end

function GetFocusTP(playerid)

	for i = 1, #NPC.TP do
	
		if GetFocus(playerid) == NPC.TP[i] then
		
			return i;
		
		end
	
	end

	return false;

end

--
-- Ostateczne funkcje
--

function ShowMenuNPC(playerid)

	if Player[playerid].Trening ~= false then
	
		ShowMenuTrening(playerid);

	elseif GetFocus(playerid) == GetFocusFarim(playerid) then
	
		ShowMenuFarim(playerid);
		
	elseif GetFocus(playerid) == GetFocusBlyth(playerid) then
	
		ShowMenuBlyth(playerid);
		
	elseif GetFocus(playerid) == GetFocusWill(playerid) then
	
		ShowMenuWill(playerid);
		
	elseif GetFocus(playerid) == GetFocusBob(playerid) then
	
		ShowMenuBob(playerid);
		
	elseif GetFocus(playerid) == GetFocusFred(playerid) then
	
		ShowMenuFred(playerid);
		
	elseif GetFocus(playerid) == GetFocusEowina(playerid) then
	
		ShowMenuEowina(playerid);
		
	elseif GetFocus(playerid) == GetFocusTyrion(playerid) then
	
		ShowMenuTyrion(playerid);
		
	elseif GetFocus(playerid) == GetFocusEomer(playerid) then
	
		ShowMenuEomer(playerid);
		
	elseif GetFocus(playerid) == GetFocusBrandon(playerid) then
	
		ShowMenuBrandon(playerid);
		
	elseif GetFocus(playerid) == GetFocusBethan(playerid) then
	
		ShowMenuBethan(playerid);
		
	elseif GetFocus(playerid) == GetFocusCross(playerid) then
	
		ShowMenuCross(playerid);
		
	elseif GetFocus(playerid) == GetFocusHagan(playerid) then
	
		ShowMenuHagan(playerid);
		
	elseif GetFocus(playerid) == GetFocusGuy(playerid) then
	
		ShowMenuGuy(playerid);
		
	elseif GetFocus(playerid) == GetFocusBrain(playerid) then
	
		ShowMenuBrain(playerid);
		
	elseif GetFocus(playerid) == GetFocusNieznajomy(playerid) then
	
		ShowMenuNieznajomy(playerid);
		
	elseif GetFocus(playerid) == GetFocusRafer(playerid) then
	
		ShowMenuRafer(playerid);
		
	elseif GetFocus(playerid) == GetFocusJenifer(playerid) then
	
		ShowMenuJenifer(playerid);
		
	elseif GetFocus(playerid) == GetFocusDirkland(playerid) then
	
		ShowMenuDirkland(playerid);
		
	elseif GetFocus(playerid) == GetFocusGreth(playerid) then
	
		ShowMenuGreth(playerid);
		
	elseif GetFocus(playerid) == GetFocusCahan(playerid) then
	
		ShowMenuCahan(playerid);
		
	elseif GetFocus(playerid) == GetFocusRegin(playerid) then
	
		ShowMenuRegin(playerid);
		
	elseif GetFocus(playerid) == GetFocusMagnus(playerid) then
	
		ShowMenuMagnus(playerid);
		
	elseif GetFocus(playerid) == GetFocusCheamel(playerid) then
	
		ShowMenuCheamel(playerid);
		
	elseif GetFocus(playerid) == GetFocusFagar(playerid) then
	
		ShowMenuFagar(playerid);
		
	elseif GetFocus(playerid) == GetFocusGerald(playerid) then
	
		ShowMenuGerald(playerid);
			
	elseif GetFocus(playerid) == GetFocusVasilas(playerid) then
		
		ShowMenuVasilas(playerid);
	
	elseif GetFocus(playerid) == GetFocusRudin(playerid) then
		
		ShowMenuRudin(playerid);	
		
	elseif GetFocus(playerid) == GetFocusUrgan(playerid) then
		
		ShowMenuUrgan(playerid);

	elseif GetFocus(playerid) == GetFocusNefarus(playerid) then
		
		ShowMenuNefarus(playerid);
		
	elseif GetFocusTP(playerid) ~= false then
	
		ShowMenuTP(playerid);

	end

end

function HideMenuNPC(playerid)

	if Player[playerid].Trening ~= false then
	
		HideMenuTrening(playerid);

	elseif GetFocus(playerid) == GetFocusFarim(playerid) then
	
		HideMenuFarim(playerid);
		
	elseif GetFocus(playerid) == GetFocusBlyth(playerid) then
	
		HideMenuBlyth(playerid);
		
	elseif GetFocus(playerid) == GetFocusWill(playerid) then
	
		HideMenuWill(playerid);
		
	elseif GetFocus(playerid) == GetFocusBob(playerid) then
	
		HideMenuBob(playerid);
		
	elseif GetFocus(playerid) == GetFocusFred(playerid) then
	
		HideMenuFred(playerid);
		
	elseif GetFocus(playerid) == GetFocusEowina(playerid) then
	
		HideMenuEowina(playerid);
		
	elseif GetFocus(playerid) == GetFocusTyrion(playerid) then
	
		HideMenuTyrion(playerid);
		
	elseif GetFocus(playerid) == GetFocusEomer(playerid) then
	
		HideMenuEomer(playerid);
		
	elseif GetFocus(playerid) == GetFocusBrandon(playerid) then
	
		HideMenuBrandon(playerid);
		
	elseif GetFocus(playerid) == GetFocusBethan(playerid) then
	
		HideMenuBethan(playerid);
		
	elseif GetFocus(playerid) == GetFocusCross(playerid) then
	
		HideMenuCross(playerid);
		
	elseif GetFocus(playerid) == GetFocusHagan(playerid) then
	
		HideMenuHagan(playerid);
		
	elseif GetFocus(playerid) == GetFocusGuy(playerid) then
	
		HideMenuGuy(playerid);
		
	elseif GetFocus(playerid) == GetFocusBrain(playerid) then
	
		HideMenuBrain(playerid);
		
	elseif GetFocus(playerid) == GetFocusNieznajomy(playerid) then
	
		HideMenuNieznajomy(playerid);
		
	elseif GetFocus(playerid) == GetFocusRafer(playerid) then
	
		HideMenuRafer(playerid);
		
	elseif GetFocus(playerid) == GetFocusJenifer(playerid) then
	
		HideMenuJenifer(playerid);
	
	elseif GetFocus(playerid) == GetFocusDirkland(playerid) then
	
		HideMenuDirkland(playerid);
	
	elseif GetFocus(playerid) == GetFocusGreth(playerid) then
	
		HideMenuGreth(playerid);
		
	elseif GetFocus(playerid) == GetFocusCahan(playerid) then
	
		HideMenuCahan(playerid);
		
	elseif GetFocus(playerid) == GetFocusRegin(playerid) then
	
		HideMenuRegin(playerid);
		
	elseif GetFocus(playerid) == GetFocusMagnus(playerid) then
	
		HideMenuMagnus(playerid);
		
	elseif GetFocus(playerid) == GetFocusCheamel(playerid) then
	
		HideMenuCheamel(playerid);
		
	elseif GetFocus(playerid) == GetFocusFagar(playerid) then
	
		HideMenuFagar(playerid);
		
	elseif GetFocus(playerid) == GetFocusGerald(playerid) then
	
		HideMenuGerald(playerid);
			
	elseif GetFocus(playerid) == GetFocusVasilas(playerid) then
		
		HideMenuVasilas(playerid);
	
	elseif GetFocus(playerid) == GetFocusRudin(playerid) then
		
		HideMenuRudin(playerid);		
		
	elseif GetFocus(playerid) == GetFocusUrgan(playerid) then
		
		HideMenuUrgan(playerid);

	elseif GetFocus(playerid) == GetFocusNefarus(playerid) then
		
		HideMenuNefarus(playerid);
		
	elseif GetFocusTP(playerid) ~= false then
	
		HideMenuTP(playerid);
		
	end

end

function StartDialog(playerid)

	if Player[playerid].Trening ~= false then
	
		StartTrening(playerid);

	elseif GetFocus(playerid) == GetFocusFarim(playerid) then
		
		StartDialogFarim(playerid);
		
	elseif GetFocus(playerid) == GetFocusBlyth(playerid) then
	
		StartDialogBlyth(playerid);
		
	elseif GetFocus(playerid) == GetFocusWill(playerid) then
	
		StartDialogWill(playerid);
		
	elseif GetFocus(playerid) == GetFocusBob(playerid) then
	
		StartDialogBob(playerid);
		
	elseif GetFocus(playerid) == GetFocusFred(playerid) then
	
		StartDialogFred(playerid);
		
	elseif GetFocus(playerid) == GetFocusEowina(playerid) then
	
		StartDialogEowina(playerid);
		
	elseif GetFocus(playerid) == GetFocusTyrion(playerid) then
	
		StartDialogTyrion(playerid);
		
	elseif GetFocus(playerid) == GetFocusEomer(playerid) then
	
		StartDialogEomer(playerid);
		
	elseif GetFocus(playerid) == GetFocusBrandon(playerid) then
	
		StartDialogBrandon(playerid);
		
	elseif GetFocus(playerid) == GetFocusBethan(playerid) then
	
		StartDialogBethan(playerid);
		
	elseif GetFocus(playerid) == GetFocusCross(playerid) then
	
		StartDialogCross(playerid);
		
	elseif GetFocus(playerid) == GetFocusHagan(playerid) then
	
		StartDialogHagan(playerid);
		
	elseif GetFocus(playerid) == GetFocusGuy(playerid) then
	
		StartDialogGuy(playerid);
		
	elseif GetFocus(playerid) == GetFocusBrain(playerid) then
	
		StartDialogBrain(playerid);
		
	elseif GetFocus(playerid) == GetFocusNieznajomy(playerid) then
	
		StartDialogNieznajomy(playerid);
		
	elseif GetFocus(playerid) == GetFocusRafer(playerid) then
	
		StartDialogRafer(playerid);
		
	elseif GetFocus(playerid) == GetFocusJenifer(playerid) then
	
		StartDialogJenifer(playerid);
	
	elseif GetFocus(playerid) == GetFocusDirkland(playerid) then
	
		StartDialogDirkland(playerid);
		
	elseif GetFocus(playerid) == GetFocusGreth(playerid) then
	
		StartDialogGreth(playerid);
		
	elseif GetFocus(playerid) == GetFocusCahan(playerid) then
	
		StartDialogCahan(playerid);
		
	elseif GetFocus(playerid) == GetFocusRegin(playerid) then
	
		StartDialogRegin(playerid);
		
	elseif GetFocus(playerid) == GetFocusMagnus(playerid) then
	
		StartDialogMagnus(playerid);
		
	elseif GetFocus(playerid) == GetFocusCheamel(playerid) then
	
		StartDialogCheamel(playerid);
		
	elseif GetFocus(playerid) == GetFocusFagar(playerid) then
	
		StartDialogFagar(playerid);
		
	elseif GetFocus(playerid) == GetFocusGerald(playerid) then
	
		StartDialogGerald(playerid);
			
	elseif GetFocus(playerid) == GetFocusVasilas(playerid) then
		
		StartDialogVasilas(playerid);
	
	elseif GetFocus(playerid) == GetFocusRudin(playerid) then
		
		StartDialogRudin(playerid);	
		
	elseif GetFocus(playerid) == GetFocusUrgan(playerid) then
		
		StartDialogUrgan(playerid);

	elseif GetFocus(playerid) == GetFocusNefarus(playerid) then
		
		StartDialogNefarus(playerid);
		
	elseif GetFocusTP(playerid) ~= false then
	
		StartDialogTP(playerid);
	
	end

end

function SwitchUpMenuNPC(playerid)

	if Player[playerid].Trening ~= false then
	
		SwithMenuUpTrening(playerid);

	elseif GetFocus(playerid) == GetFocusFarim(playerid) then
	
		SwithMenuUpFarim(playerid);
		
	elseif GetFocus(playerid) == GetFocusBlyth(playerid) then
	
		SwithMenuUpBlyth(playerid);
		
	elseif GetFocus(playerid) == GetFocusWill(playerid) then
	
		SwithMenuUpWill(playerid);
		
	elseif GetFocus(playerid) == GetFocusBob(playerid) then
	
		SwithMenuUpBob(playerid);
		
	elseif GetFocus(playerid) == GetFocusFred(playerid) then
	
		SwithMenuUpFred(playerid);
		
	elseif GetFocus(playerid) == GetFocusEowina(playerid) then
	
		SwithMenuUpEowina(playerid);
		
	elseif GetFocus(playerid) == GetFocusTyrion(playerid) then
	
		SwithMenuUpTyrion(playerid);
		
	elseif GetFocus(playerid) == GetFocusEomer(playerid) then
	
		SwithMenuUpEomer(playerid);
	
	elseif GetFocus(playerid) == GetFocusBrandon(playerid) then
	
		SwithMenuUpBrandon(playerid);
		
	elseif GetFocus(playerid) == GetFocusBethan(playerid) then
	
		SwithMenuUpBethan(playerid);
		
	elseif GetFocus(playerid) == GetFocusCross(playerid) then
	
		SwithMenuUpCross(playerid);
		
	elseif GetFocus(playerid) == GetFocusHagan(playerid) then
	
		SwithMenuUpHagan(playerid);
		
	elseif GetFocus(playerid) == GetFocusGuy(playerid) then
	
		SwithMenuUpGuy(playerid);
		
	elseif GetFocus(playerid) == GetFocusBrain(playerid) then
	
		SwithMenuUpBrain(playerid);
		
	elseif GetFocus(playerid) == GetFocusNieznajomy(playerid) then
	
		SwithMenuUpNieznajomy(playerid);
		
	elseif GetFocus(playerid) == GetFocusRafer(playerid) then
	
		SwithMenuUpRafer(playerid);
		
	elseif GetFocus(playerid) == GetFocusJenifer(playerid) then
	
		SwithMenuUpJenifer(playerid);
	
	elseif GetFocus(playerid) == GetFocusDirkland(playerid) then
	
		SwithMenuUpDirkland(playerid);
		
	elseif GetFocus(playerid) == GetFocusGreth(playerid) then
	
		SwithMenuUpGreth(playerid);
		
	elseif GetFocus(playerid) == GetFocusCahan(playerid) then
	
		SwithMenuUpCahan(playerid);
		
	elseif GetFocus(playerid) == GetFocusRegin(playerid) then
	
		SwithMenuUpRegin(playerid);
	
	elseif GetFocus(playerid) == GetFocusMagnus(playerid) then
	
		SwithMenuUpMagnus(playerid);
		
	elseif GetFocus(playerid) == GetFocusCheamel(playerid) then
	
		SwithMenuUpCheamel(playerid);
		
	elseif GetFocus(playerid) == GetFocusFagar(playerid) then
	
		SwithMenuUpFagar(playerid);
		
	elseif GetFocus(playerid) == GetFocusGerald(playerid) then
	
		SwithMenuUpGerald(playerid);
			
	elseif GetFocus(playerid) == GetFocusVasilas(playerid) then
		
		SwithMenuUpVasilas(playerid);
	
	elseif GetFocus(playerid) == GetFocusRudin(playerid) then
		
		SwithMenuUpRudin(playerid);
		
	elseif GetFocus(playerid) == GetFocusUrgan(playerid) then
		
		SwithMenuUpUrgan(playerid);

	elseif GetFocus(playerid) == GetFocusNefarus(playerid) then
		
		SwithMenuUpNefarus(playerid);
		
	elseif GetFocusTP(playerid) ~= false then
	
		SwithMenuUpTP(playerid);
	
	end

end

function SwitchDownMenuNPC(playerid)

	if Player[playerid].Trening ~= false then
	
		SwithMenuDownTrening(playerid);

	elseif GetFocus(playerid) == GetFocusFarim(playerid) then
	
		SwithMenuDownFarim(playerid);
		
	elseif GetFocus(playerid) == GetFocusBlyth(playerid) then
	
		SwithMenuDownBlyth(playerid);
		
	elseif GetFocus(playerid) == GetFocusWill(playerid) then
	
		SwithMenuDownWill(playerid);
		
	elseif GetFocus(playerid) == GetFocusBob(playerid) then
	
		SwithMenuDownBob(playerid);
		
	elseif GetFocus(playerid) == GetFocusFred(playerid) then
	
		SwithMenuDownFred(playerid);
		
	elseif GetFocus(playerid) == GetFocusEowina(playerid) then
	
		SwithMenuDownEowina(playerid);
		
	elseif GetFocus(playerid) == GetFocusTyrion(playerid) then
	
		SwithMenuDownTyrion(playerid);
		
	elseif GetFocus(playerid) == GetFocusEomer(playerid) then
	
		SwithMenuDownEomer(playerid);
		
	elseif GetFocus(playerid) == GetFocusBrandon(playerid) then
	
		SwithMenuDownBrandon(playerid);
		
	elseif GetFocus(playerid) == GetFocusBethan(playerid) then
	
		SwithMenuDownBethan(playerid);
		
	elseif GetFocus(playerid) == GetFocusCross(playerid) then
	
		SwithMenuDownCross(playerid);
		
	elseif GetFocus(playerid) == GetFocusHagan(playerid) then
	
		SwithMenuDownHagan(playerid);
		
	elseif GetFocus(playerid) == GetFocusGuy(playerid) then
	
		SwithMenuDownGuy(playerid);
		
	elseif GetFocus(playerid) == GetFocusBrain(playerid) then
	
		SwithMenuDownBrain(playerid);
		
	elseif GetFocus(playerid) == GetFocusNieznajomy(playerid) then
	
		SwithMenuDownNieznajomy(playerid);
		
	elseif GetFocus(playerid) == GetFocusRafer(playerid) then
	
		SwithMenuDownRafer(playerid);
		
	elseif GetFocus(playerid) == GetFocusJenifer(playerid) then
	
		SwithMenuDownJenifer(playerid);
		
	elseif GetFocus(playerid) == GetFocusDirkland(playerid) then
	
		SwithMenuDownDirkland(playerid);
		
	elseif GetFocus(playerid) == GetFocusGreth(playerid) then
	
		SwithMenuDownGreth(playerid);
		
	elseif GetFocus(playerid) == GetFocusCahan(playerid) then
	
		SwithMenuDownCahan(playerid);
		
	elseif GetFocus(playerid) == GetFocusRegin(playerid) then
	
		SwithMenuDownRegin(playerid);
		
	elseif GetFocus(playerid) == GetFocusMagnus(playerid) then
	
		SwithMenuDownMagnus(playerid);
		
	elseif GetFocus(playerid) == GetFocusCheamel(playerid) then
	
		SwithMenuDownCheamel(playerid);
		
	elseif GetFocus(playerid) == GetFocusFagar(playerid) then
	
		SwithMenuDownFagar(playerid);
		
	elseif GetFocus(playerid) == GetFocusGerald(playerid) then
		
		SwithMenuDownGerald(playerid);
			
	elseif GetFocus(playerid) == GetFocusVasilas(playerid) then
		
		SwithMenuDownVasilas(playerid);
	
	elseif GetFocus(playerid) == GetFocusRudin(playerid) then
		
		SwithMenuDownRudin(playerid);	
		
	elseif GetFocus(playerid) == GetFocusUrgan(playerid) then
		
		SwithMenuDownUrgan(playerid);

	elseif GetFocus(playerid) == GetFocusNefarus(playerid) then
		
		SwithMenuDownNefarus(playerid);
		
	elseif GetFocusTP(playerid) ~= false then
	
		SwithMenuDownTP(playerid);
	
	end

end

function GetMaxOptionsNPC(playerid)

	if Player[playerid].Trening ~= false then
	
		return 99;
	
	elseif Player[playerid].Handel ~= false then
	
		return 99;
	
	elseif GetFocus(playerid) == GetFocusFarim(playerid) then
	
		return GetMenuMaxOptions(Menu_Farim[Player[playerid].Farim]);
		
	elseif GetFocus(playerid) == GetFocusBlyth(playerid) then
	
		return GetMenuMaxOptions(Menu_Blyth[Player[playerid].Blyth]);
		
	elseif GetFocus(playerid) == GetFocusWill(playerid) then
	
		return GetMenuMaxOptions(Menu_Will[Player[playerid].Will]);
		
	elseif GetFocus(playerid) == GetFocusBob(playerid) then
	
		--return GetMenuMaxOptions(Menu_Bob[Player[playerid].Bob]);
		return 0;
		
	elseif GetFocus(playerid) == GetFocusFred(playerid) then
	
		return GetMenuMaxOptions(Menu_Fred[Player[playerid].Fred]);
		
	elseif GetFocus(playerid) == GetFocusEowina(playerid) then
	
		return GetMenuMaxOptions(Menu_Eowina[Player[playerid].Eowina]);
		
	elseif GetFocus(playerid) == GetFocusTyrion(playerid) then
	
		return GetMenuMaxOptions(Menu_Tyrion[Player[playerid].Tyrion]);
	
	elseif GetFocus(playerid) == GetFocusEomer(playerid) then
	
		return GetMenuMaxOptions(Menu_Eomer[Player[playerid].Eomer]);
		
	elseif GetFocus(playerid) == GetFocusBrandon(playerid) then
	
		return GetMenuMaxOptions(Menu_Brandon[Player[playerid].Brandon]);
	
	elseif GetFocus(playerid) == GetFocusBethan(playerid) then
	
		return GetMenuMaxOptions(Menu_Bethan[Player[playerid].Bethan]);
		
	elseif GetFocus(playerid) == GetFocusCross(playerid) then
	
		return GetMenuMaxOptions(Menu_Cross[Player[playerid].Cross]);
		
	elseif GetFocus(playerid) == GetFocusHagan(playerid) then
	
		return GetMenuMaxOptions(Menu_Hagan[Player[playerid].Hagan]);
		
	elseif GetFocus(playerid) == GetFocusGuy(playerid) then
	
		return GetMenuMaxOptions(Menu_Guy[Player[playerid].Guy]);
		
	elseif GetFocus(playerid) == GetFocusBrain(playerid) then
	
		return GetMenuMaxOptions(Menu_Brain[Player[playerid].Brain]);
		
	elseif GetFocus(playerid) == GetFocusNieznajomy(playerid) then
	
		return GetMenuMaxOptions(Menu_Nieznajomy[Player[playerid].Nieznajomy]);
		
	elseif GetFocus(playerid) == GetFocusRafer(playerid) then
	
		return GetMenuMaxOptions(Menu_Rafer[Player[playerid].Rafer]);
		
	elseif GetFocus(playerid) == GetFocusJenifer(playerid) then
	
		return GetMenuMaxOptions(Menu_Jenifer[Player[playerid].Jenifer]);
		
	elseif GetFocus(playerid) == GetFocusDirkland(playerid) then
	
		return GetMenuMaxOptions(Menu_Dirkland[Player[playerid].Dirkland]);
		
	elseif GetFocus(playerid) == GetFocusGreth(playerid) then
	
		return GetMenuMaxOptions(Menu_Greth[Player[playerid].Greth]);
		
	elseif GetFocus(playerid) == GetFocusCahan(playerid) then
	
		return GetMenuMaxOptions(Menu_Cahan[Player[playerid].Cahan]);
		
	elseif GetFocus(playerid) == GetFocusRegin(playerid) then
	
		return GetMenuMaxOptions(Menu_Regin[Player[playerid].Regin]);
		
	elseif GetFocus(playerid) == GetFocusMagnus(playerid) then
	
		return GetMenuMaxOptions(Menu_Magnus[Player[playerid].Magnus]);
		
	elseif GetFocus(playerid) == GetFocusCheamel(playerid) then
	
		return GetMenuMaxOptions(Menu_Cheamel[Player[playerid].Cheamel]);
		
	elseif GetFocus(playerid) == GetFocusFagar(playerid) then
	
		return GetMenuMaxOptions(Menu_Fagar[Player[playerid].Fagar]);
		
	elseif GetFocus(playerid) == GetFocusGerald(playerid) then
	
		return GetMenuMaxOptions(Menu_Gerald[Player[playerid].Gerald]);
			
	elseif GetFocus(playerid) == GetFocusVasilas(playerid) then
		
		return GetMenuMaxOptions(Menu_Vasilas[Player[playerid].Vasilas]);
	
	elseif GetFocus(playerid) == GetFocusRudin(playerid) then
		
		return GetMenuMaxOptions(Menu_Rudin[Player[playerid].Rudin]);
		
	elseif GetFocus(playerid) == GetFocusUrgan(playerid) then
		
		return GetMenuMaxOptions(Menu_Urgan[Player[playerid].Urgan]);

	elseif GetFocus(playerid) == GetFocusNefarus(playerid) then
		
		return GetMenuMaxOptions(Menu_Nefarus[Player[playerid].Nefarus]);
		
	elseif GetFocusTP(playerid) ~= false then
	
		return GetMenuMaxOptions(Menu_TP[GetFocusTP(playerid)]);
	
	end
	
end

function GetPlayerOptionsNPC(playerid)
	
	if Player[playerid].Trening ~= false then
	
		return -99;
	
	elseif GetFocus(playerid) == GetFocusFarim(playerid) then
	
		return GetPlayerActiveMenu(playerid, Menu_Farim[Player[playerid].Farim]);
		
	elseif GetFocus(playerid) == GetFocusBlyth(playerid) then
	
		return GetPlayerActiveMenu(playerid, Menu_Blyth[Player[playerid].Blyth]);
		
	elseif GetFocus(playerid) == GetFocusWill(playerid) then
	
		return GetPlayerActiveMenu(playerid, Menu_Will[Player[playerid].Will]);
		
	elseif GetFocus(playerid) == GetFocusBob(playerid) then
	
		--return GetPlayerActiveMenu(playerid, Menu_Bob[Player[playerid].Bob]);
		return 0;
		
	elseif GetFocus(playerid) == GetFocusFred(playerid) then
	
		return GetPlayerActiveMenu(playerid, Menu_Fred[Player[playerid].Fred]);
		
	elseif GetFocus(playerid) == GetFocusEowina(playerid) then
	
		return GetPlayerActiveMenu(playerid, Menu_Eowina[Player[playerid].Eowina]);
		
	elseif GetFocus(playerid) == GetFocusTyrion(playerid) then
	
		return GetPlayerActiveMenu(playerid, Menu_Tyrion[Player[playerid].Tyrion]);
	
	elseif GetFocus(playerid) == GetFocusEomer(playerid) then
	
		return GetPlayerActiveMenu(playerid, Menu_Eomer[Player[playerid].Eomer]);
		
	elseif GetFocus(playerid) == GetFocusBrandon(playerid) then
	
		return GetPlayerActiveMenu(playerid, Menu_Brandon[Player[playerid].Brandon]);
		
	elseif GetFocus(playerid) == GetFocusBethan(playerid) then
	
		return GetPlayerActiveMenu(playerid, Menu_Bethan[Player[playerid].Bethan]);
		
	elseif GetFocus(playerid) == GetFocusCross(playerid) then
	
		return GetPlayerActiveMenu(playerid, Menu_Cross[Player[playerid].Cross]);
		
	elseif GetFocus(playerid) == GetFocusHagan(playerid) then
	
		return GetPlayerActiveMenu(playerid, Menu_Hagan[Player[playerid].Hagan]);
		
	elseif GetFocus(playerid) == GetFocusGuy(playerid) then
	
		return GetPlayerActiveMenu(playerid, Menu_Guy[Player[playerid].Guy]);
		
	elseif GetFocus(playerid) == GetFocusBrain(playerid) then
	
		return GetPlayerActiveMenu(playerid, Menu_Brain[Player[playerid].Brain]);
		
	elseif GetFocus(playerid) == GetFocusNieznajomy(playerid) then
	
		return GetPlayerActiveMenu(playerid, Menu_Nieznajomy[Player[playerid].Nieznajomy]);
		
	elseif GetFocus(playerid) == GetFocusRafer(playerid) then
	
		return GetPlayerActiveMenu(playerid, Menu_Rafer[Player[playerid].Rafer]);
		
	elseif GetFocus(playerid) == GetFocusJenifer(playerid) then
	
		return GetPlayerActiveMenu(playerid, Menu_Jenifer[Player[playerid].Jenifer]);
		
	elseif GetFocus(playerid) == GetFocusDirkland(playerid) then
	
		return GetPlayerActiveMenu(playerid, Menu_Dirkland[Player[playerid].Dirkland]);
		
	elseif GetFocus(playerid) == GetFocusGreth(playerid) then
	
		return GetPlayerActiveMenu(playerid, Menu_Greth[Player[playerid].Greth]);
		
	elseif GetFocus(playerid) == GetFocusCahan(playerid) then
	
		return GetPlayerActiveMenu(playerid, Menu_Cahan[Player[playerid].Cahan]);
		
	elseif GetFocus(playerid) == GetFocusRegin(playerid) then
	
		return GetPlayerActiveMenu(playerid, Menu_Regin[Player[playerid].Regin]);
		
	elseif GetFocus(playerid) == GetFocusMagnus(playerid) then
	
		return GetPlayerActiveMenu(playerid, Menu_Magnus[Player[playerid].Magnus]);
		
	elseif GetFocus(playerid) == GetFocusCheamel(playerid) then
	
		return GetPlayerActiveMenu(playerid, Menu_Cheamel[Player[playerid].Cheamel]);
	
	elseif GetFocus(playerid) == GetFocusFagar(playerid) then
	
		return GetPlayerActiveMenu(playerid, Menu_Fagar[Player[playerid].Fagar]);
		
	elseif GetFocus(playerid) == GetFocusGerald(playerid) then
	
		return GetPlayerActiveMenu(playerid, Menu_Gerald[Player[playerid].Gerald]);
			
	elseif GetFocus(playerid) == GetFocusVasilas(playerid) then
		
		return GetPlayerActiveMenu(playerid, Menu_Vasilas[Player[playerid].Vasilas]);
	
	elseif GetFocus(playerid) == GetFocusRudin(playerid) then
		
		return GetPlayerActiveMenu(playerid, Menu_Rudin[Player[playerid].Rudin]);
		
	elseif GetFocus(playerid) == GetFocusUrgan(playerid) then
		
		return GetPlayerActiveMenu(playerid, Menu_Urgan[Player[playerid].Urgan]);

	elseif GetFocus(playerid) == GetFocusNefarus(playerid) then
		
		return GetPlayerActiveMenu(playerid, Menu_Nefarus[Player[playerid].Nefarus]);
		
	elseif GetFocusTP(playerid) ~= false then
	
		return GetPlayerActiveMenu(playerid, Menu_TP[GetFocusTP(playerid)]);
	
	end
	
end

function OnPlayerDialog(playerid, dialog_id)
	
	if GetFocus(playerid) == GetFocusBethan(playerid) then
	
		if Player[playerid].Bethan == 1 then
		
			if dialog_id == 2 then
				
				PlayAnimation(playerid, "T_STAND_2_FEAR_VICTIM3");
			
			end
			
		end
		
	end

end

function OnPlayerEndDialog(playerid)

	Player[playerid].Dialog = false;
	
	if Player[playerid].Trening ~= false then
		
		UpdateGoldItem(playerid);
		ShowCost(playerid, GetCostAmount(Player[playerid].Trening));
		
	elseif Player[playerid].Handel ~= false then
		
		if GetFocus(playerid) ~= GetFocusFagar(playerid) then
			
			ShowHandel(playerid, GetPlayerName(GetFocus(playerid)));
		
		else
			
			ShowHandel(playerid, GetPlayerName(GetFocus(playerid)) .. Player[playerid].Fagar);
			
		end
		
	elseif GetFocus(playerid) == GetFocusBlyth(playerid) then
		
		if Player[playerid].Blyth == 3 then
		
			if Player[playerid].Last_Menu == "4" then
			
				Player[playerid].Blyth = 4;
				
			end
			
		elseif Player[playerid].Blyth == 4 then
		
			if GetPlayerHuntLvl( playerid ) == 42 then
			
				Player[playerid].Blyth = 5;
				
			end
		
		end
		
	elseif GetFocus(playerid) == GetFocusFred(playerid) then
	
		if Player[playerid].Fred == 3 then
		
			if Player[playerid].Last_Menu == "4" then
			
				Player[playerid].Fred = 4;
				
			end
		
		end
		
	elseif GetFocus(playerid) == GetFocusBob(playerid) then
	
		EndNPC(playerid);
		
	elseif GetFocus(playerid) == GetFocusMagnus(playerid) then
	
		if Player[playerid].Magnus == 1 then
		
			if Player[playerid].TP == true then
		
				if GetPlayerLevel(playerid) >= GD_Gothic2_Lvl then
					
					Player[playerid].TP = false;
					SetPlayerWorld(playerid,"KYRMIR.ZEN","WP_INTRO13");
					EndNPC(playerid);
					
				end
			
			end
			
		end
		
	elseif GetFocus(playerid) == GetFocusCheamel(playerid) then
	
		if Player[playerid].Cheamel == 1 then
		
			if Player[playerid].TP == true then
					
				Player[playerid].TP = false;
				SetPlayerWorld(playerid,"KYRMIR.ZEN","START");
				EndNPC(playerid);

			end
			
		end
		
	end
	
end

--Nauka dropуw--

function SetPazury( playerid, trophy )

	if GetPlayerPazury( playerid ) == 0 then
		
		if GetCostTrophy( trophy ) <= GetPlayerGold(playerid) then
		
			if GetLP( playerid ) >= 1 then
				
				HideMenuBlyth(playerid);
				DialogStart(playerid, Dialog_Blyth[3], Menu_Blyth[2], 1, 0);
				Player[playerid].Dialog = true;
				SetPlayerPazury( playerid, 1 );
				SetLP(playerid, GetLP( playerid ) - 1);
				RemoveItem(playerid, "ITMI_GOLD", GetCostTrophy( trophy ));
				DestroyItemPlayerAmount(playerid, "ITMI_GOLD", GetCostTrophy( trophy ));
			
			else
				
				GameTextForPlayer(playerid, 2800, 3500, "Недостаточно очков опыта.","Font_Old_20_White_Hi.TGA", 255, 255, 255, 500);
			
			end
			
		else
		
			GameTextForPlayer(playerid, 3200, 3500, "Недостаточно золота.","Font_Old_20_White_Hi.TGA", 255, 255, 255, 500);
			
		end
		
	else 
		
		GameTextForPlayer(playerid, 2800, 3500, "Вы уже умеете добывать когти.","Font_Old_20_White_Hi.TGA", 255, 255, 255, 500);

	end
	
end

function SetZuwaczki( playerid, trophy )

	if GetPlayerZuwaczki( playerid ) == 0 then
	
		if GetCostTrophy( trophy ) <= GetPlayerGold(playerid) then

			if GetLP( playerid ) >= 1 then
				
				HideMenuBlyth(playerid);
				DialogStart(playerid, Dialog_Blyth[4], Menu_Blyth[2], 1, 0);
				Player[playerid].Dialog = true;
				SetPlayerZuwaczki( playerid, 1 );
				SetLP(playerid, GetLP( playerid ) - 1);
				RemoveItem(playerid, "ITMI_GOLD", GetCostTrophy( trophy ));
				DestroyItemPlayerAmount(playerid, "ITMI_GOLD", GetCostTrophy( trophy ));
			
			else
				
				GameTextForPlayer(playerid, 2800, 3500, "Недостаточно очков опыта.","Font_Old_20_White_Hi.TGA", 255, 255, 255, 500);
			
			end
		
		else
		
			GameTextForPlayer(playerid, 3200, 3500, "Недостаточно золота.","Font_Old_20_White_Hi.TGA", 255, 255, 255, 500);
			
		end
		
	else 
		
		GameTextForPlayer(playerid, 2800, 3500, "Вы уже умеете добывать мандибулы.","Font_Old_20_White_Hi.TGA", 255, 255, 255, 500);

	end
	
end

function SetPlyty( playerid, trophy )

	if GetPlayerPlyty( playerid ) == 0 then
	
		if GetCostTrophy( trophy ) <= GetPlayerGold(playerid) then

			if GetLP( playerid ) >= 2 then

				HideMenuNefarus(playerid);
				DialogStart(playerid, Dialog_Nefarus[3], Menu_Nefarus[2], 1, 0);
				Player[playerid].Dialog = true;
				SetPlayerPlyty( playerid, 1 );
				SetLP(playerid, GetLP( playerid ) - 2);
				RemoveItem(playerid, "ITMI_GOLD", GetCostTrophy( trophy ));
				DestroyItemPlayerAmount(playerid, "ITMI_GOLD", GetCostTrophy( trophy ));
			
			else
				
				GameTextForPlayer(playerid, 2800, 3500, "Недостаточно очков опыта.","Font_Old_20_White_Hi.TGA", 255, 255, 255, 500);
			
			end
		
		else
		
			GameTextForPlayer(playerid, 3200, 3500, "Недостаточно золота.","Font_Old_20_White_Hi.TGA", 255, 255, 255, 500);
			
		end
		
	else 
		
		GameTextForPlayer(playerid, 2800, 3500, "Вы уже умеете добывать панцирь.","Font_Old_20_White_Hi.TGA", 255, 255, 255, 500);

	end
	
end

function SetSkora( playerid, trophy )

	if GetPlayerSkora( playerid ) == 0 then
	
		if GetCostTrophy( trophy ) <= GetPlayerGold(playerid) then

			if GetLP( playerid ) >= 4 then
				
				HideMenuBlyth(playerid);
				DialogStart(playerid, Dialog_Blyth[6], Menu_Blyth[2], 1, 0);
				Player[playerid].Dialog = true;
				SetPlayerSkora( playerid, 1 );
				SetLP(playerid, GetLP( playerid ) - 4);
				RemoveItem(playerid, "ITMI_GOLD", GetCostTrophy( trophy ));
				DestroyItemPlayerAmount(playerid, "ITMI_GOLD", GetCostTrophy( trophy ));
			
			else
				
				GameTextForPlayer(playerid, 2800, 3500, "Недостаточно очков опыта.","Font_Old_20_White_Hi.TGA", 255, 255, 255, 500);
			
			end
		
		else
		
			GameTextForPlayer(playerid, 3200, 3500, "Недостаточно золота.","Font_Old_20_White_Hi.TGA", 255, 255, 255, 500);
			
		end
		
	else 
		
		GameTextForPlayer(playerid, 2800, 3500, "Вы уже умеете добывать шкуры животных.","Font_Old_20_White_Hi.TGA", 255, 255, 255, 500);

	end
	
end

function SetKly( playerid, trophy )

	if GetPlayerKly( playerid ) == 0 then
	
		if GetCostTrophy( trophy ) <= GetPlayerGold(playerid) then

			if GetLP( playerid ) >= 5 then
				
				HideMenuBlyth(playerid);
				DialogStart(playerid, Dialog_Blyth[7], Menu_Blyth[2], 1, 0);
				Player[playerid].Dialog = true;
				SetPlayerKly( playerid, 1 );
				SetLP(playerid, GetLP( playerid ) - 5);
				RemoveItem(playerid, "ITMI_GOLD", GetCostTrophy( trophy ));
				DestroyItemPlayerAmount(playerid, "ITMI_GOLD", GetCostTrophy( trophy ));
			
			else
				
				GameTextForPlayer(playerid, 2800, 3500, "Недостаточно очков опыта.","Font_Old_20_White_Hi.TGA", 255, 255, 255, 500);
			
			end
		
		else
		
			GameTextForPlayer(playerid, 3200, 3500, "Недостаточно золота.","Font_Old_20_White_Hi.TGA", 255, 255, 255, 500);
			
		end
		
	else 
		
		GameTextForPlayer(playerid, 2800, 3500, "Вы уже умеете добывать крылья.","Font_Old_20_White_Hi.TGA", 255, 255, 255, 500);

	end
	
end

function SetRog( playerid, trophy )

	if GetPlayerRog( playerid ) == 0 then
	
		if GetCostTrophy( trophy ) <= GetPlayerGold(playerid) then

			if GetLP( playerid ) >= 15 then
				
				HideMenuNefarus(playerid);
				DialogStart(playerid, Dialog_Nefarus[2], Menu_Nefarus[2], 1, 0);
				Player[playerid].Dialog = true;
				SetPlayerRog( playerid, 1 );
				SetLP(playerid, GetLP( playerid ) - 15);
				RemoveItem(playerid, "ITMI_GOLD", GetCostTrophy( trophy ));
				DestroyItemPlayerAmount(playerid, "ITMI_GOLD", GetCostTrophy( trophy ));
			
			else
				
				GameTextForPlayer(playerid, 2800, 3500, "Недостаточно очков обучения.","Font_Old_20_White_Hi.TGA", 255, 255, 255, 500);
			
			end
		
		else
		
			GameTextForPlayer(playerid, 3200, 3500, "Недостаточно золота.","Font_Old_20_White_Hi.TGA", 255, 255, 255, 500);
			
		end
		
	else 
		
		GameTextForPlayer(playerid, 2800, 3500, "Вы уже умеете добывать рога.","Font_Old_20_White_Hi.TGA", 255, 255, 255, 500);

	end
	
end

function SetSerca( playerid, trophy )

	if GetPlayerSerca( playerid ) == 0 then
	
		if GetCostTrophy( trophy ) <= GetPlayerGold(playerid) then

			if GetLP( playerid ) >= 10 then
				
				HideMenuNieznajomy(playerid);
				DialogStart(playerid, Dialog_Nieznajomy[2], Menu_Nieznajomy[2], 1, 0);
				Player[playerid].Dialog = true;
				SetPlayerSerca( playerid, 1 );
				SetLP(playerid, GetLP( playerid ) - 10);
				RemoveItem(playerid, "ITMI_GOLD", GetCostTrophy( trophy ));
				DestroyItemPlayerAmount(playerid, "ITMI_GOLD", GetCostTrophy( trophy ));
			
			else
				
				GameTextForPlayer(playerid, 2800, 3500, "Недостаточно очков опыта.","Font_Old_20_White_Hi.TGA", 255, 255, 255, 500);
			
			end
		
		else
		
			GameTextForPlayer(playerid, 3200, 3500, "Недостаточно золота.","Font_Old_20_White_Hi.TGA", 255, 255, 255, 500);
			
		end
		
	else 
		
		GameTextForPlayer(playerid, 2800, 3500, "Вы уже умеете добывать сердца.","Font_Old_20_White_Hi.TGA", 255, 255, 255, 500);

	end
	
end

function SetJezyki( playerid, trophy )

	if GetPlayerJezyki( playerid ) == 0 then
	
		if GetCostTrophy( trophy ) <= GetPlayerGold(playerid) then

			if GetLP( playerid ) >= 2 then
				
				HideMenuBlyth(playerid);
				DialogStart(playerid, Dialog_Blyth[5], Menu_Blyth[2], 1, 0);
				Player[playerid].Dialog = true;
				SetPlayerJezyki( playerid, 1 );
				SetLP(playerid, GetLP( playerid ) - 2);
				RemoveItem(playerid, "ITMI_GOLD", GetCostTrophy( trophy ));
				DestroyItemPlayerAmount(playerid, "ITMI_GOLD", GetCostTrophy( trophy ));
			
			else
				
				GameTextForPlayer(playerid, 2800, 3500, "Недостаточно очков обучения.","Font_Old_20_White_Hi.TGA", 255, 255, 255, 500);
			
			end
		
		else
		
			GameTextForPlayer(playerid, 3200, 3500, "Недостаточно золота.","Font_Old_20_White_Hi.TGA", 255, 255, 255, 500);
			
		end
		
	else 
		
		GameTextForPlayer(playerid, 2800, 3500, "Вы уже умеете добывать языки.","Font_Old_20_White_Hi.TGA", 255, 255, 255, 500);

	end
	
end

function SetKrew( playerid, trophy )

	if GetPlayerKrew( playerid ) == 0 then
	
		if GetCostTrophy( trophy ) <= GetPlayerGold(playerid) then

			if GetLP( playerid ) >= 5 then
				
				HideMenuNieznajomy(playerid);
				DialogStart(playerid, Dialog_Nieznajomy[3], Menu_Nieznajomy[2], 1, 0);
				Player[playerid].Dialog = true;
				SetPlayerKrew( playerid, 1 );
				SetLP(playerid, GetLP( playerid ) - 5);
				RemoveItem(playerid, "ITMI_GOLD", GetCostTrophy( trophy ));
				DestroyItemPlayerAmount(playerid, "ITMI_GOLD", GetCostTrophy( trophy ));
			
			else
				
				GameTextForPlayer(playerid, 2800, 3500, "Недостаточно очков обучения.","Font_Old_20_White_Hi.TGA", 255, 255, 255, 500);
			
			end
		
		else
		
			GameTextForPlayer(playerid, 3200, 3500, "Недостаточно золота.","Font_Old_20_White_Hi.TGA", 255, 255, 255, 500);
			
		end
		
	else 
		
		GameTextForPlayer(playerid, 2800, 3500, "Вы уже умеете добывать кровь.","Font_Old_20_White_Hi.TGA", 255, 255, 255, 500);

	end
	
end

function SetLuski( playerid, trophy )

	if GetPlayerLuski( playerid ) == 0 then
	
		if GetCostTrophy( trophy ) <= GetPlayerGold(playerid) then

			if GetLP( playerid ) >= 5 then
				
				HideMenuNieznajomy(playerid);
				DialogStart(playerid, Dialog_Nieznajomy[4], Menu_Nieznajomy[2], 1, 0);
				Player[playerid].Dialog = true;
				SetPlayerLuski( playerid, 1 );
				SetLP(playerid, GetLP( playerid ) - 5);
				RemoveItem(playerid, "ITMI_GOLD", GetCostTrophy( trophy ));
				DestroyItemPlayerAmount(playerid, "ITMI_GOLD", GetCostTrophy( trophy ));
			
			else
				
				GameTextForPlayer(playerid, 2800, 3500, "Недостаточно очков обучения.","Font_Old_20_White_Hi.TGA", 255, 255, 255, 500);
			
			end
		
		else
		
			GameTextForPlayer(playerid, 3200, 3500, "Недостаточно золота.","Font_Old_20_White_Hi.TGA", 255, 255, 255, 500);
			
		end
		
	else 
		
		GameTextForPlayer(playerid, 2800, 3500, "Вы уже умеете добывать кожу.","Font_Old_20_White_Hi.TGA", 255, 255, 255, 500);

	end
	
end

function SetKosci( playerid, trophy )

	if GetPlayerKosci( playerid ) == 0 then
	
		if GetCostTrophy( trophy ) <= GetPlayerGold(playerid) then

			if GetLP( playerid ) >= 3 then
				
				HideMenuNieznajomy(playerid);
				DialogStart(playerid, Dialog_Nieznajomy[5], Menu_Nieznajomy[2], 1, 0);
				Player[playerid].Dialog = true;
				SetPlayerKosci( playerid, 1 );
				SetLP(playerid, GetLP( playerid ) - 3);
				RemoveItem(playerid, "ITMI_GOLD", GetCostTrophy( trophy ));
				DestroyItemPlayerAmount(playerid, "ITMI_GOLD", GetCostTrophy( trophy ));
			
			else
				
				GameTextForPlayer(playerid, 2800, 3500, "Недостаточно очков обучения.","Font_Old_20_White_Hi.TGA", 255, 255, 255, 500);
			
			end
		
		else
		
			GameTextForPlayer(playerid, 3200, 3500, "Недостаточно золота.","Font_Old_20_White_Hi.TGA", 255, 255, 255, 500);
			
		end
		
	else 
		
		GameTextForPlayer(playerid, 2800, 3500, "Вы уже умеете добывать кости.","Font_Old_20_White_Hi.TGA", 255, 255, 255, 500);

	end
	
end

function SetGlowy( playerid, trophy )

	if GetPlayerGlowy( playerid ) == 0 then
		
		if GetCostTrophy( trophy ) <= GetPlayerGold(playerid) then

			if GetLP( playerid ) >= 3 then
				
				HideMenuNieznajomy(playerid);
				DialogStart(playerid, Dialog_Nieznajomy[6], Menu_Nieznajomy[2], 1, 0);
				Player[playerid].Dialog = true;
				SetPlayerGlowy( playerid, 1 );
				SetLP(playerid, GetLP( playerid ) - 3);
				RemoveItem(playerid, "ITMI_GOLD", GetCostTrophy( trophy ));
				DestroyItemPlayerAmount(playerid, "ITMI_GOLD", GetCostTrophy( trophy ));
			
			else
				
				GameTextForPlayer(playerid, 2800, 3500, "Недостаточно очков обучения.","Font_Old_20_White_Hi.TGA", 255, 255, 255, 500);
			
			end
		
		else
		
			GameTextForPlayer(playerid, 3200, 3500, "Недостаточно золота.","Font_Old_20_White_Hi.TGA", 255, 255, 255, 500);
			
		end
		
	else 
		
		GameTextForPlayer(playerid, 2800, 3500, "Вы уже умеете добывать головы.","Font_Old_20_White_Hi.TGA", 255, 255, 255, 500);

	end
	
end

function GetNPCMenuTexture()

	return Texture_Menu_NPC;

end

---------------