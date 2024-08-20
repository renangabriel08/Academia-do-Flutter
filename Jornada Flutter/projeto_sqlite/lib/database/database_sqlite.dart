import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseSqLite {
  Future<Database> openConnection() async {
    var databasesPath = await getDatabasesPath();
    var databaseFinalPath = join(databasesPath, 'SQLITE_PROJECT');

    return await openDatabase(
      databaseFinalPath,
      version: 1,

      //Chamado sempre que executa o aplicativo
      onConfigure: (db) async {
        await db.execute('PRAGMA foreign_keys = ON');
      },

      //Chamado no momento de criação do banco de dados, primeira vez que carrega o aplicativo
      onCreate: (Database db, int version) {
        final batch = db.batch();

        batch.execute('''
          create table teste (
            id Integer primary key autoincrement,
            nome varchar(200)
          )
        ''');

        batch.commit();
      },

      //Chamado quando ouver uma alteração incremental no version (1 -> 2)
      onUpgrade: (Database db, int oldVersion, int newVersion) {
        final batch = db.batch();

        if (oldVersion == 1) {
          batch.execute('''
            create table produto (
              id Integer primary key autoincrement,
              nome varchar(200)
            )
          ''');
        }

        batch.commit();
      },

      //Chamado quando ouver uma alteração decremental no version (2 -> 1)
      onDowngrade: (Database db, int oldVersion, int newVersion) {
        final batch = db.batch();

        if (oldVersion == 2) {
          batch.execute('''
            drop table produto;
          ''');
        }

        batch.commit();
      },
    );
  }
}
