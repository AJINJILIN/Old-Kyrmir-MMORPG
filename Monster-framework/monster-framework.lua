require "Function/GetItemName"
require "Monster-framework/lvl"
require "Monster-framework/party"
require "Monster-framework/hunting"

----------------------------
--		Bonus EXP
---------------------------

local BonusExp = 75; -- in percent

----------------------------
--		Rodzaje AI
----------------------------

Animal = 0;
Fight_1H = 1;
Fight_2H = 2;

----------------------------
--		Spawn Monster
----------------------------
-- Tablica która przechowuje info

local MaxMonster = 0;
local MaxNPC = 0;
local Monster_Focus = {};
local Monster_Stop = {};
local Monster_Warn = {};
local Monster_TimerID = {};
local Monster_Blow = {};
local Monster_Anim = {};
local Monster_Attack = {};
local Monster_AI = {};
local Monster_Dead = {};
local Monster_Instance = {};
local Monster_Respawn_Time = {};
local Monster_Kill = {};

local Monster_X = {};
local Monster_Y = {};
local Monster_Z = {};

-- Pamiêtaj ¿e jest 25 NPCtów NIE MOBÓW!!!!!!!! // Kimior

local MonsterMordan = 231;
local MonsterGD = 230;
local MonsterTimer3 = 230;

local Monster = {
	["PC_HERO"] = { hp = 2000, str = 300, mob_exp = 1, maxdist = 1, mindist = 1, warndist = 1, respawn = 1 }, -- Nie ruszaæ !
	["ORCWARRIOR_HARAD"] = { hp = 3000, str = 1000, mob_exp = 3000, _h = 80, maxdist = 1100, mindist = 250, warndist = 700, respawn = 7 }, -- Ork
	["SWAMPSHARK"] = { hp = 4555, str = 999, mob_exp = 480, maxdist = 1100, mindist = 250, warndist = 700, respawn = 7 }, -- Wê¿e b³otne
	["MINECRAWLERWARRIOR"] = { hp = 400, str = 100, mob_exp = 300, maxdist = 1100, mindist = 250, warndist = 700, respawn = 5 }, -- Pe³zacz Wojownik
	["ICEWOLF"] = { hp = 400, str = 650, mob_exp = 420, maxdist = 1100, mindist = 250, warndist = 700, respawn = 5 }, -- Lodowy Wilk
	["CUTTHROAT"] = { hp = 260, str = 100, mob_exp = 300, _h = 60, maxdist = 1100, mindist = 250, warndist = 700, respawn = 6 }, -- Pirat
	["PIRATE"] = { hp = 300, str = 120, mob_exp = 350, _h = 60, maxdist = 1100, mindist = 250, warndist = 700, respawn = 6 }, -- Pirat
	["TROLL"] = { hp = 600, str = 500, mob_exp = 600, maxdist = 1200, mindist = 420, warndist = 700, respawn = 12 }, -- Troll
	["BLACKWOLF"] = { hp = 165, str = 80, mob_exp = 150, maxdist = 1100, mindist = 250, warndist = 450, respawn = 5 }, -- Czarny Wilk
	["GOBBO_WARRIOR"] = { hp = 100, str = 60, mob_exp = 100, _h = 50, maxdist = 1100, mindist = 250, warndist = 450, respawn = 5 }, -- Goblin Wojownik
	["GOBBO_GREEN"] = { hp = 50, str = 30, mob_exp = 50, _h = 30, maxdist = 1100, mindist = 250, warndist = 450, respawn = 5 }, -- Goblin
	["LESSER_SKELETON"] = { hp = 160, str = 100, mob_exp = 170, _h = 70, maxdist = 1100, mindist = 250, warndist = 450, respawn = 5 }, -- Pomniejszony Szkielet
	["GOBBO_SKELETON"] = { hp = 100, str = 100, mob_exp = 150, _h = 60, maxdist = 1100, mindist = 250, warndist = 450, respawn = 5 }, -- Szkielet Goblin
	["WOLF"] = { hp = 40, str = 40, mob_exp = 60, maxdist = 1100, mindist = 250, warndist = 450, respawn = 3 }, -- Wilk
	["YWOLF"] = { hp = 20, str = 10, mob_exp = 30, maxdist = 1100, mindist = 250, warndist = 450, respawn = 3 }, -- M³ody Wilk
	["OLD_WOLF"] = { hp = 80, str = 100, mob_exp = 120, maxdist = 1100, mindist = 250, warndist = 450, respawn = 3 }, -- Stary Wilk
	["BANDIT"] = { hp = 200, str = 60, mob_exp = 250, _h = 60, maxdist = 1100, mindist = 250, warndist = 450, respawn = 10}, -- Bandyta
	["SCAVENGER"] = { hp = 70, str = 40, mob_exp = 70, maxdist = 1100, mindist = 250, warndist = 450, respawn = 3}, -- Œcierwojad
	["YSCAVENGER"] = { hp = 10, str = 10, mob_exp = 30, maxdist = 1100, mindist = 250, warndist = 450, respawn = 3}, -- M³ody Œcierwojad
	["OLD_SCAVENGER"] = { hp = 100, str = 150, mob_exp = 100, maxdist = 1100, mindist = 250, warndist = 450, respawn = 3}, -- Stary Œcierwojad
	["TROLL_BLACK"] = { hp = 1000, str = 800, mob_exp = 1000, maxdist = 1100, mindist = 250, warndist = 450, respawn = 15}, -- Czarny Troll
	["WARAN"] = { hp = 120, str = 40, mob_exp = 120, maxdist = 1100, mindist = 250, warndist = 450, respawn = 5}, -- Jaszczur
	["LURKER"] = { hp = 120, str = 40, mob_exp = 120, maxdist = 1100, mindist = 250, warndist = 450, respawn = 5}, -- Topielec
	["WARG"] = { hp = 350, str = 400, mob_exp = 300, maxdist = 1100, mindist = 250, warndist = 450, respawn = 5}, -- Warg
	["ORCBITER"] = { hp = 250, str = 250, mob_exp = 220, maxdist = 1100, mindist = 250, warndist = 450, respawn = 4}, -- K¹sacz 
	["MOLERAT"] = { hp = 50, str = 30, mob_exp = 50, maxdist = 1100, mindist = 250, warndist = 450, respawn = 3}, -- Kretoszczur
	["DRAGONSNAPPER"] = { hp = 400, str = 450, mob_exp = 400, maxdist = 1100, mindist = 250, warndist = 450, respawn = 7}, -- Smoczy Zêbacz
	["SNAPPER"] = { hp = 160, str = 250, mob_exp = 160, maxdist = 1100, mindist = 250, warndist = 450, respawn = 5}, -- Zêbacz 
	["RAZOR"] = { hp = 180, str = 400, mob_exp = 220, maxdist = 1100, mindist = 250, warndist = 450, respawn = 5}, -- Brzytwa
	["SHADOWBEAST"] = { hp = 1500, str = 400, mob_exp = 600, maxdist = 1100, mindist = 250, warndist = 450, respawn = 10}, -- Cienio stwór
	["MINECRAWLER"] = { hp = 120, str = 100, mob_exp = 120, maxdist = 1100, mindist = 250, warndist = 450, respawn = 5}, -- Pe³zacz
	["FIREWARAN"] = { hp = 300, str = 700, mob_exp = 300, maxdist = 1100, mindist = 250, warndist = 450, respawn = 5}, -- Ognisty Jaszczur
	["YGIANT_RAT"] = { hp = 10, str = 15, mob_exp = 20, maxdist = 1100, mindist = 250, warndist = 450, respawn = 2}, -- M³ody Olbrzymi szczur
	["GIANT_RAT"] = { hp = 30, str = 15, mob_exp = 30, maxdist = 1100, mindist = 250, warndist = 450, respawn = 2}, -- Olbrzymi szczur
	["SWAMPSHARK"] = { hp = 240, str = 490, mob_exp = 240, maxdist = 1100, mindist = 250, warndist = 450, respawn = 4}, -- B³otny W¹¿
	["DRAGON_SWAMP"] = { hp = 400000, str = 120500, mob_exp = 250000, maxdist = 1100, mindist = 350, warndist = 550, respawn = 15}, -- B³otny Smok
	["DRAGON_STONE"] = { hp = 5000, str = 555, mob_exp = 4000, maxdist = 1100, mindist = 350, warndist = 550, respawn = 20}, -- Kamienny Smok
	["DRAGON_ICE"] = { hp = 450000, str = 90500, mob_exp = 200000, maxdist = 1100, mindist = 350, warndist = 550, respawn = 20}, -- Lodowy Smok
	["DRAGON_FIRE"] = { hp = 350000, str = 40500, mob_exp = 100000, maxdist = 1500, mindist = 450, warndist = 650, respawn = 30}, -- Ognisty Smok
	["DRAGON_UNDEAD"] = { hp = 2000, str = 1000, mob_exp = 10000, maxdist = 1100, mindist = 350, warndist = 550, respawn = 20}, -- Smok O¿ywieniec
	["FIREGOLEM"] = { hp = 60000, str = 1600, mob_exp = 16000, maxdist = 1100, mindist = 250, warndist = 450, respawn = 10}, -- Ognisty Golem
	["ICEGOLEM"] = { hp = 50000, str = 1500, mob_exp = 14000, maxdist = 1100, mindist = 250, warndist = 450, respawn = 10}, -- Lodowy Golem
	["STONEGOLEM"] = { hp = 40000, str = 1200, mob_exp = 10000, maxdist = 1100, mindist = 250, warndist = 450, respawn = 10}, -- Kamienny Golem
	["KEILER"] = { hp = 100, str = 40, mob_exp = 100, maxdist = 1100, mindist = 250, warndist = 450, respawn = 4}, -- Dzik 
	["SKELETON"] = { hp = 250, str = 145, mob_exp = 250, _h = 60, maxdist = 1100, mindist = 250, warndist = 450, respawn = 4},-- Szkielet
};

--------------------
-- Random Drop
--------------------

	

	

local Monster_Drop = {
	["PC_HERO"] = { "NILL" },
	["ORCWARRIOR_HARAD"] = { "ITMI_GOLD", "ITRU_TELEPORTOC", "ITMI_NUGGET", "ITMW_2H_ORCAXE_01", "HUM_KYRMIR21" },
	["SWAMPSHARK"] = { "ITMI_GOLD", "ITRU_TELEPORTOC", "ITMW_SPICKER", "ITMW_MORGENSTERN" },
	["MINECRAWLERWARRIOR"] =  { "ITSC_LIGHT", "ITPO_HEALTH_02", "ITMW_STEINBRECHER" },
	["ICEWOLF"] = { "ITMI_GOLD", "ITMI_GOLDPLATE", "ITMI_GOLDCUP", "ITRI_PROT_EDGE_02", "ITRU_TELEPORTOC", "ITSC_LIGHT", "ITMW_DOPPELAXT" },
	["CUTTHROAT"] = { "ITMW_ZWEIHAENDER1", "ITMW_SCHWERT", "ITAR_PIR_M_ADDON", "ITMI_GOLD", "ITMI_GOLDPLATE", "ITMI_SILVERPLATE", "ITMI_SILVERCUP", "ITMI_GOLDCUP" },
	["PIRATE"] = { "ITMW_ZWEIHAENDER1", "ITMW_SCHWERT", "ITAR_PIR_M_ADDON", "ITMI_GOLD", "ITMI_GOLDPLATE", "ITMI_SILVERPLATE", "ITMI_SILVERCUP", "ITMI_GOLDCUP" },
	["TROLL"] = { "ITMW_SCHWERT4", "ITMW_2H_AXE_LIGHT_01", "ITRW_BOW_L_02", "ITRW_CROSSBOW_L_01", "ITAR_LEATHER_L" },
	["BLACKWOLF"] = { "ITPO_HEALTH_02", "ITRI_PROT_EDGE_01" },
	["GOBBO_WARRIOR"] = { "ITSC_PALLIGHT", "ITRW_MIL_CROSSBOW", "ITAR_VLK_H" },
	["GOBBO_GREEN"] = { "ITSC_PALLIGHT", "ITMW_1H_BAU_MACE", "ITRW_MIL_CROSSBOW" },
	["LESSER_SKELETON"] = { "ITSC_PALLIGHT", "ITMW_1H_SWORD_OLD_01", "ITMW_ZWEIHAENDER1", "ITMW_SCHWERT", "ITMI_SILVERPLATE", "ITMI_SILVERCUP" },
	["GOBBO_SKELETON"] = { "ITSC_PALLIGHT", "ITMW_1H_BAU_MACE", "ITRW_BOW_L_01" },
	["WOLF"] = { "ITMW_1H_BAU_MACE", "ITMW_1H_BAU_AXE", "ITMW_1H_VLK_DAGGER" },
	["YWOLF"] = { "ITMW_1H_BAU_MACE", "ITMW_1H_BAU_AXE", "ITMW_1H_VLK_DAGGER" },
	["OLD_WOLF"] = { "ITMW_1H_BAU_MACE", "ITMW_1H_BAU_AXE", "ITMW_1H_VLK_DAGGER" },
	["BANDIT"] = { "ITMW_NAGELKNUEPPEL", "ITMW_SENSE", "ITMW_ALRIKSWORD_MIS" },
	["SCAVENGER"] ={ "ITMW_1H_BAU_MACE", "ITMW_1H_BAU_AXE", "ITMW_1H_VLK_DAGGER" },
	["YSCAVENGER"] = { "ITMW_1H_BAU_MACE", "ITMW_1H_BAU_AXE", "ITMW_1H_VLK_DAGGER" },
	["OLD_SCAVENGER"] = { "ITMW_SHORTSWORD2", "ITMW_1H_VLK_AXE", "ITMW_NAGELKNUEPPEL" },
	["TROLL_BLACK"] = { "ITMW_HELLEBARDE", "ITMW_ADDON_PIR1HAXE", "ITMW_ADDON_PIR2HAXE" },
	["WARAN"] = { "ITMW_1H_SLD_SWORD", "ITMW_1H_MISC_AXE", "ITMW_2H_BAU_AXE" },
	["LURKER"] = { "ITMW_1H_SLD_SWORD", "ITMW_1H_MISC_AXE", "ITMW_2H_BAU_AXE" },  
	["WARG"] = { "ITMW_ADDON_PIR1HAXE", "ITMW_HELLEBARDE", "ITMW_2H_BAU_AXE" },
	["ORCBITER"] = { "ITMW_ADDON_PIR1HAXE", "ITMW_HELLEBARDE", "ITMW_2H_BAU_AXE" },
	["MOLERAT"] = { "ITMW_1H_BAU_MACE", "ITMW_1H_BAU_AXE", "ITMW_1H_VLK_DAGGER" },
	["DRAGONSNAPPER"] = { "ITMW_ADDON_PIR1HAXE", "ITMW_HELLEBARDE", "ITMW_2H_BAU_AXE" },
	["SNAPPER"] = { "ITMW_NAGELKNUEPPEL", "ITMW_SENSE" },
	["RAZOR"] = { "ITMW_ADDON_PIR1HAXE", "ITMW_HELLEBARDE", "ITMW_2H_BAU_AXE" },
	["SHADOWBEAST"] = { "ITMW_HELLEBARDE", "ITMW_ADDON_PIR1HAXE", "ITMW_ADDON_PIR2HAXE"  },
	["MINECRAWLER"] =  { "ITMW_ADDON_PIR1HAXE", "ITMW_HELLEBARDE", "ITMW_2H_BAU_AXE" },
	["FIREWARAN"] =  { "ITMW_ADDON_PIR1HAXE", "ITMW_HELLEBARDE", "ITMW_2H_BAU_AXE" },
	["YGIANT_RAT"] = { "ITMW_SHORTSWORD2", "ITMW_1H_VLK_AXE", "ITMW_NAGELKNUEPPEL" },
	["GIANT_RAT"] = { "ITMW_SHORTSWORD2", "ITMW_1H_VLK_AXE", "ITMW_NAGELKNUEPPEL" },
	["SWAMPSHARK"] = { "ITMW_ADDON_PIR1HAXE", "ITMW_HELLEBARDE", "ITMW_2H_BAU_AXE" },
	["DRAGON_SWAMP"] = { "ITMW_ZWEIHAENDER4", "ITMW_ORKSCHLAECHTER", "ITAR_SLD_H" },
	["DRAGON_STONE"] = { "ITMW_ZWEIHAENDER4", "ITMW_ORKSCHLAECHTER", "ITAR_SLD_H" },
	["DRAGON_ICE"] = { "ITMW_ZWEIHAENDER4", "ITMW_ORKSCHLAECHTER", "ITAR_SLD_H" },
	["DRAGON_FIRE"] = { "ITMW_ZWEIHAENDER4", "ITMW_ORKSCHLAECHTER", "ITAR_SLD_H" },
	["DRAGON_UNDEAD"] = { "ITMW_ZWEIHAENDER4", "ITMW_ORKSCHLAECHTER","ITAR_SLD_H" },
	["FIREGOLEM"] = { "ITAR_KDF_L", "ItBe_Addon_Prot_EDGE", "ITMW_MORGENSTERN" },
	["ICEGOLEM"] = { "ITAR_KDW_H", "ITMW_MORGENSTERN", "ItBe_Addon_Prot_EDGE" },
	["STONEGOLEM"] = { "ITAR_OreBaron_Addon", "ItBe_Addon_Prot_EDGE", "ITMW_MORGENSTERN" },
	["KEILER"] = { "ITMW_SHORTSWORD2", "ITMW_1H_VLK_AXE", "ITMW_NAGELKNUEPPEL" },
	["SKELETON"] = { "ITMW_ADDON_PIR1HAXE", "ITMW_HELLEBARDE", "ITMW_2H_BAU_AXE" },
};

