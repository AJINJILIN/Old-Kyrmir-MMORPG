local Hunt = {
	{{name = "Молодой падальщик", instance = "YSCAVENGER", amount = 10}}, -- 0
	{{name = "Молодой волк", instance = "YWOLF", amount = 15}}, -- 1
	{{name = "Гигантская крыса", instance = "GIANT_RAT", amount = 20}}, -- 2
	{{name = "Кротокрыс", instance = "MOLERAT", amount = 15}, {name = "Молодой волк", instance = "YWOLF", amount = 20}}, -- 3
	{{name = "Кротокрыс", instance = "MOLERAT", amount = 15}, {name = "Молодой волк", instance = "YWOLF", amount = 15}, {name = "Гигантская крыса", instance = "GIANT_RAT", amount = 15}}, -- 4
	{{name = "Волк", instance = "WOLF", amount = 40}}, -- 5
	{{name = "Падальщик", instance = "SCAVENGER", amount = 25},{name = "Волк", instance = "WOLF", amount = 25}}, -- 6
	{{name = "Кабан", instance = "KEILER", amount = 35}, {name = "Падальщик", instance = "SCAVENGER", amount = 35}}, -- 7
	{{name = "Кабан", instance = "KEILER", amount = 50}, {name = "Варан", instance = "WARAN", amount = 35}}, -- 8
	{{name = "Луркер", instance = "LURKER", amount = 40}, {name = "Варан", instance = "WARAN", amount = 40}}, -- 9
	{{name = "Луркер", instance = "LURKER", amount = 45}, {name = "Варан", instance = "WARAN", amount = 45}, {name = "Гоблин", instance = "GOBBO_GREEN", amount = 25}}, -- 10
	{{name = "Гоблин", instance = "GOBBO_GREEN", amount = 40}, {name = "Воин гоблинов", instance = "GOBBO_WARRIOR", amount = 40}}, -- 11
	{{name = "Воин гоблинов", instance = "GOBBO_WARRIOR", amount = 55}, {name = "Гоблин", instance = "GOBBO_GREEN", amount = 55}, {name = "Черный волк", instance = "BLACKWOLF", amount = 10}}, -- 12
	{{name = "Черный волк", instance = "BLACKWOLF", amount = 15}, {name = "Скелет гоблина", instance = "GOBBO_SKELETON", amount = 25}}, -- 13
	{{name = "Черный волк", instance = "BLACKWOLF", amount = 20}, {name = "Скелет гоблина", instance = "GOBBO_SKELETON", amount = 40}, {name = "Снеппер", instance = "SNAPPER", amount = 20}}, -- 14
	{{name = "Снеппер", instance = "SNAPPER", amount = 30}, {name = "Краулер", instance = "MINECRAWLER", amount = 30}}, -- 15
	{{name = "Снеппер", instance = "SNAPPER", amount = 35}, {name = "Скелет гоблина", instance = "GOBBO_SKELETON", amount = 50}}, -- 16
	{{name = "Краулер", instance = "MINECRAWLER", amount = 30}, {name = "Скелет", instance = "LESSER_SKELETON", amount = 10}}, -- 17
	{{name = "Краулер", instance = "MINECRAWLER", amount = 40}, {name = "Скелет", instance = "LESSER_SKELETON", amount = 20}, {name = "Снеппер", instance = "SNAPPER", amount = 50}}, -- 18
	{{name = "Мракорис", instance = "SHADOWBEAST", amount = 1}, {name = "Скелет", instance = "LESSER_SKELETON", amount = 30}}, -- 19
	{{name = "Мракорис", instance = "SHADOWBEAST", amount = 1}, {name = "Краулер", instance = "MINECRAWLER", amount = 40}, {name = "Скелет", instance = "LESSER_SKELETON", amount = 50}}, -- 20
	{{name = "Мракорис", instance = "SHADOWBEAST", amount = 1}, {name = "Снеппер", instance = "SNAPPER", amount = 30}}, -- 21
	{{name = "Мракорис", instance = "SHADOWBEAST", amount = 2}, {name = "Скелет гоблина", instance = "GOBBO_SKELETON", amount = 40}, {name = "Снеппер", instance = "SNAPPER", amount = 40}}, -- 22
	{{name = "Мракорис", instance = "SHADOWBEAST", amount = 5}, {name = "Скелет", instance = "LESSER_SKELETON", amount = 50}, {name = "Снеппер", instance = "SNAPPER", amount = 50}}, -- 23
	{{name = "Мракорис", instance = "SHADOWBEAST", amount = 7}, {name = "Скелет", instance = "LESSER_SKELETON", amount = 50}, {name = "Скелет гоблина", instance = "GOBBO_SKELETON", amount = 40}}, -- 24
	{{name = "Мракорис", instance = "SHADOWBEAST", amount = 10}, {name = "Скелет", instance = "LESSER_SKELETON", amount = 60}, {name = "Скелет гоблина", instance = "GOBBO_SKELETON", amount = 60}, {name = "Снеппер", instance = "SNAPPER", amount = 60}}, -- 25
	{{name = "Варг", instance = "Варг", amount = 10}, {name = "Скелет", instance = "LESSER_SKELETON", amount = 70}}, -- 26
	{{name = "Варг", instance = "Варг", amount = 30}, {name = "Скелет", instance = "LESSER_SKELETON", amount = 50}}, -- 27
	{{name = "Варг", instance = "Варг", amount = 90}}, -- 28
	{{name = "Огненный ящер", instance = "FIREWARAN", amount = 10}}, -- 29
	{{name = "Варг", instance = "Варг", amount = 50},  {name = "Огненный ящер", instance = "FIREWARAN", amount = 15}}, -- 30
	{{name = "Варг", instance = "Варг", amount = 70},  {name = "Огненный ящер", instance = "FIREWARAN", amount = 15}, {name = "Драконний Снеппер", instance = "DRAGONSNAPPER", amount = 20}}, -- 31
	{{name = "Варг", instance = "Варг", amount = 80},  {name = "Огненный ящер", instance = "FIREWARAN", amount = 35}, {name = "Драконний Снеппер", instance = "DRAGONSNAPPER", amount = 40}}, -- 32
	{{name = "Варг", instance = "Варг", amount = 90},  {name = "Огненный ящер", instance = "FIREWARAN", amount = 45}, {name = "Драконний Снеппер", instance = "DRAGONSNAPPER", amount = 70}}, -- 33
	{{name = "Варг", instance = "Варг", amount = 120},  {name = "Огненный ящер", instance = "FIREWARAN", amount = 75}, {name = "Драконний Снеппер", instance = "DRAGONSNAPPER", amount = 90}}, -- 34
	{{name = "Варг", instance = "Варг", amount = 140},  {name = "Огненный ящер", instance = "FIREWARAN", amount = 95}, {name = "Драконний Снеппер", instance = "DRAGONSNAPPER", amount = 120}}, -- 35
	{{name = "Варг", instance = "Варг", amount = 200},  {name = "Огненный ящер", instance = "FIREWARAN", amount = 155}, {name = "Драконний Снеппер", instance = "DRAGONSNAPPER", amount = 200}}, -- 36
	{{name = "Каменный голем", instance = "STONEGOLEM", amount = 2}}, -- 37
	--Nowe
	{{name = "Ognisty Smok", instance = "DRAGON_FIRE", amount = 1}, {name = "Ognisty Golem", instance = "FIREGOLEM", amount = 1} }, -- 38
	{{name = "Bagienny Smok", instance = "DRAGON_SWAMP", amount = 25}, {name = "W№ї Bіotny", instance = "SWAMPSHARK", amount = 1455} }, -- 39
	{{name = "Lodowy Smok", instance = "DRAGON_ICE", amount = 5}, {name = "Lodowy Wilk", instance = "ICEWOLF", amount = 145}, {name = "Lodowy Golem", instance = "ICEGOLEM", amount = 27}}, -- 40
	{{name = "Lodowy Smok", instance = "DRAGON_ICE", amount = 1}, {name = "Bagienny Smok", instance = "DRAGON_SWAMP", amount = 1}, {name = "Ognisty Smok", instance = "DRAGON_FIRE", amount = 1} }, -- 41
	{{name = "Lodowy Golem", instance = "ICEGOLEM", amount = 2}, {name = "Ognisty Golem", instance = "FIREGOLEM", amount = 2} }, -- 42

};

