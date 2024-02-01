import 'package:fancrick/Features/AdminFeature/adminfeatues.dart';
import 'package:fancrick/Model/teams.dart';
import 'package:fancrick/Utilities/snackbar.dart';

import 'package:flutter/material.dart';

class schedulewidget extends StatefulWidget {
  const schedulewidget({super.key});

  @override
  State<schedulewidget> createState() => _schedulewidgetState();
}

class _schedulewidgetState extends State<schedulewidget> {
  late Future<List<teammodel>?> _team2;
  late Future<List<teammodel>?> _team1;
  List<teammodel>? team1 = [];
  List<teammodel>? team2 = [];
  String selected_team1 = 'Select team';
  String selected_team2 = 'Select team';
  bool isbuffer = false;
  late TextEditingController contest_name;

  adminservice admin = adminservice();
  void initState() {
    // TODO: implement initState
    super.initState();

    _team1 = admin.getteam(context: context);
    _team2 = _team1;
    contest_name = new TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    contest_name.dispose();
  }

  DateTime selectedDateTime = DateTime.now();

  Future<void> _selectDateTime(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDateTime,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDateTime) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(selectedDateTime),
      );
      if (pickedTime != null) {
        setState(() {
          selectedDateTime = DateTime(
            picked.year,
            picked.month,
            picked.day,
            pickedTime.hour,
            pickedTime.minute,
          );
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _team1,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            team1 = snapshot.data;
            team2 = snapshot.data;

            return SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(20),
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
                            value: selected_team1,
                            onChanged: (newValue) {
                              setState(() {
                                selected_team1 = newValue!;
                              });
                            },
                            items: team1?.map((teammodel item) {
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
                    Image.asset(
                      'assets/images/vs.png',
                      height: 60,
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
                            value: selected_team2,
                            onChanged: (newValue) {
                              setState(() {
                                selected_team2 = newValue!;
                              });
                            },
                            items: team2?.map((teammodel item) {
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
                      height: 50,
                    ),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(143, 148, 251, 1),
                                  blurRadius: 20.0,
                                  offset: Offset(0, 10))
                            ]),
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(),
                          child: TextFormField(
                              controller: contest_name,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "  Enter the name of the contest",
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
                      height: 40,
                    ),
                    isbuffer
                        ? CircularProgressIndicator()
                        : InkWell(
                            onTap: () async {
                              if (selected_team1 == selected_team2) {
                                showsnackBar(
                                    context, "Select two different teams");
                              } else if (selected_team1 == 'Select team' ||
                                  selected_team2 == 'Select team') {
                                showsnackBar(context, "Select proper teams");
                              } else if (contest_name.text.isEmpty) {
                                showsnackBar(
                                  context,
                                  "Enter the contest name"
                                );
                              } else {
                                admin.create_contest(
                                    context: context,
                                    team1: selected_team1.toString(),
                                    team2: selected_team2.toString(),
                                    contest_name: contest_name.text.toString());
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
                                child: Text("Schedule match ",
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
