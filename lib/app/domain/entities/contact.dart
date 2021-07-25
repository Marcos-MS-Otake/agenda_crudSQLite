import 'package:flutter/material.dart';

class Contact {
  int id;
  String nome;
  String telefone;
  String email;
  String urlAvatar;

  Contact({
    @required this.id,
    @required this.nome,
    @required this.telefone,
    @required this.email,
    @required this.urlAvatar,
  });
}

teste() {
  var contato = Contact(
    id: null,
    nome: null,
    telefone: null,
    email: null,
    urlAvatar: null,
  );
}
