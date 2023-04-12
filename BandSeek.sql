CREATE DATABASE IF NOT EXISTS BandSeek

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

CREATE TABLE User(
    username varchar(255) PRIMARY KEY,
    mail varchar(255) UNIQUE NOT NULL,
    password varchar(255) NOT NULL,
    bio varchar(2000),
    birthday data,
    name varchar(255)
    ...
);

