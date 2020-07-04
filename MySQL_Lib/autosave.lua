local id = 0;

function AutoSave()
	
	if GetNextOnlinePlayer() ~= false then
	
		GameTextForAll(1260,2570,"Автосохранение...","Font_Old_20_White_Hi.TGA",0,255,0,2000);
		MySQL_Save(GetNextOnlinePlayer());
		id = GetNextOnlinePlayer() + 1;
		
	else 
	
		id = 0;
		
	end
end

function GetNextOnlinePlayer()

	for i = id, GetMaxPlayers() - 1 do
	
		if IsPlayerConnected(i) == 1 then
	
			if IsSpawned(i) == 1 then
		
				if GetPlayerLoggedIn(i) == true then
					
					return i;

				end
				
			end
			
		end
		
	end
	
	return false;

end