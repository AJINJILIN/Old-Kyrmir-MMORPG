local Trade = {};

Trade["Baranir"] = {
	{ menu  = 0, item = "ITFOMUTTONRAW", cost = 1, amount = 1 },
	{ menu  = 1, item = "ITFOMUTTON", cost = 2, amount = 1 },
	{ menu  = 2, item = "ITFO_CHEESE", cost = 2, amount = 1 },
	{ menu  = 3, item = "ITFO_SAUSAGE", cost = 2, amount = 1 },
	{ menu  = 4, item = "ITFO_HONEY", cost = 2, amount = 1 },
	{ menu  = 5, item = "ITFO_MILK", cost = 2, amount = 1 },
	{ menu  = 6, item = "ITFO_ADDON_RUM", cost = 2, amount = 1 },
	{ menu  = 7, item = "ITRW_BOLT", cost = 1.5, amount = 1 },
	{ menu  = 8, item = "ITRW_ARROW", cost = 1.5, amount = 1 },
} -- to jest skup ;E

Trade["Йомер"] = {
	{ menu  = 0, item = "ITAR_BAU_L", cost = 70, amount = 1 },
	{ menu  = 1, item = "ITAR_BAU_M", cost = 70, amount = 1 },
	{ menu  = 2, item = "ITAR_PRISONER", cost = 90, amount = 1 },
	{ menu  = 3, item = "ITAR_LEATHER_L", cost = 450, amount = 1 },
	{ menu  = 4, item = "ITAR_SLD_L", cost = 1300, amount = 1 },
	{ menu  = 5, item = "ITAR_DIEGO", cost = 1300, amount = 1 },
	{ menu  = 6, item = "ITAR_BDT_M", cost = 2000, amount = 1 },
	{ menu  = 7, item = "ITAR_PIR_L_ADDON", cost = 4000, amount = 1 },
	{ menu  = 8, item = "ITAR_MIL_L", cost = 4000, amount = 1 },
	{ menu  = 9, item = "ITAR_BDT_H", cost = 7000, amount = 1 },
	{ menu  = 10, item = "ITAR_SLD_M", cost = 7400, amount = 1 },
	{ menu  = 11, item = "ITAR_RANGER_ADDON", cost = 8000, amount = 1 },
	{ menu  = 12, item = "ITAR_PIR_M_ADDON", cost = 13000, amount = 1 },
	{ menu  = 13, item = "ITAR_PIR_H_ADDON", cost = 23000, amount = 1 },
	{ menu  = 14, item = "ITAR_THORUS_ADDON", cost = 36000, amount = 1 },
	{ menu  = 15, item = "ITAR_BLOODWYN_ADDON", cost = 36000, amount = 1 },
	{ menu  = 16, item = "ITAR_DJG_CRAWLER", cost = 39000, amount = 1 },
	{ menu  = 17, item = "ITAR_MIL_M", cost = 40000, amount = 1 },
	{ menu  = 18, item = "ITAR_SLD_H", cost = 65000, amount = 1 },
	{ menu  = 19, item = "ITAR_CORANGAR", cost = 120000, amount = 1 },
	{ menu  = 20, item = "ITAR_PAL_M", cost = 120000, amount = 1 },
	{ menu  = 21, item = "ITAR_DJG_L", cost = 120000, amount = 1 },
}

Trade["Йомер2"] = {
	{ menu  = 0, item = "ITAR_DJG_M", cost = 220000, amount = 1 },
	{ menu  = 1, item = "ITAR_DJG_H", cost = 300000, amount = 1 },
	{ menu  = 2, item = "ITAR_PAL_H", cost = 300000, amount = 1 },
	{ menu  = 3, item = "ITAR_NOV_L", cost = 800, amount = 1 },
	{ menu  = 4, item = "ITAR_KDF_L", cost = 5000, amount = 1 },
	{ menu  = 5, item = "ITAR_KDF_H", cost = 125000, amount = 1 },
	{ menu  = 6, item = "ITAR_OreBaron_Addon", cost = 36000, amount = 1 },
	{ menu  = 7, item = "ITAR_DEMENTOR", cost = 260000, amount = 1 },
	{ menu  = 8, item = "ITAR_KDW_H", cost = 125000, amount = 1 },
	{ menu  = 9, item = "ITAR_XARDAS", cost = 125000, amount = 1 },
	{ menu  = 10, item = "ITAR_LESTER", cost = 700, amount = 1 },
	{ menu  = 11, item = "ITAR_Raven_Addon", cost = 180000, amount = 1 },
}

