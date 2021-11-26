import 'package:flutter/material.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:frontend/models/event.dart';
import 'package:frontend/utils/constants.dart';

class TicketSearch extends StatefulWidget {
  const TicketSearch({this.event});

  final Event event;

  @override
  _TicketSearchState createState() => _TicketSearchState();
}

class _TicketSearchState extends State<TicketSearch> {
  String dropdownDate = "Select Date";
  String dropdownTicketNumber = "1";
  String dropdownTicket = "Please Select";

  @override
  Widget build(BuildContext context) {
    // Search and select ticket:
    return Scaffold(
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
                  value: dropdownDate,
                  icon: const Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 16,
                  underline: Container(
                    height: 2,
                    color: kPrimaryColor,
                  ),
                  onChanged: (newValue) {
                    setState(() {
                      dropdownDate = newValue;
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
                  value: dropdownTicketNumber,
                  icon: const Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 16,
                  underline: Container(
                    height: 2,
                    color: kPrimaryColor,
                  ),
                  onChanged: (newValue) {
                    setState(() {
                      dropdownTicketNumber = newValue;
                    });
                  },
                  items: ["1", "2", "3"]
                      .map<DropdownMenuItem<String>>((String value) {
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
              value: dropdownTicket,
              icon: const Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              underline: Container(
                height: 2,
                color: kPrimaryColor,
              ),
              onChanged: (newValue) {
                setState(() {
                  dropdownTicket = newValue;
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
    );
  }
}

class SelectedTickets extends StatefulWidget {
  const SelectedTickets();

  @override
  _SelectedTicketsState createState() => _SelectedTicketsState();
}

class _SelectedTicketsState extends State<SelectedTickets> {
  @override
  Widget build(BuildContext context) {
    // Search ticket and buy ticket:
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Your Tickets"),
      ),
      body: Container(
        decoration: BoxDecoration(
          border: Border.all(),
        ),
        child: Row(
          children: [
            Text("first"),
            Text("second"),
          ],
        ),
      ),
    );
  }
}
