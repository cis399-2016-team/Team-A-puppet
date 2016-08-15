<?php

require_once dirname(__FILE__) . '/phpass-0.3/PasswordHash.php';
require_once '/var/www/connectionData.php';

session_start();

$hash_cost_log2 = 8;

$hash_portable = FALSE;


$username = $_POST['user'];
$password = $_POST['pass'];

$name = preg_replace('/[^A-Za-z0-9_]/', '', $username);
$res = '*';

try {
	$conn = new mysqli($server, $user, $pass, $dbname, $port);

        if ($conn->connect_error)
        {
                header("Location: http://ec2-52-36-169-138.us-west-2.compute.amazonaws.com/login.php?msg=Error, could not connect to database");
                exit();
        }

        $stmt = $conn->prepare("SELECT pass FROM users WHERE user=?");
        $stmt->bind_param("s", $name);
        $stmt->execute();
        $stmt->bind_result($res);
        $stmt->fetch();
        $stmt->close();
        $conn->close();
}
catch (Exception $e)
{
        print_r($e);
}

$hasher = new PasswordHash($hash_cost_log2, $hash_portable);

if ($hasher->CheckPassword($password, $res))
{
       unset($hasher);
	$_SESSION['valid'] = true;
	$_SESSION['timeout'] = time();
        header("Location: http://ec2-52-36-169-138.us-west-2.compute.amazonaws.com/BirdSim.html");
        exit();
}

unset($hasher);
header("Location: http://ec2-52-36-169-138.us-west-2.compute.amazonaws.com/login.php?msg=Login+Failed");
exit();
?>
