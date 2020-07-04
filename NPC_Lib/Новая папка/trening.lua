require "NPC_Lib/npc-framework" -- NPC Lib

local trening_5 = {
	{ player_h = 5, cost = 1000 },
	{ player_h = 10, cost = 1250},
	{ player_h = 15, cost = 1350 },
	{ player_h = 20, cost = 1455 },
	{ player_h = 25, cost = 1555 },
	{ player_h = 30, cost = 1600 },
	{ player_h = 35, cost = 2100 },
	{ player_h = 40, cost = 2400 },
	{ player_h = 45, cost = 3000 },
	{ player_h = 50, cost = 3700 },
	{ player_h = 55, cost = 4000 },
	{ player_h = 60, cost = 11000 },
	{ player_h = 65, cost = 13500 },
	{ player_h = 70, cost = 14000 },
	{ player_h = 75, cost = 14955 },
	{ player_h = 80, cost = 15500 },
	{ player_h = 85, cost = 16000 },
	{ player_h = 90, cost = 20000 },
	{ player_h = 95, cost = 30000 },
	{ player_h = 100, cost = 50000 },
	{ player_h = 105, cost = 50000 },
	{ player_h = 110, cost = 50000 },
}

local trening_10 = {
	{ player_h = 10, cost = 1250 },
	{ player_h = 20, cost = 2100 },
	{ player_h = 30, cost = 2900 },
	{ player_h = 40, cost = 4500 },
	{ player_h = 50, cost = 6700 },
	{ player_h = 60, cost = 8800 },
	{ player_h = 70, cost = 13000 },
	{ player_h = 80, cost = 21000 },
	{ player_h = 90, cost = 36000 },
	{ player_h = 100, cost = 80000 },
	{ player_h = 110, cost = 80000 },
}

local trening_stat = {
	{ player_h = 20, cost = 500 },
	{ player_h = 30, cost = 900 },
	{ player_h = 40, cost = 1400 },
	{ player_h = 50, cost = 1800 },
	{ player_h = 60, cost = 2600 },
	{ player_h = 70, cost = 5000 },
	{ player_h = 80, cost = 8000 },
	{ player_h = 90, cost = 12000 },
	{ player_h = 100, cost = 15000 },
	{ player_h = 110, cost = 20000 },
	{ player_h = 120, cost = 28000 },
	{ player_h = 130, cost = 40000 },
	{ player_h = 140, cost = 60000 },
	{ player_h = 150, cost = 100000 },
	{ player_h = 160, cost = 150000 },
	{ player_h = 170, cost = 200000 },
	{ player_h = 180, cost = 250000 },
	{ player_h = 190, cost = 300000 },
	{ player_h = 200, cost = 350000 },
	{ player_h = 210, cost = 400000 },
	{ player_h = 220, cost = 450000 },
	{ player_h = 230, cost = 550000 },
	{ player_h = 240, cost = 650000 },
	{ player_h = 250, cost = 800000 },
	{ player_h = 260, cost = 850000 },
	{ player_h = 270, cost = 950000 },
	{ player_h = 280, cost = 1050000 },
	{ player_h = 290, cost = 1100000 },
	{ player_h = 300, cost = 1200000 },
}

