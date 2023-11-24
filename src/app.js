const express = require('express');
const mysql = require('mysql2');
const dns = require('dns');

dns.setDefaultResultOrder('ipv4first');
// dns.setDefaultResultOrder('verbatim');

const PORT = 3000;
const HOST = '0.0.0.0';

const app = express();
app.use(express.json());

const pool = mysql.createPool({
  host: 'db',
  user: 'root',
  password: 'ods1234',
  database: 'micro-ods',
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0,
});

// Testar a conexão usando o pool
pool.getConnection((err, connection) => {
  if (err) {
    console.error('Error connecting to MySQL:', err);
    return;
  }

  console.log('Connected to MySQL');

  // Você pode usar a conexão aqui, e depois liberá-la quando terminar.
  connection.release();
});

app.listen(PORT, HOST, () =>
  console.log(`Server running on http://${HOST}:${PORT}`),
);

// app.get('/objetivos', (req, res) => {
//   const queryObjetivos = 'SELECT * FROM objetivo';
//   const queryOds = 'SELECT DISTINCT codigo, descricao FROM ods';

//   pool.query(queryObjetivos, (err, resultadosObjetivos) => {
//     if (err) {
//       console.error('Error executing SELECT query for ObjetivosODS:', err);
//       return res.status(500).json({ error: 'Internal Server Error' });
//     }

//     pool.query(queryOds, (err, resultadosOds) => {
//       if (err) {
//         console.error('Error executing SELECT query for ods:', err);
//         return res.status(500).json({ error: 'Internal Server Error' });
//       }

//       res.json({
//         objetivos:
//           resultadosObjetivos.length > 0
//             ? resultadosObjetivos
//             : 'No objectives found',
//         ods: resultadosOds.length > 0 ? resultadosOds : 'No ods records found',
//       });
//     });
//   });
// });
