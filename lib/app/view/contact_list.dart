import 'package:agenda_crud/app/my_app.dart';
import 'package:flutter/material.dart';

class ContactList extends StatelessWidget {
  const ContactList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final lista = [
      {
        'nome': 'Pietro',
        'telefone': '(11)9 9956-3621',
        'avatar':
            'https://cdn.pixabay.com/photo/2013/07/13/10/07/man-156584_960_720.png'
      },
      {
        'nome': 'Maite',
        'telefone': '(11)9 9953-3333 ',
        'avatar':
            'https://cdn.pixabay.com/photo/2021/07/08/07/23/child-6396103_960_720.png'
      },
      {
        'nome': 'Hortencia',
        'telefone': '(11)9 9666-6666',
        'avatar':
            'https://cdn.pixabay.com/photo/2021/07/11/07/12/woman-6403071_960_720.png'
      }
    ];
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
            backgroundImage: NetworkImage(contato['avatar']),
          );
          return ListTile(
            leading: avatar,
            title: Text(contato['nome']),
            subtitle: Text(contato['telefone']),
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
  }
}
