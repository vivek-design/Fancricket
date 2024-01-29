import 'dart:convert';
import 'package:fancrick/Admin/Scedulematch.dart';
import 'package:fancrick/Admin/adminfront.dart';
import 'package:fancrick/Admin/editteam.dart';
import 'package:fancrick/Admin/registerplayer.dart';
import 'package:fancrick/Admin/registerteam.dart';
import 'package:fancrick/Utilities/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class editeam extends StatefulWidget {
  const editeam({super.key});

  @override
  State<editeam> createState() => _editeamState();
}

class _editeamState extends State<editeam> {
  int _index = 0;
  int bindex = 2;
  int selected_tab = 0;
  ImagePicker _imagePicker = ImagePicker();
  late final TextEditingController _teamname;
  Image? _pickedImage;
  bool _ispicked = false;
  bool isbuffer = false;

  Future<void> pickImage() async {
    try {
      final XFile? image =
          await _imagePicker.pickImage(source: ImageSource.gallery);

      if (image == null) {
        return;
      }

      List<int> imageBytes = await image.readAsBytes();
      String base64Image = base64Encode(imageBytes);
      print(base64Image);

      setState(() {
        // Directly set the picked image as the background image of CircleAvatar
        _ispicked = true;
        bytes = base64.decode(base64Image);
      });
    } catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future<int> calimage() async {
    ByteData data = await rootBundle.load('assets/images/images.jpeg');
    List<int> byte = data.buffer.asUint8List();
    String base64Image = base64Encode(byte);
    bytes = base64.decode(base64Image);
    setState(() {});
    return 1;
  }

  @override
  void initState() {
    // TODO: implement initState
    calimage();
    _teamname = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _teamname.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit teams"),
        backgroundColor: anywhere,
        toolbarHeight: 100,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        _index = 0;
                        selected_tab = 0;
                      });
                    },
                    child: Container(
                      height: 40,
                      width: 150,
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(40),
                          color: selected_tab == 0
                              ? Color.fromARGB(66, 144, 6, 6)
                              : Colors.transparent),
                      child: Center(child: Text('Register new team')),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _index = 1;
                        selected_tab = 1;
                      });
                    },
                    child: Container(
                      height: 40,
                      width: 150,
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(40),
                          color: selected_tab == 1
                              ? Color.fromARGB(66, 144, 6, 6)
                              : Colors.transparent),
                      child: Center(child: Text('Register player')),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _index = 2;
                        selected_tab = 2;
                      });
                    },
                    child: Container(
                      height: 40,
                      width: 150,
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(40),
                          color: selected_tab == 2
                              ? Color.fromARGB(66, 144, 6, 6)
                              : Colors.transparent),
                      child: Center(child: Text('Edit team ')),
                    ),
                  ),
                ]),
              ),
              SizedBox(
                height: 40,
              ),
              _index == 0
                  ? registerteam()
                  : _index == 1
                      ? registerplayer()
                      : edit_team()
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10,
        selectedItemColor: anywhere,
        currentIndex: bindex,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return AdminFront();
              }));
              break;
            case 1:
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return schedulematch();
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
