import 'package:flutter/material.dart';
import 'package:frontend/utils/constants.dart';
import 'package:frontend/utils/eventcard.dart';
import 'package:frontend/models/event.dart';
import '../utils/eventslider.dart';
import '../utils/animatedeventcard.dart';

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
              Expanded(
                child: eventSlider(),
              ),
              // TODO: Add announcements, maybe?
              Expanded(
                child: Container(
                  child: Center(
                    child: Text("Announcements can come here!"),
                  ),
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
              return AnimatedEventCard(
                event: events[i],
              );
            },
          ),
        ],
      ),
    );
  }
}
