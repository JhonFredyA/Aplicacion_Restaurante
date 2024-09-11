const { Router } = require('express')
const { recordOrder } = require('../controllers/order.controller')

const router =  Router()

router.post( '/recordOrder', recordOrder )

module.exports = router