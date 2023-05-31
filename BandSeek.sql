CREATE DATABASE IF NOT EXISTS BandSeekfrtho

CHARACTER SET utf8;

USE BandSeek;

CREATE TABLE Genre(
    name varchar(255) PRIMARY KEY
);

CREATE TABLE Job(
    name varchar(255) PRIMARY KEY
);

CREATE TABLE Media(
    id int PRIMARY KEY AUTO_INCREMENT,
    path varchar(255) NOT NULL  
);

CREATE TABLE Address(
    id int PRIMARY KEY AUTO_INCREMENT,
    city varchar(255) NOT NULL,
    country varchar(255) NOT NULL
);

CREATE TABLE Band(
    id int PRIMARY KEY AUTO_INCREMENT,
    name varchar(255) NOT NULL,
    bio varchar(2000)
);

CREATE TABLE Chat(
    id int PRIMARY KEY AUTO_INCREMENT,
    description varchar(255)
);

CREATE TABLE Users(
    username varchar(255) PRIMARY KEY,
    mail varchar(255) UNIQUE NOT NULL,
    password varchar(255) NOT NULL,
    bio varchar(2000),
    birthday date,
    name varchar(255),
    surname varchar(255),
    phone varchar(255) UNIQUE,
    admin boolean DEFAULT false,
    idAddress int NOT NULL,
    photo int,
    FOREIGN KEY (idAddress) REFERENCES Address(id), 
    FOREIGN KEY (photo) REFERENCES Media(id)
);

CREATE TABLE Post(
    id int PRIMARY KEY AUTO_INCREMENT,
    description varchar(2000),
    date date NOT NULL DEFAULT CURRENT_TIMESTAMP,
    username varchar(255),
    band int,
    photo int,
    FOREIGN KEY (username) REFERENCES User(username),
    FOREIGN KEY (band) REFERENCES Band(id),
    FOREIGN KEY (photo) REFERENCES Media(id)
);

CREATE TABLE Announce(
    id int PRIMARY KEY AUTO_INCREMENT,
    description varchar(2000),    
    date date NOT NULL DEFAULT CURRENT_TIMESTAMP,
    username varchar(255),
    band int,
    FOREIGN KEY (username) REFERENCES User(username),
    FOREIGN KEY (band) REFERENCES Band(id)
);

CREATE TABLE Comment(
    id int PRIMARY KEY AUTO_INCREMENT,
    content varchar(2000),    
    date date NOT NULL DEFAULT CURRENT_TIMESTAMP,
    idPost int NOT NULL,
    username varchar(255),
    FOREIGN KEY (username) REFERENCES User(username),
    FOREIGN KEY (idPost) REFERENCES Post(id)
);

CREATE TABLE Message(
    id int PRIMARY KEY AUTO_INCREMENT,
    content varchar(2000),    
    date date NOT NULL DEFAULT CURRENT_TIMESTAMP,
    username varchar(255) NOT NULL,
    idChat int NOT NULL,
    FOREIGN KEY (username) REFERENCES User(username),
    FOREIGN KEY (idChat) REFERENCES Chat(id)
);

CREATE TABLE Audio(
    id int PRIMARY KEY AUTO_INCREMENT,
    name varchar(255) NOT NULL,
    path varchar(255) NOT NULL,
    lyrics varchar(2000),
    username varchar(255) NOT NULL,
    FOREIGN KEY (username) REFERENCES User(username)
);
