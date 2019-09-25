CREATE TABLE `POS Brands` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`Name` varchar(100) NOT NULL
);

CREATE TABLE `POS Category` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`parent id` int NOT NULL DEFAULT '0',
	`Name` varchar(100) NOT NULL
);

CREATE TABLE `Admin Login` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`Name` varchar(100) NOT NULL,
	`Email Id` varchar(100) NOT NULL,
	`Password` varchar(100) NOT NULL,
	`Type` enum('1','2','3') NOT NULL,
	`Status` enum('Active','Inactive') NOT NULL,
	`Creation Date` DATE NOT NULL
);

CREATE TABLE `Master Admin Type` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`Name` varchar(100) NOT NULL
);

CREATE TABLE `Master ACL Role` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`Master Admin Type Id` int(11) NOT NULL,
	`Controller Name` varchar(100) NOT NULL,
	`Function Name` varchar(100) NOT NULL,
	`Add` varchar(100) NOT NULL,
	`Edit` varchar(100) NOT NULL,
	`Delete` varchar(100) NOT NULL,
	`View` varchar(100) NOT NULL
);

CREATE TABLE `SKU Category` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`parent id` bigint NOT NULL,
	`Name` varchar NOT NULL,
	`Description` varchar NOT NULL,
	`Created Date` DATE NOT NULL,
	`created by` bigint NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `SKU` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`Name` varchar NOT NULL,
	`Category Id` int NOT NULL,
	`Brand Id` int NOT NULL,
	`Supplier` int NOT NULL,
	`Weight` varchar(in gm) NOT NULL,
	`height` varchar(in mm) NOT NULL,
	`Length` varchar(in mm) NOT NULL,
	`width` varchar(in mm) NOT NULL,
	`volume` bigint(in cubic millimeter) NOT NULL,
	`quantity_bought` bigint NOT NULL,
	`quantity_sold` varchar NOT NULL,
	`type` enum(paid,sample) NOT NULL,
	`commision` varchar(if type is paid) NOT NULL,
	`incentive` varchar(if type is sample) NOT NULL,
	`buying price` int NOT NULL,
	`Selling Price` bigint NOT NULL,
	`Description` varchar NOT NULL,
	`Created Date` DATE NOT NULL,
	`status` enum NOT NULL,
	`created by` bigint NOT NULL
);

