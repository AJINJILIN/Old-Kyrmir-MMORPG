local Pomoc = {};
local Pomoc_texture = CreateTexture(1800, 2550, 6500, 6000, "Frame_GMPA.TGA");
local Pomoc_Draw = CreateDraw(2000, 2450, "������.", "Font_Old_20_White_Hi.TGA", 255, 255, 255);

Pomoc[0] = CreateDraw(2000, 2750, "�������:", "Font_Old_10_White_Hi.TGA", 255, 255, 255);
Pomoc[1] = CreateDraw(2000, 2950, "/������ - ����� �� ������.", "Font_Old_10_White_Hi.TGA", 255, 255, 255);
Pomoc[2] = CreateDraw(2000, 3150, "/����� - ������� ����������� � ������.", "Font_Old_10_White_Hi.TGA", 255, 255, 255);
Pomoc[3] = CreateDraw(2000, 3350, "/���� - ������� ������ �� ������.", "Font_Old_10_White_Hi.TGA", 255, 255, 255);
Pomoc[4] = CreateDraw(2000, 3550, "/����� - ��������� ����������� � ������.", "Font_Old_10_White_Hi.TGA", 255, 255, 255);
Pomoc[5] = CreateDraw(2000, 3750, "/��� - ����������� ����� �� ��������.", "Font_Old_10_White_Hi.TGA", 255, 255, 255);
Pomoc[6] = CreateDraw(2000, 3950, "/������� - ��������� ����� �� ��������.", "Font_Old_10_White_Hi.TGA", 255, 255, 255);
Pomoc[7] = CreateDraw(2000, 4150, "/������� (����) (���-��) (����) - �������� � �������, �� �������� �� ��������.", "Font_Old_10_White_Hi.TGA", 255, 255, 255);
Pomoc[8] = CreateDraw(2000, 4350, "/� (�����) - ���������� ���.", "Font_Old_10_White_Hi.TGA", 255, 255, 255);
Pomoc[9] = CreateDraw(2000, 4550, "Shift - ���� ������, �� �������� �� ��������.", "Font_Old_10_White_Hi.TGA", 255, 255, 255);
Pomoc[10] = CreateDraw(2000, 4750, "������ - ����� �������.", "Font_Old_10_White_Hi.TGA", 255, 255, 255);
Pomoc[11] = CreateDraw(2000, 4950, "", "Font_Old_10_White_Hi.TGA", 255, 255, 255);
Pomoc[12] = CreateDraw(2000, 5150, "", "Font_Old_10_White_Hi.TGA", 255, 255, 255);
Pomoc[13] = CreateDraw(2000, 5350, "", "Font_Old_10_White_Hi.TGA", 255, 255, 255);
Pomoc[14] = CreateDraw(2000, 5550, "                                    ����� ENTER ����� ���������.", "Font_Old_10_White_Hi.TGA", 255, 255, 0);

function ShowPomoc(playerid)
	
	ShowTexture(playerid, Pomoc_texture);
	ShowDraw(playerid, Pomoc_Draw);
	
	for i = 0, #Pomoc do
		
		ShowDraw(playerid, Pomoc[i]);
		
	end

end

function HidePomoc(playerid)
	
	HideTexture(playerid, Pomoc_texture);
	HideDraw(playerid, Pomoc_Draw);
	
	for i = 0, #Pomoc do
		
		HideDraw(playerid, Pomoc[i]);
		
	end

end