local trening_stat_5 = {
	{ player_h = 15, cost = 100 },
	{ player_h = 20, cost = 250 },
	{ player_h = 25, cost = 250 },
	{ player_h = 30, cost = 450 },
	{ player_h = 35, cost = 450 },
	{ player_h = 40, cost = 700 },
	{ player_h = 45, cost = 700 },
	{ player_h = 50, cost = 900 },
	{ player_h = 55, cost = 900 },
	{ player_h = 60, cost = 1300 },
	{ player_h = 65, cost = 1300 },
	{ player_h = 70, cost = 2500 },
	{ player_h = 75, cost = 2500 },
	{ player_h = 80, cost = 4000 },
	{ player_h = 85, cost = 4000 },
	{ player_h = 90, cost = 6000 },
	{ player_h = 95, cost = 6000 },
	{ player_h = 100, cost = 7500 },
	{ player_h = 105, cost = 7500 },
	{ player_h = 110, cost = 10000 },
	{ player_h = 115, cost = 10000 },
	{ player_h = 120, cost = 14000 },
	{ player_h = 125, cost = 14000 },
	{ player_h = 130, cost = 20000 },
	{ player_h = 135, cost = 20000 },
	{ player_h = 140, cost = 30000 },
	{ player_h = 145, cost = 30000 },
	{ player_h = 150, cost = 50000 },
	{ player_h = 155, cost = 50000 },
	{ player_h = 160, cost = 75000 },
	{ player_h = 165, cost = 75000 },
	{ player_h = 170, cost = 100000 },
	{ player_h = 175, cost = 100000 },
	{ player_h = 180, cost = 125000 },
	{ player_h = 185, cost = 125000 },
	{ player_h = 190, cost = 150000 },
	{ player_h = 195, cost = 150000 },
	{ player_h = 200, cost = 175000 },
	{ player_h = 205, cost = 175000 },
	{ player_h = 210, cost = 200000 },
	{ player_h = 215, cost = 200000 },
	{ player_h = 220, cost = 225000 },
	{ player_h = 225, cost = 225000 },
	{ player_h = 230, cost = 275000 },
	{ player_h = 235, cost = 275000 },
	{ player_h = 240, cost = 325000 },
	{ player_h = 245, cost = 325000 },
	{ player_h = 250, cost = 390000 },
	{ player_h = 255, cost = 400000 },
	{ player_h = 260, cost = 420000 },
	{ player_h = 265, cost = 420000 },
	{ player_h = 270, cost = 480000 },
	{ player_h = 275, cost = 480000 },
	{ player_h = 280, cost = 520000 },
	{ player_h = 285, cost = 520000 },
	{ player_h = 290, cost = 550000 },
	{ player_h = 295, cost = 550000 },
	{ player_h = 300, cost = 600000 },
}

local Cost_Trophy = {
	{ name = "Pazury", cost = 100 },
	{ name = "Zuwaczki", cost = 100 },
	{ name = "Plyty", cost = 200 },
	{ name = "Skora", cost = 400 },
	{ name = "Kly", cost = 500 },
	{ name = "Rog", cost = 10000 },
	{ name = "Serca", cost = 1000 },
	{ name = "Jezyki", cost = 200 },
	{ name = "Krew", cost = 500 },
	{ name = "Luski", cost = 500 },
	{ name = "Kosci", cost = 300 },
	{ name = "Glowy", cost = 300 },
}

function Set1H( playerid, amount, tren )
	
	if GetCost( GetSkillWeapon(playerid, 1) + amount, tren ) <= GetPlayerGold(playerid) then
		
		if (GetSkillWeapon(playerid, 1) + amount) <= 100 then
			
			if GetLP( playerid ) >= amount then
			
				SetSkillWeapon(playerid, 1, GetSkillWeapon(playerid, 1) + amount);
				SetLP(playerid, GetLP( playerid ) - amount);
				GameTextForPlayer(playerid, 3400, 3500, "Навык одноручного оружия +"..amount.."","Font_Old_20_White_Hi.TGA", 255, 255, 255, 500);
				RemoveItem( playerid, "ITMI_GOLD", GetCost( GetSkillWeapon(playerid, 1), tren ));
				DestroyItemPlayerAmount(playerid, "ITMI_GOLD", GetCost( GetSkillWeapon(playerid, 1), tren ));
				UpdatePlayerDraw_Stat(playerid, "Skill");
				return GetSkillWeapon(playerid, 1);
				
			else
			
				GameTextForPlayer(playerid, 2800, 3500, "Недостаточно очков обучения.","Font_Old_20_White_Hi.TGA", 255, 255, 255, 500);
				return GetSkillWeapon(playerid, 1);
			
			end
			
		else
		
			GameTextForPlayer(playerid, 2800, 3500, "Я не могу Вас больше ничему обучить.","Font_Old_20_White_Hi.TGA", 255, 255, 255, 500);
			UpdatePlayerDraw100(playerid);
			return GetSkillWeapon(playerid, 1);
			
		end
		
	else

		GameTextForPlayer(playerid, 3400, 3500, "Недостаточно золота.", "Font_Old_20_White_Hi.TGA", 255, 255, 255, 500);
		return GetSkillWeapon(playerid, 1);
		
	end