local Monster_Drop_Chance = {
	["PC_HERO"] = { 0 },
	["ORCWARRIOR_HARAD"] = { 10, 10, 100, 50, 5 },
	["SWAMPSHARK"] = { 10, 10, 20, 35 },
	["MINECRAWLERWARRIOR"] =  { 100, 50, 20 },
	["ICEWOLF"] = { 10, 80, 80, 35, 20, 100, 15 },
	["CUTTHROAT"] = { 5, 5, 5, 1, 20, 35, 35, 20 },
	["PIRATE"] = { 5, 5, 5, 1, 20, 35, 35, 20 },
	["TROLL"] = { 5, 5, 20, 20, 60 },
	["BLACKWOLF"] = { 100, 5 },
	["GOBBO_WARRIOR"] = { 10, 20, 25 },
	["GOBBO_GREEN"] = { 10, 100, 20 },
	["LESSER_SKELETON"] = { 10, 25, 10, 10, 90, 90 },
	["GOBBO_SKELETON"] = { 10, 100, 20 },
	["WOLF"] = { 100, 100, 100 },
	["YWOLF"] = { 100, 100, 100 },
	["OLD_WOLF"] = { 50, 50, 50 },
	["BANDIT"] = { 30, 30, 30 },
	["SCAVENGER"] = { 100, 100, 100 },
	["YSCAVENGER"] = { 100, 100, 100 },
	["OLD_SCAVENGER"] = { 50, 50, 50 },
	["TROLL_BLACK"] = { 10, 10, 10 },
	["WARAN"] = { 30, 30, 30 },
	["LURKER"] = { 30, 30, 30 },
	["WARG"] = { 10, 10, 10 },
	["ORCBITER"] = { 5, 5, 5 },
	["MOLERAT"] = { 50, 50, 50 },
	["DRAGONSNAPPER"] = { 3, 10, 10 },
	["SNAPPER"] = { 20, 20 },
	["RAZOR"] = { 20, 20, 20 },
	["SHADOWBEAST"] = { 10, 10, 10 },
	["MINECRAWLER"] = { 20, 20, 20 },
	["FIREWARAN"] = { 20, 20, 20 },
	["YGIANT_RAT"] = { 30, 30, 30 },
	["GIANT_RAT"] = { 30, 30, 30 },
	["SWAMPSHARK"] = { 15, 15, 15 },
	["DRAGON_SWAMP"] = { 2, 2, 2 },
	["DRAGON_STONE"] = { 2, 2, 2 },
	["DRAGON_ICE"] = { 2, 2, 2 },
	["DRAGON_FIRE"] = { 2, 2, 2 },
	["DRAGON_UNDEAD"] = { 2, 2, 2 },
	["FIREGOLEM"] = { 15, 15, 15 },
	["ICEGOLEM"] = { 15, 15, 15 },
	["STONEGOLEM"] = { 15, 15, 15 },
	["KEILER"] = { 30, 30, 30 },
	["SKELETON"] = { 10, 10, 10 },
};



--------------------
-- Drop 100%
--------------------

local Monster_Drop_Sure = {
	["PC_HERO"] = { "NILL" },
	["ORCWARRIOR_HARAD"] = { "NILL" },
	["SWAMPSHARK"] = { "NILL" },
	["MINECRAWLERWARRIOR"] =  { "NILL" },
	["ICEWOLF"] = { "ITFO_BACON" },
	["CUTTHROAT"] = { "NILL" },
	["PIRATE"] = { "NILL" },
	["TROLL"] = { "NILL" },
	["BLACKWOLF"] = { "ITFOMUTTONRAW" },
	["GOBBO_WARRIOR"] = { "NILL" },
	["GOBBO_GREEN"] = { "NILL" },
	["LESSER_SKELETON"] = { "NILL" },
	["GOBBO_SKELETON"] = { "NILL" },
	["WOLF"] = { "ITFOMUTTONRAW" }, -- Surowe miêso
	["YWOLF"] = { "ITFOMUTTONRAW" }, -- Surowe miêso
	["OLD_WOLF"] = { "ITFOMUTTONRAW" }, -- Surowe miêso
	["BANDIT"] = { "NILL" }, 
	["SCAVENGER"] = { "ITFOMUTTONRAW" }, 
	["YSCAVENGER"] = { "ITFOMUTTONRAW" }, 
	["OLD_SCAVENGER"] = { "ITFOMUTTONRAW" },
	["TROLL_BLACK"] = { "NILL" }, 
	["WARAN"] = { "NILL" },
	["LURKER"] = { "NILL" },
	["WARG"] = { "NILL" },
	["ORCBITER"] = { "ITFO_BACON" },
	["MOLERAT"] = { "ITFOMUTTONRAW" },
	["DRAGONSNAPPER"] = { "NILL" },
	["SNAPPER"] = { "NILL" },
	["RAZOR"] = { "NILL" },
	["SHADOWBEAST"] = { "NILL" },
	["MINECRAWLER"] = { "NILL" },
	["FIREWARAN"] = { "NILL"  },
	["YGIANT_RAT"] = { "ITFOMUTTONRAW" },
	["GIANT_RAT"] = { "ITFOMUTTONRAW" },
	["SWAMPSHARK"] = { "ITFOMUTTONRAW" }, 
	["DRAGON_SWAMP"] = { "NILL" },
	["DRAGON_STONE"] = { "NILL" },
	["DRAGON_ICE"] = { "NILL" },
	["DRAGON_FIRE"] = { "NILL" },
	["DRAGON_UNDEAD"] = { "NILL" },
	["FIREGOLEM"] = { "NILL" },
	["ICEGOLEM"] = { "NILL" },
	["STONEGOLEM"] = { "NILL" },
	["KEILER"] = { "ITFOMUTTONRAW", "ITFOMUTTONRAW" },
	["SKELETON"] = { "NILL" },
};

--------------------
-- Drop Science
--------------------

local Monster_Drop_Science_Pazury = {
	["PC_HERO"] = { "NILL" },
	["ORCWARRIOR_HARAD"] = { "NILL" },
	["SWAMPSHARK"] = { "NILL" },
	["MINECRAWLERWARRIOR"] =  { "NILL" },
	["ICEWOLF"] = { "ITAT_CLAW" },
	["CUTTHROAT"] = { "NILL" },
	["PIRATE"] = { "NILL" },
	["TROLL"] = { "NILL" },
	["BLACKWOLF"] = { "ITAT_CLAW" },
	["GOBBO_WARRIOR"] = { "NILL" },
	["GOBBO_GREEN"] = { "NILL" },
	["LESSER_SKELETON"] = { "NILL" },
	["GOBBO_SKELETON"] = { "NILL" },
	["WOLF"] = { "ITAT_CLAW" },
	["YWOLF"] = { "ITAT_CLAW" },
	["OLD_WOLF"] = { "ITAT_CLAW" },
	["BANDIT"] = { "NILL" },
	["SCAVENGER"] = { "ITAT_CLAW" },
	["YSCAVENGER"] = { "ITAT_CLAW" },
	["OLD_SCAVENGER"] = { "ITAT_CLAW" },
	["TROLL_BLACK"] = { "NILL" },
	["WARAN"] = { "ITAT_CLAW" },
	["LURKER"] = { "ITAT_LURKERCLAW" },
	["WARG"] = { "ITAT_CLAW" },
	["MOLERAT"] = { "NILL" },
	["ORCBITER"] = { "ITAT_CLAW" },
	["DRAGONSNAPPER"] = { "ITAT_CLAW" },
	["SNAPPER"] = { "ITAT_CLAW" },
	["RAZOR"] = { "ITAT_CLAW" },
	["SHADOWBEAST"] = { "ITAT_CLAW" },
	["MINECRAWLER"] = { "NILL" },
	["FIREWARAN"] = { "ITAT_CLAW" },
	["YGIANT_RAT"] = { "ITAT_CLAW" },
	["GIANT_RAT"] = { "ITAT_CLAW" },
	["SWAMPSHARK"] = { "NILL" },
	["DRAGON_SWAMP"] = { "NILL" },
	["DRAGON_STONE"] = { "NILL" },
	["DRAGON_ICE"] = { "NILL" },
	["DRAGON_FIRE"] = { "NILL" },
	["DRAGON_UNDEAD"] = { "NILL" },
	["FIREGOLEM"] = { "NILL" },
	["ICEGOLEM"] = { "NILL" },
	["STONEGOLEM"] = { "NILL" },
	["KEILER"] = { "NILL" },
	["SKELETON"] = { "NILL" },
};

local Monster_Drop_Science_Chence_Pazury = {
	["PC_HERO"] = { 0 },
	["ORCWARRIOR_HARAD"] = { 0 },
	["SWAMPSHARK"] = { 0 },
	["MINECRAWLERWARRIOR"] =  { 0 },
	["ICEWOLF"] = { 8 },
	["CUTTHROAT"] = { 0 },
	["PIRATE"] = { 0 },
	["TROLL"] = { 0 },
	["BLACKWOLF"] = { 4 },
	["GOBBO_WARRIOR"] = { 0 },
	["GOBBO_GREEN"] = { 0 },
	["LESSER_SKELETON"] = { 0 },
	["GOBBO_SKELETON"] = { 0 },
    ["WOLF"] = { 4 },
    ["YWOLF"] = { 4 },
    ["OLD_WOLF"] = { 5 },
    ["BANDIT"] = { 0 },
    ["SCAVENGER"] = { 4 },
    ["YSCAVENGER"] = { 3 },
    ["OLD_SCAVENGER"] = { 4 },
    ["TROLL_BLACK"] = { 0 },
    ["WARAN"] = { 6 },
    ["LURKER"] = { 6 },
    ["WARG"] = { 7 },
    ["MOLERAT"] = { 0 },
    ["ORCBITER"] = { 6 },
    ["DRAGONSNAPPER"] = { 8 },
    ["SNAPPER"] = { 8 },
    ["RAZOR"] = { 8 },
    ["SHADOWBEAST"] = { 9 },
    ["MINECRAWLER"] = { 0 },
    ["FIREWARAN"] = { 8  },
	["YGIANT_RAT"] = { 3 },
    ["GIANT_RAT"] = { 3 },
    ["SWAMPSHARK"] = { 0 },
    ["DRAGON_SWAMP"] = { 0 },
    ["DRAGON_STONE"] = { 0 },
    ["DRAGON_ICE"] = { 0 },
    ["DRAGON_FIRE"] = { 0 },
    ["DRAGON_UNDEAD"] = { 0 },
    ["FIREGOLEM"] = { 0 },
    ["ICEGOLEM"] = { 0 },
    ["STONEGOLEM"] = { 0 },
    ["KEILER"] = { 0 },
    ["SKELETON"] = { 0 },
};

local Monster_Drop_Science_Zuwaczki = {
	["PC_HERO"] = { "NILL" },
	["ORCWARRIOR_HARAD"] = { "NILL" },
	["SWAMPSHARK"] = { "NILL" },
	["MINECRAWLERWARRIOR"] =  { "ITAT_CRAWLERMANDIBLES" },
	["ICEWOLF"] = { "NILL" },
	["CUTTHROAT"] = { "NILL" },
	["PIRATE"] = { "NILL" },
	["TROLL"] = { "NILL" },
	["BLACKWOLF"] = { "NILL" },
	["GOBBO_WARRIOR"] = { "NILL" },
	["GOBBO_GREEN"] = { "NILL" },
	["LESSER_SKELETON"] = { "NILL" },
	["GOBBO_SKELETON"] = { "NILL" },
	["WOLF"] = { "NILL" },
	["YWOLF"] = { "NILL" },
	["OLD_WOLF"] = { "NILL" },
	["BANDIT"] = { "NILL" },
	["SCAVENGER"] = { "NILL" },
	["YSCAVENGER"] = { "NILL" },
	["OLD_SCAVENGER"] = { "NILL" },
	["TROLL_BLACK"] = { "NILL" },
	["WARAN"] = { "NILL" },
	["LURKER"] = { "NILL" },
	["WARG"] = { "NILL" },
	["MOLERAT"] = { "NILL" },
	["ORCBITER"] = { "NILL" },
	["DRAGONSNAPPER"] = { "NILL" },
	["SNAPPER"] = { "NILL" },
	["RAZOR"] = { "NILL" },
	["SHADOWBEAST"] = { "NILL" },
	["MINECRAWLER"] = { "ITAT_CRAWLERMANDIBLES" },
	["FIREWARAN"] = { "NILL"  },
	["YGIANT_RAT"] = { "NILL" },
	["GIANT_RAT"] = { "NILL" },
	["SWAMPSHARK"] = { "NILL" },
	["DRAGON_SWAMP"] = { "NILL" },
	["DRAGON_STONE"] = { "NILL"  },
	["DRAGON_ICE"] = { "NILL"  },
	["DRAGON_FIRE"] = { "NILL"  },
	["DRAGON_UNDEAD"] = { "NILL" },
	["FIREGOLEM"] = { "NILL" },
	["ICEGOLEM"] = { "NILL" },
	["STONEGOLEM"] = { "NILL" },
	["KEILER"] = { "NILL" },
	["SKELETON"] = { "NILL" },
};
 
local Monster_Drop_Science_Chence_Zuwaczki = {
    ["PC_HERO"] = { 0 },
	["ORCWARRIOR_HARAD"] = { 0 },
	["SWAMPSHARK"] = { 0 },
	["MINECRAWLERWARRIOR"] =  { 6 },
	["ICEWOLF"] = { 0 },
	["CUTTHROAT"] = { 0 },
	["PIRATE"] = { 0 },
	["TROLL"] = { 0 },
	["BLACKWOLF"] = { 0 },
	["GOBBO_WARRIOR"] = { 0 },
	["GOBBO_GREEN"] = { 0 },
	["LESSER_SKELETON"] = { 0 },
	["GOBBO_SKELETON"] = { 0 },
    ["WOLF"] = { 0 },
    ["YWOLF"] = { 0 },
    ["OLD_WOLF"] = { 0 },
    ["BANDIT"] = { 0 },
    ["SCAVENGER"] = { 0 },
    ["YSCAVENGER"] = { 0 },
    ["OLD_SCAVENGER"] = { 0 },
    ["TROLL_BLACK"] = { 0 },
    ["WARAN"] = { 0 },
    ["LURKER"] = { 0 },
    ["WARG"] = { 0 },
    ["MOLERAT"] = { 0 },
    ["ORCBITER"] = { 0 },
    ["DRAGONSNAPPER"] = { 0 },
    ["SNAPPER"] = { 0 },
    ["RAZOR"] = { 0 },
    ["SHADOWBEAST"] = { 0 },
    ["MINECRAWLER"] = { 3 },
    ["FIREWARAN"] = { 0  },
    ["YGIANT_RAT"] = { 0 },
    ["GIANT_RAT"] = { 0 },
    ["SWAMPSHARK"] = { 0 },
    ["DRAGON_SWAMP"] = { 0 },
    ["DRAGON_STONE"] = { 0 },
    ["DRAGON_ICE"] = { 0 },
    ["DRAGON_FIRE"] = { 0 },
    ["DRAGON_UNDEAD"] = { 0 },
    ["FIREGOLEM"] = { 0 },
    ["ICEGOLEM"] = { 0 },
    ["STONEGOLEM"] = { 0 },
    ["KEILER"] = { 0 },
    ["SKELETON"] = { 0 },
};

