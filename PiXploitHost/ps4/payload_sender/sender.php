<?php 
    
include 'config.php';
	
echo "Connecting to " . SERVER_IP . ":" . SERVER_PORT . "<br>";		
		
// connect to the port
$socket = fsockopen(SERVER_IP, SERVER_PORT, $errno, $errstr, 30);

// if connection not successfull, display error
if (!$socket)
	{
		die($errstr);
	}
else
	{
		
		echo "Connection successful" . "<br>";		
		
		// connection successfull		
		$filename = PAYLOADS_DIR . $_POST["selPayloadToSend"];
		
		echo "Loading payload file..." . $filename . "<br>";
		
		$handler = fopen($filename, "rb");
		$content = fread($handler, filesize($filename));
		fclose($handler);
		
		echo "Sending payload..." . "<br>";
		fwrite($socket,$content);
				
		echo "DONE!!!" . "<br>";
	}

fclose($socket);
echo "Connection closed" . "<br>";
?>