local HuntGold = {
	150,
	250,
	350,
	500,
	800,
	950,
	1150,
	1200,
	1450,
	1600,
	1900,
	2300,
	2500,
	2750,
	3800,
	3900,
	4400,
	4800,
	5500,
	6000,
	6900,
	8000,
	9000,
	14000,
	17000,
	19000,
	24900,
	26000,
	28000,
	30000,
	35000,
	40000,
	60000,
	70000,
	100000,
	120000,
	145000,
	50000,
	--Nowe
	60000,
	97000,
	88000,
	90000,
	91000,





	-- Koniec Blyth
}

local MaxHunt = 5;

local Hunt_texture = CreateTexture(3100, 2200, 5200, 5000, "Frame_GMPA.TGA");
local Hunt_Draw = CreateDraw(3200, 2100, "Охота:", "Font_Old_20_White_Hi.TGA", 255, 255, 255);

local Player = {};

function CreateHunt()
	
	local Player = {};
	
	Player.Hunting = 0; -- Polowanie czy zaczкte
	Player.Hunt_Lvl = 0;
	Player.Amount = {[1] = 0,
	[2] = 0,
	[3] = 0,
	[4] = 0,
	[5] = 0};
	
	Player.Hunt_Draw = {};

	Player.Hunt_Draw_Amount = {};
	Player.Hunt_Lvl_Draw = nil;
	
	return Player;
	
