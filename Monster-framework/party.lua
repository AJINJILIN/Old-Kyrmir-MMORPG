local Player = {};
local Party = {};
local Party_Amount = {};
local Party_Bonus = {};
local PartyDraw = {};
local MaxPartyPlayer = 20;

local Party_Draw = CreateDraw(6900, 35, "Группа", "Font_Old_20_White_Hi.TGA", 255, 255, 255);
local Party_Text = {};

local Party_PremiumExp = {
	{amount = 2, premium_exp = 20},
	{amount = 3, premium_exp = 30},
	{amount = 4, premium_exp = 40},
	{amount = 5, premium_exp = 55},
	{amount = 6, premium_exp = 70},
	{amount = 7, premium_exp = 85},
	{amount = 8, premium_exp = 100},
	{amount = 9, premium_exp = 130},
	{amount = 10, premium_exp = 170},
	{amount = 11, premium_exp = 210},
	{amount = 12, premium_exp = 230},
	{amount = 13, premium_exp = 250},
	{amount = 14, premium_exp = 280},
	{amount = 15, premium_exp = 320},
	{amount = 16, premium_exp = 360},
	{amount = 17, premium_exp = 400},
	{amount = 18, premium_exp = 440},
	{amount = 19, premium_exp = 480},
	{amount = 20, premium_exp = 550},
};

function CreatePlayerParty()

	local Player = {};
	
	Player.Party = false;
	Player.Party_Leader = false;
	Player.PartyID = -1;
	Player.Party_Player = {};
	
	return Player;
	
end

function PartyInit(playerid)
	
	if IsNPC(playerid) ~= 1 then
	
		Player[playerid] = CreatePlayerParty(playerid);
		
	end

end

function CreatePartyDraw()

	local Party = {};
	
	Party.Draw = {};
	Party.HP = {};
	
	for i = 0, MaxPartyPlayer do
	
		Party.Draw[i] = CreateDraw(6700, 500, "", "Font_Old_10_White_Hi.TGA", 255, 255, 255);
		Party.HP[i] = CreateDraw(7600, 500, "", "Font_Old_10_White_Hi.TGA", 255, 255, 255);
	
	end
	
	return Party;

end

function CreateParty(playerid, playertwoid)
	
	Party[playerid] = {};
	
	Party[playerid][0] = playerid;
	Party[playerid][1] = playertwoid;
	
	Player[playerid].Party = true;
	Player[playerid].Party_Leader = true;
	Player[playerid].PartyID = playerid;
	
	Player[playertwoid].Party = true;
	Player[playertwoid].PartyID = playerid;

	PartyDraw[playerid] = CreatePartyDraw();

	Party_Amount[playerid] = 2;
	
	Party_Bonus[playerid] = CreateDraw(6750, 6435, "Бонус EXP "..GetPartyBonusPercent(GetPartyAmount(playerid)).."%", "Font_Old_10_White_Hi.TGA", 255, 255, 0);
	
	--if GetPlayerMap(playerid) == true then
	
		--ShowPlayerOnMap(playerid, playertwoid);
		
	--end
	
	--if GetPlayerMap(playertwoid) == true then
	
		--ShowPlayerOnMap(playertwoid, playerid);
		
	--end
	
	UpdateParty(playerid);
	ShowParty(playerid);
	ShowParty(playertwoid);

end

function DestroyParty(playerid)

	--for i = 0, Party_Amount[playerid] - 1 do
	
		--HideMemberInMap(Party[playerid][i]);
	
	--end
	
	for i = 0, Party_Amount[playerid] - 1 do
	
		HideParty(Party[playerid][i]);
		Party[playerid][i] = nil;
	
	end
	
	for i = 0, MaxPartyPlayer - 1 do
	
		DestroyDraw(PartyDraw[Player[playerid].PartyID].Draw[i]);
	
	end
	
	Party_Amount[playerid] = nil;

end