Trade["Брэндон"] = {
	{ menu  = 0, item = "ITMW_1H_BAU_AXE", cost = 30, amount = 1 },
	{ menu  = 1, item = "ITMW_1H_BAU_MACE", cost = 40, amount = 1 },
	{ menu  = 2, item = "ITMW_SHORTSWORD2", cost = 120, amount = 1 },
	{ menu  = 3, item = "ITMW_NAGELKNUEPPEL", cost = 170, amount = 1 },
	{ menu  = 4, item = "ITMW_1H_SLD_AXE", cost = 440, amount = 1 },
	{ menu  = 5, item = "ITMW_KRIEGSHAMMER1", cost = 1600, amount = 1 },
	{ menu  = 6, item = "ITMW_SCHWERT", cost = 9000, amount = 1 },
	{ menu  = 7, item = "ITMW_STEINBRECHER", cost = 19000, amount = 1 },
	{ menu  = 8, item = "ITMW_MORGENSTERN", cost = 32000, amount = 1 },
	{ menu  = 9, item = "ITMW_1H_MISC_AXE", cost = 330, amount = 1 },
	{ menu  = 10, item = "ITMW_2H_SWORD_M_01", cost = 700, amount = 1 },
	{ menu  = 11, item = "ITMW_ADDON_PIR2HAXE", cost = 7500, amount = 1 },
	{ menu  = 12, item = "ITMW_ZWEIHAENDER2", cost = 34000, amount = 1 },
}

Trade["Рафер"] = {
	{ menu  = 0, item = "ITMW_1H_VLK_AXE", cost = 120, amount = 1 },
	{ menu  = 1, item = "ITMW_SENSE", cost = 170, amount = 1 },
	{ menu  = 2, item = "ITMW_1H_SLD_SWORD", cost = 440, amount = 1 },
	{ menu  = 3, item = "ITMW_ADDON_BANDITTRADER", cost = 1700, amount = 1 },
	{ menu  = 4, item = "ITMW_ADDON_PIR1HAXE ", cost = 6500, amount = 1 },
	{ menu  = 5, item = "ITMW_INQUISITOR", cost = 65000, amount = 1 },
	{ menu  = 6, item = "ITMW_ORKSCHLAECHTER", cost = 100000, amount = 1 },
	{ menu  = 7, item = "ITMW_2H_ROD", cost = 360, amount = 1 },
	{ menu  = 8, item = "ITMW_2H_BAU_AXE", cost = 700, amount = 1 },
	{ menu  = 9, item = "ITMW_HELLEBARDE", cost = 1550, amount = 1 },
	{ menu  = 10, item = "ITMW_ZWEIHAENDER1", cost = 14000, amount = 1 },
	{ menu  = 11, item = "ITMW_2H_PAL_SWORD", cost = 15000, amount = 1 },
	{ menu  = 12, item = "ITMW_1H_BLESSED_01", cost = 100000, amount = 1 },
	{ menu  = 13, item = "ITMW_ZWEIHAENDER4", cost = 135000, amount = 1 },
	{ menu  = 14, item = "ITMW_KRUMMSCHWERT", cost = 145000, amount = 1 },
	{ menu  = 15, item = "ITMW_1H_BLESSED_03", cost = 200000, amount = 1 },
}

Trade["Вилл"] = {
	{ menu  = 0, item = "ITRW_ARROW", cost = 30, amount = 10 },
	{ menu  = 1, item = "ITRW_BOLT", cost = 30, amount = 10 },
	{ menu  = 2, item = "ITRW_BOW_L_01", cost = 500, amount = 1 },
	{ menu  = 3, item = "ITRW_BOW_L_02", cost = 1000, amount = 1 },
	{ menu  = 4, item = "ITRW_CROSSBOW_L_01", cost = 1100, amount = 1 },
	{ menu  = 5, item = "ITRW_BOW_L_03", cost = 2200, amount = 1 },
	{ menu  = 6, item = "ITRW_MIL_CROSSBOW", cost = 4000, amount = 1 },
	{ menu  = 7, item = "ITRW_BOW_L_04", cost = 8500, amount = 1 },
	{ menu  = 8, item = "ITRW_CROSSBOW_L_02", cost = 14000, amount = 1 },
	{ menu  = 9, item = "ITRW_BOW_M_01", cost = 20000, amount = 1 },
	{ menu  = 10, item = "ITRW_BOW_M_02", cost = 50000, amount = 1 },
	{ menu  = 11, item = "ITRW_BOW_M_03", cost = 70000, amount = 1 },
	{ menu  = 12, item = "ITRW_CROSSBOW_M_01", cost = 60000, amount = 1 },
	{ menu  = 13, item = "ITRW_BOW_M_04", cost = 90000, amount = 1 },
	{ menu  = 14, item = "ITRW_CROSSBOW_M_02", cost = 100000, amount = 1 },
	{ menu  = 15, item = "ITRW_BOW_H_03", cost = 300000, amount = 1 },
}

Trade["Аннет"] = {
	{ menu  = 0, item = "ITFO_CHEESE", cost = 20, amount = 5 },
	{ menu  = 1, item = "ITFO_SAUSAGE", cost = 13, amount = 5 },
	{ menu  = 2, item = "ITFO_HONEY", cost = 13, amount = 5 },
	{ menu  = 3, item = "ITFO_MILK", cost = 5, amount = 5 },
	{ menu  = 4, item = "ITFO_ADDON_RUM", cost = 10, amount = 5 },
}

