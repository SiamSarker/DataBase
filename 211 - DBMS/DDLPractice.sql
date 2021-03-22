1.
CREATE TABLE table1 (
    colA INT AUTO_INCREMENT,
    colB VARCHAR(40),
    colC DATETIME DEFAULT "2020-01-01 00:00:00",
    foreign_colA INT,
    foreign_colP VARCHAR(30),

    CONSTRAINT pk PRIMARY KEY(colA)
);

2.
CREATE TABLE table2 (
    colP VARCHAR(30),
    colQ CHAR(10) NOT NULL UNIQUE,
    foreign_colA INT,

    CONSTRAINT pk PRIMARY KEY(colP)
);


ALTER TABLE table1
    ADD FOREIGN KEY (foreign_colP) REFERENCES table2(colP)

ALTER TABLE table2
    ADD FOREIGN KEY (foreign_colA) REFERENCES table1(colA)