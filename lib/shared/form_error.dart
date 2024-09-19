
class FormErrorsFunctions {
  static String? checkIfEmpty(String? s) {
    if (s == null || s.isEmpty) {
      return 'Cannot be empty';
    }
    return null;
  }

  static String? checkPhoneNumber(String? s) {
    //Might add Nepal code here
    if (s == null || s.isEmpty) {
      return 'Cannot be empty';
    }
    /*   if (s.length < 15) {
      return 'Enter a valid mobile number';
    }*/

    /*  if (!Utils.isPhoneNumber(s)) {
      return 'Please enter a valid mobile number';
    }*/
    return null;
  }

  static String? checkPasswordField(String? s, bool signUp) {
    if (s == null || s.isEmpty) {
      return 'Cannot be empty';
    }
    if (signUp) {
      if (s.length < 6) {
        return 'Password cannot be less than 6 digits';
      }
      if (!s.contains(RegExp('[^A-Za-z0-9]'))) {
        return 'Please include a special character @!#\$';
      }
    }
    return null;
  }

  static String? checkEmailField(String? s) {
    if (s == null || s.isEmpty) {
      return 'Cannot be empty';
    }
    if (s.contains('@')) {
      if (!RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(s)) {
        return 'Please enter a valid email address';
      }
    }
    /*  if (s.length < 15) {
      return 'Please enter a valid value';
    }*/
    return null;
  }
}
