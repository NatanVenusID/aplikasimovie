-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 13, 2020 at 02:17 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.2.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_venusuniversity`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_berita`
--

CREATE TABLE `tb_berita` (
  `id_berita` int(11) NOT NULL,
  `judul` varchar(125) NOT NULL,
  `isi` text NOT NULL,
  `foto` text NOT NULL,
  `tgl_berita` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_berita`
--

INSERT INTO `tb_berita` (`id_berita`, `judul`, `isi`, `foto`, `tgl_berita`) VALUES
(1, 'Sepinya Ragunan di Hari Pertama Long Weekend', 'Jakarta - Libur panjang rupanya tak membuat kawasan Taman Margasatwa Ragunan dibanjiri pengunjung. Saat ini Taman Margasatwa tersebut beroperasi setiap hari mulai pukul 08.00-12.00 WIB.', 'berita2.jpg', '2020-08-20 19:43:49'),
(2, 'JOKER', 'Joker is a 2019 American psychological thriller film directed and produced by Todd Phillips, who co-wrote the screenplay with Scott Silver. The film, based on DC Comics characters, stars Joaquin Phoenix as the Joker and provides a possible origin story for the character. Set in 1981, it follows Arthur Fleck, a failed stand-up comedian whose descent into insanity and nihilism inspires a violent counter-cultural revolution against the wealthy in a decaying Gotham City. Robert De Niro, Zazie Beetz, Frances Conroy, Brett Cullen, Glenn Fleshler, Bill Camp, Shea Whigham, and Marc Maron appear in supporting roles. Joker was produced by Warner Bros. Pictures, DC Films, and Joint Effort, in association with Bron Creative and Village Roadshow Pictures, and distributed by Warner Bros.', 'joker.jpg', '2020-09-02 07:34:17');

-- --------------------------------------------------------

--
-- Table structure for table `tb_favorite_movie`
--

CREATE TABLE `tb_favorite_movie` (
  `id` int(20) NOT NULL,
  `id_user` int(20) NOT NULL,
  `id_movie` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_favorite_movie`
--

INSERT INTO `tb_favorite_movie` (`id`, `id_user`, `id_movie`) VALUES
(6, 1, 1),
(9, 3, 1),
(10, 4, 4),
(11, 1, 6),
(18, 6, 4),
(19, 6, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tb_kamus`
--

CREATE TABLE `tb_kamus` (
  `id_istilah` int(20) NOT NULL,
  `istilah` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `arti` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_kamus`
--

INSERT INTO `tb_kamus` (`id_istilah`, `istilah`, `arti`) VALUES
(1, 'dart', 'bahasa flutter'),
(4, 'integer', 'Tipe data yang hanya bilang bulat '),
(5, 'SizedBox', 'Memberi jarak ke widget dibawahnya'),
(6, 'boolean', 'Tipe data yang hanya berisi benar atau salah');

-- --------------------------------------------------------

--
-- Table structure for table `tb_merupa`
--

CREATE TABLE `tb_merupa` (
  `id_user` int(20) NOT NULL,
  `username` varchar(125) NOT NULL,
  `email` varchar(125) NOT NULL,
  `fullname` text NOT NULL,
  `password` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `tgl_daftar` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_merupa`
--

INSERT INTO `tb_merupa` (`id_user`, `username`, `email`, `fullname`, `password`, `alamat`, `tgl_daftar`) VALUES
(1, 'a', 'a', 'a', '0cc175b9c0f1b6a831c399e269772661', 'a', '2020-08-23 14:23:42'),
(2, 'natan92', 'natan92@venus.com', 'natanael krisetya', 'e10adc3949ba59abbe56e057f20f883e', 'kudus', '2020-08-23 15:43:51'),
(3, 'eirene93', 'eirene93@venus.com', 'eirene', 'e10adc3949ba59abbe56e057f20f883e', 'semarang', '2020-08-25 20:08:02'),
(4, 'novita97', 'novita@venus.com', 'novita', 'e10adc3949ba59abbe56e057f20f883e', 'kudus', '2020-08-25 20:10:05'),
(5, 'zzz', 'zzz', 'zzz', 'f3abb86bd34cf4d52698f14c0da1dc60', 'zzz\n\n', '2020-08-27 19:54:10');

-- --------------------------------------------------------

--
-- Table structure for table `tb_movie`
--

CREATE TABLE `tb_movie` (
  `id_user` int(20) NOT NULL,
  `username` varchar(125) NOT NULL,
  `email` varchar(125) NOT NULL,
  `full_name` text NOT NULL,
  `password` varchar(50) NOT NULL,
  `phonenumber` varchar(30) NOT NULL,
  `tgl_daftar` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_movie`
--

INSERT INTO `tb_movie` (`id_user`, `username`, `email`, `full_name`, `password`, `phonenumber`, `tgl_daftar`) VALUES
(1, 'aaa', 'aaa', 'aaa', 'e10adc3949ba59abbe56e057f20f883e', '09877655555', '2020-08-31 09:39:34'),
(2, 'bbb', 'bbb', 'bbb', 'e10adc3949ba59abbe56e057f20f883e', '0764347863367', '2020-08-31 09:40:25'),
(3, 'ccc', 'ccc', 'ccc', '9df62e693988eb4e1e1444ece0578579', 'ccc', '2020-08-31 09:47:40'),
(4, 'ddd', 'ddd', 'ddd', 'e10adc3949ba59abbe56e057f20f883e', '987645678444', '2020-08-31 16:59:18'),
(5, 'eee', 'eee', 'eee', 'd2f2297d6e829cd3493aa7de4416a18f', '5555555555555', '2020-08-31 17:03:18'),
(6, 'zzz', 'zzz', 'zzz', 'e10adc3949ba59abbe56e057f20f883e', '36667777', '2020-09-12 20:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `tb_movielist`
--

CREATE TABLE `tb_movielist` (
  `id_movie` int(11) NOT NULL,
  `judul` varchar(125) NOT NULL,
  `sinopsis` text NOT NULL,
  `foto` text NOT NULL,
  `tgl_movie` datetime NOT NULL,
  `link_movie` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_movielist`
--

INSERT INTO `tb_movielist` (`id_movie`, `judul`, `sinopsis`, `foto`, `tgl_movie`, `link_movie`) VALUES
(1, 'Laundry Show', 'Kisah bermula tentang seorang pemuda yang diperankan oleh Artis Boy William ini memilih keluar dari kantornya untuk mendirikan sebuah usaha binatu. Di awal perjalanan usahanya, dia harus berhadapan dengan pegawai yang punya berbagai kepribadian jenaka nan konyol. Akan tetapi, tantangan terbesarnya lewat persaingan dari lawan mainnya yang diperankan oleh Gisella Anastasia yang juga mendirikan usaha binatu.', 'laundry.jpg', '2020-09-04 15:11:22', 'vSErniTNawM'),
(2, 'Toko Barang Mantan', 'Toko Barang Mantan, film yang dibintangi Reza Rahardian dan Marsha Timothy, rilis di bioskop-bioskop Indonesia hari ini, Kamis (20/2/2020). Toko Barang Mantan bercerita tentang Tristan, mahasiswa yang tak kunjung lulus karena skripsinya belum rampung. Dia justru asik mengurus bisnis kecil-kecilannya, Toko Barang Mantan. Namun, suatu ketika Laras (Marsha Timothy), perempuan yang disukai Tristan di masa kuliah, datang ke tokonya untuk menjual cincin tunangannya. Dunia lantas menjadi jungkir balik bagi Tristan. Dia harus menghadapi dilema tersulit sepanjang hidupnya. Dari berbagai toko yang ada, mungkin toko milik Tristan (Reza Rahadian) bisa dibilang punya daya tarik tak biasa. Dia menjual aneka barang yang sekilas terlihat biasa, tapi punya cerita luar biasa. Tristan mendirikan toko jual-beli barang-barang pemberian dari mantan kekasih untuk orang-orang yang ingin move on dari percintaan yang kandas. Bersama dua sahabatnya, Amel (Dea Panendra) dan Rio (Iedil Putra), Tristan, yang dikenal sebagai mahasiswa abadi karena tak kunjung lulus, menjalani bisnis yang penuh cerita. Penjualnya pun bermacam-macam. Ada remaja “bucin” alias “budak cinta” yang ingin melupakan kekasihnya sejak SMP, ada pasangan yang sudah putus baik-baik namun terlihat masih saling sayang, tapi hanya ada satu penjual yang membuat Tristan pusing tujuh keliling, Laras. Mantan pacarnya sendiri. Laras (Marsha Timothy) datang membawa segudang kenangan yang tak terlupakan oleh Tristan. Bedanya, Laras sudah beranjak ke fase berikutnya, sementara Tristan masih di situ-situ saja. Kehadiran Laras mendorong Tristan untuk membuktikan diri, berubah jadi sosok yang jauh lebih baik dan membuat usahanya semakin sukses. Lambat laun, alasan yang membuatnya berpisah dengan Laras kembali muncul ke permukaan. Akankah Tristan move on dari Laras? Selain para pemain di atas, aktor dan aktris lain yang bergabung di antaranya Syifa Hadju, Niken Anjani, Stella Cornelia, Shareefa Daanish, Mpok Atiek dan Gading Marten. Toko Barang Mantan meruapakan karya sutradara Viva Westi serta penulis naskah Titien Wattimena dan Priesnanda Dwisatria. Baca juga: Film No Time to Die Batalkan Tayang Perdana di Cina karena Corona Selain Toko Barang Mantan, sebelumnya Viva Westi merupakan sutradara beberapa film seperti Koki-koki Cilik 2 (2019), Jenderal Soedirman (2015), Mursala (2013), Ketika Bung di Ende (2013), Rayya, Cahaya Di Atas Cahaya (2012), Pocong Keliling (2010), May (2008), dan Serambi (2005). Tidak hanya film Toko Barang Mantan, hari ini juga rilis film 4 Mantan. Film 4 Mantan bercerita tentang Sara (Ranty Maria), Airin (Melanie Berentz), Rachel (Melayu Nicole), dan Amara (Denira Wiraguna) yang bertemu dalam satu tempat dan peristiwa. Mereka berempat merupakan mantan pacar Alex (Jeff Smith). Satu hal yang mengejutkan, ada surat untuk mereka masing-masing. Sebuah surat yang memberikan indikasi bahwa pembunuh Alex merupakan salah satu dari mereka. “Dan orang yang ngebunuh gue, adalah salah satu dari keempat mantan terakhir yang gue pacarin secara bersamaan,” tulis Alex dalam surat. Hal itu membuat satu sama lain menjadi saling curiga. Tidak hanya itu, setelah kematian Alex, banyak teror yang menghampiri para mantan pacarnya. Dari sosok perempuan berbaju serba hitam sampai seseorang yang membawa pisau untuk membunuh. Namun ada pula yang menganggap bahwa surat dari Alex hanya prank dari seseorang lain. Berikut trailer Toko Barang Mantan.\r\n\r\n', 'tokobarangmantan.jpg', '2020-09-04 15:12:49', 'oxMglhHCzPo'),
(3, 'Kapan Kawin 2015', 'Dinda yang sukses di kariernya di Jakarta sebagai General Manager di sebuah hotel bintang empat, selalu dianggap kurang oleh orang tuanya, karena masih single hingga usianya yang sudah melewati 30 tahun. Untuk Gatot dan Dewi, orang tua Dinda yang tinggal di Jogja, status Dinda yang masih single ini adalah kegagalan mereka sebagai orang tua.\r\n\r\nBosan di terror oleh orang tuanya yang terus bertanya “kapan kawin Dinda?” Dinda akhirnya menyusun sebuah rencana. Ia memutuskan untuk menyewa Satrio, seorang aktor teater idealis kenalan sahabatnya untuk berpura-pura menjadi pacar Dinda. Satrio bahkan terlalu idealis sehingga menjadi tidak realistis dan sangat ‘annoying’ untuk orang normal. Dinda sempat ragu menyewa Satrio tetapi karena terdesak waktu ia tidak punya pilihan lain.\r\n\r\nDinda berencana hanya membawa Satrio ke Jogja hanya untuk meredam rongrongan orang tuanya, sekaligus menghadiri acara ulang ulang tahun pernikahan orang tuanya. Tanpa disangka Dinda, rencana ini malah menjadi sebuah malapetaka bagi Dinda, karena Gatot dan Dewi ternyata mempunyai rencana sendiri untuk ‘memaksa’ Satrio segera menikahi Dinda. Satrio yang sangat idealis pun ternyata sangat susah mengikuti ‘skenario’ rencana Dinda. Dinda yang terjebak ditengah-tengah semua kekacauan ini pun akhirnya makin menderita.\r\n\r\nSatrio yang semula selalu menyulitkan Dinda pelan-pelan menyadari bahwa semua anggota keluarga Dinda memperlakukan Dinda dengan tidak adil dan mempressure Dinda hingga ia selalu merasa ‘tidak cukup baik’ dalam hal apapun.', 'kapankawin.jpg', '2020-09-04 15:14:48', 'nQr9F4O1gbs'),
(4, 'Pretty Boys', 'Pretty Boys, satu film romantic comedy (romcom) akan menceritakan soal industri pertelevisian serta ambisi dan perjalanan dua sahabat yang diperankan Vincent dan Desta. Rahmat Maha Esa (Desta) dan Anugerah Santoso (Vincent Rompies) adalah dua orang sahabat yang dari kecil bermimpi masuk TV dan menjadi terkenal.', 'prettyboys.jpg', '2020-09-04 15:24:19', 'xeBhfA3dVSg'),
(5, 'Sesuai Aplikasi', 'film komedi Indonesia yang bercerita tentang persahabatan dua driver Ojol (Ojek Online). Mereka berjuang untuk memenuhi kebutuhan hidup masing-masing. Suatu hari mereka berdua harus menjalankan tugas yang membawa mereka ke keadaan yang berbahaya.\r\n\r\n', 'sesuaiaplikasi.jpg', '2020-09-04 15:30:42', 's667OuAlGq0'),
(6, 'Flight 555', 'Flight 555 Film ini mengangkat kisah PUTU yang bekerja di Jakartamendapat kabar bahwa ayahnya sakit keras, hingga ia harus pulang ke Bali secepatnya. Sementara ADRI kerepotan dengan kedua anaknya yaitu RAFFI dan TIFA yang juga akan berangkat ke Bali. Demikian juga dengan SHANTAL yang sering telat, pramugari pesawat yang akan PUTU tumpangi yakni KOMODO AIR, Flight Number KOMO555. Saat di bandara, ADRI yang pergi dengan tujuan berbeda menitipkan kedua anaknya RAFFI dan TIFA pada PUTU. PUTU yang sebenarnya sedang galau akut karena diputusin sang pacar, makin stress dibuatnya. Di bandara, bermunculan para penumpang KOMO555dengan berbagai kekocakan, tanpa disadari bahwa hari itu bisa menjadi hari paling buruk dalam hidup mereka.', 'flight555.jpg', '2020-09-04 15:40:01', '2rFqOyMEHnE'),
(7, 'Tak Kemal Maka Tak Sayang', 'Kemal (17thn), seorang pelajar SMU dari Samarinda yang selalu mendambakan wanita tercantik untuk menjadi kekasihnya. Ia memiliki pola pikir yang absurd, sulit berfokus dan sulit ditebak. Karakternya ini menyebabkan dirinya lama menjomblo dan berulangkali gagal dalam percintaannya. Wanita tercantik yang ia idam-idamkan adalah Raisya (17thn), gadis tercantik disekolahnya tapi juga berani dan ekspresif. Masalahnya adalah, Raisya adalah kekasih dari Nanda (18thn), cowok ganteng, keren, jagoan di sekolahnya, sekaligus pemimpin geng. Usaha Kemal dalam menarik perhatian Raisya, berbuntut pada duel antara dirinya dengan Nanda. Menjelang duel, Kemal berlatih dengan ayahnya yang merupakan juara bela diri kapoeira tingkat nasional. Dibantu Khalil (17thn), teman dekat sekaligus teman sekelasnya, Kemal berusaha mengakali tantangan Nanda dengan cara uniknya. Perkelahian mereka malahan menimbulkan kelucuan demi kelucuan, hingga Nanda berhasil ia kalahkan. Kemal yang merasa bangga atas kemenangannya, segera memberanikan diri untuk menembak Raisya. Tapi Raisya justru menolaknya karena ia tidak menyukai keagresifan Kemal. Setelah lulus SMU, Kemal pindah ke Jakarta dan kuliah di Institut Seni Jakarta (ISJ), mengambil jurusan teater yang sesuai dengan jiwanya. Di kampus itu, ia berteman dekat dengan Jovi (20thn) dan Hifdzi (20thn) yang sama-sama memiliki sifat absurd, spontan dan unik seperti dirinya. Disitupun, ia jatuh cinta pada teman kuliahnya yang terkenal cantik, Putri (20thn). Kemal berusaha mendekati Putri dibantu kedua temannya. Namun sayang, Putri pada akhirnya menolak dirinya juga. Akhirnya Kemal mengikuti audisi acara kejuaraan Stand Up Comedy. Tujuannya adalah menjadi terkenal sehingga bisa menjadi pujaan para wanita. Kemal bekerja keras mengikuti berbagai tahapan kejuaraan tersebut. Akhirnya namanya semakin dikenal banyak orang karena gaya lawaknya yang tergolong absurd. Dalam kejuaraan tersebut, ia berhasil meraih juara ke 3 dan sering diundang ke berbagai kota untuk mengisi acara sebagai stand up comedian. Dari sanalah jalannya untuk mendapatkan wanita yang paling diidam-idamkannya dapat tercapai.\r\n\r\nSiapakah yang akhirnyamenjadikekasihKemal???\r\n', 'takkemal.jpg', '2020-09-06 15:25:44', 'Yp61beAmXDE');

-- --------------------------------------------------------

--
-- Table structure for table `tb_notes`
--

CREATE TABLE `tb_notes` (
  `id` int(20) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_notes`
--

INSERT INTO `tb_notes` (`id`, `title`, `content`) VALUES
(34, 'aaa', 'aaa'),
(35, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `id_user` int(20) NOT NULL,
  `username` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `full_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sex` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tgl_daftar` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`id_user`, `username`, `email`, `full_name`, `sex`, `password`, `alamat`, `tgl_daftar`) VALUES
(3, 'asa', 'as', 'asa', 'as', 'f970e2767d0cfe75876ea857f92e319b', 'as', '2020-08-17 19:10:02'),
(4, 'eirene98', 'eirene98@venus.com', 'eirene charalita', 'perempuan', 'e10adc3949ba59abbe56e057f20f883e', 'kudus', '2020-08-17 19:27:32'),
(5, 'd', 'd', 'd', 'd', '8277e0910d750195b448797616e091ad', 'd', '2020-08-17 20:19:09'),
(6, '', '', '', '', 'd41d8cd98f00b204e9800998ecf8427e', '', '2020-08-17 20:55:26'),
(7, 'c', 'd', 'd', 'Perempuan', '8277e0910d750195b448797616e091ad', 'd', '2020-08-18 18:05:48'),
(8, 'asaasasa', 'asasasasa', 'asa', 'as', 'f970e2767d0cfe75876ea857f92e319b', 'as', '2020-08-18 19:53:48'),
(9, 'www', 'ee', 'ee', 'Laki-laki', 'd2f2297d6e829cd3493aa7de4416a18f', 'eeee', '2020-08-18 19:58:15'),
(10, 'admin', 'aaa', 'admin', 'Laki-laki', '4297f44b13955235245b2497399d7a93', 'ssdd', '2020-08-18 20:04:08'),
(11, 'ggggggj', 'gg', 'gg', 'Laki-laki', 'd40cee75b933268d16da9472ff14b1ee', 'gg', '2020-08-19 20:31:22');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_berita`
--
ALTER TABLE `tb_berita`
  ADD PRIMARY KEY (`id_berita`);

--
-- Indexes for table `tb_favorite_movie`
--
ALTER TABLE `tb_favorite_movie`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_kamus`
--
ALTER TABLE `tb_kamus`
  ADD PRIMARY KEY (`id_istilah`);

--
-- Indexes for table `tb_merupa`
--
ALTER TABLE `tb_merupa`
  ADD PRIMARY KEY (`id_user`);

--
-- Indexes for table `tb_movie`
--
ALTER TABLE `tb_movie`
  ADD PRIMARY KEY (`id_user`);

--
-- Indexes for table `tb_movielist`
--
ALTER TABLE `tb_movielist`
  ADD PRIMARY KEY (`id_movie`);

--
-- Indexes for table `tb_notes`
--
ALTER TABLE `tb_notes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_berita`
--
ALTER TABLE `tb_berita`
  MODIFY `id_berita` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_favorite_movie`
--
ALTER TABLE `tb_favorite_movie`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `tb_kamus`
--
ALTER TABLE `tb_kamus`
  MODIFY `id_istilah` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tb_merupa`
--
ALTER TABLE `tb_merupa`
  MODIFY `id_user` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tb_movie`
--
ALTER TABLE `tb_movie`
  MODIFY `id_user` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tb_movielist`
--
ALTER TABLE `tb_movielist`
  MODIFY `id_movie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tb_notes`
--
ALTER TABLE `tb_notes`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id_user` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
