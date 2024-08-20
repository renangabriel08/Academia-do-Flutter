import 'package:database/models/database.dart';

Future<void> main() async {
  final Database database = Database();
  var mysqlConnection = await database.openConnection();

  print('--------------------Adicionando usuário--------------------');
  var result = await mysqlConnection.execute(
    'INSERT INTO alunos (nome) values (:name)',
    {'name': 'Renan Gabriel'},
  );

  print('${result.affectedRows} Rows afetadas');

  print('--------------------Listando todos usuários--------------------');
  var alunos = await mysqlConnection.execute('SELECT * FROM alunos');

  for (var aluno in alunos.rows.toList()) {
    print(aluno.assoc());
  }

  print('--------------------Listando usuário por ID--------------------');
  var aluno = await mysqlConnection.execute(
    'SELECT * FROM alunos WHERE id = :id',
    {'id': 1},
  );

  print(aluno.rows.first.assoc());

  //Fechando conexão
  mysqlConnection.close();
}
