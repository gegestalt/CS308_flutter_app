import 'package:flutter/material.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:frontend/utils/constants.dart';
import 'package:frontend/utils/eventcard.dart';
import 'package:frontend/models/event.dart';

class EventDetails extends StatefulWidget {
  const EventDetails({this.event});

  final Event event;

  @override
  _EventDetailsState createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    return Scaffold(
      body: ListView(
        padding: EdgeInsets.fromLTRB(100, 100, 100, 50),
        shrinkWrap: true,
        children: [
          // Image, name, date, location:
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Image.network(widget.event.thumbnail),
              ),
              Expanded(
                flex: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        widget.event.name,
                        style: TextStyle(fontSize: 45),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.location_pin,
                          color: kPrimaryColor,
                        ),
                        Flexible(
                          child: Text(
                            widget.event.location,
                            softWrap: true,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.date_range,
                          color: kPrimaryColor,
                        ),
                        Flexible(
                          child: Text(
                            widget.event.date,
                            softWrap: true,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(
            height: 25,
          ),

          // Description, details
          DefaultTabController(
            length: 2,
            child: Container(
              height: 200,
              child: Scaffold(
                appBar: TabBar(
                  indicatorColor: kPrimaryColor,
                  tabs: [
                    CustomTab(text: "Event Details"),
                    CustomTab(text: "Ticket Prices"),
                  ],
                ),
                body: TabBarView(
                  children: [
                    ExpandableText(
                      widget.event.rules,
                      expandText: 'Show More',
                      collapseText: 'Show Less',
                      maxLines: 2,
                      linkColor: Colors.blue,
                    ),
                    ExpandableText(
                      widget.event.prices,
                      expandText: 'Show More',
                      collapseText: 'Show Less',
                      maxLines: 1,
                      linkColor: Colors.blue,
                    ),
                  ],
                ),
              ),
            ),
          ),

          SizedBox(
            height: 15,
          ),

          Container(
            height: 500,
            child: Scaffold(
              body: Row(
                children: [
                  // Search ticket and buy ticket:
                  Text("first"),
                  Text("second"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTab extends StatelessWidget {
  const CustomTab({this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Center(
        child: Text(
          this.text,
          style: TextStyle(
            fontSize: 15,
            color: kPrimaryColor,
          ),
        ),
      ),
    );
  }
}
