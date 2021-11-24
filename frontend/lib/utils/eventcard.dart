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
    return Card(
      child: GestureDetector(
        child: Container(
          width: 200,
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: Image.network(widget.eventThumbnail)),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(widget.eventName),
                        Text(widget.eventLocation),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(widget.eventDate),
                        Text(widget.eventTime)
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
