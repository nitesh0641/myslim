-- phpMyAdmin SQL Dump
-- version 4.6.6deb1+deb.cihar.com~xenial.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 01, 2018 at 02:11 PM
-- Server version: 5.7.19-17-log
-- PHP Version: 7.0.22-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cargo`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_login`
--

CREATE TABLE `admin_login` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email_id` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `admin_type_id` int(11) NOT NULL,
  `status` enum('Active','Inactive') NOT NULL,
  `creation_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bank_details`
--

CREATE TABLE `bank_details` (
  `id` bigint(20) NOT NULL,
  `user_type` enum('Supplier','POS Agent','Customer') NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `payment_method_type_id` int(11) NOT NULL,
  `account_name` varchar(100) NOT NULL,
  `account_number` varchar(100) NOT NULL,
  `ifsc_code` varchar(50) NOT NULL,
  `branch` varchar(100) NOT NULL,
  `default_mode` enum('Yes','No') NOT NULL,
  `status` enum('Active','Inactive') NOT NULL,
  `creation_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(225) NOT NULL,
  `creation_date` datetime NOT NULL,
  `created_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `buckets`
--

CREATE TABLE `buckets` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(225) NOT NULL,
  `max_quantity` int(11) NOT NULL,
  `creation_date` datetime NOT NULL,
  `created_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bucket_items`
--

CREATE TABLE `bucket_items` (
  `id` bigint(20) NOT NULL,
  `bucket_id` int(11) NOT NULL,
  `sku_id` bigint(20) NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email_id` varchar(100) NOT NULL,
  `is_email_verified` tinyint(1) NOT NULL DEFAULT '0',
  `mobile_number` varchar(12) NOT NULL,
  `is_mobile_verified` tinyint(1) NOT NULL DEFAULT '0',
  `image_path` varchar(225) NOT NULL,
  `address` varchar(100) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  `pin_code` varchar(10) NOT NULL,
  `is_verified` tinyint(1) NOT NULL DEFAULT '0',
  `status` enum('Active','Inactive') NOT NULL,
  `ratings` varchar(10) NOT NULL,
  `creation_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `customer_cart`
--

CREATE TABLE `customer_cart` (
  `id` bigint(20) NOT NULL,
  `customer_id` bigint(20) NOT NULL,
  `session_id` varchar(100) NOT NULL,
  `pos_id` bigint(20) NOT NULL,
  `pos_agent_id` bigint(20) NOT NULL,
  `pos_product_id` bigint(20) NOT NULL,
  `sku_id` bigint(20) NOT NULL,
  `sku_quantity` int(11) NOT NULL,
  `sku_price` decimal(5,2) NOT NULL DEFAULT '0.00',
  `amount` decimal(5,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(5,2) NOT NULL,
  `total_amount` decimal(5,2) NOT NULL DEFAULT '0.00',
  `creation_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `customer_orders`
--

