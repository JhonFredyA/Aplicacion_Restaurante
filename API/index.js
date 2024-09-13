const express = require('express')
const cors = require('cors')
const path = require('path')
const router = require('./router/router')

const app = express()
const PORT = 3000

app.use(cors())
app.use(express.json())
app.use('/',express.static(path.join(__dirname,'../Public')))

app.use(router)

app.listen(PORT, () => {
    console.log('Servidor corriendo en el puerto ', PORT);
})