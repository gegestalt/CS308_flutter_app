import 'package:flutter/material.dart';
import 'package:frontend/utils/eventcard.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement homepage
    return Scaffold(
      appBar: AppBar(
        title: Text("Justicket"),
        actions: <Widget>[
          RawMaterialButton(
            onPressed: () {
              setState(() {
                Navigator.pushNamed(context, "/login");
              });
            },
            child: Text(
              "Login",
            ),
          ),
          RawMaterialButton(
            onPressed: () {
              setState(() {
                Navigator.pushNamed(context, "/signup");
              });
            },
            child: Text(
              "Sign Up",
            ),
          ),
        ],
      ),
      // body: Text("This is the home page!!!"),
      body: EventCard(
        eventDate: "24.11.2021",
        eventLocation: "Istanbul",
        eventName: "Sample Event",
        eventPerformer: "Enes",
        eventThumbnail:
            "https://image.shutterstock.com/shutterstock/photos/611045375/display_1500/stock-photo-crowd-at-concert-summer-music-festival-611045375.jpg",
        eventTime: "20.00",
      ),
    );
  }
}
