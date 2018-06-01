<?php 
    
        include 'config.php';
    
        $handle=opendir(PAYLOADS_DIR);
        
        if ($handle) {
            while ($file = readdir($handle)){
                if($file != "." && $file != ".." && $file != "/" && (strpos($file,".bin"))){
                    $dirlist[] = $file;
                }
            }                        
        }       
        
        closedir($handle);
		
        $i = 0;
        $option = "";
        
        while(IsSet($dirlist[$i])){            
            $fileName = $dirlist[$i];
            $option .= "<option value='" . $fileName . "'>" . $fileName . "</option>";            
            $i++;                    
        }		
		
?>

<!DOCTYPE html>
<html lang="en">
  <head>
    <title>PHP PS4 payload sender</title>
    <link rel="stylesheet" href="../../css/exploitHost.css" type="text/css">
    <script type="text/javascript" src="js/scripts.js"></script>
  </head>
  <body>
    <h1>PHP PS4 payload sender</h1>
    
	<form name="frmPayloadSelector" action="sender.php" method="POST">
		<label>Payload:</label> 
		<select name="selPayloadToSend" id="selPayloadToSend">
        
<?php        

	print($option);
        
?>   
    
		</select>
		<input type="submit" value="Send">
	</form>
  
  </body>
</html>