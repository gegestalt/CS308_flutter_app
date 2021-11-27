import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';



class UserSettings extends StatefulWidget {
  @override
  _UserSettingsState createState() => _UserSettingsState();
}

class _UserSettingsState extends State<UserSettings>
{
  File imageFile;
  String profilePicture = "";

  getFromGallery() async {

  }

  String _message = '';

  void setmessage(String msg) {
    setState(() {
      _message = msg;
    });
  }
  String myUsername;
  String editedname;
  String editedlastname;
  String editedbio;
  String editedpassword;

  String type;

  final _keyname = GlobalKey<FormState>();
  final _keylastname = GlobalKey<FormState>();
  final _keybio = GlobalKey<FormState>();
  final _keypassword = GlobalKey<FormState>();

  Future<void> _setCurrentScreen() async {

  }
  Future<void> _setLogEvent() async {

  }

  Future<void> updateProfilePicture(String text) async{

  }

  Future<void> acceptAll () async {

  }

  Future<void> updateUserName(String text) async{

  }

  Future<void> updateUserLastName(String text) async{

  }

  Future<void> updateType(String text) async{

  }

  Future<void> updateUserBio(String text) async{

  }


  Future<void> updateUserPassword(String text) async{

  }

  Future deactivateAccount() async{

  }

  Future deleteAccount() async{

  }

  @override
  void initState() {
    _setCurrentScreen();
    _setLogEvent();
    super.initState();
  }
  @override
  Widget build(BuildContext context)
  {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text(
              'User Settings',
            ),
            centerTitle: true,
            backgroundColor: Colors.amber,
            elevation: 0, // deletes the shadow of the app bar
          ),
          body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 10.0,),
                  InkWell(
                    onTap: ()
                    {
                      print("tapped on camera icon");

                      getFromGallery();
                    },
                    child: Container(
                      height: 100.0,
                      decoration: new BoxDecoration(
                        color: Colors.orange.shade400,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            //Image.file(
                            //imageFile,
                            //fit: BoxFit.cover,
                            //)
                            Icon(
                              Icons.camera_alt_rounded,
                              color: Colors.black,
                              size: 50.0,
                            ),
                          ],
                        ),
                      ),),
                  ),
                  const SizedBox(height: 5.0),
                  Center(
                    child:
                    InkWell(
                      onTap: (){print("tapped on 'Set New Photo'");},
                      child: Text("Set New Photo", style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                      )),
                    ),
                  ),
                  Card(
                    margin: const EdgeInsets.fromLTRB(32.0,16.0,32.0,8.0),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                            title: Row(
                              children: <Widget>[
                                Expanded(
                                    child: Text('First Name :')
                                ),
                                Expanded(
                                  child: Form(
                                    key: _keyname,
                                    child: TextFormField(
                                      onSaved: (String value) {
                                        editedname = value;
                                        setState(() {
                                        });
                                      },
                                      // your TextField's Content
                                      keyboardType: TextInputType.text,
                                      obscureText: false,
                                      enableSuggestions: false,
                                      autocorrect: false,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            trailing: IconButton(
                              icon: new Icon(Icons.check_box_rounded, color: Colors.green,),
                              color: Colors.black26,
                              onPressed: () {
                                _keyname.currentState.save();
                                updateUserName(editedname);
                                setState(() {
                                });
                              },
                            )
                        ),
                        ourDivider(),
                        ListTile(
                            title: Row(
                              children: <Widget>[
                                Expanded(
                                    child: Text('Last Name :')
                                ),
                                Expanded(
                                  child: Form(
                                    key: _keylastname,
                                    child: TextFormField(
                                      onSaved: (String value) {
                                        editedlastname = value;
                                        setState(() {
                                        });
                                      },
                                      keyboardType: TextInputType.text,
                                      obscureText: false,
                                      enableSuggestions: false,
                                      autocorrect: false,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            trailing: IconButton(
                              icon: new Icon(Icons.check_box_rounded, color: Colors.green,),
                              color: Colors.black26,
                              onPressed: () {
                                _keylastname.currentState.save();
                                updateUserLastName(editedlastname);
                                setState(() {
                                });
                              },
                            )
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  Card(
                    margin: const EdgeInsets.fromLTRB(32.0,16.0,32.0,8.0),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                            title: Row(
                              children: <Widget>[
                                Expanded(
                                    child: Text('Bio :')
                                ),
                                Expanded(
                                  child: Form(
                                    key: _keybio,
                                    child: TextFormField(
                                      onSaved: (String value) {
                                        editedbio = value;
                                        setState(() {
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            trailing: IconButton(
                              icon: new Icon(Icons.check_box_rounded, color: Colors.green,),
                              color: Colors.black26,
                              onPressed: () {
                                _keybio.currentState.save();
                                updateUserBio(editedbio);
                                setState(() {});
                              },
                            )
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  Card(
                    margin: const EdgeInsets.fromLTRB(32.0,16.0,32.0,8.0),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                    child: Column(
                      children: <Widget>[
                        RadioListTile<String>(
                          title: const Text('Public'),
                          value: "public",
                          groupValue: type,
                          onChanged: (String value) {
                            setState(() {
                              type = value;
                              updateType(type);
                            });
                          },
                        ),
                        RadioListTile<String>(
                          title: const Text('Private'),
                          value: "private",
                          groupValue: type,
                          onChanged: (String value) {
                            setState(() {
                              type = value;
                              updateType(type);
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  Card(
                    margin: const EdgeInsets.fromLTRB(32.0,16.0,32.0,8.0),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                            leading: Text('Password :'),
                            title: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Form(
                                    key: _keypassword,
                                    child: TextFormField(
                                      // your TextField's Content
                                      onSaved: (String value) {
                                        editedpassword = value;
                                        setState(() {
                                        });
                                      },

                                      keyboardType: TextInputType.text,
                                      obscureText: true,
                                      enableSuggestions: false,
                                      autocorrect: false,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            trailing: IconButton(
                              icon: new Icon(Icons.check_box_rounded, color: Colors.green,),
                              color: Colors.black26,
                              onPressed: () {
                                _keypassword.currentState.save();
                                updateUserPassword(editedpassword);
                                setState(() {

                                });

                              },
                            )
                        ),

                        ourDivider(),
                      ],
                    ),
                  ),

                  Center(
                    child: OutlinedButton(
                      onPressed: deactivateAccount,
                      child: Text("Deactivate Account"),
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all(Colors.red),
                        textStyle: MaterialStateProperty.all(
                            TextStyle(
                              fontWeight: FontWeight.w900,
                            )
                        ),
                      ),
                    ),
                  ),

                  Center(
                    child: OutlinedButton(
                      onPressed: deleteAccount,
                      child: Text("Delete Account"),
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all(Colors.red),
                        textStyle: MaterialStateProperty.all(
                            TextStyle(
                              fontWeight: FontWeight.w900,
                            )
                        ),
                      ),
                    ),
                  ),

                ],
              )
          )
      ),
    );
  }
}

Container ourDivider(){
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 8.0, ),
    width: double.infinity,
    height: 1.0,
    color: Colors.grey.shade400,
  );
}