Trade["Тирион"] = {
	{ menu  = 0, item = "ITFO_BACON", cost = 30, amount = 5 },
	{ menu  = 1, item = "ITFO_BREAD", cost = 12, amount = 5 },
	{ menu  = 2, item = "ITFO_BEER", cost = 10, amount = 5 },
	{ menu  = 3, item = "ITFO_BOOZE", cost = 10, amount = 5 },
	{ menu  = 4, item = "ITFOMUTTON", cost = 13, amount = 5 },
	{ menu  = 5, item = "ITFO_WINE", cost = 10, amount = 5 },
	{ menu 	= 6, item = "ITPO_HEALTH_01", cost = 150, amount = 5 },
	
}

Trade["Геральд"] = {
	{ menu  = 0, item = "SWORD1", cost = 320000, amount = 1 }, -- Ostrze Verantu 160 dmg 140 sily
	{ menu  = 1, item = "SWORD2", cost = 330000, amount = 1 },  -- Orkowa Zguba 165 dmg 145 sily
	{ menu  = 2, item = "SWORD3", cost = 360000, amount = 1 },  -- Claymore 180 dmg 160 sily
	{ menu  = 3, item = "SWORD4", cost = 410000, amount = 1 },  -- Flameberg 205 dmg 185 sily
	{ menu 	= 4, item = "SWORD5", cost = 300000, amount = 1 },  -- Zachartowany Miecz 150 dmg 130 sily
	{ menu 	= 5, item = "SWORD6", cost = 490000, amount = 1 },  -- Zabojca Demonow 245 dmg 225 sily
	{ menu 	= 6, item = "SWORD7", cost = 25500, amount = 1 },  -- Stalowy Zabojca 80 dmg 80 sily
	{ menu 	= 7, item = "SWORD8", cost = 125000, amount = 1 },  -- Miecz Gwardzisty 100 dmg 100 sily
	{ menu 	= 8, item = "SWORD9", cost = 350000, amount = 1 },  -- Sot 175 dmg 175 sily
	{ menu 	= 9, item = "SWORD10", cost = 200000, amount = 1 },  -- Katana 125 dmg 125 sily
}

Trade["Василий"] = {
	{ menu  = 0, item = "SWORD11", cost = 300000, amount = 1 }, -- Anduril 180 dmg 160 sily
	{ menu  = 1, item = "SWORD12", cost = 500000, amount = 1 }, -- Czerwony Wiatr 250 dmg 230 sily
	{ menu  = 2, item = "SWORD13", cost = 350000, amount = 1 }, -- Krwawy topor 175 dmg 150 sily
	{ menu  = 3, item = "SWORD14", cost = 390000, amount = 1 }, -- Topor Zemsty 195 dmg 175 sily
	{ menu  = 4, item = "SWORD15", cost = 360000, amount = 1 }, -- Ostrze Najemnika 180 dmg 160 sily
	{ menu  = 5, item = "SWORD16", cost = 290000, amount = 1 }, -- Miecz Mistrzowski 145 dmg 145 sily
	{ menu = 6, item = "SWORD17", cost = 330000, amount = 1 }, -- Ostrze Jezdzca 165 dmg 165 sily
	{ menu = 7, item = "SWORD18", cost = 360000, amount = 1 }, -- Smoczy Zab 180 dmg 180 sily
	{ menu = 8, item = "SWORD19", cost = 340000, amount = 1 }, -- Ostrze Admiraіa 170 dmg 150 sily
	{ menu  = 9, item = "SWORD20", cost = 350000, amount = 1 }, -- Miecz Pradawnych 175 dmg 155 sily
	{ menu  = 10, item = "SWORD21", cost = 380000, amount = 1 }, -- Trolla Zguba 190 dmg 170 sily
	{ menu = 11, item = "SWORD22", cost = 380000, amount = 1 }, -- Gniew Demona 190 dmg 170 sily
	{ menu = 12, item = "SWORD23", cost = 170000, amount = 1 }, -- Stalowy Miecz 85 dmg 85 sily 
	{ menu = 13, item = "SWORD24", cost = 250000, amount = 1 }, -- Krzyї Przeznaczenia 125 dmg 125 sily
};

