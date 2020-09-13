<?php 

	include 'koneksi.php';
	if ($_SERVER['REQUEST_METHOD'] == "POST"){
	$response = array();
	$id_user = $_POST['id_user'];
	$id_movie = $_POST['id_movie'];
	
	$cek = "SELECT * FROM tb_favorite_movie WHERE id_movie='$id_movie' AND id_user='$id_user'";
	$result = mysqli_num_rows(mysqli_query($connect, $cek));
	if ($result > 0){
	$response['message'] = "Movie sudah di tambahkan ke favorite";
	echo json_encode($response);
	}else {
	$insert ="INSERT INTO tb_favorite_movie VALUE(NULL,'$id_user','$id_movie')";
	if (mysqli_query($connect, $insert)) {
	$response['value'] = 1;
	$response['message'] = "favorite movie ditambahkan";
	echo json_encode($response);
	} else {
	$response['value'] = 0;
	$response['message'] = "Gagal ditambahkan";
	echo json_encode($response);
}
}
}
	
?>






