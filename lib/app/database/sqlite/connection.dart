import 'package:agenda_crud/app/database/sqlite/script.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Connection {
  static Database _db;

  static Future<Database> get() async {
    if (_db == null) {
      // join esta na lib path do pubspec variavel path recebe o caminho do BD
      var path = join(await getDatabasesPath(), 'banco_contatos');
      //abertura do banco de dados
      _db = await openDatabase(
        path,
        version: 1,
        onCreate: (db, v) {
          db.execute(createTable); //executa o script e cria a tabela
          db.execute(insert1); //executa o script e insere dados na tabela
          db.execute(insert2);
          db.execute(insert3);
        },
      );
    }
    return _db;
  }
}
