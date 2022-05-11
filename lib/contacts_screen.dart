import 'package:flutter/material.dart';
import 'package:message_client/app_drawer.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text(
          'Contacts Screen',
        ),
      ),
      body: const Center(
        child: Text('Contacts'),
      ),
    );
  }
}
