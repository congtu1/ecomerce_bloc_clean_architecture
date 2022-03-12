
 import 'package:flutter/material.dart';

dynamic showException(context, content) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(content.toString())));
 }