CREATE TABLE `customer_orders` (
  `id` bigint(20) NOT NULL,
  `order_id` varchar(100) NOT NULL,
  `customer_id` bigint(20) NOT NULL,
  `pos_id` bigint(20) NOT NULL,
  `pos_agent_id` bigint(20) NOT NULL,
  `amount` decimal(5,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(5,2) NOT NULL DEFAULT '0.00',
  `total_amount` decimal(5,2) NOT NULL DEFAULT '0.00',
  `payment_method_id` int(11) NOT NULL,
  `payment_status` enum('Paid','Pending') NOT NULL,
  `creation_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `customer_orders_detail`
--

CREATE TABLE `customer_orders_detail` (
  `id` bigint(20) NOT NULL,
  `order_id` varchar(100) NOT NULL,
  `pos_product_id` bigint(20) NOT NULL,
  `sku_id` bigint(20) NOT NULL,
  `quantity` int(10) NOT NULL,
  `price` decimal(5,2) NOT NULL DEFAULT '0.00',
  `creation_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `customer_sessions`
--

CREATE TABLE `customer_sessions` (
  `id` bigint(20) NOT NULL,
  `customer id` bigint(20) NOT NULL,
  `session_id` varchar(100) NOT NULL,
  `count` int(11) NOT NULL,
  `creation_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `id_proof_type`
--

CREATE TABLE `id_proof_type` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `incentives`
--

CREATE TABLE `incentives` (
  `id` bigint(20) NOT NULL,
  `incentive_model_id` int(11) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `user_type` enum('pos agent','customer','supplier') NOT NULL,
  `status` enum('Paid','Pending') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `incentive_models`
--

CREATE TABLE `incentive_models` (
  `id` int(11) NOT NULL,
  `payment_model_id` int(11) NOT NULL,
  `sku_category_id` int(11) NOT NULL,
  `sku_id` bigint(20) NOT NULL,
  `target_quantity` int(10) NOT NULL,
  `duration` varchar(50) NOT NULL,
  `amount` decimal(5,2) NOT NULL DEFAULT '0.00',
  `status` enum('Active','Inactive') NOT NULL,
  `creation_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `login_auth`
--

CREATE TABLE `login_auth` (
  `id` bigint(20) NOT NULL,
  `user_type` enum('POS Agent','Customer') NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `email_id` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `alternate_password` varchar(100) NOT NULL,
  `status` enum('Active','Inactive') NOT NULL,
  `creation_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `master_acl_role`
--

CREATE TABLE `master_acl_role` (
  `id` int(11) NOT NULL,
  `admin_type_id` int(11) NOT NULL,
  `controller_name` varchar(100) NOT NULL,
  `function_name` varchar(100) NOT NULL,
  `add` tinyint(1) NOT NULL DEFAULT '0',
  `edit` tinyint(1) NOT NULL DEFAULT '0',
  `delete` tinyint(1) NOT NULL DEFAULT '0',
  `view` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `master_admin_type`
--

CREATE TABLE `master_admin_type` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `payment_method_type`
--

CREATE TABLE `payment_method_type` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `payment_mode` enum('bank','wallet','cc','db','others') NOT NULL,
  `mode_to_pay` enum('0','1') NOT NULL,
  `status` enum('Active','Inactive') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `payment_models`
--

CREATE TABLE `payment_models` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `status` enum('Active','Inactive') NOT NULL,
  `creation_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `point_of_sale`
--

CREATE TABLE `point_of_sale` (
  `id` bigint(20) NOT NULL,
  `identification_number` varchar(50) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email_id` varchar(100) NOT NULL,
  `mobile_number` varchar(12) NOT NULL,
  `registartion_number` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  `pin_code` varchar(10) NOT NULL,
  `is_verified` enum('0','1') NOT NULL,
  `status` enum('Active','Inactive') NOT NULL,
  `created_by` int(11) NOT NULL,
  `creation_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pos_acl_role`
--

CREATE TABLE `pos_acl_role` (
  `id` int(11) NOT NULL,
  `pos_user_type_id` int(11) NOT NULL,
  `controller_name` varchar(100) NOT NULL,
  `function_name` varchar(100) NOT NULL,
  `add` tinyint(1) NOT NULL DEFAULT '0',
  `edit` tinyint(1) NOT NULL DEFAULT '0',
  `delete` tinyint(1) NOT NULL DEFAULT '0',
  `view` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pos_agent`
--

CREATE TABLE `pos_agent` (
  `id` bigint(20) NOT NULL,
  `pos_id` bigint(20) NOT NULL,
  `agent_type` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email_id` varchar(100) NOT NULL,
  `is_email_verified` tinyint(1) NOT NULL DEFAULT '0',
  `mobile_number` varchar(12) NOT NULL,
  `is_mobile_verified` tinyint(1) NOT NULL DEFAULT '0',
  `image_path` varchar(225) NOT NULL,
  `address` varchar(100) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  `pin_code` varchar(10) NOT NULL,
  `id_proof_type_id` int(11) NOT NULL,
  `id_proof_number` varchar(100) NOT NULL,
  `is_verified` tinyint(1) NOT NULL DEFAULT '0',
  `referral_id` int(11) NOT NULL DEFAULT '0',
  `status` enum('Active','Inactive') NOT NULL,
  `ratings` varchar(100) NOT NULL,
  `created_by` int(11) NOT NULL,
  `creation_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pos_agent_cart`
--

CREATE TABLE `pos_agent_cart` (
  `id` bigint(20) NOT NULL,
  `pos_agent_id` bigint(20) NOT NULL,
  `pos_id` bigint(20) NOT NULL,
  `sku_id` bigint(20) NOT NULL,
  `sku_quantity` int(11) NOT NULL,
  `sku_price` decimal(5,2) NOT NULL,
  `total_amount` decimal(5,2) NOT NULL,
  `creation_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pos_agent_orders`
--

CREATE TABLE `pos_agent_orders` (
  `id` bigint(20) NOT NULL,
  `order_id` varchar(100) NOT NULL,
  `pos_id` bigint(20) NOT NULL,
  `pos_agent_id` bigint(20) NOT NULL,
  `total_price` decimal(5,2) NOT NULL DEFAULT '0.00',
  `payment_method_id` int(11) NOT NULL,
  `payment_status` enum('Paid','Pending') NOT NULL,
  `creation_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pos_agent_orders_detail`
--

CREATE TABLE `pos_agent_orders_detail` (
  `id` bigint(20) NOT NULL,
  `order_id` varchar(100) NOT NULL,
  `sku_id` bigint(20) NOT NULL,
  `quantity` int(5) NOT NULL,
  `price` decimal(5,2) NOT NULL DEFAULT '0.00',
  `creation_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pos_agent_type`
--

CREATE TABLE `pos_agent_type` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pos_brands`
--

CREATE TABLE `pos_brands` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pos_brand_mapping`
--

CREATE TABLE `pos_brand_mapping` (
  `id` bigint(20) NOT NULL,
  `pos_id` bigint(20) NOT NULL,
  `pos_brand_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pos_category`
--

CREATE TABLE `pos_category` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pos_products`
--

CREATE TABLE `pos_products` (
  `id` bigint(20) NOT NULL,
  `pos_id` bigint(20) NOT NULL,
  `sku_id` bigint(20) NOT NULL,
  `total_bought` int(11) NOT NULL,
  `total_sold` int(11) NOT NULL,
  `return_quantity` int(11) NOT NULL,
  `creation_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `product_suppliers`
--

CREATE TABLE `product_suppliers` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `mobile_number` varchar(12) NOT NULL,
  `email_id` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  `credit_period` varchar(50) NOT NULL,
  `creation_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `referrals`
--

CREATE TABLE `referrals` (
  `id` bigint(20) NOT NULL,
  `referred_by_user_type` enum('pos agent','customer','supplier') NOT NULL,
  `referral_model_id` int(11) NOT NULL,
  `referred_by` bigint(20) NOT NULL,
  `referred_to_user_type` enum('pos agent','customer','supplier') NOT NULL,
  `referred_to_user_id` bigint(20) NOT NULL,
  `status` enum('Paid','Pending') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `referral_models`
--

CREATE TABLE `referral_models` (
  `id` int(11) NOT NULL,
  `payment_model_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `amount` decimal(5,2) NOT NULL DEFAULT '0.00',
  `status` enum('Active','Inactive') NOT NULL,
  `creation_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rewards`
--

CREATE TABLE `rewards` (
  `id` bigint(20) NOT NULL,
  `reward_model_id` int(11) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `user_type` enum('pos agent','customer','supplier') NOT NULL,
  `status` enum('Paid','Pending') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `reward_models`
--

CREATE TABLE `reward_models` (
  `id` int(11) NOT NULL,
  `payment_model_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `amount` decimal(5,2) NOT NULL DEFAULT '0.00',
  `status` enum('Active','Inactive') NOT NULL,
  `creation_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sku`
--

CREATE TABLE `sku` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `category_id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `weight` decimal(5,2) NOT NULL,
  `height` decimal(5,2) NOT NULL,
  `length` decimal(5,2) NOT NULL,
  `width` decimal(5,2) NOT NULL,
  `volume` decimal(5,2) NOT NULL,
  `quantity_bought` int(11) NOT NULL,
  `quantity_sold` int(11) NOT NULL,
  `type` enum('Paid','Sample') NOT NULL,
  `commision` decimal(5,2) NOT NULL,
  `incentive` decimal(5,2) NOT NULL,
  `buying_price` decimal(5,2) NOT NULL,
  `selling_price` decimal(5,2) NOT NULL,
  `description` varchar(225) NOT NULL,
  `status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `creation_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sku_category`
--

CREATE TABLE `sku_category` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(225) NOT NULL,
  `creation_date` datetime NOT NULL,
  `created_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sku_images`
--

CREATE TABLE `sku_images` (
  `id` bigint(20) NOT NULL,
  `sku_id` bigint(20) NOT NULL,
  `image_path` varchar(225) NOT NULL,
  `status` enum('Active','Inactive') NOT NULL,
  `creation_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `supplier_payments`
--

CREATE TABLE `supplier_payments` (
  `id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `payment_model_id` int(11) NOT NULL,
  `invoice_number` varchar(100) NOT NULL,
  `invoice_date` datetime NOT NULL,
  `gst_number` varchar(50) NOT NULL,
  `total_mount` varchar(50) NOT NULL,
  `paid_amount` varchar(50) NOT NULL,
  `pending_amount` varchar(50) NOT NULL,
  `max_due_date` date NOT NULL,
  `status` enum('Paid','Pending') NOT NULL,
  `creation_date` datetime NOT NULL,
  `bank_detail_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_login`
--
ALTER TABLE `admin_login`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_login_fk0` (`admin_type_id`);

--
-- Indexes for table `bank_details`
--
ALTER TABLE `bank_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bank_details_fk0` (`payment_method_type_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `buckets`
--
ALTER TABLE `buckets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bucket_items`
--
ALTER TABLE `bucket_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bucket_items_fk0` (`bucket_id`),
  ADD KEY `bucket_items_fk1` (`sku_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_cart`
--
ALTER TABLE `customer_cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_cart_fk0` (`customer_id`),
  ADD KEY `customer_cart_fk1` (`pos_id`),
  ADD KEY `customer_cart_fk2` (`pos_agent_id`),
  ADD KEY `customer_cart_fk3` (`pos_product_id`),
  ADD KEY `customer_cart_fk4` (`sku_id`);

--
-- Indexes for table `customer_orders`
--
ALTER TABLE `customer_orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order_id` (`order_id`),
  ADD KEY `customer_orders_fk0` (`customer_id`),
  ADD KEY `customer_orders_fk1` (`pos_id`),
  ADD KEY `customer_orders_fk2` (`pos_agent_id`),
  ADD KEY `customer_orders_fk3` (`payment_method_id`);

--
-- Indexes for table `customer_orders_detail`
--
ALTER TABLE `customer_orders_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_orders_detail_fk0` (`order_id`),
  ADD KEY `customer_orders_detail_fk1` (`pos_product_id`),
  ADD KEY `customer_orders_detail_fk2` (`sku_id`);

--
-- Indexes for table `customer_sessions`
--
ALTER TABLE `customer_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_sessions_fk0` (`customer id`);

--
-- Indexes for table `id_proof_type`
--
ALTER TABLE `id_proof_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `incentives`
--
ALTER TABLE `incentives`
  ADD PRIMARY KEY (`id`),
  ADD KEY `incentives_fk0` (`incentive_model_id`);

--
-- Indexes for table `incentive_models`
--
ALTER TABLE `incentive_models`
  ADD PRIMARY KEY (`id`),
  ADD KEY `incentive_models_fk0` (`payment_model_id`),
  ADD KEY `incentive_models_fk1` (`sku_category_id`),
  ADD KEY `incentive_models_fk2` (`sku_id`);

--
-- Indexes for table `login_auth`
--
ALTER TABLE `login_auth`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_acl_role`
--
ALTER TABLE `master_acl_role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `master_acl_role_fk0` (`admin_type_id`);

--
-- Indexes for table `master_admin_type`
--
ALTER TABLE `master_admin_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_method_type`
--
ALTER TABLE `payment_method_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_models`
--
ALTER TABLE `payment_models`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `point_of_sale`
--
ALTER TABLE `point_of_sale`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `identification_number` (`identification_number`),
  ADD KEY `point_of_sale_fk0` (`category_id`);

--
-- Indexes for table `pos_acl_role`
--
ALTER TABLE `pos_acl_role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pos_acl_role_fk0` (`pos_user_type_id`);

--
-- Indexes for table `pos_agent`
--
ALTER TABLE `pos_agent`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pos_agent_fk0` (`pos_id`),
  ADD KEY `pos_agent_fk1` (`agent_type`),
  ADD KEY `pos_agent_fk2` (`id_proof_type_id`);

--
-- Indexes for table `pos_agent_cart`
--
ALTER TABLE `pos_agent_cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pos_agent_cart_fk0` (`pos_agent_id`),
  ADD KEY `pos_agent_cart_fk1` (`pos_id`),
  ADD KEY `pos_agent_cart_fk2` (`sku_id`);

--
-- Indexes for table `pos_agent_orders`
--
ALTER TABLE `pos_agent_orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order_id` (`order_id`),
  ADD KEY `pos_agent_orders_fk0` (`pos_id`),
  ADD KEY `pos_agent_orders_fk1` (`pos_agent_id`),
  ADD KEY `pos_agent_orders_fk2` (`payment_method_id`);

--
-- Indexes for table `pos_agent_orders_detail`
--
ALTER TABLE `pos_agent_orders_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pos_agent_orders_detail_fk0` (`order_id`),
  ADD KEY `pos_agent_orders_detail_fk1` (`sku_id`);

--
-- Indexes for table `pos_agent_type`
--
ALTER TABLE `pos_agent_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pos_brands`
--
ALTER TABLE `pos_brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pos_brand_mapping`
--
ALTER TABLE `pos_brand_mapping`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pos_brand_mapping_fk0` (`pos_id`),
  ADD KEY `pos_brand_mapping_fk1` (`pos_brand_id`);

--
-- Indexes for table `pos_category`
--
ALTER TABLE `pos_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pos_products`
--
ALTER TABLE `pos_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pos_products_fk0` (`pos_id`),
  ADD KEY `pos_products_fk1` (`sku_id`);

--
-- Indexes for table `product_suppliers`
--
ALTER TABLE `product_suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `referrals`
--
ALTER TABLE `referrals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `referrals_fk0` (`referral_model_id`);

--
-- Indexes for table `referral_models`
--
ALTER TABLE `referral_models`
  ADD PRIMARY KEY (`id`),
  ADD KEY `referral_models_fk0` (`payment_model_id`);

--
-- Indexes for table `rewards`
--
ALTER TABLE `rewards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rewards_fk0` (`reward_model_id`);

--
-- Indexes for table `reward_models`
--
ALTER TABLE `reward_models`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reward_models_fk0` (`payment_model_id`);

--
-- Indexes for table `sku`
--
ALTER TABLE `sku`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sku_fk0` (`category_id`),
  ADD KEY `sku_fk1` (`brand_id`),
  ADD KEY `sku_fk2` (`supplier_id`);

--
-- Indexes for table `sku_category`
--
ALTER TABLE `sku_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sku_images`
--
ALTER TABLE `sku_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sku_images_fk0` (`sku_id`);

--
-- Indexes for table `supplier_payments`
--
ALTER TABLE `supplier_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `supplier_payments_fk0` (`supplier_id`),
  ADD KEY `supplier_payments_fk1` (`payment_model_id`),
  ADD KEY `supplier_payments_fk2` (`bank_detail_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_login`
--
ALTER TABLE `admin_login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bank_details`
--
ALTER TABLE `bank_details`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `buckets`
--
ALTER TABLE `buckets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bucket_items`
--
ALTER TABLE `bucket_items`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `customer_cart`
--
ALTER TABLE `customer_cart`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `customer_orders`
--
ALTER TABLE `customer_orders`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `customer_orders_detail`
--
ALTER TABLE `customer_orders_detail`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `customer_sessions`
--
ALTER TABLE `customer_sessions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `id_proof_type`
--
ALTER TABLE `id_proof_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `incentives`
--
ALTER TABLE `incentives`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `incentive_models`
--
ALTER TABLE `incentive_models`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `login_auth`
--
ALTER TABLE `login_auth`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `master_acl_role`
--
ALTER TABLE `master_acl_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `master_admin_type`
--
ALTER TABLE `master_admin_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `payment_method_type`
--
ALTER TABLE `payment_method_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `payment_models`
--
ALTER TABLE `payment_models`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `point_of_sale`
--
ALTER TABLE `point_of_sale`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pos_acl_role`
--
ALTER TABLE `pos_acl_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pos_agent`
--
ALTER TABLE `pos_agent`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pos_agent_cart`
--
ALTER TABLE `pos_agent_cart`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pos_agent_orders`
--
ALTER TABLE `pos_agent_orders`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pos_agent_orders_detail`
--
ALTER TABLE `pos_agent_orders_detail`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pos_agent_type`
--
ALTER TABLE `pos_agent_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pos_brands`
--
ALTER TABLE `pos_brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pos_brand_mapping`
--
ALTER TABLE `pos_brand_mapping`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pos_category`
--
ALTER TABLE `pos_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pos_products`
--
ALTER TABLE `pos_products`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `product_suppliers`
--
ALTER TABLE `product_suppliers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `referrals`
--
ALTER TABLE `referrals`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `referral_models`
--
ALTER TABLE `referral_models`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `rewards`
--
ALTER TABLE `rewards`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `reward_models`
--
ALTER TABLE `reward_models`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sku`
--
ALTER TABLE `sku`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sku_category`
--
ALTER TABLE `sku_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sku_images`
--
ALTER TABLE `sku_images`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `supplier_payments`
--
ALTER TABLE `supplier_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin_login`
--
ALTER TABLE `admin_login`
  ADD CONSTRAINT `admin_login_fk0` FOREIGN KEY (`admin_type_id`) REFERENCES `master_admin_type` (`id`);

--
-- Constraints for table `bank_details`
--
ALTER TABLE `bank_details`
  ADD CONSTRAINT `bank_details_fk0` FOREIGN KEY (`payment_method_type_id`) REFERENCES `payment_method_type` (`id`);

--
-- Constraints for table `bucket_items`
--
ALTER TABLE `bucket_items`
  ADD CONSTRAINT `bucket_items_fk0` FOREIGN KEY (`bucket_id`) REFERENCES `buckets` (`id`),
  ADD CONSTRAINT `bucket_items_fk1` FOREIGN KEY (`sku_id`) REFERENCES `sku` (`id`);

--
-- Constraints for table `customer_cart`
--
ALTER TABLE `customer_cart`
  ADD CONSTRAINT `customer_cart_fk0` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  ADD CONSTRAINT `customer_cart_fk1` FOREIGN KEY (`pos_id`) REFERENCES `point_of_sale` (`id`),
  ADD CONSTRAINT `customer_cart_fk2` FOREIGN KEY (`pos_agent_id`) REFERENCES `pos_agent` (`id`),
  ADD CONSTRAINT `customer_cart_fk3` FOREIGN KEY (`pos_product_id`) REFERENCES `pos_products` (`id`),
  ADD CONSTRAINT `customer_cart_fk4` FOREIGN KEY (`sku_id`) REFERENCES `sku` (`id`);

--
-- Constraints for table `customer_orders`
--
ALTER TABLE `customer_orders`
  ADD CONSTRAINT `customer_orders_fk0` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  ADD CONSTRAINT `customer_orders_fk1` FOREIGN KEY (`pos_id`) REFERENCES `point_of_sale` (`id`),
  ADD CONSTRAINT `customer_orders_fk2` FOREIGN KEY (`pos_agent_id`) REFERENCES `pos_agent` (`id`),
  ADD CONSTRAINT `customer_orders_fk3` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_method_type` (`id`);

--
-- Constraints for table `customer_orders_detail`
--
ALTER TABLE `customer_orders_detail`
  ADD CONSTRAINT `customer_orders_detail_fk0` FOREIGN KEY (`order_id`) REFERENCES `customer_orders` (`order_id`),
  ADD CONSTRAINT `customer_orders_detail_fk1` FOREIGN KEY (`pos_product_id`) REFERENCES `pos_products` (`id`),
  ADD CONSTRAINT `customer_orders_detail_fk2` FOREIGN KEY (`sku_id`) REFERENCES `sku` (`id`);

--
-- Constraints for table `customer_sessions`
--
ALTER TABLE `customer_sessions`
  ADD CONSTRAINT `customer_sessions_fk0` FOREIGN KEY (`customer id`) REFERENCES `customers` (`id`);

--
-- Constraints for table `incentives`
--
ALTER TABLE `incentives`
  ADD CONSTRAINT `incentives_fk0` FOREIGN KEY (`incentive_model_id`) REFERENCES `incentive_models` (`id`);

--
-- Constraints for table `incentive_models`
--
ALTER TABLE `incentive_models`
  ADD CONSTRAINT `incentive_models_fk0` FOREIGN KEY (`payment_model_id`) REFERENCES `payment_models` (`id`),
  ADD CONSTRAINT `incentive_models_fk1` FOREIGN KEY (`sku_category_id`) REFERENCES `sku_category` (`id`),
  ADD CONSTRAINT `incentive_models_fk2` FOREIGN KEY (`sku_id`) REFERENCES `sku` (`id`);

--
-- Constraints for table `master_acl_role`
--
ALTER TABLE `master_acl_role`
  ADD CONSTRAINT `master_acl_role_fk0` FOREIGN KEY (`admin_type_id`) REFERENCES `master_admin_type` (`id`);

--
-- Constraints for table `point_of_sale`
--
ALTER TABLE `point_of_sale`
  ADD CONSTRAINT `point_of_sale_fk0` FOREIGN KEY (`category_id`) REFERENCES `pos_category` (`id`);

--
-- Constraints for table `pos_acl_role`
--
ALTER TABLE `pos_acl_role`
  ADD CONSTRAINT `pos_acl_role_fk0` FOREIGN KEY (`pos_user_type_id`) REFERENCES `pos_agent_type` (`id`);

--
-- Constraints for table `pos_agent`
--
ALTER TABLE `pos_agent`
  ADD CONSTRAINT `pos_agent_fk0` FOREIGN KEY (`pos_id`) REFERENCES `point_of_sale` (`id`),
  ADD CONSTRAINT `pos_agent_fk1` FOREIGN KEY (`agent_type`) REFERENCES `pos_agent_type` (`id`),
  ADD CONSTRAINT `pos_agent_fk2` FOREIGN KEY (`id_proof_type_id`) REFERENCES `id_proof_type` (`id`);

--
-- Constraints for table `pos_agent_cart`
--
ALTER TABLE `pos_agent_cart`
  ADD CONSTRAINT `pos_agent_cart_fk0` FOREIGN KEY (`pos_agent_id`) REFERENCES `pos_agent` (`id`),
  ADD CONSTRAINT `pos_agent_cart_fk1` FOREIGN KEY (`pos_id`) REFERENCES `point_of_sale` (`id`),
  ADD CONSTRAINT `pos_agent_cart_fk2` FOREIGN KEY (`sku_id`) REFERENCES `sku` (`id`);

--
-- Constraints for table `pos_agent_orders`
--
ALTER TABLE `pos_agent_orders`
  ADD CONSTRAINT `pos_agent_orders_fk0` FOREIGN KEY (`pos_id`) REFERENCES `point_of_sale` (`id`),
  ADD CONSTRAINT `pos_agent_orders_fk1` FOREIGN KEY (`pos_agent_id`) REFERENCES `pos_agent` (`id`),
  ADD CONSTRAINT `pos_agent_orders_fk2` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_method_type` (`id`);

--
-- Constraints for table `pos_agent_orders_detail`
--
ALTER TABLE `pos_agent_orders_detail`
  ADD CONSTRAINT `pos_agent_orders_detail_fk0` FOREIGN KEY (`order_id`) REFERENCES `pos_agent_orders` (`order_id`),
  ADD CONSTRAINT `pos_agent_orders_detail_fk1` FOREIGN KEY (`sku_id`) REFERENCES `sku` (`id`);

--
-- Constraints for table `pos_brand_mapping`
--
ALTER TABLE `pos_brand_mapping`
  ADD CONSTRAINT `pos_brand_mapping_fk0` FOREIGN KEY (`pos_id`) REFERENCES `point_of_sale` (`id`),
  ADD CONSTRAINT `pos_brand_mapping_fk1` FOREIGN KEY (`pos_brand_id`) REFERENCES `pos_brands` (`id`);

--
-- Constraints for table `pos_products`
--
ALTER TABLE `pos_products`
  ADD CONSTRAINT `pos_products_fk0` FOREIGN KEY (`pos_id`) REFERENCES `point_of_sale` (`id`),
  ADD CONSTRAINT `pos_products_fk1` FOREIGN KEY (`sku_id`) REFERENCES `sku` (`id`);

--
-- Constraints for table `referrals`
--
ALTER TABLE `referrals`
  ADD CONSTRAINT `referrals_fk0` FOREIGN KEY (`referral_model_id`) REFERENCES `referral_models` (`id`);

--
-- Constraints for table `referral_models`
--
ALTER TABLE `referral_models`
  ADD CONSTRAINT `referral_models_fk0` FOREIGN KEY (`payment_model_id`) REFERENCES `payment_models` (`id`);

--
-- Constraints for table `rewards`
--
ALTER TABLE `rewards`
  ADD CONSTRAINT `rewards_fk0` FOREIGN KEY (`reward_model_id`) REFERENCES `reward_models` (`id`);

--
-- Constraints for table `reward_models`
--
ALTER TABLE `reward_models`
  ADD CONSTRAINT `reward_models_fk0` FOREIGN KEY (`payment_model_id`) REFERENCES `payment_models` (`id`);

--
-- Constraints for table `sku`
--
ALTER TABLE `sku`
  ADD CONSTRAINT `sku_fk0` FOREIGN KEY (`category_id`) REFERENCES `sku_category` (`id`),
  ADD CONSTRAINT `sku_fk1` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`),
  ADD CONSTRAINT `sku_fk2` FOREIGN KEY (`supplier_id`) REFERENCES `product_suppliers` (`id`);

--
-- Constraints for table `sku_images`
--
ALTER TABLE `sku_images`
  ADD CONSTRAINT `sku_images_fk0` FOREIGN KEY (`sku_id`) REFERENCES `sku` (`id`);

--
-- Constraints for table `supplier_payments`
--
ALTER TABLE `supplier_payments`
  ADD CONSTRAINT `supplier_payments_fk0` FOREIGN KEY (`supplier_id`) REFERENCES `product_suppliers` (`id`),
  ADD CONSTRAINT `supplier_payments_fk1` FOREIGN KEY (`payment_model_id`) REFERENCES `payment_models` (`id`),
  ADD CONSTRAINT `supplier_payments_fk2` FOREIGN KEY (`bank_detail_id`) REFERENCES `bank_details` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
