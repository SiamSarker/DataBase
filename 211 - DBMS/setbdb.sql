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

DROP DATABASE IF EXISTS setbdb;
CREATE DATABASE IF NOT EXISTS setbdb;
USE setbdb;

-- --------------------------------------------------------

-- --------------------------------------------------------

--
-- Table structure for table `acc_transaction`
--

CREATE TABLE `acc_transaction` (
  `TXN_ID` bigint(20) NOT NULL,
  `AMOUNT` float NOT NULL,
  `FUNDS_AVAIL_DATE` datetime NOT NULL,
  `TXN_DATE` datetime NOT NULL,
  `TXN_TYPE_CD` varchar(10) DEFAULT NULL,
  `ACCOUNT_ID` int(11) DEFAULT NULL,
  `EXECUTION_BRANCH_ID` int(11) DEFAULT NULL,
  `TELLER_EMP_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


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
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `EMP_ID` int(11) NOT NULL,
  `END_DATE` date DEFAULT NULL,
  `FIRST_NAME` varchar(20) NOT NULL,
  `LAST_NAME` varchar(20) NOT NULL,
  `START_DATE` date NOT NULL,
  `TITLE` varchar(20) DEFAULT NULL,
  `ASSIGNED_BRANCH_ID` int(11) DEFAULT NULL,
  `DEPT_ID` int(11) DEFAULT NULL,
  `SUPERIOR_EMP_ID` int(11) DEFAULT NULL
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
-- Indexes for table `acc_transaction`
--
ALTER TABLE `acc_transaction`
  ADD PRIMARY KEY (`TXN_ID`),
  ADD KEY `ACC_TRANSACTION_BRANCH_FK` (`EXECUTION_BRANCH_ID`),
  ADD KEY `ACC_TRANSACTION_EMPLOYEE_FK` (`TELLER_EMP_ID`);

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
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`EMP_ID`),
  ADD KEY `EMPLOYEE_BRANCH_FK` (`ASSIGNED_BRANCH_ID`),
  ADD KEY `EMPLOYEE_DEPARTMENT_FK` (`DEPT_ID`),
  ADD KEY `EMPLOYEE_EMPLOYEE_FK` (`SUPERIOR_EMP_ID`);

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
-- Indexes for table `product_type`
--
ALTER TABLE `product_type`
  ADD PRIMARY KEY (`PRODUCT_TYPE_CD`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `acc_transaction`
--
ALTER TABLE `acc_transaction`
  MODIFY `TXN_ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

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
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `EMP_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `officer`
--
ALTER TABLE `officer`
  MODIFY `OFFICER_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `acc_transaction`
--
ALTER TABLE `acc_transaction`
  ADD CONSTRAINT `ACC_TRANSACTION_BRANCH_FK` FOREIGN KEY (`EXECUTION_BRANCH_ID`) REFERENCES `branch` (`BRANCH_ID`),
  ADD CONSTRAINT `ACC_TRANSACTION_EMPLOYEE_FK` FOREIGN KEY (`TELLER_EMP_ID`) REFERENCES `employee` (`EMP_ID`);

--
-- Constraints for table `business`
--
ALTER TABLE `business`
  ADD CONSTRAINT `BUSINESS_EMPLOYEE_FK` FOREIGN KEY (`CUST_ID`) REFERENCES `customer` (`CUST_ID`);

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `EMPLOYEE_BRANCH_FK` FOREIGN KEY (`ASSIGNED_BRANCH_ID`) REFERENCES `branch` (`BRANCH_ID`),
  ADD CONSTRAINT `EMPLOYEE_DEPARTMENT_FK` FOREIGN KEY (`DEPT_ID`) REFERENCES `department` (`DEPT_ID`),
  ADD CONSTRAINT `EMPLOYEE_EMPLOYEE_FK` FOREIGN KEY (`SUPERIOR_EMP_ID`) REFERENCES `employee` (`EMP_ID`);

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

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
