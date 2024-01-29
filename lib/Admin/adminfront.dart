import 'dart:ui';

import 'package:fancrick/Admin/Edittem.dart';
import 'package:fancrick/Admin/Scedulematch.dart';
import 'package:fancrick/Features/Register/rergister.dart';
import 'package:fancrick/Utilities/constants.dart';
import 'package:fancrick/Utilities/drawer.dart';
import 'package:fancrick/Utilities/matchtile.dart';
import 'package:fancrick/Utilities/matchtileStart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdminFront extends StatefulWidget {
  const AdminFront({super.key});

  @override
  State<AdminFront> createState() => _AdminFrontState();
}

class _AdminFrontState extends State<AdminFront> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fantasy Cricket "),
        backgroundColor: anywhere,
        toolbarHeight: 100,
      ),
      body: Container(
          child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Center(
            child: Container(
              height: 50,
              width: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                border: Border.all(),
              ),
              child: Center(
                  child: Text(
                "Admin Pannel",
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          matchtile2()
        ],
      )),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10,
        selectedItemColor: anywhere,
        currentIndex: _index,
        onTap: (index) {
       switch (index) {
          case 0:
           break;
      case 1:
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return schedulematch();
      }));
        break;
      case 2:
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return editeam();
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
            icon: Icon(Icons.calendar_today),
            label: 'Create match',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit),
            label: 'Team',
          ),
        ],
      ),
      drawer: myDrawer(),
    );
  }
}
