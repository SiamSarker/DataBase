-- Create DATABASE

DROP DATABASE IF EXISTS localemarket;
CREATE DATABASE IF NOT EXISTS localemarket;
USE localemarket;


-- Table

CREATE TABLE IF NOT EXISTS Area (District varchar(25) NOT NULL, City varchar(25) NOT NULL, PRIMARY KEY (District, City));
CREATE TABLE IF NOT EXISTS farmer (f_username varchar(25) NOT NULL, password char(6) NOT NULL, Name varchar(25) NOT NULL, Address varchar(50) NOT NULL, Contact_no int(11) NOT NULL, farmer_acc_no int(10) NOT NULL, District varchar(25) NOT NULL, City varchar(25) NOT NULL, PRIMARY KEY (f_username));
CREATE TABLE IF NOT EXISTS Buyer (b_username varchar(25) NOT NULL, password char(6) NOT NULL, Name varchar(25) NOT NULL, Address varchar(50) NOT NULL, Contact_no int(11) NOT NULL, buyer_acc_no int(10) NOT NULL, District varchar(25) NOT NULL, City varchar(25) NOT NULL, PRIMARY KEY (b_username));
CREATE TABLE IF NOT EXISTS Product (p_id int(10) NOT NULL AUTO_INCREMENT, productName varchar(25) NOT NULL, productImage varchar(255) NOT NULL, Quantity int(10) NOT NULL, Unit varchar(10) NOT NULL, Price_perUnit int(10) NOT NULL, Added_date datetime NOT NULL, farmerf_username varchar(25) NOT NULL, PRIMARY KEY (p_id)); --Updated
CREATE TABLE IF NOT EXISTS Bid_rank (id int(10) NOT NULL AUTO_INCREMENT, rank_id int(10) NOT NULL, b_bidWeight int(10) NOT NULL, b_bidPrice_perUnit int(10) NOT NULL, farmer_profit int(10) NOT NULL, afterBidstart datetime NULL, afterBidstop datetime NULL, Bid_roombid_id int(10) NOT NULL, PRIMARY KEY (id));
CREATE TABLE IF NOT EXISTS Bid_room (auction_id int(10) NOT NULL AUTO_INCREMENT, totalQuantity int(10) NOT NULL, lowest_bidQuantity int(10) NOT NULL, lowestPrice_perUnit int(10) NOT NULL, bid_start datetime NOT NULL, bid_end datetime NOT NULL, Productp_id int(10) NOT NULL, PRIMARY KEY (auction_id)); --Updated
CREATE TABLE IF NOT EXISTS payment (payment_id int(10) NOT NULL AUTO_INCREMENT, trans_id int(10) NOT NULL, amount int(10) NOT NULL, delivery_status varchar(25) NOT NULL, Buyerb_username varchar(25) NOT NULL, farmerf_username varchar(25) NOT NULL, PRIMARY KEY (payment_id));
CREATE TABLE IF NOT EXISTS notification (notify_id int(10) NOT NULL AUTO_INCREMENT, text varchar(255) NOT NULL, notify_datetime datetime NOT NULL, farmerf_username varchar(25) NOT NULL, Buyerb_username varchar(25) NOT NULL, PRIMARY KEY (notify_id));

