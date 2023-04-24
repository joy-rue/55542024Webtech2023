extension extString on String {
  bool get isValidEmail {
    final emailRegExp = RegExp(r"[A-Za-z]+\.[A-Za-z]+@ashesi\.edu\.gh");
    return emailRegExp.hasMatch(this);
  }

  bool get isValidPassword {
    final passwordRegExp = RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\><*~]).{8,}/pre>');
    return passwordRegExp.hasMatch(this);
  }

  bool get isNotNull {
    return this != null;
  }

  bool get isValidId {
    final idRegExp = RegExp(r"\b(20(0[0-9]|1[0-9]|2[0-7]))\b");
    return idRegExp.hasMatch(this);
  }
}