end

function Set2H( playerid, amount, tren )

	if GetCost( GetSkillWeapon(playerid, 2) + amount, tren ) <= GetPlayerGold(playerid) then
		
		if (GetSkillWeapon(playerid, 2) + amount) <= 100 then
			
			if GetLP( playerid ) >= amount then
			
				SetSkillWeapon(playerid, 2, GetSkillWeapon(playerid, 2) + amount);
				SetLP(playerid, GetLP( playerid ) - amount);
				GameTextForPlayer(playerid, 3400, 3500, "Навык двуручного оружия +"..amount.."","Font_Old_20_White_Hi.TGA", 255, 255, 255, 500);
				RemoveItem( playerid, "ITMI_GOLD", GetCost( GetSkillWeapon(playerid, 2), tren ));
				DestroyItemPlayerAmount(playerid, "ITMI_GOLD", GetCost( GetSkillWeapon(playerid, 2), tren ));
				UpdatePlayerDraw_Stat(playerid, "Skill");
				return GetSkillWeapon(playerid, 2);
				
			else
			
				GameTextForPlayer(playerid, 2800, 3500, "Недостаточно очков опыта.","Font_Old_20_White_Hi.TGA", 255, 255, 255, 500);
				return GetSkillWeapon(playerid, 2);
			
			end
			
		else
		
			GameTextForPlayer(playerid, 2800, 3500, "Я не могу Вас больше ничему обучить.","Font_Old_20_White_Hi.TGA", 255, 255, 255, 500);
			UpdatePlayerDraw100(playerid)
			return GetSkillWeapon(playerid, 2);
			
		end
		
	else

		GameTextForPlayer(playerid, 3400, 3500, "Недостаточно золота.", "Font_Old_20_White_Hi.TGA", 255, 255, 255, 500);
		return GetSkillWeapon(playerid, 2);
		
	end

end

function SetBow( playerid, amount, tren )

	if GetCost( GetSkillWeapon(playerid, 3) + amount, tren ) <= GetPlayerGold(playerid) then
		
		if (GetSkillWeapon(playerid, 3) + amount) <= 100 then
		
			if GetLP( playerid ) >= amount then
		
				SetSkillWeapon(playerid, 3, GetSkillWeapon(playerid, 3) + amount);
				SetLP(playerid, GetLP( playerid ) - amount);
				GameTextForPlayer(playerid, 3400, 3500, "Навык владения луком +"..amount.."","Font_Old_20_White_Hi.TGA", 255, 255, 255, 500);
				RemoveItem( playerid, "ITMI_GOLD", GetCost( GetSkillWeapon(playerid, 3), tren ));
				DestroyItemPlayerAmount(playerid, "ITMI_GOLD", GetCost( GetSkillWeapon(playerid, 3), tren ));
				UpdatePlayerDraw_Stat(playerid, "Skill");
				return GetSkillWeapon(playerid, 3);
			
			else
			
				GameTextForPlayer(playerid, 2800, 3500, "Недостаточно очков обучения.","Font_Old_20_White_Hi.TGA", 255, 255, 255, 500);
				UpdatePlayerDraw100(playerid);
				return GetSkillWeapon(playerid, 3);
			
			end
		
		else
		
			GameTextForPlayer(playerid, 2800, 3500, "Я не могу Вас больше ничему обучить.","Font_Old_20_White_Hi.TGA", 255, 255, 255, 500);
			return GetSkillWeapon(playerid, 3);
			
		end
		
	else

		GameTextForPlayer(playerid, 3400, 3500, "Недостаточно золота.", "Font_Old_20_White_Hi.TGA", 255, 255, 255, 500);
		return GetSkillWeapon(playerid, 3);
		
	end

end

