-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 05, 2020 at 12:00 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laundry`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `level` enum('admin') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id_admin`, `username`, `password`, `level`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `kasir`
--

CREATE TABLE `kasir` (
  `id` int(100) NOT NULL,
  `nama_kasir` varchar(100) NOT NULL,
  `tlpn` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `id_owner` int(11) NOT NULL,
  `level` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kasir`
--

INSERT INTO `kasir` (`id`, `nama_kasir`, `tlpn`, `username`, `password`, `id_owner`, `level`) VALUES
(122, 'AndangAnto', '089676668621', 'anto', 'anto', 111116, 'Kasir'),
(123, 'Rino Dekatama', '089993232323', 'rino', 'rino', 111117, 'Kasir'),
(124, 'Fajar Setyosari', '089324678326', 'fajar', 'fajar', 111116, 'Kasir'),
(130, 'Jokowi', '08237872810', 'joko', 'joko', 111117, 'Kasir');

-- --------------------------------------------------------

--
-- Table structure for table `owner`
--

CREATE TABLE `owner` (
  `id` int(11) NOT NULL,
  `nama_own` varchar(100) NOT NULL,
  `nama_laundry` varchar(100) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `tlpn` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `level` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `owner`
--

INSERT INTO `owner` (`id`, `nama_own`, `nama_laundry`, `alamat`, `tlpn`, `username`, `password`, `level`) VALUES
(111116, 'Tasya Rosma', 'Tasya Laundry Shop', 'JL.Pegangsaan Poncosari Srandakan Bantul Bantul Yogyakarta', '08923827233', 'tasya', 'tasya', 'owner'),
(111117, 'Jihan AudyLia Arende Silva', 'Jihan Laundry', 'Jl Tamanmadu Jatinom Surakarta Jagatraya Bantul Yogyakarta', '08256736756', 'jihanaudy', 'jihanaudy', 'owner');

-- --------------------------------------------------------

--
-- Table structure for table `paket`
--

CREATE TABLE `paket` (
  `id` int(100) NOT NULL,
  `paket` varchar(100) NOT NULL,
  `harga` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `paket`
--

INSERT INTO `paket` (`id`, `paket`, `harga`) VALUES
(32, 'Cuci', 2500),
(33, 'Cuci + Setrika', 5000),
(34, 'Setrika', 2000);

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int(11) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `tlpn` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `nama`, `alamat`, `tlpn`) VALUES
(1000102, 'Miku Setyanto', 'Babarsari, Poncosari, Srandakan, Bantul, Yogyakart', '0896754678'),
(1000103, 'Masya Wukirsari', 'Wukirsari, Poncosari, Srandakan, Bantul, Yogyakart', '08743648463'),
(1000104, 'Miri Setya', 'Jokopasn,Poncosari, Srandakan, Bantul, Yogyakarta', '0857458454'),
(1000105, 'Ririn', 'Jakare, Poncosari, Srandakan, Bantul, Yogyakarta', '086756546546'),
(1000107, 'Rinda Widaningsih', 'Mirasaha, Poncosari, Srandakan, Bantul, Yogyakarta', '089967257431'),
(1000110, 'Merajuki Fukunda', 'Khayalan, Poncosari, Srandakan, Bantul, Yogyakarta', '08775475485'),
(1000111, 'Fajar Mahasari', 'Nyata, Poncosari, Srandakan, Bantul, Yogyakarta', '085453443545'),
(1000112, 'Rikone Akakira', 'Mamasari, Poncosari, Srandakan, Bantul, Yogyakarta', '0843435454544'),
(1000113, 'Dadali Bukasama', 'Awan, Poncosari, Srandakan, Bantul, Yogyakarta', '089434636473'),
(1000114, 'SAri Mura Fukunda', 'Dunia, Poncosari, Srandakan, Bantul, Yogyakarta', '0854578457487'),
(1000115, 'Citanday', 'Hari, Poncosari, Srandakan, Bantul, Yogyakarta', '0875665656439'),
(1000116, 'Gagarnila Dasinu', 'Tamarin, Poncosari, Srandakan, Bantul, Yogyakarta', '087483748343'),
(1000117, 'Merikusi Sukoka', 'Tata, Poncosari, Srandakan, Bantul, Yogyakarta', '08545454565'),
(1000118, 'Merajuki Fukunda', 'Rojosari, Poncosari, Srandakan, Bantul, Yogyakarta', '08754543433'),
(1000119, 'Sukasarinuli Sadaya', 'Rojosari Srandakan Bantul Yogyakarta', '087656546545');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id` int(11) NOT NULL,
  `id_pelanggan` int(11) NOT NULL,
  `id_input` int(11) NOT NULL,
  `id_paket` int(11) NOT NULL,
  `id_owner` int(100) DEFAULT NULL,
  `berat` float NOT NULL,
  `total` float NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id`, `id_pelanggan`, `id_input`, `id_paket`, `id_owner`, `berat`, `total`, `tanggal`) VALUES
(101020143, 1000102, 123, 34, 111117, 1.3, 2600, '2020-09-04 15:58:47'),
(101020144, 1000113, 1, 32, 111116, 2.1, 5250, '2020-09-04 15:59:11'),
(101020145, 1000113, 123, 32, 111117, 2.2, 5500, '2020-09-04 22:32:34'),
(101020146, 1000116, 123, 34, 111117, 9.2, 18400, '2020-09-04 22:52:59'),
(101020148, 1000111, 130, 34, 111117, 1.2, 2400, '2020-09-04 23:36:20'),
(101020149, 1000110, 130, 32, 111117, 1, 2500, '2020-09-04 23:37:39'),
(101020150, 1000112, 1, 32, 111116, 4.5, 11250, '2020-09-05 07:48:09'),
(101020151, 1000102, 1, 33, 111117, 2.9, 14500, '2020-09-05 08:14:29'),
(101020152, 1000113, 1, 34, 111116, 3.9, 7800, '2020-09-05 08:14:54'),
(101020153, 1000115, 1, 32, 111117, 5.9, 14750, '2020-09-05 08:15:11');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `kasir`
--
ALTER TABLE `kasir`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tlpn` (`tlpn`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `id_owner` (`id_owner`);

--
-- Indexes for table `owner`
--
ALTER TABLE `owner`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `tlpn` (`tlpn`);

--
-- Indexes for table `paket`
--
ALTER TABLE `paket`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`),
  ADD UNIQUE KEY `tlpn` (`tlpn`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_pelanggan` (`id_pelanggan`),
  ADD KEY `id_paket` (`id_paket`),
  ADD KEY `id_owner` (`id_owner`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `kasir`
--
ALTER TABLE `kasir`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;

--
-- AUTO_INCREMENT for table `owner`
--
ALTER TABLE `owner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111120;

--
-- AUTO_INCREMENT for table `paket`
--
ALTER TABLE `paket`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000132;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101020154;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `kasir`
--
ALTER TABLE `kasir`
  ADD CONSTRAINT `kasir_ibfk_1` FOREIGN KEY (`id_owner`) REFERENCES `owner` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_paket`) REFERENCES `paket` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transaksi_ibfk_3` FOREIGN KEY (`id_owner`) REFERENCES `owner` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
