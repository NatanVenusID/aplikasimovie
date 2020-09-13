<?php
include 'koneksi.php';
 $id = (isset($_POST['id']) ? $_POST['id'] : '');
$connect->query("DELETE FROM tb_favorite_movie WHERE id='$id'");
?>
