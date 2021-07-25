import 'package:agenda_crud/app/my_app.dart';
import 'package:flutter/material.dart';

class ContactList extends StatelessWidget {
  const ContactList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      body: ListView(),
    );
  }
}
