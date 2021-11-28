import 'package:flutter/material.dart';
import '../main.dart';
import 'package:frontend/models/navigation_drawer_widget.dart';
import 'package:flutter/widgets.dart';

AppBar selectAppbar(BuildContext context) {
  if (isLoggedIn)
    return finalAppbar(context);
  else
    return initialAppbar(context);
}

AppBar initialAppbar(BuildContext context) {
  return AppBar(
    title: Text("Justicket"),
    automaticallyImplyLeading: false,
    leading: GestureDetector(
        onTap: () {
          NavigationDrawerWidget();
        },
        child: Icon(Icons.menu)),
    actions: <Widget>[
      RawMaterialButton(
        onPressed: () {
          Navigator.pushNamed(context, "/login");
        },
        child: Text(
          "Login",
        ),
      ),
      RawMaterialButton(
        onPressed: () {
          Navigator.pushNamed(context, "/signup");
        },
        child: Text(
          "Sign Up",
        ),
      )
    ],
  );
}

AppBar finalAppbar(BuildContext context) {
  return AppBar(
    title: Text("Justicket"),
    automaticallyImplyLeading: false,
    actions: <Widget>[
      RawMaterialButton(
        onPressed: () {
          Navigator.pushNamed(context, "/notifications");
        },
        child: Text(
          "Notifications",
        ),
      ),
      RawMaterialButton(
          onPressed: () {
            Navigator.pushNamed(context, "/filter");
          },
          child: Text(
            "Filter",
          )),
      RawMaterialButton(
        onPressed: () {
          Navigator.pushNamed(context, "/usersettings");
        },
        child: Text(
          "Settings",
        ),
      ),
      RawMaterialButton(
        onPressed: () {
          Navigator.pushNamed(context, "/search");
        },
        child: Text(
          "Search",
        ),
      ),
    ],
  );
}
