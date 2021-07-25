import 'package:agenda_crud/app/database/script.dart';
import 'package:agenda_crud/app/my_app.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ContactList extends StatelessWidget {
  const ContactList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<List<Map<String, dynamic>>> _buscar() async {
      String path = join(await getDatabasesPath(), "banco");
      Database db = await openDatabase(
        path,
        version: 1,
        onCreate: (db, v) {
          db.execute(createTable);
          db.execute(insert1);
          db.execute(insert2);
          db.execute(insert3);
        },
      );
      return db.query('contact');
    }

    return FutureBuilder(
      future: _buscar(),
      builder: (context, futuro) {
        if (futuro.hasData) {
          var lista = futuro.data;
          return Scaffold(
            appBar: AppBar(
              title: Text('Lista de Contato'),
              actions: [
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    Navigator.of(context).pushNamed(MyApp.CONTAC_FORM);
                  },
                )
              ],
            ),
            body: ListView.separated(
              separatorBuilder: (context, index) => Divider(),
              itemCount: lista.length,
              itemBuilder: (context, index) {
                var contato = lista[index];
                var avatar = CircleAvatar(
                  backgroundImage: NetworkImage(contato['url_avatar']),
                );
                return ListTile(
                  leading: avatar,
                  title: Text(contato['nome']),
                  subtitle: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(contato['email']),
                      Text(contato['telefone']),
                    ],
                  ),
                  trailing: Container(
                    width: 100,
                    child: Row(
                      children: [
                        IconButton(icon: Icon(Icons.edit), onPressed: null),
                        IconButton(icon: Icon(Icons.delete), onPressed: null)
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        } else {
          return Scaffold();
        }
      },
    );
  }
}
