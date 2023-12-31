import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void displayMessage(BuildContext context, var message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    duration: const Duration(seconds: 2),
    content: Text(message),
  ));
}

void displayMessageWithActionButton(BuildContext context, String title,
    String message, List<Widget> actionButton) {
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(title),
    content: Text(message),
    actions: actionButton,
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

///Print when app is debug
void debugPrintLog(var msg) {
  if (!kReleaseMode) {}
}

bool isToastShowing = false;
void displayToastMessage(var message,
    {var backgroundColor = Colors.black, var textColor = Colors.white}) {
  if (!isToastShowing) {
    isToastShowing = true;

    Fluttertoast.showToast(
      msg: message,
      backgroundColor: backgroundColor,
      textColor: textColor,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
    );
    // Reset the boolean after the toast is hidden

    Future.delayed(const Duration(seconds: 2), () {
      isToastShowing = false;
    });
  }
}

showLoaderDialog(BuildContext context) {
  AlertDialog alert = AlertDialog(
    content: Row(
      children: [
        const CircularProgressIndicator(
          color: Colors.blue,
        ),
        Container(
            margin: const EdgeInsets.only(left: 7),
            child: const Text('Loading...')),
      ],
    ),
  );
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

String getDateFromString(String value) {
  int tIndex = value.indexOf('T');
  return value.substring(0, tIndex);
}

String getTimeFromString(String value) {
  int tIndex = value.indexOf('T');
  String timeStr = value.substring(tIndex + 1);
  return timeStr.substring(0, 5);
}

String converColorToHex(Color color) {
  String hexColor =
      '#${color.value.toRadixString(16).substring(2).toUpperCase()}';
  return hexColor;
}

String convertHexToColor(Color color) =>
    (color.value & 0xFFFFFF).toRadixString(16).padLeft(0, '6');

Color convertColorToHex(String color) {
  return Color(int.parse('0xff${color.substring(1)}'));
}

AppLocalizations translation(BuildContext context) {
  return AppLocalizations.of(context);
}
