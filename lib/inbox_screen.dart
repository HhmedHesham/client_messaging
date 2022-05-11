import 'package:flutter/material.dart';
import 'package:message_client/message_list.dart';

import 'app_drawer.dart';

class InboxScreen extends StatelessWidget {
  const InboxScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      // explicit indicate the number of tabs in the TabBar
      length: 2,
      child: Scaffold(
        drawer: const AppDrawer(),
        appBar: AppBar(
          title: const Text('Inbox'),
          bottom: const TabBar(
            tabs: [
              Tab(
                text: 'Important',
              ),
              Tab(
                text: 'Others',
              ),
            ],
          ),
        ),
        // each Widget refer to the corresponding Tab in the TabBar
        body: const TabBarView(
          children: [
            MessageList(status: 'Important'),
            MessageList(status: 'Other'),
          ],
        ),
      ),
    );
  }
}