function SetCBow( playerid, amount, tren )

	if GetCost( GetSkillWeapon(playerid, 4) + amount, tren ) <= GetPlayerGold(playerid) then
		
		if (GetSkillWeapon(playerid, 4) + amount) <= 100 then
		
			if GetLP( playerid ) >= amount then
		
				SetSkillWeapon(playerid, 4, GetSkillWeapon(playerid, 4) + amount);
				SetLP(playerid, GetLP( playerid ) - amount);
				GameTextForPlayer(playerid, 3400, 3500, "Навык владения арбалетом +"..amount.."","Font_Old_20_White_Hi.TGA", 255, 255, 255, 500);
				RemoveItem( playerid, "ITMI_GOLD", GetCost( GetSkillWeapon(playerid, 4), tren ));
				DestroyItemPlayerAmount(playerid, "ITMI_GOLD", GetCost( GetSkillWeapon(playerid, 4), tren ));
				UpdatePlayerDraw_Stat(playerid, "Skill");
				return GetSkillWeapon(playerid, 4);
				
			else
			
				GameTextForPlayer(playerid, 2800, 3500, "Недостаточно очков опыта.","Font_Old_20_White_Hi.TGA", 255, 255, 255, 500);
				UpdatePlayerDraw100(playerid);
				return GetSkillWeapon(playerid, 4);
			
			end
			
		else
		
			GameTextForPlayer(playerid, 2800, 3500, "Я не могу Вас больше ничему обучить.","Font_Old_20_White_Hi.TGA", 255, 255, 255, 500);
			return GetSkillWeapon(playerid, 4);
			
		end
		
	else

		GameTextForPlayer(playerid, 3400, 3500, "Недостаточно золота.", "Font_Old_20_White_Hi.TGA", 255, 255, 255, 500);
		return GetSkillWeapon(playerid, 4);
		
	end

end

function SetStr( playerid, amount, tren )

	if GetCost( GetStrength(playerid) + amount, tren ) <= GetPlayerGold(playerid) then
	
		if GetLP( playerid ) >= amount then
	
			SetStrength(playerid, GetStrength(playerid) + amount);
			SetLP(playerid, GetLP( playerid ) - amount);
			GameTextForPlayer(playerid, 3400, 3500, "Сила +"..amount.."","Font_Old_20_White_Hi.TGA", 255, 255, 255, 500);
			RemoveItem( playerid, "ITMI_GOLD", GetCost( GetStrength(playerid), tren ));
			DestroyItemPlayerAmount(playerid, "ITMI_GOLD", GetCost( GetStrength(playerid), tren ));
			UpdatePlayerDraw_Stat(playerid, "Statistic");
			return GetStrength(playerid);
		
		else
			
			GameTextForPlayer(playerid, 2800, 3500, "Недостаточно очков обучения.","Font_Old_20_White_Hi.TGA", 255, 255, 255, 500);
			return GetStrength(playerid);
			
		end
		
	else

		GameTextForPlayer(playerid, 3400, 3500, "Недостаточно золота.", "Font_Old_20_White_Hi.TGA", 255, 255, 255, 500);
		return GetStrength(playerid);
		
	end

end

function SetDex( playerid, amount, tren )

	if GetCost( GetDexterity(playerid) + amount, tren ) <= GetPlayerGold(playerid) then
	
		if GetLP( playerid ) >= amount then
	
			SetDexterity(playerid, GetDexterity(playerid) + amount);
			SetLP(playerid, GetLP( playerid ) - amount);
			GameTextForPlayer(playerid, 3400, 3500, "Ловкость +"..amount.."","Font_Old_20_White_Hi.TGA", 255, 255, 255, 500);
			RemoveItem( playerid, "ITMI_GOLD", GetCost( GetDexterity(playerid), tren ));
			DestroyItemPlayerAmount(playerid, "ITMI_GOLD", GetCost( GetDexterity(playerid), tren ));
			UpdatePlayerDraw_Stat(playerid, "Statistic");
			return GetDexterity(playerid);
		
		else
			
			GameTextForPlayer(playerid, 2800, 3500, "Недостаточно очков обучения.","Font_Old_20_White_Hi.TGA", 255, 255, 255, 500);
			return GetDexterity(playerid);
		
		end
		
	else

		GameTextForPlayer(playerid, 3400, 3500, "Недостаточно золота.", "Font_Old_20_White_Hi.TGA", 255, 255, 255, 500);
		return GetDexterity(playerid);
		
	end

