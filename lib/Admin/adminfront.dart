import 'package:fancrick/Admin/Edittem.dart';
import 'package:fancrick/Admin/Scedulematch.dart';
import 'package:fancrick/Features/AdminFeature/adminfeatues.dart';
import 'package:fancrick/Model/contest.dart';
import 'package:fancrick/Utilities/constants.dart';
import 'package:fancrick/Utilities/drawer.dart';

import 'package:fancrick/Utilities/matchtileStart.dart';

import 'package:flutter/material.dart';

class AdminFront extends StatefulWidget {
  const AdminFront({super.key});

  @override
  State<AdminFront> createState() => _AdminFrontState();
}

class _AdminFrontState extends State<AdminFront> {
  adminservice admin = adminservice();
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
         
          SizedBox(
            height: 20,
          ),
          FutureBuilder(
              future: admin.getcontest(context),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<contests>? inhere = snapshot.data;
                  print(inhere?.length);
                  return Expanded(
                    child: ListView.builder(
                        itemCount: inhere?.length,
                        itemBuilder: (BuildContext context, int index) {
                          return matchtile2(cont:inhere![index]);
                        }),
                  );
                } else {
                  return Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              }),
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
