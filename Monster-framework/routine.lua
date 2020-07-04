local Routines = {}

function AddRoutineForNPC(npcid, hour, minute)
	table.insert(Routines,{id = npcid, h = hour, m = minute})
end

function RemoveNPCRoutine(npcid, hour, minute)
	for k, v in ipairs(Routines) do
	if v.id == npcid and v.h == hour and v.m == minute then
		table.remove(Routine, k)
	end
	end
end

function CheckRoutine()
	for k, v in ipairs(Routines)
do
		local hour, minute = GetTime()
		if v.h == hour and v.m == minute then
	OnBotRoutine(v.id, hour, minute) -- callback
		end 
	end
end

function OnBotRoutine(npcid, hour, minute)
	--Do something ;3
end