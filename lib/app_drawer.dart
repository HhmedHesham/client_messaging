import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: const [
          UserAccountsDrawerHeader(
            accountName: Text('Ahmed Hesham'),
            accountEmail: Text('heshama793@gmail.com'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://avatars.githubusercontent.com/u/57070673?v=4'),
            ),
          ),
          ListTile(
            leading: Icon(
              FontAwesomeIcons.inbox,
            ),
            title: Text('Inbox'),
            trailing: Chip(
              label: Text('10'),
            ),
          ),
          ListTile(
            leading: Icon(
              FontAwesomeIcons.trash,
            ),
            title: Text('Trash'),
          ),
          ListTile(
            leading: Icon(
              FontAwesomeIcons.gear,
            ),
            title: Text('Settings'),
          ),
        ],
      ),
    );
  }
}
