<?php
include "koneksi.php";

$idUser = $_POST['id_user'];

$queryResult = $connect->query("SELECT * FROM tb_favorite_movie LEFT JOIN tb_movielist ON tb_movielist.id_movie = tb_favorite_movie.id_movie WHERE tb_favorite_movie.id_user = $idUser");
$result = array();
while($fetch_data = $queryResult->fetch_assoc()) {
$result[] = $fetch_data;
}
echo json_encode($result);
?>
