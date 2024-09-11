const { Router } = require('express')
const dataRouter = require('./data.router')
const orderRouter = require('./order.router')

const router = Router()

router.use( '/data', dataRouter )

router.use( '/order', orderRouter )

module.exports = router