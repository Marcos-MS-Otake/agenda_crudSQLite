import 'package:flutter/material.dart';

class ContactForm extends StatelessWidget {
  const ContactForm({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      centerTitle: true,
      title: Text('Lista de Contato'),  
      ),
       body: ListView(),
    );
  }
}