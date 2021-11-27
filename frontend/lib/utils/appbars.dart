import 'package:flutter/material.dart';

AppBar initialAppbar(BuildContext context) {
  return AppBar(title: Text("Justicket"), actions: <Widget>[
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
        ))
  ]);
}

AppBar finalAppbar(BuildContext context) {
  return AppBar(
    title: Text("Justicket"),
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
