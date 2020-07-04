--[[
	Virtual Gold
	Kyrmir MMORPG
]]

local Player = {};

function goldInit(playerid)
	Player[playerid] = {};
	Player[playerid].Gold = 0;
	Player[playerid].Gold_Draw = CreatePlayerDraw(playerid, 5550, 800, "Золото: "..Player[playerid].Gold, "Font_Old_10_White.TGA", 255, 51, 204);
end

function restartGold(playerid)
	Player[playerid].Gold = 0;
	HidePlayerDraw(playerid, Player[playerid].Gold_Draw);
	DestroyPlayerDraw(playerid, Player[playerid].Gold_Draw);
	Player[playerid] = nil;
end

function AddGoldToPlayer(playerid, amount)
	if IsPlayerConnected(playerid) == 1 then
		if IsNPC(playerid) == 0 then
			if Player[playerid].Gold ~= amount then
				Player[playerid].Gold = amount;
				UpdatePlayerDraw(playerid, Player[playerid].Gold_Draw, 5550, 800, "Золото: "..amount, "Font_Old_10_White.TGA", 255, 51, 204);
			end
		end
	else
		return false;
	end
end

function GetGoldFromPlayer(playerid)
	if IsPlayerConnected(playerid) == 1 then
		if IsNPC(playerid) == 0 then
			return Player[playerid].Gold;
		end
	else
		return false;
	end
end

function getGoldDrawID(playerid)
	return Player[playerid].Gold_Draw;
end

-- Info
print(debug.getinfo(1).source.." has been loaded.");