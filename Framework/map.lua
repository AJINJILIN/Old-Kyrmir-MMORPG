local Player = {};

--local MapTexture = CreateTexture(700, 100, 8100, 8300, "Map_NewWorld.TGA");
local MapTexture = CreateTexture(700, 100, 8100, 8300, "Map_NewWorld_Shrine.TGA");

local PktX = 2400;
local PktZ = 4392;

function CreatePlayerMap(playerid)

	local Player = {};
	
	Player.MapOn = false;
	Player.Pkt = CreateDraw(0, 0, " ", "Font_Old_20_White_Hi.TGA", 255, 255, 255);
	Player.Name = CreateDraw(0, 0, " ", "Font_Old_10_White_Hi.TGA", 255, 255, 255);
	
	return Player;
end

function OnPlayerLoggedInMap(playerid)
	
	if IsNPC(playerid) == 0 then
	
		Player[playerid] = CreatePlayerMap(playerid);
		
	end

end

function ShowPlayerOnMap(playerid, show_playerid)

	if IsPlayerConnected(show_playerid) == 1 then
	
		ShowDraw(playerid, Player[show_playerid].Pkt);
		ShowDraw(playerid, Player[show_playerid].Name);
	
	end

end

function HidePlayerOnMap(playerid, hide_playerid)

	if IsPlayerConnected(hide_playerid) == 1 then
	
		HideDraw(playerid, Player[hide_playerid].Pkt);
		HideDraw(playerid, Player[hide_playerid].Name);
	
	end

end

function ShowMap(playerid)
	
	Player[playerid].MapOn = true;
	
	ShowTexture(playerid, MapTexture);
	
	if GetPlayerParty(playerid) == true then
	
		for i = 0, GetPartyAmount(playerid) - 1 do
			
			ShowDraw(playerid, Player[GetPlayerPartyID(playerid, i)].Pkt);
			ShowDraw(playerid, Player[GetPlayerPartyID(playerid, i)].Name);
			
			
		end
		
	else
		
		ShowDraw(playerid, Player[playerid].Pkt);
		ShowDraw(playerid, Player[playerid].Name);
		
	end
	
end

function HideMap(playerid)

	Player[playerid].MapOn = false;

	HideTexture(playerid, MapTexture);
	
	if GetPlayerParty(playerid) == true then
	
		for i = 0, GetPartyAmount(playerid) - 1 do
			
			HideDraw(playerid, Player[GetPlayerPartyID(playerid, i)].Pkt);
			HideDraw(playerid, Player[GetPlayerPartyID(playerid, i)].Name);
			
			
		end
		
	else
		
		HideDraw(playerid, Player[playerid].Pkt);
		HideDraw(playerid, Player[playerid].Name);
		
	end

end

function UpdateMap()

	for i = 0, GetMaxPlayers() - 1 do
	
		if IsPlayerConnected(i) == 1 then
		
			if IsSpawned(i) == 1 then
		
				local x, y, z = GetPlayerPos(i);

				UpdateDraw(Player[i].Pkt, (x/16) + PktX, PktZ - (z/13), ".", "Font_Old_20_White_Hi.TGA", 255, 255, 255);
				UpdateDraw(Player[i].Name, (x/16) + PktX + 50, PktZ - (z/13), ""..GetPlayerName(i).."", "Font_Old_10_White_Hi.TGA", 255, 255, 255);
				
			end
		
		end
	
	end

end

function GetPlayerMap(playerid)

	return Player[playerid].MapOn;

end