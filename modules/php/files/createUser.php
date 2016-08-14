<?php

require_once dirname(__FILE__) . '/phpass-0.3/PasswordHash.php';
require_once dirname(__FILE__) . '/../connectionData.txt';

$hash_cost_log2 = 8;

$hash_portable = FALSE;

$username = $_POST['user'];
$password = $_POST['pass'];

if (count($argv) == 3)
{
	$username = $argv[1];
	$password = $argv[2];
}

if (strlen($password) < 10)
{
        header("Location: http://ec2-52-36-169-138.us-west-2.compute.amazonaws.com/login.php?msg=Please+use+a+password+with+a+minimum+length+of+10+characters");
        exit();
}


try {
        $conn = new mysqli($server, $user, $pass, $dbname, $port);

        if ($conn->connect_error)
        {
                header("Location: http://ec2-52-36-169-138.us-west-2.compute.amazonaws.com/login.php?msg=Error, could not connect to database");
                exit();
        }

        $hasher = new PasswordHash($hash_cost_log2, $hash_portable);
        $hash_str = $hasher->HashPassword($password);
        if (strlen($hash_str) < 20)
                die('Failed to hash new password');
        unset($hasher);

        $stmt = $conn->prepare("INSERT INTO users (user, pass) VALUES (?, ?)");

        if ($stmt === false)
        {
                header("Location: http://ec2-52-36-169-138.us-west-2.compute.amazonaws.com/login.php?msg=Failed+to+create+account,+please+try+a+different+username");
                exit();
        }

        var_dump($stmt);

        $stmt->bind_param("ss", $username, $hash_str);


        $stmt->execute();
        $stmt->close();
        $conn->close();

        header("Location: http://ec2-52-36-169-138.us-west-2.compute.amazonaws.com/login.php?msg=Your+account+was+successfully+created.");
}
catch (Exception $e)
{
        print_r($e);
}
exit();

?>
     
