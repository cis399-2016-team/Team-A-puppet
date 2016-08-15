<DOCTYPE=html>
<html>
<head>
	<title>Login Page</title>
</head>
<body>
<?php

if (isset($_GET['msg']))
	echo '<h1>' . $_GET['msg'] . '</h1>';

?>


<form action="verify.php" method="POST">
Username:<br>
<input type="text" name="user" size="60"><br>
Password:<br>
<input type="password" name="pass" size="60"><br>
<input type="submit" value="Log in">
</form>

<form action="createUser.php" method="POST">
Username:<br>
<input type="text" name="user" size="60"><br>
Password:<br>
<input type="password" name="pass" size="60"><br>
Retype Password:<br>
<input type="password" name="pass2" size="60"><br>
<input type="submit" value="Create Account">
</form>

<a href="https://github.com/cis399-2016-team/Team-A-puppet/issues">Account Issue Report</a>
<a href="https://github.com/VanDeniz/BirdSim/issues">Game Bug Report</a>
</body>
</html>
