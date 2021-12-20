import 'package:flutter/material.dart';
import '../main.dart';
import 'constants.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:html' as html;
import 'package:flutter_html/flutter_html.dart';
import 'package:shared_preferences/shared_preferences.dart';


AppBar selectAppbar(BuildContext context) {
  if (isLoggedIn)
    return finalAppbar(context);
  else
    return initialAppbar(context);
}

AppBar initialAppbar(BuildContext context) {
  return AppBar(
    title: Text("Justicket"),
    backgroundColor: kPrimaryColor,
    automaticallyImplyLeading: false,
    leading: GestureDetector(child: Icon(Icons.menu)),
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
    backgroundColor: kPrimaryColor,
    automaticallyImplyLeading: false,
    actions: <Widget>[
      RawMaterialButton(
        onPressed: () async {
          final url =
              "https://form.jotform.com/Demirci_Emre/justicket-evaluation-form";
          html.window.open(url, 'new_tab');
        },
        child: Text(
          "Rate Events",
        ),
      ),
      RawMaterialButton(
        onPressed: () {
          Navigator.pushNamed(context, "/lucky");
        },
        child: Text(
          "I am feeling Lucky",
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
          Navigator.pushNamed(context, "/about");
        },
        child: Text(
          "About Us",
        ),
      ),
      RawMaterialButton(
        onPressed: () {
          setPrefs();
          Navigator.pushNamed(context, "/home");
        },
        child: Text(
          "Sign Out",
        ),
      ),
    ],
  );
}

Future setPrefs() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.clear();

  isLoggedIn = false;
  currentUser = null;
}
