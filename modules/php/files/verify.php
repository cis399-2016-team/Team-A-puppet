<?php
include('connectionData.txt');

$password = $_POST['password'];
$name = $_POST['username'];

$conn = new mysqli($server, $user, $pass, $dbname)

if ($conn->connect_error) {
	die("Could not connect to Database");
}

if ($stmt = $conn->prepare("SELECT password FROM Users WHERE username=?"))
{
	$uname = preg_replace('/[^A-Za-z0-9_/', '', $name);
	$stmt->bind_param("s", $uname);
	$stmt->execute();
	$stmt->bind_result($res);
	$stmt->fetch();
	$stmt->close();
}
$conn->close();

$hash_str = \Sodium\crypto_pwhash_str(
    $password,
    \Sodium\CRYPTO_PWHASH_OPSLIMIT_INTERACTIVE,
    \Sodium\CRYPTO_PWHASH_MEMLIMIT_INTERACTIVE
	);

if (\Sodium\crypto_pwhash_str_verify($hash_str, $sqlpass)) {
    // recommended: wipe the plaintext password from memory
    \Sodium\memzero($password);
    
    echo "Password was valid";
    // Password was valid
}
else {
    // recommended: wipe the plaintext password from memory
    \Sodium\memzero($password);
    
    echo "Password was invalid";
    // Password was invalid.
}


?>
