-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 12, 2021 at 04:46 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pharmacy`
--

-- --------------------------------------------------------

--
-- Stand-in structure for view `displayrecords`
-- (See below for the actual view)
--
CREATE TABLE `displayrecords` (
`SalesID` int(11)
,`ItemName` varchar(255)
,`ItemPrice` decimal(10,2)
,`Quantity` int(11)
,`Total` decimal(5,2)
,`OrderDate` date
);

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `ItemID` int(11) NOT NULL,
  `ItemName` text NOT NULL,
  `ItemPrice` decimal(10,0) NOT NULL,
  `ItemQuantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`ItemID`, `ItemName`, `ItemPrice`, `ItemQuantity`) VALUES
(1, 'testName', '1', 5),
(2, 'Doe', '2', 2),
(4, 'oof', '4', 4),
(5, 'oof', '5', 5),
(5, 'oof', '5', 5),
(5, 'oof', '5', 5),
(8, 'eght', '8', 8),
(8, 'eght', '8', 8),
(9, 'eght', '8', 8),
(11, 'name', '8', 8),
(8, '8', '8', 8),
(12, 'twelve', '8', 8),
(13, 'Pam Sucks', '1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `ItemID` int(11) NOT NULL,
  `ItemName` varchar(255) NOT NULL,
  `ItemPrice` decimal(10,2) NOT NULL,
  `ItemCost` decimal(10,0) NOT NULL,
  `ItemCategory` enum('Liquid','Tablet','Drops','Inhalers','Implants or patches','Antibiotics','Cream') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`ItemID`, `ItemName`, `ItemPrice`, `ItemCost`, `ItemCategory`) VALUES
(14, 'Panadol', '8.99', '8', 'Tablet'),
(16, 'Nicorette Quit Smoking ', '52.99', '50', 'Inhalers'),
(17, 'Swisse Ultraboost', '36.99', '30', 'Tablet'),
(18, 'Eyezep Allergy Eye Drops ', '14.99', '10', 'Drops'),
(19, 'Tetracycline ', '20.00', '18', 'Antibiotics'),
(20, 'Nurofen ', '16.99', '14', 'Tablet'),
(21, 'Claratyne Children\'s Hayfever and Allergy Relief ', '24.99', '20', 'Liquid'),
(22, 'Betadine Ready To Use Sore Throat', '10.49', '8', 'Liquid'),
(23, 'Canesten Plus Antifungal and Anti-Inflammatory Cream ', '6.49', '4', 'Cream'),
(24, 'Nasonex Allergy Non-Drowsy 24 Hour Nasal Spray ', '15.49', '13', 'Inhalers'),
(25, 'Metamucil Fibre Supplement FibreCaps ', '28.99', '26', 'Tablet'),
(26, 'Voltaren Ultrarub', '10.99', '9', 'Cream'),
(27, 'Vicks Inhaler Nasal Decongestant ', '11.99', '10', 'Inhalers'),
(28, 'Nurofen for Children ', '15.99', '14', 'Liquid'),
(29, 'Nicorette Patches ', '22.99', '20', 'Implants or patches'),
(30, 'Betadine Antiseptic Liquid Hospital ', '11.99', '10', 'Liquid'),
(31, 'Cefalexin ', '39.99', '30', 'Antibiotics'),
(32, 'Amoxicillin ', '28.75', '28', 'Antibiotics'),
(33, 'Erythromycin ', '14.99', '12', 'Antibiotics'),
(34, 'Demazin 12 Hour Relief Decongestant Nasal Spray ', '13.99', '10', 'Inhalers');

-- --------------------------------------------------------

