import 'package:agenda_crud/app/domain/entities/contact.dart';
import 'package:agenda_crud/app/domain/services/contact_service.dart';
import 'package:agenda_crud/app/my_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
part 'contact_list_back.g.dart';

class ContactListBack = _ContactListBack with _$ContactListBack;

abstract class _ContactListBack with Store {
  var _service = GetIt.I.get<ContactService>();

//lista de contatos
  @observable
  Future<List<Contact>> list;

//método para atualizar lista de contatos
  @action
  refreshList([dynamic value]) {
    list = _service.find();
  }

  _ContactListBack() {
    refreshList();
  }

//método para chamar o form salvar / alter
  goToForm(BuildContext context, [Contact contact]) {
    Navigator.of(context)
        .pushNamed(MyApp.CONTAC_FORM, arguments: contact)
        .then((refreshList));
  }
//método para excluir

  remove(int id) {
    _service.remove(id);
    refreshList();
  }
}
