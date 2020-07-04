local NPC = {};	

function SpawnNPCnoDialog()

	NPC.Doman = AddNPC("Доман", 2723.4328613281, 102.73315429688, 563.74267578125, 142, "ITAR_MIL_L", "ITMW_SHORTSWORD5", "", "S_LGUARD", "Hum_Body_Naked0", 2, "Hum_Head_Pony", 13, "MORDANMAP1.ZEN"); --straznik
	NPC.Zyro = AddNPC("Зиро", -962.5185546875, 98.636329650879, 3078.001953125, 72, "ITAR_MIL_L", "ITMW_SHORTSWORD5", "", "S_LGUARD", "Hum_Body_Naked0", 2, "Hum_Head_Pony", 18, "MORDANMAP1.ZEN"); --straznik
	NPC.Unik = AddNPC("Уник", 2636.4506835938, 98.865211486816, 2920.6774902344, 243, "ITAR_MIL_L", "ITMW_SHORTSWORD5", "", "S_LGUARD", "Hum_Body_Naked0", 2, "Hum_Head_Pony", 19, "MORDANMAP1.ZEN"); --straznik
	NPC.Tolomir = AddNPC("Толимир", 657.58581542969, 98.271324157715, 1036.9295654297, 346, "ITAR_MIL_L", "ITMW_SHORTSWORD5", "", "S_LGUARD", "Hum_Body_Naked0", 2, "Hum_Head_Pony", 20, "MORDANMAP1.ZEN"); --straznik
	NPC.Sobek = AddNPC("Собек", 1375.3590087891, 439.21279907227, 98.985466003418, 159, "ITAR_MIL_L", "ITMW_SHORTSWORD5", "", "S_LGUARD", "Hum_Body_Naked0", 2, "Hum_Head_Pony", 21, "MORDANMAP1.ZEN"); --straznik
	NPC.Diedamir = AddNPC("Дидамир", 3111.1240234375, 439.92776489258, 1454.8123779297, 118, "ITAR_MIL_L", "ITMW_SHORTSWORD5", "", "S_LGUARD", "Hum_Body_Naked0", 2, "Hum_Head_Pony", 22, "MORDANMAP1.ZEN"); --straznik
	NPC.Miron = AddNPC("Мирон", -1507.3746337891, 438.1875, 134.99291992188, 197, "ITAR_MIL_L", "ITMW_SHORTSWORD5", "", "S_LGUARD", "Hum_Body_Naked0", 2, "Hum_Head_Pony", 23, "MORDANMAP1.ZEN"); --straznik
	NPC.Gawor = AddNPC("Гавор", -1724.5886230469, 176.48678588867, 923.40466308594, 142, "ITAR_KDF_L", "s_book_s1", "", "S_LGUARD", "Hum_Body_Naked0", 2, "Hum_Head_Pony", 24, "MORDANMAP1.ZEN"); --mag_czyta
	NPC.Niemst = AddNPC("Немст", -2195.6145019531, 174.82777404785, 810.30438232422, 209, "ITAR_KDF_L", "s_book_s1", "", "S_LGUARD", "Hum_Body_Naked0", 2, "Hum_Head_Pony", 25, "MORDANMAP1.ZEN"); --mag_czyta
	NPC.Dalibor = AddNPC("Далибор", -370.8815612793, 92.002105712891, 5220.9897460938, 158, "ITAR_BAU_L", "ITMI_BROOM", "", "S_BROOM_S1", "Hum_Body_Naked0", 2, "Hum_Head_Pony", 26, "MORDANMAP1.ZEN"); --sprzata
	NPC.Mir = AddNPC("Мир",  2068.1257324219, 98.793281555176, 3411.9631347656, 145, "ITAR_VLK_L", "ItMw_FrancisDagger_Mis", "", "s_lguard", "Hum_Body_Naked0", 2, "Hum_Head_Pony", 27, "MORDANMAP1.ZEN"); --obywatel1
	NPC.Siebar = AddNPC("Сабир", -175.78749084473, 98.185203552246, 5867.5185546875, 355, "ITAR_VLK_M", "ItMw_FrancisDagger_Mis", "", "s_pee", "Hum_Body_Naked0", 2, "Hum_Head_Pony", 28, "MORDANMAP1.ZEN"); --obywatel_sika
	NPC.Jarost = AddNPC("Ярос", -917.27825927734, 98.201210021973, 4860.8012695312, 159, "ITAR_VLK_H", "ItMw_FrancisDagger_Mis", "", "t_dialoggesture_01", "Hum_Body_Naked0", 29, "Hum_Head_Pony", 15, "MORDANMAP1.ZEN"); --obywatel3
	NPC.Mestek = AddNPC("Местек", -913.95452880859, 98.176261901855, 4729.8623046875, 359, "ITAR_VLK_H", "ItMw_FrancisDagger_Mis", "", "t_dialoggesture_01", "Hum_Body_Naked0", 30, "Hum_Head_Pony", 15, "MORDANMAP1.ZEN"); --obywatel3
	NPC.Lubert = AddNPC("Люберт", 2427.0869140625, 98.025413513184, 1513.1252441406, 240, "ITAR_VLK_M", "ItMw_FrancisDagger_Mis", "", "s_pee", "Hum_Body_Naked0", 2, "Hum_Head_Pony", 31, "MORDANMAP1.ZEN"); --obywatel2
	NPC.Drogot = AddNPC("Дрогот", -6083.2270507812, 9.7164669036865, -18540.955078125, 123, "ITAR_BAU_L", "ItMW_Addon_Knife01", "", "T_plunde", "Hum_Body_Naked0", 2, "Hum_Head_Pony", 32, "MORDANMAP1.ZEN"); --farmer
	NPC.Gosko = AddNPC("Госко", -5936.9599609375, 22.248201370239, -19934.794921875, 73, "ITAR_BAU_M", "ItMW_Addon_Knife01", "", "S_RAKE_S1", "Hum_Body_Naked0", 2, "Hum_Head_Pony", 33, "MORDANMAP1.ZEN"); --farmer_grabie
	NPC.Lestek = AddNPC("Лестек", -4852.3432617188, -180.25520324707, -19181.966796875, 324, "ITAR_BAU_L", "ItMW_Addon_Knife01", "", "T_plunde", "Hum_Body_Naked0", 2, "Hum_Head_Pony", 34, "MORDANMAP1.ZEN"); --farmer
	NPC.Przybek = AddNPC("Прибек", -3380.1967773438, -432.10098266602, -19780.2890625, 13, "ITAR_BAU_M", "ItMW_Addon_Knife01", "", "S_RAKE_S1", "Hum_Body_Naked0", 2, "Hum_Head_Pony", 35, "MORDANMAP1.ZEN"); --farmer_grabie
	NPC.Milej = AddNPC("Милей", -6737.6274414062, 41.048938751221, -16083.783203125, 36, "ITAR_BAU_L", "ItMW_Addon_Knife01", "", "T_plunde", "Hum_Body_Naked0", 2, "Hum_Head_Pony", 36, "MORDANMAP1.ZEN"); --farmer
	NPC.Rolik = AddNPC("Ролик", -7074.7646484375, 65.470527648926, -14195.813476562, 116, "ITAR_BAU_M", "ItMW_Addon_Knife01", "", "S_RAKE_S1", "Hum_Body_Naked0", 2, "Hum_Head_Pony", 37, "MORDANMAP1.ZEN"); --farmer_grabie
	NPC.Polemir = AddNPC("Полемир", -5256.396484375, -144.81910705566, -14031.515625, 127, "ITAR_BAU_L", "ItMW_Addon_Knife01", "", "T_plunde", "Hum_Body_Naked0", 2, "Hum_Head_Pony", 38, "MORDANMAP1.ZEN"); --farmer
	NPC.Nasko = AddNPC("Наско", 10301.942382812, 1564.3223876953, -13371.291992188, 4, "ITAR_MIL_L", "ITMW_SHORTSWORD5", "", "S_LGUARD", "Hum_Body_Naked0", 2, "Hum_Head_Pony", 39, "MORDANMAP1.ZEN"); --straznik
	NPC.Fulkon = AddNPC("Фалькон", 10042.4453125, 1556.6643066406, -15341.317382812, 0, "ITAR_MIL_L", "ITMW_SHORTSWORD5", "", "t_1hsfree", "Hum_Body_Naked0", 2, "Hum_Head_Pony", 40, "MORDANMAP1.ZEN"); --rekrut
	NPC.Wark = AddNPC("Варк", 10256.333984375, 1536.6577148438, -15342.040039062, 0, "ITAR_MIL_L", "ITMW_SHORTSWORD5", "", "t_1hsfree", "Hum_Body_Naked0", 2, "Hum_Head_Pony", 41, "MORDANMAP1.ZEN"); --rekrut
	NPC.Bohdar = AddNPC("Бохдар", 10257.034179688, 1552.1088867188, -15104.221679688, 0, "ITAR_MIL_L", "ITMW_SHORTSWORD5", "", "t_1hsfree", "Hum_Body_Naked0", 2, "Hum_Head_Pony", 42, "MORDANMAP1.ZEN"); --rekrut
	NPC.Zasz = AddNPC("Зак", 10072.204101562, 1563.6300048828, -15083.783203125, 6, "ITAR_MIL_L", "ITMW_SHORTSWORD5", "", "t_1hsfree", "Hum_Body_Naked0", 2, "Hum_Head_Pony", 43, "MORDANMAP1.ZEN"); --rekrut
	NPC.Bolko = AddNPC("Болько", 9923.4248046875, 1564.7727050781, -14711.426757812, 147, "ITAR_MIL_M", "ITMW_SHORTSWORD5", "", "s_lguard", "Hum_Body_Naked0", 2, "Hum_Head_Pony", 44, "MORDANMAP1.ZEN"); --trener
	NPC.Surad = AddNPC("Сурад", 11139.2890625, 1481.1950683594, -15439.321289062, 58, "ITAR_BAU_L", "ITMI_BROOM", "", "S_BROOM_S1", "Hum_Body_Naked0", 2, "Hum_Head_Pony", 45, "MORDANMAP1.ZEN"); --sprzata
	NPC.Nowojok = AddNPC("Новойек", 9885.234375, 1190.5863037109, -10903.516601562, 88, "ITAR_VLK_M", "ItMw_FrancisDagger_Mis", "", "s_hguard", "Hum_Body_Naked0", 2, "Hum_Head_Pony", 46, "MORDANMAP1.ZEN"); --obywatel2

end