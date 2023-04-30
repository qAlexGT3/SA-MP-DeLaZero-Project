-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 30, 2023 at 06:04 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `delazero`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `ID` int(11) NOT NULL,
  `Name` varchar(25) NOT NULL,
  `Password` varchar(32) NOT NULL,
  `Admin` int(2) NOT NULL DEFAULT 0,
  `Email` varchar(64) NOT NULL,
  `Cash` bigint(20) NOT NULL DEFAULT 0,
  `Job` int(2) NOT NULL DEFAULT 0,
  `FpsText` tinyint(1) NOT NULL DEFAULT 0,
  `ServerText` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `business`
--

CREATE TABLE `business` (
  `ID` int(11) NOT NULL,
  `Owner` varchar(25) NOT NULL DEFAULT 'Server',
  `X` float NOT NULL,
  `Y` float NOT NULL,
  `Z` float NOT NULL,
  `Type` int(11) NOT NULL,
  `Safe` int(11) NOT NULL DEFAULT 0,
  `Price` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `business`
--

INSERT INTO `business` (`ID`, `Owner`, `X`, `Y`, `Z`, `Type`, `Safe`, `Price`) VALUES
(1, 'Server', 1567.1, -2254.74, 13.54, 1, 0, 0),
(2, 'Server', 488.46, -1733.31, 11.19, 2, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `ID` int(11) NOT NULL,
  `Name` varchar(32) NOT NULL,
  `Owner` varchar(25) NOT NULL DEFAULT 'Server',
  `X` float NOT NULL,
  `Y` float NOT NULL,
  `Z` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`ID`, `Name`, `Owner`, `X`, `Y`, `Z`) VALUES
(1, 'Street Sweeper', 'Server', 1730.31, -2239.74, 13.541);

-- --------------------------------------------------------

--
-- Table structure for table `variables`
--

CREATE TABLE `variables` (
  `ID` int(11) NOT NULL,
  `HostName` varchar(128) NOT NULL DEFAULT 'Gamemode De La Zero',
  `Mode` varchar(16) NOT NULL DEFAULT 'Gamemode',
  `Language` varchar(16) NOT NULL DEFAULT 'Romana',
  `MapName` varchar(16) NOT NULL DEFAULT 'San Andreas',
  `WebUrl` varchar(32) NOT NULL DEFAULT 'sa-mp.com',
  `Maintenance` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `variables`
--

INSERT INTO `variables` (`ID`, `HostName`, `Mode`, `Language`, `MapName`, `WebUrl`, `Maintenance`) VALUES
(1, 'Gamemode De La Zero', 'DeLaZero', 'Romana', 'San Andreas', 'sa-mp.com', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `business`
--
ALTER TABLE `business`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `variables`
--
ALTER TABLE `variables`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `business`
--
ALTER TABLE `business`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `variables`
--
ALTER TABLE `variables`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
