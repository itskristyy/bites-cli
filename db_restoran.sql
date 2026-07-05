-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 13 Nov 2025 pada 04.53
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_restoran`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `masakan`
--

CREATE TABLE `masakan` (
  `id_masakan` int(11) NOT NULL,
  `nama_masakan` varchar(50) NOT NULL,
  `harga` int(11) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `masakan`
--

INSERT INTO `masakan` (`id_masakan`, `nama_masakan`, `harga`, `status`) VALUES
(1, 'Mie Ayam Spesial', 15000, 'Tersedia'),
(3, 'Nasi Goreng Spesial', 20000, 'Tersedia'),
(4, 'Nasi Kucing', 5000, 'Tersedia'),
(5, 'Nasi Seafood', 15000, 'Tersedia'),
(9, 'Nasi Ayam Geprek', 15000, 'Tersedia'),
(10, 'Rice Bowl Chiken Teriyaki', 18000, 'Tersedia'),
(11, 'Chicken Katsu Sambal Matah', 16000, 'Tersedia'),
(13, 'Bakso Special Mercon', 18000, 'Tersedia'),
(14, 'Ayam Celup Crispy ', 9000, 'Tersedia'),
(15, 'Steak Beef Special', 25000, 'Tersedia'),
(16, 'Thai Tea', 8000, 'Tersedia'),
(17, 'Boba Tea Class', 10000, 'Tersedia');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `nama_pelanggan` varchar(30) NOT NULL,
  `id_masakan` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `nama_masakan` varchar(30) NOT NULL,
  `harga` int(11) NOT NULL,
  `jumlah_beli` int(11) NOT NULL,
  `total_bayar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `nama_pelanggan`, `id_masakan`, `tanggal`, `nama_masakan`, `harga`, `jumlah_beli`, `total_bayar`) VALUES
(2, 'Jennie', 10, '2025-10-26', 'Rice Bowl Chiken Teriyaki', 18000, 3, 54000),
(3, 'Call', 4, '2025-10-26', 'Nasi Kucing', 5000, 4, 20000),
(4, 'Dylan', 4, '2025-10-26', 'Nasi Kucing', 5000, 5, 25000),
(5, 'Adinda', 9, '2025-10-26', 'Nasi Ayam Geprek', 15000, 3, 45000),
(6, 'Ellyn', 5, '2025-10-27', 'Nasi Seafood', 15000, 3, 45000),
(7, 'Nadiah', 13, '2025-10-30', 'Bakso Special Mercon', 18000, 3, 54000),
(8, 'Husna', 14, '2025-10-30', 'Ayam Celup Crispy ', 9000, 2, 18000),
(9, 'Ajeng', 17, '2025-10-30', 'Boba Tea Class', 10000, 2, 20000),
(10, 'Kristy', 9, '2025-10-30', 'Nasi Ayam Geprek', 15000, 3, 45000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `nama_user` varchar(30) NOT NULL,
  `id_level` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `username`, `password`, `nama_user`, `id_level`) VALUES
(1, 'Admin', 'admin123', 'Adinda Kristy', 1),
(2, 'kasir', 'kasir123', 'Doel', 2),
(3, 'Owner', 'owner123', 'Adinda', 3),
(5, 'Pelanggan', 'qwerty123', 'Jennie', 4);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `masakan`
--
ALTER TABLE `masakan`
  ADD PRIMARY KEY (`id_masakan`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `id_masakan` (`id_masakan`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `masakan`
--
ALTER TABLE `masakan`
  MODIFY `id_masakan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_masakan`) REFERENCES `masakan` (`id_masakan`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
