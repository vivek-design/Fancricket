// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:fancrick/Model/contest.dart';
import 'package:fancrick/Utilities/constants.dart';

class leaderboard extends StatefulWidget {
  contests cont;
  leaderboard({
    Key? key,
    required this.cont,
  }) : super(key: key);

  @override
  State<leaderboard> createState() => _leaderboardState();
}

class _leaderboardState extends State<leaderboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Container(
        height: 500,
        width: 1000,
        decoration: BoxDecoration(
          color: anywhere,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 60,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              Column(
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundImage: NetworkImage(widget.cont.logo1),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.cont.team_name1,
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
                      widget.cont.logo2,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.cont.team_name2,
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
        child: Column(),
      ),
    ]));
  }
}