--
-- Stand-in structure for view `monthlysales`
-- (See below for the actual view)
--
CREATE TABLE `monthlysales` (
`ItemID` int(11)
,`ItemName` varchar(255)
,`TotalSold` decimal(32,0)
,`TotalProfit` decimal(27,2)
,`Month` varchar(14)
);

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `SalesID` int(11) NOT NULL,
  `ItemID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Total` decimal(5,2) NOT NULL,
  `OrderDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `UserID` int(11) NOT NULL,
  `UserName` varchar(20) NOT NULL,
  `PasswordHash` varchar(64) NOT NULL,
  `Salt` char(38) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`UserID`, `UserName`, `PasswordHash`, `Salt`) VALUES
(1, 'JackBetson', '$1$qwertyui$TK42iRHG1p3u2shYs5izR.', '$1$qwertyuio'),
(2, 'PamFloros', '$1$qwertyui$W2L9.m/TYZd6OUNi0XVUJ0', '$1$qwertyuio'),
(3, 'JeddNugent', '$1$qwertyui$RSkGyCVxWnyW7AMKPnkB1/', '$1$qwertyuio'),
(4, 'KunjiraP', '$1$qwertyui$r64BuVbfjX8r6k6xD37Ye0', '$1$qwertyuio'),
(5, 'RyanMontigue', '$1$qwertyui$pUZgbWdVnY.V5tMk/OV7w/', '$1$qwertyuio'),
(6, 'EuniceSibal', '$1$qwertyui$XY.GSyAIOzZ82Ox0ethpu/', '$1$qwertyuio');

-- --------------------------------------------------------

--
-- Stand-in structure for view `weeklysales`
-- (See below for the actual view)
--
CREATE TABLE `weeklysales` (
`ItemID` int(11)
,`ItemName` varchar(255)
,`TotalSold` decimal(32,0)
,`TotalProfit` decimal(27,2)
,`WeekStarting` date
);

-- --------------------------------------------------------

--
-- Structure for view `displayrecords`
--
DROP TABLE IF EXISTS `displayrecords`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `displayrecords`  AS  select `sales`.`SalesID` AS `SalesID`,`items`.`ItemName` AS `ItemName`,`items`.`ItemPrice` AS `ItemPrice`,`sales`.`Quantity` AS `Quantity`,`sales`.`Total` AS `Total`,`sales`.`OrderDate` AS `OrderDate` from (`sales` join `items` on(`sales`.`ItemID` = `items`.`ItemID`)) ;

-- --------------------------------------------------------

--
-- Structure for view `monthlysales`
--
DROP TABLE IF EXISTS `monthlysales`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `monthlysales`  AS  select `items`.`ItemID` AS `ItemID`,`items`.`ItemName` AS `ItemName`,sum(`sales`.`Quantity`) AS `TotalSold`,sum(`sales`.`Total`) AS `TotalProfit`,concat(monthname(`sales`.`OrderDate`),' ',year(`sales`.`OrderDate`)) AS `Month` from (`items` join `sales` on(`items`.`ItemID` = `sales`.`ItemID`)) group by `items`.`ItemID`,concat(monthname(`sales`.`OrderDate`),' ',year(`sales`.`OrderDate`)) order by str_to_date(concat('01',month(`sales`.`OrderDate`),' ',year(`sales`.`OrderDate`)),'%d %m %Y') desc,`items`.`ItemID` ;

-- --------------------------------------------------------

--
-- Structure for view `weeklysales`
--
DROP TABLE IF EXISTS `weeklysales`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `weeklysales`  AS  select `items`.`ItemID` AS `ItemID`,`items`.`ItemName` AS `ItemName`,sum(`sales`.`Quantity`) AS `TotalSold`,sum(`sales`.`Total`) AS `TotalProfit`,str_to_date(concat(year(`sales`.`OrderDate`),' ',week(`sales`.`OrderDate`),' ','Monday'),'%X%V %W') AS `WeekStarting` from (`items` join `sales` on(`items`.`ItemID` = `sales`.`ItemID`)) group by `items`.`ItemID`,str_to_date(concat(year(`sales`.`OrderDate`),' ',week(`sales`.`OrderDate`),' ','Monday'),'%X%V %W') order by str_to_date(concat(year(`sales`.`OrderDate`),' ',week(`sales`.`OrderDate`),' ','Monday'),'%X%V %W') desc,`items`.`ItemID` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`ItemID`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`SalesID`),
  ADD KEY `ItemID` (`ItemID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`UserID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `ItemID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `SalesID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`ItemID`) REFERENCES `items` (`ItemID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
