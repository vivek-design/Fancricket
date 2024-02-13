import 'package:fancrick/User/Profile.dart';
import 'package:fancrick/User/userfront.dart';
import 'package:fancrick/Utilities/constants.dart';
import 'package:flutter/material.dart';

class history extends StatefulWidget {
  const history({super.key});

  @override
  State<history> createState() => _historyState();
}

class _historyState extends State<history> {
  int _index = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10,
        selectedItemColor: anywhere,
        currentIndex: _index,
        onTap: (index) {
          switch (index) {
            case 0:
            Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return user_front();
              }));
              break;
            case 1:
              break;
            case 2:
              Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return profile();
              }));
              break;
          }
        },
         items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
      ),
    );
  }
}
