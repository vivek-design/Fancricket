import 'package:fancrick/Utilities/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class runmatch extends StatefulWidget {
  const runmatch({super.key});

  @override
  State<runmatch> createState() => _runmatchState();
}

class _runmatchState extends State<runmatch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(

          children:[ 
            
            Container(
              height: 500,
              width: 1000,
               decoration: BoxDecoration(
                color:anywhere, 
                
               ),
               child:  Column(
          children: [
            SizedBox(
              height: 60,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              Column(
                children: [
                 
                  CircleAvatar(
                    radius: 35,
                    backgroundImage: NetworkImage(
                      'https://m.economictimes.com/thumb/msid-59202287,width-1200,height-900,resizemode-4,imgsize-66221/why-team-india-still-uses-british-era-logo-central-information-commission-to-pmo.jpg',
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "India",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Container(
                  height: 80,
                  width: 80,
                  child: Image.asset('assets/images/vs.png')),
              Column(
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundImage: NetworkImage(
                        'https://ih1.redbubble.net/image.4329544907.4168/st,medium,507x507-pad,600x600,f8f8f8.jpg'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "England ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ]),
            SizedBox(
              height: 10,
            ),
           

          ],
        ),
          ),

              Container(
                     child:  Column(),
              ),

          FloatingActionButton(onPressed: (){}, child: Text("End"),backgroundColor:anywhere ,)

          ]
        ),
    );
  }
}