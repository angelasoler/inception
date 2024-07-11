-- SINTAC ERROR
-- ERROR 1064 (42000) at line 1 in file: '/etc/mysql/init.sql': You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '{MYSQL_DB}' at line 1
-- ERROR 1049 (42000) at line 3 in file: '/etc/mysql/init.sql': Unknown database '${MYSQL_DB}'
-- ERROR 1046 (3D000) at line 5 in file: '/etc/mysql/init.sql': No database selected
-- ERROR 1046 (3D000) at line 11 in file: '/etc/mysql/init.sql': No database selected

CREATE DATABASE IF NOT EXISTS ${MYSQL_DB};

USE ${MYSQL_DB};

CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL
);

INSERT INTO users (username, email) VALUES
    ('user', 'user@example.com');

SELECT 'Initial database setup completed.' AS 'Message';
