<?php
	include "connect.php";
	$mangsachmoinhat = array();
	$query = "SELECT * FROM sach ORDER BY ID DESC LIMIT 6";

	$data = mysqli_query($conn,$query);
	while ($row = mysqli_fetch_assoc($data)) {
		array_push($mangsachmoinhat, new Sachmoinhat(
			$row['id'],
			$row['tensach'],
			$row['giasach'],
			$row['hinhanhsach'],
			$row['mota'],
			$row['idsach']));	
	}
	echo json_encode($mangsachmoinhat);
	class Sachmoinhat{
		function Sachmoinhat($id,$tensach,$giasach,$hinhanhsach,$mota,$idsach){
			$this->id=$id;
			$this->tensach=$tensach;
			$this->giasach=$giasach;
			$this->hinhanhsach=$hinhanhsach;
			$this->mota=$mota;
			$this->idsach=$idsach;

		} 
	}
?>