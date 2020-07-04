local Player = {};

function CreateStats(playerid)
	
	local Player = {};
	
	Player.Stats = {};
	
	Player.Stats[0] = CreatePlayerDraw(playerid, 3200, 2450, "Ранг: ", "Font_Old_10_White_Hi.TGA", 255, 255, 255);
	Player.Stats[1] = CreatePlayerDraw(playerid, 3200, 2600, "Опыт: ", "Font_Old_10_White_Hi.TGA", 255, 255, 255);
	Player.Stats[2] = CreatePlayerDraw(playerid, 3200, 2750, "Карма: ", "Font_Old_10_White_Hi.TGA", 255, 255, 255);
	Player.Stats[3] = CreatePlayerDraw(playerid, 3200, 2900, "Убито игроков: ", "Font_Old_10_White_Hi.TGA", 255, 255, 255);
	Player.Stats[4] = CreatePlayerDraw(playerid, 3200, 3050, "Убито монстров: ", "Font_Old_10_White_Hi.TGA", 255, 255, 255);
	Player.Stats[5] = CreatePlayerDraw(playerid, 4800, 3800, "", "Font_Old_10_White_Hi.TGA", 0, 255, 0); -- Win PVP
	Player.Stats[6] = CreatePlayerDraw(playerid, 4800, 4050, "", "Font_Old_10_White_Hi.TGA", 255, 0, 0); -- Lose PVP
	Player.Stats[7] = CreatePlayerDraw(playerid, 4800, 4300, "", "Font_Old_10_White_Hi.TGA", 255, 255, 0); -- Procent PVP
	
	return Player
	
end

function Stats_OnPlayerConnect(playerid)

	Player[playerid] = CreateStats(playerid);

end

local Stats_Draw = {};
local Stats_texture = CreateTexture(3100, 2200, 5200, 5000, "Frame_GMPA.TGA");

Stats_Draw[0] = CreateDraw(3300, 2100, "Статистика", "Font_Old_20_White_Hi.TGA", 255, 255, 255);
Stats_Draw[1] = CreateDraw(3200, 2450, "Ранг:", "Font_Old_10_White_Hi.TGA", 255, 255, 255);
Stats_Draw[2] = CreateDraw(4000, 3500, "PVP:", "Font_Old_10_White_Hi.TGA", 255, 255, 255);
Stats_Draw[3] = CreateDraw(3200, 3800, "Побед:", "Font_Old_10_White_Hi.TGA", 255, 255, 255);
Stats_Draw[4] = CreateDraw(3200, 4050, "Поражений:", "Font_Old_10_White_Hi.TGA", 255, 255, 255);
Stats_Draw[5] = CreateDraw(3200, 4300, "Процент побед:", "Font_Old_10_White_Hi.TGA", 255, 255, 255);



function ShowStats(playerid)
	
	ShowTexture(playerid, Stats_texture);
	
	for i = 0, #Stats_Draw do
		
		ShowDraw(playerid, Stats_Draw[i]);
		
	end
	
	for j = 0, #Player[playerid].Stats do
	
		ShowPlayerDraw(playerid, Player[playerid].Stats[j]);
	
	end

end

function HideStats(playerid)
	
	HideTexture(playerid, Stats_texture);
	
	for i = 0, #Stats_Draw do
		
		HideDraw(playerid, Stats_Draw[i]);
		
	end
	
	for j = 0, #Player[playerid].Stats do
	
		HidePlayerDraw(playerid, Player[playerid].Stats[j]);
	
	end

end

function UpDateDrawsStatsRank(playerid, rank, r, g, b)

	UpdatePlayerDraw(playerid, Player[playerid].Stats[0], 3650, 2450, ""..rank.."", "Font_Old_10_White_Hi.TGA", r, g, b);

end

function UpDateDrawsStatsRankPoints(playerid, rankpkt)

	UpdatePlayerDraw(playerid, Player[playerid].Stats[1], 3200, 2600, "Опыт: "..rankpkt.."", "Font_Old_10_White_Hi.TGA", 255, 255, 255);

end

function UpDateDrawsStatsPK(playerid, pk)

	UpdatePlayerDraw(playerid, Player[playerid].Stats[2], 3200, 2750, "Карма: "..pk.."", "Font_Old_10_White_Hi.TGA", 255, 255, 255);

end

function UpDateDrawsStatsPlayerkill(playerid, playerkill)

	UpdatePlayerDraw(playerid, Player[playerid].Stats[3], 3200, 2900, "Убито игроков: "..playerkill.."", "Font_Old_10_White_Hi.TGA", 255, 255, 255);

end

function UpDateDrawsStatsMonsterkill(playerid, monsterkill)

	UpdatePlayerDraw(playerid, Player[playerid].Stats[4], 3200, 3050, "Убито монстров: "..monsterkill.."", "Font_Old_10_White_Hi.TGA", 255, 255, 255);

end

function UpDateDrawsStatsPVP(playerid, pvp_win, pvp_lose)

	UpdatePlayerDraw(playerid, Player[playerid].Stats[5], 4800, 3800, ""..pvp_win.."", "Font_Old_10_White_Hi.TGA", 0, 255, 0); -- Win PVP
	UpdatePlayerDraw(playerid, Player[playerid].Stats[6], 4800, 4050, ""..pvp_lose.."", "Font_Old_10_White_Hi.TGA", 255, 0, 0); -- Lose PVP
	
	if pvp_win == 0 and pvp_lose == 0 then
	
		UpdatePlayerDraw(playerid, Player[playerid].Stats[7], 4800, 4300, "0%", "Font_Old_10_White_Hi.TGA", 255, 255, 0); -- Procent PVP
	
	else
	
		UpdatePlayerDraw(playerid, Player[playerid].Stats[7], 4800, 4300, ""..(math.ceil(pvp_win * 100/ (pvp_win + pvp_lose))).."%", "Font_Old_10_White_Hi.TGA", 255, 255, 0); -- Procent PVP
		
	end

end