-- Intrucciones para creación de base de datos:
-- 1. Ejecutar XAMPP
-- 2. Crear conexión con la extensión, si no la tienen la extensión se llama MySQL

-- Primero ejecutar esta línea!!
CREATE DATABASE BBDD_Restaurante
    DEFAULT CHARACTER SET = 'utf8mb4';

USE BBDD_Restaurante;

CREATE TABLE Mesero (
    Mes_ID INT(10) PRIMARY KEY AUTO_INCREMENT,
    Mes_Nombre VARCHAR(20)
);

CREATE TABLE Mesa (
    Mesa_ID INT(10) PRIMARY KEY AUTO_INCREMENT,
    Mesa_Nombre VARCHAR(15)
);

CREATE TABLE Tipo_Cliente (
    TiC_ID INT(10) PRIMARY KEY AUTO_INCREMENT,
    TiC_Tipo VARCHAR(20)
);

CREATE TABLE Tipo_Producto (
    TiP_ID INT(10) PRIMARY KEY AUTO_INCREMENT,
    TiP_Nombre VARCHAR(20)
);

CREATE TABLE Categoria_Producto (
    CaP_ID INT(10) PRIMARY KEY AUTO_INCREMENT,
    CaP_Nombre VARCHAR(20)
);

CREATE TABLE Producto (
    Prod_ID INT(10) PRIMARY KEY AUTO_INCREMENT,
    Prod_Nombre VARCHAR(20),
    Prod_Costo DECIMAL(5, 2),
    Prod_Precio DECIMAL(5, 2),
    CaP_ID INT(10),
    TiP_ID INT(10), 
    FOREIGN KEY (CaP_ID) REFERENCES CATEGORIA_PRODUCTO (CaP_ID),
    FOREIGN KEY (TiP_ID) REFERENCES TIPO_PRODUCTO (TiP_ID) 
);

CREATE TABLE Orden (
    Ord_ID INT(10) PRIMARY KEY AUTO_INCREMENT,
    Ord_Fecha DATETIME,
    Ord_Propina DECIMAL(5, 2),
    Mesa_ID INT(10),
    Mes_ID INT(10),
    TiC_ID INT(10),
    FOREIGN KEY (Mesa_ID) REFERENCES MESA (Mesa_ID),
    FOREIGN KEY (Mes_ID) REFERENCES MESERO (Mes_ID),
    FOREIGN KEY (TiC_ID) REFERENCES TIPO_CLIENTE (TiC_ID) 
);

CREATE TABLE Pedido (
    Ped_ID INT(10) PRIMARY KEY AUTO_INCREMENT,
    Ord_ID INT(10),
    Prod_ID INT(10),
    FOREIGN KEY (Ord_ID) REFERENCES ORDEN (Ord_ID),
    FOREIGN KEY (Prod_ID) REFERENCES PRODUCTO (Prod_ID)
);