function AddPlayerToParty(playerid, playertwoid)
	
	if GetPartyAmount(playerid) < MaxPartyPlayer then

		for i = 0, MaxPartyPlayer - 1 do
			
			if Party[Player[playerid].PartyID][i] == nil then
			
				Party[Player[playerid].PartyID][i] = playertwoid;
				break;
				
			else
			
				--if GetPlayerMap(GetPlayerPartyID(playerid, i)) == true then
			
					--ShowPlayerOnMap(GetPlayerPartyID(playerid, i), playertwoid);
					
				--end
				
			end
		
		end
		
		Player[playertwoid].PartyID = Player[playerid].PartyID;
		Party_Amount[Player[playerid].PartyID] = Party_Amount[Player[playerid].PartyID] + 1;
		
		UpdateParty(playerid);
		ShowParty(playertwoid);
		
	else
	
		SendPlayerMessage(playerid, 255, 0, 0, "Группа уже полная!");
		
	end

end

function LeftParty(playerid)

	--HideMemberInMap(playerid);

	for i = 0, MaxPartyPlayer - 1 do
	
		if Party[Player[playerid].PartyID][i] == playerid then
			
			HideParty(playerid);
			Party[Player[playerid].PartyID][i] = nil;
		
		end
	
	end
	
	Party_Amount[Player[playerid].PartyID] = Party_Amount[Player[playerid].PartyID] - 1;
	
	UpdatePartyPlayer(playerid);
	UpdateParty(playerid);

end

function UpdatePartyPlayer(playerid)

	for i = 0, MaxPartyPlayer - 1 do
	
		if Party[Player[playerid].PartyID][i] == nil and Party[Player[playerid].PartyID][i + 1] ~= nil then
		
			Party[Player[playerid].PartyID][i] = Party[Player[playerid].PartyID][i + 1];
			Party[Player[playerid].PartyID][i + 1] = nil;
		
		end
	
	end

end

function UpdateParty(playerid)

	local y = 500;
	
	UpdateDraw(Party_Bonus[Player[playerid].PartyID], 6750, 750 + GetY( GetPartyAmount(playerid) ), "Бонус EXP "..GetPartyBonusPercent(GetPartyAmount(playerid)).."%", "Font_Old_10_White_Hi.TGA", 255, 255, 0);

	for i = 0, MaxPartyPlayer - 1 do
		
		if Party[Player[playerid].PartyID][i] ~= nil then
		
			UpdateDraw(PartyDraw[Player[playerid].PartyID].Draw[i], 6700, y, GetPlayerName(Party[Player[playerid].PartyID][i]), "Font_Old_10_White_Hi.TGA", 255, 255, 255);
			UpdateDraw(PartyDraw[Player[playerid].PartyID].HP[i], 7600, y, ""..GetHPPercent(GetPlayerPartyID(playerid, i), GetPlayerHealth(GetPlayerPartyID(playerid, i))).."%", "Font_Old_10_White_Hi.TGA", 255, 255, 255);
			
		else
		
			UpdateDraw(PartyDraw[Player[playerid].PartyID].Draw[i], 6700, y, " ", "Font_Old_10_White_Hi.TGA", 255, 255, 255);
			UpdateDraw(PartyDraw[Player[playerid].PartyID].HP[i], 7600, y, " ", "Font_Old_10_White_Hi.TGA", 255, 255, 255);
			
		end
		
		y = y + 200;
		
	end

end

function ShowParty(playerid)

	Player[playerid].Party = true;
	
	ShowDraw(playerid, Party_Draw);
	ShowDraw(playerid, Party_Bonus[Player[playerid].PartyID]); 
	
	for i = 0, MaxPartyPlayer - 1 do
	
		ShowDraw(playerid, PartyDraw[Player[playerid].PartyID].Draw[i]);
		ShowDraw(playerid, PartyDraw[Player[playerid].PartyID].HP[i]);
	
	end

end

function HideParty(playerid)

	Player[playerid].Party = false;
	Player[playerid].Party_Leader = false;
	
	HideDraw(playerid, Party_Draw);
	HideDraw(playerid, Party_Bonus[Player[playerid].PartyID]);
	
	for i = 0, MaxPartyPlayer - 1 do
	
		HideDraw(playerid, PartyDraw[Player[playerid].PartyID].Draw[i]);
		HideDraw(playerid, PartyDraw[Player[playerid].PartyID].HP[i]);
	
	end

end

