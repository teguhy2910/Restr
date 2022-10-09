import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restr/src/constants/constants.dart';

customDialog(BuildContext context) {
  if (Platform.isIOS) {
    showCupertinoDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(
            'Coming Soon!',
            style: AppThemes.headline3,
          ),
          content: Text(
            'This feature will be coming soon!',
            style: AppThemes.text1,
          ),
          actions: [
            CupertinoDialogAction(
              child: Text(
                'Ok',
                style: AppThemes.text1,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  } else {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Coming Soon!',
            style: AppThemes.headline3,
          ),
          content: Text(
            'This feature will be coming soon!',
            style: AppThemes.text1,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Ok',
                style: AppThemes.text1,
              ),
            ),
          ],
        );
      },
    );
  }
}
