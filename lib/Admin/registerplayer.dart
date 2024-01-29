import 'package:fancrick/Features/AdminFeature/adminfeatues.dart';
import 'package:fancrick/Features/Auth/auth.dart';
import 'package:fancrick/Model/teams.dart';
import 'package:fancrick/Utilities/snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class registerplayer extends StatefulWidget {
  const registerplayer({super.key});

  @override
  State<registerplayer> createState() => _registerplayerState();
}

class _registerplayerState extends State<registerplayer> {
  List<teammodel>? teams = [];
  late Future<List<teammodel>?> _teams;
  String selected_team = 'Select team';
  bool isbuffer = false;
  List<String> role = ['Wicket keeper', "Batsman", "Bowler", "Allrounder"];
  String? selected_role = 'Wicket keeper';
  late final TextEditingController _playename;

  adminservice admin = adminservice();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _playename = TextEditingController();
    _teams = admin.getteam(context: context);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _playename.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _teams,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            teams = snapshot.data;

            print(selected_team);
            return SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Container(
                      width: 300.0, // Set your desired width here
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          // color: Colors.blue,
                          border: Border.all()),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: selected_team,
                            onChanged: (newValue) {
                              setState(() {
                                selected_team = newValue!;
                              });
                            },
                            items: teams?.map((teammodel item) {
                              return DropdownMenuItem<String>(
                                value: item.name,
                                child: Text(item.name),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Container(
                        width: 300,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(40),
                            border: Border.all()),
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(),
                          child: TextFormField(
                              controller: _playename,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "  Enter the name of the player",
                                  hintStyle:
                                      TextStyle(color: Colors.grey[400])),
                              validator: (value) {
                                if (value != null) if (value.isEmpty) {
                                  return "password connot be null";
                                }
                                return null;
                              }),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 300.0, // Set your desired width here
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          // color: Colors.blue,
                          border: Border.all()),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: selected_role,
                            onChanged: (newValue) {
                              setState(() {
                                selected_role = newValue;
                              });
                            },
                            items: role.map((String item) {
                              return DropdownMenuItem<String>(
                                value: item,
                                child: Text(item),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    isbuffer
                        ? CircularProgressIndicator()
                        : InkWell(
                            onTap: () async {
                              if (selected_team == 'Select team') {
                                showsnackBar(context, 'Select the team ');
                              } else if (_playename.text.length == 0) {
                                showsnackBar(context, 'Enter player name');
                              } else {
                                
                                setState(() {
                                  isbuffer = true;
                                });
                              }
                            },
                            child: Ink(
                              height: 50,
                              width: 300,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(colors: [
                                    Color.fromRGBO(143, 148, 251, 1),
                                    Color.fromRGBO(143, 148, 251, 6),
                                  ])),
                              child: Center(
                                child: Text("Register player ",
                                    style: TextStyle(
                                      color: Colors.white,
                                    )),
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            );
          }
        });
  }
}
