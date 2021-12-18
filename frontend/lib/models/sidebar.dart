import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/main.dart';
import 'package:frontend/routes/login.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(currentUser.name),
            accountEmail: Text(currentUser.email),
          ),
          ListTile(),
          ListTile(
            title: Text('User Settings'),
            subtitle: Text('View your user settings'),
            leading: Icon(Icons.settings_accessibility),
            onTap: () => Navigator.pushNamed(
              context,
              '/usersettings',
            ),
          ),
          ListTile(
            title: Text('Notifications'),
            leading: Icon(Icons.notification_add),
            onTap: () => Navigator.pushNamed(
              context,
              '/notifications',
            ),
          ),
          ListTile(
            title: Text('Purchase'),
            subtitle: Text('Purchase desired tickets from here...'),
            leading: Icon(Icons.wallet_giftcard_rounded),
            onTap: () => Navigator.pushNamed(
              context,
              '/notifications',
            ),
          )
        ],
      ),
    ));
  }
}
