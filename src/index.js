const express = require("express");
const cors = require("cors");
const mysql = require("mysql2/promise");

const app = express();
app.use(cors());
app.use(express.json());

const port = 3001;
app.listen(port, () => {
  console.log(`Server ready at: <http://localhost:${port}>`);
});

app.get("/api/movies", async (req, res) => {
  // Crear una conexión con la bbdd

  const connection = await getConnection();

  // Lanza una query

  const [result] = await connection.query("SELECT * FROM netflix.movies;");

  console.log(result);

  connection.end();

  // Devuelve los resultados
  res.json(result);
});

app.get("/api/actors", async (req, res) => {
  const result = await listActors();

  // Devuelve los resultados
  res.json(result);
});

