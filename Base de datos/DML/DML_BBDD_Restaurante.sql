-- Intrucciones de uso:
-- 1. Haber creado base de datos previamente
-- 2. Copiar y pegar carpeta de Carga Masiva ubicada en el repositorio en la siguiente ruta: C:\xampp\mysql\data

use BBDD_Restaurante;

-- Script para borrar datos de las tablas en caso de que la tabla ya cuente con registros
DELETE FROM producto;
DELETE FROM orden;
DELETE FROM Mesero;
DELETE FROM Tipo_Cliente;
DELETE FROM Tipo_Producto;
DELETE FROM Categoria_Producto;
DELETE FROM Pedido; 

-- Reinicia el ID autoincrementable en 0 para que no hayan errores con el número de ID
ALTER TABLE producto AUTO_INCREMENT = 0;
ALTER TABLE orden AUTO_INCREMENT = 0;
ALTER TABLE Mesero AUTO_INCREMENT = 0;
ALTER TABLE Tipo_Cliente AUTO_INCREMENT = 0;
ALTER TABLE Tipo_Producto AUTO_INCREMENT = 0;
ALTER TABLE Categoria_Producto AUTO_INCREMENT = 0;
ALTER TABLE Pedido AUTO_INCREMENT = 0;

-- Carga masiva de tabla Mesero
LOAD DATA INFILE 'Carga Masiva/Mesero.csv'
REPLACE INTO TABLE Mesero
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(Mes_Nombre);
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
(Ord_Fecha, Ord_Mesa, Ord_Propina, Mes_ID, TiC_ID);
-- Carga masiva de tabla Pedido
LOAD DATA INFILE 'Carga Masiva/Pedido.csv'
REPLACE INTO TABLE Pedido
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(Ord_ID,Prod_ID);

SELECT * FROM Orden INNER JOIN Producto
ON Orden.Ord_ID = Producto.Prod_ID

SELECT * FROM Mesero INNER JOIN Orden
ON Mesero.Mes_ID = Orden.Ord_ID

SELECT * FROM Orden INNER JOIN Tipo_Cliente
ON Orden.Ord_ID = Tipo_Cliente.TiC_ID

SELECT 
    Orden.Ord_ID as Orden_ID, 
    Orden.Ord_Fecha AS Orden_Fecha,
    Orden.Ord_Mesa as Orden_mesa,
    Orden.Ord_Propina as Orden_propina, 
    Mesero.Mes_Nombre as Mesero_Nombre, 
    Tipo_Cliente.TiC_Tipo as Tipo_Cliente 
FROM 
    Orden
INNER JOIN
    Mesero ON Orden.Mes_ID = Mesero.Mes_ID
INNER JOIN
    Tipo_Cliente ON Orden.TiC_ID = Tipo_Cliente.TiC_ID
WHERE Orden.Ord_ID = 2002;

SELECT
Pedido.Ped_ID,
Orden.Ord_ID AS numero_orden,
Producto.Prod_Nombre as nombre_producto
FROM
Pedido
INNER JOIN 
Orden ON Pedido.Ord_ID = Orden.Ord_ID
INNER JOIN 
Producto ON Pedido.Prod_ID = Producto.Prod_ID
WHERE Pedido.Ped_ID =2005;

SELECT
Producto.Prod_ID ,
Producto.Prod_Nombre ,
Producto.Prod_Costo ,
Producto.Prod_Precio,
Categoria_Producto.CaP_Nombre ,
Tipo_Producto.TiP_Nombre
FROM
Producto 
INNER JOIN 
Categoria_Producto ON Producto.CaP_ID = Categoria_Producto.CaP_ID
INNER JOIN 
Tipo_Producto ON Producto.TiP_ID = Tipo_Producto.TiP_ID
WHERE Producto.Prod_ID =69;


-- fECHA ORDEN Y NOMBRE PRODUCTI

SELECT 
Pedido.Ped_ID,
Orden.Ord_Fecha,
Producto.Prod_Nombre
FROM Pedido
INNER JOIN
Orden ON Pedido.Ord_ID = Orden.Ord_ID
INNER JOIN 
Producto ON 
Pedido.Prod_ID = Producto.Prod_ID
WHERE Pedido.Ped_ID =15;