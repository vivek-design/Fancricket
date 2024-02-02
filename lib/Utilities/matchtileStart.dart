// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:fancrick/Admin/runmatch.dart';
import 'package:fancrick/Model/contest.dart';

class matchtile2 extends StatefulWidget {
  contests cont;
matchtile2({
    Key? key,
    required this.cont,
  }) : super(key: key);

  @override
  State<matchtile2> createState() => _matchtile2State();
}

class _matchtile2State extends State<matchtile2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Container(
        height: 160,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color.fromARGB(255, 129, 152, 210),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              Column(
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundImage: NetworkImage(
                      widget.cont.logo1
                    ),
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
            InkWell(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return runmatch(cont: widget.cont,);
                }));
              },
              child: Container(
                child: Container(
                  height: 30,
                  width: 90,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(255, 93, 165, 67),
                  ),
                  child: Center(
                      child: Text(
                    ("Start "),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
