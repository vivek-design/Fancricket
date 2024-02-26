import 'package:fancrick/Features/Auth/auth.dart';
import 'package:fancrick/Provider/userprovider.dart';
import 'package:fancrick/welcome.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        )
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Fancricket",
      debugShowCheckedModeBanner: false,
      home: MyTempApp(),
    );
  }
}

class MyTempApp extends StatefulWidget {
  @override
  _MyTempAppState createState() => _MyTempAppState();
}

class _MyTempAppState extends State<MyTempApp> {
  final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  Future<void> checkLoginStatus() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? email = prefs.getString('email');
    final String? password = prefs.getString('password');

    if (email == password) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => gettingstarted()),
      );
    } else {
      print("Logged out");
      // Handle logout or show login screen
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