Trade["Рудин"] = {
	{ menu  = 0, item = "SWORD25", cost = 310000, amount = 1 }, -- Nordycki Miecz 155 dmg 155 sily
	{ menu  = 1, item = "SWORD26", cost = 330000, amount = 1 }, -- Ostrze Rycerza 165 dmg 165 sily
	{ menu  = 2, item = "SWORD27", cost = 260000, amount = 1 }, -- Zelazny Miecz 130 dmg 130 sily
	{ menu  = 3, item = "SWORD28", cost = 300000, amount = 1 }, -- Miecz Zakonu 150 dmg 150 sily
	{ menu  = 4, item = "SWORD29", cost = 320000, amount = 1 }, -- Miecz Pretora 160 dmg 160 sily
	{ menu  = 5, item = "SWORD30", cost = 400000, amount = 1 }, -- Ostrze Smoka 200 dmg 180 sily
	{ menu  = 6, item = "SWORD31", cost = 440000, amount = 1 }, -- Ostrze Odziaіуw Specialnych 220 dmg 200 sily
	{ menu  = 7, item = "SWORD32", cost = 410000, amount = 1 }, -- Krwawe Ostrze 205 dmg 185 sily
	{ menu  = 8, item = "SWORD33", cost = 420000, amount = 1 }, -- Miecz Dwurкczny Assasyna 210 dmg 190 sily
	{ menu  = 9, item = "SWORD34", cost = 150000, amount = 1 }, -- Miecz Balustradowy 75 dmg 75 sily
	{ menu  = 10, item = "SWORD35", cost = 190000, amount = 1 }, -- Miecz Straznika 95 dmg 95 sily

}

Trade["Урган"] = {
	
	{ menu  = 0, item = "HUM_KYRMIR", cost = 400000, amount = 1 },   -- Pancerz Sіug Cienia 165 165 165 165
	{ menu  = 1, item = "HUM_KYRMIR1", cost = 70000, amount = 1 },  -- Mroczna Szata 70 70 70 70
	{ menu  = 2, item = "HUM_KYRMIR2", cost = 30000, amount = 1 },  -- Lekka Mroczna Szata Cienia 45 40 40 40
	{ menu  = 3, item = "HUM_KYRMIR3", cost = 305000, amount = 1 },  -- Mroczna Zbroja 135 115 115 115
	{ menu  = 4, item = "HUM_KYRMIR4", cost = 345000, amount = 1 },	 -- Wzmocniony Stroj Pirata 115 110 110 110
	{ menu  = 5, item = "HUM_KYRMIR5", cost = 330000, amount = 1 },  -- Wzmocniona Ciezka Zbroja Magnata 130 120 120 120
	{ menu  = 6, item = "HUM_KYRMIR6", cost = 315000, amount = 1 },	 -- Wzmocniona Szata Ognia 125 105 105 105
	{ menu  = 7, item = "HUM_KYRMIR7", cost = 265000, amount = 1 },  -- Zbroja Inkwizytora 155 145 145 145
	{ menu  = 8, item = "HUM_KYRMIR8", cost = 400000, amount = 1 },  -- Ciezka Zbroja Rycerza 165 165 165 165
	{ menu  = 9, item = "HUM_KYRMIR9", cost = 140000, amount = 1 },	 -- Zbroja Rebelianta 100 100 100 100
	{ menu  = 10, item = "HUM_KYRMIR10", cost = 280000, amount = 1 }, -- Zbroja Kasty Wojownikow 145 145 125 125
	{ menu  = 11, item = "HUM_KYRMIR11", cost = 305000, amount = 1 }, -- Mroczna Zbroja 135 135 135 135
	{ menu  = 12, item = "HUM_KYRMIR12", cost = 260000, amount = 1 }, -- Zbroja Najemnika z Poіudnia 120 120 120 120
	{ menu  = 13, item = "HUM_KYRMIR13", cost = 55000, amount = 1 }, -- Wzmocniony Skorzany Pancerz 85 85 85 80
	{ menu  = 14, item = "HUM_KYRMIR14", cost = 300000, amount = 1 }, -- Pancerz Dowodcy Paladyna 150 100 100 100
	{ menu  = 15, item = "HUM_KYRMIR15", cost = 40000, amount = 1 }, -- Pikowa Kurtka 60 30 40 40
	{ menu  = 16, item = "HUM_KYRMIR16", cost = 350000, amount = 1 }, -- Ciezka Zbroja Wartownika 160 160 150 150
	{ menu  = 17, item = "HUM_KYRMIR17", cost = 340000, amount = 1 }, -- Zbroja Elitarnego Szpiega 145 145 150 150
	{ menu  = 18, item = "HUM_KYRMIR18", cost = 115000, amount = 1 }, -- Wzmocniona Pikowana Zbroja 115 115 110 110
	{ menu  = 19, item = "HUM_KYRMIR19", cost = 60000, amount = 1 }, -- Srednia Skorzana Zbroja 60 10 30 30
	{ menu  = 20, item = "HUM_KYRMIR20", cost = 100000, amount = 1 }, -- Pancerz Wartownika 105 70 70 70
		
};

