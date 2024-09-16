const { Router } = require('express')
const MySQL = require('../Libs/mysql')

const router = Router()

// Endpoint para registrar una orden
// http://localhost:3000/order/recordOrden
router.post('/recordOrder', async (req, res) => {
    try {
        const mySQL = new MySQL()
        const { mesero, tipoCliente, mesa, productos } = req.body
        // Guarda fecha y hora actual del registro
        const fecha = new Date() 
        const propina = 0.13
        // Convierte los datos recibidos en productos en un Array
        const productosArray = productos.split(',').map(id => id.trim()).filter(id => id.length > 0)
        // Ejecuta sentencia SQL para insertar datos de la orden
        const resultadoOrden = await mySQL.executeQuery('INSERT INTO Orden(Ord_Fecha,Ord_Propina,Mesa_ID,Mes_ID,TiC_ID) VALUES (?,?,?,?,?)',[fecha, propina, mesa, mesero, tipoCliente])
        // Obtiene el ID de la orden recién creada
        const ordenID = resultadoOrden.insertId
        // Crea un Array que contiene los pares de valores para cada producto
        const valoresPedido = productosArray.map(productoId => [ordenID, productoId])
        // Ejecuta la sentencia SQL para insetar los datos del pedido
        const resultadoPedido = await mySQL.executeQuery('INSERT INTO Pedido(Ord_ID, Prod_ID) VALUES ?', [valoresPedido])        
        
        // Verifica si los datos de ambas consultas se insertaron correctamente
        if (resultadoOrden.affectedRows > 0 && resultadoPedido.affectedRows > 0) {
            res.status(200).json({ mensaje: 'Registro de orden exitoso' })
        } else {
            res.status(500).json({ mensaje: 'Error al registrar la orden o pedido' })
        }
    } catch (error) {
        console.error(error)
        res.status(500).json({ mensaje: 'Error interno del servidor' })
    }
})

module.exports = router