const { Router } = require('express')
const MySQL = require('../Libs/mysql')

const router = Router()

// Obtiene los datos necesarios para el registro de ordenes
// http://localhost:3000/data/getData
router.get('/getData', async ( req, res ) => {
    try {
        const mySQL = new MySQL()
        // Ejecuta las consultas para obtener los datas de cada tabla en específico
        const meseros = await mySQL.executeQuery('SELECT * FROM Mesero')
        const tipoCliente = await mySQL.executeQuery('SELECT * FROM Tipo_Cliente')
        const productos = await mySQL.executeQuery('SELECT * FROM Producto')
        const mesas = await mySQL.executeQuery('SELECT * FROM Mesa')
        
        res.status(200).json({
            'meseros': meseros,
            'tiposCliente': tipoCliente,
            'productos': productos,
            'mesas': mesas
        })
    } catch (error) {
        console.error(error);
        res.status(500).json({ mensaje: 'Error interno del servidor' })
    }
})

module.exports = router