import 'package:flutter/material.dart';
import 'package:to_do/core/exceptions/failures.dart';
import 'package:to_do/main.dart';

void displayErrorSnackBar(Exception exception) {
  late final SnackBar snackBar;
  if (exception is Failure) {
    snackBar = SnackBar(content: Text(exception.message));
  } else {
    snackBar = SnackBar(content: Text(exception.toString()));
  }
  rootScaffoldMessengerKey.currentState?.showSnackBar(snackBar);
}

void showLoadingDialog(String message, BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const CircularProgressIndicator(),
              const SizedBox(
                width: 20,
              ),
              Text(message),
            ],
          ),
        ),
      );
    },
  );
}
