<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="description" content="Najlepsi gracze serwera Kyrmir MMORPG." />
<meta name="keywords" content="toplist,najlepsi gracze kyrmir,top kyrmir"/>
<meta name="author" content="midas"/>

<title>Kyrmir MMORPG - Najlepsi gracze</title>
<style type="text/css">
body{
	font: 12px tahoma,helvetica,arial,sans-serif;
	position: relative;
	background-color: #060709;
	background-repeat: repeat;
	background-position: center 0;
}

#content {
	position:relative;
	z-index:1;
}

img#tlo {
    position:fixed;
    top:0;
    left:0; 
    width:100%;
    height:100%;
}

div.rank_body{
    margin-top: 5%;
}

div.page_changer{
    margin-top: 2%;
}

div.page_changer a:link, a:visited{
    margin-top: 2%;
    text-decoration: none;
    color: #a5c3d1;
    font-size: 26px;
}

div.page_changer a:hover{
    margin-top: 2%;
    text-decoration: none;
    color: #a5c3d1;
    font-weight:bold;
    font-size: 28px;
}

div.footer{
    margin-top: 2%;
    color: #a5c3d1;
}

</style>
</head>

<body>

	

    <?php
            ini_set('display_errors', 1);
        $connection = null;
     
        function connect($server, $user, $password, $db)
        {
            global $connection;
            $connection = mysql_connect($server, $user, $password);
            if($connection){
                if(mysql_select_db($db, $connection)){
                    return true;
                }
                else{
                    mysql_close($connection);
                    return false;
                }
            }
        }
       
        function disconnect()
        {
            global $connection;
            if($connection){
                mysql_close($connection);
            }
        }
       
        //Dane bazy
			$db = array( 'localhost', 'ot', 'Esi', 'Kyrmise' );
            connect($db[0], $db[1], $db[2], $db[3]);
           
            $rank = array('Czyste zło', 'Okrutny', 'Agresywny', 'Złośliwy', 'Nieuczciwy', 'Neutralny', 'Przyjazny', 'Dobry', 'Szlachetny', 'Rycerski', 'Święty');
            $rank_points = array( -5000, -2000, -1000, -400, -100, 0, 1000, 3000, 10000, 20000, 50000);
       
            function GetRank( $points )
            {
                    global $rank;
                global $rank_points;
               
            for ($i = 0; $i <= count($rank) - 1; $i++) {
               
                            if ($points < $rank_points[$i + 1])
                            {
                                    return $rank[$i];
                            }
                           
                    }
             
            }
            
              
			$gold = array( 'Mało', 'Dużo', 'Ogrom');
            $gold_points = array( 5000, 50000, 150000 );
       
            function GetGold( $points )
            {
                global $gold;
                global $gold_points;
              
			 
            for ($i = 0; $i <= count($gold) - 1; $i++) {
               
                            if ($points < $gold_points[$i])
                            {
                                    return $gold[$i];
                            }
                           
                    }
             }
                    
					
					
            function GetWinPercent( $win, $lose )
            {      
                    if ($lose > 0 or $win > 0) {
                    return round(($win*100)/($win+$lose), 0);
                    } else
                            return 0;
            }
           
        $objects_array = array();
        $result = mysql_query('SELECT `nick`, `exp`, `exp_next_lvl`, `lvl`, `rank`, `gold`, `pvp_win`, `monsterkill`, `pvp_lose`, `playerkill` FROM `player` WHERE `nick` != "Profesores" ORDER BY `lvl` DESC, `exp` DESC');
     
        while($row = mysql_fetch_object($result)){
            global $objects_array;
            array_push($objects_array, $row);
        }
        
        $objects_array_num = count($objects_array);
        $objects_per_page = 30;
        
        if(isset($_GET['strona'])){
            $aktualna_strona = $_GET['strona'];
        }
        else{
            $aktualna_strona = 1;
        }
        
        $start = ($objects_per_page * $aktualna_strona - $objects_per_page);
        $end = ($start + $objects_per_page);
        
        
        echo '<center>';
		echo '<img src="http://kyrmir.gothic-multiplayer.com/styles/MMORPG/theme/images/tlo.jpg" id="tlo"/><div id="content">';
        echo '<div class="rank_body">';
        echo '<h2><div id="wrap" style="width: 100%;"><a href="http://kyrmir.gothic-multiplayer.com/"><img src="http://kyrmir.gothic-multiplayer.com/styles/MMORPG/theme/images/logo.png"></a></img></div></h2>';
        echo '<table border="1" style="table-layout:fixed; color:#a5c3d1;">';
        echo '<tr>';
        echo '<td><b>Pozycja</b></td>';
        echo '<td><b>Nazwa</b></td>';
        echo '<td><b>Poziom</b></td>';
        echo '<td><b>Doświadczenie</b></td>';
        echo '<td><b>Potrzebne doświadczenie</b></td>';
        echo '<td><b>Ranga</b></td>';
        echo '<td><b>Złoto</b></td>';		
		echo '<td><b>Zabito potworów</b></td>';		
        echo '<td><b>Zabito graczy</b></td>';
        echo '<td><b>Wygrane PvP</b></td>';
        echo '</tr>';
        
        $ig = 0;
        
        for($i=$start; $i < $end; $i++){
            if(isset($objects_array[$i])){
                global $ig;
                $ig++;
                echo '<tr>';
                echo '<td>'.($i+1).'</td>';
                echo '<td>'.$objects_array[$i]->nick.'</td>';
                echo '<td>'.$objects_array[$i]->lvl.'</td>';
                echo '<td>'.$objects_array[$i]->exp.'</td>';
                echo '<td>'.$objects_array[$i]->exp_next_lvl.'</td>';
                echo '<td>'.GetRank($objects_array[$i]->rank).'</td>';
                echo '<td>'.GetGold($objects_array[$i]->gold).'</td>';
				echo '<td>'.$objects_array[$i]->monsterkill.'</td>';
                echo '<td>'.$objects_array[$i]->playerkill.'</td>';
                echo '<td>'.GetWinPercent($objects_array[$i]->pvp_win, $objects_array[$i]->pvp_lose).'%</td>';
                echo '</tr>';
            }
        }
        
        echo '</table>';
        echo '</div>';
        
        echo '<div class="page_changer">';
        if($aktualna_strona > 1){
            echo '<font color="white"><a href="top.php?strona='. ($aktualna_strona - 1) .'"><</a></font>';
        }
        echo ' ';
        if($ig == $objects_per_page){
            echo '<font color="white"><a href="top.php?strona='. ($aktualna_strona + 1) .'">></a></font>';
        }
        echo '</div>';
        
        echo '<div class="footer">'.
             '&copy; 2013-2014 Kyrmir MMORPG<br>'.
             'Developed by: midas ||'.
             '</div>';
        
        echo '</div></center>';
    ?>

	
</body>
</html>

