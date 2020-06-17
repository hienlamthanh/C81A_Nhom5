<?php
	include "connect.php";
	$query = "SELECT  * FROM loaisach";
	$data = mysqli_query($conn,$query);
	$mangloaisach = array();
	while ($row = mysqli_fetch_assoc($data)) {
		array_push($mangloaisach, new Loaisach(
			$row['id'],
			$row['tenloaisach'],
			$row['hinhanhloaisach']));
	}
	echo json_encode($mangloaisach);
	class Loaisach{
		function Loaisach($id,$tenLoaisach,$hinhanhLoaisach){
			$this->id = $id;
			$this->tenLoaisach = $tenLoaisach;
			$this->hinhanhLoaisach = $hinhanhLoaisach;
		}
	}
?>