--[[function HideMemberInMap(member_id)

	for i = 0, GetPartyAmount(member_id) - 1 do
	
		for j = 0, GetPartyAmount(member_id) - 1 do
		
			if GetPlayerPartyID(member_id, i) ~= GetPlayerPartyID(member_id, j) then
		
				HidePlayerOnMap(GetPlayerPartyID(member_id, i), GetPlayerPartyID(member_id, j));
				
			end
		
		end
	
	end

end]]

function GetPlayerParty(playerid)
	
	if IsNPC(playerid) ~= 1 then
	
		if playerid ~= -1 then
	
			return Player[playerid].Party;
			
		end

	end
	
end

function GetPlayerPartyLeader(playerid)

	return Player[playerid].Party_Leader;

end

function GetPartyID(playerid)
	
	return Player[playerid].PartyID;
	
end

function GetPartyAmount(playerid)

	return Party_Amount[Player[playerid].PartyID];

end

function GetPlayerPartyID(playerid, id)

	for i = 0, GetPartyAmount(playerid) - 1 do
	
		if i == id then
		
			return Party[Player[GetPartyID(playerid)].PartyID][i];
		
		end
	
	end

end

function GetPartyBonusExp(amount_party)

	for i, amount in ipairs( Party_PremiumExp ) do
		
		if amount_party == amount.amount then
		
			return (amount.premium_exp/100)+1;
			
		end
	
	end

end

function GetPartyBonusPercent(amount_party)

	for i, amount in ipairs( Party_PremiumExp ) do
		
		if amount_party == amount.amount then
		
			return amount.premium_exp;
			
		end
	
	end

end

function PartyExit(playerid)

	if GetPlayerParty(playerid) == true then
		
		if GetPlayerPartyLeader(playerid) == true or GetPartyAmount(playerid) == 2 then
		
			DestroyParty(GetPartyID(playerid));
		
		else
		
			LeftParty(playerid);
			
		end
	
	end

end

function PartyKick(playerid, params)
	
	local result, id = sscanf(params, "d");
	
	if result == 1 then
	
		if IsNPC(id) ~= 1 then
		
			if GetPlayerPartyLeader(playerid) == true then
		
				if GetPlayerParty(id) == true and GetPartyID(id) == playerid then
					
					if id == playerid then
					
						SendPlayerMessage(playerid, 255, 0, 0, "Вы не можете выгнать самого себя из группы!");
					
					else
					
						PartyExit(id);
						
					end
					
				else
				
					SendPlayerMessage(playerid, 255, 0, 0, "Этот игрок не находится в вашей группе!");
				
				end
				
			else
			
				SendPlayerMessage(playerid, 255, 0, 0, "Вы не лидер группы!");
			
			end
			
		end
		
	else
		
		SendPlayerMessage(playerid, 255, 0, 0, "Wpisz /gkick (id)");
		
	end

end

function PartyJoin(playerid, partyinvid)
	
	if GetPlayerParty(playerid) == false and GetPlayerParty(partyinvid) == false then

		CreateParty(partyinvid, playerid);
		
	elseif GetPlayerParty(playerid) == false and GetPlayerParty(partyinvid) == true then

		AddPlayerToParty(partyinvid, playerid);
		
	end				

end

function ChatGroup(playerid, params)

	if GetPlayerParty(playerid) == true then
	
		local result, text = sscanf(params, "s");
		
		if result == 1 then
	
			for i = 0, GetPartyAmount(playerid) - 1 do
			
				SendPlayerMessage(GetPlayerPartyID(playerid, i), 255, 150, 0, GetPlayerName(playerid)..": "..text);
				
			end
			
		else
			
			SendPlayerMessage(playerid, 255, 0, 0, "Wpisz /p (text)");
			
		end
	
	end

end

function GetY( member_amount )

	return (member_amount - 1) * 200;

end

function UpdatePartyHealth(playerid, health)

	local y = 500;

	for i = 0, GetPartyAmount(playerid) - 1 do
	
		if GetPlayerPartyID(playerid, i) == playerid then

			UpdateDraw(PartyDraw[Player[playerid].PartyID].HP[i], 7600, y, ""..GetHPPercent(playerid, health).."%", "Font_Old_10_White_Hi.TGA", 255, 255, 255);
			break;
			
		end
		
		y = y + 200;
		
	end

end

function GetHPPercent(playerid, health)

	local PercentHealth = math.ceil((health * 100)/GetMaxHealth(playerid));
	
	return PercentHealth;

end