end

function Hunt_OnPlayerConnect(playerid)
	
	if IsNPC(playerid) ~= 1 then
	
		Player[playerid] = CreateHunt();
		
	end

end

function ShowHunt(playerid)

	ShowTexture(playerid, Hunt_texture);
	ShowDraw(playerid, Hunt_Draw);
	
	if GetPlayerHunt(playerid) == 1 then
		ShowPlayerDraw(playerid, Player[playerid].Hunt_Lvl_Draw);
	end
	
	for i = 1, #Hunt[Player[playerid].Hunt_Lvl + 1] do
	
		ShowPlayerDraw(playerid, Player[playerid].Hunt_Draw[i]);
		ShowPlayerDraw(playerid, Player[playerid].Hunt_Draw_Amount[i]);
		
	end

end

function HideHunt(playerid)

	HideTexture(playerid, Hunt_texture);
	HideDraw(playerid, Hunt_Draw);
	
	if GetPlayerHunt(playerid) == 1 then
		HidePlayerDraw(playerid, Player[playerid].Hunt_Lvl_Draw);
	end
	
	for i = 1, #Hunt[Player[playerid].Hunt_Lvl + 1] do
	
		HidePlayerDraw(playerid, Player[playerid].Hunt_Draw[i]);
		HidePlayerDraw(playerid, Player[playerid].Hunt_Draw_Amount[i]);
		
	end

end

function StartHunt(playerid)
	
	ClearHunt( playerid );
	Player[playerid].Hunting = 1;
	
	local y = 2450;
	
	for i = 1, #Hunt[Player[playerid].Hunt_Lvl + 1] do
		
		Player[playerid].Hunt_Draw[i] = CreatePlayerDraw(playerid, 3200, y, ""..GetMonsterHuntName( playerid, i ).."", "Font_Old_10_White_Hi.TGA", 255, 255, 255);
		Player[playerid].Hunt_Draw_Amount[i] = CreatePlayerDraw(playerid, 4400, y, "(0/"..GetMonsterHuntAmount( playerid, i )..")", "Font_Old_10_White_Hi.TGA", 255, 255, 255);
		y = y + 150;
		
	end
	
	Player[playerid].Hunt_Lvl_Draw = CreatePlayerDraw(playerid, 4399, 2100, "#. "..(Player[playerid].Hunt_Lvl + 1).."", "Font_Old_20_White_Hi.TGA", 255, 255, 255);

end

function EndHunt(playerid)

	Player[playerid].Hunting = 0;
	
	
	for i = 1, #Hunt[Player[playerid].Hunt_Lvl + 1] do
		
		DestroyPlayerDraw(playerid, Player[playerid].Hunt_Draw[i]);
		DestroyPlayerDraw(playerid, Player[playerid].Hunt_Draw_Amount[i]);
		
	end
	
	DestroyPlayerDraw(playerid, Player[playerid].Hunt_Lvl_Draw);
	
	for i = 1, 5 do
	
		Player[playerid].Amount[i] = 0;
		
	end
	
	ClearHunt( playerid );
	GiveItem(playerid, "ITMI_GOLD", GetGoldHunt(playerid));
	
	Player[playerid].Hunt_Lvl = Player[playerid].Hunt_Lvl + 1;

