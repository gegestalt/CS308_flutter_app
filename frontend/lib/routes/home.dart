import 'package:flutter/material.dart';
import 'package:frontend/utils/constants.dart';
import 'package:frontend/models/event.dart';
import '../models/announcement.dart';
import '../utils/eventslider.dart';
import '../utils/animatedeventcard.dart';
import '../utils/eventcard.dart';
import '../utils/announcementtile.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSmallScreen = false;
  List<Widget> eventWidgets = [];

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    // Effective integer division, convert the result to int
    final crossAxisCount = media.width ~/ 400;

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

              // Announcements list:
              Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: announcements.length,
                  itemBuilder: (context, i) {
                    return AnnouncementTile(
                      announcement: announcements[i],
                    );
                  },
                  separatorBuilder: (context, i) => Divider(),
                ),
              ),
            ],
          ),

          SizedBox(
            height: 10,
          ),

          // List of events:
          crossAxisCount > 0
              ? GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 2,
                    crossAxisCount: crossAxisCount,
                  ),
                  itemCount: events.length,
                  itemBuilder: (context, i) {
                    return AnimatedEventCard(
                      event: events[i],
                    );
                  },
                )
              : Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    for (var e in events)
                      SmallEventCard(
                        event: e,
                      ),
                  ],
                ),
        ],
      ),
    );
  }
}
