<?php
$flag = '16f772b3-3551-468d-bab7-3ae2c9faff31';
	if(isset($_POST['password'])){
		$current_password = "QNKCDZO";
		$password = $_POST['password'];
		if (($current_password != $password)){
			$current_password_md5 = md5($current_password);
			$password_md5 = md5($password);
			if($current_password_md5 == $password_md5){
				echo '<script>alert("You know php well!")</script>';
				echo $flag;
			}else{
				echo('<script>alert("Your password is wrong!")</script>');
			}
		}else{
			echo('<script>alert("Your password is wrong!")</script>');
		}
	}else{
		echo('<script>alert("Input your password!")</script>');
	}
?>

<!DOCTYPE html>
<!-- I love vim~ -->
<html>
<head>
	<title>PHP-The best language for programming</title>
</head>
<body>
	<form method="POST">
		Password : <input type="password" name="password">
		<input type="submit">
	</form>
</body>
</html>
