-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 13, 2021 at 07:31 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `businessdb`
--

DROP DATABASE IF EXISTS setadb;
CREATE DATABASE IF NOT EXISTS setadb;
USE setadb;

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `ACCOUNT_ID` int(11) NOT NULL,
  `AVAIL_BALANCE` float DEFAULT NULL,
  `CLOSE_DATE` date DEFAULT NULL,
  `LAST_ACTIVITY_DATE` date DEFAULT NULL,
  `OPEN_DATE` date NOT NULL,
  `PENDING_BALANCE` float DEFAULT NULL,
  `STATUS` varchar(10) DEFAULT NULL,
  `CUST_ID` int(11) DEFAULT NULL,
  `OPEN_BRANCH_ID` int(11) NOT NULL,
  `OPEN_EMP_ID` int(11) NOT NULL,
  `PRODUCT_CD` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE `branch` (
  `BRANCH_ID` int(11) NOT NULL,
  `ADDRESS` varchar(30) DEFAULT NULL,
  `CITY` varchar(20) DEFAULT NULL,
  `NAME` varchar(20) NOT NULL,
  `STATE` varchar(10) DEFAULT NULL,
  `ZIP_CODE` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `business`
--

CREATE TABLE `business` (
  `INCORP_DATE` date DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  `STATE_ID` varchar(10) NOT NULL,
  `CUST_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `CUST_ID` int(11) NOT NULL,
  `ADDRESS` varchar(30) DEFAULT NULL,
  `CITY` varchar(20) DEFAULT NULL,
  `CUST_TYPE_CD` varchar(1) NOT NULL,
  `FED_ID` varchar(12) NOT NULL,
  `POSTAL_CODE` varchar(10) DEFAULT NULL,
  `STATE` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `DEPT_ID` int(11) NOT NULL,
  `NAME` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `individual`
--

CREATE TABLE `individual` (
  `BIRTH_DATE` date DEFAULT NULL,
  `FIRST_NAME` varchar(30) NOT NULL,
  `LAST_NAME` varchar(30) NOT NULL,
  `CUST_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `officer`
--

CREATE TABLE `officer` (
  `OFFICER_ID` int(11) NOT NULL,
  `END_DATE` date DEFAULT NULL,
  `FIRST_NAME` varchar(30) NOT NULL,
  `LAST_NAME` varchar(30) NOT NULL,
  `START_DATE` date NOT NULL,
  `TITLE` varchar(20) DEFAULT NULL,
  `CUST_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `PRODUCT_CD` varchar(10) NOT NULL,
  `DATE_OFFERED` date DEFAULT NULL,
  `DATE_RETIRED` date DEFAULT NULL,
  `NAME` varchar(50) NOT NULL,
  `PRODUCT_TYPE_CD` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `product_type`
--

CREATE TABLE `product_type` (
  `PRODUCT_TYPE_CD` varchar(255) NOT NULL,
  `NAME` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`ACCOUNT_ID`),
  ADD KEY `ACCOUNT_CUSTOMER_FK` (`CUST_ID`),
  ADD KEY `ACCOUNT_BRANCH_FK` (`OPEN_BRANCH_ID`),
  ADD KEY `ACCOUNT_EMPLOYEE_FK` (`OPEN_EMP_ID`),
  ADD KEY `ACCOUNT_PRODUCT_FK` (`PRODUCT_CD`);

--
-- Indexes for table `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`BRANCH_ID`);

--
-- Indexes for table `business`
--
ALTER TABLE `business`
  ADD PRIMARY KEY (`CUST_ID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`CUST_ID`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`DEPT_ID`);


--
-- Indexes for table `individual`
--
ALTER TABLE `individual`
  ADD PRIMARY KEY (`CUST_ID`);

--
-- Indexes for table `officer`
--
ALTER TABLE `officer`
  ADD PRIMARY KEY (`OFFICER_ID`),
  ADD KEY `OFFICER_CUSTOMER_FK` (`CUST_ID`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`PRODUCT_CD`),
  ADD KEY `PRODUCT_PRODUCT_TYPE_FK` (`PRODUCT_TYPE_CD`);

--
-- Indexes for table `product_type`
--
ALTER TABLE `product_type`
  ADD PRIMARY KEY (`PRODUCT_TYPE_CD`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `ACCOUNT_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `branch`
--
ALTER TABLE `branch`
  MODIFY `BRANCH_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `CUST_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `DEPT_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `officer`
--
ALTER TABLE `officer`
  MODIFY `OFFICER_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `account`
--
ALTER TABLE `account`
  ADD CONSTRAINT `ACCOUNT_BRANCH_FK` FOREIGN KEY (`OPEN_BRANCH_ID`) REFERENCES `branch` (`BRANCH_ID`),
  ADD CONSTRAINT `ACCOUNT_CUSTOMER_FK` FOREIGN KEY (`CUST_ID`) REFERENCES `customer` (`CUST_ID`),
  ADD CONSTRAINT `ACCOUNT_PRODUCT_FK` FOREIGN KEY (`PRODUCT_CD`) REFERENCES `product` (`PRODUCT_CD`);

--
-- Constraints for table `business`
--
ALTER TABLE `business`
  ADD CONSTRAINT `BUSINESS_EMPLOYEE_FK` FOREIGN KEY (`CUST_ID`) REFERENCES `customer` (`CUST_ID`);

--
-- Constraints for table `individual`
--
ALTER TABLE `individual`
  ADD CONSTRAINT `INDIVIDUAL_CUSTOMER_FK` FOREIGN KEY (`CUST_ID`) REFERENCES `customer` (`CUST_ID`);

--
-- Constraints for table `officer`
--
ALTER TABLE `officer`
  ADD CONSTRAINT `OFFICER_CUSTOMER_FK` FOREIGN KEY (`CUST_ID`) REFERENCES `customer` (`CUST_ID`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `PRODUCT_PRODUCT_TYPE_FK` FOREIGN KEY (`PRODUCT_TYPE_CD`) REFERENCES `product_type` (`PRODUCT_TYPE_CD`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
