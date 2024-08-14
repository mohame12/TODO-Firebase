import 'package:flutter/material.dart';

void showErrorDialog(BuildContext context, String errorMessage) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Error', style: TextStyle(color: Colors.red)),
        content: Text(errorMessage),
        actions: <Widget>[
          TextButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(context).pop(); // لإغلاق الـ Dialog
            },
          ),
        ],
      );
    },
  );
}