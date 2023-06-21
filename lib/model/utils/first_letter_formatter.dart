class FirstLetterFormatter {
  static String formatString(String input) {
  if (input.isEmpty) {
    return input;
  }
  
  String formattedString = input.toLowerCase();
  formattedString = formattedString[0].toUpperCase() + formattedString.substring(1);
  
  return formattedString;
}

}