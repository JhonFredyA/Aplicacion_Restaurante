const { response } = require('express')
const MySQL = require('../libs/mysql')

const mySQL = new MySQL()

const recordOrder = async( req, res = response ) => {
    try {
        
    } catch (error) {
        console.error(error);
        
    }
}

module.exports = {
    recordOrder
}