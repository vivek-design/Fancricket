import 'dart:convert';
import 'package:fancrick/Admin/adminfront.dart';
import 'package:fancrick/Features/Register/rergister.dart';
import 'package:fancrick/Model/user.dart';
import 'package:fancrick/Provider/userprovider.dart';
import 'package:fancrick/User/userfront.dart';
import 'package:fancrick/Utilities/constants.dart';
import 'package:fancrick/Utilities/errorhandling.dart';
import 'package:fancrick/Utilities/snackbar.dart';
import 'package:fancrick/welcome.dart';
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
    required String phone,
  }) async {
    try {
      http.Response res = await http.post(Uri.parse('$uri/api/v1/register'),
          body: jsonEncode({
            "name": name,
            "email": email,
            'password': password,
            'phone': phone
          }),
          headers: {
            'Content-Type': 'application/json; charset=utf-8',
          });

      if (res.statusCode == 201) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString(
            'register_token', jsonDecode(res.body)['activationToken']['token']);
        prefs.setString('email', email.toString());
        prefs.setString('password', password.toString());
      }

      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            showsnackBar(context, "Otp send Please fill it");
          });
    } catch (e) {
      print(e.toString());
      showsnackBar(context, e.toString());
      Navigator.pop(context);
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return register();
      }));
    }
  }

//signin User
  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      http.Response res = await http.post(Uri.parse('$uri/api/v1/login'),
          body: jsonEncode({
            "email": email,
            "password": password,
          }),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=utf-8',
          });

      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();

            await prefs.setString(
                'x-auth-token', jsonDecode(res.body)['token']);
            prefs.setString('email', email.toString());
            prefs.setString('password', password.toString());

            String namee = jsonDecode(res.body)['user']['name'].toString();
            String id = jsonDecode(res.body)['user']['_id'].toString();

            String role = jsonDecode(res.body)['user']['role'].toString();

            String phone = jsonDecode(res.body)['user']['phone'].toString();
            User user = User(
                id: id,
                name: namee,
                email: email,
                password: password,
                token: jsonDecode(res.body)['token'].toString(),
                type: role,
                phone: phone);
            var userProvider =
                Provider.of<UserProvider>(context, listen: false);
            userProvider.setUserFromModel(user);

            showsnackBar(context, "logging in ");
            if (role == 'user') {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return AdminFront();
              }));
            } else {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return AdminFront();
              }));
            }
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

  void verifyotp(BuildContext context, String otp) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('register_token');

      var tokenRes = await http.post(Uri.parse("$uri/api/v1/activate"),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=utf-8',
          },
          body: jsonEncode({
            'activation_token': token!,
            'activation_code': otp,
          }));

      print(tokenRes.body);
      var response = jsonDecode(tokenRes.body);
      print(tokenRes.statusCode);
      if (tokenRes.statusCode == 200) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('x-auth-token', response['token']);
        String? token = prefs.getString('x-auth-token');

        var userProvider = Provider.of<UserProvider>(context, listen: false);

        String namee = response['user']['name'].toString();
        String id = response['user']['_id'].toString();

        String role = response['user']['role'].toString();

        String phone = response['user']['phone'].toString();

        String email = response['user']['email'].toString();

        User user = new User(
            id: id,
            name: namee,
            email: email,
            password: '',
            token: response['token'],
            type: role,
            phone: phone);
        userProvider.setUserFromModel(user);
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return user_front();
        }));
      } else {
        showsnackBar(context, "otp verification failed ");
        Navigator.pop(context);
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return gettingstarted();
        }));
      }
    } catch (e) {
      showsnackBar(context, e.toString());
    }
  }
}
