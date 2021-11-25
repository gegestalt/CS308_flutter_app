import 'package:flutter/material.dart';
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
    return Container(
      child: Center(
        child: Text("This is the details page for  ${widget.event.name}"),
      ),
    );
  }
}
