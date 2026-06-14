-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 14, 2026 at 10:00 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `marketstall`
--

-- --------------------------------------------------------

--
-- Table structure for table `allocation`
--

CREATE TABLE `allocation` (
  `AllocationID` int(11) NOT NULL,
  `TraderID` int(11) DEFAULT NULL,
  `StallID` int(11) DEFAULT NULL,
  `AllocationDate` date DEFAULT NULL,
  `Status` varchar(20) DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `allocation`
--

INSERT INTO `allocation` (`AllocationID`, `TraderID`, `StallID`, `AllocationDate`, `Status`) VALUES
(1, 1, 3, '2025-01-15', 'Active'),
(3, 2, 1, '2023-06-10', 'Active'),
(4, 4, 5, '2024-01-05', 'Expired'),
(5, 3, 4, '2024-08-19', 'Expired');

-- --------------------------------------------------------

--
-- Table structure for table `market`
--

CREATE TABLE `market` (
  `MarketID` int(11) NOT NULL,
  `MarketName` varchar(50) DEFAULT NULL,
  `Address` varchar(150) DEFAULT NULL,
  `Date_established` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `market`
--

INSERT INTO `market` (`MarketID`, `MarketName`, `Address`, `Date_established`) VALUES
(1, 'Big Market', 'Wallace Johnson Street, Freetown', '1965-03-15'),
(2, 'Lumley Market', 'Lumley, Freetown', '1989-07-22'),
(3, 'Congo Market', 'Congo Cross, Freetown', '2001-11-08');

-- --------------------------------------------------------

--
-- Table structure for table `registration`
--

CREATE TABLE `registration` (
  `RegistrationID` int(11) NOT NULL,
  `TraderID` int(11) DEFAULT NULL,
  `MarketID` int(11) DEFAULT NULL,
  `RegistrationDate` date DEFAULT NULL,
  `ExpiryDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `registration`
--

INSERT INTO `registration` (`RegistrationID`, `TraderID`, `MarketID`, `RegistrationDate`, `ExpiryDate`) VALUES
(1, 1, 3, '2023-01-10', '2024-01-10'),
(3, 2, 1, '2023-06-10', '2024-06-01'),
(4, 4, 2, '2023-06-01', '2025-01-20'),
(5, 3, 1, '2024-08-05', '2025-08-05');

-- --------------------------------------------------------

--
-- Table structure for table `stall`
--

CREATE TABLE `stall` (
  `StallID` int(11) NOT NULL,
  `MarketID` int(11) DEFAULT NULL,
  `Location` varchar(100) DEFAULT NULL,
  `Size` varchar(20) DEFAULT NULL,
  `Status` varchar(20) DEFAULT 'Available'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stall`
--

INSERT INTO `stall` (`StallID`, `MarketID`, `Location`, `Size`, `Status`) VALUES
(1, 1, 'Section A, Row 1', 'Small', 'Occupied'),
(2, 1, 'Section B, Row 2', 'Small', 'Available'),
(3, 2, 'Block 1, Stand 3', 'Medium', 'Occupied'),
(4, 2, 'Block 2, Stand 1', 'Large', 'Occupied'),
(5, 3, 'Zone A, Unit 5', 'Large', 'Available');

-- --------------------------------------------------------

--
-- Table structure for table `trader`
--

CREATE TABLE `trader` (
  `TraderID` int(11) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Address` varchar(150) DEFAULT NULL,
  `Phonenumber` varchar(25) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `trader`
--

INSERT INTO `trader` (`TraderID`, `FirstName`, `LastName`, `Address`, `Phonenumber`, `Email`) VALUES
(1, 'Aminata', 'Koroma', '12 Kissy Road, Freetown', '076111111', 'aminata.koroma@gmail.com'),
(2, 'Mohamed', 'Sesay', '45 Wellington Street, Freetown', '078345678', 'mohamed.sesay@gmail.com'),
(3, 'Fatmata', 'Bangura', '8 Congo Cross, Freetown', '030456789', 'fatmata.bangura@gmail.com'),
(4, 'Ibrahim', 'Kamara', '23 Lumley Beach Road, Freetown', '077567890', 'ibrahim.kamara@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `allocation`
--
ALTER TABLE `allocation`
  ADD PRIMARY KEY (`AllocationID`),
  ADD KEY `TraderID` (`TraderID`),
  ADD KEY `StallID` (`StallID`);

--
-- Indexes for table `market`
--
ALTER TABLE `market`
  ADD PRIMARY KEY (`MarketID`);

--
-- Indexes for table `registration`
--
ALTER TABLE `registration`
  ADD PRIMARY KEY (`RegistrationID`),
  ADD KEY `TraderID` (`TraderID`),
  ADD KEY `MarketID` (`MarketID`);

--
-- Indexes for table `stall`
--
ALTER TABLE `stall`
  ADD PRIMARY KEY (`StallID`),
  ADD KEY `MarketID` (`MarketID`);

--
-- Indexes for table `trader`
--
ALTER TABLE `trader`
  ADD PRIMARY KEY (`TraderID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `allocation`
--
ALTER TABLE `allocation`
  MODIFY `AllocationID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `market`
--
ALTER TABLE `market`
  MODIFY `MarketID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `registration`
--
ALTER TABLE `registration`
  MODIFY `RegistrationID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `stall`
--
ALTER TABLE `stall`
  MODIFY `StallID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `trader`
--
ALTER TABLE `trader`
  MODIFY `TraderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `allocation`
--
ALTER TABLE `allocation`
  ADD CONSTRAINT `allocation_ibfk_1` FOREIGN KEY (`TraderID`) REFERENCES `trader` (`TraderID`),
  ADD CONSTRAINT `allocation_ibfk_2` FOREIGN KEY (`StallID`) REFERENCES `stall` (`StallID`);

--
-- Constraints for table `registration`
--
ALTER TABLE `registration`
  ADD CONSTRAINT `registration_ibfk_1` FOREIGN KEY (`TraderID`) REFERENCES `trader` (`TraderID`),
  ADD CONSTRAINT `registration_ibfk_2` FOREIGN KEY (`MarketID`) REFERENCES `market` (`MarketID`);

--
-- Constraints for table `stall`
--
ALTER TABLE `stall`
  ADD CONSTRAINT `stall_ibfk_1` FOREIGN KEY (`MarketID`) REFERENCES `market` (`MarketID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
