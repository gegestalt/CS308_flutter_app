import 'package:flutter/material.dart';
import 'package:frontend/utils/constants.dart';

class EventCard extends StatefulWidget {
  const EventCard({
    this.eventName = "",
    this.eventThumbnail = "",
    this.eventPerformer = "",
    this.eventDate = "",
    this.eventLocation = "",
    this.eventTime = "",
  });

  final String eventName;
  final String eventThumbnail;
  final String eventPerformer;
  final String eventDate;
  final String eventLocation;
  final String eventTime;

  @override
  _EventCardState createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: GestureDetector(
        child: Container(
          width: 400,
          height: 200,
          child: Row(
            children: [
              Expanded(
                flex: 5,
                child: Image.network(widget.eventThumbnail),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        widget.eventName,
                        softWrap: true,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.location_pin,
                                color: kPrimaryColor,
                              ),
                              Text(
                                widget.eventLocation,
                                softWrap: true,
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
                              Text(
                                widget.eventDate,
                                softWrap: true,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
