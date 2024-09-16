-- Intrucciones de uso:
-- 1. Haber creado base de datos previamente
-- 2. Copiar y pegar carpeta de Carga Masiva ubicada en el repositorio en la siguiente ruta: C:\xampp\mysql\data

use BBDD_Restaurante;

DELETE FROM Pedido; 
-- Script para borrar datos de las tablas en caso de que la tabla ya cuente con registros
DELETE FROM producto;
DELETE FROM orden;
DELETE FROM Mesero;
DELETE FROM Tipo_Cliente;
DELETE FROM Tipo_Producto;
DELETE FROM Categoria_Producto;
DELETE FROM Mesa;

-- Reinicia el ID autoincrementable en 0 para que no hayan errores con el número de ID
ALTER TABLE Pedido AUTO_INCREMENT = 0;
ALTER TABLE orden AUTO_INCREMENT = 0;
ALTER TABLE producto AUTO_INCREMENT = 0;
ALTER TABLE Mesero AUTO_INCREMENT = 0;
ALTER TABLE Tipo_Cliente AUTO_INCREMENT = 0;
ALTER TABLE Tipo_Producto AUTO_INCREMENT = 0;
ALTER TABLE Categoria_Producto AUTO_INCREMENT = 0;
ALTER TABLE Mesa AUTO_INCREMENT = 0;

-- Carga masiva de tabla Mesero
LOAD DATA INFILE 'Carga Masiva/Mesero.csv'
REPLACE INTO TABLE Mesero
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(Mes_Nombre);

-- Carga masiva de tabla Mesa
LOAD DATA INFILE 'Carga Masiva/Mesa.csv'
REPLACE INTO TABLE Mesa
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(Mesa_Nombre);

-- Carga masiva de tabla Tipo_Cliente
LOAD DATA INFILE 'Carga Masiva/Tipo_Cliente.csv'
REPLACE INTO TABLE Tipo_Cliente
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(TiC_Tipo);
-- Carga masiva de tabla Tipo_Producto
LOAD DATA INFILE 'Carga Masiva/Tipo_Producto.csv'
REPLACE INTO TABLE Tipo_Producto
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(TiP_Nombre);
-- Carga masiva de tabla Categoria_Producto
LOAD DATA INFILE 'Carga Masiva/Categoria_Producto.csv'
REPLACE INTO TABLE Categoria_Producto
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(CaP_Nombre);
-- Carga masiva de tabla Producto
LOAD DATA INFILE 'Carga Masiva/Producto.csv'
REPLACE INTO TABLE producto
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(Prod_Nombre, Prod_Costo, Prod_Precio, CaP_ID, TiP_ID);
-- Carga masiva de tabla Orden
LOAD DATA INFILE 'Carga Masiva/Orden.csv'
REPLACE INTO TABLE orden
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(Ord_Fecha, Mesa_ID, Ord_Propina, Mes_ID, TiC_ID);
-- Carga masiva de tabla Pedido
LOAD DATA INFILE 'Carga Masiva/Pedido.csv'
REPLACE INTO TABLE Pedido
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(Ord_ID,Prod_ID);