import 'package:fancrick/Provider/userprovider.dart';
import 'package:fancrick/User/history.dart';
import 'package:fancrick/User/userfront.dart';
import 'package:fancrick/Utilities/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  int _index = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(children: [
            Container(
              height: 500,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/background.png'),
                    fit: BoxFit.fill),
              ),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    left: 30,
                    width: 80,
                    height: 200,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/light-1.png'),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 140,
                    width: 80,
                    height: 150,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/light-2.png'),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 40,
                    top: 40,
                    width: 80,
                    height: 150,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/clock.png'),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      right: 210,
                      top: 300,
                      width: 130,
                      height: 200,
                      child: Container(
                          child:Text(
                        "Profile",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            color: Colors.white),
                      )
                          
                          )),
                ],
              ),
            ),
            Container(
              //all the remaining profile options
              padding: EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                    child: Text(
                      "  Role ",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                    width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(20)),
                    child: "User".text.bold.make(),
                  ),
                  20.heightBox,
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                    child: Text(
                      "  Username ",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                    width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(20)),
                    child: "${Provider.of<UserProvider>(context).user.name}"
                        .text
                        .bold
                        .make(),
                  ),
                  20.heightBox,
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                    child: Text(
                      "  Email",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                    width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(20)),
                    child: "${Provider.of<UserProvider>(context).user.email}"
                        .text
                        .bold
                        .make(),
                  ),
                  20.heightBox,
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                    child: Text(
                      "  Phone ",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                    width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(20)),
                    child: "${Provider.of<UserProvider>(context).user.phone}"
                        .text
                        .bold
                        .make(),
                  ),
                  20.heightBox,
                  20.heightBox,
                ],
              ),
            )
          ]),
        ),
      ),
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
             Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return history();
              }));
              break;
            case 2:
             
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
