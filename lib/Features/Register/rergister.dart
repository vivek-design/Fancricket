import 'package:fancrick/Features/Register/verifyotp.dart';
import 'package:fancrick/Model/user.dart';
import 'package:fancrick/Utilities/constants.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class register extends StatefulWidget {
  const register({super.key});

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  File? image;
  var selectedRadio;
  var selectedGen;

 

  late final TextEditingController _email;
  late final TextEditingController _password;
  late final TextEditingController name;
  late final TextEditingController age;
  late final TextEditingController phone;

  void initState() {
    // TODO: implement initState
    _email = TextEditingController();
    _password = TextEditingController();
    name = TextEditingController();
    age = TextEditingController();
    phone = TextEditingController();

    super.initState();
    selectedRadio = 0;
    selectedGen = 0;
  }

  // dispose method used to release the memory allocated to variables when state object is removed. For example, if you are using a stream in your
  // application then you have to release memory allocated to the stream controller. Otherwise, your app may get a warning from the PlayStore and AppStore about memory
  // leakage
  @override
  void dispose() {
    // TODO: implement dispose
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              height: 400,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/background.png'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    left: 30,
                    width: 80,
                    height: 200,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/light-1.png'),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 140,
                    width: 80,
                    height: 150,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/light-2.png'),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 40,
                    top: 40,
                    width: 80,
                    height: 150,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/clock.png'),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      child: Container(
                    child: Center(
                        child: Text(
                      "Register",
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          color: Colors.white),
                    )),
                  )),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(30.0),
              child: Column(children: <Widget>[
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(
                          0,
                          0,
                          0,
                          0,
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 75),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(20)),
                        child: TextFormField(
                            controller: name,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Username",
                                hintStyle: TextStyle(color: Colors.grey[400])),
                            validator: (value) {
                              if (value != null) if (value.isEmpty) {
                                return "Name can'not be empty ";
                              }
                              return null;
                            }),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(20)),
                        child: TextFormField(
                            controller: _email,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Email ",
                                hintStyle: TextStyle(color: Colors.grey[400])),
                            validator: (value) {
                              if (value != null) if (value.isEmpty) {
                                return "Email cannot be empty ";
                              }
                              return null;
                            }),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(20)),
                        child: TextFormField(
                          controller: phone,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Phone number",
                              hintStyle: TextStyle(color: Colors.grey[400])),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(20)),
                        child: TextFormField(
                            controller: _password,
                            obscureText: true,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Password",
                                hintStyle: TextStyle(color: Colors.grey[400])),
                            validator: (value) {
                              if (value != null) if (value.isEmpty) {
                                return "password connot be null";
                              }
                              return null;
                            }),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.all(50),
              child: InkWell(
                onTap: () {
                  //this process returns the future so withput the use of await keywoed it will return the instance of future

                  if (!_email.text.contains('@')) {
                    displaytoast("Enter a valid email", context);
                  } else if (_email == null) {
                    displaytoast("Email field is mandatory", context);
                  } else if (name.text == null) {
                    displaytoast("Enter name field", context);
                  } else if (phone == null || phone.text.length != 10) {
                    displaytoast("Please enter valid phone number", context);
                  } else if (_password.text.length < 8 || _password == null) {
                    displaytoast("Please select register role", context);
                  } else {
                    User user = new User(
                        id: "",
                        name: name.text,
                        email: _email.text,
                        password: _password.text,
                        phone:phone.text ,
                        token: "",
                        type: "user");

                    Navigator.pop(context);
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return Verify(user: user);
                    }));
                  }
                },
                child: Ink(
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(colors: [
                        Color.fromRGBO(143, 148, 251, 1),
                        Color.fromRGBO(143, 148, 251, 6),
                      ])),
                  child: Center(
                    child: Text("Register",
                        style: TextStyle(
                          color: Colors.white,
                        )),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  void setSelectedRadioRegiste(Object? val) {
    setState(() {
      selectedRadio = val;
    });
  }

  void setgenRadio(Object? vale) {
    setState(() {
      selectedGen = vale;
    });
  }

  displaytoast(String s, BuildContext context) {
    Fluttertoast.showToast(msg: s);
  }
}