--[[ Kolejne 20 zbrojek
Trade["JakiњChuj"] = {
	
	{ menu  = 0, item = "HUM_KYRMIR21", cost = 400000, amount = 1 },   -- 
	{ menu  = 0, item = "HUM_KYRMIR22", cost = 400000, amount = 1 },   -- 
	{ menu  = 0, item = "HUM_KYRMIR23", cost = 400000, amount = 1 },   -- 
	{ menu  = 0, item = "HUM_KYRMIR24", cost = 400000, amount = 1 },   -- 
	{ menu  = 0, item = "HUM_KYRMIR25", cost = 400000, amount = 1 },   -- 
	{ menu  = 0, item = "HUM_KYRMIR26", cost = 400000, amount = 1 },   -- 
	{ menu  = 0, item = "HUM_KYRMIR27", cost = 400000, amount = 1 },   -- 
	{ menu  = 0, item = "HUM_KYRMIR28", cost = 400000, amount = 1 },   -- 
	{ menu  = 0, item = "HUM_KYRMIR29", cost = 400000, amount = 1 },   -- 
	{ menu  = 0, item = "HUM_KYRMIR30", cost = 400000, amount = 1 },   -- 
	{ menu  = 0, item = "HUM_KYRMIR31", cost = 400000, amount = 1 },   -- 
	{ menu  = 0, item = "HUM_KYRMIR32", cost = 400000, amount = 1 },   -- 

		
};]]


local BuyItemDrop_Normal = {
	{item = "ITAT_WOLFFUR", cost = 5 },
	{item = "ITAT_LURKERSKIN", cost = 12 },
	{item = "ITAT_WARGFUR", cost = 25 },
	{item = "ITAT_ADDON_KEILERFUR", cost = 10 },
	{item = "ITAT_SHADOWFUR", cost = 650 },
	{item = "ITAT_SHARKSKIN", cost = 22 },
	{item = "ITAT_TROLLFUR", cost = 300 },
	{item = "ITAT_TROLLBLACKFUR", cost = 500 },
	{item = "ITAT_CLAW", cost = 6 },
	{item = "ITAT_LURKERCLAW", cost = 6 },
	{item = "ITAT_TEETH", cost = 10 },
	{item = "ITAT_SHARKTEETH", cost = 27 },
	{item = "ITAT_TROLLTOOTH", cost = 150 },
	{item = "ITAT_CRAWLERMANDIBLES", cost = 10 },
	{item = "ITAT_BUGMANDIBLES", cost = 9 },
	{item = "ITAT_DRGSNAPPERHORN", cost = 90 },
	{item = "ITAT_SHADOWHORN", cost = 150 },
	{item = "ITAT_CRAWLERPLATE", cost = 20 },
	{item = "ITAT_WARANFIRETONGUE", cost = 25 },
};

local BuyItemDrop = {
	{item = "ITAT_STONEGOLEMHEART", cost = 10000 },
	{item = "ITAT_FIREGOLEMHEART", cost = 15000 },
	{item = "ITAT_ICEGOLEMHEART", cost = 10000 },
	{item = "ITAT_DEMONHEART", cost = 10000 },
	{item = "ITAT_SWAMPDRAGONHEART", cost = 30000 },
	{item = "ITAT_ICEDRAGONHEART", cost = 30000 },
	{item = "ITAT_FIREDRAGONHEART", cost = 30000 },
	{item = "ITAT_GOBLINBONE", cost = 5 },
	{item = "ITAT_SKELETONBONE", cost = 30 },
	{item = "ITAT_DRAGONBLOOD", cost = 7000 },
	{item = "ITAT_DRAGONSCALE", cost = 10000 },
	{item = "ITMI_ADDON_BLOODWYN_KOPF", cost = 40 },
	{item = "ITMI_SKULL", cost = 26 },
}

local BuyItemDrop_Random = {
	{item = "ITMW_1H_VLK_DAGGER", cost = 10 },
	{item = "ITMW_1H_BAU_AXE", cost = 10 },
	{item = "ITMW_1H_BAU_MACE", cost = 10 },
	{item = "ITMI_GOLDPLATE", cost = 100 },
	{item = "ITMI_SILVERPLATE", cost = 60 },
	{item = "ITMI_SILVERCUP", cost = 60 },
	{item = "ITMI_GOLDCUP", cost = 100 },
}

function CreateStatsList(amount_menu, x, y, file)

	if file and type ( file ) == "string" then
	
		local Menu = { option = {} };
		
		local File = io.open("NPC_Lib//List//"..file..".list","r+");
		
		if File then
			
			for i = 0, amount_menu - 1 do
			
				local tempvar = File:read("*l");
				local result, menu_text = sscanf(tempvar, "s");
				
				if result == 1 then

					Menu.option[i] = CreateDraw(x, y, ""..menu_text.."", "Font_Old_10_White_Hi.TGA", 255, 145, 0);
					
					y = y + 200;
					
				else
					
					return false;
					
				end
				
			end
			
			File:close();
			
			return Menu;
			
		else
			
			print("Can't create list, on file",file);
			return false;
			
		end
		
	else
	
		print("Can't create list, on file",file);
		return false;
		
	end
	
end

local Handel = {};

