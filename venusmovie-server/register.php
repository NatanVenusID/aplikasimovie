<?php
require "koneksi.php";
if ($_SERVER['REQUEST_METHOD'] == "POST") {
$response = array();
$username = $_POST['username'];
$password = md5($_POST['password']);
$full_name = $_POST['full_name'];
$email = $_POST['email'];
$phonenumber = $_POST['phonenumber'];
// langkah 2
$cek = "SELECT * FROM tb_movie WHERE username='$username'";
$result = mysqli_fetch_array(mysqli_query($connect, $cek));
if (isset($result)) {
$response['value'] = 2;
$response['message'] = "Username telah digunakan";
echo json_encode($response);
} else {
$insert = "INSERT INTO tb_movie VALUE(NULL,
'$username','$email', '$full_name','$password','$phonenumber',
NOW())";
if (mysqli_query($connect, $insert)) {
$response['value'] = 1;
$response['message'] = "Berhasil didaftarkan";
echo json_encode($response);
} else {
$response['value'] = 0;
$response['message'] = "Gagal didaftarkan";
echo json_encode($response);
}
}
}
?>
