import 'package:flutter/material.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:frontend/utils/appbars.dart';
import 'package:frontend/utils/constants.dart';
import 'package:frontend/models/event.dart';

class EventDetails extends StatefulWidget {
  const EventDetails({this.event});

  final Event event;

  @override
  _EventDetailsState createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  String ticketDate = "Select Date";
  String ticketNumber = "1";
  String ticketType = "Please Select";

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    bool isSmallScreen = false;
    double scaffoldSize = media.width - 250;

    if (media.width < 720) isSmallScreen = true;

    return Scaffold(
      appBar: selectAppbar(context),
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
                height: 300,
                width: isSmallScreen ? media.width : scaffoldSize * (2 / 3),
                // Search tickets box:
                child: Scaffold(
                  appBar: AppBar(
                    automaticallyImplyLeading: false,
                    title: Text("Search Tickets"),
                  ),
                  body: Container(
                    padding: EdgeInsets.all(25),
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    child: Column(
                      children: [
                        // Select Date
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Select Date"),
                            DropdownButton(
                              value: ticketDate,
                              icon: const Icon(Icons.arrow_downward),
                              iconSize: 24,
                              elevation: 16,
                              underline: Container(
                                height: 2,
                                color: kPrimaryColor,
                              ),
                              onChanged: (newValue) {
                                setState(() {
                                  ticketDate = newValue;
                                });
                              },
                              items: [
                                'Select Date',
                                'Two',
                                'Three',
                                'Four',
                                widget.event.date
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ],
                        ),

                        // Select ticket number
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Ticket Quantity"),
                            DropdownButton(
                              value: ticketNumber,
                              icon: const Icon(Icons.arrow_downward),
                              iconSize: 24,
                              elevation: 16,
                              underline: Container(
                                height: 2,
                                color: kPrimaryColor,
                              ),
                              onChanged: (newValue) {
                                setState(() {
                                  ticketNumber = newValue;
                                });
                              },
                              items: [
                                "1",
                                "2",
                                "3"
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ],
                        ),

                        // Select ticket type:
                        DropdownButton(
                          value: ticketType,
                          icon: const Icon(Icons.arrow_downward),
                          iconSize: 24,
                          elevation: 16,
                          underline: Container(
                            height: 2,
                            color: kPrimaryColor,
                          ),
                          onChanged: (newValue) {
                            setState(() {
                              ticketType = newValue;
                            });
                          },
                          items: ["Please Select", "Category 1", "Category2"]
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              !isSmallScreen
                  ? SizedBox(
                      width: 20,
                    )
                  : Container(),
              Container(
                height: 500,
                width: isSmallScreen ? media.width : scaffoldSize * (1 / 3),
                // Selected tickets box:
                child: Scaffold(
                  appBar: AppBar(
                    automaticallyImplyLeading: false,
                    title: Text("Your Tickets"),
                  ),
                  body: Container(
                    padding: EdgeInsets.all(25),
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Selected Date"),
                            Text(ticketDate),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Selected Ticket Number"),
                            Text(ticketNumber),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Selected Ticket Type"),
                            Text(ticketType),
                          ],
                        ),
                        SizedBox(height: 15),
                        OutlinedButton(
                          child: Text("Continue"),
                          onPressed: () {
                            // TODO: Add the selected ticket to cart and go to checkout.
                          },
                        ),
                      ],
                    ),
                  ),
                ),
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
