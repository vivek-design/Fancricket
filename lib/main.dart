import 'dart:convert';
import 'dart:typed_data';

import 'package:fancrick/Admin/adminfront.dart';
import 'package:fancrick/Features/Auth/auth.dart';
import 'package:fancrick/Features/Register/rergister.dart';
import 'package:fancrick/Features/Register/verifyotp.dart';
import 'package:fancrick/Provider/userprovider.dart';
import 'package:fancrick/User/userfront.dart';
import 'package:fancrick/Utilities/constants.dart';
import 'package:fancrick/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    )
  ], child: const MainApp()));
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    print(Provider.of<UserProvider>(context).user.name.toString());
    return MaterialApp(
      title: "Fancricket ",
      debugShowCheckedModeBanner: false,
      home: mytempapp(),
    );
  }
}

class mytempapp extends StatefulWidget {
  const mytempapp({super.key});

  @override
  State<mytempapp> createState() => _mytempappState();
}

class _mytempappState extends State<mytempapp> {
  final AuthService authService = AuthService();
  Future<bool> fun() async {
    AuthService auth = new AuthService();
    SharedPreferences pref = await SharedPreferences.getInstance();
    String email = await pref.get('email').toString();
    String password = await pref.get('password').toString();

    if (email == password) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return gettingstarted();
      }));

      // calimage();
    } else {
      print("In");
      auth.signInUser(context: context, email: email, password: password);
      
    }
    return true;
  }

  @override
  void initState() {
    super.initState();
    fun();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
