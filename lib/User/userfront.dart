import 'package:fancrick/Features/AdminFeature/adminfeatues.dart';
import 'package:fancrick/Model/contest.dart';
import 'package:fancrick/Utilities/constants.dart';
import 'package:fancrick/Utilities/drawer.dart';
import 'package:fancrick/Utilities/matchtile.dart';
import 'package:fancrick/Utilities/matchtileStart.dart';
import 'package:flutter/material.dart';

class user_front extends StatefulWidget {
  const user_front({super.key});

  @override
  State<user_front> createState() => _user_frontState();
}

class _user_frontState extends State<user_front> {
  adminservice admin = adminservice();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            indicatorColor: anywhere,
            tabAlignment: TabAlignment.fill,
            onTap: (index) {
              print("selected tab is $index");
            },
            tabs: [
              Tab(
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 5,
                        backgroundColor: Colors.green,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text("Live")
                    ],
                  ),
                ),
              ),
              Tab(
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 5,
                        backgroundColor: Colors.red,
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Text("Upcomming")
                    ],
                  ),
                ),
              ),

              Tab(
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 5,
                        backgroundColor: Colors.grey,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text("Completed")
                    ],
                  ),
                ),
              ),
              //more tabs here
            ],
          ),
          title: Text("Fantasy Cricket "),
          backgroundColor: anywhere,
          toolbarHeight: 80,
          
        ),
        body: Container(
          child: Column(
            children: [
              Expanded(
                child: FutureBuilder(
                  future: admin.getcontest(context),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<contests>? inhere = snapshot.data;
                      print(inhere?.length);
                      return ListView.builder(
                        itemCount: inhere?.length,
                        itemBuilder: (BuildContext context, int index) {
                          return matchtile2(cont: inhere![index]);
                        },
                      );
                    } else {
                      return Container(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 10,
          selectedItemColor: anywhere,
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
        drawer: myDrawer(),
      ),
    );
  }
}