end

function SetMana( playerid, amount, tren )

	if GetCost( GetMana(playerid) + amount, tren ) <= GetPlayerGold(playerid) then
	
	
		if GetLP( playerid ) >= amount then
	
			SetMana(playerid, GetMana(playerid) + amount);
			SetLP(playerid, GetLP( playerid ) - amount);
			GameTextForPlayer(playerid, 3400, 3500, "Мана +"..amount.."","Font_Old_20_White_Hi.TGA", 255, 255, 255, 500);
			RemoveItem( playerid, "ITMI_GOLD", GetCost( GetMana(playerid), tren ));
			DestroyItemPlayerAmount(playerid, "ITMI_GOLD", GetCost( GetMana(playerid), tren ));
			UpdatePlayerDraw_Stat(playerid, "Statistic");
			return GetMana(playerid);
		
		else
			
			GameTextForPlayer(playerid, 2800, 3500, "Недостаточно очков обучения.","Font_Old_20_White_Hi.TGA", 255, 255, 255, 500);
			return GetMana(playerid);
		
		end
		
	else

		GameTextForPlayer(playerid, 3400, 3500, "Недостаточно золота.", "Font_Old_20_White_Hi.TGA", 255, 255, 255, 500);
		return GetMana(playerid);
		
	end

end

function SetHealth( playerid, amount, tren )

	if GetCost( GetHealth(playerid) + amount, tren ) <= GetPlayerGold(playerid) then
	
		if GetLP( playerid ) >= amount then
	
			SetHealth(playerid, GetHealth(playerid) + amount);
			SetLP(playerid, GetLP( playerid ) - amount);
			GameTextForPlayer(playerid, 3400, 3500, "Жизненная энергия +"..amount.."","Font_Old_20_White_Hi.TGA", 255, 255, 255, 500);
			RemoveItem( playerid, "ITMI_GOLD", GetCost( GetHealth(playerid), tren ));
			DestroyItemPlayerAmount(playerid, "ITMI_GOLD", GetCost( GetHealth(playerid), tren ));
			UpdatePlayerDraw_Stat(playerid, "Statistic");
			return GetHealth(playerid);
		
		else
			
			GameTextForPlayer(playerid, 2800, 3500, "Недостаточно очков обучения.","Font_Old_20_White_Hi.TGA", 255, 255, 255, 500);
			return GetHealth(playerid);
		
		end
		
	else

		GameTextForPlayer(playerid, 3400, 3500, "Недостаточно золота.", "Font_Old_20_White_Hi.TGA", 255, 255, 255, 500);
		return GetHealth(playerid);
		
	end

end

function SetMagicLvl( playerid, amount, tren )

	if GetCost( GetMagicLevel(playerid) + amount, tren ) <= GetPlayerGold(playerid) then
	
		if GetLP( playerid ) >= amount then
	
			SetMagicLevel(playerid, GetMagicLevel(playerid) + amount);
			SetLP(playerid, GetLP( playerid ) - amount);
			GameTextForPlayer(playerid, 3400, 3500, "Круг магии "..Player[playerid].magic_lvl.."","Font_Old_20_White_Hi.TGA", 255, 255, 255, 500);
			RemoveItem( playerid, "ITMI_GOLD", GetCost( GetMagicLevel(playerid), tren ));
			DestroyItemPlayerAmount(playerid, "ITMI_GOLD", GetCost( GetMagicLevel(playerid), tren ));
			UpdatePlayerDraw_Stat(playerid, "Statistic");
			return GetMagicLevel(playerid);
		
		else
			
			GameTextForPlayer(playerid, 2800, 3500, "Недостаточно очков обучения.","Font_Old_20_White_Hi.TGA", 255, 255, 255, 500);
			return GetMagicLevel(playerid);
		
		end
		
	else

		GameTextForPlayer(playerid, 3400, 3500, "Недостаточно золота.", "Font_Old_20_White_Hi.TGA", 255, 255, 255, 500);
		return GetMagicLevel(playerid);
		
	end

