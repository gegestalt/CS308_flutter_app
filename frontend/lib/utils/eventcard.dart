import 'package:flutter/material.dart';
import 'package:frontend/utils/constants.dart';
import 'package:frontend/models/event.dart';

class EventCard extends StatelessWidget {
  const EventCard({
    this.event,
  });

  final Event event;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Image.network(
              this.event.thumbnail,
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
                  Expanded(
                    child: Text(
                      this.event.name,
                      softWrap: true,
                    ),
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
                          Flexible(
                            child: Text(
                              this.event.location,
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
                              this.event.date,
                              softWrap: true,
                            ),
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
    );
  }
}
