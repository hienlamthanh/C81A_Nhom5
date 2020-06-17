<?php
	include "connect.php";
	$page = $_GET['page'];
	$ids = $_POST['idsach'];
	$space = 10;
	$limit = ($page - 1) *$space;
	$mangsach = array();
	$query = "SELECT * FROM sach WHERE idsach = $ids LIMIT $limit,$space";
	$data = mysqli_query($conn,$query);
	while ($row = mysqli_fetch_assoc($data)) {
		array_push($mangsach, new Sach(
			$row['id'],
			$row['tensach'],
			$row['giasach'],
			$row['hinhanhsach'],
			$row['mota'],
			$row['idsach']));	
	}
	echo json_encode($mangsach);
	class Sach{
		function Sach($id,$tensach,$giasach,$hinhanhsach,$mota,$idsach){
			$this->id=$id;
			$this->tensach=$tensach;
			$this->giasach=$giasach;
			$this->hinhanhsach=$hinhanhsach;
			$this->mota=$mota;
			$this->idsach=$idsach;
		} 
	}
?>