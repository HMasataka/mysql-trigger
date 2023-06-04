CREATE TABLE `User` (
  id VARCHAR(255) NOT NULL,
  name VARCHAR(255) NOT NULL,
  created_at DATETIME NOT NULL,
  updated_at DATETIME NOT NULL,
    PRIMARY KEY (id)
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE TABLE `DeletedUser` (
  id VARCHAR(255) NOT NULL,
  name VARCHAR(255) NOT NULL,
  created_at DATETIME NOT NULL,
  updated_at DATETIME NOT NULL
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE TRIGGER deleted_user_log_trigger
  BEFORE DELETE
  ON User
  FOR EACH ROW
  INSERT INTO DeletedUser (id, name, created_at, updated_at)
  VALUES (OLD.id, OLD.name, OLD.created_at, OLD.updated_at);

CREATE TABLE `Post` (
  id VARCHAR(255) NOT NULL,
  user_id VARCHAR(255) NOT NULL,
  title VARCHAR(255) NOT NULL,
  text TEXT NOT NULL,
  created_at DATETIME NOT NULL,
  updated_at DATETIME NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES `User` (id) ON DELETE CASCADE ON UPDATE CASCADE
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE TRIGGER delete_post_trigger
  BEFORE DELETE
  ON User
  FOR EACH ROW
  DELETE FROM Post WHERE user_id = OLD.id;

CREATE TABLE `DeletedPost` (
  id VARCHAR(255) NOT NULL,
  user_id VARCHAR(255) NOT NULL,
  title VARCHAR(255) NOT NULL,
  text TEXT NOT NULL,
  created_at DATETIME NOT NULL,
  updated_at DATETIME NOT NULL
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE TRIGGER deleted_post_log_trigger
  BEFORE DELETE
  ON Post
  FOR EACH ROW
  INSERT INTO DeletedPost (id, user_id, title, text, created_at, updated_at)
  VALUES (OLD.id, OLD.user_id, OLD.title, OLD.text, OLD.created_at, OLD.updated_at);
