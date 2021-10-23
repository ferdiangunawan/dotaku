import 'package:flutter/material.dart';

class Commons {
  static AppBar appBar({required BuildContext context, required String title}) {
    return AppBar(
      centerTitle: true,
      title: Text(title),
      backgroundColor: Colors.black26,
    );
  }

  static CircularProgressIndicator loadingIndicator() {
    return const CircularProgressIndicator(
      color: Colors.white,
    );
  }
}
