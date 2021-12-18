import 'package:flutter/material.dart';
import 'package:quiver/async.dart';
import '../utils/countdown.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({Key key}) : super(key: key);

  @override
  _CheckOutState createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.fromLTRB(150, 100, 150, 20),
        child: Wrap(
          children: [
            // Billing information
            BillingForm(),

            // Timer box with selected details
            Timer(),
          ],
        ),
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
      color: Colors.pinkAccent,
      height: 500,
      width: contWidth / 2,
      padding: EdgeInsets.all(20),
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
