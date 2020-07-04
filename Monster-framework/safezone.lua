local SafeZone = {
	{city = "SO", dist = 6000.73828125, x = 0, y = 0},
}

function GetSafeZone(playerid)
	
	local x, y, z = GetPlayerPos( playerid );
	
	for i, safe in ipairs( SafeZone ) do
	
		if GetDistance2D(safe.x, safe.y, x, z) <= safe.dist then
			
			return true;
			
		else

			return false;
		
		end
	
	end

end