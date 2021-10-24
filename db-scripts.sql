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


