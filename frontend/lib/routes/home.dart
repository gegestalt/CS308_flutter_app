import 'package:flutter/material.dart';
import 'package:frontend/utils/constants.dart';
import 'package:frontend/utils/eventcard.dart';
import 'package:frontend/models/event.dart';
import '../utils/eventslider.dart';

List<Event> events = [
  Event(
    name: "Sample event 1",
    thumbnail:
        "https://image.shutterstock.com/image-photo/rave-concert-party-edm-festival-600w-1916911232.jpg",
    date: "11.2.2021",
    location: "Istnabul1",
    time: "11.00",
    performer: "Performer1",
  ),
  Event(
    name: "Sample event 2",
    thumbnail:
        "https://image.shutterstock.com/image-photo/confetti-falling-on-festive-concert-600w-1147630022.jpg",
    date: "11.2.2021",
    location: "Istnabul2",
    time: "11.00",
    performer: "Performer2",
  ),
  Event(
    name: "Sample event 3",
    thumbnail:
        "https://image.shutterstock.com/image-photo/confetti-falling-on-festive-concert-600w-1147630022.jpg",
    date: "11.2.2021",
    location: "Istnabul3",
    time: "11.00",
    performer: "Performer3",
  ),
  Event(
    name: "Sample event 4",
    thumbnail:
        "https://image.shutterstock.com/image-photo/close-musician-hands-cello-on-600w-23285866.jpg",
    date: "11.2.2021",
    location: "Istnabul4",
    time: "11.00",
    performer: "Performer4",
  ),
  Event(
    name: "Sample event 5",
    thumbnail:
        "https://image.shutterstock.com/image-photo/piano-flute-golden-shine-sheet-600w-516401134.jpg",
    date: "11.2.2021",
    location: "Istnabul5",
    time: "11.00",
    performer: "Performer5",
  ),
];

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
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
      body: ListView(
        children: [
          Row(
            children: [
              // Image slider for featured events:
              Expanded(child: eventSlider()),
              // TODO: Add announcements, maybe?
              Expanded(
                child: Container(
                  color: kPrimaryColor,
                ),
              ),
            ],
          ),

          SizedBox(
            height: 16,
          ),

          // List of events:
          GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 2,
                crossAxisCount: 3,
              ),
              itemCount: events.length,
              itemBuilder: (context, i) {
                return EventCard(
                  event: events[i],
                );
              }),
        ],
      ),
    );
  }
}
