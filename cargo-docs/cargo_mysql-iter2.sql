CREATE TABLE `Vehicle Brand` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`Name` varchar(100) NOT NULL
);

CREATE TABLE `Client Category` (
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

CREATE TABLE `Product Category` (
	`id` bigint NOT NULL AUTO_INCREMENT,
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
	`Weight` varchar NOT NULL,
	`height` varchar NOT NULL,
	`Length` varchar NOT NULL,
	`width` varchar NOT NULL,
	`volume` bigint(in cubic centemeter) NOT NULL,
	`quantity_bought` bigint NOT NULL,
	`quantity_sold` varchar NOT NULL,
	`type` enum(paid,sample) NOT NULL,
	`buying price` int NOT NULL,
	`Selling Price` bigint NOT NULL,
	`Description` varchar NOT NULL,
	`Created Date` DATE NOT NULL,
	`status` enum NOT NULL,
	`created by` bigint NOT NULL
);

CREATE TABLE `Brands` (
	`id` bigint NOT NULL AUTO_INCREMENT,
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
	`Vehicle Number` varchar NOT NULL,
	`Vehicle Brand Id` int NOT NULL,
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

CREATE TABLE `POS User Type` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`Name` varchar NOT NULL
);

CREATE TABLE `POS User Bank Details` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`POS User Id` bigint NOT NULL,
	`Bank Name` varchar NOT NULL,
	`Acc Name` varchar NOT NULL,
	`Acc Number` varchar NOT NULL,
	`IFSC Code` varchar NOT NULL,
	`Branch` varchar NOT NULL
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

CREATE TABLE `POS User Payment settings` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`POS Id` int NOT NULL,
	`POS User Id` int NOT NULL,
	`Sales Commision` varchar NOT NULL,
	`Tips` varchar NOT NULL,
	`Incentives` varchar NOT NULL,
	`Referral Bonus` varchar NOT NULL,
	`Free Sample Bonus` varchar NOT NULL,
	`created date` DATE NOT NULL,
	`updated date` DATE NOT NULL
);

CREATE TABLE `Customers` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`Name` varchar NOT NULL,
	`Email` varchar NOT NULL,
	`Password` varchar NOT NULL,
	`Mobile Number` varchar NOT NULL,
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
	`Total Price` bigint NOT NULL,
	`Payment Method` int NOT NULL,
	`Payment Status` enum NOT NULL,
	`Created Date` DATE NOT NULL
);

CREATE TABLE `Payment Method` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`Name` varchar NOT NULL
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
	`Total Amount` int NOT NULL,
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
	`Bank Name` varchar NOT NULL,
	`Acc name` varchar NOT NULL,
	`Acc Nummber` varchar NOT NULL,
	`IFSC Code` varchar NOT NULL,
	`Branch` varchar NOT NULL,
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

CREATE TABLE `POS User` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`POS id` int NOT NULL,
	`User type` int NOT NULL,
	`Name` varchar NOT NULL,
	`Email` varchar NOT NULL,
	`Password` varchar NOT NULL,
	`Mobile Number` varchar NOT NULL,
	`Photo Path` varchar NOT NULL,
	`Address` varchar NOT NULL,
	`City` varchar NOT NULL,
	`State` varchar NOT NULL,
	`Country` varchar NOT NULL,
	`Pin Code` varchar NOT NULL,
	`Id Proof Type Id` int NOT NULL,
	`Id Proof Number` varchar NOT NULL,
	`Is verified` varchar NOT NULL,
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

CREATE TABLE `POS User cart` (
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

CREATE TABLE `POS User Orders` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`Order Id` varchar(random string) NOT NULL,
	`POS Id` bigint NOT NULL,
	`POS User Id` int NOT NULL,
	`Total Price` bigint NOT NULL,
	`Payment Method` int NOT NULL,
	`Payment Status` enum NOT NULL,
	`Created Date` DATE NOT NULL
);

CREATE TABLE `POS User Orders Detail` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`Order Id` bigint NOT NULL,
	`SKU Id` int NOT NULL,
	`Quantity` bigint NOT NULL,
	`Price` bigint NOT NULL,
	`Created Date` DATE NOT NULL
);

