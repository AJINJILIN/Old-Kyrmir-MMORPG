-----------------
-- Menu
-----------------

local Dialog_texture = CreateTexture(1800, 2550, 6500, 4000, "Frame_GMPA.TGA");
local Ja_Draw = CreateDraw(2000, 2450, "ß", "Font_Old_20_White_Hi.TGA", 255, 255, 255);
local Player = {};

function newPlayerMenu()

	local Menu = {};
	
	Menu.ActiveMenu = 0;
	Menu.Dialog = 0;
	Menu.ActiveDialog = nil;
	Menu.Menu = nil;
	Menu.ShowMenuOn = false;
	
	return Menu;

end

function Menu_OnPlayerConnect(playerid)

	Player[playerid] = newPlayerMenu();
	
end

function CreateMenu(amount_menu, end_menu, texture, x, y, type_text, distance, r, g, b, r_on, g_on, b_on, file)
	
	if file and type ( file ) == "string" then
	
		local Menu = { option = {}, option_On = {} };
		
		local File = io.open("NPC_Lib//Menu//"..file..".npc","r+");
		
		if File then
			
			for i = 0, amount_menu - 1 do
			
				tempvar = File:read("*l");
				local result, menu_text = sscanf(tempvar, "s");
				
				if result == 1 then

					Menu.option[i] = CreateDraw(x, y, ""..menu_text.."", type_text, r, g, b);
					Menu.option_On[i] = CreateDraw(x, y, ""..menu_text.."", type_text, r_on, g_on, b_on);
					
					y = y + distance;
					
				else
					
					return false;
					
				end
				
			end
			
			Menu.option[amount_menu] = CreateDraw(x, y, ""..end_menu.."", type_text, r, g, b);
			Menu.option_On[amount_menu] = CreateDraw(x, y, ""..end_menu.."", type_text, r_on, g_on, b_on);
			
			Menu.texture = texture;
			
			File:close();
			
			return Menu;
			
		else
			
			print("Can't create menu, on file",file);
			return false;
			
		end
		
	else
	
		print("Can't create menu, on file",file);
		return false;
		
	end
	
end