local Monster_Drop_Science_Plyty = {
	["PC_HERO"] = { "NILL" },
	["ORCWARRIOR_HARAD"] = { "NILL" },
	["SWAMPSHARK"] = { "NILL" },
	["MINECRAWLERWARRIOR"] =  { "ITAT_CRAWLERPLATE" },
	["ICEWOLF"] = { "NILL" },
	["CUTTHROAT"] = { "NILL" },
	["PIRATE"] = { "NILL" },
	["TROLL"] = { "NILL" },
	["BLACKWOLF"] = { "NILL" },
	["GOBBO_WARRIOR"] = { "NILL" },
	["GOBBO_GREEN"] = { "NILL" },
	["LESSER_SKELETON"] = { "NILL" },
	["GOBBO_SKELETON"] = { "NILL" },
	["WOLF"] = { "NILL" },
	["YWOLF"] = { "NILL" },
	["OLD_WOLF"] = { "NILL" },
	["BANDIT"] = { "NILL" },
	["SCAVENGER"] = { "NILL" },
	["YSCAVENGER"] = { "NILL" },
	["OLD_SCAVENGER"] = { "NILL" },
	["TROLL_BLACK"] = { "NILL" },
	["WARAN"] = { "NILL" },
	["LURKER"] = { "NILL" },
	["WARG"] = { "NILL" },
	["MOLERAT"] = { "NILL" },
	["ORCBITER"] = { "NILL" },
	["DRAGONSNAPPER"] = { "NILL" },
	["SNAPPER"] = { "NILL" },
	["RAZOR"] = { "NILL" },
	["SHADOWBEAST"] = { "NILL" },
	["MINECRAWLER"] = { "ITAT_CRAWLERPLATE" },
	["FIREWARAN"] = { "NILL"  },
	["YGIANT_RAT"] = { "NILL" },
	["GIANT_RAT"] = { "NILL" },
	["SWAMPSHARK"] = { "NILL" },
	["DRAGON_SWAMP"] = { "NILL" },
	["DRAGON_STONE"] = { "NILL"  },
	["DRAGON_ICE"] = { "NILL"  },
	["DRAGON_FIRE"] = { "NILL"  },
	["DRAGON_UNDEAD"] = { "NILL" },
	["FIREGOLEM"] = { "NILL" },
	["ICEGOLEM"] = { "NILL" },
	["STONEGOLEM"] = { "NILL" },
	["KEILER"] = { "NILL" },
	["SKELETON"] = { "NILL" },
};
 
local Monster_Drop_Science_Chence_Plyty = {
    ["PC_HERO"] = { 0 },
	["ORCWARRIOR_HARAD"] = { 0 },
	["SWAMPSHARK"] = { 0 },
	["MINECRAWLERWARRIOR"] =  { 5 },
	["ICEWOLF"] = { 0 },
	["CUTTHROAT"] = { 0 },
	["PIRATE"] = { 0 },
	["TROLL"] = { 0 },
	["BLACKWOLF"] = { 0 },
	["GOBBO_WARRIOR"] = { 0 },
	["GOBBO_GREEN"] = { 0 },
	["LESSER_SKELETON"] = { 0 },
	["GOBBO_SKELETON"] = { 0 },
    ["WOLF"] = { 0 },
    ["YWOLF"] = { 0 },
    ["OLD_WOLF"] = { 0 },
    ["BANDIT"] = { 0 },
    ["SCAVENGER"] = { 0 },
    ["YSCAVENGER"] = { 0 },
    ["OLD_SCAVENGER"] = { 0 },
    ["TROLL_BLACK"] = { 0 },
    ["WARAN"] = { 0 },
    ["LURKER"] = { 0 },
    ["WARG"] = { 0 },
    ["MOLERAT"] = { 0 },
    ["ORCBITER"] = { 0 },
    ["DRAGONSNAPPER"] = { 0 },
    ["SNAPPER"] = { 0 },
    ["RAZOR"] = { 0 },
    ["SHADOWBEAST"] = { 0 },
    ["MINECRAWLER"] = { 2 },
    ["FIREWARAN"] = { 0  },
    ["YGIANT_RAT"] = { 0 },
    ["GIANT_RAT"] = { 0 },
    ["SWAMPSHARK"] = { 0 },
    ["DRAGON_SWAMP"] = { 0 },
    ["DRAGON_STONE"] = { 0 },
    ["DRAGON_ICE"] = { 0 },
    ["DRAGON_FIRE"] = { 0 },
    ["DRAGON_UNDEAD"] = { 0 },
    ["FIREGOLEM"] = { 0 },
    ["ICEGOLEM"] = { 0 },
    ["STONEGOLEM"] = { 0 },
    ["KEILER"] = { 0 },
    ["SKELETON"] = { 0 },
};

local Monster_Drop_Science_Skora = {
	["PC_HERO"] = { "NILL" },
	["ORCWARRIOR_HARAD"] = { "NILL" },
	["SWAMPSHARK"] = { "ITAT_SHARKSKIN" },
	["MINECRAWLERWARRIOR"] =  { "NILL" },
	["ICEWOLF"] = { "ITAT_WOLFFUR" },
	["CUTTHROAT"] = { "NILL" },
	["PIRATE"] = { "NILL" },
	["TROLL"] = { "ITAT_TROLLFUR" },
	["BLACKWOLF"] = { "ITAT_WOLFFUR" },
	["GOBBO_WARRIOR"] = { "NILL" },
	["GOBBO_GREEN"] = { "NILL" },
	["LESSER_SKELETON"] = { "NILL" },
	["GOBBO_SKELETON"] = { "NILL" },
	["WOLF"] = { "ITAT_WOLFFUR" },
	["YWOLF"] = { "ITAT_WOLFFUR" },
	["OLD_WOLF"] = { "ITAT_WOLFFUR" },
	["BANDIT"] = { "NILL" },
	["SCAVENGER"] = { "NILL" },
	["YSCAVENGER"] = { "NILL" },
	["OLD_SCAVENGER"] = { "NILL" },
	["TROLL_BLACK"] = { "ITAT_TROLLFUR" },
	["WARAN"] = { "NILL" },
	["LURKER"] = { "ITAT_LURKERSKIN" },
	["WARG"] = { "ITAT_WARGFUR" },
	["MOLERAT"] = { "NILL" },
	["ORCBITER"] = { "NILL" },
	["DRAGONSNAPPER"] = { "NILL" },
	["SNAPPER"] = { "NILL" },
	["RAZOR"] = { "NILL" },
	["SHADOWBEAST"] = { "ITAT_SHADOWFUR" },
	["MINECRAWLER"] = { "NILL" },
	["FIREWARAN"] = { "NILL"  },
	["YGIANT_RAT"] = { "NILL" },
	["GIANT_RAT"] = { "NILL" },
	["SWAMPSHARK"] = { "ITAT_SHARKSKIN" },
	["DRAGON_SWAMP"] = { "NILL" },
	["DRAGON_STONE"] = { "NILL"  },
	["DRAGON_ICE"] = { "NILL"  },
	["DRAGON_FIRE"] = { "NILL"  },
	["DRAGON_UNDEAD"] = { "NILL" },
	["FIREGOLEM"] = { "NILL" },
	["ICEGOLEM"] = { "NILL" },
	["STONEGOLEM"] = { "NILL" },
	["KEILER"] = { "ITAT_ADDON_KEILERFUR" },
	["SKELETON"] = { "NILL" },
};
 
local Monster_Drop_Science_Chence_Skora = {
    ["PC_HERO"] = { 0 },
	["ORCWARRIOR_HARAD"] = { 0 },
	["SWAMPSHARK"] = { 7 },
	["MINECRAWLERWARRIOR"] =  { 0 },
	["ICEWOLF"] = { 10 },
	["CUTTHROAT"] = { 0 },
	["PIRATE"] = { 0 },
	["TROLL"] = { 4 },
	["BLACKWOLF"] = { 4 },
	["GOBBO_WARRIOR"] = { 0 },
	["GOBBO_GREEN"] = { 0 },
	["LESSER_SKELETON"] = { 0 },
	["GOBBO_SKELETON"] = { 0 },
    ["WOLF"] = { 5 },
    ["YWOLF"] = { 3 },
    ["OLD_WOLF"] = { 6 },
    ["BANDIT"] = { 0 },
    ["SCAVENGER"] = { 0 },
    ["YSCAVENGER"] = { 0 },
    ["OLD_SCAVENGER"] = { 0 },
    ["TROLL_BLACK"] = { 10 },
    ["WARAN"] = { 0 },
    ["LURKER"] = { 5 },
    ["WARG"] = { 8 },
    ["MOLERAT"] = { 0 },
    ["ORCBITER"] = { 0 },
    ["DRAGONSNAPPER"] = { 0 },
    ["SNAPPER"] = { 0 },
    ["RAZOR"] = { 0 },
    ["SHADOWBEAST"] = { 5 },
    ["MINECRAWLER"] = { 0 },
    ["FIREWARAN"] = { 0 },
    ["YGIANT_RAT"] = { 0 },
    ["GIANT_RAT"] = { 0 },
    ["SWAMPSHARK"] = { 3 },
    ["DRAGON_SWAMP"] = { 0 },
    ["DRAGON_STONE"] = { 0 },
    ["DRAGON_ICE"] = { 0 },
    ["DRAGON_FIRE"] = { 0 },
    ["DRAGON_UNDEAD"] = { 0 },
    ["FIREGOLEM"] = { 0 },
    ["ICEGOLEM"] = { 0 },
    ["STONEGOLEM"] = { 0 },
    ["KEILER"] = { 5 },
    ["SKELETON"] = { 0 },
};

local Monster_Drop_Science_Kly = {
	["PC_HERO"] = { "NILL" },
	["ORCWARRIOR_HARAD"] = { "NILL" },
	["SWAMPSHARK"] = { "ITAT_SHARKTEETH" },
	["MINECRAWLERWARRIOR"] =  { "NILL" },
	["ICEWOLF"] = { "NILL" },
	["CUTTHROAT"] = { "NILL" },
	["PIRATE"] = { "NILL" },
	["TROLL"] = { "ITAT_TROLLTOOTH" },
	["BLACKWOLF"] = { "NILL" },
	["GOBBO_WARRIOR"] = { "NILL" },
	["GOBBO_GREEN"] = { "NILL" },
	["LESSER_SKELETON"] = { "NILL" },
	["GOBBO_SKELETON"] = { "NILL" },
	["WOLF"] = { "ITAT_TEETH" },
	["YWOLF"] = { "ITAT_TEETH" },
	["OLD_WOLF"] = { "ITAT_TEETH" },
	["BANDIT"] = { "NILL" },
	["SCAVENGER"] = { "NILL" },
	["YSCAVENGER"] = { "NILL" },
	["OLD_SCAVENGER"] = { "NILL" },
	["TROLL_BLACK"] = { "ITAT_TROLLTOOT" },
	["WARAN"] = { "NILL" },
	["LURKER"] = { "NILL" },
	["WARG"] = { "ITAT_TEETH" },
	["MOLERAT"] = { "NILL" },
	["ORCBITER"] = { "ITAT_TEETH" },
	["DRAGONSNAPPER"] = { "ITAT_TEETH" },
	["SNAPPER"] = { "ITAT_TEETH" },
	["RAZOR"] = { "ITAT_TEETH" },
	["SHADOWBEAST"] = { "NILL" },
	["MINECRAWLER"] = { "NILL" },
	["FIREWARAN"] = { "NILL" },
	["YGIANT_RAT"] = { "NILL" },
	["GIANT_RAT"] = { "NILL" },
	["SWAMPSHARK"] = { "ITAT_SHARKTEETH" },
	["DRAGON_SWAMP"] = { "NILL" },
	["DRAGON_STONE"] = { "NILL" },
	["DRAGON_ICE"] = { "NILL" },
	["DRAGON_FIRE"] = { "NILL"  },
	["DRAGON_UNDEAD"] = { "NILL" },
	["FIREGOLEM"] = { "NILL" },
	["ICEGOLEM"] = { "NILL" },
	["STONEGOLEM"] = { "NILL" },
	["KEILER"] = { "ITAT_TEETH" },
	["SKELETON"] = { "NILL" },
};

local Monster_Drop_Science_Chence_Kly = {
	["PC_HERO"] = { 0 },
	["ORCWARRIOR_HARAD"] = { 0 },
	["SWAMPSHARK"] = { 8 },
	["MINECRAWLERWARRIOR"] =  { 0 },
	["ICEWOLF"] = { 0 },
	["CUTTHROAT"] = { 0 },
	["PIRATE"] = { 0 },
	["TROLL"] = { 4 },
	["BLACKWOLF"] = { 5 },
	["GOBBO_WARRIOR"] = { 0 },
	["GOBBO_GREEN"] = { 0 },
	["LESSER_SKELETON"] = { 0 },
	["GOBBO_SKELETON"] = { 0 },
    ["WOLF"] = { 5 },
    ["YWOLF"] = { 4 },
    ["OLD_WOLF"] = { 6 },
    ["BANDIT"] = { 0 },
    ["SCAVENGER"] = { 0 },
    ["YSCAVENGER"] = { 0 },
    ["OLD_SCAVENGER"] = { 0 },
    ["TROLL_BLACK"] = { 10 },
    ["WARAN"] = { 7 },
    ["LURKER"] = { 0 },
    ["WARG"] = { 8 },
    ["MOLERAT"] = { 0 },
    ["ORCBITER"] = { 6 },
    ["DRAGONSNAPPER"] = { 9 },
    ["SNAPPER"] = { 7 },
    ["RAZOR"] = { 7 },
    ["SHADOWBEAST"] = { 0 },
    ["MINECRAWLER"] = { 0 },
    ["FIREWARAN"] = { 9 },
	["YGIANT_RAT"] = { 0 },
    ["GIANT_RAT"] = { 0 },
    ["SWAMPSHARK"] = { 7 },
    ["DRAGON_SWAMP"] = { 0 },
    ["DRAGON_STONE"] = { 0 },
    ["DRAGON_ICE"] = { 0 },
    ["DRAGON_FIRE"] = { 0 },
    ["DRAGON_UNDEAD"] = { 0 },
    ["FIREGOLEM"] = { 0 },
    ["ICEGOLEM"] = { 0 },
    ["STONEGOLEM"] = { 0 },
    ["KEILER"] = { 6 },
    ["SKELETON"] = { 0 },
};

local Monster_Drop_Science_Rog = {
	["PC_HERO"] = { "NILL" },
	["ORCWARRIOR_HARAD"] = { "NILL" },
	["SWAMPSHARK"] = { "NILL" },
	["MINECRAWLERWARRIOR"] =  { "NILL" },
	["ICEWOLF"] = { "NILL" },
	["CUTTHROAT"] = { "NILL" },
	["PIRATE"] = { "NILL" },
	["TROLL"] = { "NILL" },
	["BLACKWOLF"] = { "NILL" },
	["GOBBO_WARRIOR"] = { "NILL" },
	["GOBBO_GREEN"] = { "NILL" },
	["LESSER_SKELETON"] = { "NILL" },
	["GOBBO_SKELETON"] = { "NILL" },
	["WOLF"] = { "NILL" },
	["YWOLF"] = { "NILL" },
	["OLD_WOLF"] = { "NILL" },
	["BANDIT"] = { "NILL" },
	["SCAVENGER"] = { "NILL" },
	["YSCAVENGER"] = { "NILL" },
	["OLD_SCAVENGER"] = { "NILL" },
	["TROLL_BLACK"] = { "NILL" },
	["WARAN"] = { "NILL" },
	["LURKER"] = { "NILL" },
	["WARG"] = { "NILL" },
	["MOLERAT"] = { "NILL" },
	["ORCBITER"] = { "NILL" },
	["DRAGONSNAPPER"] = { "ITAT_DRGSNAPPERHORN" },
	["SNAPPER"] = { "NILL" },
	["RAZOR"] = { "NILL" },
	["SHADOWBEAST"] = { "ITAT_SHADOWHORN" },
	["MINECRAWLER"] = { "NILL" },
	["FIREWARAN"] = { "NILL"  },
	["YGIANT_RAT"] = { "NILL" },
	["GIANT_RAT"] = { "NILL" },
	["SWAMPSHARK"] = { "NILL" },
	["DRAGON_SWAMP"] = { "NILL" },
	["DRAGON_STONE"] = { "NILL"  },
	["DRAGON_ICE"] = { "NILL"  },
	["DRAGON_FIRE"] = { "NILL"  },
	["DRAGON_UNDEAD"] = { "NILL" },
	["FIREGOLEM"] = { "NILL" },
	["ICEGOLEM"] = { "NILL" },
	["STONEGOLEM"] = { "NILL" },
	["KEILER"] = { "NILL" },
	["SKELETON"] = { "NILL" },
};
 
