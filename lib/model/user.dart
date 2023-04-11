import 'package:user_list_with_api_flutter/model/user_dob.dart';
import 'package:user_list_with_api_flutter/model/user_name.dart';

class User {
  final String gender;
  final String email;
  final String phone;
  final String cell;
  final UserDob dateOfBirth;
  final UserName username;
  final String imageUrl;

  User(
      {required this.gender,
      required this.email,
      required this.phone,
      required this.cell,
      required this.username,
      required this.dateOfBirth,
      required this.imageUrl});

  String get fullName {
    return '${username.title} ${username.first} ${username.last}';
  }
}