function ShowMenu(playerid, menu)

	Player[playerid].ActiveMenu = 0;

	ShowTexture(playerid, menu.texture);
	
	ShowDraw(playerid, menu.option_On[0]);
	for i = 1, #menu.option - 1 do
		ShowDraw(playerid, menu.option[i]);
	end
	
	ShowDraw(playerid, menu.option[#menu.option]);
	
	OnPlayerUseMenu(playerid, Player[playerid].ActiveMenu);

end

function HideMenu(playerid, menu)

	HideTexture(playerid, menu.texture);
	
	for i = 0, #menu.option do
		HideDraw(playerid, menu.option[i]);
		HideDraw(playerid, menu.option_On[i]);
	end

end

function HideMenuDraws(playerid, menu)
	
	for i = 0, #menu.option do
		HideDraw(playerid, menu.option[i]);
		HideDraw(playerid, menu.option_On[i]);
	end

end

function SwitchDownMenu(playerid, menu)

	Player[playerid].ActiveMenu = Player[playerid].ActiveMenu + 1;
	
	if Player[playerid].ActiveMenu <= #menu.option then
	
		if Player[playerid].ActiveMenu > 0 then
		
			HideDraw(playerid, menu.option_On[Player[playerid].ActiveMenu - 1]);
			ShowDraw(playerid, menu.option[Player[playerid].ActiveMenu - 1]);
			
		end
		
		HideDraw(playerid, menu.option[Player[playerid].ActiveMenu]);
		ShowDraw(playerid, menu.option_On[Player[playerid].ActiveMenu]);
		
		OnPlayerUseMenu(playerid, Player[playerid].ActiveMenu);
	
	else
		
		Player[playerid].ActiveMenu = #menu.option;
		
	end
	
end

function SwitchUpMenu(playerid, menu)

	Player[playerid].ActiveMenu = Player[playerid].ActiveMenu - 1;
	
	if Player[playerid].ActiveMenu >= 0 then
	
		if Player[playerid].ActiveMenu < #menu.option then
		
			HideDraw(playerid, menu.option_On[Player[playerid].ActiveMenu + 1]);
			ShowDraw(playerid, menu.option[Player[playerid].ActiveMenu + 1]);
			
		end
		
		HideDraw(playerid, menu.option[Player[playerid].ActiveMenu]);
		ShowDraw(playerid, menu.option_On[Player[playerid].ActiveMenu]);
		
		OnPlayerUseMenu(playerid, Player[playerid].ActiveMenu);
	
	else
		
		Player[playerid].ActiveMenu = 0;
		
	end
	
end

function GetMenuMaxOptions(menu)
	
	return #menu.option;
	
end

function GetPlayerActiveMenu(playerid, menu)

	return Player[playerid].ActiveMenu;

end

function OnPlayerUseMenu(playerid, active_menu)
end

-----------------
-- Dialog
-----------------

local Dialog_TimerID = {};

function CreateDialog(file, npc_name)
	
	local DialogNew = {};
	DialogNew.dialog = {};
	DialogNew.name = {};
	DialogNew.page = {};
	DialogNew.time = {};
	local i = 0;
	local j = 0;
	local y = 0;
	
	local File = io.open("NPC_Lib//Dialogs//"..file..".dlg","r+");
	
	if File then
		
		DialogNew.bot_name = CreateDraw(2000, 2450, ""..npc_name.."", "Font_Old_20_White_Hi.TGA", 255, 255, 255);
		
		while true do
			
			tempvar = File:read("*l");
			local result, dialog_line = sscanf(tempvar, "s");
			
			if dialog_line == "[NEXT]" then
			
				y = 0;
				DialogNew.page[j] = #DialogNew.dialog;
				
				j = j + 1;
				
			elseif dialog_line == "[END]" then
				
				DialogNew.page[j] = #DialogNew.dialog;
				break;
				
			else
			
				DialogNew.dialog[i] = CreateDraw(2000, 2750 + y, ""..dialog_line.."", "Font_Old_10_White_Hi.TGA", 255, 255, 255);
				y = y + 200;
				
				i = i + 1;
				
			end
		
		end
	
	for g = 0, #DialogNew.page do	
	
		tempvar = File:read("*l");
		local result, milisecond, npc = sscanf(tempvar, "ds");	
		DialogNew.time[g] = milisecond;
		if npc == "Ja" then
			DialogNew.name[g] = true;
		elseif npc == "NPC" then
			DialogNew.name[g] = false;
		else
			print("Can't create dialog. Name ",npc," isn't Ja or NPC");
			return false;
		end
		
	end
	
	File:close();
	
	return DialogNew;
	
	else
		
		print("Can't create dialog. On file "..file);
		return false;
		
	end
	
end

function DialogStart(playerid, dialog, menu, switch_menu, dialog_id)
	
	ShowTexture(playerid, Dialog_texture);
	Player[playerid].Dialog = dialog_id;
	Player[playerid].ActiveDialog = dialog;
	Player[playerid].Menu = menu;
	Player[playerid].ShowMenuOn = switch_menu;
	DialogActive(playerid);
	
end

function DialogActive(playerid)
	
	if Player[playerid].Dialog > 0 then
	
		if Player[playerid].Dialog == 1 then
		
			if Player[playerid].ActiveDialog.name[Player[playerid].Dialog - 1] ~= Player[playerid].ActiveDialog.name[Player[playerid].Dialog] then
				
				if Player[playerid].ActiveDialog.name[Player[playerid].Dialog - 1] == true then
		
					HideDraw(playerid, Ja_Draw);
					
				else
				
					HideDraw(playerid, Player[playerid].ActiveDialog.bot_name);
				
				end
			
			end
			
			for j = 0, Player[playerid].ActiveDialog.page[Player[playerid].Dialog - 1] do
				
				HideDraw(playerid, Player[playerid].ActiveDialog.dialog[j]);
			
			end
			
		else
		
			if Player[playerid].ActiveDialog.name[Player[playerid].Dialog - 1] ~= Player[playerid].ActiveDialog.name[Player[playerid].Dialog] then
				
				if Player[playerid].ActiveDialog.name[Player[playerid].Dialog - 1] == true then
		
					HideDraw(playerid, Ja_Draw);
					
				else
				
					HideDraw(playerid, Player[playerid].ActiveDialog.bot_name);
				
				end
			
			end
			
			for j = Player[playerid].ActiveDialog.page[Player[playerid].Dialog - 2] + 1, Player[playerid].ActiveDialog.page[Player[playerid].Dialog - 1] do
				
				HideDraw(playerid, Player[playerid].ActiveDialog.dialog[j]);
			
			end
		
		end
		
		if Player[playerid].Dialog <= #Player[playerid].ActiveDialog.time then
		
			if Player[playerid].ActiveDialog.name[Player[playerid].Dialog - 1] ~= Player[playerid].ActiveDialog.name[Player[playerid].Dialog] then
				
				if Player[playerid].ActiveDialog.name[Player[playerid].Dialog] == true then
		
					ShowDraw(playerid, Ja_Draw);
					PlayGesticulation(playerid);
					
				else
				
					ShowDraw(playerid, Player[playerid].ActiveDialog.bot_name);
				
				end
			
			end
			
			for i = Player[playerid].ActiveDialog.page[Player[playerid].Dialog - 1] + 1, Player[playerid].ActiveDialog.page[Player[playerid].Dialog] do
				
				ShowDraw(playerid, Player[playerid].ActiveDialog.dialog[i]);
				
			end
		
		end
		
	else
		
		if Player[playerid].ActiveDialog.name[Player[playerid].Dialog] == true then
		
			ShowDraw(playerid, Ja_Draw);
			PlayGesticulation(playerid);
			
		else
		
			ShowDraw(playerid, Player[playerid].ActiveDialog.bot_name);
		
		end
		
		for i = 0, Player[playerid].ActiveDialog.page[Player[playerid].Dialog] do

			ShowDraw(playerid, Player[playerid].ActiveDialog.dialog[i]);
			
		end
	
	end
	
	if Player[playerid].Dialog <= #Player[playerid].ActiveDialog.time then
	
		OnPlayerDialog(playerid, Player[playerid].Dialog);
		
		Dialog_TimerID[playerid] = SetTimerEx("DialogActive", Player[playerid].ActiveDialog.time[Player[playerid].Dialog], 0, playerid);
		Player[playerid].Dialog = Player[playerid].Dialog + 1;
		
	else
	
		HideTexture(playerid, Dialog_texture);
		
		if Player[playerid].ShowMenuOn == 1 then
		
			ShowMenu(playerid, Player[playerid].Menu);
			
		end
		
		Player[playerid].ShowMenuOn = -1;
		Player[playerid].Menu = nil;
		Player[playerid].ActiveDialog = nil;
		Player[playerid].Dialog = 0;
		Dialog_TimerID[playerid] = -1;
		OnPlayerEndDialog(playerid);
		
	end

end

function ScrollDialog(playerid)

	if Player[playerid].ActiveDialog ~= nil then
		KillTimer(Dialog_TimerID[playerid]);
		DialogActive(playerid);
	end

end

function OnPlayerDialog(playerid, dialog_id)
end

function OnPlayerEndDialog(playerid)
end