import 'package:flutter/services.dart';

class CapitalizeTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final capitalizedText = capitalizeWords(newValue.text);
    return newValue.copyWith(text: capitalizedText);
  }

  String capitalizeWords(String text) {
    List<String> words = text.split(' ');
    words = words.map((word) => capitalizeFirstLetter(word)).toList();
    return words.join(' ');
  }

  String capitalizeFirstLetter(String word) {
    if (word.isEmpty) return word;
    return word.substring(0, 1).toUpperCase() + word.substring(1).toLowerCase();
  }
}
