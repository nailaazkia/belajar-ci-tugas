-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 02 Jun 2025 pada 08.50
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_ci4`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori_produk`
--

CREATE TABLE `kategori_produk` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `kategori_produk`
--

INSERT INTO `kategori_produk` (`id`, `nama`) VALUES
(1, 'Skintint'),
(2, 'Cushion'),
(3, 'Powder');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `version` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `group` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `batch` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `version`, `class`, `group`, `namespace`, `time`, `batch`) VALUES
(1, '2025-05-22-061658', 'App\\Database\\Migrations\\User', 'default', 'App', 1747894789, 1),
(2, '2025-05-22-061710', 'App\\Database\\Migrations\\Product', 'default', 'App', 1747894789, 1),
(3, '2025-05-22-061719', 'App\\Database\\Migrations\\Transaction', 'default', 'App', 1747894789, 1),
(4, '2025-05-22-061726', 'App\\Database\\Migrations\\TransactionDetail', 'default', 'App', 1747894789, 1),
(5, '2025-05-26-152310', 'App\\Database\\Migrations\\CreateKategoriProduk', 'default', 'App', 1748273032, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `product`
--

CREATE TABLE `product` (
  `id` int(11) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `harga` double NOT NULL,
  `jumlah` int(5) NOT NULL,
  `foto` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `product`
--

INSERT INTO `product` (`id`, `nama`, `harga`, `jumlah`, `foto`, `created_at`, `updated_at`) VALUES
(1, 'Skintint Somethinc', 110000, 16, 'skintint.jpg', '2025-05-22 06:53:41', '2025-05-24 11:42:19'),
(2, 'Cushion Instaperfect', 120000, 7, 'cushion.jpg', '2025-05-22 06:53:41', NULL),
(3, 'Powder Sea Make Up', 89000, 5, 'powder.jpg', '2025-05-22 06:53:41', NULL),
(4, 'Liptint Raecca', 90000, 8, 'liptint.jpg', '2025-05-22 06:53:41', NULL),
(5, 'Blush On Dazzle Me', 40000, 6, 'blush.jpg', '2025-05-22 06:53:41', NULL),
(6, 'Eyeliner Pinkfllash', 35000, 3, 'eyeliner.jpg', '2025-05-22 06:53:41', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `product_categories`
--

CREATE TABLE `product_categories` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `parent_id` int(11) UNSIGNED DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `meta_title` varchar(100) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `product_categories`
--

INSERT INTO `product_categories` (`id`, `name`, `slug`, `description`, `parent_id`, `image`, `meta_title`, `meta_description`, `is_active`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Skintint', 'skintint', 'All Skintint products', NULL, NULL, NULL, NULL, 1, '2025-05-29 12:56:09', '2025-05-29 12:56:09', NULL),
(3, 'Powder', 'powder', 'All powder types', NULL, NULL, NULL, NULL, 1, '2025-05-29 12:59:50', '2025-05-29 12:59:50', NULL),
(4, 'Cushion', 'cushion', 'perfect cushion', NULL, NULL, NULL, NULL, 1, '2025-05-29 13:18:58', '2025-05-29 13:18:58', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaction`
--

CREATE TABLE `transaction` (
  `id` int(11) UNSIGNED NOT NULL,
  `username` varchar(255) NOT NULL,
  `total_harga` double NOT NULL,
  `alamat` text NOT NULL,
  `ongkir` double DEFAULT NULL,
  `status` int(1) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaction_detail`
--

CREATE TABLE `transaction_detail` (
  `id` int(11) UNSIGNED NOT NULL,
  `transaction_id` int(11) UNSIGNED NOT NULL,
  `product_id` int(11) UNSIGNED NOT NULL,
  `jumlah` int(5) NOT NULL,
  `diskon` double DEFAULT NULL,
  `subtotal_harga` double NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(50) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password`, `role`, `created_at`, `updated_at`) VALUES
(1, 'laras90', 'melani.gasti@gmail.co.id', '$2y$10$2GzUJe.fC/aCRRiI39z9.eZH.3i32CArufUcbeNXC2CBkY9Fn8hHC', 'guest', '2025-05-22 06:36:26', NULL),
(2, 'shania24', 'kezia.rahimah@gmail.co.id', '$2y$10$pzgapur9XSSHLrdLbvNT3eeUPD.2jK2Ku.Td874Las2CNgB3U/pvu', 'admin', '2025-05-22 06:36:26', NULL),
(3, 'nuraini.uli', 'pranowo.cici@gmail.com', '$2y$10$2WGH1ArYoBvzf1YFdSrPFe0ZFuj.zenAfcPHd8BaTNcsRgYelln9.', 'admin', '2025-05-22 06:36:26', NULL),
(4, 'msitumorang', 'budiman.prakosa@yahoo.com', '$2y$10$jf0wkrTj8mLO3pFQ4GAum.ZdbgDeTj4/TeorMQfIQRik3BDC8H4oq', 'guest', '2025-05-22 06:36:26', NULL),
(5, 'hutasoit.eko', 'hari03@yahoo.com', '$2y$10$fCjOLHI9dC4JZVld4EJjeOhs7hjtMbOlnegppu0Tt03.hYKLRRdb2', 'guest', '2025-05-22 06:36:26', NULL),
(6, 'mardhiyah.marsudi', 'tugiman.nuraini@gmail.co.id', '$2y$10$9vUqCfInSCYqvYogoc42pO1fAyGoE5lm/YHn0F9U6RI1yDpoAbv9G', 'guest', '2025-05-22 06:36:26', NULL),
(7, 'andriani.dagel', 'prabowo.yulia@gmail.co.id', '$2y$10$QeyB9x3yBwnxl3.Pm46tSuwBgWU11NsAR4NK496BcLPs3BEQfR0tW', 'guest', '2025-05-22 06:36:26', NULL),
(8, 'yuliarti.jamal', 'efarida@yahoo.com', '$2y$10$TJRQpVfxTwLkYb0vYUnVGuGdUi/F94gbTr80U60euLaR05YhkS8XO', 'admin', '2025-05-22 06:36:26', NULL),
(9, 'yahya62', 'arta.namaga@yahoo.com', '$2y$10$dskTaHKdf9BT9DrE4FgfvO97DrwcL2o4u0NiQFMhXVcDLGMf4gjDy', 'guest', '2025-05-22 06:36:27', NULL),
(10, 'sihombing.harsaya', 'ian79@kuswandari.co.id', '$2y$10$75D5RguVqVzV/3nSJt6y4u5.XfGX.SfWDC3jyiRDVWR4kQe9McqUG', 'guest', '2025-05-22 06:36:27', NULL);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `kategori_produk`
--
ALTER TABLE `kategori_produk`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `product_categories_parent_id_foreign` (`parent_id`);

--
-- Indeks untuk tabel `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `transaction_detail`
--
ALTER TABLE `transaction_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `kategori_produk`
--
ALTER TABLE `kategori_produk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `transaction`
--
ALTER TABLE `transaction`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `transaction_detail`
--
ALTER TABLE `transaction_detail`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `product_categories`
--
ALTER TABLE `product_categories`
  ADD CONSTRAINT `product_categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `product_categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
