import 'package:flutter/material.dart';
import 'package:frontend/routes/upcomingevents.dart';
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
      home: HomePage(),
      /*
      home: CheckOut(
        eventname: "Sample",
        date: "1222",
        type: "loca",
        number: "2",
        price: "100",
        total: "200",
      ),
      */
      routes: {
        '/home': (context) => HomePage(),
        '/signup': (context) => SignUp(),
        '/login': (context) => LogIn(),
        '/event-details': (context) => EventDetails(),
        '/usersettings': (context) => UserSettings(),
        '/checkout': (context) => CheckOut(),
        'payment': (context) => Payment(),
        '/feedbackpage': (context) => FeedbackPage(),
        '/upcomingEvents':(context) => UpcomingEventsPage()
      },
    );
  }
}
