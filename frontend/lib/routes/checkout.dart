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
    return Container(
      color: Colors.black,
      margin: EdgeInsets.fromLTRB(150, 100, 150, 20),
      child: Row(
        children: [
          // Timer box with selected details
          Timer(),

          // Billing information
          BillingForm(),
        ],
      ),
    );
  }
}

class BillingForm extends StatelessWidget {
  const BillingForm({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _key = GlobalKey<FormState>();
    final media = MediaQuery.of(context).size;

    return Container(
      height: media.height,
      width: media.width,
      child: Form(
        key: _key,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                child: Row(
                  children: [
                    Text("Name"),
                    TextFormField(),
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
