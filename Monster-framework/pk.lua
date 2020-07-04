require "Monster-framework/stats" -- Statystyki

local PlayerKill = 100;
local MonsterKill = 1;
local PVPWin = 5;

local RankPK = {
	{rank = "Чистое зло", point = -5000, r = 220, g = 0, b = 0},
	{rank = "Жестокий", point = -2000, r = 255, g = 51, b = 0},
	{rank = "Агрессивный", point = -1000, r = 255, g = 77, b = 0},
	{rank = "Злостный", point = -400, r = 255, g = 120, b = 0},
	{rank = "Нечестный", point = -100, r = 255, g = 170, b = 0},
	{rank = "Нейтральный", point = 0, r = 255, g = 255, b = 255},
	{rank = "Дружелюбный", point = 1000, r = 171, g = 255, b = 0},
	{rank = "Добрый", point = 3000, r = 111, g = 255, b = 0},
	{rank = "Благородный", point = 10000, r = 9, g = 255, b = 0},
	{rank = "Рыцарь", point = 20000, r = 0, g = 255, b = 179},
	{rank = "Святой", point = 50000, r = 0, g = 213, b = 255},
}

local PenaltyPK = {
	{pk = 4, exp_drop = 0, gold_drop = 0},
	{pk = 5, exp_drop = 0.03, gold_drop = 0},
	{pk = 10, exp_drop = 0.08, gold_drop = 0.04},
	{pk = 15, exp_drop = 0.15, gold_drop = 0.08},
	{pk = 20, exp_drop = 0.25, gold_drop = 0.15},
	{pk = 30, exp_drop = 0.4, gold_drop = 0.25},
	{pk = 50, exp_drop = 0.7, gold_drop = 0.5},
	{pk = 100, exp_drop = 1, gold_drop = 1},
}

local Player = {};
local PK_Draw = CreateDraw(1200, 7050, "PK", "Font_Old_10_White_Hi.TGA", 255, 10, 0);

function CreatePlayerRank()
	
	local Player = {};
	
	Player.Rank = 0;
	Player.PK = 0;
	Player.PVP = false;
	Player.Amount_PK = 0;
	Player.Amount_MonsterKill = 0;
	Player.PVP_Win = 0;
	Player.PVP_Lose = 0;
	Player.Enemy = -1;
	Player.Rank_Name = "Нейтральный";
	Player.DeathByMonter = false;
	Player.Rank_Draw = CreateDraw(550, 7050, "Нейтральный", "Font_Old_10_White_Hi.TGA", 255, 255, 255);
	
	return Player;	
	
end

function PK_OnPlayerConnect(playerid)
	
	if IsNPC(playerid) ~= 1 then
	
		Player[playerid] = CreatePlayerRank();
		Stats_OnPlayerConnect(playerid);
	
	end

end

function PlayerDead(playerid, killerid)
	
	if playerid ~= -1 then
	
		if killerid ~= -1 then
		
			if killerid ~= playerid then
		
				if IsNPC(playerid) ~= 1 and IsNPC(killerid) ~= 1 then
				
					if Player[killerid].PVP == false then
						
						if GetPK(playerid) == false then
							
							GivePK(killerid);
						
						end
						
					else
					
						CheckPVP(playerid, killerid);
						
					end
					
				elseif IsNPC(killerid) ~= 1 then
				
					Player[killerid].Rank = Player[killerid].Rank + MonsterKill;
					Player[killerid].Amount_MonsterKill = Player[killerid].Amount_MonsterKill + 1;
					
					UpDateDrawsStatsRankPoints(killerid, Player[killerid].Rank);
					UpDateDrawsStatsMonsterkill(killerid, Player[killerid].Amount_MonsterKill);
					
					if Player[killerid].PK > 0 then
					
						Player[killerid].PK = Player[killerid].PK - MonsterKill;
						
						UpDateDrawsStatsPK(killerid, Player[killerid].PK);
						
					end
					
					if Player[killerid].Rank_Name ~= GetPlayerRank( killerid ) then
							
						UpdatePlayerRank( killerid );
								
					end
					
				elseif IsNPC(killerid) == 1 then
				
					Player[playerid].DeathByMonter = true;
					
				end
				
			end
		
		end
	
	end

end

function PlayerUnconscious(playerid, killerid)
		
	if IsNPC(playerid) ~= 1 and IsNPC(killerid) ~= 1 then
	
		CheckPVP(playerid, killerid);
		
	end

end