local Monster_Drop_Science_Chence_Rog = {
    ["PC_HERO"] = { 0 },
	["ORCWARRIOR_HARAD"] = { 0 },
	["SWAMPSHARK"] = { 0 },
	["MINECRAWLERWARRIOR"] =  { 0 },
	["ICEWOLF"] = { 0 },
	["CUTTHROAT"] = { 0 },
	["PIRATE"] = { 0 },
	["TROLL"] = { 0 },
	["BLACKWOLF"] = { 0 },
	["GOBBO_WARRIOR"] = { 0 },
	["GOBBO_GREEN"] = { 0 },
	["LESSER_SKELETON"] = { 0 },
	["GOBBO_SKELETON"] = { 0 },
    ["WOLF"] = { 0 },
    ["YWOLF"] = { 0 },
    ["OLD_WOLF"] = { 0 },
    ["BANDIT"] = { 0 },
    ["SCAVENGER"] = { 0 },
    ["YSCAVENGER"] = { 0 },
    ["OLD_SCAVENGER"] = { 0 },
    ["TROLL_BLACK"] = { 0 },
    ["WARAN"] = { 0 },
    ["LURKER"] = { 0 },
    ["WARG"] = { 0 },
    ["MOLERAT"] = { 0 },
    ["ORCBITER"] = { 0 },
    ["DRAGONSNAPPER"] = { 4 },
    ["SNAPPER"] = { 0 },
    ["RAZOR"] = { 0 },
    ["SHADOWBEAST"] = { 4 },
    ["MINECRAWLER"] = { 0 },
    ["FIREWARAN"] = { 0 },
    ["YGIANT_RAT"] = { 0 },
    ["GIANT_RAT"] = { 0 },
    ["SWAMPSHARK"] = { 0 },
    ["DRAGON_SWAMP"] = { 0 },
    ["DRAGON_STONE"] = { 0 },
    ["DRAGON_ICE"] = { 0 },
    ["DRAGON_FIRE"] = { 0 },
    ["DRAGON_UNDEAD"] = { 0 },
    ["FIREGOLEM"] = { 0 },
    ["ICEGOLEM"] = { 0 },
    ["STONEGOLEM"] = { 0 },
    ["KEILER"] = { 0 },
    ["SKELETON"] = { 0 },
};

local Monster_Drop_Science_Serca = {
	["PC_HERO"] = { "NILL" },
	["ORCWARRIOR_HARAD"] = { "NILL" },
	["SWAMPSHARK"] = { "NILL" },
	["MINECRAWLERWARRIOR"] =  { "NILL" },
	["ICEWOLF"] = { "NILL" },
	["CUTTHROAT"] = { "NILL" },
	["PIRATE"] = { "NILL" },
	["TROLL"] = { "NILL" },
	["BLACKWOLF"] = { "NILL" },
	["GOBBO_WARRIOR"] = { "NILL" },
	["GOBBO_GREEN"] = { "NILL" },
	["LESSER_SKELETON"] = { "NILL" },
	["GOBBO_SKELETON"] = { "NILL" },
	["WOLF"] = { "NILL" },
	["YWOLF"] = { "NILL" },
	["OLD_WOLF"] = { "NILL" },
	["BANDIT"] = { "NILL" },
	["SCAVENGER"] = { "NILL" },
	["YSCAVENGER"] = { "NILL" },
	["OLD_SCAVENGER"] = { "NILL" },
	["TROLL_BLACK"] = { "NILL" },
	["WARAN"] = { "NILL" },
	["LURKER"] = { "NILL" },
	["WARG"] = { "NILL" },
	["MOLERAT"] = { "NILL" },
	["ORCBITER"] = { "NILL" },
	["DRAGONSNAPPER"] = { "NILL" },
	["SNAPPER"] = { "NILL" },
	["RAZOR"] = { "NILL" },
	["SHADOWBEAST"] = { "NILL" },
	["MINECRAWLER"] = { "NILL" },
	["FIREWARAN"] = { "NILL"  },
	["YGIANT_RAT"] = { "NILL" },
	["GIANT_RAT"] = { "NILL" },
	["SWAMPSHARK"] = { "NILL" },
	["DRAGON_SWAMP"] = { "ItAt_SwampdragonHeart" },
	["DRAGON_STONE"] = { "ITAT_ROCKDRAGONHEART"  },
	["DRAGON_ICE"] = { "ITAT_ICEDRAGONHEART"  },
	["DRAGON_FIRE"] = { "ITAT_FIREDRAGONHEART"  },
	["DRAGON_UNDEAD"] = { "NILL" },
	["FIREGOLEM"] = { "ITAT_FIREGOLEMHEART" },
	["ICEGOLEM"] = { "ITAT_ICEGOLEMHEART" },
	["STONEGOLEM"] = { "ITAT_STONEGOLEMHEART" },
	["KEILER"] = { "NILL" },
	["SKELETON"] = { "NILL" },
};
 
local Monster_Drop_Science_Chence_Serca = {
    ["PC_HERO"] = { 0 },
	["ORCWARRIOR_HARAD"] = { 0 },
	["SWAMPSHARK"] = { 0 },
	["MINECRAWLERWARRIOR"] = { 0 },
	["ICEWOLF"] = { 0 },
	["CUTTHROAT"] = { 0 },
	["PIRATE"] = { 0 },
	["TROLL"] = { 0 },
	["BLACKWOLF"] = { 0 },
	["GOBBO_WARRIOR"] = { 0 },
	["GOBBO_GREEN"] = { 0 },
	["LESSER_SKELETON"] = { 0 },
	["GOBBO_SKELETON"] = { 0 },
    ["WOLF"] = { 0 },
    ["YWOLF"] = { 0 },
    ["OLD_WOLF"] = { 0 },
    ["BANDIT"] = { 0 },
    ["SCAVENGER"] = { 0 },
    ["YSCAVENGER"] = { 0 },
    ["OLD_SCAVENGER"] = { 0 },
    ["TROLL_BLACK"] = { 0 },
    ["WARAN"] = { 0 },
    ["LURKER"] = { 0 },
    ["WARG"] = { 0 },
    ["MOLERAT"] = { 0 },
    ["ORCBITER"] = { 0 },
    ["DRAGONSNAPPER"] = { 0 },
    ["SNAPPER"] = { 0 },
    ["RAZOR"] = { 0 },
    ["SHADOWBEAST"] = { 0 },
    ["MINECRAWLER"] = { 0 },
    ["FIREWARAN"] = { 0 },
    ["YGIANT_RAT"] = { 0 },
    ["GIANT_RAT"] = { 0 },
    ["SWAMPSHARK"] = { 0 },
    ["DRAGON_SWAMP"] = { 1 },
    ["DRAGON_STONE"] = { 1 },
    ["DRAGON_ICE"] = { 1 },
    ["DRAGON_FIRE"] = { 6 },
    ["DRAGON_UNDEAD"] = { 0 },
    ["FIREGOLEM"] = { 7 },
    ["ICEGOLEM"] = { 7 },
    ["STONEGOLEM"] = { 7 },
    ["KEILER"] = { 0 },
    ["SKELETON"] = { 0 },
};

local Monster_Drop_Science_Jezyki = {
	["PC_HERO"] = { "NILL" },
	["ORCWARRIOR_HARAD"] = { "NILL" },
	["SWAMPSHARK"] = { "NILL" },
	["MINECRAWLERWARRIOR"] = { "NILL" },
	["ICEWOLF"] = { "NILL" },
	["CUTTHROAT"] = { "NILL" },
	["PIRATE"] = { "NILL" },
	["TROLL"] = { "NILL" },
	["BLACKWOLF"] = { "NILL" },
	["GOBBO_WARRIOR"] = { "NILL" },
	["GOBBO_GREEN"] = { "NILL" },
	["LESSER_SKELETON"] = { "NILL" },
	["GOBBO_SKELETON"] = { "NILL" },
	["WOLF"] = { "NILL" },
	["YWOLF"] = { "NILL" },
	["OLD_WOLF"] = { "NILL" },
	["BANDIT"] = { "NILL" },
	["SCAVENGER"] = { "NILL" },
	["YSCAVENGER"] = { "NILL" },
	["OLD_SCAVENGER"] = { "NILL" },
	["TROLL_BLACK"] = { "NILL" },
	["WARAN"] = { "NILL" },
	["LURKER"] = { "NILL" },
	["WARG"] = { "NILL" },
	["MOLERAT"] = { "NILL" },
	["ORCBITER"] = { "NILL" },
	["DRAGONSNAPPER"] = { "NILL" },
	["SNAPPER"] = { "NILL" },
	["RAZOR"] = { "NILL" },
	["SHADOWBEAST"] = { "NILL" },
	["MINECRAWLER"] = { "NILL" },
	["FIREWARAN"] = { "ITAT_WARANFIRETONGUE" },
	["YGIANT_RAT"] = { "NILL" },
	["GIANT_RAT"] = { "NILL" },
	["SWAMPSHARK"] = { "NILL" },
	["DRAGON_SWAMP"] = { "NILL" },
	["DRAGON_STONE"] = { "NILL" },
	["DRAGON_ICE"] = { "NILL" },
	["DRAGON_FIRE"] = { "NILL" },
	["DRAGON_UNDEAD"] = { "NILL" },
	["FIREGOLEM"] = { "NILL" },
	["ICEGOLEM"] = { "NILL" },
	["STONEGOLEM"] = { "NILL" },
	["KEILER"] = { "NILL" },
	["SKELETON"] = { "NILL" },
};

local Monster_Drop_Science_Chence_Jezyki = {
	["PC_HERO"] = { 0 },
	["ORCWARRIOR_HARAD"] = { 0 },
	["SWAMPSHARK"] = { 0 },
	["MINECRAWLERWARRIOR"] = { 0 },
	["ICEWOLF"] = { 0 },
	["CUTTHROAT"] = { 0 },
	["PIRATE"] = { 0 },
	["TROLL"] = { 0 },
	["BLACKWOLF"] = { 0 },
	["GOBBO_WARRIOR"] = { 0 },
	["GOBBO_GREEN"] = { 0 },
	["LESSER_SKELETON"] = { 0 },
	["GOBBO_SKELETON"] = { 0 },
    ["WOLF"] = { 0 },
    ["YWOLF"] = { 0 },
    ["OLD_WOLF"] = { 0 },
    ["BANDIT"] = { 0 },
    ["SCAVENGER"] = { 0 },
    ["YSCAVENGER"] = { 0 },
    ["OLD_SCAVENGER"] = { 0 },
    ["TROLL_BLACK"] = { 0 },
    ["WARAN"] = { 0 },
    ["LURKER"] = { 0 },
    ["WARG"] = { 0 },
    ["MOLERAT"] = { 0 },
    ["ORCBITER"] = { 0 },
    ["DRAGONSNAPPER"] = { 0 },
    ["SNAPPER"] = { 0 },
    ["RAZOR"] = { 0 },
    ["SHADOWBEAST"] = { 0 },
    ["MINECRAWLER"] = { 0 },
    ["FIREWARAN"] = { 8 },
    ["YGIANT_RAT"] = { 0 },
    ["GIANT_RAT"] = { 0 },
    ["SWAMPSHARK"] = { 0 },
    ["DRAGON_SWAMP"] = { 0 },
    ["DRAGON_STONE"] = { 0 },
    ["DRAGON_ICE"] = { 0 },
    ["DRAGON_FIRE"] = { 0 },
    ["DRAGON_UNDEAD"] = { 0 },
    ["FIREGOLEM"] = { 0 },
    ["ICEGOLEM"] = { 0 },
    ["STONEGOLEM"] = { 0 },
    ["KEILER"] = { 0 },
    ["SKELETON"] = { 0 },
};

local Monster_Drop_Science_Krew = {
	["PC_HERO"] = { "NILL" },
	["ORCWARRIOR_HARAD"] = { "NILL" },
	["SWAMPSHARK"] = { "NILL" },
	["MINECRAWLERWARRIOR"] = { "NILL" },
	["ICEWOLF"] = { "NILL" },
	["CUTTHROAT"] = { "NILL" },
	["PIRATE"] = { "NILL" },
	["TROLL"] = { "NILL" },
	["BLACKWOLF"] = { "NILL" },
	["GOBBO_WARRIOR"] = { "NILL" },
	["GOBBO_GREEN"] = { "NILL" },
	["LESSER_SKELETON"] = { "NILL" },
	["GOBBO_SKELETON"] = { "NILL" },
	["WOLF"] = { "NILL" },
	["YWOLF"] = { "NILL" },
	["OLD_WOLF"] = { "NILL" },
	["BANDIT"] = { "NILL" },
	["SCAVENGER"] = { "NILL" },
	["YSCAVENGER"] = { "NILL" },
	["OLD_SCAVENGER"] = { "NILL" },
	["TROLL_BLACK"] = { "NILL" },
	["WARAN"] = { "NILL" },
	["LURKER"] = { "NILL" },
	["WARG"] = { "NILL" },
	["MOLERAT"] = { "NILL" },
	["ORCBITER"] = { "NILL" },
	["DRAGONSNAPPER"] = { "NILL" },
	["SNAPPER"] = { "NILL" },
	["RAZOR"] = { "NILL" },
	["SHADOWBEAST"] = { "NILL" },
	["MINECRAWLER"] = { "NILL" },
	["FIREWARAN"] = { "NILL"  },
	["YGIANT_RAT"] = { "NILL" },
	["GIANT_RAT"] = { "NILL" },
	["SWAMPSHARK"] = { "NILL" },
	["DRAGON_SWAMP"] = { "ITAT_DRAGONBLOOD" },
	["DRAGON_STONE"] = { "ITAT_DRAGONBLOOD" },
	["DRAGON_ICE"] = { "ITAT_DRAGONBLOOD" },
	["DRAGON_FIRE"] = { "ITAT_DRAGONBLOOD" },
	["DRAGON_UNDEAD"] = { "NILL" },
	["FIREGOLEM"] = { "NILL" },
	["ICEGOLEM"] = { "NILL" },
	["STONEGOLEM"] = { "NILL" },
	["KEILER"] = { "NILL" },
	["SKELETON"] = { "NILL" },
};
 
local Monster_Drop_Science_Chence_Krew = {
    ["PC_HERO"] = { 0 },
	["ORCWARRIOR_HARAD"] = { 0 },
	["SWAMPSHARK"] = { 0 },
	["MINECRAWLERWARRIOR"] = { 0 },
	["ICEWOLF"] = { 0 },
	["CUTTHROAT"] = { 0 },
	["PIRATE"] = { 0 },
	["TROLL"] = { 0 },
	["BLACKWOLF"] = { 0 },
	["GOBBO_WARRIOR"] = { 0 },
	["GOBBO_GREEN"] = { 0 },
	["LESSER_SKELETON"] = { 0 },
	["GOBBO_SKELETON"] = { 0 },
    ["WOLF"] = { 0 },
    ["YWOLF"] = { 0 },
    ["OLD_WOLF"] = { 0 },
    ["BANDIT"] = { 0 },
    ["SCAVENGER"] = { 0 },
    ["YSCAVENGER"] = { 0 },
    ["OLD_SCAVENGER"] = { 0 },
    ["TROLL_BLACK"] = { 0 },
    ["WARAN"] = { 0 },
    ["LURKER"] = { 0 },
    ["WARG"] = { 0 },
    ["MOLERAT"] = { 0 },
    ["ORCBITER"] = { 0 },
    ["DRAGONSNAPPER"] = { 0 },
    ["SNAPPER"] = { 0 },
    ["RAZOR"] = { 0 },
    ["SHADOWBEAST"] = { 0 },
    ["MINECRAWLER"] = { 0 },
    ["FIREWARAN"] = { 0  },
    ["YGIANT_RAT"] = { 0 },
    ["GIANT_RAT"] = { 0 },
    ["SWAMPSHARK"] = { 0 },
    ["DRAGON_SWAMP"] = { 4 },
    ["DRAGON_STONE"] = { 4 },
    ["DRAGON_ICE"] = { 4 },
    ["DRAGON_FIRE"] = { 8 },
    ["DRAGON_UNDEAD"] = { 0 },
    ["FIREGOLEM"] = { 0 },
    ["ICEGOLEM"] = { 0 },
    ["STONEGOLEM"] = { 0 },
    ["KEILER"] = { 0 },
    ["SKELETON"] = { 0 },
};

