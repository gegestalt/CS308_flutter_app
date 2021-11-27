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

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    bool smallScreen = false;

    // Effective integer division, convert the result to int
    final crossAxisCount = media.width ~/ 400;
    if (media.width < 550) smallScreen = true;

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
          RawMaterialButton(
            onPressed: () {
              setState(() {
                Navigator.pushNamed(context, "/usersettings");
              });
            },
            child: Text(
              "Settings",
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          // Slider on top if the screen is small:
          smallScreen ? eventSlider() : Container(),

          // If the screen is not small, slider and announcements in a row:
          Row(
            children: [
              // Image slider for featured events:
              !smallScreen
                  ? Expanded(
                      child: eventSlider(),
                    )
                  : Container(),

              // Announcements list:
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(10),
                  height: 300,
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
