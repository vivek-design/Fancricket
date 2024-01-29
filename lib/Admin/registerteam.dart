
import 'package:fancrick/Features/AdminFeature/adminfeatues.dart';
import 'package:fancrick/Utilities/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:fancrick/Utilities/snackbar.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class registerteam extends StatefulWidget {
  const registerteam({super.key});

  @override
  State<registerteam> createState() => _registerteamState();
}

class _registerteamState extends State<registerteam> {

    int _index = 2;
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
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
                child: Column(
                children:[
                  
                   Container(
                      child: (CircleAvatar(
                          radius: 58, backgroundImage: MemoryImage(bytes)))),
                
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    //this process returns the future so withput the use of await keywoed it will return the instance of future
                    pickImage();
                  },
                  child: Ink(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(colors: [
                          Color.fromRGBO(143, 148, 251, 1),
                          Color.fromRGBO(143, 148, 251, 6),
                        ])),
                    child: Center(
                      child: Text("Pick logo",
                          style: TextStyle(
                            color: Colors.white,
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
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
                          controller: _teamname,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "  Enter the name of the team",
                              hintStyle: TextStyle(color: Colors.grey[400])),
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
                  height: 60,
                ),
              
                isbuffer?CircularProgressIndicator():
                InkWell(
                  onTap: () async {
                    if (_teamname.text.length == 0) {
                      showsnackBar(context, "Team name can not be empty");
                    } else {
                      adminservice ads = adminservice();
                      ads.registerTeam(
                          context: context,
                          img: bytes,
                          teamname: _teamname.text.toString());
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
                      child: Text("Register team ",
                          style: TextStyle(
                            color: Colors.white,
                          )),
                    ),
                  ),
                ),
              
                ]
                ),
              );
  }
}

