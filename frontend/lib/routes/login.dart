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
    void loginUser(){
      print("email: $email, password: $password");
      Navigator.pushNamed(context, '/home');
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
            child: Form(
              key: _key,
              child: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[700],
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Container(
                          width: 30,
                          child: Divider(
                            color: kPrimaryColor,
                            thickness: 2,
                          ),
                        ),
                        SizedBox(
                          height: 32,
                        ),
                        SizedBox(
                          height: 32,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'E-mail',
                            labelText: 'E-mail',
                            suffixIcon: Icon(
                              Icons.mail_outline,
                            ),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Please don't leave e-mail address empty!";
                            }
                            if (!EmailValidator.validate(value)) {
                              return "Please enter a valid e-mail address!";
                            }

                            return null;
                          },
                          onSaved: (value) {
                            email = value;
                          },
                        ),
                        SizedBox(
                          height: 32,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Password',
                            labelText: 'Password',
                            suffixIcon: Icon(
                              Icons.lock_outline,
                            ),
                          ),
                          keyboardType: TextInputType.visiblePassword,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Please don't leave password empty!";
                            }
                            if (value.length < 8) {
                              return "Password must be at least 8 characters!";
                            }
                            return null;
                          },
                          onSaved: (value) {
                            password = value;
                          },
                        ),