const mysql = require('mysql2/promise');

const connection = mysql.createPool({
    host: 'localhost', // Seu host do MySQL
    user: 'root', // Seu usuário do MySQL
    password: 'Calang01.', // Sua senha do MySQL
    database: 'Maincrm', // Nome do banco de dados criado anteriormente
    waitForConnections: true,
    connectionLimit: 10,
    queueLimit: 0
});

module.exports = connection;