CREATE TABLE `POS User Payments Detail` (
	`id` int NOT NULL AUTO_INCREMENT,
	`POS id` int NOT NULL,
	`POS User id` int NOT NULL,
	`type` enum(commission, tips, referral, free sample, incentive) NOT NULL,
	`amount` varchar NOT NULL,
	`created date` DATE NOT NULL,
	`Date` DATE NOT NULL,
	`payment status` enum(paid, pending, declined) NOT NULL,
	PRIMARY KEY (`id`)
);

ALTER TABLE `Admin Login` ADD CONSTRAINT `Admin Login_fk0` FOREIGN KEY (`Type`) REFERENCES `Master Admin Type`(`id`);

ALTER TABLE `Master ACL Role` ADD CONSTRAINT `Master ACL Role_fk0` FOREIGN KEY (`Master Admin Type Id`) REFERENCES `Master Admin Type`(`id`);

ALTER TABLE `SKU` ADD CONSTRAINT `SKU_fk0` FOREIGN KEY (`Category Id`) REFERENCES `Product Category`(`id`);

ALTER TABLE `SKU` ADD CONSTRAINT `SKU_fk1` FOREIGN KEY (`Brand Id`) REFERENCES `Brands`(`id`);

ALTER TABLE `SKU` ADD CONSTRAINT `SKU_fk2` FOREIGN KEY (`Supplier`) REFERENCES `Product Suppliers`(`id`);

ALTER TABLE `Bucket Items` ADD CONSTRAINT `Bucket Items_fk0` FOREIGN KEY (`Bucket Id`) REFERENCES `Buckets`(`id`);

ALTER TABLE `Bucket Items` ADD CONSTRAINT `Bucket Items_fk1` FOREIGN KEY (`SKU Id`) REFERENCES `SKU`(`id`);

ALTER TABLE `Point of Sale` ADD CONSTRAINT `Point of Sale_fk0` FOREIGN KEY (`category`) REFERENCES `Client Category`(`id`);

ALTER TABLE `Point of Sale` ADD CONSTRAINT `Point of Sale_fk1` FOREIGN KEY (`Vehicle Brand Id`) REFERENCES `Vehicle Brand`(`id`);

ALTER TABLE `POS User Bank Details` ADD CONSTRAINT `POS User Bank Details_fk0` FOREIGN KEY (`POS User Id`) REFERENCES `POS User`(`id`);

ALTER TABLE `POS Products` ADD CONSTRAINT `POS Products_fk0` FOREIGN KEY (`POS Id`) REFERENCES `Point of Sale`(`id`);

ALTER TABLE `POS Products` ADD CONSTRAINT `POS Products_fk1` FOREIGN KEY (`SKU Id`) REFERENCES `SKU`(`id`);

ALTER TABLE `POS User Payment settings` ADD CONSTRAINT `POS User Payment settings_fk0` FOREIGN KEY (`POS Id`) REFERENCES `Point of Sale`(`id`);

ALTER TABLE `POS User Payment settings` ADD CONSTRAINT `POS User Payment settings_fk1` FOREIGN KEY (`POS User Id`) REFERENCES `POS User`(`id`);

ALTER TABLE `Customer Orders Detail` ADD CONSTRAINT `Customer Orders Detail_fk0` FOREIGN KEY (`Order Id`) REFERENCES `Customer Orders`(`Order Id`);

ALTER TABLE `Customer Orders Detail` ADD CONSTRAINT `Customer Orders Detail_fk1` FOREIGN KEY (`POS Product Id`) REFERENCES `POS Products`(`id`);

ALTER TABLE `Customer Orders Detail` ADD CONSTRAINT `Customer Orders Detail_fk2` FOREIGN KEY (`SKU Id`) REFERENCES `SKU`(`id`);

ALTER TABLE `Customer Orders` ADD CONSTRAINT `Customer Orders_fk0` FOREIGN KEY (`Customer Id`) REFERENCES `Customers`(`id`);

ALTER TABLE `Customer Orders` ADD CONSTRAINT `Customer Orders_fk1` FOREIGN KEY (`POS Id`) REFERENCES `Point of Sale`(`id`);

ALTER TABLE `Customer Orders` ADD CONSTRAINT `Customer Orders_fk2` FOREIGN KEY (`POS User Id`) REFERENCES `POS User`(`id`);

