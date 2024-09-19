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



/* PARA PRESENTAR */
SELECT 
    Orden.Ord_ID AS id,
    Orden.Ord_Fecha AS Fecha,
    mesa.Mesa_Nombre AS mesa,
    Orden.Ord_Propina AS propina,
    Mesero.Mes_Nombre AS mesero,
    Tipo_Cliente.TiC_Tipo AS tipo_de_cliente,
    producto.Prod_Nombre AS producto
FROM 
    Orden
INNER JOIN Mesero ON Orden.Mes_ID = Mesero.Mes_ID
INNER JOIN pedido on orden.Ord_ID= pedido.Ord_ID
INNER join producto on pedido.Prod_ID = producto.Prod_ID
INNER JOIN Tipo_Cliente ON Orden.TiC_ID = Tipo_Cliente.TiC_ID 
INNER JOIN mesa on orden.Mesa_ID= Mesa.Mesa_ID
WHERE Orden.Ord_ID= 1


SELECT * from orden where ord_id = 1

SELECT 
    Orden.Ord_Id
