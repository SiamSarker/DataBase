command 1:
CREATE TABLE product(
    id VARCHAR(10),
    date_offered DATE DEFAULT '2010-02-10',
    date_retired DATE,
    name VARCHAR(30) NOT NULL,
    p_type VARCHAR(255),
   
    CONSTRAINT pk PRIMARY KEY(id),
    CONSTRAINT uk UNIQUE(name),
    CONSTRAINT fk FOREIGN KEY(p_type) REFERENCES product_type(product_type_cd) ON DELETE CASCADE 

);

command 2:

CREATE TABLE account(
    id INT,
    balance FLOAT DEFAULT 0.0,
    open_date DATE,
    last_activity DATETIME,
    st VARCHAR(150) DEFAULT 'active',
    branch_id INT,
    emp_id INT,
    referrer_id INT,
   
    CONSTRAINT pk PRIMARY KEY(id),
    CONSTRAINT uk UNIQUE(last_activity),
    CONSTRAINT fk1 FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE SET NULL,
    CONSTRAINT fk2 FOREIGN KEY(emp_id) REFERENCES employee(emp_id) ON DELETE RESTRICT,
    CONSTRAINT fk3 FOREIGN KEY(referrer_id) REFERENCES account(id) ON DELETE SET NULL

);


command 3:
ALTER TABLE acc_transaction
    ADD FOREIGN KEY (account_id) REFERENCES account(id)