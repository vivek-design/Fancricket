import 'package:fancrick/Admin/Edittem.dart';
import 'package:fancrick/Admin/adminfront.dart';
import 'package:fancrick/Admin/schedulewidget.dart';
import 'package:fancrick/Model/teams.dart';
import 'package:fancrick/Utilities/constants.dart';
import 'package:flutter/material.dart';

class schedulematch extends StatefulWidget {
  const schedulematch({super.key});

  @override
  State<schedulematch> createState() => _schedulematchState();
}

class _schedulematchState extends State<schedulematch> {
  @override
 
  int _index=1;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" Schedule Match"),
        backgroundColor: anywhere,
        toolbarHeight: 100,
      ),
      body:   schedulewidget(),
         
        
        
    

   bottomNavigationBar: BottomNavigationBar(
        elevation: 10,
        selectedItemColor: anywhere,
        currentIndex: _index,
        onTap: (index) {
       switch (index) {
          case 0:
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return AdminFront();
            }));
           break;
      case 1:
        
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
      
    );
  }
}
