CREATE SCHEMA IF NOT EXISTS `library-db` DEFAULT CHARACTER SET utf8 ;
USE `library-db` ;

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone="+00:00";

CREATE TABLE IF NOT EXISTS `library-db`.`user`(
	`user_id` INT NOT NULL,
    `first_name` VARCHAR(20) NOT NULL,
    `last_name` VARCHAR(20) NOT NULL,
    PRIMARY KEY (`user_id`)
);
CREATE TABLE IF NOT EXISTS `library-db`.`role`(
	`role_id` INT NOT NULL,
	`role_type` VARCHAR(45) NOT NULL,
	PRIMARY KEY (`role_id`)
);
CREATE TABLE IF NOT EXISTS `library-db`.`user_has_role` (
	`user_id` INT NOT NULL,
	`role_id` INT NOT NULL,
	PRIMARY KEY (`user_id`, `role_id`),
    INDEX `fk_user_has_role_user1_idx` (`user_id` ASC),
	INDEX `fk_user_has_role_role1_idx` (`role_id` ASC),
	CONSTRAINT `fk_user_has_role_user1`
		FOREIGN KEY (`user_id`)
		REFERENCES `library-db`.user (`user_id`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
	CONSTRAINT `fk_user_has_role_role1`
		FOREIGN KEY (`role_id`)
		REFERENCES `library-db`.role (`role_id`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
);
CREATE TABLE IF NOT EXISTS `library-db`.`author` (
	`author_id` INT NOT NULL,
	`first_name` VARCHAR(45) NOT NULL,
	`last_name` VARCHAR(45) NOT NULL,
	PRIMARY KEY (`author_id`)
);
CREATE TABLE IF NOT EXISTS `library-db`.`book_info`(
	`book_id` INT NOT NULL,
	`name` VARCHAR(45) NOT NULL,
	`genre` VARCHAR(45) NOT NULL,
	`year` INT NOT NULL,
	`isbn` VARCHAR(45) NOT NULL,
	PRIMARY KEY (`book_id`)
);
CREATE TABLE IF NOT EXISTS `library-db`.`user_has_book` (
	`user_id` INT NOT NULL,
	`book_id` INT NOT NULL,
	PRIMARY KEY (`user_id`, `book_id`),
    INDEX `fk_user_has_book_user1_idx` (`user_id` ASC),
	INDEX `fk_user_has_book_book1_idx` (`book_id` ASC),
	CONSTRAINT `fk_user_has_book_user1`
		FOREIGN KEY (`user_id`)
		REFERENCES `library-db`.user (`user_id`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
	CONSTRAINT `fk_user_has_book_book1`
		FOREIGN KEY (`book_id`)
		REFERENCES `library-db`.`book_info` (`book_id`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
);
CREATE TABLE IF NOT EXISTS `library-db`.`author_has_book` (
	`author_id` INT NOT NULL,
	`book_id` INT NOT NULL,
	PRIMARY KEY (`author_id`, `book_id`),
    INDEX `fk_author_has_book_author1_idx` (`author_id` ASC),
	INDEX `fk_author_has_book_book1_idx` (`book_id` ASC),
	CONSTRAINT `fk_author_has_book_author1`
		FOREIGN KEY (`author_id`)
		REFERENCES `library-db`.`author` (`author_id`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
	CONSTRAINT `fk_author_has_book_book1`
		FOREIGN KEY (`book_id`)
		REFERENCES `library-db`.`book_info` (`book_id`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
);
CREATE TABLE IF NOT EXISTS `library-db`.`address` (
	`address_id` INT NOT NULL,
	`city` VARCHAR(45) NOT NULL,
	`street` VARCHAR(45) NOT NULL,
	`house_number` INT NOT NULL,
	`zip_code` INT NOT NULL,
	PRIMARY KEY(address_id)
);
CREATE TABLE IF NOT EXISTS `library-db`.`user_has_address` (
	`user_id` INT NOT NULL,
	`address_id` INT NOT NULL,
	`address_type` VARCHAR(45),
	PRIMARY KEY (`user_id`, `address_id`),
    INDEX `fk_user_has_address_user1_idx` (`user_id` ASC),
	INDEX `fk_user_has_address_address1_idx` (`address_id` ASC),
	CONSTRAINT `fk_user_has_address_user1`
		FOREIGN KEY (`user_id`)
		REFERENCES `library-db`.user (`user_id`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
	CONSTRAINT `fk_user_has_address_address1`
		FOREIGN KEY (`address_id`)
		REFERENCES `library-db`.address (`address_id`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
);
CREATE TABLE IF NOT EXISTS `library-db`.`transactions` (
	`user_id` INT NOT NULL,
	`book_id` INT NOT NULL,
	`date_borrowed` TIMESTAMP NOT NULL,
	`date_due` TIMESTAMP NOT NULL,
	`date_returned` TIMESTAMP NOT NULL,
	`price` INT NOT NULL,
	PRIMARY KEY (`user_id`, `book_id`),
    INDEX `fk_transactions_user1_idx` (`user_id` ASC),
	INDEX `fk_transactions_book1_idx` (`book_id` ASC),
	CONSTRAINT `fk_transactions_user1`
		FOREIGN KEY (`user_id`)
		REFERENCES `library-db`.user (`user_id`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
	CONSTRAINT `fk_transactions_book1`
		FOREIGN KEY (`book_id`)
		REFERENCES `library-db`.`book_info` (`book_id`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
);
CREATE TABLE IF NOT EXISTS `library-db`.`location` (
	`location_id` INT NOT NULL,
	`location` VARCHAR(45) NOT NULL,
	`address_id` INT NOT NULL,
	PRIMARY KEY (`location_id`),
    INDEX `fk_location_address1_idx` (`address_id` ASC),
	CONSTRAINT `fk_location_address1`
		FOREIGN KEY (`address_id`)
		REFERENCES `library-db`.`address` (`address_id`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
);
CREATE TABLE IF NOT EXISTS `library-db`.`event` (
	`id_event` INT NOT NULL,
	`title` VARCHAR(45) NOT NULL,
	`event_start` DATETIME NOT NULL,
	`event_end` DATETIME NOT NULL,
	`description` VARCHAR(45) NULL,
	`location_id` INT NOT NULL,
	PRIMARY KEY (`id_event`, `location_id`),
    INDEX `fk_event_location1_idx` (`location_id` ASC),
	UNIQUE (`id_event`),
	CONSTRAINT `fk_event_location1`
		FOREIGN KEY (`location_id`)
		REFERENCES `library-db`.`location` (`location_id`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
);

CREATE TABLE IF NOT EXISTS `library-db`.`event_has_user` (
	`id_event` INT NOT NULL,
	`user_id` INT NOT NULL,
	`is_organizer` TINYINT,
    INDEX `fk_event_has_user_event1_idx` (`id_event` ASC),
	INDEX `fk_event_has_user_user1_idx` (`user_id` ASC),
	CONSTRAINT `fk_event_has_user_event1`
		FOREIGN KEY (`id_event`)
		REFERENCES `library-db`.event (`id_event`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
	CONSTRAINT `fk_event_has_user_user1`
		FOREIGN KEY (`user_id`)
		REFERENCES `library-db`.user (`user_id`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
);

CREATE TABLE IF NOT EXISTS `library-db`.`contact` (
	`user_id` INT NOT NULL,
	`phone` VARCHAR(15) NOT NULL,
    `mail`	VARCHAR(45) NOT NULL,
    PRIMARY KEY (`user_id`),
    INDEX `fk_contact_user1_idx` (`user_id` ASC),
    CONSTRAINT `fk_contact_user1`
		FOREIGN KEY(`user_id`)
		REFERENCES `library-db`.user (`user_id`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
);
