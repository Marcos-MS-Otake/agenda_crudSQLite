import 'package:agenda_crud/app/domain/entities/contact.dart';
import 'package:agenda_crud/app/domain/exception/domain_layer_exception.dart';
import 'package:agenda_crud/app/domain/interfaces/contact_dao.dart';
import 'package:get_it/get_it.dart';

class ContactService {
  var _dao = GetIt.I.get<ContactDAO>();

//vamos salvar/alterar/remover/listar os contatos
  save(Contact contact) {
    validateName(contact.nome);
    validateEmail(contact.email);
    validatePhone(contact.telefone);
    _dao.save(contact);
  }

  remove(int id) {
    _dao.remove(id);
  }

  Future<List<Contact>> find() async {
    return await _dao.find();
  }

//validações em métodos seprados ficam melhores de serem análisados
  validateName(String name) {
    var min = 3;
    var max = 50;
    if (name == null) {
      throw new DomainLayerException(cause: 'O nome é obrigatório.');
    } else if (name.length < min) {
      throw new DomainLayerException(
          cause: 'O nome deve possuir pelo menos $min caracteres.');
    } else if (name.length > max) {
      throw new DomainLayerException(
          cause: 'O nome deve possuir no maximo $max caracteres.');
    }
  }
}

//validar o email para conter o @
validateEmail(String email) {
  if (email == null) {
    throw new DomainLayerException(cause: 'O e-mail é obrigatório');
  } else if (!email.contains('@')) {
    throw new DomainLayerException(cause: 'O e-mail deve possuir @');
  }
}

// Validar o telefone e gerar mascará
validatePhone(String phone) {
  //formato esperado => (99) 9 9999-9999
  var format = RegExp(r'^\([1-9]{2}\) [9] [6-9]{1}[0-9]{3}\-[0-9]{4}$');
  if (phone == null) {
    throw new DomainLayerException(cause: 'O telefone é obrigatório.');
  } else if (!format.hasMatch(phone)) {
    throw new DomainLayerException(
        cause: 'O formato deve ser igual assim (99) 9 9999-9999.');
  }
}
