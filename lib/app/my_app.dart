import 'package:agenda_crud/app/view/contact_form.dart';
import 'package:flutter/material.dart';
import 'view/contact_list.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/': (context) => ContactList(),
        'contact-form': (context) => ContactForm(),
      },
    );
  }
}
