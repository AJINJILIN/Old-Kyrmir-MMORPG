local Head = {
	"Hum_Head_FatBald",
	"Hum_Head_Fighter",
	"Hum_Head_Pony",
	"Hum_Head_Bald",
	"Hum_Head_Thief",
	"Hum_Head_Psionic",
	"Hum_Head_Babe",
}

local Body = {
	"Hum_Body_Naked0",
	"Hum_Body_Babe0",
}

function GetHeadID( id )
	
	if Head[id] == nil then
	
		return "Hum_Head_FatBald";
	
	else
		
		return Head[id];
	
	end
	
end

function GetBodyID( id )

	if Body[id] == nil then
	
		return "Hum_Body_Naked0";
	
	else
		
		return Body[id];
	
	end

end

function GetHeadNumber( head )

	for i = 1, #Head do
		
		if head == Head[i] then
			
			return i;
			
		end
		
	end

end