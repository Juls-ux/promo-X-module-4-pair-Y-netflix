async function getConnection() {
  const connection = await mysql.createConnection({
    host: "127.0.0.1",
    port: 3306,
    user: "root",
    password: "19khorne83",
    database: "netflix",
  });

  await connection.connect();

  return connection;
}

async function listObras() {
  // Crear una conexión con la bbdd

  const connection = await getConnection();

  // Lanza una query

  const [result] = await connection.query(`
      SELECT *
      FROM obras o
        JOIN categorias c ON (o.categoria_id = c.categoria_id);`);

  connection.end();

  return result;
}

const obj = {
  getConnection,
  listActors,
};

module.exports = obj;
