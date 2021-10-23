import 'package:flutter/material.dart';

class Commons {
  //loading
  static Widget loadingIndicator = const CircularProgressIndicator(color: Colors.black);
  //appBar
  static appBar({required BuildContext context, required String title}) {
    AppBar(
      title: Text(title),
      backgroundColor: Colors.black26,
    );
  }
}
