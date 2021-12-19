import 'package:flutter/material.dart';
import 'package:frontend/utils/constants.dart';
import '../utils/countdown.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({Key key}) : super(key: key);

  @override
  _CheckOutState createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        margin: media.width > 900
            ? EdgeInsets.fromLTRB(150, 100, 150, 20)
            : EdgeInsets.fromLTRB(50, 100, 50, 20),
        child: media.width > 900
            ? Row(
                children: [
                  // Billing information
                  Expanded(child: BillingForm()),

                  // Timer box with selected details
                  Expanded(
                    child: Details(),
                  ),
                ],
              )
            : ListView(
                children: [
                  // Billing information
                  BillingForm(),
                  SizedBox(height: 50),
                  // Timer box with selected details
                  Details(),
                ],
              ),
      ),
    );
  }
}

class Details extends StatefulWidget {
  const Details({Key key}) : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(50, 20, 50, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              "Details",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Text("Event Name"),
          Text("Date"),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Type:"),
              Text("Tam"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Price:"),
              Text("120 x 2"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Total:"),
              Text("240"),
            ],
          ),
          SizedBox(height: 30),
          Wrap(
            children: [
              Text("Remaining Time:"),
              Timer(),
            ],
          ),
          SizedBox(height: 20),
          Text("Discount Code:"),
          Form(
            child: TextFormField(),
          ),
          SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () {},
              child: Text("Continue"),
              style: ElevatedButton.styleFrom(
                primary: kPrimaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BillingForm extends StatelessWidget {
  const BillingForm({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _billingKey = GlobalKey<FormState>();
    final media = MediaQuery.of(context).size;
    final contWidth = media.width - 300;

    return Container(
      color: Colors.grey,
      padding: EdgeInsets.fromLTRB(50, 20, 50, 0),
      child: Form(
        key: _billingKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "Billing Information",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Text("Name"),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please don't leave this space empty!";
                  }
                  return null;
                },
                onSaved: (value) {},
              ),
              SizedBox(height: 20),
              Text("Surname"),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              Text("Address"),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              Text("Country"),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              Text("City"),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              Text("Zip Code"),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
