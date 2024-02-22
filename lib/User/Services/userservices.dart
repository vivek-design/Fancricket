import 'dart:convert';
import 'dart:io' as Cookie;

import 'package:fancrick/Model/contestplayersboth.dart';
import 'package:fancrick/Model/player.dart';

import 'package:fancrick/Utilities/constants.dart';
import 'package:fancrick/Utilities/errorhandling.dart';
import 'package:fancrick/Utilities/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class userservices {
  Future<contestbothplayer> getcontestById(
      String id, BuildContext context) async {
    List<player> l1 = [];
    List<player> l2 = [];

    try {
      http.Response res =
          await http.get(Uri.parse('$uri/api/v1/get-contest/${id}'), headers: {
        'Content-Type': 'application/json; charset=utf-8',
      });

      Map<String, dynamic> responseData = jsonDecode(res.body);
      Map<String, dynamic> contestData = responseData['contest'];
      Map<String, dynamic> teamLeft = contestData['teamLeft'];
      List<dynamic> leftplayer = teamLeft['players'];
      Map<String, dynamic> teamRight = contestData['teamRight'];
      List<dynamic> rightplayer = teamRight["players"];
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () async {
            await Future.forEach(leftplayer, (con) async {
              String name = con["username"];
              String _id = con["_id"];
              String role = con["role"];

              player p = player(
                  name: name, team_name: teamLeft["name"], role: role, id: id);
              l1.add(p);
            });
          });

      await Future.forEach(rightplayer, (con) async {
        String name = con["username"];
        String _id = con["_id"];
        String role = con["role"];

        player p =
            player(name: name, team_name: teamLeft["name"], role: role, id: id);
        l2.add(p);
      });
    } catch (e) {
      showsnackBar(context, e.toString());
    }

    contestbothplayer ret = contestbothplayer(list_1: l1, list_2: l2);

    return ret;
  }

  void selecteTeam(
      BuildContext context, List<String> selected_palyer, String id) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');
      http.Response res = await http.post(Uri.parse('$uri/api/v1/join-contest'),
          body: jsonEncode({
            'fantasyTeam': selected_palyer,
            'contestId': id,
          }),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=utf-8',
            'Cookie': 'jwt_token=$token'
          });

      print(res.body);

      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            showsnackBar(context, "Registered into the contest");
            Navigator.pop(context);
          });
    } catch (e) {
      showsnackBar(context, e.toString());
    }
  }
}
