import 'package:flutter/material.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:frontend/utils/constants.dart';
import 'package:frontend/models/event.dart';
import '../utils/selecttickets.dart';

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
    bool isSmallScreen = false;
    double scaffoldSize = media.width - 250;

    if (media.width < 720) isSmallScreen = true;

    return Scaffold(
      body: ListView(
        padding: EdgeInsets.fromLTRB(100, 100, 100, 50),
        shrinkWrap: true,
        children: [
          // Image, name, date, location:
          isSmallScreen ? Image.network(widget.event.thumbnail) : Container(),
          Row(
            children: [
              !isSmallScreen
                  ? Expanded(
                      flex: 3,
                      child: Image.network(widget.event.thumbnail),
                    )
                  : Container(),
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

          Wrap(
            children: [
              Container(
                height: 500,
                width: isSmallScreen ? media.width : scaffoldSize * (2 / 3),
                child: TicketSearch(event: widget.event),
              ),
              !isSmallScreen
                  ? SizedBox(
                      width: 20,
                    )
                  : Container(),
              Container(
                height: 500,
                width: isSmallScreen ? media.width : scaffoldSize * (1 / 3),
                child: SelectedTickets(),
              ),
            ],
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
            fontWeight: FontWeight.w500,
            fontSize: 15,
            color: kPrimaryColor,
          ),
        ),
      ),
    );
  }
}
