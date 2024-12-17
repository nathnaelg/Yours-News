// validator function for validating email input text 
class AppValidator {
  static String? email(String? text) {
    final valid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(text ?? "");
    if (!valid) {
      return "Please enter a valid email address!";
    }
    return null;
  }

  

  // validator function for validating fullname and email or phone input i alaways 
  // use this class to validate input texts thats why i included this functions also

  static String? fullName(String? text) {
    if (text == null || text.isEmpty) {
      return "Please enter your full name";
    } else {
      final words = text.trim().split(' ');
      if (words.length < 2) {
        return "Please enter your first and last name with space";
      } else {
        final valid = RegExp(r'^[a-zA-Z]+ [a-zA-Z]+$').hasMatch(text);
        if (!valid) {
          return "Please enter your full name with a space";
        }
      }
    }
    return null;
  }

  static String? emailOrPhone(String? text) {
    final validEmail = email(text);

    if (validEmail != null) {
      return "Please enter a valid email address or phone number!";
    }

    return null;
  }

  static String? required(String? text, String field) {
    if ((text ?? "").isEmpty) return "Please provide $field";
    return null;
  }
}
