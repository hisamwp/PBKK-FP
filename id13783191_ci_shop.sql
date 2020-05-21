-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 21, 2020 at 12:06 AM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `id13783191_ci_shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `subtotal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `slug`, `title`) VALUES
(1, 'obat-batuk-dan-flu', 'obat batuk dan flu'),
(2, 'obat-demam', 'obat demam'),
(3, 'p3k', 'p3k'),
(4, 'vitamin-dan-suplemen', 'vitamin dan suplemen');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `date` date NOT NULL,
  `invoice` varchar(100) NOT NULL,
  `total` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `status` enum('waiting','paid','delivered','cancel') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `id_user`, `date`, `invoice`, `total`, `name`, `address`, `phone`, `status`) VALUES
(1, 2, '2020-05-20', '220200520221255', 11000, 'hisam', 'kudus', '082399146888', 'waiting'),
(2, 3, '2020-05-20', '320200520222821', 41500, 'Karl Mendy', 'jalan kenangan', '08123456789', 'paid');

-- --------------------------------------------------------

--
-- Table structure for table `orders_confirm`
--

CREATE TABLE `orders_confirm` (
  `id` int(11) NOT NULL,
  `id_orders` int(11) NOT NULL,
  `account_name` varchar(255) NOT NULL,
  `account_number` varchar(50) NOT NULL,
  `nominal` int(11) NOT NULL,
  `note` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders_confirm`
--

INSERT INTO `orders_confirm` (`id`, `id_orders`, `account_name`, `account_number`, `nominal`, `note`, `image`) VALUES
(1, 2, 'karl mendy', '243892342348943', 1000000, '-', '320200520222821-20200520223047.png');

-- --------------------------------------------------------

--
-- Table structure for table `orders_detail`
--

CREATE TABLE `orders_detail` (
  `id` int(11) NOT NULL,
  `id_orders` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `qty` int(4) NOT NULL,
  `subtotal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders_detail`
--

INSERT INTO `orders_detail` (`id`, `id_orders`, `id_product`, `qty`, `subtotal`) VALUES
(1, 1, 1, 1, 11000),
(2, 2, 5, 1, 20000),
(3, 2, 2, 1, 21500);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `id_category` int(11) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `price` int(11) NOT NULL,
  `is_available` tinyint(1) NOT NULL DEFAULT 1,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `id_category`, `slug`, `title`, `description`, `price`, `is_available`, `image`) VALUES
(1, 1, 'obh-combi-batuk-berdahak-menthol-sirup-100-ml', 'OBH COMBI BATUK BERDAHAK MENTHOL SIRUP 100 ML', 'OBH COMBI BATUK BERDAHAK adalah obat yang digunakan untuk meredakan batuk berdahak dengan cara bekerja sebagai ekspektoran yang membantu mengeluarkan dahak.\r\n', 11000, 1, 'obh-combi-batuk-berdahak-20200520212548.jpg'),
(2, 2, 'panadol-500-mg-10-kaplet', 'PANADOL 500 MG 10 KAPLET', 'OBH COMBI BATUK BERDAHAK adalah obat yang digunakan untuk meredakan batuk berdahak dengan cara bekerja sebagai ekspektoran yang membantu mengeluarkan dahak.', 21500, 1, 'panadol-500-mg-10-kaplet-20200520215938.jpg'),
(3, 2, 'paracetamol-500-mg-10-kaplet', 'PARACETAMOL 500 MG 10 KAPLET', 'PARACETAMOL 500 MG merupakan obat generik yang digunakan untuk meredakan sakit kepala, nyeri dan demam.', 24000, 1, 'paracetamol-500-mg-10-kaplet-20200520220113.jpg'),
(4, 1, 'bisolvon-extra-sirup-60-ml', 'BISOLVON EXTRA SIRUP 60 ML', 'BISOLVON EXTRA SIRUP mengandung Bromhexine HCl dan Guaiphenesin, digunakan untuk mengatasi batuk berdahak dengan cara mengencerkan dahak dan mempermudah pengeluaran dahak pada saat batuk.', 41900, 1, 'bisolvon-extra-sirup-60-ml-20200520213023.jpg'),
(5, 3, 'betadine-solution-15-ml', 'BETADINE SOLUTION 15 ML', 'BETADINE SOLUTION mengandung zat aktif Povidone Iodine 10%. Povidone iodine merupakan zat anti mikroba dengan spektrum paling luas yang mampu membunuh bakteri, virus, jamur, dan protozoa. Zat ini juga tidak menimbulkan resistensi kuman. Obat ini digunakan untuk mengobati panu, kurap, kutu air dan gatal karena jamur, untuk pertolongan pertama dan mencegah timbulnya infeksi pada luka-luka seoerti lecet, terkelupas, tergores, terpotong, terkoyak atau luka khitan, untuk perawatan tali pusar bayi, untuk melindungi luka-luka operasi terhadap timbulnya infeksi. Hanya untuk bagian luar badan.', 20000, 1, 'betadine-solution-15-ml-20200520220547.jpg'),
(6, 3, 'betadine-10-salep-5-g', 'BETADINE 10% SALEP 5 G', 'BETADINE 10% SALEP mengandung zat aktif Povidone Iodine 10%. Obat ini digunakan sebagai antiseptik yang dibuat untuk mencegah infeksi akibat luka bakar minor, luka sayat, luka garukan dan lecet. Salep ini dapat digunakan tidak hanya untuk luka baru, namun juga bisa digunakan pada luka lama. Hanya untuk penggunaan luar tubuh.', 15000, 1, 'betadine-10-salep-5-g-20200520220722.jpg'),
(7, 4, 'pharmaton-formula-5-kapsul', 'PHARMATON FORMULA 5 KAPSUL', 'PHARMATON FORMULA merupakan kombinasi dari multivitamin, mineral dan ekstrak gingseng yang digunakan untuk menjaga stamina dan kesehatan tubuh setelah operasi dan pada masa pemulihan.', 40000, 1, 'pharmaton-formula-5-kapsul-20200520220919.jpeg'),
(8, 4, 'enervon-c-30-tablet', 'ENERVON-C 30 TABLET', 'ENERVON C merupakan suplemen makanan dengan kandungan multivitamin seperti Vitamin C, Vitamin B1, Vitamin B2, Vitamin B6, Vitamin B12, Vitamin D, Niasinamide, Kalsium pantotenat dalam bentuk tablet salut. Suplemen vitamin ini berguna untuk membantu menjaga daya tahan tubuh. Kombinasi vitamin C dan B komplek yang diperlukan untuk tubuh yang kekurangan vitamin, supaya daya tahan tubuh tetap terjaga serta membantu memulihkan kondisi setelah sakit.\r\n', 34000, 1, 'enervon-c-30-tablet-20200520221126.jpg'),
(9, 2, 'alkohol-70', 'Alkohol 70%', 'Obat luar untuk meredahkan panas', 15000, 1, 'alkohol-70-20200520223247.jpg'),
(10, 4, 'vitacimin-c', 'VITACIMIN-C', 'Permen yang mengandung vitamin c', 3000, 0, 'vitacimin-c-20200520223353.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','member') NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password`, `role`, `is_active`, `image`) VALUES
(1, 'Admin', 'admin@mail.com', '$2y$10$MgoeVKkiyRaOu0ASMBGaf.7mOlLjfb96iLGvzyafh6/JkE6IWCYiK', 'admin', 1, NULL),
(2, 'hisam', 'hisam@sam.com', '$2y$10$n1TjhHvkbgSze1xTYnL3NOAIQEGPV5Aciu1ZZ.wIuL8qzeVFhwGlm', 'member', 1, NULL),
(3, 'admin', 'admin@gmail.com', '$2y$10$JUGXWIdHmOL6ijbY5BerPOF6XRzoxnB3Ca3kWWwo20aOywszA2YTi', 'admin', 1, NULL),
(4, 'thisa', 'thisa@thisa.com', '$2y$10$04oeQFP4Mkbdcstl9E0QXu1DLeNBRhFmIi5o3166CebYJ7.vNTWg2', 'member', 1, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders_confirm`
--
ALTER TABLE `orders_confirm`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders_detail`
--
ALTER TABLE `orders_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orders_confirm`
--
ALTER TABLE `orders_confirm`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orders_detail`
--
ALTER TABLE `orders_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
