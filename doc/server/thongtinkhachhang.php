<?php
	include "connect.php";
	$tenkhachhang = $_POST['ten'];
	$sdt = $_POST['sdt'];
	$email = $_POST['email'];
	if(strlen($tenkhachhang) > 0 && strlen($email) > 0 && strlen($sdt) > 0){
		$query = "INSERT INTO donhang(id, tenkhachhang, sdt,email) VALUES (null,'$tenkhachhang','$sdt', '$email')";
		if (mysqli_query($conn,$query)) {
			$iddonhang = $conn->insert_id;
			echo $iddonhang;
		}else{
			echo "thất bại";
		}
	}else{
		echo "bạn hãy kiểm tra lại dữ liệu";
	}
?>