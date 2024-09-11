const { response } = require('express')
const MySQL = require('../libs/mysql')

const mySQL = new MySQL()

const getData = async ( req, res = response ) => {
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
}

module.exports = {
    getData
}