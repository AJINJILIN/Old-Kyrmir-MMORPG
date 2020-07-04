local Player = {};
local Clan = {};

local MaxClanMembers = 15;
local ClanName = 25;
local ClanTag = 3;

local ClanInfoText = CreateTexture(2450, 2350, 6000, 6450, "Frame_GMPA.TGA");
local ClanInfo = CreateDraw(3200, 2250, "Информация о клане", "Font_Old_20_White_Hi.TGA", 255, 255, 255);
local MemberDraw = CreateDraw(4550, 2600, "Участники:", "Font_Old_10_White_Hi.TGA", 255, 255, 0);
local NickDraw = CreateDraw(4350, 2850, "Ник:", "Font_Old_10_White_Hi.TGA", 255, 255, 0);
local RankDraw = CreateDraw(5100, 2850, "Ранг:", "Font_Old_10_White_Hi.TGA", 255, 255, 0);
local LvlDraw = CreateDraw(2700, 2600, "Средний уровень:", "Font_Old_10_White_Hi.TGA", 255, 255, 255);
local RankClanDraw = CreateDraw(2700, 2800, "Ранг клана:", "Font_Old_10_White_Hi.TGA", 255, 255, 255);
local LeaderDraw = CreateDraw(2700, 3000, "Лидер:", "Font_Old_10_White_Hi.TGA", 255, 255, 255);
local TagDraw = CreateDraw(2700, 3200, "Клан-таг:", "Font_Old_10_White_Hi.TGA", 255, 255, 255);
local NameDraw = CreateDraw(2700, 3400, "Имя клана:", "Font_Old_10_White_Hi.TGA", 255, 255, 255);
local AmountMember = CreateDraw(2700, 3600, "Число участников:", "Font_Old_10_White_Hi.TGA", 255, 255, 255);
--CreateDraw(2700, 4300, "wrog", "Font_Old_10_White_Hi.TGA", 255, 255, 255);
local EnemyDraw = CreateDraw(2700, 4000, "Враги клана:", "Font_Old_10_White_Hi.TGA", 255, 0, 0);
local AlianceDraw = CreateDraw(3400, 4000, "Союзники клана:", "Font_Old_10_White_Hi.TGA", 0, 255, 0);


function OnFilterscriptInit()
InitClan()
end

function OnFilterscriptExit()

end

function OnPlayerConnect(playerid)
 
	Clan_OnPlayerConnect(playerid)
	
end

function CreateClanPlayer()
	
	local Player = {};
	
	Player.Clan = nil;
	
	return Player;
	
end

function Clan_OnPlayerConnect(playerid)
	
	--if IsNPC(playerid) ~= 1 then
	
		Player[playerid] = CreateClanPlayer();
		
	--end

end

function InitClan()

	local Clan = {};
	
	Clan.Info = {
		Name = nil;
	};
	Clan.Member = {
		Lvl = {},
		Name = {},
	};
	
	Clan.Status = { 
		Aliance = {},
		Enemy = {},
		};
	
	Clan.Rank = 0;
	Clan.Leader = nil;
	
	Clan.Draw = { 
		DisplayName = nil, 
		Lvl = nil,
		Rank = nil,
		Leader = nil,
		Tag = nil,
		Name = nil,
		AmountMember = nil,	
		Member = {
			Member = {},
			Rank = {},
		},
		Enemy = {},
		Aliance = {},
	};
	
	return Clan;

end

function CMD_CreateClan(leaderid, params)

	if GetPlayerClan(leaderid) == nil then

		local result, name, tag = sscanf(params,"ss");
		
		if result == 1 then
			
			if string.len(name) <= ClanName then
			
				if string.len(tag) <= ClanTag then
			
					CreateClan(leaderid, string.gsub(name, "_", " "), tag);
					
				else
				
					SendPlayerMessage(leaderid, 255, 0, 0, "Клан-таг не может содержать больше 3-х знаков!");
				
				end
				
			else
				
				SendPlayerMessage(leaderid, 255, 0, 0, "Название клана не может содержать больше 25-ти знаков!");
			
			end
			
		else
		
			SendPlayerMessage(leaderid, 255, 0, 0, "Пиши /создатьклан (название) (клан-таг)");
		
		end
	
	else
	
		SendPlayerMessage(leaderid, 255, 255, 0, "Вы уже лидер клана!");
		
	end
	
end

