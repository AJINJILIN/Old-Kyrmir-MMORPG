function AddItemToPlayer(playerid, itemInstance, amount, eq)
	
	if GetTableItemLenght( playerid ) == 0 then
	
		table.insert(GetItemPlayerTable( playerid ), itemInstance);
		table.insert(GetItemAmountPlayerTable( playerid ), amount);
		table.insert(GetItemEquipPlayerTable( playerid ), eq);
	
	else

		for i = 1, GetTableItemLenght( playerid ) do
		
			--if GetItemStack( itemInstance ) == true then 
				
				if string.upper(GetItemPlayer( playerid, i )) == string.upper(itemInstance) then
					
					local old_amount = GetItemAmountPlayer( playerid, i );
					table.remove(GetItemAmountPlayerTable( playerid ), i);
					table.insert(GetItemAmountPlayerTable( playerid ), i, old_amount + amount);
					break;
					
				elseif i == GetTableItemLenght( playerid ) then

					table.insert(GetItemPlayerTable( playerid ), itemInstance);
					table.insert(GetItemAmountPlayerTable( playerid ), amount);
					table.insert(GetItemEquipPlayerTable( playerid ), eq);
					break;
				
				end
					
			--[[else
				
				table.insert(GetItemPlayerTable( playerid ), itemInstance);
				table.insert(GetItemAmountPlayerTable( playerid ), amount);
				table.insert(GetItemEquipPlayerTable( playerid ), eq);
				
			end]]--
		
		end
	
	end

end

function FindItem(playerid, itemInstance)

	for i = 1, GetTableItemLenght( playerid ) do
		
		if string.upper(GetItemPlayer( playerid, i )) == itemInstance then
			
			return i;
			
		end
		
	end
	
	return false;

end

function DestroyItemPlayerAmount(playerid, itemInstance, amount)
	
	for i = 1, GetTableItemLenght( playerid ) do
		
		if GetItemPlayer( playerid, i ) ~= nil then
		
			if string.upper(GetItemPlayer( playerid, i )) == itemInstance then
				
				if (GetItemAmountPlayer( playerid, i ) - amount) == 0 then
					
					DestroyItemPlayer(playerid, itemInstance, GetItemAmountPlayer( playerid, i ));
					
				else
				
					SetItemAmountPlayer( playerid, i, GetItemAmountPlayer( playerid, i ) - amount );
				
				end
				
			end
		
		end
	
	end
	
end

function DestroyItemPlayer(playerid, itemInstance, amount)

	for i = 1, GetTableItemLenght( playerid ) do

		if string.upper(GetItemPlayer( playerid, i )) == itemInstance then
			
			if GetItemAmountPlayer( playerid, i ) == amount then
				
				table.remove(GetItemPlayerTable( playerid ), i);
				table.remove(GetItemAmountPlayerTable( playerid ), i);
				table.remove(GetItemEquipPlayerTable( playerid ), i);
				break;
				
			end
		
		end
	
	end

end

local No_Stack = {
	"ITAR",
}

function GetItemStack( item_instance )
	
	for i = 1, #No_Stack do
		
		if string.find(item_instance, No_Stack[i]) ~= nil then
		
			return false; -- Nie stakuje sie
		
		end	
		
	end
	
	return true;

end