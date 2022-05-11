import 'package:flutter/material.dart';
import 'package:message_client/calender_screeen.dart';
import 'package:message_client/contacts_screen.dart';
import 'package:message_client/inbox_screen.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        const InboxScreen(),
        const ContactsScreen(),
        const CalenderScreen(),
      ].elementAt(_index),
      //elementAt(index) will return the corresbonding [index]th widget :"D
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.email), label: 'Inbox'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Contacts'),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today), label: 'Calender'),
        ],
        // on taping on either screen it will  update the state and return the new widget
        onTap: (selctedIndex) => setState(() {
          _index = selctedIndex;
        }),
        currentIndex: _index,
      ),
    );
  }
}
