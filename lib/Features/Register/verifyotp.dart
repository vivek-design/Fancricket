// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fancrick/Features/Auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import 'package:fancrick/Model/user.dart';

class Verify extends StatefulWidget {
  User user;
  Verify({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  State<Verify> createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
  AuthService auth = new AuthService();

  @override
  void initState() {
    // TODO: implement initState
    auth.signUpUser(
        context: context,
        email: widget.user.email,
        password: widget.user.password,
        name: widget.user.name,
        phone:widget.user.phone);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String codez = "";
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 100,
            ),
            Container(
              child: Text(
                "Verification code",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Text(
                "We have mailed you a code ",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              child: Text(
                "Please enter it below ",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            OtpTextField(
              numberOfFields: 4,
              borderColor: Color(0xFF512DA8),
              //set to true to show as box or false to show as dash
              showFieldAsBox: true,
              //runs when a code is typed in
              onCodeChanged: (String code) {
                //handle validation or checks here
                codez = code;
              },
              //runs when every textfield is filled
              onSubmit: (String verificationCode) {
                codez = verificationCode;

                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Verification Code"),
                        content: Text('Code entered is $verificationCode'),
                      );
                    });
              }, // end onSubmit
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              child: Center(
                child: Text(
                  "This help us verify every user \n in our market place. ",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(50),
              child: InkWell(
                onTap: () {
                  auth.verifyotp(context, codez.toString());
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
                    child: Text("Verify",
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
}
