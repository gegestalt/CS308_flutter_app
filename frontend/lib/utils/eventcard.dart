import 'package:flutter/material.dart';
import 'package:frontend/utils/constants.dart';
import 'package:frontend/models/event.dart';

class EventCard extends StatefulWidget {
  const EventCard({
    this.event,
  });

  final Event event;

  @override
  _EventCardState createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: GestureDetector(
        child: Row(
          children: [
            Expanded(
              flex: 5,
              child: Image.network(
                widget.event.thumbnail,
                fit: BoxFit.cover,
              ),
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
                      widget.event.name,
                      softWrap: true,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                              widget.event.location,
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
                              widget.event.date,
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
    );
  }
}
