const { Router } = require('express')
const MySQL = require('../Libs/mysql')

const router = Router()
const mySQL = new MySQL()

router.post('/recordOrder', async (req, res) => {
    try {
        console.log( req.body)
        const {mesero,tipo_cliente,mesa,propina} = req.body 
        //TODO: Generar una fecha y hora para introducir en la consulta
        const resultado = await mySQL.executeQuery('INSERT INTO Orden (Ord_Mesa,Ord_Propina,Mes_ID,TiC_ID) VALUES (?,?,?,?)',[mesa,propina,mesero,tipo_cliente])
        //TODO: Verificar resultado
        console.log(resultado.affectedRows) 
        
        
    } catch (error) {
        console.error(error);
    }
})

module.exports = router