CREATE TABLE IF NOT EXISTS Buyer_Product (Buyerb_username varchar(25) NOT NULL, Productp_id int(10) NOT NULL, productName varchar(25) NOT NULL, totalWeight int(10) NOT NULL, totalPrice int(10) NOT NULL, PRIMARY KEY (Buyerb_username, Productp_id));
CREATE TABLE IF NOT EXISTS Buyer_Bid_room (Buyerb_username varchar(25) NOT NULL, Bid_roombid_id int(10) NOT NULL, Bid_rankid int(10) NOT NULL, PRIMARY KEY (Buyerb_username, Bid_roombid_id));
CREATE TABLE IF NOT EXISTS Buyer_Bid_rank (Buyerb_username varchar(25) NOT NULL, Bid_rankid int(10) NOT NULL, productName varchar(25) NOT NULL, totalWeight int(10) NOT NULL, totalPrice int(10) NOT NULL, PRIMARY KEY (Buyerb_username, Bid_rankid));
ALTER TABLE farmer ADD INDEX FKfarmer247222 (District, City), ADD CONSTRAINT FKfarmer247222 FOREIGN KEY (District, City) REFERENCES Area (District, City) ON DELETE CASCADE;
ALTER TABLE Buyer ADD INDEX FKBuyer19772 (District, City), ADD CONSTRAINT FKBuyer19772 FOREIGN KEY (District, City) REFERENCES Area (District, City) ON DELETE CASCADE;
ALTER TABLE Product ADD INDEX FKProduct80401 (farmerf_username), ADD CONSTRAINT FKProduct80401 FOREIGN KEY (farmerf_username) REFERENCES farmer (f_username) ON DELETE CASCADE;
ALTER TABLE Bid_rank ADD INDEX FKBid_rank901001 (Bid_roombid_id), ADD CONSTRAINT FKBid_rank901001 FOREIGN KEY (Bid_roombid_id) REFERENCES Bid_room (auction_id) ON DELETE CASCADE;
ALTER TABLE payment ADD INDEX FKpayment301829 (Buyerb_username), ADD CONSTRAINT FKpayment301829 FOREIGN KEY (Buyerb_username) REFERENCES Buyer (b_username) ON DELETE CASCADE;
ALTER TABLE payment ADD INDEX FKpayment943095 (farmerf_username), ADD CONSTRAINT FKpayment943095 FOREIGN KEY (farmerf_username) REFERENCES farmer (f_username) ON DELETE CASCADE;
ALTER TABLE notification ADD INDEX FKnotificati27373 (farmerf_username), ADD CONSTRAINT FKnotificati27373 FOREIGN KEY (farmerf_username) REFERENCES farmer (f_username) ON DELETE CASCADE;
ALTER TABLE notification ADD INDEX FKnotificati754038 (Buyerb_username), ADD CONSTRAINT FKnotificati754038 FOREIGN KEY (Buyerb_username) REFERENCES Buyer (b_username) ON DELETE CASCADE;
ALTER TABLE Bid_room ADD INDEX FKBid_room169742 (Productp_id), ADD CONSTRAINT FKBid_room169742 FOREIGN KEY (Productp_id) REFERENCES Product (p_id) ON DELETE CASCADE;
ALTER TABLE Buyer_Product ADD INDEX FKBuyer_Prod310173 (Buyerb_username), ADD CONSTRAINT FKBuyer_Prod310173 FOREIGN KEY (Buyerb_username) REFERENCES Buyer (b_username) ON DELETE CASCADE;
ALTER TABLE Buyer_Product ADD INDEX FKBuyer_Prod253 (Productp_id), ADD CONSTRAINT FKBuyer_Prod253 FOREIGN KEY (Productp_id) REFERENCES Product (p_id) ON DELETE CASCADE;
ALTER TABLE Buyer_Bid_room ADD INDEX FKBuyer_Bid_58712 (Buyerb_username), ADD CONSTRAINT FKBuyer_Bid_58712 FOREIGN KEY (Buyerb_username) REFERENCES Buyer (b_username) ON DELETE CASCADE;
ALTER TABLE Buyer_Bid_room ADD INDEX FKBuyer_Bid_31019 (Bid_roombid_id), ADD CONSTRAINT FKBuyer_Bid_31019 FOREIGN KEY (Bid_roombid_id) REFERENCES Bid_room (auction_id) ON DELETE CASCADE;
ALTER TABLE Buyer_Bid_room ADD INDEX FKBuyer_Bid_389441 (Bid_rankid), ADD CONSTRAINT FKBuyer_Bid_389441 FOREIGN KEY (Bid_rankid) REFERENCES Bid_rank (id) ON DELETE CASCADE;
ALTER TABLE Buyer_Bid_rank ADD INDEX FKBuyer_Bid_45225 (Buyerb_username), ADD CONSTRAINT FKBuyer_Bid_45225 FOREIGN KEY (Buyerb_username) REFERENCES Buyer (b_username) ON DELETE CASCADE;
ALTER TABLE Buyer_Bid_rank ADD INDEX FKBuyer_Bid_402928 (Bid_rankid), ADD CONSTRAINT FKBuyer_Bid_402928 FOREIGN KEY (Bid_rankid) REFERENCES Bid_rank (id);

CREATE TABLE IF NOT EXISTS All_Bid (bid_id int(10) NOT NULL AUTO_INCREMENT, auction_id int(10) NOT NULL, b_username varchar(25) NOT NULL, b_bidQuantity int(10) NOT NULL, b_bidPrice_perUnit int(10) NOT NULL, farmer_profit int(10) NOT NULL, CONSTRAINT PKBid_1 PRIMARY KEY (bid_id), CONSTRAINT FKBid_1 FOREIGN KEY (auction_id) REFERENCES Bid_room (auction_id) ON DELETE CASCADE, CONSTRAINT FKBid_2 FOREIGN KEY (b_username) REFERENCES buyer (b_username) ON DELETE CASCADE); --New


-- Insert Data

INSERT INTO Area VALUES('DHAKA', 'DHAKA NORTH'),('DHAKA', 'DHAKA SOUTH');
INSERT INTO farmer VALUES('akash1', '123456', 'Akash Rahman', '4/1, Tajmahal Road', 01711221112, 0000000001, 'DHAKA', 'DHAKA NORTH'),('kabir1', '123456', 'Kabir Hossain', '52, Ring Road', 01712211123, 0000000002, 'DHAKA', 'DHAKA SOUTH');
INSERT INTO buyer VALUES('buyer1', '123456', 'Akash Rahman', '4/1, Tajmahal Road', 01711221112, 0000000001, 'DHAKA', 'DHAKA NORTH'),('buyer2', '123456', 'Kabir Hossain', '52, Ring Road', 01712211123, 0000000002, 'DHAKA', 'DHAKA SOUTH');



-- Update Data

UPDATE Product SET Price_perUnit = 12 WHERE p_id = 1;


-- Delete Data

DELETE FROM Product WHERE p_id = 2;

-- Search Data

SELECT* FROM product WHERE farmerf_username = 'kabir1';
