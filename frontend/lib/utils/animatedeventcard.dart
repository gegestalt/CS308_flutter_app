import 'package:flutter/material.dart';
import 'package:frontend/utils/eventcard.dart';
import 'package:frontend/models/event.dart';

class AnimatedEventCard extends StatefulWidget {
  const AnimatedEventCard({this.event});

  final Event event;

  @override
  _AnimatedEventCardState createState() => _AnimatedEventCardState();
}

class _AnimatedEventCardState extends State<AnimatedEventCard> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => null,
      onHover: (hovering) {
        setState(() => isHovering = hovering);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.ease,
        padding: EdgeInsets.all(isHovering ? 0 : 15),
        decoration: BoxDecoration(),
        child: Opacity(
          opacity: isHovering ? 1 : 0.9,
          child: EventCard(
            event: widget.event,
          ),
        ),
      ),
    );
  }
}
