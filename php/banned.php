<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="description" content="Bany" />
<meta name="keywords" content="banlist,zbanowani gracze kyrmir,banned kyrmir"/>
<meta name="author" content="midas"/>

<title>Kyrmir MMORPG - Bany</title>
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
       
		header('Content-type: text/html; charset=utf8');

		mysql_query("SET CHARSET utf8_general_ci");

		mysql_query("SET NAMES 'utf8_general_ci' COLLATE 'utf8_polish_ci'");

		ini_set('display_errors', 1);
        $connection = null;
     
        function connect($server, $user, $password, $db)
        {
            global $connection;
            $connection = mysql_connect($server, $user, $password);
			mysql_query("SET NAMES 'utf8'");	
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
       
		$db = array( 'localhost', '', '7i', 'e' );
        connect($db[0], $db[1], $db[2], $db[3]);
           
        $objects_array = array();
		$result = mysql_query("SELECT `nick`, `reason`, `nnick` FROM BanList");
     
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
        echo '<td>Zbanowany</td>';     
		echo '<td>Powód bana</td>';	
		echo '<td>Nadał</td>';
        echo '</tr>';
        
        $ig = 0;
        
        for($i=$start; $i < $end; $i++){
            if(isset($objects_array[$i])){
                global $ig;
                $ig++;
                echo '<tr>';
				echo '<td>'.$objects_array[$i]->nick.'</td>';
				echo '<td>'.$objects_array[$i]->reason.'</td>';		
				echo '<td>'.$objects_array[$i]->nnick.'</td>';
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


