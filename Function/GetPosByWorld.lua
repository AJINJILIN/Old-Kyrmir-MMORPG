local PosbyWorld = {
	{ world = "MORDANMAP1.ZEN", x = -2091.1381835938, y = 177.61993408203, z = 1173.50390625, angle = 83 },
	{ world = "OLDWORLD\\OLDWORLD.ZEN", x = 0, y = 350, z = 0, angle = 0 },
	{ world = "MORDANKHORINIS.ZEN", x = 9975.5537109375, y = 368.33773803711, z = -707.26049804688, angle = 257 },
	{ world = "KYRMIR.ZEN", x = 992.57830810547, y = 897.88537597656, z = -3209.0400390625, angle = 181 },
}

function GetPosByWorld( playerid )

	for i, tab in ipairs( PosbyWorld ) do
	
		if tab.world == GetPlayerWorld(playerid) then
		
			return tab.x, tab.y, tab.z, tab.angle;
		
		end
	
	end

end