import 'package:fancrick/Utilities/constants.dart';
import 'package:fancrick/Utilities/drawer.dart';
import 'package:fancrick/Utilities/matchtile.dart';
import 'package:flutter/material.dart';

class user_front extends StatefulWidget {
  const user_front({super.key});

  @override
  State<user_front> createState() => _user_frontState();
}

class _user_frontState extends State<user_front> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      
      length: 3,
      child: Scaffold(
        appBar: AppBar(
           bottom: TabBar(
            
            indicatorColor: anywhere,
            tabAlignment: TabAlignment.fill,
            
            
              onTap: (index){
                print("selected tab is $index");
              },
              tabs: [
                  Tab( child: Container(
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
                  ),),
                  Tab( child: Container(
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
                  ),),

                   Tab( child: Container(
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
                  ),),
                  //more tabs here
              ],
            ),
          title: Text("Fantasy Cricket "),
          backgroundColor: anywhere,
          toolbarHeight: 80,
      //     leading:   IconButton( //menu icon button at start left of appbar
      // onPressed: (){
      //      //code to execute when this button is pressed
      // },
      // icon: Icon(Icons.menu),
      //   ),
    
        ),
    
        
        body: Container( 
               
               child: match_tile(),
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