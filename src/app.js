const express = require('express');
const dayjs = require('dayjs');
const fs = require('node:fs/promises');


const app = express();
app.use(express.json());


app.use('/api', require('./routes/api'));


module.exports = app;