Handel["Eomer"] = CreateStatsList(22, 3500, 2000, "Eomer");
Handel["Eomer_1"] = CreateStatsList(12, 3500, 2000, "Eomer_1");
Handel["Brandon"] = CreateStatsList(13, 3500, 2000, "Brandon");
Handel["Rafer"] = CreateStatsList(16, 3500, 2000, "Rafer");
Handel["Will"] = CreateStatsList(16, 3500, 2000, "Will");
Handel["Eowina"] = CreateStatsList(5, 3500, 2000, "Eowina");
Handel["Tyrion"] = CreateStatsList(7, 3500, 2000, "Tyrion");
Handel["Fagar2"] = CreateStatsList(23, 3500, 2000, "Fagar_1");
Handel["Fagar3"] = CreateStatsList(22, 3500, 2000, "Fagar_2");
Handel["Fagar4"] = CreateStatsList(21, 3500, 2000, "Fagar_3");
Handel["Gerald"] = CreateStatsList(10, 3500, 2000, "Gerald");
Handel["Vasilas"] = CreateStatsList(14, 3500, 2000, "Vasilas");
Handel["Urgan"] = CreateStatsList(21, 3500, 2000, "Urgan");
Handel["Rudin"] = CreateStatsList(11, 3500, 2000, "Rudin");
Handel["Baranir"] = CreateStatsList(9, 3500, 2000, "Baranir");

function ShowHandel(playerid, npc)

	for i = 0, #Handel[npc].option do
		
		ShowDraw(playerid, Handel[npc].option[i]);
	
	end

end

function HideHandel(playerid, npc)

	for i = 0, #Handel[npc].option do
	
		HideDraw(playerid, Handel[npc].option[i]);
	
	end

end

function GetItemCode( npc, menu_nr )

	for i, item in ipairs( Trade[npc] ) do
	
		if item.menu == menu_nr then
		
			return item.item;
		
		end
	
	end

end

function GetItemCost( npc, menu_nr )

	for i, item in ipairs( Trade[npc] ) do
		
		if item.menu == menu_nr then
			
			return item.cost;
		
		end
	
	end

end

function GetItemAmount( npc, menu_nr )

	for i, item in ipairs( Trade[npc] ) do
	
		if item.menu == menu_nr then
		
			return item.amount;
		
		end
	
	end

end

function GetBuyItemDropCost( item_instance, amount )

	for i, item in ipairs( BuyItemDrop ) do
	
		if item_instance == item.item then
		
			return item.cost * amount;
		
		end
	
	end
	
	return 0;

end

function GetBuyItemDrop( item_instance )

	for i, item in ipairs( BuyItemDrop ) do
	
		if item_instance == item.item then
		
			return true;
		
		end
	
	end
	
	return false;

end

function GetCheckBuyItemDrop( id )

	for i, item in ipairs( BuyItemDrop ) do
	
		if id == i then
		
			return item.item;
		
		end
	
	end

end

function GetBuyItemDropCost_Normal( item_instance, amount )

	for i, item in ipairs( BuyItemDrop_Normal ) do
	
		if item_instance == item.item then
		
			return item.cost * amount;
		
		end
	
	end
	
	return 0;

end

function GetBuyItemDrop_Normal( item_instance )

	for i, item in ipairs( BuyItemDrop_Normal ) do
	
		if item_instance == item.item then
		
			return true;
		
		end
	
	end
	
	return false;

end

function GetCheckBuyItemDrop_Normal( id )

	for i, item in ipairs( BuyItemDrop_Normal ) do
	
		if id == i then
		
			return item.item;
		
		end
	
	end

end

function GetBuyItemDropCost_Random( item_instance, amount )

	for i, item in ipairs( BuyItemDrop_Random ) do
	
		if item_instance == item.item then
		
			return item.cost * amount;
		
		end
	
	end
	
	return 0;

end

function GetBuyItemDrop_Random( item_instance )

	for i, item in ipairs( BuyItemDrop_Random ) do
	
		if item_instance == item.item then
		
			return true;
		
		end
	
	end
	
	return false;

end

function GetCheckBuyItemDrop_Random( id )

	for i, item in ipairs( BuyItemDrop_Random ) do
	
		if id == i then
		
			return item.item;
		
		end
	
	end

end

function GetBuyItem( playerid )
	
	for i = 1, #BuyItemDrop do
	
		HasItem(playerid, GetCheckBuyItemDrop( i ), 0);

	end
	
end

function RemoveBuyItemDrop( playerid )

	for i = 1, #BuyItemDrop do
	
		HasItem(playerid, GetCheckBuyItemDrop( i ), 3);
		
	end

end

function Normal_BuyItem()
	
	return #BuyItemDrop_Normal;
	
end

function BuyItem()
	
	return #BuyItemDrop;
	
end

function Random_BuyItem()
	
	return #BuyItemDrop_Random;
	
end

function GetBuyItem_Normal( playerid )
	
	for i = 1, #BuyItemDrop_Normal do
	
		HasItem(playerid, GetCheckBuyItemDrop_Normal( i ), 2);

	end
	
end

function RemoveBuyItemDrop_Normal( playerid )

	for i = 1, #BuyItemDrop_Normal do
	
		HasItem(playerid, GetCheckBuyItemDrop_Normal( i ), 1);
		
	end

end

function GetBuyItem_Random( playerid )
	
	for i = 1, #BuyItemDrop_Random do
	
		HasItem(playerid, GetCheckBuyItemDrop_Random( i ), 6);

	end
	