local Monster_Drop_Science_Luski = {
	["PC_HERO"] = { "NILL" },
	["ORCWARRIOR_HARAD"] = { "NILL" },
	["SWAMPSHARK"] = { "NILL" },
	["MINECRAWLERWARRIOR"] = { "NILL" },
	["ICEWOLF"] = { "NILL" },
	["CUTTHROAT"] = { "NILL" },
	["PIRATE"] = { "NILL" },
	["TROLL"] = { "NILL" },
	["BLACKWOLF"] = { "NILL" },
	["GOBBO_WARRIOR"] = { "NILL" },
	["GOBBO_GREEN"] = { "NILL" },
	["LESSER_SKELETON"] = { "NILL" },
	["GOBBO_SKELETON"] = { "NILL" },
	["WOLF"] = { "NILL" },
	["YWOLF"] = { "NILL" },
	["OLD_WOLF"] = { "NILL" },
	["BANDIT"] = { "NILL" },
	["SCAVENGER"] = { "NILL" },
	["YSCAVENGER"] = { "NILL" },
	["OLD_SCAVENGER"] = { "NILL" },
	["TROLL_BLACK"] = { "NILL" },
	["WARAN"] = { "NILL" },
	["LURKER"] = { "NILL" },
	["WARG"] = { "NILL" },
	["MOLERAT"] = { "NILL" },
	["ORCBITER"] = { "NILL" },
	["DRAGONSNAPPER"] = { "NILL" },
	["SNAPPER"] = { "NILL" },
	["RAZOR"] = { "NILL" },
	["SHADOWBEAST"] = { "NILL" },
	["MINECRAWLER"] = { "NILL" },
	["FIREWARAN"] = { "NILL"  },
	["YGIANT_RAT"] = { "NILL" },
	["GIANT_RAT"] = { "NILL" },
	["SWAMPSHARK"] = { "NILL" },
	["DRAGON_SWAMP"] = { "ITAT_DRAGONSCALE" },
	["DRAGON_STONE"] = { "ITAT_DRAGONSCALE"  },
	["DRAGON_ICE"] = { "ITAT_DRAGONSCALE"  },
	["DRAGON_FIRE"] = { "ITAT_DRAGONSCALE"  },
	["DRAGON_UNDEAD"] = { "NILL" },
	["FIREGOLEM"] = { "NILL" },
	["ICEGOLEM"] = { "NILL" },
	["STONEGOLEM"] = { "NILL" },
	["KEILER"] = { "NILL" },
	["SKELETON"] = { "NILL" },
};
 
local Monster_Drop_Science_Chence_Luski = {
    ["PC_HERO"] = { 0 },
	["ORCWARRIOR_HARAD"] = { 0 },
	["SWAMPSHARK"] = { 0 },
	["MINECRAWLERWARRIOR"] = { 0 },
	["ICEWOLF"] = { 0 },
	["CUTTHROAT"] = { 0 },
	["PIRATE"] = { 0 },
	["TROLL"] = { 0 },
	["BLACKWOLF"] = { 0 },
	["GOBBO_WARRIOR"] = { 0 },
	["GOBBO_GREEN"] = { 0 },
	["LESSER_SKELETON"] = { 0 },
	["GOBBO_SKELETON"] = { 0 },
    ["WOLF"] = { 0 },
    ["YWOLF"] = { 0 },
    ["OLD_WOLF"] = { 0 },
    ["BANDIT"] = { 0 },
    ["SCAVENGER"] = { 0 },
    ["YSCAVENGER"] = { 0 },
    ["OLD_SCAVENGER"] = { 0 },
    ["TROLL_BLACK"] = { 0 },
    ["WARAN"] = { 0 },
    ["LURKER"] = { 0 },
    ["WARG"] = { 0 },
    ["MOLERAT"] = { 0 },
    ["ORCBITER"] = { 0 },
    ["DRAGONSNAPPER"] = { 0 },
    ["SNAPPER"] = { 0 },
    ["RAZOR"] = { 0 },
    ["SHADOWBEAST"] = { 0 },
    ["MINECRAWLER"] = { 0 },
    ["FIREWARAN"] = { 0  },
    ["YGIANT_RAT"] = { 0 },
    ["GIANT_RAT"] = { 0 },
    ["SWAMPSHARK"] = { 0 },
    ["DRAGON_SWAMP"] = { 3 },
    ["DRAGON_STONE"] = { 3 },
    ["DRAGON_ICE"] = { 3 },
    ["DRAGON_FIRE"] = { 10 },
    ["DRAGON_UNDEAD"] = { 0 },
    ["FIREGOLEM"] = { 0 },
    ["ICEGOLEM"] = { 0 },
    ["STONEGOLEM"] = { 0 },
    ["KEILER"] = { 0 },
    ["SKELETON"] = { 0 },
};

local Monster_Drop_Science_Kosci = {
	["PC_HERO"] = { "NILL" },
	["ORCWARRIOR_HARAD"] = { "NILL" },
	["SWAMPSHARK"] = { "NILL" },
	["MINECRAWLERWARRIOR"] = { "NILL" },
	["ICEWOLF"] = { "NILL" },
	["CUTTHROAT"] = { "NILL" },
	["PIRATE"] = { "NILL" },
	["TROLL"] = { "NILL" },
	["BLACKWOLF"] = { "NILL" },
	["GOBBO_WARRIOR"] = { "NILL" },
	["GOBBO_GREEN"] = { "NILL" },
	["LESSER_SKELETON"] = { "ITAT_SKELETONBONE" },
	["GOBBO_SKELETON"] = { "ITAT_SKELETONBONE" },
	["WOLF"] = { "NILL" },
	["YWOLF"] = { "NILL" },
	["OLD_WOLF"] = { "NILL" },
	["BANDIT"] = { "NILL" },
	["SCAVENGER"] = { "NILL" },
	["YSCAVENGER"] = { "NILL" },
	["OLD_SCAVENGER"] = { "NILL" },
	["TROLL_BLACK"] = { "NILL" },
	["WARAN"] = { "NILL" },
	["LURKER"] = { "NILL" },
	["WARG"] = { "NILL" },
	["MOLERAT"] = { "NILL" },
	["ORCBITER"] = { "NILL" },
	["DRAGONSNAPPER"] = { "NILL" },
	["SNAPPER"] = { "NILL" },
	["RAZOR"] = { "NILL" },
	["SHADOWBEAST"] = { "NILL" },
	["MINECRAWLER"] = { "NILL" },
	["FIREWARAN"] = { "NILL" },
	["YGIANT_RAT"] = { "NILL" },
	["GIANT_RAT"] = { "NILL" },
	["SWAMPSHARK"] = { "NILL" },
	["DRAGON_SWAMP"] = { "NILL" },
	["DRAGON_STONE"] = { "NILL" },
	["DRAGON_ICE"] = { "NILL" },
	["DRAGON_FIRE"] = { "NILL" },
	["DRAGON_UNDEAD"] = { "NILL" },
	["FIREGOLEM"] = { "NILL" },
	["ICEGOLEM"] = { "NILL" },
	["STONEGOLEM"] = { "NILL" },
	["KEILER"] = { "NILL" },
	["SKELETON"] = { "ITAT_SKELETONBONE" },
};

local Monster_Drop_Science_Chence_Kosci = {
	["PC_HERO"] = { 0 },
	["ORCWARRIOR_HARAD"] = { 0 },
	["SWAMPSHARK"] = { 0 },
	["MINECRAWLERWARRIOR"] = { 0 },
	["ICEWOLF"] = { 0 },
	["CUTTHROAT"] = { 0 },
	["PIRATE"] = { 0 },
	["TROLL"] = { 0 },
	["BLACKWOLF"] = { 0 },
	["GOBBO_WARRIOR"] = { 0 },
	["GOBBO_GREEN"] = { 5 },
	["LESSER_SKELETON"] = { 6 },
	["GOBBO_SKELETON"] = { 0 },
    ["WOLF"] = { 0 },
    ["YWOLF"] = { 0 },
    ["OLD_WOLF"] = { 0 },
    ["BANDIT"] = { 0 },
    ["SCAVENGER"] = { 0 },
    ["YSCAVENGER"] = { 0 },
    ["OLD_SCAVENGER"] = { 0 },
    ["TROLL_BLACK"] = { 0 },
    ["WARAN"] = { 0 },
    ["LURKER"] = { 0 },
    ["WARG"] = { 0 },
    ["MOLERAT"] = { 0 },
    ["ORCBITER"] = { 0 },
    ["DRAGONSNAPPER"] = { 0 },
    ["SNAPPER"] = { 0 },
    ["RAZOR"] = { 0 },
    ["SHADOWBEAST"] = { 0 },
    ["MINECRAWLER"] = { 0 },
    ["FIREWARAN"] = { 0  },
	["YGIANT_RAT"] = { 0 },
    ["GIANT_RAT"] = { 0 },
    ["SWAMPSHARK"] = { 0 },
    ["DRAGON_SWAMP"] = { 0 },
    ["DRAGON_STONE"] = { 0 },
    ["DRAGON_ICE"] = { 0 },
    ["DRAGON_FIRE"] = { 0 },
    ["DRAGON_UNDEAD"] = { 0 },
    ["FIREGOLEM"] = { 0 },
    ["ICEGOLEM"] = { 0 },
    ["STONEGOLEM"] = { 0 },
    ["KEILER"] = { 0 },
    ["SKELETON"] = { 7 },
};

local Monster_Drop_Science_Glowy = {
	["PC_HERO"] = { "NILL" },
	["ORCWARRIOR_HARAD"] = { "NILL" },
	["SWAMPSHARK"] = { "NILL" },
	["MINECRAWLERWARRIOR"] = { "NILL" },
	["ICEWOLF"] = { "NILL" },
	["CUTTHROAT"] = { "NILL" },
	["PIRATE"] = { "NILL" },
	["TROLL"] = { "NILL" },
	["BLACKWOLF"] = { "NILL" },
	["GOBBO_WARRIOR"] = { "NILL" },
	["GOBBO_GREEN"] = { "NILL" },
	["LESSER_SKELETON"] = { "ITMI_SKULL" },
	["GOBBO_SKELETON"] = { "NILL" },
	["WOLF"] = { "NILL" },
	["YWOLF"] = { "NILL" },
	["OLD_WOLF"] = { "NILL" },
	["BANDIT"] = { "NILL" },
	["SCAVENGER"] = { "NILL" },
	["YSCAVENGER"] = { "NILL" },
	["OLD_SCAVENGER"] = { "NILL" },
	["TROLL_BLACK"] = { "NILL" },
	["WARAN"] = { "NILL" },
	["LURKER"] = { "NILL" },
	["WARG"] = { "NILL" },
	["MOLERAT"] = { "NILL" },
	["ORCBITER"] = { "NILL" },
	["DRAGONSNAPPER"] = { "NILL" },
	["SNAPPER"] = { "NILL" },
	["RAZOR"] = { "NILL" },
	["SHADOWBEAST"] = { "NILL" },
	["MINECRAWLER"] = { "NILL" },
	["FIREWARAN"] = { "NILL" },
	["YGIANT_RAT"] = { "NILL" },
	["GIANT_RAT"] = { "NILL" },
	["SWAMPSHARK"] = { "NILL" },
	["DRAGON_SWAMP"] = { "NILL" },
	["DRAGON_STONE"] = { "NILL" },
	["DRAGON_ICE"] = { "NILL" },
	["DRAGON_FIRE"] = { "NILL" },
	["DRAGON_UNDEAD"] = { "NILL" },
	["FIREGOLEM"] = { "NILL" },
	["ICEGOLEM"] = { "NILL" },
	["STONEGOLEM"] = { "NILL" },
	["KEILER"] = { "NILL" },
	["SKELETON"] = { "ITMI_SKULL" },
};

local Monster_Drop_Science_Chence_Glowy = {
	["PC_HERO"] = { 0 },
	["ORCWARRIOR_HARAD"] = { 0 },
	["SWAMPSHARK"] = { 0 },
	["MINECRAWLERWARRIOR"] = { 0 },
	["ICEWOLF"] = { 0 },
	["CUTTHROAT"] = { 0 },
	["PIRATE"] = { 0 },
	["TROLL"] = { 0 },
	["BLACKWOLF"] = { 0 },
	["GOBBO_WARRIOR"] = { 0 },
	["GOBBO_GREEN"] = { 0 },
	["LESSER_SKELETON"] = { 7 },
	["GOBBO_SKELETON"] = { 0 },
    ["WOLF"] = { 0 },
    ["YWOLF"] = { 0 },
    ["OLD_WOLF"] = { 0 },
    ["BANDIT"] = { 0 },
    ["SCAVENGER"] = { 0 },
    ["YSCAVENGER"] = { 0 },
    ["OLD_SCAVENGER"] = { 0 },
    ["TROLL_BLACK"] = { 0 },
    ["WARAN"] = { 0 },
    ["LURKER"] = { 0 },
    ["WARG"] = { 0 },
    ["MOLERAT"] = { 0 },
    ["ORCBITER"] = { 0 },
    ["DRAGONSNAPPER"] = { 0 },
    ["SNAPPER"] = { 0 },
    ["RAZOR"] = { 0 },
    ["SHADOWBEAST"] = { 0 },
    ["MINECRAWLER"] = { 0 },
    ["FIREWARAN"] = { 0  },
	["YGIANT_RAT"] = { 0 },
    ["GIANT_RAT"] = { 0 },
    ["SWAMPSHARK"] = { 0 },
    ["DRAGON_SWAMP"] = { 0 },
    ["DRAGON_STONE"] = { 0 },
    ["DRAGON_ICE"] = { 0 },
    ["DRAGON_FIRE"] = { 0 },
    ["DRAGON_UNDEAD"] = { 0 },
    ["FIREGOLEM"] = { 0 },
    ["ICEGOLEM"] = { 0 },
    ["STONEGOLEM"] = { 0 },
    ["KEILER"] = { 0 },
    ["SKELETON"] = { 7 },
};

-------------------------------
-- Monster Instance Imposed
-------------------------------

local Monster_Inst = {
	{instance_imposed = "OLD_WOLF", instance_monster = "WOLF" },
	{instance_imposed = "BANDIT", instance_monster = "PC_HERO" },
	{instance_imposed = "OLD_SCAVENGER", instance_monster = "SCAVENGER" },
	{instance_imposed = "YSCAVENGER", instance_monster = "SCAVENGER" },
	{instance_imposed = "CUTTHROAT", instance_monster = "PC_HERO" },
	{instance_imposed = "PIRATE", instance_monster = "PC_HERO" },
};

----------------------------------------

local Player = {};

function CreateMonsterPlayer(playerid)
	
	local Player = {};
	Player.Pazury = 0;
	Player.Zuwaczki = 0;
	Player.Plyty = 0;
	Player.Skora = 0;
	Player.Kly = 0;
	Player.Rog = 0;
	Player.Serca = 0;
	Player.Jezyki = 0;
	Player.Krew = 0;
	Player.Luski = 0;
	Player.Kosci = 0;
	Player.Glowy = 0;
	
	return Player;

end

function Monster_OnPlayerConnect(playerid)
	
	if IsNPC(playerid) ~= 1 then
	
		Player[playerid] = CreateMonsterPlayer(playerid);
		Lvl_OnPlayerConnect(playerid);
		Hunt_OnPlayerConnect(playerid);
		
	end

end

function GetPlayerPazury( playerid )

	return Player[playerid].Pazury;

end

function GetPlayerZuwaczki( playerid )

	return Player[playerid].Zuwaczki;

end

function GetPlayerPlyty( playerid )

	return Player[playerid].Plyty;

end

function GetPlayerSkora( playerid )

	return Player[playerid].Skora;

end

function GetPlayerKly( playerid )

	return Player[playerid].Kly;

end

function GetPlayerRog( playerid )

	return Player[playerid].Rog;

end

function GetPlayerSerca( playerid )

	return Player[playerid].Serca;

end

function GetPlayerJezyki( playerid )

	return Player[playerid].Jezyki;

end

function GetPlayerKrew( playerid )

	return Player[playerid].Krew;

end

function GetPlayerLuski( playerid )

	return Player[playerid].Luski;

end

function GetPlayerKosci( playerid )

	return Player[playerid].Kosci;

end

function GetPlayerGlowy( playerid )

	return Player[playerid].Glowy;

end

function SetPlayerPazury( playerid, set )

	Player[playerid].Pazury = set;

end

function SetPlayerZuwaczki( playerid, set )

	Player[playerid].Zuwaczki = set;

end

function SetPlayerPlyty( playerid, set )

	Player[playerid].Plyty = set;

end

function SetPlayerSkora( playerid, set )

	Player[playerid].Skora = set;

end

function SetPlayerKly( playerid, set )

	Player[playerid].Kly = set;

end

function SetPlayerRog( playerid, set )

	Player[playerid].Rog = set;

end

function SetPlayerSerca( playerid, set )

	Player[playerid].Serca = set;

end

function SetPlayerJezyki( playerid, set )

	Player[playerid].Jezyki = set;

end

function SetPlayerKrew( playerid, set )

	Player[playerid].Krew = set;

end

function SetPlayerLuski( playerid, set )

	Player[playerid].Luski = set;

end

function SetPlayerKosci( playerid, set )

	Player[playerid].Kosci = set;

end

function SetPlayerGlowy( playerid, set )

	Player[playerid].Glowy = set;

end

