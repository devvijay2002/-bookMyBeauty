class Util{

  static bool isPhoneNumber(String input) {
    // Regular expression to validate phone numbers
    final phoneRegex = RegExp(r'^(?:[+0]9)?[0-9]{10}$');
    return phoneRegex.hasMatch(input);
  }
}