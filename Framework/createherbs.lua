local ItemsOnGrund = {};

local Herbs = {
	{  herb = "ItPl_Weed", chence = 10 }, -- Сорняк
	{  herb = "ItPl_Beet", chence = 9 }, -- Репа
	{  herb = "ItPl_SwampHerb", chence = 5 }, -- Болотник
	{  herb = "ItPl_Mana_Herb_01", chence = 7 }, -- Огненная трава
	{  herb = "ItPl_Mana_Herb_02", chence = 5 }, -- Огненная крапива 
	{  herb = "ItPl_Mana_Herb_03", chence = 3 } ,-- Огненный корень
	{  herb = "ItPl_Health_Herb_01", chence = 7 }, -- Лечебная трава 
	{  herb = "ItPl_Health_Herb_02", chence = 5 }, -- Лечебное растение 
	{  herb = "ItPl_Health_Herb_03", chence = 3 }, -- Лечебный корень 
	--{  herb = "ItPl_Dex_Herb_01", chence = 2 }, -- Ягода гоблина, +1 ловкость
	--{  herb = "ItPl_Strength_Herb_01", chence = 2 }, -- Корень дракона, +1 сила
	{  herb = "ItPl_Speed_Herb_01", chence = 2 }, -- Трава снеппера
	{  herb = "ItPl_Mushroom_01", chence = 8 }, -- Черный гриб
	{  herb = "ItPl_Mushroom_02", chence = 8 }, -- Мясной гриб 
	{  herb = "ItPl_Blueplant", chence = 8 }, -- Синяя бузина
	{  herb = "ItPl_Forestberry", chence = 7 }, -- Лесная ягода
	{  herb = "ItPl_Planeberry", chence = 7 }, -- Полевая ягода
	{  herb = "ItPl_Temp_Herb", chence = 9 }, -- Перекати-поле
	{  herb = "ItPl_Perm_Herb", chence = 1 }, -- Орочья трава 
};

function RandomHerb()

	local rand = random(#Herbs) + 1;
	
	for i, v in ipairs(Herbs) do
	
		if i == rand then
		
			rand = random(10) + 1;
			
			for j = 1, v.chence do
				
				if j == rand then
				
					return v.herb;
				
				end
			
			end
			
			return false;
		
		end
	
	end

end

function CreateHerb(x, y, z, worldName)
	
	local herb = RandomHerb();
	
	if herb ~= false then
		
		local id = CreateItem(herb, 1, x, y, z, worldName);
		table.insert(ItemsOnGrund, { instance = herb, x = x, y = y, z = z, world = worldName, actualy_respawn = 0, time_respawn = 10, drop = 0 });
		--print("Herb #"..#ItemsOnGrund.." "..herb.." "..id);
		
	else
	
		table.insert(ItemsOnGrund, { instance = "NULL", x = x, y = y, z = z, world = worldName, actualy_respawn = 0, time_respawn = 10, drop = 1 });
		--print("Herb #"..#ItemsOnGrund.." NONE");
	
	end
	
end

function OnPlayerTakeHerb(playerid, itemID, itemInstance, x, y, z, worldName)

    if itemID >= 0 then
		
		FindItemOnGrund(itemInstance, x, y, z, worldName);
	
	end
 
end

function FindItemOnGrund(itemInstance, x, y, z, worldName)

	for i, k in ipairs(ItemsOnGrund) do
	
		if k.instance == itemInstance then

			if k.x == x and k.y == y and k.z == z then
			
				if k.world == worldName then
					
					k.drop = 1;	
					break;
					
				end
			
			end
		
		end
	
	end

end

function RespawnItemOnGrund()

	for i, k in ipairs(ItemsOnGrund) do
	
		if k.drop == 1 then
		
			if k.actualy_respawn == k.time_respawn then
				
				k.instance = RandomHerb();
				
				if k.instance ~= false then
				
					CreateItem(k.instance, 1, k.x, k.y, k.z, k.world);
					k.actualy_respawn = 0;
					k.drop = 0;
					--print("Herb #"..i.." "..k.instance);
					
				else
					
					k.actualy_respawn = 0;
					k.drop = 1;
					--print("Herb #"..i.." NONE");
					
				end
				
			else
			
				k.actualy_respawn = k.actualy_respawn + 1;
				
			end
		
		end
	
	end

end