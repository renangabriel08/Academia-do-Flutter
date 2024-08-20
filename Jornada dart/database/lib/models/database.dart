import 'package:mysql_client/mysql_client.dart';

class Database {
  Future<MySQLConnection> openConnection() async {
    try {
      var conn = await MySQLConnection.createConnection(
        host: 'localhost',
        port: 3306,
        userName: 'root',
        password: 'root',
        databaseName: 'dart_mysql',
      );

      await conn.connect();

      return conn;
    } catch (e) {
      throw Exception('Erro ao conectar com o banco de dados');
    }
  }
}
