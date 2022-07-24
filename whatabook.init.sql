/*
    Title: whatabook.init.sql
    Author: Tanner
    Date: 10 July 2022
    Description: WhatABook database initialization script.
*/

DROP USER IF EXISTS 'whatabook_user'@'localhost';

CREATE USER 'whatabook_user'@'localhost' IDENTIFIED WITH mysql_native_password BY 'MySQL8IsGreat!';

GRANT ALL PRIVILEGES ON whatabook.* TO'whatabook_user'@'localhost';

ALTER TABLE wishlist DROP FOREIGN KEY fk_book;
ALTER TABLE wishlist DROP FOREIGN KEY fk_user;

DROP TABLE IF EXISTS store;
DROP TABLE IF EXISTS book;
DROP TABLE IF EXISTS wishlist;
DROP TABLE IF EXISTS user;


CREATE TABLE store (
    store_id    INT             NOT NULL    AUTO_INCREMENT,
    locale      VARCHAR(500)    NOT NULL,
    PRIMARY KEY(store_id)
);

CREATE TABLE book (
    book_id     INT             NOT NULL    AUTO_INCREMENT,
    book_name   VARCHAR(200)    NOT NULL,
    author      VARCHAR(200)    NOT NULL,
    details     VARCHAR(500),
    PRIMARY KEY(book_id)
);

CREATE TABLE user (
    user_id         INT         NOT NULL    AUTO_INCREMENT,
    first_name      VARCHAR(75) NOT NULL,
    last_name       VARCHAR(75) NOT NULL,
    PRIMARY KEY(user_id) 
);

CREATE TABLE wishlist (
    wishlist_id     INT         NOT NULL    AUTO_INCREMENT,
    user_id         INT         NOT NULL,
    book_id         INT         NOT NULL,
    PRIMARY KEY (wishlist_id),
    CONSTRAINT fk_book
    FOREIGN KEY (book_id)
        REFERENCES book(book_id),
    CONSTRAINT fk_user
    FOREIGN KEY (user_id)
        REFERENCES user(user_Id)
);

INSERT INTO store(locale)
    VALUES('24357, Los Angeles, CA 90210');

INSERT INTO book(book_name, author, details)
    VALUES('Dantes Inferno', 'Dante Aligheri', 'Dante takes a stroll through the seven circles of hell');

INSERT INTO book(book_name, author, details)
    VALUES('Game of Thrones', 'George R.R. Martin', 'Ice zombies, incest, and kids falling out of towers');

INSERT INTO book(book_name, author, details)
    VALUES('Dune', 'Frank Herbert', "Desert people, giant sand worms, and superpowers");

INSERT INTO book(book_name, author)
    VALUES('Percy Jackson: The Lightning Thief', 'Rick Riordan');

INSERT INTO book(book_name, author)
    VALUES('Heroes of Olympus: The Lost Hero ', 'Rick Riordan');

INSERT INTO book(book_name, author)
    VALUES("Heroes of Olympus: The Son of Neptune", 'Rick Riordan');

INSERT INTO book(book_name, author)
    VALUES('Heroes of Olympus: The Mark of Athena', 'Rick Riordan');

INSERT INTO book(book_name, author)
    VALUES('Heroes of Olympus: The House of Hades', 'Rick Riordan');

INSERT INTO book(book_name, author)
    VALUES('Heroes of Olympus: The Blood of Olympus', 'Rick Riordan');

INSERT INTO user(first_name, last_name) 
    VALUES('Tanner', 'Maine');

INSERT INTO user(first_name, last_name)
    VALUES('Nate', 'Rohde');

INSERT INTO user(first_name, last_name)
    VALUES('Dillon', 'Thompson');

INSERT INTO wishlist(user_id, book_id) 
    VALUES (
        (SELECT user_id FROM user WHERE first_name = 'Tanner'), 
        (SELECT book_id FROM book WHERE book_name = 'Heroes of Olympus: The Blood of Olympus')
    );

INSERT INTO wishlist(user_id, book_id)
    VALUES (
        (SELECT user_id FROM user WHERE first_name = 'Nate'),
        (SELECT book_id FROM book WHERE book_name = 'Percy Jackson: The Lightning Thief')
    );

INSERT INTO wishlist(user_id, book_id)
    VALUES (
        (SELECT user_id FROM user WHERE first_name = 'Dillon'),
        (SELECT book_id FROM book WHERE book_name = 'Game of Thrones')
    );