end

function UpdateHunt(playerid, amount, nr)


	local y = 2450;

	for i = 1, nr - 1 do
		
		y = y + 150;
		
	end
	
	UpdatePlayerDraw(playerid, Player[playerid].Hunt_Draw_Amount[nr], 4400, y, "("..amount.."/"..GetMonsterHuntAmount( playerid, nr )..")", "Font_Old_10_White_Hi.TGA", 255, 255, 255);

	
end

function GetMonsterHuntName( playerid, nr )

	for key, vob in ipairs( Hunt[Player[playerid].Hunt_Lvl + 1] ) do
	
		if nr == key then
		
			return vob.name;
			
		end
		
	end
	
	return false;
	
end

function GetMonsterHunt( playerid, nr )

	for key, vob in ipairs( Hunt[Player[playerid].Hunt_Lvl + 1] ) do
	
		if nr == key then
		
			return vob.instance;
			
		end
		
	end
	
	return false;
	
end

function GetMonsterHuntAmount( playerid, nr )

	for key, vob in ipairs( Hunt[Player[playerid].Hunt_Lvl + 1] ) do
	
		if nr == key then
		
			return vob.amount;
			
		end
		
	end
	
	return false;
	
end

function GetPlayerHunting( playerid )

	local HuntAmount = 0;

	for i = 1, #Hunt[Player[playerid].Hunt_Lvl + 1] do	

		if Player[playerid].Amount[i] >= GetMonsterHuntAmount( playerid, i ) then
		
			HuntAmount = HuntAmount + 1;
		
		end
		
	end
	
	if HuntAmount == #Hunt[Player[playerid].Hunt_Lvl + 1] then
	
		return true;
		
	else
	
		return false;
	
	end

end

function GetPlayerHunt( playerid )

	return Player[playerid].Hunting;

end

function GetPlayerHuntLvl( playerid )

	return Player[playerid].Hunt_Lvl;

end

function GetPlayerHuntAmount( playerid )

	return Player[playerid].Amount[1], Player[playerid].Amount[2], Player[playerid].Amount[3], Player[playerid].Amount[4], Player[playerid].Amount[5];

end

function SetPlayerHuntLvl( playerid, hunt_lvl )

	Player[playerid].Hunt_Lvl = hunt_lvl;

end

function SetPlayerHunt( playerid, hunt )
	
	Player[playerid].Hunting = hunt;
	
	if hunt == 1 then
	
		StartHunt(playerid);
		
	end
	
end

function GetGoldHunt(playerid)

	for i = 1, #HuntGold do
	
		if Player[playerid].Hunt_Lvl + 1 == i then
		
			return HuntGold[i];
		
		end
		
	end

end

function SetPlayerHuntAmount( playerid, hunt_0, hunt_1, hunt_2, hunt_3, hunt_4)

	Player[playerid].Amount[1] = hunt_0;
	Player[playerid].Amount[2] = hunt_1;
	Player[playerid].Amount[3] = hunt_2;
	Player[playerid].Amount[4] = hunt_3;
	Player[playerid].Amount[5] = hunt_4;
	
	if Player[playerid].Hunting == 1 then
	
		for i = 1, #Hunt[Player[playerid].Hunt_Lvl + 1] do	
		
			UpdateHunt(playerid, Player[playerid].Amount[i], i);

		end
	
	end

end

function HuntingMonster(playerid, monsterid)

	if IsNPC(playerid) ~= 1 and IsNPC(monsterid) == 1 then
	
		if Player[playerid].Hunting == 1 then
		
			for i = 1, #Hunt[Player[playerid].Hunt_Lvl + 1] do	
				
				if GetMonsterInstanceImpossed( monsterid ) == GetMonsterHunt( playerid, i  ) then
					
					if GetMonsterHuntAmount( playerid, i ) > Player[playerid].Amount[i] then
						
						Player[playerid].Amount[i] = Player[playerid].Amount[i] + 1;
						UpdateHunt(playerid, Player[playerid].Amount[i], i);
					
					end
					
				end
					
			end
		
		end
	
	end
	
end

function ClearHunt( playerid )

	for i = 1, MaxHunt do	

		Player[playerid].Amount[i] = 0;
		
	end

end