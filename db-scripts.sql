/*CREATE TABLE person (
user_id INT NOT NULL,
first_name VARCHAR(20) NOT NULL,
last_name VARCHAR(20) NOT NULL,
mail VARCHAR(45) NOT NULL,
roles_id INT(8),
address_id INT(8),
PRIMARY KEY (user_id)
);

CREATE TABLE roles (
role_id INT NOT NULL,
role_type VARCHAR(45),
PRIMARY KEY (role_id)
);

CREATE TABLE person_roles (
person_id INT NOT NULL,
role_id INT NOT NULL,
PRIMARY KEY (person_id, role_id),
FOREIGN KEY (person_id)
REFERENCES person (user_id),
FOREIGN KEY (role_id)
REFERENCES roles (role_id)
);

CREATE TABLE author (
author_id INT NOT NULL,
first_name VARCHAR(45),
last_name VARCHAR(45),
PRIMARY KEY (author_id)
);

CREATE TABLE book_info (
book_id INT NOT NULL,
author VARCHAR(45),
name VARCHAR(45),
year VARCHAR(45),
isbn VARCHAR(45),
PRIMARY KEY (book_id)
);

CREATE TABLE book_borrowed (
user_id INT NOT NULL,
book_id INT NOT NULL,
PRIMARY KEY (user_id, book_id),
FOREIGN KEY (user_id)
REFERENCES person (user_id),
FOREIGN KEY (book_id)
REFERENCES book_info (book_id)
);

CREATE TABLE address (
address_id INT NOT NULL,
city VARCHAR(45),
street VARCHAR(45),
house_number INT,
zip_code INT,
PRIMARY KEY(address_id)
);

CREATE TABLE user_has_address (
user_id INT NOT NULL,
address_id INT(8),
address_type VARCHAR(45),
PRIMARY KEY (user_id, address_id),
FOREIGN KEY (user_id)
REFERENCES person (user_id),
FOREIGN KEY (address_id)
REFERENCES address (address_id)
);*/




/*ALTER TABLE book_info DROP COLUMN author;
ALTER TABLE book_info ADD COLUMN author INT NOT NULL;
ALTER TABLE book_info ADD PRIMARY KEY (author);*/

/*ALTER TABLE book_info ADD CONSTRAINT test FOREIGN KEY (author) REFERENCES author (author_id);*/

/* TAKTO MA BYT BOOK_INFO */
/*CREATE TABLE book_info (
book_id INT NOT NULL,
author_id INT NOT NULL,
name VARCHAR(45),
year VARCHAR(45),
isbn VARCHAR(45),
PRIMARY KEY (book_id, author_id),
FOREIGN KEY (author_id)
REFERENCES author (author_id)
);*/

/*CREATE TABLE transactions (
user_id INT NOT NULL,
book_id INT NOT NULL,
date_borrowed DATETIME NOT NULL,
date_due DATETIME NOT NULL,
date_returned DATETIME NOT NULL,
PRIMARY KEY (user_id, book_id),
FOREIGN KEY (user_id)
REFERENCES person (user_id),
FOREIGN KEY (book_id)
REFERENCES book_info (book_id)
);*/



