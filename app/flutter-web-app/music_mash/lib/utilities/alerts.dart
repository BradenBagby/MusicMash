import 'package:flutter/material.dart';

class Alerts {
  static Future<void> ok(
      {required String message, required BuildContext context}) {
    Widget okButton = ElevatedButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text(message),
      content: Container(),
      actions: [
        okButton,
      ],
    );

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
