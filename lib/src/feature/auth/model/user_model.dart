class UserModel {
  final String uid;
  final String email;
  final String? firstName;
  final String? lastName;
  final String? photoUrl;

  UserModel({
    required this.uid,
    required this.email,
    this.firstName,
    this.lastName,
    this.photoUrl,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] as String,
      email: map['email'] as String,
      firstName: map['firstName'] as String?,
      lastName: map['lastName'] as String?,
      photoUrl: map['photoUrl'] as String?,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'photoUrl': photoUrl,
    };
  }
} 