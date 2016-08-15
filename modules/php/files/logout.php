<?php
	session_start();
	
	session_destroy();
	header("Location:Location: https://ec2-52-36-169-138.us-west-2.compute.amazonaws.com/login.php?msg=Log+out+successfully.");
	exit;
?>
