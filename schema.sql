SET SESSION storage_engine = "InnoDB";
SET SESSION time_zone = "+0:00";
ALTER DATABASE CHARACTER SET "utf8";

DROP TABLE IF EXISTS bookmarks;
CREATE TABLE bookmarks (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL REFERENCES user(id),
    description VARCHAR(512),
    name VARCHAR(512) NOT NULL,
    url VARCHAR(512) NOT NULL,
    published DATETIME NOT NULL,
    updated TIMESTAMP NOT NULL
);

DROP TABLE IF EXISTS users;
CREATE TABLE users (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(100) NOT NULL UNIQUE,
    name VARCHAR(100) NOT NULL,
    pswrd VARCHAR(100) NOT NULL
);

DROP TABLE IF EXISTS labels;
CREATE TABLE labels (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    description VARCHAR(100)
);

DROP TABLE IF EXISTS labels_bookmarks;
CREATE TABLE bookmarks_labels (
    bookmark_id INT NOT NULL,
    label_id INT NOT NULL,
    PRIMARY KEY(bookmark_id, label_id)
);