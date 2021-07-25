import 'package:agenda_crud/app/database/sqlite/dao/contact_dao_impl.dart';
import 'package:agenda_crud/app/domain/entities/contact.dart';
import 'package:agenda_crud/app/my_app.dart';
import 'package:flutter/material.dart';

class ContactList extends StatelessWidget {
  const ContactList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<List<Contact>> _buscar() async {
      return ContactDAOImpl().find(); //retorna a consulta da tabela criada
    }

    //Retorna os dados que estão no futuro
    return FutureBuilder(
      //chama nossa função de criação do BD
      future: _buscar(),

      //parametros obrigatórios context, e uma variavel
      builder: (context, futuro) {
        // verifica se contem dados
        if (futuro.hasData) {
          List<Contact> lista =
              futuro.data; // recebe a lista futura assim facilita a manipulação
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
                  backgroundImage: NetworkImage(contato.urlAvatar),
                );
                return ListTile(
                  leading: avatar,
                  title: Text(contato.nome),
                  subtitle: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(contato.telefone),
                      Text(contato.email),
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
