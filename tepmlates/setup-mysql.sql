CREATE DATABASE app_database;

USE app_database;

CREATE TABLE logins (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255),
    email VARCHAR(255),
    age INT,
    user_id INT
);