end

function RemoveBuyItemDrop_Random( playerid )

	for i = 1, #BuyItemDrop_Random do
	
		HasItem(playerid, GetCheckBuyItemDrop_Random( i ), 7);
		
	end

end

function GiveItemTrade( playerid )
	
	if GetItemCost( GetPlayerName(GetFocus(playerid)), GetPlayerOptionsNPC(playerid) ) <= GetPlayerGold(playerid) then
		
		GameTextForPlayer(playerid, 500, 3500, "Товар куплен!","Font_Old_20_White_Hi.TGA", 255, 255, 255, 500);
		GiveItem( playerid, GetItemCode( GetPlayerName(GetFocus(playerid)), GetPlayerOptionsNPC(playerid) ), GetItemAmount( GetPlayerName(GetFocus(playerid)), GetPlayerOptionsNPC(playerid) ));
		RemoveItem( playerid, "ITMI_GOLD", GetItemCost( GetPlayerName(GetFocus(playerid)), GetPlayerOptionsNPC(playerid) ));
		
	else
		
		GameTextForPlayer(playerid, 500, 3500, "Недостаточна золота!","Font_Old_20_White_Hi.TGA", 255, 255, 255, 500);
		
	end

end

function GiveItemTradeEomerek( playerid )
	
	if GetItemCost("Eomer2", GetPlayerOptionsNPC(playerid) ) <= GetPlayerGold(playerid) then
		
		GameTextForPlayer(playerid, 500, 3500, "Товар куплен!","Font_Old_20_White_Hi.TGA", 255, 255, 255, 500);
		GiveItem( playerid, GetItemCode( "Eomer2", GetPlayerOptionsNPC(playerid) ), GetItemAmount( "Eomer2", GetPlayerOptionsNPC(playerid) ));
		RemoveItem( playerid, "ITMI_GOLD", GetItemCost( "Eomer2", GetPlayerOptionsNPC(playerid) ));
		
	else
		
		GameTextForPlayer(playerid, 500, 3500, "Недостаточна золота!","Font_Old_20_White_Hi.TGA", 255, 255, 255, 500);
		
	end

end

