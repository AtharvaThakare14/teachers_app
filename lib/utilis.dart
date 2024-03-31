import 'package:teachers_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static void showDialogBox(
      {required BuildContext context, String? title, String? message}) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(title ?? "Alert"),
              content: Text(message ?? "something  went wrong !"),
              actions: <Widget>[
                TextButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ));
  }

  static SnackBar errorSnackBar(
      {String message = "Something went wrong! try again later"}) {
    return SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Text(message),
      backgroundColor: kErrorColor,
    );
  }

  static SnackBar successSnackBar({String message = "Success!"}) {
    return SnackBar(
      content: Text(message),
      backgroundColor: kSuccessColor,
    );
  }

  static showLoader(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  static showSnackBar(BuildContext context, SnackBar snackBar) {
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static showErrorToast({String message = "Something went wrong!"}) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        textColor: kWhite,
        fontSize: 12.0);
  }

  static isThereCurrentDialogShowing(BuildContext context) =>
      ModalRoute.of(context)?.isCurrent != true;
}
