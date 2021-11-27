import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'utils/constants.dart';
import 'routes/home.dart';
import 'routes/signup.dart';
import 'routes/login.dart';
import 'routes/eventdetails.dart';
import 'routes/usersettings.dart';
import 'models/user.dart';

// Can be retrieved from sharedpref or cache in initstate of MyApp
bool isLoggedIn = false;
User currentUser;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Justicket',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.secularOneTextTheme(),
      ),
      home: HomePage(),
      routes: {
        '/home': (context) => HomePage(),
        '/signup': (context) => SignUp(),
        '/login': (context) => LogIn(),
        '/event-details': (context) => EventDetails(),
        '/usersettings': (context) => UserSettings(),
      },
    );
  }
}