local FagarItem = {
	{
		{menu_id = 0, item = "ITAR_BAU_L", cost = 30 },
		{menu_id = 1, item = "ITAR_BAU_M", cost = 30 },
		{menu_id = 2, item = "ITAR_PRISONER", cost = 40 },
		{menu_id = 3, item = "ITAR_LEATHER_L", cost = 200 },
		{menu_id = 4, item = "ITAR_SLD_L", cost = 450 },
		{menu_id = 5, item = "ITAR_DIEGO", cost = 500 },
		{menu_id = 6, item = "ITAR_BDT_M", cost = 500 },
		{menu_id = 7, item = "ITAR_PIR_L_ADDON", cost = 1200 },
		{menu_id = 8, item = "ITAR_MIL_L", cost = 1200 },
		{menu_id = 9, item = "ITAR_BDT_H", cost = 2000 },
		{menu_id = 10, item = "ITAR_SLD_M", cost = 2100 },
		{menu_id = 11, item = "ITAR_RANGER_ADDON", cost = 3800 },
		{menu_id = 12, item = "ITAR_PIR_M_ADDON", cost = 3000 },
		{menu_id = 13, item = "ITAR_PIR_H_ADDON", cost = 8000 },
		{menu_id = 14, item = "ITAR_THORUS_ADDON", cost = 11000 },
		{menu_id = 15, item = "ITAR_BLOODWYN_ADDON", cost = 11000 },
		{menu_id = 16, item = "ITAR_DJG_CRAWLER", cost = 13000 },
		{menu_id = 17, item = "ITAR_MIL_M", cost = 15500 },
		{menu_id = 18, item = "ITAR_SLD_H", cost = 20000 },
		{menu_id = 19, item = "ITAR_CORANGAR", cost = 30000 },
		{menu_id = 20, item = "ITAR_PAL_M", cost = 30000 },
		{menu_id = 21, item = "ITAR_DJG_L", cost = 30000 },
		{menu_id = 22, item = "ITMW_SHORTSWORD2", cost = 50 },
	},
	{              
		{menu_id = 0, item = "ITMW_NAGELKNUEPPEL", cost = 70 },
		{menu_id = 1, item = "ITMW_1H_SLD_AXE", cost = 100 },
		{menu_id = 2, item = "ITMW_KRIEGSHAMMER1", cost = 400 },
		{menu_id = 3, item = "ITMW_SCHWERT", cost = 1500 },
		{menu_id = 4, item = "ITMW_STEINBRECHER", cost = 5000 },
		{menu_id = 5, item = "ITMW_MORGENSTERN", cost = 10000 },
		{menu_id = 6, item = "ITMW_1H_MISC_AXE", cost = 150 },
		{menu_id = 7, item = "ITMW_2H_SWORD_M_01", cost = 200 },
		{menu_id = 8, item = "ITMW_ADDON_PIR2HAXE", cost = 1000 },
		{menu_id = 9, item = "ITMW_ZWEIHAENDER2", cost = 10000 },
		{menu_id = 10, item = "ITMW_1H_VLK_AXE", cost = 50 },
		{menu_id = 11, item = "ITMW_SENSE", cost = 50 },
		{menu_id = 12, item = "ITMW_1H_SLD_SWORD", cost = 200 },
		{menu_id = 13, item = "ITMW_ADDON_BANDITTRADER", cost = 500 },
		{menu_id = 14, item = "ITMW_ADDON_PIR1HAXE", cost = 1000 },
		{menu_id = 15, item = "ITMW_INQUISITOR", cost = 20000 },
		{menu_id = 16, item = "ITMW_ORKSCHLAECHTER", cost = 30000 },
		{menu_id = 17, item = "ITMW_2H_ROD", cost = 150 },
		{menu_id = 18, item = "ITMW_2H_BAU_AXE", cost = 200 },
		{menu_id = 19, item = "ITMW_HELLEBARDE", cost = 550 },
		{menu_id = 20, item = "ITMW_ZWEIHAENDER1", cost = 1500 },
		{menu_id = 21, item = "ITMW_1H_SWORD_OLD_01", cost = 50 },
	},
	{
		{menu_id = 0, item = "ITMW_2H_PAL_SWORD", cost = 7000 },
		{menu_id = 1, item = "ITMW_1H_BLESSED_01", cost = 22000 },
		{menu_id = 2, item = "ITMW_ZWEIHAENDER4", cost = 35000 },
		{menu_id = 3, item = "ITRW_BOW_L_01", cost = 200 },
		{menu_id = 4, item = "ITRW_BOW_L_02", cost = 400 },
		{menu_id = 5, item = "ITRW_CROSSBOW_L_01", cost = 500 },
		{menu_id = 6, item = "ITRW_BOW_L_03", cost = 1200 },
		{menu_id = 7, item = "ITRW_MIL_CROSSBOW", cost = 500 },
		{menu_id = 8, item = "ITRW_BOW_L_04", cost = 1000 },
		{menu_id = 9, item = "ITRW_CROSSBOW_L_02", cost = 1000 },
		{menu_id = 10, item = "ITRW_BOW_M_01", cost = 4000 },
		{menu_id = 11, item = "ITRW_BOW_M_02", cost = 10000 },
		{menu_id = 12, item = "ITRW_BOW_M_03", cost = 20000 },
		{menu_id = 13, item = "ITRW_CROSSBOW_M_01", cost = 25000 },
		{menu_id = 14, item = "ITRW_BOW_M_04", cost = 30000 },
		{menu_id = 15, item = "ITRW_CROSSBOW_M_02", cost = 35000 },
		{menu_id = 16, item = "ITMW_SPICKER", cost = 2000 },
		{menu_id = 17, item = "ITMW_DOPPELAXT", cost = 20000 },
		{menu_id = 18, item = "ITMW_SCHWERT4", cost = 10000 },
		{menu_id = 19, item = "ITRI_PROT_EDGE_01", cost = 500 },
		{menu_id = 20, item = "ITAR_VLK_H", cost = 100 },
	},
};



function SellItemFagar( playerid, page, menu )
	
	page = page - 1;
	
	for i, page_item in ipairs(FagarItem[page]) do
	
	if page_item.menu_id == menu then
						
			if FindItem(playerid, page_item.item) ~= false then
			
				RemoveItem(playerid, page_item.item, 1);
				DestroyItemPlayerAmount(playerid, page_item.item, 1);
				GiveItem(playerid, "ITMI_GOLD", page_item.cost);
				GameTextForPlayer(playerid, 500, 3500, "Товар продан!","Font_Old_20_White_Hi.TGA", 255, 255, 255, 500);
					
			else
				
				GameTextForPlayer(playerid, 500, 3500, "Нет такого предмета!","Font_Old_20_White_Hi.TGA", 255, 255, 255, 500);
				
				end
			
			end
		
		end

	end
	
function GiveItemTradeGoldSkup(playerid)
	for i, item in ipairs(Trade["Baranir"]) do
		if item.menu == GetPlayerOptionsNPC(playerid) then
			local szukaj = FindItem(playerid, item.item);
			if szukaj ~= false then
				GiveItem(playerid, "ITMI_GOLD", math.ceil(item.cost * GetItemAmountPlayer(playerid, szukaj)));
				RemoveItem(playerid, item.item, GetItemAmountPlayer( playerid, szukaj));
				DestroyItemPlayerAmount(playerid, item.item, GetItemAmountPlayer(playerid, szukaj));
				GameTextForPlayer(playerid, 500, 3500, "Товар куплен!","Font_Old_20_White_Hi.TGA", 255, 255, 255, 500);
			else
				GameTextForPlayer(playerid, 500, 3500, "Нет такого предмета!","Font_Old_20_White_Hi.TGA", 255, 255, 255, 500);
			end
		end
	end
end