function PlayerHitSafeZone(playerid, killerid)
		
	if IsNPC(playerid) ~= 1 and IsNPC(killerid) ~= 1 then
	
		if Player[playerid].PVP == false and Player[killerid].PVP == true then
		
			BreakPVP( playerid );
			SafeZoneHealt( playerid, killerid );
			
		elseif Player[playerid].PVP == true and Player[killerid].PVP == false then
		
			BreakPVP( playerid );
			SafeZoneHealt( playerid, killerid );
			
		elseif Player[playerid].PVP == true and Player[killerid].PVP == true then
		
			if Player[killerid].Enemy ~= playerid then
			
				BreakPVP( playerid );
				BreakPVP( killerid );
				SafeZoneHealt( playerid, killerid );
			
			end
		
		end
		
	end
	
end

function PlayerHit(playerid, killerid)
		
	if IsNPC(playerid) ~= 1 and IsNPC(killerid) ~= 1 then
			
		if Player[playerid].PVP == true and Player[killerid].PVP == false then
		
			BreakPVP( playerid );
	
		elseif Player[playerid].PVP == true and Player[killerid].PVP == true then
		
			if Player[killerid].Enemy ~= playerid then
			
				BreakPVP( playerid );
				BreakPVP( killerid );
			
			end
		
		end
		
	end
	
end

function BreakPVP( killerid )

	GameTextForPlayer(Player[killerid].Enemy, 3350, 3700, "Поединок прерван!", "Font_Old_20_White_Hi.TGA", 255, 0, 0, 2000);
	GameTextForPlayer(killerid, 3350, 3700, "Поединок прерван!", "Font_Old_20_White_Hi.TGA", 255, 0, 0, 2000);
	Player[killerid].PVP = false;
	Player[Player[killerid].Enemy].PVP = false;
	ClearEnemy( killerid, Player[killerid].Enemy );

end

function UpdatePlayerRank( playerid )
	
	local r, g, b = GetPlayerRankColor( playerid );
	UpDateDrawsStatsRank(playerid, GetPlayerRank( playerid ), r, g, b);
	UpdateDraw(Player[playerid].Rank_Draw, 550, 7050, ""..GetPlayerRank( playerid ).."", "Font_Old_10_White_Hi.TGA", r, g, b);
	Player[playerid].Rank_Name = GetPlayerRank( playerid );

end

function StartPVP( playerid, focus_player )
	
	SetPlayerEnemy( playerid, focus_player );
	
	Player[playerid].PVP = true;
	Player[focus_player].PVP = true;
	
	GameTextForPlayer(playerid, 3550, 3700, "В бой!", "Font_Old_20_White_Hi.TGA", 0, 255, 0, 1500);
	GameTextForPlayer(focus_player, 3550, 3700, "В бой!", "Font_Old_20_White_Hi.TGA", 0, 255, 0, 1500);

end

function SetPlayerEnemy( playerid, enemyid )

	Player[playerid].Enemy = enemyid;
	Player[enemyid].Enemy = playerid;

end

function ClearEnemy( playerid, enemyid )
	
	Player[playerid].Enemy = -1;
	
	if enemyid ~= -1 then
	
		Player[enemyid].Enemy = -1;
		
	end
	
end

function SetPlayerRank( playerid, point )

	Player[playerid].Rank = point;
	UpDateDrawsStatsRankPoints(playerid, point);
	UpdatePlayerRank( playerid );
	
end

function SetPlayerPK( playerid, pk )

	Player[playerid].PK = pk;
	UpDateDrawsStatsPK(playerid, pk);
	UpdatePlayerRank( playerid );
	
end

function SetPlayerPVP( playerid, win, lose )
	
	Player[playerid].PVP_Win = win;
	Player[playerid].PVP_Lose = lose;
	UpDateDrawsStatsPVP(playerid, win, lose);
	
end

function GetPlayerRankPoints( playerid )
	
	return Player[playerid].Rank;
	
end

function GetPlayerPKPoints( playerid )
	
	return Player[playerid].PK;
	
end

function GetPlayerPVPWin( playerid )
	
	return Player[playerid].PVP_Win;
	
end

function GetPlayerPVPLose( playerid )
	
	return Player[playerid].PVP_Lose;
	
end

function SetPlayerPlayerKill( playerid, pk )
	
	Player[playerid].Amount_PK = pk;
	UpDateDrawsStatsPlayerkill(playerid, pk);
	
end

function SetPlayerMonsterKill( playerid, mk )
	
	Player[playerid].Amount_MonsterKill = mk;
	UpDateDrawsStatsMonsterkill(playerid, mk);
	
end

function GetPlayerPlayerKill( playerid )
	
	return Player[playerid].Amount_PK;
	
end

function GetPlayerMonsterKill( playerid )
	
	return Player[playerid].Amount_MonsterKill;
	
end

function GetPlayerPVP( playerid )
	
	return Player[playerid].PVP;

end

