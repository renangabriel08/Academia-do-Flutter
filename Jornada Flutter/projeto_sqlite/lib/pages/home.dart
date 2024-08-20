import 'package:flutter/material.dart';
import 'package:projeto_sqlite/database/database_sqlite.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    _database();
  }

  _database() async {
    // final database = await DatabaseSqLite().openConnection();

    // database.insert('teste', {'nome': 'Renan'});
    // database.delete('teste', where: 'nome = ?', whereArgs: ['Renan']);
    // database.update('teste', {'nome': 'Renan'}, where: 'id=?', whereArgs: [1]);
    // var result = await database.query('teste');
    // print(result);

    // database.rawInsert('insert into teste values(null, ?)', ['Renan']);
    // database.rawDelete('delete from teste where id = ?', [1]);
    // database.rawUpdate('update teste set nome = ? where id = ?', ['Renan', 1]);
    // var result = database.rawQuery('select * from teste');
    // print(result);
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
