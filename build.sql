
CREATE DATABASE IF NOT EXISTS Biblioteca;
USE Biblioteca;

CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(50) NOT NULL,
  password VARCHAR(60) NOT NULL
);

CREATE TABLE libros (
  ISBN VARCHAR(45) NOT NULL,
  Edicion INT NOT NULL,
  FechaPublicacion INT NOT NULL,
  Titulo VARCHAR(45) NOT NULL,
  NombreAutor VARCHAR(45) NOT NULL,
  PrimerApellidoAutor VARCHAR(45) DEFAULT NULL,
  SegundoApellidoAutor VARCHAR(45) DEFAULT NULL,
  Paginas INT NOT NULL,
  Categoria VARCHAR(45) NOT NULL,
  Editorial VARCHAR(45) NOT NULL,
  PRIMARY KEY (ISBN, Edicion)
);

INSERT INTO libros (ISBN, Edicion, FechaPublicacion, Titulo, NombreAutor, PrimerApellidoAutor, SegundoApellidoAutor, Paginas, Categoria, Editorial) VALUES
('978-3-16-148410-0', 1, 2021, 'Introducción a la Programación', 'John', 'Doe', NULL, 350, 'Tecnología', 'TechBooks'),
('978-0-12-374750-1', 2, 2018, 'Fundamentos de Bases de Datos', 'Jane', 'Smith', NULL, 450, 'Informática', 'DataPress'),
('978-1-86197-876-9', 3, 2015, 'Historia del Arte', 'Mary', 'Johnson', NULL, 500, 'Arte', 'ArtWorld'),
('978-0-07-161586-8', 1, 2017, 'Principios de Economía', 'Paul', 'Samuelson', NULL, 600, 'Economía', 'McGraw-Hill'),
('978-0-13-110362-7', 1, 2002, 'El Lenguaje de Programación C', 'Brian', 'Kernighan', 'Ritchie', 288, 'Programación', 'Prentice Hall');

INSERT INTO users (username, password) VALUES ('admin', 'admin123'), ('user1', 'password1');
