const { Router } = require('express')
const dataRouter = require('./data.router')
const orderRouter = require('./order.router')

const router = Router()
// Endpoint para ejecutar operaciones relacionadas con los datos
router.use( '/data', dataRouter )

// Endpoint para ejecutar operaciones relacionadas con las ordenes
router.use( '/order', orderRouter )

module.exports = router