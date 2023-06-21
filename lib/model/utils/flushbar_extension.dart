import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

extension FlushBarExtension on BuildContext {
  showErrorFlushbar(String text) {
    Flushbar(
      barBlur: 0.25,
      positionOffset: 20,
      flushbarStyle: FlushbarStyle.FLOATING,
      maxWidth: MediaQuery.of(this).size.width * 0.3,
      duration: const Duration(seconds: 4),
      borderRadius:
          BorderRadius.circular(MediaQuery.of(this).size.height * 0.02),
      
      backgroundColor: Colors.red,
      messageText: Text(
        text,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontSize: MediaQuery.of(this).size.height * 0.0175),
      ),
      flushbarPosition: FlushbarPosition.BOTTOM,
    ).show(this);
  }

  showSuccesFlashbar(String text) {
    Flushbar(
      barBlur: 0.25,
      positionOffset: 20,
      flushbarStyle: FlushbarStyle.FLOATING,
      maxWidth: MediaQuery.of(this).size.width * 0.3,
      duration: const Duration(seconds: 4),
      
      borderRadius:
          BorderRadius.circular(MediaQuery.of(this).size.height * 0.02),
      backgroundColor: Colors.green,
      messageText: Text(
        text,
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: MediaQuery.of(this).size.height * 0.0175),
      ),
      flushbarPosition: FlushbarPosition.BOTTOM,
    ).show(this);
  }

  showInfoFlashbar(String text) {
    Flushbar(
      barBlur: 0.25,
      positionOffset: 20,
      dismissDirection: FlushbarDismissDirection.HORIZONTAL,
      flushbarStyle: FlushbarStyle.FLOATING,
      maxWidth: MediaQuery.of(this).size.width * 0.3,
      duration: const Duration(seconds: 5),
      
      borderRadius:
          BorderRadius.circular(MediaQuery.of(this).size.height * 0.02),
      backgroundColor: Colors.black,
      messageText: Text(
        text,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: MediaQuery.of(this).size.height * 0.0175),
      ),
      flushbarPosition: FlushbarPosition.BOTTOM,
    ).show(this);
  }
}
