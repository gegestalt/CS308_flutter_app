import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Drawer(
      child: ListView(
        children: [
          ListTile(
            title: Text('Menu'),
            onTap: () => Navigator.pushReplacementNamed(
              context,
              'home',
            ),
          ),
          ListTile(
            title: Text('User Settings'),
            onTap: () => Navigator.pushNamed(
              context,
              '/usersettings',
            ),
          ),
        ],
      ),
    ));
  }
}
