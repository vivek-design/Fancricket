import 'dart:io';


import 'package:flutter/material.dart';

void showsnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
}