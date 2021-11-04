import 'package:flutter/material.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xB7940303),
                    Color(0xF0B4400F),
                  ]
              )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.
            center,
            children: [
              SizedBox(height: 80,),
              SizedBox(height: 15,),
              Text('JUSTICKET',
                style: TextStyle(
                  color:Colors.white,
                  fontSize: 40,
                ),
              ),
              SizedBox(height: 30,),
              Container(
                height: 480,
                width: 325,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height:30 ,),
                    Text('Welcome',
                      style:TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text('Login to Your Account',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      width: 250,
                      child: TextField(
                          decoration: InputDecoration(
                            labelText: 'Email Address',
                            suffixIcon: Icon(Icons.email, size:17),
                          )
                      ),
                    ),
                    Container(
                      width: 250,
                      child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            suffixIcon: Icon(Icons.password, size:17,),
                          )
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Container(
                              alignment: Alignment.center,
                              width: 200,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Text('Forget password',
                                  style: TextStyle(
                                      color: Colors.amberAccent[700],
                                      fontSize: 15,
                                      fontWeight: FontWeight.w200
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 60,),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        alignment: Alignment.center,
                        width: 250,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  Color(0xFF6C0C0C),
                                  Color(0xEAB23603),
                                ]
                            )
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text('Login',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                    ),
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
