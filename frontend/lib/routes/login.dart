import 'package:flutter/material.dart';
import 'package:frontend/utils/constants.dart';
import 'package:email_validator/email_validator.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String name, email, password;
    final _key = GlobalKey<FormState>();

    // TODO: save user
    void loginUser() {
      print("email: $email, password: $password");

      // Redirect to another page
    }

    return Scaffold(
      body: SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(size.height > 770
            ? 64
            : size.height > 670
            ? 32
            : 16),
        child: Center(
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(25),
              ),
            ),