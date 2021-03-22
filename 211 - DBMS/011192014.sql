command 1:
CREATE DATABASE e_computer;



command 2:
CREATE TABLE PC(
    id CHAR(5),
    model_name VARCHAR(30) NOT NULL,
    release_date DATE,
    country_of_origin VARCHAR(40) DEFAULT "Bangladesh",
    warranty VARCHAR(250),
   
    CONSTRAINT pk PRIMARY KEY(id),
    CONSTRAINT uk UNIQUE(release_date)
);

INSERT INTO PC VALUES(34123,'DELL','2010-02-23','India','2 years'),(54843,'Mac-Book','2020-04-20','USA','3 years');



command 3:
CREATE TABLE Category (
    id INT,
    name VARCHAR(250) NOT NULL,
   
    CONSTRAINT pk PRIMARY KEY(id),
    CONSTRAINT uk UNIQUE(name)
);
INSERT INTO Category VALUES(234,'Windows'),(843,'MacOS');



command 4:
CREATE TABLE Component(
    id CHAR(10),
    name VARCHAR(30),
    category INT,
    configuration VARCHAR(300),
    price DOUBLE NOT NULL,
   
    CONSTRAINT pk PRIMARY KEY(id),
    CONSTRAINT fk FOREIGN KEY(category) REFERENCES Category(id) ON DELETE RESTRICT
);

INSERT INTO Component VALUES(3173237567,'Processor',234,'Core i3',30.4),(5583298843,'Display',843,'Ratina Display',24.67);



command 5:
CREATE TABLE PC_part(
    pc_id CHAR(5),
    component_id CHAR(10),
    part_type VARCHAR(500) CHECK (part_type="optional" OR part_type="mandatory"),
    
    CONSTRAINT pk PRIMARY KEY(pc_id,component_id)

);

ALTER TABLE PC_part
    ADD FOREIGN KEY (pc_id) REFERENCES PC(id)

ALTER TABLE PC_part
    ADD FOREIGN KEY (component_id) REFERENCES Component(id)


INSERT INTO PC_part VALUES(34123,3173237567,"optional"),(54843,5583298843,"mandatory");



command 6:
ALTER TABLE Category 
ADD COLUMN short_cat VARCHAR(250) NOT NULL;



command 7:
ALTER TABLE Component
ADD CONSTRAINT uq UNIQUE (name);

