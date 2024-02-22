// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fancrick/Model/contestplayersboth.dart';
import 'package:fancrick/Model/player.dart';
import 'package:fancrick/User/Services/userservices.dart';
import 'package:fancrick/Utilities/snackbar.dart';
import 'package:fancrick/Utilities/tile.dart';
import 'package:flutter/material.dart';

import 'package:fancrick/Model/contest.dart';
import 'package:fancrick/Utilities/constants.dart';

class build_team extends StatefulWidget {
  contests cont;
  build_team({
    Key? key,
    required this.cont,
  }) : super(key: key);

  @override
  State<build_team> createState() => _build_teamState();
}

class _build_teamState extends State<build_team> {
  userservices service = userservices();
  List<String> selectedPlayers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 200,
                    width: 1000,
                    decoration: BoxDecoration(
                      color: anywhere,
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 60,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                CircleAvatar(
                                  radius: 35,
                                  backgroundImage:
                                      NetworkImage(widget.cont.logo1),
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
                                  backgroundImage:
                                      NetworkImage(widget.cont.logo2),
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
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              FutureBuilder(
                future: service.getcontestById(widget.cont.contestid, context),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    contestbothplayer? cont = snapshot.data;
                    List<player> l1 = cont!.list_1;
                    List<player> l2 = cont.list_2;
                    return Column(
                      children: [
                        Container(
                          child: Row(
                            children: [
                              SizedBox(width: 20),
                              Text(
                                widget.cont.team_name1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(width: 20),
                              Container(
                                child: CircleAvatar(
                                    backgroundImage:
                                        NetworkImage(widget.cont.logo1)),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 14),
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: l2.length,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              final isSelected =
                                  selectedPlayers.contains(l1[index].id);
                                       return simpletile(name: l1[index].name, role: l1[index].role, isSelected: selectedPlayers.contains(l1[index].id), onTap: (){
                                          
                                    }
                              );
                              
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Container(
                            child: Row(
                              children: [
                                SizedBox(width: 20),
                                Container(
                                  child: Text(widget.cont.team_name2,
                                      overflow: TextOverflow.ellipsis),
                                ),
                                SizedBox(width: 20),
                                Container(
                                  child: CircleAvatar(
                                      backgroundImage:
                                          NetworkImage(widget.cont.logo2)),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 14),
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: l2.length,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              var isSelected =
                                  selectedPlayers.contains(l2[index].id);
                            
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    if (isSelected) {
                                      selectedPlayers.remove(l2[index].id);
                                    } else {
                                      selectedPlayers.add(l2[index].id);
                                    }
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  child: Container(
                                      padding: EdgeInsets.all(10),
                                      height: 80,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            10), // Adjust the value to change the roundness of the corners
                                        border: Border.all(
                                          color: Colors.grey,
                                          width: 1,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            children: [
                                              Text(l2[index].name),
                                              Text(l2[index].role),
                                            ],
                                          ),
                                          CircleAvatar(
                                            radius: 5,
                                            backgroundColor: isSelected
                                                ? Colors.blue
                                                : Colors.grey,
                                          ),
                                        ],
                                      )),
                                ),
                              );
                            },
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            // handle the 11 player exception case in here

                            //
                            if (selectedPlayers.length == 0) {
                              showsnackBar(context, "select player ");
                            } else {
                              userservices userser = userservices();
                              userser.selecteTeam(context, selectedPlayers,
                                  widget.cont.contestid);
                            }
                          },
                          child: Ink(
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(colors: [
                                  Color.fromRGBO(143, 148, 251, 1),
                                  Color.fromRGBO(143, 148, 251, 6),
                                ])),
                            child: Center(
                              child: Text("Join Contest",
                                  style: TextStyle(
                                    color: Colors.white,
                                  )),
                            ),
                          ),
                        ),
                      ],
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
            ],
          ),
        ),
      ),
    );
  }
}
