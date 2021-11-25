import '../models/announcement.dart';
import 'package:flutter/material.dart';

class AnnouncementTile extends StatelessWidget {
  const AnnouncementTile({this.announcement});

  final Announcement announcement;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text(this.announcement.content),
        ],
      ),
    );
  }
}