function SpawnMonster(name_monster, instance_monster, amount_monster, x, y, z, ai, armor, weapon, world)

	for i = 0, amount_monster - 1 do
		
		local spawn = CreateNPC(name_monster);
		
		if spawn ~= -1 then
			
			Monster_Instance[spawn] = instance_monster;
			Monster_Respawn_Time[spawn] = 0;
			Monster_Kill[spawn] = 0;
			SpawnPlayer(spawn);
			SetPlayerWorld(spawn, world, "START");
			SetPlayerInstance(spawn, GetMonsterInstance(instance_monster));
			SetPlayerMaxHealth(spawn, Monster[instance_monster].hp);
			SetPlayerHealth(spawn, Monster[instance_monster].hp);
			SetPlayerStrength(spawn ,Monster[instance_monster].str);
			Monster_X[spawn] = x;
			Monster_Y[spawn] = y;
			Monster_Z[spawn] = z;
			SetPlayerPos(spawn, x + random(200+100), y + 200, z + random(200+100));
			SetPlayerAngle(spawn ,random(361));
			
			if ai == Fight_1H or ai == Fight_2H then
				
				if armor ~= "NULL" then
				
					EquipArmor(spawn, armor);
					
				end
				
				if weapon ~= "NULL" then
				
					EquipMeleeWeapon(spawn, weapon);
					
				end
				
				SetPlayerSkillWeapon(spawn, SKILL_1H, Monster[instance_monster]._h)
				SetPlayerSkillWeapon(spawn, SKILL_2H, Monster[instance_monster]._h)
				
			end
			
			Monster_AI[spawn] = ai;
			MaxMonster = MaxMonster + 1;
			
			
		else
			
			print("Can't create Monster !");
			
		end
		
	end
	
end

function GetMonsterInstanceImpossed( monsterid )

	return Monster_Instance[monsterid];

end

function GetMonsterInstance(instance_monster)

	if instance_monster and type ( instance_monster ) == "string" then
		
		for imposed, instance in ipairs( Monster_Inst ) do
		
			if string.upper(instance_monster) == instance.instance_imposed then
				
				return instance.instance_monster;
				
			end
			
		end
		
		return instance_monster;
		
	else
		return false;
	end

end


function GetMonsterExperience(monsterid)

	if IsNPC(monsterid) == 1 then

		if monsterid and type ( monsterid ) == "number" then
			
			Monster_Dead[monsterid] = true;
			return Monster[Monster_Instance[monsterid]].mob_exp;

		else
		
			return false;
			
		end
	
	end
	
end

function GivePlayerExp(playerid, monsterid)
	
	
	if monsterid ~= -1 then
	
		if IsNPC(monsterid) == 1 then
			--SetHPs(playerid);
		
			if GetPlayerParty(playerid) == true then
			
				local PlayerInParty = 0;
				
				for i = 0, GetPartyAmount(playerid) - 1 do
				
					if GetPlayerPartyID(playerid, i) == playerid or GetDistancePlayers(playerid, GetPlayerPartyID(playerid, i)) <= 2000 then
						
						if IsDead(GetPlayerPartyID(playerid, i)) == 0 then
						
							PlayerInParty = PlayerInParty + 1;
							
						end
						
					end	
					
				end
			
				for i = 0, GetPartyAmount(playerid) - 1 do
				
					if PlayerInParty == 1 then
					
						GameTextForPlayer(playerid, 3650, 3800, "Îïûò +"..(GetMonsterExperience(monsterid)*((BonusExp/100)+1)).."", "Font_Old_10_White_Hi.TGA", 255, 255, 255, 1500);
						SetExp(playerid, GetExp(playerid) + (GetMonsterExperience(monsterid)*((BonusExp/100)+1)));
						SetPlayerExperience(playerid, GetExp(playerid));
						
						HuntingMonster(playerid, monsterid);
						GetPlayerNextLevel(playerid, GetExp(playerid));
						
						break;
				
					elseif GetPlayerPartyID(playerid, i) == playerid or GetDistancePlayers(playerid, GetPlayerPartyID(playerid, i)) <= 2000 then
						
						if IsDead(GetPlayerPartyID(playerid, i)) == 0 then
						
							GameTextForPlayer(GetPlayerPartyID(playerid, i), 3650, 3800, "Îïûò +"..((math.ceil((GetMonsterExperience(monsterid)/PlayerInParty)*GetPartyBonusExp(PlayerInParty)))*((BonusExp/100)+1)).."", "Font_Old_10_White_Hi.TGA", 255, 255, 255, 1500);
							SetExp(GetPlayerPartyID(playerid, i), GetExp(GetPlayerPartyID(playerid, i)) + (math.ceil((GetMonsterExperience(monsterid)/PlayerInParty)*GetPartyBonusExp(PlayerInParty))*((BonusExp/100)+1)));
							SetPlayerExperience(GetPlayerPartyID(playerid, i), GetExp(GetPlayerPartyID(playerid, i)));
							
							HuntingMonster(GetPlayerPartyID(playerid, i), monsterid);
							GetPlayerNextLevel(GetPlayerPartyID(playerid, i), GetExp(GetPlayerPartyID(playerid, i)));
							
						end
									
					end
					
				end
				
			else
				
				GameTextForPlayer(playerid, 3650, 3800, "Îïûò +"..(GetMonsterExperience(monsterid)*((BonusExp/100)+1)).."", "Font_Old_10_White_Hi.TGA", 255, 255, 255, 1500);
				SetExp(playerid, GetExp(playerid) + (GetMonsterExperience(monsterid)*((BonusExp/100)+1)));
				SetPlayerExperience(playerid, GetExp(playerid));
				
				HuntingMonster(playerid, monsterid);
				GetPlayerNextLevel(playerid, GetExp(playerid));
				
			end
			
			RandomDrop(Monster_Instance[monsterid], playerid);
			
		else
		
			if IsNPC(playerid) == 1 then
			
				if Monster_AI[playerid] == Animal then
				
					Monster_Kill[playerid] = 200;		
					PlayAnimation(playerid, "S_EAT");
					
				end
			
			end
			
		end
		
	end
	
end

function GetDropItem(dropid, monster_instance)
	
	for key, item in ipairs( Monster_Drop[monster_instance] ) do
		
		if dropid == key then
		
			return item;
		
		end
		
	end

end

function GetDropItemChence(dropid, monster_instance)
	
	for key, chence in ipairs( Monster_Drop_Chance[monster_instance] ) do
		
		if dropid == key then
		
			return chence;
		
		end
		
	end

end

--Pazury

function GetDropItemScience_Pazury(dropid, monster_instance)
	
	for key, science_item in ipairs( Monster_Drop_Science_Pazury[monster_instance] ) do
		
		if dropid == key then
		
			return science_item;
		
		end
		
	end

end

function GetDropItemScienceChence_Pazury(dropid, monster_instance)
	
	for key, science_chence in ipairs( Monster_Drop_Science_Chence_Pazury[monster_instance] ) do
		
		if dropid == key then
		
			return science_chence;
		
		end
		
	end

end

--Zuwaczki

function GetDropItemScience_Zuwaczki(dropid, monster_instance)
	
	for key, science_item in ipairs( Monster_Drop_Science_Zuwaczki[monster_instance] ) do
		
		if dropid == key then
		
			return science_item;
		
		end
		
	end

end

function GetDropItemScienceChence_Zuwaczki(dropid, monster_instance)
	
	for key, science_chence in ipairs( Monster_Drop_Science_Chence_Zuwaczki[monster_instance] ) do
		
		if dropid == key then
		
			return science_chence;
		
		end
		
	end

end

--Plyty

function GetDropItemScience_Plyty(dropid, monster_instance)
	
	for key, science_item in ipairs( Monster_Drop_Science_Plyty[monster_instance] ) do
		
		if dropid == key then
		
			return science_item;
		
		end
		
	end

end

function GetDropItemScienceChence_Plyty(dropid, monster_instance)
	
	for key, science_chence in ipairs( Monster_Drop_Science_Chence_Plyty[monster_instance] ) do
		
		if dropid == key then
		
			return science_chence;
		
		end
		
	end

end

--Skora

function GetDropItemScience_Skora(dropid, monster_instance)
	
	for key, science_item in ipairs( Monster_Drop_Science_Skora[monster_instance] ) do
		
		if dropid == key then
		
			return science_item;
		
		end
		
	end

end

function GetDropItemScienceChence_Skora(dropid, monster_instance)
	
	for key, science_chence in ipairs( Monster_Drop_Science_Chence_Skora[monster_instance] ) do
		
		if dropid == key then
		
			return science_chence;
		
		end
		
	end

end

--Kly

function GetDropItemScience_Kly(dropid, monster_instance)
	
	for key, science_item in ipairs( Monster_Drop_Science_Kly[monster_instance] ) do
		
		if dropid == key then
		
			return science_item;
		
		end
		
	end

end

function GetDropItemScienceChence_Kly(dropid, monster_instance)
	
	for key, science_chence in ipairs( Monster_Drop_Science_Chence_Kly[monster_instance] ) do
		
		if dropid == key then
		
			return science_chence;
		
		end
		
	end

end

--Rog

function GetDropItemScience_Rog(dropid, monster_instance)
	
	for key, science_item in ipairs( Monster_Drop_Science_Rog[monster_instance] ) do
		
		if dropid == key then
		
			return science_item;
		
		end
		
	end

end

function GetDropItemScienceChence_Rog(dropid, monster_instance)
	
	for key, science_chence in ipairs( Monster_Drop_Science_Chence_Rog[monster_instance] ) do
		
		if dropid == key then
		
			return science_chence;
		
		end
		
	end

end

--Serca

function GetDropItemScience_Serca(dropid, monster_instance)
	
	for key, science_item in ipairs( Monster_Drop_Science_Serca[monster_instance] ) do
		
		if dropid == key then
		
			return science_item;
		
		end
		
	end

end

function GetDropItemScienceChence_Serca(dropid, monster_instance)
	
	for key, science_chence in ipairs( Monster_Drop_Science_Chence_Serca[monster_instance] ) do
		
		if dropid == key then
		
			return science_chence;
		
		end
		
	end

end

--Jezyki

function GetDropItemScience_Jezyki(dropid, monster_instance)
	
	for key, science_item in ipairs( Monster_Drop_Science_Jezyki[monster_instance] ) do
		
		if dropid == key then
		
			return science_item;
		
		end
		
	end

end

function GetDropItemScienceChence_Jezyki(dropid, monster_instance)
	
	for key, science_chence in ipairs( Monster_Drop_Science_Chence_Jezyki[monster_instance] ) do
		
		if dropid == key then
		
			return science_chence;
		
		end
		
	end

end

--Krew

function GetDropItemScience_Krew(dropid, monster_instance)
	
	for key, science_item in ipairs( Monster_Drop_Science_Krew[monster_instance] ) do
		
		if dropid == key then
		
			return science_item;
		
		end
		
	end

end

function GetDropItemScienceChence_Krew(dropid, monster_instance)
	
	for key, science_chence in ipairs( Monster_Drop_Science_Chence_Krew[monster_instance] ) do
		
		if dropid == key then
		
			return science_chence;
		
		end
		
	end

end

--Luski

function GetDropItemScience_Luski(dropid, monster_instance)
	
	for key, science_item in ipairs( Monster_Drop_Science_Luski[monster_instance] ) do
		
		if dropid == key then
		
			return science_item;
		
		end
		
	end

end

function GetDropItemScienceChence_Luski(dropid, monster_instance)
	
	for key, science_chence in ipairs( Monster_Drop_Science_Chence_Luski[monster_instance] ) do
		
		if dropid == key then
		
			return science_chence;
		
		end
		
	end

end

--Kosci

function GetDropItemScience_Kosci(dropid, monster_instance)
	
	for key, science_item in ipairs( Monster_Drop_Science_Kosci[monster_instance] ) do
		
		if dropid == key then
		
			return science_item;
		
		end
		
	end

end

function GetDropItemScienceChence_Kosci(dropid, monster_instance)
	
	for key, science_chence in ipairs( Monster_Drop_Science_Chence_Kosci[monster_instance] ) do
		
		if dropid == key then
		
			return science_chence;
		
		end
		
	end

end

--Glowy

function GetDropItemScience_Glowy(dropid, monster_instance)
	
	for key, science_item in ipairs( Monster_Drop_Science_Glowy[monster_instance] ) do
		
		if dropid == key then
		
			return science_item;
		
		end
		
	end

end

function GetDropItemScienceChence_Glowy(dropid, monster_instance)
	
	for key, science_chence in ipairs( Monster_Drop_Science_Chence_Glowy[monster_instance] ) do
		
		if dropid == key then
		
			return science_chence;
		
		end
		
	end

end

--

function GetDropItemSure(monster_instance, id)
	
	for key, sure_item in ipairs( Monster_Drop_Sure[monster_instance] ) do
		
		if key == id then
		
			return sure_item;
			
		end
		
	end

end


