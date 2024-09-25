const express = require('express');
const cors = require('cors');
const usersRoute = require('./src/routes/users');


const app = express();


app.use(cors());
app.use(express.json());

app.use('/users', usersRoute);


module.exports = app;