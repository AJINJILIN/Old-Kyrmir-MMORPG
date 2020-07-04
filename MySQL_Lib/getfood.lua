local Food = {
	{ food = "ITFO_BACON", hp = 15 },
	{ food = "ITFOMUTTONRAW", hp = 6 },
	{ food = "ITFOMUTTON", hp = 12 },
	{ food = "ITFO_SAUSAGE", hp = 12 },
	{ food = "ITFO_FISH", hp = 5 },
	{ food = "ITFO_FISHSOUP", hp = 12 }, 
	{ food = "ITFO_STEW", hp = 10 },
	{ food = "IFTO_XPSTEW", hp = 10 }, 
	{ food = "ITFO_CORAGONSBEER", hp = 10 }, 
	{ food = "ITFO_BEER", hp = 3 }, 
	{ food = "ITFO_WINE", hp = 2 }, 
	{ food = "ITFO_BOOZE", hp = 4 }, 
	{ food = "ITFO_WATER", hp = 5 },
	{ food = "ITFO_CHEESE", hp = 15 }, 
	{ food = "ITFO_APPLE", hp = 10 },
	{ food = "ITPO_HEALTH_01", hp = 50 },
	{ food = "ITPO_HEALTH_02", hp = 70 },
	{ food = "ITPO_HEALTH_03", hp = 150 },
	{ food = "ITPO_MANA_01", hp = 50 },
	{ food = "ITPO_MANA_02", hp = 70 },
	{ food = "ITPO_MANA_03", hp = 100 },
	{ food = "ITPO_PERM_STR", hp = 0 },
	{ food = "ITPO_PERM_DEX", hp = 0 },
	{ food = "ITPO_PERM_HEALTH", hp = 0 },
	{ food = "ITPO_PERM_MANA", hp = 0 },
	{ food = "ITPO_SPEED", hp = 0 },
	{ food = "ITPO_PERM_LITTLEMANA", hp = 0 },
	{ food = "ITPO_HEALHILDA_MIS", hp = 0 },
	{ food = "ITPO_HEALOBSESSION_MIS", hp = 0 },
	{ food = "ITPO_HEALRANDOLPH_MIS", hp = 0 },
	{ food = "ITPO_DRAGONEGGDRINKNEORAS_MIS", hp = 0 },
	{ food = "ITPO_MEGADRINK", hp = 0 },
	{ food = "ITPO_POTIONOFDEATH_01_MIS", hp = 0 },
	{ food = "ITPO_POTIONOFDEATH_02_MIS", hp = 0 },
	{ food = "ITFO_BREAD", hp = 10 },
	{ food = "ITFO_MILK", hp = 5 },
	{ food = "ITFO_HONEY", hp = 2 },
	{ food = "ITFO_ADDON_RUM", hp = 0 },
	{ food = "ITPO_HEALTH_ADDON_04", hp = 0 },
}

function CheckFood( item_instance )

	for i, food in ipairs( Food ) do
	
		if item_instance == food.food then
		
			return true;
		
		end
	
	end
	
	return false;

end

function GetFoodHealth( item_instance )

	for i, food in ipairs( Food ) do
	
		if item_instance == food.food then
		
			return food.hp * 3;
		
		end
	
	end
	
	return 0;

end