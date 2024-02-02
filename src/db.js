import { createPool } from "mysql2/promise";

export const pool = createPool({
  host: "database",
  user: "root",
  password: "1234",
  port: 3306,
  database: "crudnodejsmysql",
});