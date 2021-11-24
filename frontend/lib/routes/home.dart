import 'package:flutter/material.dart';
import 'package:frontend/utils/eventcard.dart';
import 'package:frontend/models/event.dart';

List<Event> events = [
  Event(
    eventName: "Sample event 1",
    eventThumbnail:
        "https://image.shutterstock.com/image-photo/rave-concert-party-edm-festival-600w-1916911232.jpg",
    eventDate: "11.2.2021",
    eventLocation: "Istnabul1",
    eventTime: "11.00",
    eventPerformer: "Performer1",
  ),
  Event(
    eventName: "Sample event 2",
    eventThumbnail:
        "https://image.shutterstock.com/image-photo/confetti-falling-on-festive-concert-600w-1147630022.jpg",
    eventDate: "11.2.2021",
    eventLocation: "Istnabul2",
    eventTime: "11.00",
    eventPerformer: "Performer2",
  ),
  Event(
    eventName: "Sample event 3",
    eventThumbnail:
        "https://image.shutterstock.com/image-photo/confetti-falling-on-festive-concert-600w-1147630022.jpg",
    eventDate: "11.2.2021",
    eventLocation: "Istnabul3",
    eventTime: "11.00",
    eventPerformer: "Performer3",
  ),
  Event(
    eventName: "Sample event 4",
    eventThumbnail:
        "https://image.shutterstock.com/image-photo/close-musician-hands-cello-on-600w-23285866.jpg",
    eventDate: "11.2.2021",
    eventLocation: "Istnabul4",
    eventTime: "11.00",
    eventPerformer: "Performer4",
  ),
  Event(
    eventName: "Sample event 5",
    eventThumbnail:
        "https://image.shutterstock.com/image-photo/piano-flute-golden-shine-sheet-600w-516401134.jpg",
    eventDate: "11.2.2021",
    eventLocation: "Istnabul5",
    eventTime: "11.00",
    eventPerformer: "Performer5",
  ),
];

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
