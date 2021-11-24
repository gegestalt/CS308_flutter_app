import 'package:flutter/material.dart';

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
    return GestureDetector(
      child: Container(
        width: 200,
        height: 250,
        child: Expanded(
          child: Column(
            children: [
              Image(
                image: NetworkImage(widget.eventThumbnail),
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Text(widget.eventName),
                      Text(widget.eventLocation),
                      Text(widget.eventDate),
                      Text(widget.eventTime)
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
