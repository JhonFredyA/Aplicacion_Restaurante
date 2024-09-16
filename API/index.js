const express = require('express')
const cors = require('cors')
const path = require('path')
const router = require('./router/router')

const app = express()
const PORT = 3000

app.use(cors())
// Implementa Middleware para recibir datos del front en formato JSON
app.use(express.json())
// Sirve archivos estáticos para mostrar la interfaz de usuario
app.use('/',express.static(path.join(__dirname,'../Public')))
app.use(express.urlencoded({ extended: true }))
// Implementa rutas establecidas dentro de la API
app.use(router)

app.listen(PORT, () => {
    console.log('Servidor corriendo en el puerto ', PORT);
})