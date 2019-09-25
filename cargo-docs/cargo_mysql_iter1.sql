CREATE TABLE `Master Vehicle Type` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`Name` varchar(100) NOT NULL
);

CREATE TABLE `Master Client Type` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`Name` varchar(100) NOT NULL
);

CREATE TABLE `Admin Login` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`Name` varchar(100) NOT NULL,
	`Email Id` varchar(100) NOT NULL,
	`Password` varchar(100) NOT NULL,
	`Type` enum('1','2','3') NOT NULL,
	`Status` enum('Active','Inactive','Deleted') NOT NULL,
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

CREATE TABLE `Products` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`Name` varchar NOT NULL,
	`Category Id` int NOT NULL,
	`Brand Id` int NOT NULL,
	`Weight` varchar NOT NULL,
	`Size` varchar NOT NULL,
	`quantity available` bigint NOT NULL,
	`Purchasing Price` varchar NOT NULL,
	`Our Selling Price` bigint NOT NULL,
	`Client Purchase Price` bigint NOT NULL,
	`Client Selling Price` bigint NOT NULL,
	`Description` varchar NOT NULL,
	`Created Date` DATE NOT NULL,
	`status` enum NOT NULL,
	`created by` bigint NOT NULL
);

CREATE TABLE `Product Brands` (
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
	`Price` bigint NOT NULL,
	`created date` DATE NOT NULL,
	`created by` int NOT NULL
);

CREATE TABLE `Bucket Items` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`Bucket Id` bigint NOT NULL,
	`Product Id` bigint NOT NULL,
	`Quantity` bigint NOT NULL,
	`Discount` bigint NOT NULL,
	`created by` bigint NOT NULL
);

CREATE TABLE `Clients` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`Name` varchar NOT NULL,
	`Email` varchar NOT NULL,
	`Password` varchar NOT NULL,
	`Mobile Number` varchar NOT NULL,
	`Vehicle Number` varchar NOT NULL,
	`Vehicle Type Id` int NOT NULL,
	`Client Type Id` int NOT NULL,
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
	`Commission Percentage` varchar NOT NULL,
	`Created by` int NOT NULL,
	`Created date` DATE NOT NULL
);

CREATE TABLE `Master Id Proof Type` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`Name` varchar(100) NOT NULL
);

CREATE TABLE `Client Buckets` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`Client Id` bigint NOT NULL,
	`Bucket Id` bigint NOT NULL
);

CREATE TABLE `Client Bank Details` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`Client Id` bigint NOT NULL,
	`Bank Name` varchar NOT NULL,
	`Acc Name` varchar NOT NULL,
	`Acc Number` varchar NOT NULL,
	`IFSC Code` varchar NOT NULL,
	`Branch` varchar NOT NULL
);

CREATE TABLE `Client Products` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`Client Id` bigint NOT NULL,
	`Bucket id` bigint NOT NULL,
	`Product Id` bigint NOT NULL,
	`Quantity` bigint NOT NULL,
	`Client Purchase Price` varchar NOT NULL,
	`Client Selling Price` varchar NOT NULL,
	`Total Amount` bigint NOT NULL,
	`Created date` DATE NOT NULL
);

CREATE TABLE `Client Payments` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`Client Id` bigint NOT NULL,
	`Paid to admin` bigint NOT NULL
);

ALTER TABLE `Admin Login` ADD CONSTRAINT `Admin Login_fk0` FOREIGN KEY (`Type`) REFERENCES `Master Admin Type`(`id`);

ALTER TABLE `Master ACL Role` ADD CONSTRAINT `Master ACL Role_fk0` FOREIGN KEY (`Master Admin Type Id`) REFERENCES `Master Admin Type`(`id`);

ALTER TABLE `Products` ADD CONSTRAINT `Products_fk0` FOREIGN KEY (`Category Id`) REFERENCES `Product Category`(`id`);

ALTER TABLE `Products` ADD CONSTRAINT `Products_fk1` FOREIGN KEY (`Brand Id`) REFERENCES `Product Brands`(`id`);

ALTER TABLE `Bucket Items` ADD CONSTRAINT `Bucket Items_fk0` FOREIGN KEY (`Bucket Id`) REFERENCES `Buckets`(`id`);

ALTER TABLE `Bucket Items` ADD CONSTRAINT `Bucket Items_fk1` FOREIGN KEY (`Product Id`) REFERENCES `Products`(`id`);

ALTER TABLE `Clients` ADD CONSTRAINT `Clients_fk0` FOREIGN KEY (`Vehicle Type Id`) REFERENCES `Master Vehicle Type`(`id`);

ALTER TABLE `Clients` ADD CONSTRAINT `Clients_fk1` FOREIGN KEY (`Client Type Id`) REFERENCES `Master Client Type`(`id`);

ALTER TABLE `Clients` ADD CONSTRAINT `Clients_fk2` FOREIGN KEY (`Id Proof Type Id`) REFERENCES `Master Id Proof Type`(`id`);

ALTER TABLE `Client Buckets` ADD CONSTRAINT `Client Buckets_fk0` FOREIGN KEY (`Client Id`) REFERENCES `Clients`(`id`);

ALTER TABLE `Client Buckets` ADD CONSTRAINT `Client Buckets_fk1` FOREIGN KEY (`Bucket Id`) REFERENCES `Buckets`(`id`);

ALTER TABLE `Client Bank Details` ADD CONSTRAINT `Client Bank Details_fk0` FOREIGN KEY (`Client Id`) REFERENCES `Clients`(`id`);

ALTER TABLE `Client Products` ADD CONSTRAINT `Client Products_fk0` FOREIGN KEY (`Client Id`) REFERENCES `Clients`(`id`);

ALTER TABLE `Client Products` ADD CONSTRAINT `Client Products_fk1` FOREIGN KEY (`Bucket id`) REFERENCES `Buckets`(`id`);

ALTER TABLE `Client Products` ADD CONSTRAINT `Client Products_fk2` FOREIGN KEY (`Product Id`) REFERENCES `Products`(`id`);

ALTER TABLE `Client Payments` ADD CONSTRAINT `Client Payments_fk0` FOREIGN KEY (`Client Id`) REFERENCES `Clients`(`id`);

