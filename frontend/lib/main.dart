import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'utils/constants.dart';
import 'routes/home.dart';
import 'routes/signup.dart';
import 'routes/login.dart';
import 'routes/eventdetails.dart';
import 'routes/usersettings.dart';
import 'routes/checkout.dart';
import 'routes/payment.dart';
import 'models/user.dart';
import 'routes/feedbackpage.dart';

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
      /*
      home: CheckOut(
        eventname: "deneme",
        date: "2021-09-09",
        type: "Loca",
        price: "100",
        number: "2",
        total: "200",
      ),
      */
      home: HomePage(),
      routes: {
        '/home': (context) => HomePage(),
        '/signup': (context) => SignUp(),
        '/login': (context) => LogIn(),
        '/event-details': (context) => EventDetails(),
        '/usersettings': (context) => UserSettings(),
        '/checkout': (context) => CheckOut(),
        'payment': (context) => Payment(),
        '/feedbackpage': (context) => FeedbackPage()
      },
    );
  }
}