function AddEnemy(playerid, tag, enemy_tag)

	if GetPlayerLeaderClan(playerid) == true then

		if Clan[enemy_tag] ~= nil then
		
			table.insert(Clan[tag].Status.Enemy, enemy_tag);
			SaveEnemy(tag);
		
		end
		
	else
	
		SendPlayerMessage(playerid, 255, 0, 0, "Вы не являетесь лидером клана!");
		
	end
	
end

function RemoveEnemy(playerid, tag, enemy_tag)

	if GetPlayerLeaderClan(playerid) == true then

		table.remove(Clan[tag].Status.Enemy, FindEnemyClan(Clan[tag].Status.Enemy, enemy_tag));
		SaveEnemy(tag);
	
	else
	
		SendPlayerMessage(playerid, 255, 0, 0, "Вы не являетесь лидером клана!");
		
	end

end

function FindEnemyClan(_table, enemy_tag)

	for i = 1, #_table do
	
		if _table[i] == enemy_tag then
		
			return i;
		
		end
	
	end

end

function AddMember(playerid, memberid, tag)

	if GetPlayerLeaderClan(playerid) == true then
	
		if CheckPlayerClan(memberid) == false then

			Player[memberid].Clan = tag;
			table.insert(Clan[tag].Member.Name, GetPlayerName(memberid));
			table.insert(Clan[tag].Member.Lvl, GetPlayerLevel(memberid));
			table.insert(Clan[tag].Draw.Member.Member, CreateDraw(4350, 3050 + GetY( #Clan[tag].Member.Name ), ""..Clan[tag].Member.Name[#Clan[tag].Member.Name].."", "Font_Old_10_White_Hi.TGA", 255, 255, 255));
			table.insert(Clan[tag].Draw.Member.Rank, CreateDraw(5100, 3050 + GetY( #Clan[tag].Member.Name ), "недостаточно.", "Font_Old_10_White_Hi.TGA", 255, 255, 255));
			SetPlayerName(memberid, "|"..tag.."|"..GetPlayerName(memberid));
			UpdateClanInfo( tag );
			SaveMembers(tag);
			
		else
		
			SendPlayerMessage(playerid, 255, 0, 0, "Этот игрок уже состоит в клане!");
			
		end
	
	else
	
		SendPlayerMessage(playerid, 255, 0, 0, "Вы не являетесь лидером клана!");
		
	end
	
end

function RemoveMember(playerid, id, tag)

	if GetPlayerLeaderClan(playerid) == true then
	
		if GetPlayerName(playerid) ~= ("|"..tag.."|" .. Clan[tag].Member.Name[id]) then
		
			if id ~= 1 then
		
				if GetIdByName("|"..tag.."|" .. Clan[tag].Member.Name[id]) ~= -1 then
					
					SetPlayerName(GetIdByName("|"..tag.."|" .. Clan[tag].Member.Name[id]), HideTag(GetIdByName("|"..tag.."|" .. Clan[tag].Member.Name[id])));
					Player[GetIdByName(Clan[tag].Member.Name[id])].Clan = nil;
					HideClanInfo(GetIdByName(Clan[tag].Member.Name[id]));
					SendPlayerMessage(GetIdByName(Clan[tag].Member.Name[id]), 255, 255, 0, "Вы выгнали из клана"..Clan[tag].Info.Name.."");
					
				end
				
				table.remove(Clan[tag].Member.Name, id);
				table.remove(Clan[tag].Member.Lvl, id);
				DestroyDraw(Clan[tag].Draw.Member.Member[id]);
				DestroyDraw(Clan[tag].Draw.Member.Rank[id]);
				table.remove(Clan[tag].Draw.Member.Member, id);
				table.remove(Clan[tag].Draw.Member.Rank, id);
				UpdateClanInfo( tag );
				UpdateMember( tag );
				SaveMembers(tag);
			
			else
		
				SendPlayerMessage(playerid, 255, 0, 0, "Вы не можете исключить лидера!");
			
			end
		
		else
		
			SendPlayerMessage(playerid, 255, 0, 0, "Вы не можете исключить самого себя!");
			
		end
	
	else
	
		SendPlayerMessage(playerid, 255, 0, 0, "Вы не являетесь лидером клана!");
		
	end
	
end

function FindMember(_table, member_name)

	for i = 1, #_table do
	
		if _table[i] == member_name then
		
			return i;
		
		end
	
	end

end

function CreateClan(leaderid, name, tag)

	if CheckExistClan(name, tag) == false then

		Clan[tag] = InitClan();
		table.insert(Clan[tag].Member.Name, GetPlayerName(leaderid));
		table.insert(Clan[tag].Member.Lvl, GetPlayerLevel(leaderid));
		Clan[tag].Leader = GetPlayerName(leaderid);
		Clan[tag].Info.Name = name;
		Player[leaderid].Clan = tag;
		SetPlayerName(leaderid, "|"..tag.."|"..GetPlayerName(leaderid));
		AddClan(tag);
		SaveClan(tag);
		CreateClanDraws( tag );
		SendPlayerMessage(leaderid, 0, 255, 0, "Клан успешно создан.");
		
	else
	
		SendPlayerMessage(leaderid, 255, 255, 0, "Клан с таким именем/клан-тегом уже существует!");
	
	end
	
end

function CreateClanDraws( tag )
	
	Clan[tag].Draw.DisplayName = CreateDraw(150, 6950, ""..Clan[tag].Info.Name.."", "Font_Old_10_White_Hi.TGA", 255, 255, 0);
	Clan[tag].Draw.Lvl = CreateDraw(3600, 2600, ""..GetClanLvl( tag ).."", "Font_Old_10_White_Hi.TGA", 255, 255, 255);
	Clan[tag].Draw.Rank = CreateDraw(3900, 2800, ""..Clan[tag].Rank.."", "Font_Old_10_White_Hi.TGA", 255, 255, 255);
	Clan[tag].Draw.Leader = CreateDraw(3050, 3000, ""..Clan[tag].Leader.."", "Font_Old_10_White_Hi.TGA", 255, 255, 255);
	Clan[tag].Draw.Tag = CreateDraw(3000, 3200, "|"..tag.."|", "Font_Old_10_White_Hi.TGA", 255, 255, 255);
	Clan[tag].Draw.Name = CreateDraw(3150, 3400, ""..Clan[tag].Info.Name.."", "Font_Old_10_White_Hi.TGA", 255, 255, 255);
	Clan[tag].Draw.AmountMember = CreateDraw(3750, 3600, ""..#Clan[tag].Member.Name.."", "Font_Old_10_White_Hi.TGA", 255, 255, 255);
	
	for i = 1, #Clan[tag].Member.Name do
	
		table.insert(Clan[tag].Draw.Member.Member, CreateDraw(4350, 3050 + GetY( #Clan[tag].Member.Name ), ""..Clan[tag].Member.Name[#Clan[tag].Member.Name].."", "Font_Old_10_White_Hi.TGA", 255, 255, 255));
		table.insert(Clan[tag].Draw.Member.Rank, CreateDraw(5100, 3050 + GetY( #Clan[tag].Member.Name ), "недостаточно.", "Font_Old_10_White_Hi.TGA", 255, 255, 255));
		
	end

end

function UpdateClanInfo( tag )

	UpdateDraw(Clan[tag].Draw.Lvl, 3600, 2600, ""..GetClanLvl( tag ).."", "Font_Old_10_White_Hi.TGA", 255, 255, 255);
	UpdateDraw(Clan[tag].Draw.AmountMember, 3750, 3600, ""..#Clan[tag].Member.Name.."", "Font_Old_10_White_Hi.TGA", 255, 255, 255);

end

function UpdateMember( tag )
	
	for i = 1, #Clan[tag].Member.Name do
	
		UpdateDraw(Clan[tag].Draw.Member.Member[i], 4350, 3050 + GetY( i ), ""..Clan[tag].Member.Name[i].."", "Font_Old_10_White_Hi.TGA", 255, 255, 255);
		UpdateDraw(Clan[tag].Draw.Member.Rank[i], 5100, 3050 + GetY( i ), "недостаточно.", "Font_Old_10_White_Hi.TGA", 255, 255, 255);
		
	end

end


function ShowClanInfo(playerid)

	if CheckPlayerClan(playerid) == true then

		ShowTexture(playerid, ClanInfoText);
		ShowDraw(playerid, ClanInfo);
		ShowDraw(playerid, MemberDraw);
		ShowDraw(playerid, NickDraw);
		ShowDraw(playerid, RankDraw);
		ShowDraw(playerid, LvlDraw);
		ShowDraw(playerid, RankClanDraw);
		ShowDraw(playerid, LeaderDraw);
		ShowDraw(playerid, TagDraw);
		ShowDraw(playerid, NameDraw);
		ShowDraw(playerid, AmountMember);
		ShowDraw(playerid, EnemyDraw);
		ShowDraw(playerid, AlianceDraw);
		ShowDraw(playerid, Clan[Player[playerid].Clan].Draw.Lvl);
		ShowDraw(playerid, Clan[Player[playerid].Clan].Draw.Rank);
		ShowDraw(playerid, Clan[Player[playerid].Clan].Draw.Leader);
		ShowDraw(playerid, Clan[Player[playerid].Clan].Draw.Tag);
		ShowDraw(playerid, Clan[Player[playerid].Clan].Draw.Name);
		ShowDraw(playerid, Clan[Player[playerid].Clan].Draw.AmountMember);
		
		for i = 1, #Clan[Player[playerid].Clan].Member.Name do
		
			ShowDraw(playerid, Clan[Player[playerid].Clan].Draw.Member.Member[i]);
			ShowDraw(playerid, Clan[Player[playerid].Clan].Draw.Member.Rank[i]);
			
		end
	
	end

end

function HideClanInfo(playerid)

	if CheckPlayerClan(playerid) == true then
	
		HideTexture(playerid, ClanInfoText);
		HideDraw(playerid, ClanInfo);
		HideDraw(playerid, MemberDraw);
		HideDraw(playerid, NickDraw);
		HideDraw(playerid, RankDraw);
		HideDraw(playerid, LvlDraw);
		HideDraw(playerid, RankClanDraw);
		HideDraw(playerid, LeaderDraw);
		HideDraw(playerid, TagDraw);
		HideDraw(playerid, NameDraw);
		HideDraw(playerid, AmountMember);
		HideDraw(playerid, EnemyDraw);
		HideDraw(playerid, AlianceDraw);
		HideDraw(playerid, Clan[Player[playerid].Clan].Draw.Lvl);
		HideDraw(playerid, Clan[Player[playerid].Clan].Draw.Rank);
		HideDraw(playerid, Clan[Player[playerid].Clan].Draw.Leader);
		HideDraw(playerid, Clan[Player[playerid].Clan].Draw.Tag);
		HideDraw(playerid, Clan[Player[playerid].Clan].Draw.Name);
		HideDraw(playerid, Clan[Player[playerid].Clan].Draw.AmountMember);
		
		for i = 1, #Clan[Player[playerid].Clan].Member.Name do
		
			HideDraw(playerid, Clan[Player[playerid].Clan].Draw.Member.Member[i]);
			HideDraw(playerid, Clan[Player[playerid].Clan].Draw.Member.Rank[i]);
			
		end
		
	end
	
end

function OnPlayerKey(playerid, keyDown, keyUp)
	
		if keyDown == KEY_F11 then 
			ShowClanInfo(playerid); -- nie chce mi sieeeeeee myslec <#
		elseif keyDown == KEY_F12 then
			HideClanInfo(playerid);
		end
	end				
					
function CheckExistClan(name, tag)

	if Clan[tag] == nil then
	
	--	if Clan[tag].Info.Name ~=
	
		return false;
	
	else
	
		return true;
	
	end

end

function CheckPlayerClan(playerid)

	if Player[playerid].Clan ~= nil then
	
		return true;
	
	end
	
	return false;

end

-- Save and Read

function ReadAllClan()

	local FileRead = io.open("Clans//list.db","r+");
	
	if FileRead then
	
		for line in FileRead:lines() do
		
			Clan[line] = InitClan();
			ReadClan(line);
		
		end
		
		FileRead:close();
		
	end

end

function ReadClan(tag)
	
	local FileRead = io.open("Clans//Info//"..tag..".db","r+");
	
	local tempvar = FileRead:read("*a"); -- Leader
	local result, empty, info = sscanf(tempvar, "ss");
	
	if result == 1 then
		
		Clan[tag].Leader = info;
	
	end
	
	tempvar = FileRead:read("*l"); -- Rank
	result, empty, info = sscanf(tempvar, "ss");
	
	if result == 1 then
	
		Clan[tag].Rank = info;
	
	end
	
	tempvar = FileRead:read("*l"); -- Name
	result, empty, info = sscanf(tempvar, "ss");
	
	if result == 1 then
	
		Clan[tag].Info.Name = info;
	
	end
	
	FileRead:close();
	
	FileRead = io.open("Clans//Members//"..tag..".db","r+");
	
	local i = 1;
	for line in FileRead:lines() do
		
		Clan[tag].Member.Name[i] = line;
		i = i + 1;
		
	end
	
	FileRead:close();
	
	FileRead = io.open("Clans//Members//"..tag.."_Lvl.db","r+");
	
	local i = 1;
	for line in FileRead:lines() do
		
		Clan[tag].Member.Lvl[i] = line;
		i = i + 1;
		
	end
	
	FileRead:close();
	
	FileRead = io.open("Clans//Info//"..tag.."_Enemy.db","r+");
	
	local i = 1;
	for line in FileRead:lines() do
		
		Clan[tag].Status.Enemy[i] = line;
		i = i + 1;
		
	end
	
	FileRead:close();
	
	FileRead = io.open("Clans//Info//"..tag.."_Aliance.db","r+");
	
	local i = 1;
	for line in FileRead:lines() do
		
		Clan[tag].Status.Aliance[i] = line;
		i = i + 1;
		
	end
	
	FileRead:close();
	
end

function AddClan(tag)

	local FileWrite = io.open("Clans//list.db","a+");
	
	FileWrite:write(tag.."\n");
	
	FileWrite:close();

end

function SaveClan(tag)

	SaveInfo(tag);
	SaveMembers(tag);
	SaveEnemy(tag);
	SaveAliance(tag);
	
end

function SaveInfo(tag)

	local FileWrite = io.open("Clans//Info//"..tag..".db","w+");
	
	FileWrite:write("Leader: "..Clan[tag].Leader.."\n");
	FileWrite:write("Rank: "..Clan[tag].Rank.."\n");
	FileWrite:write("Name: "..Clan[tag].Info.Name.."\n");
	
	FileWrite:close();
	
end

function SaveMembers(tag)

	local FileWrite = io.open("Clans//Members//"..tag..".db","w+");
	
	for i = 1, #Clan[tag].Member do
	
		FileWrite:write(Clan[tag].Member.Name[i].."\n");
		
	end
	
	FileWrite:close();
	
	FileWrite = io.open("Clans//Members//"..tag.."_Lvl.db","w+");
	
	for i = 1, #Clan[tag].Member do
	
		FileWrite:write(Clan[tag].Member.Lvl[i].."\n");
		
	end
	
	FileWrite:close();

end

function SaveEnemy(tag)

	local FileWrite = io.open("Clans//Info//"..tag.."_Enemy.db","w+");
	
	for i = 1, #Clan[tag].Status.Enemy do
	
		FileWrite:write(Clan[tag].Status.Enemy[i].."\n");
		
	end
	
	FileWrite:close();

end

function SaveAliance(tag)

	local FileWrite = io.open("Clans//Info//"..tag.."_Aliance.db","w+");
	
	for i = 1, #Clan[tag].Status.Aliance do
	
		FileWrite:write(Clan[tag].Status.Aliance[i].."\n");
		
	end
	
	FileWrite:close();

end

-- Function
function ShowClanTable(playerid)

	for i = 1, #Clan[Player[playerid].Clan].Member.Name do
		
		SendPlayerMessage(playerid, 255, 255, 0, Clan[Player[playerid].Clan].Member.Name[i]);
		
	end
	
end

function GetClanLvl( tag )
	
	local sumLvl = 0;
	
	for i = 1, #Clan[tag].Member.Lvl do
	
		sumLvl = sumLvl + Clan[tag].Member.Lvl[i];
		
		if i == #Clan[tag].Member.Lvl then
		
			return math.ceil(sumLvl/i);
			
		end
	
	end

end

function GetPlayerLeaderClan(playerid)
	
	if GetPlayerClan(playerid) ~= nil then
		
		if Clan[GetPlayerClan(playerid)].Leader == HideTag(playerid) then
		
			return true;
		
		end
	
	end
	
	return false;
	
end

function SetPlayerClan(playerid, clan)

	Player[playerid].Clan = clan;

end

function GetPlayerClan(playerid)

local Clan = Player[playerid].Clan;

end

function HideTag(playerid)
	
	if CheckPlayerClan(playerid) == true then
		
		local nick = string.gsub(GetPlayerName(playerid), "|"..GetPlayerClan(playerid).."|", "");
		
		return nick;
		
	else
	
		return GetPlayerName(playerid);
		
	end

end

function GetIdByName(name)
		if type(name) == "string" then
				for i = 0, GetMaxSlots() - 1 do
					if IsPlayerConnected(i) == 1 then
						if GetPlayerName(i) == name then
								return i --Zwraca id
						elseif i == GetMaxSlots() - 1 then
								return -1 --Zwraca -1 - fail
						end
					end
				end
		else
				return -1 -- -1, jw
		end
end 

function GetY( member_amount )

	return (member_amount - 1) * 200;

end