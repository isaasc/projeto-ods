const express = require('express');
const mysql = require('mysql2');

const PORT = 3000;
const HOST = '0.0.0.0';

const connection = mysql.createConnection({
  host: 'db',
  user: 'root',
  password: 'ods1234',
  database: 'ods',
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0,
});

connection.connect((err) =>
  err
    ? console.log('Error connecting to MySQL:', err)
    : console.log('Connected to MySQL'),
);

const app = express();
app.use(express.json());

app.listen(PORT, HOST, () =>
  console.log(`Server running on http://${HOST}:${PORT}`),
);
