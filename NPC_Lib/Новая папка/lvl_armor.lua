local Armor = {
	{ item = "ITAR_BAU_L", lvl = 0 },
	{ item = "ITAR_BAU_M", lvl = 0 },
	{ item = "ITAR_PRISONER", lvl = 1 },
	{ item = "ITAR_LEATHER_L", lvl = 3 },
	{ item = "ITAR_SLD_L", lvl = 4 },
	{ item = "ITAR_DIEGO", lvl = 4 },
	{ item = "ITAR_BDT_M", lvl = 5 },
	{ item = "ITAR_PIR_L_ADDON", lvl = 8 },
	{ item = "ITAR_MIL_L", lvl = 8 },
	{ item = "ITAR_BDT_H", lvl = 10 },
	{ item = "ITAR_SLD_M", lvl = 10 },
	{ item = "ITAR_RANGER_ADDON", lvl = 15 },
	{ item = "ITAR_PIR_M_ADDON", lvl = 17 },
	{ item = "ITAR_PIR_H_ADDON", lvl = 20 },
	{ item = "ITAR_THORUS_ADDON", lvl = 25 },
	{ item = "ITAR_BLOODWYN_ADDON", lvl = 25 },
	{ item = "ITAR_DJG_CRAWLER", lvl = 25 },
	{ item = "ITAR_MIL_M", lvl = 25 },
	{ item = "ITAR_SLD_H", lvl = 25 },
	{ item = "ITAR_CORANGAR", lvl = 27 },
	{ item = "ITAR_PAL_M", lvl = 27 },
	{ item = "ITAR_DJG_L", lvl = 27 },
	{ item = "ITAR_VLK_H", lvl = 5 },
	{ item = "HUM_KYRMIR", lvl = 30 },			
	{ item = "HUM_KYRMIR1", lvl = 24 },			
	{ item = "HUM_KYRMIR2", lvl = 17 },
	{ item = "HUM_KYRMIR3", lvl = 21 },
	{ item = "HUM_KYRMIR4", lvl = 27 },	
	{ item = "HUM_KYRMIR5", lvl = 28 },
	{ item = "HUM_KYRMIR6", lvl = 27 },
	{ item = "HUM_KYRMIR7", lvl = 29 },
	
	{ item = "HUM_KYRMIR8", lvl = 28 },
	{ item = "HUM_KYRMIR9", lvl = 26 },
	{ item = "HUM_KYRMIR10", lvl = 29 },
	{ item = "HUM_KYRMIR11", lvl = 27 },
	{ item = "HUM_KYRMIR12", lvl = 26 },	
	{ item = "HUM_KYRMIR13", lvl = 19 },	
	{ item = "HUM_KYRMIR14", lvl = 29 },
	{ item = "HUM_KYRMIR15", lvl = 13 },	
	{ item = "HUM_KYRMIR16", lvl = 30 },	
	{ item = "HUM_KYRMIR17", lvl = 29 },	
	{ item = "HUM_KYRMIR18", lvl = 24 },	
	{ item = "HUM_KYRMIR19", lvl = 11 },	
	{ item = "HUM_KYRMIR20", lvl = 21 },	
	{ item = "HUM_KYRMIR21", lvl = 34 },	
	{ item = "HUM_KYRMIR29", lvl = 31 },
	{ item = "HUM_KYRMIR39", lvl = 27 },
	{ item = "HUM_KYRMIR22", lvl = 32 },
	{ item = "HUM_KYRMIR31", lvl = 32 },

		
};

function CheckPlayerArmorLvl(playerid, curr_armor)
	
	if GetPlayerName(playerid) ~= "Нуар" and GetPlayerName(playerid) ~= "Silvio" and GetPlayerName(playerid) ~= "Ульфрик" and GetPlayerName(playerid) ~= "Брафф" and GetPlayerName(playerid) ~= "Сантьяго" then

		if IsNPC(playerid) ~= 1 then

			for i, armor in ipairs(Armor) do

				if curr_armor == armor.item then
				
					if GetPlayerLevel(playerid) < armor.lvl then	
					
						SendPlayerMessage(playerid, 255, 255, 0, "Требуемый уровень: "..armor.lvl);
						UnequipArmor(playerid);
						CloseInventory(playerid);
						break;
						
					else
					
					 break;
						
					end
				
				end

			end
		
		end

	end
	
end	