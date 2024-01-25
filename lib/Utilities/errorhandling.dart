import 'dart:convert';
import 'package:fancrick/Utilities/snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

void httpErrorHandle({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSuccess,
}) {
  switch (response.statusCode) {
    case 200:
      print(1);
      onSuccess();
      break;
    case 400:
      print(2);
      showsnackBar(context, jsonDecode(response.body)['msg'].toString());
      break;

    case 500:
      print(response.body);
      showsnackBar(context, jsonDecode(response.body)['error'].toString());
      break;
    default:
     
      showsnackBar(context, response.body);
  }
}
