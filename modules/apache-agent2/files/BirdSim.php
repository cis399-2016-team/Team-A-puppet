<html>
   <head>
      <title>Welcome to Bird Sim!</title>
   </head>

   <?php

	session_start();

	if (isset( $_SESSION['valid'])&& $_SESSION['valid'] == true)
	{
    	if ($_SESSION['timeout'] < time() - 300)
    	{
        	session_regenerate_id(true);
        	$_SESSION['timeout'] = time();

	?>
			<applet code="BirdSimPackage/Main.class" 
	   				archive="BirdSim.jar"
           			height=600 width=900> 
   			</applet>

	<?php

		}
	}

	else
    {	
    	header("Location: https://ec2-52-36-169-138.us-west-2.compute.amazonaws.com/login.php?msg=Whoops!+Please+retry+it.");
    }
    ?>
  
</html>
