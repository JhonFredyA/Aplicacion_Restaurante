use BBDD_Restaurante;

-- Script para borrar datos de las tablas en caso de que la tabla ya cuente con registros
DELETE from producto;
DELETE from orden;

-- Reinicia el ID autoincrementable en 0 para que no hayan errores con el número de ID
alter table producto AUTO_INCREMENT = 0;
alter table orden AUTO_INCREMENT = 0;

-- Carga masiva de tabla Mesero

-- Carga masiva de tabla Tipo_Cliente

-- Carga masiva de tabla Tipo_Producto

-- Carga masiva de tabla Categoria_Producto

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
