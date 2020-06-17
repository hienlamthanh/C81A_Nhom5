<?php
	 include "connect.php";
	$json = $_POST['json'];
	$data = json_decode($json,true);
	foreach ( $data as $value) {
		$madonhang = $value['madonhang'];
		$masach = $value['masach'];
		$tensach = $value['tensach'];
		$giasach = $value['giasach'];
		$soluong = $value['soluong'];
		$query = "INSERT INTO chitietdonhang (id, madonhang, masach, tensach, giasach, soluong) VALUES (null, '$madonhang', '$masach', '$tensach', '$giasach', '$soluong')";
		$Dta = mysqli_query($conn,$query);
		}
		if($Dta){
			echo "1";
		}else{
			echo "0";
		}
?>