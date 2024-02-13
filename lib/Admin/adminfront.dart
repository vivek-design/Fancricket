import 'package:fancrick/Admin/Edittem.dart';
import 'package:fancrick/Admin/Scedulematch.dart';
import 'package:fancrick/Admin/matchtileforstartmatch.dart';
import 'package:fancrick/Features/AdminFeature/adminfeatues.dart';
import 'package:fancrick/Model/contest.dart';
import 'package:fancrick/Utilities/constants.dart';
import 'package:fancrick/Utilities/drawer.dart';

import 'package:fancrick/Utilities/matchtileStart.dart';
import 'package:fancrick/Utilities/matchtileaftercompetion.dart';
import 'package:fancrick/Utilities/matchtileforuser.dart';

import 'package:flutter/material.dart';

class AdminFront extends StatefulWidget {
  const AdminFront({super.key});

  @override
  State<AdminFront> createState() => _AdminFrontState();
}

class _AdminFrontState extends State<AdminFront> {
  adminservice admin = adminservice();
  int _index = 0;
  int index2 = 0;
  @override
  Widget build(BuildContext context) {
    return 
    DefaultTabController(
      length: 2,
      
      child:Scaffold(
      appBar: AppBar(
        title: Text("Fantasy Cricket "),
        backgroundColor: anywhere,
        toolbarHeight: 100,
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
                      backgroundColor: Colors.red,
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Text("  Current")
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

                          if (index2 == 1 && inhere![index].status=='Completed') {
                            return matchdone(cont: inhere![index]);
                          }


                          if (index2 == 0 && inhere![index].status!='Completed' ) {
                            return matchtileforstart(cont: inhere![index]);
                          }
                          
                          return Container();
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
    )
    );
  }
}