ALTER TABLE `Customer Orders` ADD CONSTRAINT `Customer Orders_fk3` FOREIGN KEY (`Payment Method`) REFERENCES `Payment Method`(`id`);

ALTER TABLE `Customer Cart` ADD CONSTRAINT `Customer Cart_fk0` FOREIGN KEY (`Customer Id`) REFERENCES `Customers`(`id`);

ALTER TABLE `Customer Cart` ADD CONSTRAINT `Customer Cart_fk1` FOREIGN KEY (`POS Id`) REFERENCES `Point of Sale`(`id`);

ALTER TABLE `Customer Cart` ADD CONSTRAINT `Customer Cart_fk2` FOREIGN KEY (`POS User Id`) REFERENCES `POS User`(`id`);

ALTER TABLE `Customer Cart` ADD CONSTRAINT `Customer Cart_fk3` FOREIGN KEY (`POS Product Id`) REFERENCES `POS Products`(`id`);

ALTER TABLE `Customer Cart` ADD CONSTRAINT `Customer Cart_fk4` FOREIGN KEY (`SKU Id`) REFERENCES `SKU`(`id`);

ALTER TABLE `sku_images` ADD CONSTRAINT `sku_images_fk0` FOREIGN KEY (`sku_id`) REFERENCES `SKU`(`id`);

ALTER TABLE `POS User` ADD CONSTRAINT `POS User_fk0` FOREIGN KEY (`POS id`) REFERENCES `Point of Sale`(`id`);

ALTER TABLE `POS User` ADD CONSTRAINT `POS User_fk1` FOREIGN KEY (`User type`) REFERENCES `POS User Type`(`id`);

ALTER TABLE `POS User` ADD CONSTRAINT `POS User_fk2` FOREIGN KEY (`Id Proof Type Id`) REFERENCES `Id Proof Type`(`id`);

ALTER TABLE `POS ACL Role` ADD CONSTRAINT `POS ACL Role_fk0` FOREIGN KEY (`POS User Type Id`) REFERENCES `POS User Type`(`id`);

ALTER TABLE `POS User cart` ADD CONSTRAINT `POS User cart_fk0` FOREIGN KEY (`POS User Id`) REFERENCES `POS User`(`id`);

ALTER TABLE `POS User cart` ADD CONSTRAINT `POS User cart_fk1` FOREIGN KEY (`POS Id`) REFERENCES `Point of Sale`(`id`);

ALTER TABLE `POS User cart` ADD CONSTRAINT `POS User cart_fk2` FOREIGN KEY (`SKU Id`) REFERENCES `SKU`(`id`);

ALTER TABLE `Customer Sessions` ADD CONSTRAINT `Customer Sessions_fk0` FOREIGN KEY (`customer id`) REFERENCES `Customers`(`id`);

ALTER TABLE `POS User Orders` ADD CONSTRAINT `POS User Orders_fk0` FOREIGN KEY (`POS Id`) REFERENCES `Point of Sale`(`id`);

ALTER TABLE `POS User Orders` ADD CONSTRAINT `POS User Orders_fk1` FOREIGN KEY (`POS User Id`) REFERENCES `POS User`(`id`);

ALTER TABLE `POS User Orders` ADD CONSTRAINT `POS User Orders_fk2` FOREIGN KEY (`Payment Method`) REFERENCES `Payment Method`(`id`);

ALTER TABLE `POS User Orders Detail` ADD CONSTRAINT `POS User Orders Detail_fk0` FOREIGN KEY (`Order Id`) REFERENCES `POS User Orders`(`Order Id`);

ALTER TABLE `POS User Orders Detail` ADD CONSTRAINT `POS User Orders Detail_fk1` FOREIGN KEY (`SKU Id`) REFERENCES `SKU`(`id`);

ALTER TABLE `POS User Payments Detail` ADD CONSTRAINT `POS User Payments Detail_fk0` FOREIGN KEY (`POS id`) REFERENCES `Point of Sale`(`id`);

ALTER TABLE `POS User Payments Detail` ADD CONSTRAINT `POS User Payments Detail_fk1` FOREIGN KEY (`POS User id`) REFERENCES `POS User`(`id`);