function GetPlayerPKofKarma( playerid )
	
	local exper, gold;
	
	for i, karma in ipairs(PenaltyPK) do
		
		if Player[playerid].PK >= (karma.pk * 100) then
			
			exper, gold = karma.exp_drop, karma.gold_drop;
		
		end
		
	end
	
	return exper, gold;
	
end

function GetPlayerRank( playerid )
	
	local rank;
	
	for i, pk in ipairs( RankPK ) do
		
		if i <= 6 then
			
			if Player[playerid].Rank <= pk.point then
				
				return pk.rank;
			
			end
			
		end
		
		if i >= 6 then
			
			if Player[playerid].Rank >= pk.point then
				
				rank = pk.rank;
			
			end
			
		end
	
	end
	
	return rank;

end

function GetPlayerRankColor( playerid )
	
	local x, y, z;
	
	for i, pk in ipairs( RankPK ) do
		
		if i <= 6 then
			
			if Player[playerid].Rank <= pk.point then
				
				return pk.r, pk.g, pk.b;
			
			end
			
		end
		
		if i >= 6 then
			
			if Player[playerid].Rank >= pk.point then
				
				x, y, z = pk.r, pk.g, pk.b;
			
			end
			
		end
	
	end
	
	return x, y, z;

end

function GetPK(playerid)

	if GetPlayerPKPoints(playerid) >= 500 then
	
		return true;
		
	else
	
		return false;
	
	end

end

function GivePK(killerid)

	Player[killerid].Rank = Player[killerid].Rank - (PlayerKill * 4);
	Player[killerid].PK = Player[killerid].PK + PlayerKill;
	Player[killerid].Amount_PK = Player[killerid].Amount_PK + 1;

	UpDateDrawsStatsRankPoints(killerid, Player[killerid].Rank);
	UpDateDrawsStatsPK(killerid, Player[killerid].PK);
	UpDateDrawsStatsPlayerkill(killerid, Player[killerid].Amount_PK);

	if Player[killerid].Rank_Name ~= GetPlayerRank( killerid ) then

		UpdatePlayerRank( killerid );
		
	end

end

function SafeZoneHealt( playerid, killerid )
	
	HitPlayer(killerid, killerid);
	SetPlayerHealth(killerid, 0);
	SetPlayerHealth(playerid, (GetPlayerMaxHealth(playerid)*0.80));
	
	SendPlayerMessage(killerid, 255, 0, 0, "Нельзя атаковать в безопасной зоне!");

end

function ShowRankDraw(playerid, focusid)
	
	ShowDraw(playerid, Player[focusid].Rank_Draw);
	
	if GetPK(focusid) == true then
	
		ShowDraw(playerid, PK_Draw);
		
	end
	
end

function HideRankDraw(playerid, focusid)
	
	HideDraw(playerid, Player[focusid].Rank_Draw);
	
	if GetPK(focusid) == true then
	
		HideDraw(playerid, PK_Draw);
		
	end
	
end

function DestroyRankDraw(playerid)

	DestroyDraw(Player[playerid].Rank_Draw);

end

function IsDeathByMonster(playerid)

	return Player[playerid].DeathByMonter;

end

function ResetDeathByMonster(playerid)

	Player[playerid].DeathByMonter = false;

end

function CheckPVP(playerid, killerid)
	
	if Player[playerid].PVP == true then
	
		if Player[playerid].Enemy == killerid and Player[killerid].PVP == true then

			GameTextForPlayer(playerid, 3350, 3700, "Поражение", "Font_Old_20_White_Hi.TGA", 255, 0, 0, 2000);
			GameTextForPlayer(killerid, 3350, 3700, "Победа", "Font_Old_20_White_Hi.TGA", 0, 255, 0, 2000);
			Player[playerid].PVP = false;
			Player[killerid].PVP = false;
			ClearEnemy( playerid, killerid );
			OnPlayerWinPVP(playerid, killerid);
			
			Player[playerid].PVP_Lose = Player[playerid].PVP_Lose + 1;
			Player[killerid].PVP_Win = Player[killerid].PVP_Win + 1;
			Player[killerid].Rank = Player[killerid].Rank + PVPWin;
			
			UpDateDrawsStatsRankPoints(killerid, Player[killerid].Rank);
			UpDateDrawsStatsPVP(killerid, Player[killerid].PVP_Win, Player[killerid].PVP_Lose);
			UpDateDrawsStatsPVP(playerid, Player[playerid].PVP_Win, Player[playerid].PVP_Lose);
			
			if Player[killerid].Rank_Name ~= GetPlayerRank( killerid ) then
		
				UpdatePlayerRank( killerid );
				
			end
			
		end
		
	end

end

function OnPlayerWinPVP(playerid, killerid)

end