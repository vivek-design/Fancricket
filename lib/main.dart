import 'package:fancrick/Admin/adminfront.dart';
import 'package:fancrick/Features/Auth/auth.dart';
import 'package:fancrick/Features/Register/rergister.dart';
import 'package:fancrick/Provider/userprovider.dart';
import 'package:fancrick/User/userfront.dart';
import 'package:fancrick/welcome.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    authService.getUserData(context as BuildContext);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Fancricket ",
      debugShowCheckedModeBanner: false,
      home: Provider.of<UserProvider>(context).user.token.isNotEmpty
          ? Provider.of<UserProvider>(context).user.type == 'user'
              ? user_front()
              : AdminFront()
          : user_front(),
    );
  }
}
