function OnPlayerCommandText(playerid, cmdtext)

	if cmdtext == "/анимации" then
        SendPlayerMessage(playerid,255,255,255,"Анимации: /сесть /сесть2 /спать /ссать /танец1-20 /осмотреться /молиться /копаться /обыскать"); 
        SendPlayerMessage(playerid,255,255,255,"/страж /страж2 /смерть /магия1 /магия2 /магия3 /магия4 /тестброни");
		SendPlayerMessage(playerid,255,255,255,"/молоток /отогнать /смотреть1-2 /кивок1-2 /тренировка /храм /братство");
		SendPlayerMessage(playerid,255,255,255,"Анимации лица: /злой1-2 /спокойный /испуганный1-2 /жует /закрытыеглаза");
		
	elseif cmdtext == "/молиться" then
	   PlayAnimation(playerid,"S_PRAY");
	   
	elseif cmdtext == "/копаться" then
	   PlayAnimation(playerid,"T_SEARCH");

    elseif cmdtext == "/тестброни" then
        TEST_ARMOR(playerid);
	   
	elseif cmdtext == "/обыскать" then
	   PlayAnimation(playerid,"T_PLUNDER");
	   
	elseif cmdtext == "/страж" then
	   PlayAnimation(playerid,"S_LGUARD");
	   
	elseif cmdtext == "/страж2" then
	   PlayAnimation(playerid,"S_HGUARD");
	   
	elseif cmdtext == "/смерть" then
	   PlayAnimation(playerid,"S_DEAD");   
	
	elseif cmdtext == "/магия1" then
	   PlayAnimation(playerid,"T_PRACTICEMAGIC");    
	 
	elseif cmdtext == "/магия2" then
	   PlayAnimation(playerid,"T_PRACTICEMAGIC2");    

	elseif cmdtext == "/магия3" then
	   PlayAnimation(playerid,"T_PRACTICEMAGIC3");    

	elseif cmdtext == "/магия4" then
	   PlayAnimation(playerid,"T_PRACTICEMAGIC4");  
	   
    elseif cmdtext == "/сесть" then
	   PlayAnimation(playerid,"T_STAND_2_SIT");
	   
	elseif cmd == "/тренеровать" then
   CMD_UPSila(playerid,params);
 
	elseif cmdtext == "/спать" then
	   PlayAnimation(playerid,"T_STAND_2_SLEEPGROUND");
		
	elseif cmdtext == "/ссать" then
	   PlayAnimation(playerid,"T_STAND_2_PEE");
		
	elseif cmdtext == "/тренировка" then
	   PlayAnimation(playerid,"T_1HSFREE");
		
	elseif cmdtext == "/осмотреться" then
	   PlayAnimation(playerid,"T_1HSINSPECT");
	   
	elseif cmdtext == "/танец1" then
	   PlayAnimation(playerid,"t_dance01");
	   
	elseif cmdtext == "/танец2" then
	   PlayAnimation(playerid,"t_dance02");
	   
	elseif cmdtext == "/танец3" then
	   PlayAnimation(playerid,"t_dance03");
	   
    elseif cmdtext == "/танец4" then
	   PlayAnimation(playerid,"t_dance04");
	   
	elseif cmdtext == "/танец5" then
	   PlayAnimation(playerid,"t_dance05");
	   
	elseif cmdtext == "/танец6" then
	   PlayAnimation(playerid,"t_dance06");
	   
	elseif cmdtext == "/танец7" then
	   PlayAnimation(playerid,"t_dance07");
	   
    elseif cmdtext == "/танец8" then
	   PlayAnimation(playerid,"t_dance08");
	   
	elseif cmdtext == "/танец9" then
	   PlayAnimation(playerid,"t_dance09");
	   
	elseif cmdtext == "/танец10" then
	   PlayAnimation(playerid,"t_dance10");
	   
	elseif cmdtext == "/танец11" then
	   PlayAnimation(playerid,"t_dance11");
	   
    elseif cmdtext == "/танец12" then
	   PlayAnimation(playerid,"t_dance12");
	   
	elseif cmdtext == "/танец13" then
	   PlayAnimation(playerid,"t_dance13");
	   
	elseif cmdtext == "/танец14" then
	   PlayAnimation(playerid,"t_dance14");
	   
	elseif cmdtext == "/танец15" then
	   PlayAnimation(playerid,"t_dance15");
	   
    elseif cmdtext == "/танец16" then
	   PlayAnimation(playerid,"t_dance16");
	   
	elseif cmdtext == "/танец17" then
	   PlayAnimation(playerid,"t_dance17");
	   
	elseif cmdtext == "/танец18" then
	   PlayAnimation(playerid,"t_dance18");
	   
    elseif cmdtext == "/танец19" then
	   PlayAnimation(playerid,"t_dance19");
	   
	elseif cmdtext == "/танец20" then
	   PlayAnimation(playerid,"t_dance20");
	   
	elseif cmdtext == "/молоток" then
	   PlayAnimation(playerid,"s_repair_s1");
	   
	elseif cmdtext == "/отогнать" then
	   PlayAnimation(playerid,"t_getlost2");
	   
    elseif cmdtext == "/смотреть1" then
	   PlayAnimation(playerid,"t_watchfight_ohno");
	   
	elseif cmdtext == "/смотреть2" then
	   PlayAnimation(playerid,"t_watchfight_yeah");
	   
	elseif cmdtext == "/кивок1" then
	   PlayAnimation(playerid,"t_yes");
	   
	elseif cmdtext == "/кивок2" then
	   PlayAnimation(playerid,"t_no");
	   
	elseif cmdtext == "/злой1" then
	   PlayAnimation(playerid,"s_angry");
	   
    elseif cmdtext == "/злой2" then
	   PlayAnimation(playerid,"s_hostile");
	   
	elseif cmdtext == "/спокойный" then
	   PlayAnimation(playerid,"s_friendly");
	   
	elseif cmdtext == "/испуганный1" then
	   PlayAnimation(playerid,"s_frightened");
	   
	elseif cmdtext == "/испуганный2" then
	   PlayAnimation(playerid,"t_hurt");
	   
    elseif cmdtext == "/жует" then
	   PlayAnimation(playerid,"t_eat");
	   
	elseif cmdtext == "/закрытыеглаза" then
	   PlayAnimation(playerid,"s_eyesclosed");
    end
end