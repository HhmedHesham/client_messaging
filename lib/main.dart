import 'package:flutter/material.dart';
import 'package:message_client/app.dart';

void main() {
  runApp(const ClientMessaging());
}

class ClientMessaging extends StatelessWidget {
  const ClientMessaging({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const App(),
    );
  }
}
