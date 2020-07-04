local CheckPosNPC = 360;
local CounterCheckPosNPC = 0;

function CheckNPCPos()
	if CounterCheckPosNPC == CheckPosNPC then
		local Pos = getSuperInfo();
		
					local x,y,z = GetPlayerPos(i);
		for i = GetMaxSlots() - 1 - GetMaxNPC(), GetMaxSlots() - 1 do
			for j = 1, #Pos do
				if GetPlayerName(i) == Pos[j][1] then
					local angles = GetPlayerAngle(i);
					local xx,yy,zz,angle = Pos[j][2],Pos[j][3],Pos[j][4],Pos[j][5];
					
					if x ~= xx or y ~= yy or z ~= zz or angles ~= angle then
						SetPlayerPos(i, xx, yy + 100, zz);
						SetPlayerAngle(i, angle);
					end
				end
			end
		end
		
		CounterCheckPosNPC = 0;
	else
		CounterCheckPosNPC = CounterCheckPosNPC + 1;
	end
end

function ShowTimeCheck(playerid)

	SendPlayerMessage(playerid, 255, 255, 0, "Время: "..(CheckPosNPC-CounterCheckPosNPC).."");

end

function ChangeTimeCheck(params, playerid)

	local result, _time = sscanf(params, "d");
	
	if result == 1 then
	
		CheckPosNPC = _time;
		SendPlayerMessage(playerid, 255, 255, 0, "Изменено.");
	
	end

end