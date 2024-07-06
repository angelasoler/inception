-- Criar um banco de dados
CREATE DATABASE IF NOT EXISTS mydatabase;

-- Usar o banco de dados criado
USE mydatabase;

-- Criar uma tabela
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL
);

-- Inserir dados iniciais
INSERT INTO users (username, email) VALUES
    ('user1', 'user1@example.com'),
    ('user2', 'user2@example.com');

SELECT 'Initial database setup completed.' AS 'Message';