function RandomDrop(monster_instance, playerid)
	
	for i = 1, #Monster_Drop_Sure[monster_instance] do
		
		if GetDropItemSure(monster_instance, i) ~= "NILL" then
		
			GiveItem(playerid, GetDropItemSure(monster_instance, i), 1);
			
		end
		
	end
	
	local drop_item = random(#Monster_Drop[monster_instance]) + 1;
	local drop = random(1000) + 1;
	
	for i = 1, GetDropItemChence(drop_item, monster_instance) do
	
		if i == drop then
			
			SendPlayerMessage(playerid, 0, 255, 0, "Ïîëó÷åíî: "..GetItemName( GetDropItem(drop_item, monster_instance )));
			GiveItem(playerid, GetDropItem(drop_item, monster_instance), 1);
			break;
			
		end
	
	end
	
	if Player[playerid].Pazury == 1 then
	
		for j = 1, #Monster_Drop_Science_Pazury[monster_instance] do
		
			drop = random(10) + 1;
			
			for i = 1, GetDropItemScienceChence_Pazury(j, monster_instance) do
			
				if i == drop then
					
					if GetDropItemScience_Pazury(j, monster_instance ) ~= "NILL" then
						
						--SendPlayerMessage(playerid, 0, 255, 0, "Ïîëó÷åíî: "..GetItemName( GetDropItemScience(j, monster_instance )));
						GiveItem(playerid, GetDropItemScience_Pazury(j, monster_instance), 1);
						
					end
					
				end
			
			end
			
		end
		
	end
	
	if Player[playerid].Zuwaczki == 1 then
	
		for j = 1, #Monster_Drop_Science_Zuwaczki[monster_instance] do
		
			drop = random(10) + 1;
			
			for i = 1, GetDropItemScienceChence_Zuwaczki(j, monster_instance) do
			
				if i == drop then
					
					if GetDropItemScience_Zuwaczki(j, monster_instance ) ~= "NILL" then
						
						--SendPlayerMessage(playerid, 0, 255, 0, "Ïîëó÷åíî: "..GetItemName( GetDropItemScience(j, monster_instance )));
						GiveItem(playerid, GetDropItemScience_Zuwaczki(j, monster_instance), 1);
						
					end
					
				end
			
			end
			
		end
	
	end
	
	if Player[playerid].Plyty == 1 then
		
		for j = 1, #Monster_Drop_Science_Plyty[monster_instance] do
		
			drop = random(10) + 1;
			
			for i = 1, GetDropItemScienceChence_Plyty(j, monster_instance) do
			
				if i == drop then
					
					if GetDropItemScience_Plyty(j, monster_instance ) ~= "NILL" then
						
						--SendPlayerMessage(playerid, 0, 255, 0, "Ïîëó÷åíî: "..GetItemName( GetDropItemScience(j, monster_instance )));
						GiveItem(playerid, GetDropItemScience_Plyty(j, monster_instance), 1);
						
					end
					
				end
			
			end
			
		end
	
	end
	
	if Player[playerid].Skora == 1 then
	
		for j = 1, #Monster_Drop_Science_Skora[monster_instance] do
		
			drop = random(10) + 1;
			
			for i = 1, GetDropItemScienceChence_Skora(j, monster_instance) do
			
				if i == drop then
					
					if GetDropItemScience_Skora(j, monster_instance ) ~= "NILL" then
						
						--SendPlayerMessage(playerid, 0, 255, 0, "Ïîëó÷åíî: "..GetItemName( GetDropItemScience(j, monster_instance )));
						GiveItem(playerid, GetDropItemScience_Skora(j, monster_instance), 1);
						
					end
					
				end
			
			end
			
		end
	
	end
	
	if Player[playerid].Kly == 1 then
	
		for j = 1, #Monster_Drop_Science_Kly[monster_instance] do
		
			drop = random(10) + 1;
			
			for i = 1, GetDropItemScienceChence_Kly(j, monster_instance) do
			
				if i == drop then
					
					if GetDropItemScience_Kly(j, monster_instance ) ~= "NILL" then
						
						if monster_instance == "SNAPPER" then
						
							GiveItem(playerid, GetDropItemScience_Kly(j, monster_instance), 2);
							
						else
						
							GiveItem(playerid, GetDropItemScience_Kly(j, monster_instance), 1);
						
						end
						
					end
					
				end
			
			end
			
		end
	
	end
	
	if Player[playerid].Rog == 1 then
	
		for j = 1, #Monster_Drop_Science_Rog[monster_instance] do
		
			drop = random(10) + 1;
			
			for i = 1, GetDropItemScienceChence_Rog(j, monster_instance) do
			
				if i == drop then
					
					if GetDropItemScience_Rog(j, monster_instance ) ~= "NILL" then
						
						--SendPlayerMessage(playerid, 0, 255, 0, "Ïîëó÷åíî: "..GetItemName( GetDropItemScience(j, monster_instance )));
						GiveItem(playerid, GetDropItemScience_Rog(j, monster_instance), 1);
						
					end
					
				end
			
			end
			
		end
	
	end
	
	if Player[playerid].Serca == 1 then
	
		for j = 1, #Monster_Drop_Science_Serca[monster_instance] do
		
			drop = random(10) + 1;
			
			for i = 1, GetDropItemScienceChence_Serca(j, monster_instance) do
			
				if i == drop then
					
					if GetDropItemScience_Serca(j, monster_instance ) ~= "NILL" then
						
						--SendPlayerMessage(playerid, 0, 255, 0, "Ïîëó÷åíî: "..GetItemName( GetDropItemScience(j, monster_instance )));
						GiveItem(playerid, GetDropItemScience_Serca(j, monster_instance), 1);
						
					end
					
				end
			
			end
			
		end
	
	end
	
	if Player[playerid].Jezyki == 1 then
	
		for j = 1, #Monster_Drop_Science_Jezyki[monster_instance] do
		
			drop = random(10) + 1;
			
			for i = 1, GetDropItemScienceChence_Jezyki(j, monster_instance) do
			
				if i == drop then
					
					if GetDropItemScience_Jezyki(j, monster_instance ) ~= "NILL" then
						
						--SendPlayerMessage(playerid, 0, 255, 0, "Ïîëó÷åíî: "..GetItemName( GetDropItemScience(j, monster_instance )));
						GiveItem(playerid, GetDropItemScience_Jezyki(j, monster_instance), 1);
						
					end
					
				end
			
			end
			
		end
	
	end
	
	if Player[playerid].Krew == 1 then
	
		for j = 1, #Monster_Drop_Science_Krew[monster_instance] do
		
			drop = random(10) + 1;
			
			for i = 1, GetDropItemScienceChence_Krew(j, monster_instance) do
			
				if i == drop then
					
					if GetDropItemScience_Krew(j, monster_instance ) ~= "NILL" then
						
						--SendPlayerMessage(playerid, 0, 255, 0, "Ïîëó÷åíî: "..GetItemName( GetDropItemScience(j, monster_instance )));
						GiveItem(playerid, GetDropItemScience_Krew(j, monster_instance), 1);
						
					end
					
				end
			
			end
			
		end
	
	end
	
	if Player[playerid].Luski == 1 then
	
		for j = 1, #Monster_Drop_Science_Luski[monster_instance] do
		
			drop = random(10) + 1;
			
			for i = 1, GetDropItemScienceChence_Luski(j, monster_instance) do
			
				if i == drop then
					
					if GetDropItemScience_Luski(j, monster_instance ) ~= "NILL" then
						
						--SendPlayerMessage(playerid, 0, 255, 0, "Ïîëó÷åíî: "..GetItemName( GetDropItemScience(j, monster_instance )));
						GiveItem(playerid, GetDropItemScience_Luski(j, monster_instance), 1);
						
					end
					
				end
			
			end
			
		end
	
	end
	
	if Player[playerid].Kosci == 1 then
	
		for j = 1, #Monster_Drop_Science_Kosci[monster_instance] do
		
			drop = random(10) + 1;
			
			for i = 1, GetDropItemScienceChence_Kosci(j, monster_instance) do
			
				if i == drop then
					
					if GetDropItemScience_Kosci(j, monster_instance ) ~= "NILL" then
						
						--SendPlayerMessage(playerid, 0, 255, 0, "Ïîëó÷åíî: "..GetItemName( GetDropItemScience(j, monster_instance )));
						GiveItem(playerid, GetDropItemScience_Kosci(j, monster_instance), 1);
						
					end
					
				end
			
			end
			
		end
	
	end
	
	if Player[playerid].Glowy == 1 then
	
		for j = 1, #Monster_Drop_Science_Glowy[monster_instance] do
		
			drop = random(10) + 1;
			
			for i = 1, GetDropItemScienceChence_Glowy(j, monster_instance) do
			
				if i == drop then
					
					if GetDropItemScience_Glowy(j, monster_instance ) ~= "NILL" then
						
						--SendPlayerMessage(playerid, 0, 255, 0, "Ïîëó÷åíî: "..GetItemName( GetDropItemScience(j, monster_instance )));
						GiveItem(playerid, GetDropItemScience_Glowy(j, monster_instance), 1);
						
					end
					
				end
			
			end
			
		end
	
	end
	
end

function IsMonster(monsterid)

	if Monster_Instance[monsterid] == nil then
	
		return false;
		
	else
	
		return true;
		
	end

end

function AI_Monster_Mordan()
	
	for i = GetMaxSlots() - MaxNPC - 1, GetMaxSlots() - MonsterMordan - MaxNPC, - 1 do
		
		if Monster_Dead[i] == nil then
		
			CheckPosMobSZ(i);
		
			if Monster_Focus[i] == nil then
			
				for j = 0, GetMaxPlayers() - 1 do

					if IsPlayerConnected(j) == 1 and IsNPC(j) ~= 1 and IsDead(j) ~= 1 and IsDead(i) ~= 1 and GetDistancePlayers(i, j) <= Monster[Monster_Instance[i]].maxdist then
					
						Monster_Focus[i] = j;
						
					end
					
				end
				
			else

				if Monster_AI[i] == Animal then
				
					if IsPlayerConnected(Monster_Focus[i]) == 1 and IsDead(Monster_Focus[i]) ~= 1 and IsDead(i) ~= 1 and GetDistancePlayers(i, Monster_Focus[i]) <= Monster[Monster_Instance[i]].maxdist then
				
						SetPlayerAngle(i,GetAngleToPlayer(i,Monster_Focus[i]));
						
						if Monster_Warn[i] == nil and Monster_Stop[i] == nil then
						
							if	GetDistancePlayers(i, Monster_Focus[i]) <= Monster[Monster_Instance[i]].maxdist and GetDistancePlayers(i, Monster_Focus[i]) >= Monster[Monster_Instance[i]].warndist then
						
								PlayAnimation(i,"T_WARN");
								Monster_TimerID[i] = SetTimerEx("Warn_Monster", 3500, 0, i);
								
							else
							
								if Monster_TimerID[i] ~= nil then
									
									KillTimer(Monster_TimerID[i]);
								
								end
								
								Monster_Warn[i] = true;
								PlayAnimation(i,"S_FISTRUN");
							
							end
							
						else
							
							if Monster_Blow[i] == nil then
							
								if GetDistancePlayers(i, Monster_Focus[i]) <= Monster[Monster_Instance[i]].mindist then
									
									PlayAnimation(i,"S_FISTRUN");
									Monster_Warn[i] = nil;
									Monster_Stop[i] = true;

									if Monster_Attack[i] == nil then
										
										PlayAnimation(i, "S_FISTATTACK");
										HitPlayer(i, Monster_Focus[i]);
										Monster_Attack[i] = true;
										SetTimerEx("Attack_Monster", 1000, 0, i);
										
									end
								
								else
								
									PlayAnimation(i,"S_FISTRUNL");
									
								end
								
							else
								
								if Monster_Anim[i] == nil then
								
									PlayAnimation(i,"T_FISTPARADEJUMPB");
									Monster_Anim[i] = 1;
								
								else
								
									Monster_Anim[i] = random(2);
								
									if Monster_Anim[i] == 0 then
										
										PlayAnimation(i,"T_FISTRUNSTRAFER");
										
									elseif Monster_Anim[i] == 1 then
									
										PlayAnimation(i,"T_FISTRUNSTRAFEL");
									
									end
									
								end
							
							end
							
						
						end
						

						
					else 
					
						Monster_Focus[i] = nil;
						Monster_Stop[i] = nil;
						Monster_Warn[i] = nil;
						Monster_Blow[i] = nil;
						Monster_Anim[i] = nil;
						Monster_Attack[i] = nil;
						if Monster_TimerID[i] ~= nil then
							KillTimer(Monster_TimerID[i]);
						end
						
						if Monster_Kill[i] == 0 then
						
							PlayAnimation(i,"S_FISTRUN");
							
						else
						
							Monster_Kill[i] = Monster_Kill[i] - 1;
							
						end
							
					end
					
				elseif Monster_AI[i] == Fight_1H or Monster_AI[i] == Fight_2H then
				
					if IsPlayerConnected(Monster_Focus[i]) == 1 and IsDead(Monster_Focus[i]) ~= 1 and IsDead(i) ~= 1 and GetDistancePlayers(i, Monster_Focus[i]) <= Monster[Monster_Instance[i]].maxdist then
				
						SetPlayerAngle(i, GetAngleToPlayer(i,Monster_Focus[i]));
						
						if Monster_Warn[i] == nil and Monster_Stop[i] == nil then
							
							
							if Monster_AI[i] == Fight_1H then
							
								PlayAnimation(i, "T_1H_2_1HRUN");
								SetPlayerWeaponMode(i, WEAPON_1H);
								
							elseif Monster_AI[i] == Fight_2H then
							
								PlayAnimation(i, "T_2H_2_2HRUN");
								SetPlayerWeaponMode(i, WEAPON_2H);
								
							end			
							
							SetTimerEx("Warn_Monster", 250, 0, i);
							
						else
							
							if Monster_Blow[i] == nil then
							
								if GetDistancePlayers(i, Monster_Focus[i]) <= Monster[Monster_Instance[i]].mindist then
									
									PlayAnimation(i,"S_FISTRUN");
									Monster_Warn[i] = nil;
									Monster_Stop[i] = true;
									
									if Monster_Attack[i] == nil then
										
										Monster_Anim[i] = random(3);
										
										if Monster_AI[i] == Fight_1H then
										
											if Monster_Anim[i] == 0 then 
											
												PlayAnimation(i, "S_1HATTACK");
												
											elseif Monster_Anim[i] == 1 then

												PlayAnimation(i, "T_1HATTACKR");
											
											elseif Monster_Anim[i] == 2 then 
											
												PlayAnimation(i, "T_1HATTACKL");
											
											end
											
										elseif Monster_AI[i] == Fight_2H then
										
											if Monster_Anim[i] == 0 then 
											
												PlayAnimation(i, "S_2HATTACK");
												
											elseif Monster_Anim[i] == 1 then

												PlayAnimation(i, "T_2HATTACKR");
											
											elseif Monster_Anim[i] == 2 then 
											
												PlayAnimation(i, "T_2HATTACKL");
											
											end
											
										end
										
										Monster_Anim[i] = nil;
										
										HitPlayer(i, Monster_Focus[i]);
										Monster_Attack[i] = true;
										SetTimerEx("Attack_Monster", 1000, 0, i);
										
									end
								
								else
								
									PlayAnimation(i,"S_FISTRUNL");
									
								end
								
							else
								
								if Monster_Anim[i] == nil then
								
									PlayAnimation(i,"T_FISTPARADEJUMPB");
									Monster_Anim[i] = 1;
								
								else
								
									Monster_Anim[i] = random(2);
								
									if Monster_Anim[i] == 0 then
										
										PlayAnimation(i,"T_FISTRUNSTRAFER");
										
									elseif Monster_Anim[i] == 1 then
									
										PlayAnimation(i,"T_FISTRUNSTRAFEL");
									
									end
									
								end
							
							end
							
						
						end
						

						
					else
					
						Monster_Warn[i] = nil;
						SetPlayerWeaponMode(i, WEAPON_NONE);
						Monster_Focus[i] = nil;
						Monster_Stop[i] = nil;
						Monster_Blow[i] = nil;
						Monster_Anim[i] = nil;
						Monster_Attack[i] = nil;
						
						if Monster_TimerID[i] ~= nil then
						
							KillTimer(Monster_TimerID[i]);
							
						end
						
						PlayAnimation(i,"S_RUN");
							
							
					end
					
				end
				
			end
			
		else
		
			Dead_Monster(i);
			
		end
		
	end
	
end

function AI_Monster_GD()
	
	for i = GetMaxSlots() - MaxNPC - MonsterMordan - 1, GetMaxSlots() - MonsterMordan - MonsterGD - MaxNPC, - 1 do
		
		if Monster_Dead[i] == nil then
			
			CheckPosMobSZ(i);
		
			if Monster_Focus[i] == nil then
				
				for j = 0, GetMaxPlayers() - 1 do
					
					if IsPlayerConnected(j) == 1 and IsNPC(j) ~= 1 and IsDead(j) ~= 1 and IsDead(i) ~= 1 and GetDistancePlayers(i, j) <= Monster[Monster_Instance[i]].maxdist then
					
						Monster_Focus[i] = j;
						
					end
					
				end
				
			else

				if Monster_AI[i] == Animal then
				
					if IsPlayerConnected(Monster_Focus[i]) == 1 and IsDead(Monster_Focus[i]) ~= 1 and IsDead(i) ~= 1 and GetDistancePlayers(i, Monster_Focus[i]) <= Monster[Monster_Instance[i]].maxdist then
				
						SetPlayerAngle(i,GetAngleToPlayer(i,Monster_Focus[i]));
						
						if Monster_Warn[i] == nil and Monster_Stop[i] == nil then
						
							if	GetDistancePlayers(i, Monster_Focus[i]) <= Monster[Monster_Instance[i]].maxdist and GetDistancePlayers(i, Monster_Focus[i]) >= Monster[Monster_Instance[i]].warndist then
						
								PlayAnimation(i,"T_WARN");
								Monster_TimerID[i] = SetTimerEx("Warn_Monster", 3500, 0, i);
								
							else
							
								if Monster_TimerID[i] ~= nil then
									
									KillTimer(Monster_TimerID[i]);
								
								end
								
								Monster_Warn[i] = true;
								PlayAnimation(i,"S_FISTRUN");
							
							end
							
						else
							
							if Monster_Blow[i] == nil then
							
								if GetDistancePlayers(i, Monster_Focus[i]) <= Monster[Monster_Instance[i]].mindist then
									
									PlayAnimation(i,"S_FISTRUN");
									Monster_Warn[i] = nil;
									Monster_Stop[i] = true;
									
									if Monster_Attack[i] == nil then
										
										PlayAnimation(i, "S_FISTATTACK");
										HitPlayer(i, Monster_Focus[i]);
										Monster_Attack[i] = true;
										SetTimerEx("Attack_Monster", 1000, 0, i);
										
									end
								
								else
								
									PlayAnimation(i,"S_FISTRUNL");
									
								end
								
							else
								
								if Monster_Anim[i] == nil then
								
									PlayAnimation(i,"T_FISTPARADEJUMPB");
									Monster_Anim[i] = 1;
								
								else
								
									Monster_Anim[i] = random(2);
								
									if Monster_Anim[i] == 0 then
										
										PlayAnimation(i,"T_FISTRUNSTRAFER");
										
									elseif Monster_Anim[i] == 1 then
									
										PlayAnimation(i,"T_FISTRUNSTRAFEL");
									
									end
									
								end
							
							end
							
						
						end
						

						
					else 
					
						Monster_Focus[i] = nil;
						Monster_Stop[i] = nil;
						Monster_Warn[i] = nil;
						Monster_Blow[i] = nil;
						Monster_Anim[i] = nil;
						Monster_Attack[i] = nil;
						if Monster_TimerID[i] ~= nil then
							KillTimer(Monster_TimerID[i]);
						end
						
						if Monster_Kill[i] == 0 then
						
							PlayAnimation(i,"S_FISTRUN");
							
						else
						
							Monster_Kill[i] = Monster_Kill[i] - 1;
							
						end
							
					end
					
				elseif Monster_AI[i] == Fight_1H or Monster_AI[i] == Fight_2H then
				
					if IsPlayerConnected(Monster_Focus[i]) == 1 and IsDead(Monster_Focus[i]) ~= 1 and IsDead(i) ~= 1 and GetDistancePlayers(i, Monster_Focus[i]) <= Monster[Monster_Instance[i]].maxdist then
				
						SetPlayerAngle(i, GetAngleToPlayer(i,Monster_Focus[i]));
						
						if Monster_Warn[i] == nil and Monster_Stop[i] == nil then
							
							
							if Monster_AI[i] == Fight_1H then
							
								PlayAnimation(i, "T_1H_2_1HRUN");
								SetPlayerWeaponMode(i, WEAPON_1H);
								
							elseif Monster_AI[i] == Fight_2H then
							
								PlayAnimation(i, "T_2H_2_2HRUN");
								SetPlayerWeaponMode(i, WEAPON_2H);
								
							end			
							
							SetTimerEx("Warn_Monster", 250, 0, i);
							
						else
							
							if Monster_Blow[i] == nil then
							
								if GetDistancePlayers(i, Monster_Focus[i]) <= Monster[Monster_Instance[i]].mindist then
									
									PlayAnimation(i,"S_FISTRUN");
									Monster_Warn[i] = nil;
									Monster_Stop[i] = true;
									
									if Monster_Attack[i] == nil then
										
										Monster_Anim[i] = random(3);
										
										if Monster_AI[i] == Fight_1H then
										
											if Monster_Anim[i] == 0 then 
											
												PlayAnimation(i, "S_1HATTACK");
												
											elseif Monster_Anim[i] == 1 then

												PlayAnimation(i, "T_1HATTACKR");
											
											elseif Monster_Anim[i] == 2 then 
											
												PlayAnimation(i, "T_1HATTACKL");
											
											end
											
										elseif Monster_AI[i] == Fight_2H then
										
											if Monster_Anim[i] == 0 then 
											
												PlayAnimation(i, "S_2HATTACK");
												
											elseif Monster_Anim[i] == 1 then

												PlayAnimation(i, "T_2HATTACKR");
											
											elseif Monster_Anim[i] == 2 then 
											
												PlayAnimation(i, "T_2HATTACKL");
											
											end
											
										end
										
										Monster_Anim[i] = nil;
										
										HitPlayer(i, Monster_Focus[i]);
										Monster_Attack[i] = true;
										SetTimerEx("Attack_Monster", 1000, 0, i);
										
									end
								
								else
								
									PlayAnimation(i,"S_FISTRUNL");
									
								end
								
							else
								
								if Monster_Anim[i] == nil then
								
									PlayAnimation(i,"T_FISTPARADEJUMPB");
									Monster_Anim[i] = 1;
								
								else
								
									Monster_Anim[i] = random(2);
								
									if Monster_Anim[i] == 0 then
										
										PlayAnimation(i,"T_FISTRUNSTRAFER");
										
									elseif Monster_Anim[i] == 1 then
									
										PlayAnimation(i,"T_FISTRUNSTRAFEL");
									
									end
									
								end
							
							end
							
						
						end
						

						
					else
					
						Monster_Warn[i] = nil;
						SetPlayerWeaponMode(i, WEAPON_NONE);
						Monster_Focus[i] = nil;
						Monster_Stop[i] = nil;
						Monster_Blow[i] = nil;
						Monster_Anim[i] = nil;
						Monster_Attack[i] = nil;
						
						if Monster_TimerID[i] ~= nil then
						
							KillTimer(Monster_TimerID[i]);
							
						end
						
						PlayAnimation(i,"S_RUN");
							
					end
					
				end
				
			end
			
		else
		
			Dead_Monster(i);
			
		end
		
	end
	
end

function AI_Monster_3()
	
	for i = GetMaxSlots() - MaxNPC - MonsterMordan - MonsterGD - 1, GetMaxSlots() - MonsterMordan - MonsterGD - MonsterTimer3 - MaxNPC, - 1 do
		
		if Monster_Dead[i] == nil then
		
			CheckPosMobSZ(i);
		
			if Monster_Focus[i] == nil then
				
				for j = 0, GetMaxPlayers() - 1 do
					
					if IsPlayerConnected(j) == 1 and IsNPC(j) ~= 1 and IsDead(j) ~= 1 and IsDead(i) ~= 1 and GetDistancePlayers(i, j) <= Monster[Monster_Instance[i]].maxdist then
					
						Monster_Focus[i] = j;
						
					end
					
				end
				
			else

				if Monster_AI[i] == Animal then
				
					if IsPlayerConnected(Monster_Focus[i]) == 1 and IsDead(Monster_Focus[i]) ~= 1 and IsDead(i) ~= 1 and GetDistancePlayers(i, Monster_Focus[i]) <= Monster[Monster_Instance[i]].maxdist then
				
						SetPlayerAngle(i,GetAngleToPlayer(i,Monster_Focus[i]));
						
						if Monster_Warn[i] == nil and Monster_Stop[i] == nil then
						
							if	GetDistancePlayers(i, Monster_Focus[i]) <= Monster[Monster_Instance[i]].maxdist and GetDistancePlayers(i, Monster_Focus[i]) >= Monster[Monster_Instance[i]].warndist then
						
								PlayAnimation(i,"T_WARN");
								Monster_TimerID[i] = SetTimerEx("Warn_Monster", 3500, 0, i);
								
							else
							
								if Monster_TimerID[i] ~= nil then
									
									KillTimer(Monster_TimerID[i]);
								
								end
								
								Monster_Warn[i] = true;
								PlayAnimation(i,"S_FISTRUN");
							
							end
							
						else
							
							if Monster_Blow[i] == nil then
							
								if GetDistancePlayers(i, Monster_Focus[i]) <= Monster[Monster_Instance[i]].mindist then
									
									PlayAnimation(i,"S_FISTRUN");
									Monster_Warn[i] = nil;
									Monster_Stop[i] = true;
									
									if Monster_Attack[i] == nil then
										
										PlayAnimation(i, "S_FISTATTACK");
										HitPlayer(i, Monster_Focus[i]);
										Monster_Attack[i] = true;
										SetTimerEx("Attack_Monster", 1000, 0, i);
										
									end
								
								else
								
									PlayAnimation(i,"S_FISTRUNL");
									
								end
								
							else
								
								if Monster_Anim[i] == nil then
								
									PlayAnimation(i,"T_FISTPARADEJUMPB");
									Monster_Anim[i] = 1;
								
								else
								
									Monster_Anim[i] = random(2);
								
									if Monster_Anim[i] == 0 then
										
										PlayAnimation(i,"T_FISTRUNSTRAFER");
										
									elseif Monster_Anim[i] == 1 then
									
										PlayAnimation(i,"T_FISTRUNSTRAFEL");
									
									end
									
								end
							
							end
							
						
						end
						

						
					else 
					
						Monster_Focus[i] = nil;
						Monster_Stop[i] = nil;
						Monster_Warn[i] = nil;
						Monster_Blow[i] = nil;
						Monster_Anim[i] = nil;
						Monster_Attack[i] = nil;
						if Monster_TimerID[i] ~= nil then
							KillTimer(Monster_TimerID[i]);
						end
						PlayAnimation(i,"S_FISTRUN");
						
						if Monster_Kill[i] == 0 then
						
							PlayAnimation(i,"S_FISTRUN");
							
						else
						
							Monster_Kill[i] = Monster_Kill[i] - 1;
							
						end
							
					end
					
				elseif Monster_AI[i] == Fight_1H or Monster_AI[i] == Fight_2H then
				
					if IsPlayerConnected(Monster_Focus[i]) == 1 and IsDead(Monster_Focus[i]) ~= 1 and IsDead(i) ~= 1 and GetDistancePlayers(i, Monster_Focus[i]) <= Monster[Monster_Instance[i]].maxdist then
				
						SetPlayerAngle(i, GetAngleToPlayer(i,Monster_Focus[i]));
						
						if Monster_Warn[i] == nil and Monster_Stop[i] == nil then
							
							
							if Monster_AI[i] == Fight_1H then
							
								PlayAnimation(i, "T_1H_2_1HRUN");
								SetPlayerWeaponMode(i, WEAPON_1H);
								
							elseif Monster_AI[i] == Fight_2H then
							
								PlayAnimation(i, "T_2H_2_2HRUN");
								SetPlayerWeaponMode(i, WEAPON_2H);
								
							end			
							
							SetTimerEx("Warn_Monster", 250, 0, i);
							
						else
							
							if Monster_Blow[i] == nil then
							
								if GetDistancePlayers(i, Monster_Focus[i]) <= Monster[Monster_Instance[i]].mindist then
									
									PlayAnimation(i,"S_FISTRUN");
									Monster_Warn[i] = nil;
									Monster_Stop[i] = true;
									
									if Monster_Attack[i] == nil then
										
										Monster_Anim[i] = random(3);
										
										if Monster_AI[i] == Fight_1H then
										
											if Monster_Anim[i] == 0 then 
											
												PlayAnimation(i, "S_1HATTACK");
												
											elseif Monster_Anim[i] == 1 then

												PlayAnimation(i, "T_1HATTACKR");
											
											elseif Monster_Anim[i] == 2 then 
											
												PlayAnimation(i, "T_1HATTACKL");
											
											end
											
										elseif Monster_AI[i] == Fight_2H then
										
											if Monster_Anim[i] == 0 then 
											
												PlayAnimation(i, "S_2HATTACK");
												
											elseif Monster_Anim[i] == 1 then

												PlayAnimation(i, "T_2HATTACKR");
											
											elseif Monster_Anim[i] == 2 then 
											
												PlayAnimation(i, "T_2HATTACKL");
											
											end
											
										end
										
										Monster_Anim[i] = nil;
										
										HitPlayer(i, Monster_Focus[i]);
										Monster_Attack[i] = true;
										SetTimerEx("Attack_Monster", 1000, 0, i);
										
									end
								
								else
								
									PlayAnimation(i,"S_FISTRUNL");
									
								end
								
							else
								
								if Monster_Anim[i] == nil then
								
									PlayAnimation(i,"T_FISTPARADEJUMPB");
									Monster_Anim[i] = 1;
								
								else
								
									Monster_Anim[i] = random(2);
								
									if Monster_Anim[i] == 0 then
										
										PlayAnimation(i,"T_FISTRUNSTRAFER");
										
									elseif Monster_Anim[i] == 1 then
									
										PlayAnimation(i,"T_FISTRUNSTRAFEL");
									
									end
									
								end
							
							end
							
						
						end
						

						
					else
					
						Monster_Warn[i] = nil;
						SetPlayerWeaponMode(i, WEAPON_NONE);
						Monster_Focus[i] = nil;
						Monster_Stop[i] = nil;
						Monster_Blow[i] = nil;
						Monster_Anim[i] = nil;
						Monster_Attack[i] = nil;
						
						if Monster_TimerID[i] ~= nil then
						
							KillTimer(Monster_TimerID[i]);
							
						end
						
						PlayAnimation(i,"S_RUN");
							
					end
					
				end
				
			end
			
		else
		
			Dead_Monster(i);
			
		end
		
	end
	
end

function Warn_Monster(monsterid)
	
	if Monster_Focus[monsterid] ~= nil and IsPlayerConnected(Monster_Focus[monsterid]) and GetDistancePlayers(monsterid, Monster_Focus[monsterid]) <= Monster[Monster_Instance[monsterid]].maxdist then
	
		Monster_Warn[monsterid] = true;
		
	end

end

function HitMonster(playerid, monsterid)
	
	if Monster_Focus[monsterid] ~= nil and IsPlayerConnected(Monster_Focus[monsterid]) == 1 and GetDistancePlayers(monsterid, Monster_Focus[monsterid]) <= Monster[Monster_Instance[monsterid]].maxdist then
	
		Monster_Focus[monsterid] = playerid; -- za ka¿dym hitem przypisuje
		
		if Monster_Blow[monsterid] == nil then

			Monster_Blow[monsterid] = true;
			Monster_TimerID[monsterid] = SetTimerEx("Blow_Monster", random(1000)+1000, 0, monsterid);
			
		else
			
			Monster_Blow[monsterid] = nil;
			Monster_Anim[monsterid] = nil;
			
		end
		
	end
	
end

function Blow_Monster(monsterid)

	Monster_Blow[monsterid] = nil;
	Monster_Anim[monsterid] = nil;

end

function Attack_Monster(monsterid)

	Monster_Attack[monsterid] = nil;		

end

function Dead_Monster(monsterid)

	if IsNPC(monsterid) == 1 then
		
		SetPlayerPos(monsterid, 32476.9179687, -1131.6876220703, 49194.203125); -- Miejsce po dzedzie.
		
	end

end

function Respawn_Monster()
	
	for i = GetMaxSlots() - MaxNPC - 1, GetMaxSlots() - MaxMonster - MaxNPC, - 1 do
	
		if Monster_Dead[i] == true then
		
			Monster_Respawn_Time[i] = Monster_Respawn_Time[i] + 1;
			
			if Monster_Respawn_Time[i] == Monster[Monster_Instance[i]].respawn then
				
				ResetDeadMonster(i);
				
			end
		
		end
	
	end

end

function ResetDeadMonster(monsterid)

	if IsNPC(monsterid) == 1 then
	
		Monster_Focus[monsterid] = nil;
		Monster_Stop[monsterid] = nil;
		Monster_Warn[monsterid] = nil;
		Monster_Blow[monsterid] = nil;
		Monster_Anim[monsterid] = nil;
		Monster_Attack[monsterid] = nil;
		
		if Monster_TimerID[monsterid] ~= nil then
		
			KillTimer(Monster_TimerID[monsterid]);
			
		end
		
		if Monster_Dead[monsterid] == true then
		
			SetPlayerMaxHealth(monsterid, Monster[Monster_Instance[monsterid]].hp);
			SetPlayerHealth(monsterid, Monster[Monster_Instance[monsterid]].hp);
			SetPlayerStrength(monsterid ,Monster[Monster_Instance[monsterid]].str);
			SetPlayerPos(monsterid, Monster_X[monsterid] + random(200+100), Monster_Y[monsterid] + 200, Monster_Z[monsterid] + random(200+100));
			SetPlayerAngle(monsterid ,random(361));
			
			if GetMonsterInstance(Monster_Instance[monsterid]) == "PC_HERO" then
			
				PlayAnimation(monsterid,"S_RUN");
			
			else
			
				PlayAnimation(monsterid,"S_FISTRUN");
			
			end
			
		end
		
		Monster_Respawn_Time[monsterid] = 0;
		Monster_Dead[monsterid] = nil;
		
	end

end

function CheckPosMobSZ(mobid)

	local x_SZ, z_SZ, dist_SZ = GetSZParametrs(mobid);
	local x, y, z = GetPlayerPos(mobid);
	
	if GetDistance2D(x_SZ, z_SZ, x, z) <= dist_SZ then
	
		Monster_Focus[mobid] = nil;
		Monster_Stop[mobid] = nil;
		Monster_Warn[mobid] = nil;
		Monster_Blow[mobid] = nil;
		Monster_Anim[mobid] = nil;
		Monster_Attack[mobid] = nil;
		
		SetPlayerPos(mobid, Monster_X[mobid] + random(200+100), Monster_Y[mobid] + 200, Monster_Z[mobid] + random(200+100));
		SetPlayerAngle(mobid ,random(361));
		
		PlayAnimation(mobid,"S_FISTRUN");
	
	end

end

-----------------
-- NPC Add
-----------------

local NPC = { hp = 2000, str = 300 };
local SuperInfooNPC = {};

function getSuperInfo()
	return SuperInfooNPC;
end

function AddNPC(npc_name, x, y, z, angle, equiparmor, equipmeleeweapon, equiprangedweapon, animation, sex, body, head_model, head_texture, world)
	
	if npc_name and type ( npc_name ) == "string" then
	
		local id = CreateNPC(npc_name);

		if id ~= -1 then
			
			SpawnPlayer(id);
			SetPlayerHealth(id, NPC.hp);
			SetPlayerMaxHealth(id, NPC.hp);
			SetPlayerStrength(id, NPC.str);
		
			if x and type ( x ) == "number" then
				
				if y and type ( y ) == "number" then
				
					if z and type ( z ) == "number" then
						
						SetPlayerWorld(id, world, "START")
					
						SetPlayerPos(id, x, y + 100, z);
						
						if angle and type ( angle ) == "number" then
						
							SetPlayerAngle(id, angle);
							
							if equiparmor and type ( equiparmor ) == "string" then
						
								EquipArmor(id, equiparmor);
								
								if equipmeleeweapon and type ( equipmeleeweapon ) == "string" then
							
									EquipMeleeWeapon(id, equipmeleeweapon);
									
									if equiprangedweapon and type ( equiprangedweapon ) == "string" then
								
										EquipRangedWeapon(id, equiprangedweapon);
										
										if animation and type ( animation ) == "string" then
								
											PlayAnimation(id, animation)
											
											if body and head_model and head_texture and type ( body ) == "number" and type ( head_model ) == "string" and type ( head_texture ) == "number" then
											
												SetPlayerAdditionalVisual(id, sex, body, head_model, head_texture);
												MaxNPC = MaxNPC + 1;
												table.insert( SuperInfooNPC, { npc_name, x, y, z, angle } );
												
												return id;
											
											else
												
												DestroyNPC(id);
												return false;
											
											end
											
										else
											
											DestroyNPC(id);
											return false;
										
										end
									
									else
										
										DestroyNPC(id);
										return false;
									
									end
								
								
								else
									
									DestroyNPC(id);
									return false;
								
								end
							
							else
								
								DestroyNPC(id);
								return false;
							
							end
							
						else
							
							DestroyNPC(id);
							return false;
						
						end
					
					else
					
						DestroyNPC(id);
						return false;
					
					end
				
				else
					
					DestroyNPC(id);
					return false;
			
				end
				
			else
				
				DestroyNPC(id);
				return false;
			
			end
			
		else
			
			print("Can't create npc. Name is already used !");
			return false;
			
		end
		
	else
	
		return false;
	
	end
	
end

function GetMaxNPC()

	return MaxNPC;

end
