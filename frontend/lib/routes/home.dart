import 'package:flutter/material.dart';
import 'package:frontend/main.dart';
import 'package:frontend/models/navigation_drawer_widget.dart';
import 'package:frontend/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:frontend/models/event.dart';
import '../models/announcement.dart';
import '../utils/eventslider.dart';
import '../utils/animatedeventcard.dart';
import '../utils/eventcard.dart';
import '../utils/announcementtile.dart';
import '../utils/appbars.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSmallScreen = false;
  List<Event> events = [];
  List<Event> featuredEvents = [];

  Future getEvents(String type) async {
    // Local host for django and endpoint for homepage
    final url = Uri.parse('http://127.0.0.1:8000/api/homepage');

    final requestBody = {
      "email": isLoggedIn ? currentUser.email : "",
      "type": type,
    };

    try {
      final response = await http.post(
        url,
        body: requestBody,
        encoding: Encoding.getByName("utf-8"),
      );

      // Succesfull transmission
      if (response.statusCode >= 200 && response.statusCode < 300) {
        print("Transmission was succesfull!!!");

        if (type == "normal") {
          final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
          events = parsed.map<Event>((json) => Event.fromJson(json)).toList();

          setState(() {});
        } else if (type == "featured") {
          final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
          print("parsed featured: ");
          print(parsed);
          featuredEvents =
              parsed.map<Event>((json) => Event.fromJson(json)).toList();

          print(featuredEvents);
          setState(() {});
        }
      }
    } catch (error) {
      print("Error: $error");

      // An error occured, please try again later.
    }
  }

  @override
  void initState() {
    getEvents("featured");
    getEvents("normal");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    bool smallScreen = false;

    // Effective integer division, convert the result to int
    final crossAxisCount = media.width ~/ 400;
    if (media.width < 550) smallScreen = true;

    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: selectAppbar(context),
      body: ListView(
        children: [
          // Slider on top if the screen is small:
          smallScreen ? eventSlider(featuredEvents) : Container(),

          // If the screen is not small, slider and announcements in a row:
          Row(
            children: [
              // Image slider for featured events:
              !smallScreen
                  ? Expanded(
                      child: eventSlider(featuredEvents),
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
