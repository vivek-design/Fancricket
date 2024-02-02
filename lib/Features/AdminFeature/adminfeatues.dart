import 'dart:convert';
import 'dart:typed_data';
import 'package:fancrick/Admin/Edittem.dart';
import 'package:fancrick/Model/contest.dart';
import 'package:fancrick/Model/teams.dart';
import 'package:fancrick/Utilities/constants.dart';
import 'package:fancrick/Utilities/errorhandling.dart';
import 'package:fancrick/Utilities/snackbar.dart';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class adminservice {
  void registerTeam({
    required BuildContext context,
    required Uint8List img,
    required String teamname,
  }) async {
    try {
      String imgBase64 = await base64Encode(img);
      print(imgBase64);
      String type = "";

      if (imgBase64.startsWith('/9j/') || imgBase64.startsWith('/9g/')) {
        type = "jpeg";
      }

      if (imgBase64.startsWith('iVBORw0KGgoAAAANSUhEUgAA')) {
        type = "png";
      }

      String temp = "data:image/$type;base64,";
      imgBase64 = temp + imgBase64;
      http.Response res = await http.post(Uri.parse('$uri/api/v1/create-team'),
          body: jsonEncode({
            'name': teamname,
            'logo': imgBase64,
          }),
          headers: {
            'Content-Type': 'application/json; charset=utf-8',
          });
      print(res.statusCode);
      print(jsonDecode(res.body)['message']);
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            showsnackBar(context, "Team registered");
            Navigator.pop(context);
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return editeam();
            }));
          });
    } catch (e) {
      showsnackBar(context, e.toString());
    }
  }

  void registerplayer({
    required BuildContext context,
    required String team,
    required String name,
    required String role,
  }) async {
    try {
      http.Response res =
          await http.post(Uri.parse('$uri/api/v1/create-player'),
              body: jsonEncode({
                'role': role,
                'username': name,
                'teamName': team,
              }),
              headers: {
            'Content-Type': 'application/json; charset=utf-8',
          });

      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            showsnackBar(context, "Player registered");
            Navigator.pop(context);
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return editeam();
            }));
          });
    } catch (e) {
      showsnackBar(context, e.toString());
    }
  }

  void create_contest({
    required BuildContext context,
    required String team1,
    required String team2,
    required String contest_name,
  }) async {
    try {
      http.Response res =
          await http.post(Uri.parse('$uri/api/v1/create-contest'),
              body: jsonEncode({
                "name": contest_name,
                "teamLeftName": team1,
                "teamRightName": team2,
              }),
              headers: {
            'Content-Type': 'application/json; charset=utf-8',
          });

      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            showsnackBar(context, "Contest generated");
            Navigator.pop(context);
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return editeam();
            }));
          });
    } catch (e) {
      showsnackBar(context, e.toString());
    }
  }

  Future<List<teammodel>> getteam({required BuildContext context}) async {
    List<teammodel> temp = [];

    try {
      http.Response res =
          await http.get(Uri.parse('$uri/api/v1/get-team'), headers: {
        'Content-Type': 'application/json; charset=utf-8',
      });

      List<dynamic> teams = jsonDecode(res.body)['teams'];
      teammodel hle =
          new teammodel(logo: 'jdfjsjf', id: 'sdfjsf', name: 'Select team');
      temp.add(hle);
      for (var team in teams) {
        String teamId = team['_id'];
        String teamName = team['name'];
        String teamLogoUrl = team['logo']['url'];

        teammodel hle =
            new teammodel(logo: teamLogoUrl, id: teamId, name: teamName);
        temp.add(hle);
      }
    } catch (e) {
      showsnackBar(context, e.toString());
    }

    return temp;
  }

  Future<List<contests>> getcontest(BuildContext context) async {
    List<contests> ret = [];
    try {
      http.Response res =
          await http.get(Uri.parse('$uri/api/v1/get-all-contests'), headers: {
        'Content-Type': 'application/json; charset=utf-8',
      });

      List<dynamic> contest = jsonDecode(res.body)['contests'];

      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () async {
            await Future.forEach(contest, (con) async {
              String _name = con['name'].toString();
              String _id = con['_id'].toString();
              String leftteam = con['teamLeftData']['name'].toString();
              String rightteam = con['teamRightData']['name'].toString();
              String leftteamlogo =
                  con['teamLeftData']['logo']['url'].toString();
              String rightteamlogo =
                  con['teamRightData']['logo']['url'].toString();
              String righttem = con['teamRightData']['name'].toString();
              String status = con['status'].toString();
            
              contests cont = contests(
                contestid: _id,
                logo1: leftteamlogo,
                team_name1: leftteam,
                logo2: rightteamlogo,
                team_name2: rightteam,
                contest_name: _name,
                status: "",
              );

              ret.add(cont);
            });
          });
    } catch (e) {
      showsnackBar(context, e.toString());
    }

    return ret;
  }
}