CREATE TABLE `Brands` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`parent id` bigint NOT NULL,
	`Name` varchar NOT NULL,
	`Description` varchar NOT NULL,
	`Created Date` DATE NOT NULL,
	`created by` bigint NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Buckets` (
	`id` int NOT NULL AUTO_INCREMENT,
	`name` varchar NOT NULL,
	`Description` varchar NOT NULL,
	`Max Quantity` int NOT NULL,
	`created date` DATE NOT NULL,
	`created by` int NOT NULL
);

CREATE TABLE `Bucket Items` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`Bucket Id` bigint NOT NULL,
	`SKU Id` bigint NOT NULL,
	`Quantity` bigint NOT NULL,
	`created by` bigint NOT NULL
);

CREATE TABLE `Point of Sale` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`Client Identification Number` bigint NOT NULL,
	`category` int NOT NULL,
	`Name` varchar NOT NULL,
	`Email` varchar NOT NULL,
	`Mobile Number` varchar NOT NULL,
	`Registartion Number` varchar NOT NULL,
	`Address` varchar NOT NULL,
	`City` varchar NOT NULL,
	`State` varchar NOT NULL,
	`Country` varchar NOT NULL,
	`Pin Code` varchar NOT NULL,
	`Is verified` varchar NOT NULL,
	`Status` enum(active,inactive) NOT NULL,
	`Created by` int NOT NULL,
	`Created date` DATE NOT NULL
);

CREATE TABLE `Id Proof Type` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`Name` varchar(100) NOT NULL
);

CREATE TABLE `POS Agent Type` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`Name` varchar NOT NULL
);

CREATE TABLE `Bank Details` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`user type` enum('Supplier','POS Agent','Customer') NOT NULL,
	`User Id` bigint NOT NULL,
	`Payment method type id` int NOT NULL,
	`Acc Name` varchar NOT NULL,
	`Acc Number` varchar NOT NULL,
	`IFSC Code` varchar NOT NULL,
	`Branch` varchar NOT NULL,
	`default mode` enum('yes','no') NOT NULL,
	`status` enum('active','inactive') NOT NULL,
	`created date` DATE NOT NULL
);

CREATE TABLE `POS Products` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`POS Id` bigint NOT NULL,
	`SKU Id` bigint NOT NULL,
	`Total Bought` bigint NOT NULL,
	`Total Sold` varchar NOT NULL,
	`Return Quantity` bigint NOT NULL,
	`Created date` DATE NOT NULL,
	`updated date` DATE NOT NULL
);

CREATE TABLE `Customers` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`Name` varchar NOT NULL,
	`Email` varchar NOT NULL,
	`email verified` enum('yes','no') NOT NULL,
	`Mobile Number` varchar NOT NULL,
	`mobile verified` enum('yes','no') NOT NULL,
	`Photo Path` varchar NOT NULL,
	`Address` varchar NOT NULL,
	`City` varchar NOT NULL,
	`State` varchar NOT NULL,
	`Country` varchar NOT NULL,
	`Pin Code` varchar NOT NULL,
	`Is verified` varchar NOT NULL,
	`Status` enum(active,inactive) NOT NULL,
	`Ratings` varchar NOT NULL,
	`Created date` DATE NOT NULL
);

CREATE TABLE `Customer Orders Detail` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`Order Id` bigint NOT NULL,
	`POS Product Id` bigint NOT NULL,
	`SKU Id` int NOT NULL,
	`Quantity` bigint NOT NULL,
	`Price` bigint NOT NULL,
	`Created Date` DATE NOT NULL
);

CREATE TABLE `Customer Orders` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`Order Id` varchar(random string) NOT NULL,
	`Customer Id` bigint NOT NULL,
	`POS Id` bigint NOT NULL,
	`POS User Id` int NOT NULL,
	`Amount` bigint NOT NULL,
	`Tip` bigint NOT NULL,
	`Total Amount` bigint NOT NULL,
	`Payment Method` int NOT NULL,
	`Payment Status` enum NOT NULL,
	`Created Date` DATE NOT NULL
);

CREATE TABLE `Customer Cart` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`Customer Id` bigint NOT NULL,
	`Session Id` varchar NOT NULL,
	`POS Id` bigint NOT NULL,
	`POS User Id` int NOT NULL,
	`POS Product Id` int NOT NULL,
	`SKU Id` int NOT NULL,
	`SKU Quantity` int NOT NULL,
	`SKU Price` int NOT NULL,
	`Amount` int NOT NULL,
	`Tip` bigint NOT NULL,
	`Total Amount` bigint NOT NULL,
	`Created Date` DATE NOT NULL
);

CREATE TABLE `Product Suppliers` (
	`id` int NOT NULL AUTO_INCREMENT,
	`name` varchar NOT NULL,
	`phone number` varchar NOT NULL,
	`email id` varchar NOT NULL,
	`address` varchar NOT NULL,
	`city` varchar NOT NULL,
	`state` varchar NOT NULL,
	`country` varchar NOT NULL,
	`Credit period` varchar NOT NULL,
	`created date` DATE NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `sku_images` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`sku_id` int NOT NULL,
	`path` varchar NOT NULL,
	`status` enum NOT NULL,
	`created date` DATE NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `POS Agent` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`POS id` int NOT NULL,
	`User type` int NOT NULL,
	`Name` varchar NOT NULL,
	`Email` varchar NOT NULL,
	`email verified` enum('yes','no') NOT NULL,
	`Mobile Number` varchar NOT NULL,
	`Mobile verified` enum('yes','no') NOT NULL,
	`Photo Path` varchar NOT NULL,
	`Address` varchar NOT NULL,
	`City` varchar NOT NULL,
	`State` varchar NOT NULL,
	`Country` varchar NOT NULL,
	`Pin Code` varchar NOT NULL,
	`Id Proof Type Id` int NOT NULL,
	`Id Proof Number` varchar NOT NULL,
	`Is verified` varchar NOT NULL,
	`referral id` varchar NOT NULL,
	`Status` enum(active,inactive) NOT NULL,
	`Ratings` varchar NOT NULL,
	`Created by` int NOT NULL,
	`Created date` DATE NOT NULL
);

CREATE TABLE `POS ACL Role` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`POS User Type Id` int(11) NOT NULL,
	`Controller Name` varchar(100) NOT NULL,
	`Function Name` varchar(100) NOT NULL,
	`Add` varchar(100) NOT NULL,
	`Edit` varchar(100) NOT NULL,
	`Delete` varchar(100) NOT NULL,
	`View` varchar(100) NOT NULL
);

CREATE TABLE `POS Agent cart` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`POS User Id` int NOT NULL,
	`POS Id` bigint NOT NULL,
	`SKU Id` int NOT NULL,
	`SKU Quantity` int NOT NULL,
	`SKU Price` int NOT NULL,
	`Total Amount` int NOT NULL,
	`Created Date` DATE NOT NULL
);

CREATE TABLE `Customer Sessions` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`customer id` int NOT NULL,
	`session id` varchar NOT NULL,
	`count` int NOT NULL,
	`created date` DATE NOT NULL,
	`updated date` DATE NOT NULL
);

CREATE TABLE `POS Agent Orders` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`Order Id` varchar(random string) NOT NULL,
	`POS Id` bigint NOT NULL,
	`POS User Id` int NOT NULL,
	`Total Price` bigint NOT NULL,
	`Payment Method` int NOT NULL,
	`Payment Status` enum NOT NULL,
	`Created Date` DATE NOT NULL
);

CREATE TABLE `POS Agent Orders Detail` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`Order Id` bigint NOT NULL,
	`SKU Id` int NOT NULL,
	`Quantity` bigint NOT NULL,
	`Price` bigint NOT NULL,
	`Created Date` DATE NOT NULL
);

CREATE TABLE `Payment Models` (
	`id` int NOT NULL AUTO_INCREMENT,
	`name` varchar(commission, tips, referral, free sample, incentive, rewards, supplier payments) NOT NULL,
	`created date` DATE NOT NULL,
	`status` enum('active','inactive') NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `POS Brand Mapping` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`POS Id` int NOT NULL,
	`POS Brand Id` bigint NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `login_auth` (
	`id` int NOT NULL AUTO_INCREMENT,
	`user type` enum('POS Agent','Customer') NOT NULL,
	`user id` int(pos agent id OR customer id) NOT NULL,
	`username` varchar(user's email) NOT NULL,
	`password` varchar NOT NULL,
	`alternate password` varchar NOT NULL,
	`status` enum('active','inactive') NOT NULL,
	`created date` DATE NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Payment Method Type` (
	`id` int NOT NULL AUTO_INCREMENT,
	`name` varchar NOT NULL,
	`payment mode` enum('bank','wallet','cc','db','others') NOT NULL,
	`mode to pay` enum('0','1' (payment mode we use to pay)) NOT NULL,
	`status` enum('active','inactive') NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Referrals` (
	`id` int NOT NULL AUTO_INCREMENT,
	`referred by user type` enum('pos agent','customer','supplier') NOT NULL,
	`referral model id` int NOT NULL,
	`referred by` int(user id (POS agent id, cus id, supplier id)) NOT NULL,
	`referred to` int('pos agent','customer','supplier') NOT NULL,
	`referred to user id` int('pos agent','customer','supplier') NOT NULL,
	`status` enum('paid','pending') NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Referral Models` (
	`id` int NOT NULL AUTO_INCREMENT,
	`payment model id` int NOT NULL,
	`name` varchar NOT NULL,
	`amount` varchar NOT NULL,
	`status` enum('active','inactive') NOT NULL,
	`created date` DATE NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Supplier Payments` (
	`id` int NOT NULL AUTO_INCREMENT,
	`Supplier id` int NOT NULL,
	`payment model id` int NOT NULL,
	`Invoice number` varchar NOT NULL,
	`Invoice date` varchar NOT NULL,
	`GST number` varchar NOT NULL,
	`Total Amount` varchar NOT NULL,
	`paid amount` varchar NOT NULL,
	`pending amount` varchar NOT NULL,
	`max due date` DATE NOT NULL,
	`Status` enum('paid','pending') NOT NULL,
	`created date` DATE NOT NULL,
	`bank detail id` int NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Reward Models` (
	`id` int NOT NULL AUTO_INCREMENT,
	`payment model id` int NOT NULL,
	`name` varchar NOT NULL,
	`amount` varchar NOT NULL,
	`status` enum('active','inactive') NOT NULL,
	`created date` DATE NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Rewards` (
	`id` int NOT NULL AUTO_INCREMENT,
	`reward model id` int NOT NULL,
	`user id` int NOT NULL,
	`user type` enum('pos agent','customer','supplier') NOT NULL,
	`status` enum('paid','pending') NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Incentive Models` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`payment model id` int NOT NULL,
	`sku category id` int NOT NULL,
	`sku id` int NOT NULL,
	`target quantity` varchar NOT NULL,
	`duration` varchar NOT NULL,
	`amount` varchar NOT NULL,
	`status` enum('active','inactive') NOT NULL,
	`created date` DATE NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Incentives` (
	`id` int NOT NULL AUTO_INCREMENT,
	`incentive model id` int NOT NULL,
	`user id` int NOT NULL,
	`user type` enum('pos agent','customer','supplier') NOT NULL,
	`status` enum('paid','pending') NOT NULL,
	PRIMARY KEY (`id`)
);

ALTER TABLE `Admin Login` ADD CONSTRAINT `Admin Login_fk0` FOREIGN KEY (`Type`) REFERENCES `Master Admin Type`(`id`);

ALTER TABLE `Master ACL Role` ADD CONSTRAINT `Master ACL Role_fk0` FOREIGN KEY (`Master Admin Type Id`) REFERENCES `Master Admin Type`(`id`);

ALTER TABLE `SKU` ADD CONSTRAINT `SKU_fk0` FOREIGN KEY (`Category Id`) REFERENCES `SKU Category`(`id`);

ALTER TABLE `SKU` ADD CONSTRAINT `SKU_fk1` FOREIGN KEY (`Brand Id`) REFERENCES `Brands`(`id`);

ALTER TABLE `SKU` ADD CONSTRAINT `SKU_fk2` FOREIGN KEY (`Supplier`) REFERENCES `Product Suppliers`(`id`);

ALTER TABLE `Bucket Items` ADD CONSTRAINT `Bucket Items_fk0` FOREIGN KEY (`Bucket Id`) REFERENCES `Buckets`(`id`);

ALTER TABLE `Bucket Items` ADD CONSTRAINT `Bucket Items_fk1` FOREIGN KEY (`SKU Id`) REFERENCES `SKU`(`id`);

ALTER TABLE `Point of Sale` ADD CONSTRAINT `Point of Sale_fk0` FOREIGN KEY (`category`) REFERENCES `POS Category`(`id`);

ALTER TABLE `Bank Details` ADD CONSTRAINT `Bank Details_fk0` FOREIGN KEY (`Payment method type id`) REFERENCES `Payment Method Type`(`id`);

ALTER TABLE `POS Products` ADD CONSTRAINT `POS Products_fk0` FOREIGN KEY (`POS Id`) REFERENCES `Point of Sale`(`id`);

ALTER TABLE `POS Products` ADD CONSTRAINT `POS Products_fk1` FOREIGN KEY (`SKU Id`) REFERENCES `SKU`(`id`);

ALTER TABLE `Customer Orders Detail` ADD CONSTRAINT `Customer Orders Detail_fk0` FOREIGN KEY (`Order Id`) REFERENCES `Customer Orders`(`Order Id`);

ALTER TABLE `Customer Orders Detail` ADD CONSTRAINT `Customer Orders Detail_fk1` FOREIGN KEY (`POS Product Id`) REFERENCES `POS Products`(`id`);

ALTER TABLE `Customer Orders Detail` ADD CONSTRAINT `Customer Orders Detail_fk2` FOREIGN KEY (`SKU Id`) REFERENCES `SKU`(`id`);

ALTER TABLE `Customer Orders` ADD CONSTRAINT `Customer Orders_fk0` FOREIGN KEY (`Customer Id`) REFERENCES `Customers`(`id`);

ALTER TABLE `Customer Orders` ADD CONSTRAINT `Customer Orders_fk1` FOREIGN KEY (`POS Id`) REFERENCES `Point of Sale`(`id`);

ALTER TABLE `Customer Orders` ADD CONSTRAINT `Customer Orders_fk2` FOREIGN KEY (`POS User Id`) REFERENCES `POS Agent`(`id`);

ALTER TABLE `Customer Orders` ADD CONSTRAINT `Customer Orders_fk3` FOREIGN KEY (`Payment Method`) REFERENCES `Payment Method Type`(`id`);

ALTER TABLE `Customer Cart` ADD CONSTRAINT `Customer Cart_fk0` FOREIGN KEY (`Customer Id`) REFERENCES `Customers`(`id`);

ALTER TABLE `Customer Cart` ADD CONSTRAINT `Customer Cart_fk1` FOREIGN KEY (`POS Id`) REFERENCES `Point of Sale`(`id`);

ALTER TABLE `Customer Cart` ADD CONSTRAINT `Customer Cart_fk2` FOREIGN KEY (`POS User Id`) REFERENCES `POS Agent`(`id`);

ALTER TABLE `Customer Cart` ADD CONSTRAINT `Customer Cart_fk3` FOREIGN KEY (`POS Product Id`) REFERENCES `POS Products`(`id`);

ALTER TABLE `Customer Cart` ADD CONSTRAINT `Customer Cart_fk4` FOREIGN KEY (`SKU Id`) REFERENCES `SKU`(`id`);

ALTER TABLE `sku_images` ADD CONSTRAINT `sku_images_fk0` FOREIGN KEY (`sku_id`) REFERENCES `SKU`(`id`);

ALTER TABLE `POS Agent` ADD CONSTRAINT `POS Agent_fk0` FOREIGN KEY (`POS id`) REFERENCES `Point of Sale`(`id`);

ALTER TABLE `POS Agent` ADD CONSTRAINT `POS Agent_fk1` FOREIGN KEY (`User type`) REFERENCES `POS Agent Type`(`id`);

ALTER TABLE `POS Agent` ADD CONSTRAINT `POS Agent_fk2` FOREIGN KEY (`Id Proof Type Id`) REFERENCES `Id Proof Type`(`id`);

ALTER TABLE `POS ACL Role` ADD CONSTRAINT `POS ACL Role_fk0` FOREIGN KEY (`POS User Type Id`) REFERENCES `POS Agent Type`(`id`);

ALTER TABLE `POS Agent cart` ADD CONSTRAINT `POS Agent cart_fk0` FOREIGN KEY (`POS User Id`) REFERENCES `POS Agent`(`id`);

ALTER TABLE `POS Agent cart` ADD CONSTRAINT `POS Agent cart_fk1` FOREIGN KEY (`POS Id`) REFERENCES `Point of Sale`(`id`);

ALTER TABLE `POS Agent cart` ADD CONSTRAINT `POS Agent cart_fk2` FOREIGN KEY (`SKU Id`) REFERENCES `SKU`(`id`);

ALTER TABLE `Customer Sessions` ADD CONSTRAINT `Customer Sessions_fk0` FOREIGN KEY (`customer id`) REFERENCES `Customers`(`id`);

ALTER TABLE `POS Agent Orders` ADD CONSTRAINT `POS Agent Orders_fk0` FOREIGN KEY (`POS Id`) REFERENCES `Point of Sale`(`id`);

ALTER TABLE `POS Agent Orders` ADD CONSTRAINT `POS Agent Orders_fk1` FOREIGN KEY (`POS User Id`) REFERENCES `POS Agent`(`id`);

ALTER TABLE `POS Agent Orders` ADD CONSTRAINT `POS Agent Orders_fk2` FOREIGN KEY (`Payment Method`) REFERENCES `Payment Method Type`(`id`);

ALTER TABLE `POS Agent Orders Detail` ADD CONSTRAINT `POS Agent Orders Detail_fk0` FOREIGN KEY (`Order Id`) REFERENCES `POS Agent Orders`(`Order Id`);

ALTER TABLE `POS Agent Orders Detail` ADD CONSTRAINT `POS Agent Orders Detail_fk1` FOREIGN KEY (`SKU Id`) REFERENCES `SKU`(`id`);

ALTER TABLE `POS Brand Mapping` ADD CONSTRAINT `POS Brand Mapping_fk0` FOREIGN KEY (`POS Id`) REFERENCES `Point of Sale`(`id`);

ALTER TABLE `POS Brand Mapping` ADD CONSTRAINT `POS Brand Mapping_fk1` FOREIGN KEY (`POS Brand Id`) REFERENCES `POS Brands`(`id`);

ALTER TABLE `Referrals` ADD CONSTRAINT `Referrals_fk0` FOREIGN KEY (`referral model id`) REFERENCES `Referral Models`(`id`);

ALTER TABLE `Referral Models` ADD CONSTRAINT `Referral Models_fk0` FOREIGN KEY (`payment model id`) REFERENCES `Payment Models`(`id`);

ALTER TABLE `Supplier Payments` ADD CONSTRAINT `Supplier Payments_fk0` FOREIGN KEY (`Supplier id`) REFERENCES `Product Suppliers`(`id`);

ALTER TABLE `Supplier Payments` ADD CONSTRAINT `Supplier Payments_fk1` FOREIGN KEY (`payment model id`) REFERENCES `Payment Models`(`id`);

ALTER TABLE `Supplier Payments` ADD CONSTRAINT `Supplier Payments_fk2` FOREIGN KEY (`bank detail id`) REFERENCES `Bank Details`(`id`);

ALTER TABLE `Reward Models` ADD CONSTRAINT `Reward Models_fk0` FOREIGN KEY (`payment model id`) REFERENCES `Payment Models`(`id`);

ALTER TABLE `Rewards` ADD CONSTRAINT `Rewards_fk0` FOREIGN KEY (`reward model id`) REFERENCES `Reward Models`(`id`);

ALTER TABLE `Incentive Models` ADD CONSTRAINT `Incentive Models_fk0` FOREIGN KEY (`payment model id`) REFERENCES `Payment Models`(`id`);

ALTER TABLE `Incentive Models` ADD CONSTRAINT `Incentive Models_fk1` FOREIGN KEY (`sku category id`) REFERENCES `SKU Category`(`id`);

ALTER TABLE `Incentive Models` ADD CONSTRAINT `Incentive Models_fk2` FOREIGN KEY (`sku id`) REFERENCES `SKU`(`id`);

ALTER TABLE `Incentives` ADD CONSTRAINT `Incentives_fk0` FOREIGN KEY (`incentive model id`) REFERENCES `Incentive Models`(`id`);

