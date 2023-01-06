class UtilsContent {
  static const String utilsContent = '''import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static toastMessage(String message) {
    Fluttertoast.showToast(msg: message);
  }

  static showErrorMessageFlushBar(String message, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        message: message,
        duration: const Duration(seconds: 3),
        //flushbarPosition: FlushbarPosition.TOP,
        backgroundColor: Colors.red,
        reverseAnimationCurve: Curves.easeOut,
        forwardAnimationCurve: Curves.decelerate,
        icon: const Icon(
          Icons.error,
          color: Colors.white,
        ),
      )..show(context),
    );
  }
}
''';
}
