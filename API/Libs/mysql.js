const mysql = require('mysql')

class MySQL {

    constructor() {
        this.pool = mysql.createPool({
            host: 'localhost',
            user: 'root',
            database: 'BBDD_Restaurante',
            connectionLimit: 10
        })

        this.pool.getConnection((err, connection) => {
            if (err) {
                console.error('Error al conectar con la base de datos: ', err);
            } else {
                console.log('Conexión a la base de datos establecida');
                connection.release()
            }
        })
    }

    executeQuery(query, params) {
        return new Promise((resolve, reject) => {
            this.pool.query(query, params, (err, results) => {
                if (err) {
                    return reject(err)
                }
                resolve(results)
            })
        })
    }
}

module.exports = MySQL