extension EmailValidator on String {
  bool get isValidEmail {
    final emailRegex = RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    );
    return emailRegex.hasMatch(this);
  }
}
