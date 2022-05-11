import 'package:flutter/material.dart';

import 'app_drawer.dart';

class CalenderScreen extends StatelessWidget {
  const CalenderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(title: const Text('Calender')),
      body: const Center(child: Text('Calender Screen')),
    );
  }
}
