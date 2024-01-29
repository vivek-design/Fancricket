import 'dart:convert';
import 'package:fancrick/Utilities/snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

void httpErrorHandle({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSuccess,
}) async {
  switch (response.statusCode) {
    case 201:
      onSuccess();
      break;
    case 400:
      showsnackBar(context, jsonDecode(response.body)['message'].toString());
      Navigator.pop(context);
      break;

    case 500:
      print(response.body);
      showsnackBar(context, jsonDecode(response.body)['message'].toString());
      break;
    default:
      showsnackBar(context, response.body);
  }
}
