import 'package:fancrick/Utilities/constants.dart';
import 'package:flutter/material.dart';

class user_front extends StatefulWidget {
  const user_front({super.key});

  @override
  State<user_front> createState() => _user_frontState();
}

class _user_frontState extends State<user_front> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //  bottom: TabBar( //tabbar at bottom of appbar
        //     onTap: (index){
        //       print("selected tab is $index");
        //     },
        //     tabs: [
        //         Tab(icon: Icon(Icons.home)),
        //         Tab(icon: Icon(Icons.send))
        //         //more tabs here
        //     ],
        //   ),
        title: Text("Fantasy Cricket "),
        backgroundColor: anywhere,
        toolbarHeight: 80,
        leading:   IconButton( //menu icon button at start left of appbar
    onPressed: (){
         //code to execute when this button is pressed
    },
    icon: Icon(Icons.menu),
      ),

      ),

      
      body: Container( 
        child: Text("fdsfjks"),
      ),

      // bottomNavigationBar: BottomNavigationBar(items: ),

      
        drawer: Drawer(),
    );
  }
}