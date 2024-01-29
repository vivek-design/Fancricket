import 'package:fancrick/Provider/userprovider.dart';
import 'package:fancrick/Utilities/constants.dart';
import 'package:fancrick/welcome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class myDrawer extends StatefulWidget {
  const myDrawer({Key? key}) : super(key: key);

  @override
  State<myDrawer> createState() => _myDrawerState();
}

class _myDrawerState extends State<myDrawer> {
  @override
  Widget build(BuildContext context) {
    String name = Provider.of<UserProvider>(context).user.name.toString();
    String email = Provider.of<UserProvider>(context).user.email.toString();

    return Drawer(
      child: Container(
        color: anywhere,
        child: ListView(
          children: [
            DrawerHeader(
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                    decoration: BoxDecoration(color: anywhere),
                    margin: EdgeInsets.zero,
                    accountName: Text(name,
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold)),
                    accountEmail: Text(email,
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold)),
                    currentAccountPicture: CircleAvatar(
                      // in place of image.assets we can have NetworkImage(url of image);
                      // if you want to add it from the internet then it will be the best way
                      //while using circular avatar when inserting image with background image functionality
                      // use asset image for image inserting from assets and network image for network

                      backgroundImage: AssetImage('assets/images/images.jpeg'),
                    ))),

            // listtile is basically a widget which is used when you want some elment in front and also in right
            // it also provide ontap functinality then it will be better to use it instead of working with container and designing it
            //
            ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              onTap: () {
                Navigator.pop(context);
              },
              title: Text(
                "Home",
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.white),
              ),
            ),

          
            ListTile(
              leading: Icon(
                CupertinoIcons.mail,
                color: Colors.white,
              ),
              title: Text(
                "Contact Us",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {},
            ),

            ListTile(
              leading: Icon(
                Icons.logout_rounded,
                color: Colors.white,
              ),
              onTap: () async {
                SharedPreferences pref = await SharedPreferences.getInstance();
                pref.remove('email');
                pref.remove('password');
                Navigator.pushAndRemoveUntil(context,
                    MaterialPageRoute(builder: (contex) {
                  return gettingstarted();
                }), (route) => false);
              },
              title: Text(
                "Log out",
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
