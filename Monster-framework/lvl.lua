local LvlUp = {

	{ lvl = 0, experience = 500, next_exp = 1000 },
	{ lvl = 1, experience = 1000, next_exp = 1700 },
	{ lvl = 2, experience = 1700, next_exp = 3000 },
	{ lvl = 3, experience = 3000, next_exp = 5000 },
	{ lvl = 4, experience = 5000, next_exp = 7800 },
	{ lvl = 5, experience = 7800, next_exp = 10800 },
	{ lvl = 6, experience = 10800, next_exp = 13500 },
	{ lvl = 7, experience = 13500, next_exp = 16500 },
	{ lvl = 8, experience = 16500, next_exp = 21000 },
	{ lvl = 9, experience = 21000, next_exp = 26500 },
	{ lvl = 10, experience = 26500, next_exp = 34000 },
	{ lvl = 11, experience = 34000, next_exp = 63500 },
	{ lvl = 12, experience = 63500, next_exp = 74000 },
	{ lvl = 13, experience = 74000, next_exp = 85500 },
	{ lvl = 14, experience = 85500, next_exp = 97000 },
	{ lvl = 15, experience = 97000, next_exp = 110000 },
	{ lvl = 16, experience = 110000, next_exp = 135000 },
	{ lvl = 17, experience = 135000, next_exp = 155500 },
	{ lvl = 18, experience = 155500, next_exp = 195000 },
	{ lvl = 19, experience = 195000, next_exp = 225000 },
	{ lvl = 20, experience = 225000, next_exp = 275000 },
	{ lvl = 21, experience = 275000, next_exp = 345000 },
	{ lvl = 22, experience = 345000, next_exp = 410000 },
	{ lvl = 23, experience = 410000, next_exp = 495000 },
	{ lvl = 24, experience = 495000, next_exp = 580000 },
	{ lvl = 25, experience = 580000, next_exp = 795000 },
	{ lvl = 26, experience = 795000, next_exp = 1025000 },
	{ lvl = 27, experience = 1025000, next_exp = 1355000 },
	{ lvl = 28, experience = 1355000, next_exp = 1755000 },
	{ lvl = 29, experience = 1755000, next_exp = 2255000 },
	{ lvl = 30, experience = 2255000, next_exp = 2955000 },
	{ lvl = 31, experience = 2955000, next_exp = 3755000 },
	{ lvl = 32, experience = 3755000, next_exp = 4755000 },
	{ lvl = 33, experience = 4755000, next_exp = 5955000 },
	{ lvl = 34, experience = 5955000, next_exp = 7255000 },
	{ lvl = 35, experience = 7255000, next_exp = 8555000 },
	{ lvl = 36, experience = 8555000, next_exp = 9555000 },
	{ lvl = 37, experience = 9555000, next_exp = 10955000 },
	{ lvl = 38, experience = 10955000, next_exp = 12555000 },
	{ lvl = 39, experience = 12555000, next_exp = 14955000 },
	{ lvl = 40, experience = 14955000, next_exp = 17455000 },
	{ lvl = 41, experience = 17455000, next_exp = 21555000 },
	{ lvl = 42, experience = 21555000, next_exp = 27255000 },
	{ lvl = 43, experience = 27255000, next_exp = 36255000 },
	{ lvl = 44, experience = 36255000, next_exp = 46755000 },
	{ lvl = 45, experience = 46755000, next_exp = 58555000 },
	{ lvl = 46, experience = 58555000, next_exp = 69955000 },
	{ lvl = 47, experience = 69955000, next_exp = 83055000 },
	{ lvl = 48, experience = 83055000, next_exp = 96655000 },
	{ lvl = 49, experience = 96655000, next_exp = 112655000 },
	{ lvl = 50, experience = 112655000, next_exp = 127655000 },
	{ lvl = 51, experience = 127655000, next_exp = 139955000 },
	{ lvl = 52, experience = 139955000, next_exp = 152555000 },
	{ lvl = 53, experience = 152555000, next_exp = 177755000 },
	{ lvl = 54, experience = 177755000, next_exp = 195755000 },
	{ lvl = 55, experience = 195755000, next_exp = 235755000 },
	{ lvl = 56, experience = 235755000, next_exp = 278755000 },
	{ lvl = 57, experience = 278755000, next_exp = 358755000 },
	{ lvl = 58, experience = 358755000, next_exp = 465555000 },
	{ lvl = 59, experience = 465555000, next_exp = 588555000 },
	{ lvl = 60, experience = 588555000, next_exp = 700000000 },

};

local Player = {};

function CreatePlayerLvl()

	local Player = {};

	Player.Lvl = CreateDraw(400, 7050, "0", "Font_Old_10_White_Hi.TGA", 0, 255, 0);
	
	return Player;

end

function Lvl_OnPlayerConnect(playerid)

	Player[playerid] = CreatePlayerLvl();

end

function ShowLvlDraw(playerid, focusid)

	ShowDraw(playerid, Player[focusid].Lvl);

end

function HideLvlDraw(playerid, focusid)

	HideDraw(playerid, Player[focusid].Lvl);

end

function GetHealLvl(playerid, lvl)

	return HealtLvl[lvl + 1];

end

function GetNextHealth(lvl)
	
	return ((lvl+1) * 10)/2;

end

function GetPlayerNextLevel( playerid, exper )

	for lvl, get_lvl in ipairs( LvlUp ) do
		
		if GetPlayerLevel(playerid) == get_lvl.lvl then
			
			if exper >= get_lvl.experience then
				
				SetPlayerExperienceNextLevel(playerid, get_lvl.next_exp);
				SetExpNextLevel(playerid, get_lvl.next_exp);
				SetPlayerLevel(playerid, get_lvl.lvl + 1);
				SetLevel(playerid, get_lvl.lvl + 1);
				SetPlayerMaxHealth(playerid, GetPlayerMaxHealth(playerid) + GetNextHealth(get_lvl.lvl + 1));
				SetMaxHealth(playerid, GetMaxHealth(playerid) + GetNextHealth(get_lvl.lvl + 1));
				SetLP(playerid, GetLP(playerid) + 10);
				SetPlayerLearnPoints(playerid, GetPlayerLearnPoints(playerid) + 10);
				GameTextForPlayer(playerid, 3500, 3500, "Новый уровень!", "Font_Old_20_White_Hi.TGA", 255, 255, 255, 1500);
				UpdateDraw(Player[playerid].Lvl, 400, 7050, ""..(get_lvl.lvl + 1).."", "Font_Old_10_White_Hi.TGA", 0, 255, 0);
				break;
			
			end
			
			break;

		end
		
	end

end

function UpdateLvl(playerid, lvl)
	
	UpdateDraw(Player[playerid].Lvl, 400, 7050, ""..lvl.."", "Font_Old_10_White_Hi.TGA", 0, 255, 0);
	
end

function DestroyLvlDraw(playerid)
	
	DestroyDraw(Player[playerid].Lvl);
	
end