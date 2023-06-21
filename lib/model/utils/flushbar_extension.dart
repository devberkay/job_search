import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

extension FlushBarExtension on BuildContext {
  showErrorFlushbar(String text) {
    Flushbar(
      flushbarStyle: FlushbarStyle.FLOATING,
      maxWidth: MediaQuery.of(this).size.width * 0.5,
      duration: const Duration(seconds: 4),
      borderRadius:
          BorderRadius.circular(MediaQuery.of(this).size.height * 0.02),
      margin: EdgeInsets.only(top: 15),
      backgroundColor: Colors.red,
      messageText: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontSize: MediaQuery.of(this).size.height * 0.0175),
      ),
      flushbarPosition: FlushbarPosition.TOP,
    ).show(this);
  }

  showSuccesFlashbar(String text) {
    Flushbar(
      flushbarStyle: FlushbarStyle.FLOATING,
      maxWidth: MediaQuery.of(this).size.width * 0.5,
      duration: const Duration(seconds: 4),
      margin: EdgeInsets.only(top: 15),
      borderRadius:
          BorderRadius.circular(MediaQuery.of(this).size.height * 0.02),
      backgroundColor: Colors.green,
      messageText: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: MediaQuery.of(this).size.height * 0.0175),
      ),
      flushbarPosition: FlushbarPosition.TOP,
    ).show(this);
  }

  showInfoFlashbar(String text) {
    Flushbar(
      flushbarStyle: FlushbarStyle.FLOATING,
      maxWidth: MediaQuery.of(this).size.width * 0.5,
      duration: const Duration(seconds: 5),
      margin: EdgeInsets.only(top: 15),
      borderRadius:
          BorderRadius.circular(MediaQuery.of(this).size.height * 0.02),
      backgroundColor: Colors.black,
      messageText: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: MediaQuery.of(this).size.height * 0.0175),
      ),
      flushbarPosition: FlushbarPosition.TOP,
    ).show(this);
  }
}
