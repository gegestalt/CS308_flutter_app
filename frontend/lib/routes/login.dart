import 'package:flutter/material.dart';
import 'package:frontend/utils/constants.dart';
import 'package:email_validator/email_validator.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  String name, email, password;
  bool _passwordVisible;
  final passwordController = TextEditingController();

  @override
  void initState() {
    _passwordVisible = false;
    passwordController.text = password;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final _key = GlobalKey<FormState>();

    // TODO: verify the credentials
    void loginUser() {
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
                            controller: passwordController,
                            obscureText: !_passwordVisible,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              labelText: 'Password',
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _passwordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Theme.of(context).primaryColorDark,
                                ),
                                onPressed: () {
                                  // Update the state i.e. toogle the state of passwordVisible variable
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                    password = passwordController.text;
                                  });
                                },
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
                          SizedBox(
                            height: 64,
                          ),
                          InkWell(
                            onTap: () {
                              if (_key.currentState.validate()) {
                                _key.currentState.save();
                                loginUser();
                              }
                            },
                            child: Container(
                              height: 50,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: kPrimaryColor,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(25),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: kPrimaryColor.withOpacity(0.2),
                                    spreadRadius: 4,
                                    blurRadius: 7,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 32,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have an account?",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    Navigator.pushNamed(context, '/signup');
                                  });
                                },
                                child: Row(
                                  children: [
                                    Text(
                                      "Register",
                                      style: TextStyle(
                                        color: kPrimaryColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Icon(
                                      Icons.arrow_forward,
                                      color: kPrimaryColor,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
