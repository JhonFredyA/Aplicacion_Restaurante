const { Router } = require('express')
const MySQL = require('../Libs/mysql')

const mySQL = new MySQL()
const router = Router()

router.get('/getData', async ( req, res ) => {
    try {
        const meseros = await mySQL.executeQuery('SELECT * FROM Mesero')
        const tipoCliente = await mySQL.executeQuery('SELECT * FROM Tipo_Cliente')
        const productos = await mySQL.executeQuery('SELECT * FROM Producto')
        res.json({
            'meseros': meseros,
            'tipoCliente': tipoCliente,
            'productos': productos
        })
    } catch (error) {
        console.error(error);
    }
})

module.exports = router