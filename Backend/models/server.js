const express = require('express')
const cors = require('cors')
const path = require('path')
const router = require('../routers/router')

class Server {

    constructor() {
        this.app = express()
        this.port = 3000
        this.middlewares()
        this.routes()
    }

    middlewares() {
        this.app.use(cors())
        this.app.use(express.json())
        this.app.use('/',express.static(path.join(__dirname,'../../Frontend')))
    }

    routes() {
        this.app.use('/',router)
    }

    listen() {
        this.app.listen(this.port, () => {
            console.log('Servidor corriendo en el puerto ', this.port);
        })
    }
}

module.exports = Server