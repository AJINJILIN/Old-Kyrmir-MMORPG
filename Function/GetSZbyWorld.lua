local SafeZone_Pos = {
	--{ world = "MORDANMAP1.ZEN", x = 905.78521728516, z = 7113.150390625, dist = 6700 },
	{ world = "KYRMIR.ZEN", x = 0.0, z = 0.0, dist = 5000 },
	--{ world = "MORDANKHORINIS.ZEN", x = 5493.8037109375, z = 508.14431762695, dist = 8500 },
}

function GetSZParametrs( playerid )

	for i, tab in ipairs( SafeZone_Pos ) do
	
		if tab.world == GetPlayerWorld(playerid) then
		
			return tab.x, tab.z, tab.dist;
		
		end
	
	end
	
	return 0, 0, 0;

end
