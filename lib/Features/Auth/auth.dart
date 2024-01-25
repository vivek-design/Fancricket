import 'dart:convert';
import 'package:fancrick/Model/user.dart';
import 'package:fancrick/Provider/userprovider.dart';
import 'package:fancrick/Utilities/constants.dart';
import 'package:fancrick/Utilities/errorhandling.dart';
import 'package:fancrick/Utilities/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';



class AuthService {
  void signUpUser({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      User user = User(
          id: '',
          name: name,
          email: email,
          password: password, 
          token: '', 
          type: 'User',
        );
      http.Response res = await http.post(Uri.parse('$uri/signup'),
          body: user.toJson(),
          headers: {
            'Content-Type': 'application/json; charset=utf-8',
          });

      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            showsnackBar(
                context, "Account Created ! login with the same credentials");
          });
    } catch (e) {
      showsnackBar(context, e.toString());
    }
  }

//signin User
  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      http.Response res = await http.post(Uri.parse('$uri/signin'),
          body: jsonEncode({
            "email": email,
            "password": password,
          }),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=utf-8',
          });

      print(res.body);
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            Provider.of<UserProvider>(context, listen: false).setUser(res.body);
            await prefs.setString(
                'x-auth-token', jsonDecode(res.body)['token']);
                  

                  
           
          });
    } catch (e) {
      showsnackBar(context, e.toString());
    }
  }

  //get user data
  void getUserData(BuildContext context) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');
      if (token == null) {
        prefs.setString('x-auth-token', '');
      }

      var tokenRes = await http
          .post(Uri.parse("$uri/tokenIsValid"), headers: <String, String>{
        'Content-Type': 'application/json; charset=utf-8',
        'x-auth-token': token!,
      });

      var response = jsonDecode(tokenRes.body);

      if (response == true) {
        //get user data
        http.Response userRes = await http.get(Uri.parse('$uri/'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=utf-8',
              'x-auth-token': token
            });

        var userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.setUser(userRes.body);
      }
   
    } catch (e) {
      showsnackBar(context, e.toString());
    }
  }
}
