

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showMessageSnackBar(BuildContext context,String message) {
   SnackBar snackBar = SnackBar(
    content: Text(message),
     duration: const Duration(seconds: 10),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}