class RegistrationData {
  final String email;
  final String firstName;
  final String lastName;
  final String password;

  RegistrationData({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.password,
  });

  RegistrationData copyWith({
    String? email,
    String? firstName,
    String? lastName,
    String? password,
  }) {
    return RegistrationData(
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      password: password ?? this.password,
    );
  }
} 