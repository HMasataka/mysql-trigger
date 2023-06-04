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

CREATE TRIGGER trigger_name
  BEFORE DELETE
  ON User
  FOR EACH ROW
  INSERT INTO DeletedUser (id, name, created_at, updated_at)
  VALUES ('Insert', 'name', NOW(), NOW());
