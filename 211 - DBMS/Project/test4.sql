CREATE TABLE Area (District varchar(25) NOT NULL, City varchar(25) NOT NULL, PRIMARY KEY (District, City));
CREATE TABLE farmer (f_username varchar(25) NOT NULL, password char(6) NOT NULL, Name varchar(25) NOT NULL, Address varchar(50) NOT NULL, Contact_no int(11) NOT NULL, District varchar(25) NOT NULL, City varchar(25) NOT NULL, PRIMARY KEY (f_username));
CREATE TABLE Buyer (b_username varchar(25) NOT NULL, password char(6) NOT NULL, Name varchar(25) NOT NULL, Address varchar(50) NOT NULL, Contact_no int(11) NOT NULL, District varchar(25) NOT NULL, City varchar(25) NOT NULL, PRIMARY KEY (b_username));
CREATE TABLE Product (p_id int(10) NOT NULL AUTO_INCREMENT, productName varchar(25) NOT NULL, productImage varchar(255) NOT NULL, Weight int(10) NOT NULL, Price_perUnit int(10) NOT NULL, Unit varchar(10) NOT NULL, Added_date date NOT NULL, BidDate date NOT NULL, BidTime time NOT NULL, farmerf_username varchar(25) NOT NULL, PRIMARY KEY (p_id));
CREATE TABLE Buyer_bid (id int(10) NOT NULL AUTO_INCREMENT, rank_id int(10) NOT NULL, bidWeight int(10) NOT NULL, bidPrice_perUnit int(10) NOT NULL, Buyerb_username varchar(25) NOT NULL, Bid_roombid_id int(11) NOT NULL, PRIMARY KEY (id));
CREATE TABLE Bid_cart (Buyer_bidid int(10) NOT NULL, Buyerb_username varchar(25) NOT NULL, totalWeight int(10) NOT NULL, totalCost int(10) NOT NULL, text varchar(255) NOT NULL);
CREATE TABLE AfteBid_rankSale (Buyer_bidid int(10) NOT NULL, notify_id int(10) NOT NULL AUTO_INCREMENT, StartTime time NOT NULL, EndTime time NOT NULL, restWeight int(10) NOT NULL, lowestPrice_perUnit int(10) NOT NULL, text varchar(255) NOT NULL, isAccept int(11), PRIMARY KEY (notify_id));
CREATE TABLE Buyer_AfteBid_rankSale (Buyerb_username varchar(25) NOT NULL, AfteBid_rankSalenotify_id int(10) NOT NULL, totalWeight int(10) NOT NULL, totalCost int(10) NOT NULL, text varchar(255) NOT NULL, PRIMARY KEY (Buyerb_username, AfteBid_rankSalenotify_id));
CREATE TABLE Product_Buyer (Productp_id int(10) NOT NULL, Buyerb_username varchar(25) NOT NULL, totalWeight int(11) NOT NULL, totalCost int(11) NOT NULL, text varchar(255) NOT NULL, PRIMARY KEY (Productp_id, Buyerb_username));
CREATE TABLE Bid_room (bid_id int(11) NOT NULL AUTO_INCREMENT, totalWeight int(11) NOT NULL, lowest_bidWeight int(11) NOT NULL, lowestPrice_perUnit int(11) NOT NULL, bid_start int(11) NOT NULL, bid_end int(11) NOT NULL, Productp_id int(10) NOT NULL, PRIMARY KEY (bid_id));
ALTER TABLE farmer ADD INDEX FKfarmer247222 (District, City), ADD CONSTRAINT FKfarmer247222 FOREIGN KEY (District, City) REFERENCES Area (District, City);
ALTER TABLE Buyer ADD INDEX FKBuyer19772 (District, City), ADD CONSTRAINT FKBuyer19772 FOREIGN KEY (District, City) REFERENCES Area (District, City);
ALTER TABLE Product ADD INDEX FKProduct80401 (farmerf_username), ADD CONSTRAINT FKProduct80401 FOREIGN KEY (farmerf_username) REFERENCES farmer (f_username);
ALTER TABLE Buyer_bid ADD INDEX FKBuyer_bid865 (Buyerb_username), ADD CONSTRAINT FKBuyer_bid865 FOREIGN KEY (Buyerb_username) REFERENCES Buyer (b_username);
ALTER TABLE Bid_cart ADD INDEX FKBid_cart28340 (Buyer_bidid), ADD CONSTRAINT FKBid_cart28340 FOREIGN KEY (Buyer_bidid) REFERENCES Buyer_bid (id);
ALTER TABLE Bid_cart ADD INDEX FKBid_cart320041 (Buyerb_username), ADD CONSTRAINT FKBid_cart320041 FOREIGN KEY (Buyerb_username) REFERENCES Buyer (b_username);
ALTER TABLE AfteBid_rankSale ADD INDEX FKAfteBid_ra159035 (Buyer_bidid), ADD CONSTRAINT FKAfteBid_ra159035 FOREIGN KEY (Buyer_bidid) REFERENCES Buyer_bid (id);
ALTER TABLE Buyer_AfteBid_rankSale ADD INDEX FKBuyer_Afte910054 (Buyerb_username), ADD CONSTRAINT FKBuyer_Afte910054 FOREIGN KEY (Buyerb_username) REFERENCES Buyer (b_username);
ALTER TABLE Buyer_AfteBid_rankSale ADD INDEX FKBuyer_Afte885684 (AfteBid_rankSalenotify_id), ADD CONSTRAINT FKBuyer_Afte885684 FOREIGN KEY (AfteBid_rankSalenotify_id) REFERENCES AfteBid_rankSale (notify_id);
ALTER TABLE Product_Buyer ADD INDEX FKProduct_Bu495318 (Productp_id), ADD CONSTRAINT FKProduct_Bu495318 FOREIGN KEY (Productp_id) REFERENCES Product (p_id);
ALTER TABLE Product_Buyer ADD INDEX FKProduct_Bu185398 (Buyerb_username), ADD CONSTRAINT FKProduct_Bu185398 FOREIGN KEY (Buyerb_username) REFERENCES Buyer (b_username);
ALTER TABLE Bid_room ADD INDEX FKBid_room169742 (Productp_id), ADD CONSTRAINT FKBid_room169742 FOREIGN KEY (Productp_id) REFERENCES Product (p_id);
ALTER TABLE Buyer_bid ADD INDEX FKBuyer_bid28558 (Bid_roombid_id), ADD CONSTRAINT FKBuyer_bid28558 FOREIGN KEY (Bid_roombid_id) REFERENCES Bid_room (bid_id);
