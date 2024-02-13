import 'package:fancrick/Features/AdminFeature/adminfeatues.dart';
import 'package:fancrick/Model/contest.dart';
import 'package:fancrick/User/Profile.dart';
import 'package:fancrick/User/history.dart';
import 'package:fancrick/Utilities/constants.dart';
import 'package:fancrick/Utilities/drawer.dart';


import 'package:fancrick/Utilities/matchtileaftercompetion.dart';
import 'package:fancrick/Utilities/matchtileforuser.dart';
import 'package:flutter/material.dart';

class user_front extends StatefulWidget {
  const user_front({super.key});

  @override
  State<user_front> createState() => _user_frontState();
}

class _user_frontState extends State<user_front> {
  adminservice admin = adminservice();
  int _index = 0;
  int index2 = 0;
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
              setState(() {
                index2 = index;
              });
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
                      Text("Upcoming")
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
                      print(inhere!.length);
                      return ListView.builder(
                        itemCount: inhere?.length,
                        itemBuilder: (BuildContext context, int index) {
                          print(inhere[index].status);
                          if (index2 == 1 &&
                              inhere![index].status == 'Upcoming') {
                            return match_tile_user(cont: inhere[index]);
                          }

                          if (index2 == 0 && inhere![index].status == 'Live') {
                            return matchdone(cont: inhere[index]);
                          }

                          if (index2 == 2 &&
                              inhere![index].status == "Completed") {
                            return matchdone(cont: inhere[index]);
                          }
                           return Container();
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
          currentIndex: _index,
          onTap: (index) {
            switch (index) {
              case 0:
                break;
              case 1:
                Navigator.pop(context);
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return history();
                }));
                break;
              case 2:
                Navigator.pop(context);
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
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
        drawer: myDrawer(),
      ),
    );
  }
}
