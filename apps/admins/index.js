const express = require('express')
const app = express();
const dotenv = require('dotenv');
const routes = require('./routes');
const mongoose = require('mongoose');

dotenv.config({path: process.env.NODE_ENV == 'development' ? './.env.dev' : './.env'});

app.use(express.json());
app.use('/', routes);

app.listen(process.env.PORT);

mongoose.connect(process.env.DATABASE_URL);