end

----------------

function SetPlayerStatistic(playerid, trening, value)

	SetPlayerLearnPoints(playerid, GetLP( playerid ));

	if trening == "Skill_1H" then
	
		SetPlayerSkillWeapon(playerid, SKILL_1H, value);
	
	elseif trening == "Skill_2H" then
	
		SetPlayerSkillWeapon(playerid, SKILL_2H, value);
	
	elseif trening == "Skill_Bow" then
		
		SetPlayerSkillWeapon(playerid, SKILL_BOW, value);
	
	elseif trening == "Skill_CBow" then
	
		SetPlayerSkillWeapon(playerid, SKILL_CBOW, value);
	
	elseif trening == "Str" then
	
		SetPlayerStrength(playerid, value);
	
	elseif trening == "Dex" then
	
		SetPlayerDexterity(playerid, value);
	
	elseif trening == "Mana" then
	
		SetPlayerMana(playerid, value);
	
	elseif trening == "Health" then
	
		SetPlayerHealth(playerid, value);
	
	elseif trening == "MagicLvl" then
	
		SetPlayerMagicLevel(playerid, value);
	
	end

end

function GetGoldItem( playerid, trening, tren )

	if trening == "Skill_1H" then
	
		return GetCost( GetSkillWeapon(playerid, 1) + tren, tren	);
	
	elseif trening == "Skill_2H" then
	
		return GetCost( GetSkillWeapon(playerid, 2) + tren, tren );
	
	elseif trening == "Skill_Bow" then
		
		return GetCost( GetSkillWeapon(playerid, 3) + tren, tren );
	
	elseif trening == "Skill_CBow" then
	
		return GetCost( GetSkillWeapon(playerid, 4) + tren, tren );
	
	elseif trening == "Str" then
			
		return GetCost( GetStrength(playerid) + tren, tren );
	
	elseif trening == "Dex" then
	
		return GetCost( GetDexterity(playerid) + tren, tren );
	
	elseif trening == "Mana" then
	
		return GetCost( GetMana(playerid) + tren, tren );
	
	elseif trening == "Health" then
	
		return GetCost( GetHealth(playerid) + tren, tren );
	
	elseif trening == "MagicLvl" then
	
		return GetCost( GetMagicLevel( playerid ) + tren, tren );
	
	else
	
		return false;
	
	end

end

function GetTypeTrening( trening )

	if trening == "Skill_1H" then
	
		return "Skill";
	
	elseif trening == "Skill_2H" then
	
		return "Skill";
	
	elseif trening == "Skill_Bow" then
		
		return "Skill";
	
	elseif trening == "Skill_CBow" then
	
		return "Skill";
		
	else
	
		return "Statistic";
	
	end
	
end

function GetCostAmount( trening )
	
	
	if trening == "MagicLvl" then
	
		return 1;
	
	else
	
		return 2;
	
	end
	
end

function GetCostTrophy( trophy )

	for i, trop in ipairs( Cost_Trophy ) do
		
		if trophy == trop.name then
		
			print(trophy, trop.name, trop.cost);
			
			return trop.cost;
		
		end
	
	end
	
	return false;

end

function GetCost( player_amount, trening )

	if trening == 5 then
	
		for i, tren in ipairs( trening_5 ) do
		
			if player_amount <= tren.player_h then
				
				return tren.cost;
						
			end
		
		end
	
	elseif trening == 1 then
	
		for i, tren in ipairs( trening_stat ) do
		
			if player_amount <= tren.player_h then
				
				return tren.cost;
						
			end
		
		end
		
	elseif trening == 2 then
	
		for i, tren in ipairs( trening_stat_5 ) do
		
			if player_amount <= tren.player_h then
				
				return tren.cost;
						
			end
		
		end
	
	elseif trening == 10 then
	
		for i, tren in ipairs( trening_10 ) do
		
			if player_amount <= tren.player_h then
				
				return tren.cost;
						
			end
		
		end
	
	end
	
	return false;

end