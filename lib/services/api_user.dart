import 'package:http/http.dart' as http;
import 'package:user_list_with_api_flutter/model/user.dart';
import 'package:user_list_with_api_flutter/model/user_name.dart';
import 'package:user_list_with_api_flutter/model/user_dob.dart';

import 'dart:convert';

class UserApi {
  static Future<List<User>> fetchUsers() async {
    // print("Fetch");
    const url = 'https://randomuser.me/api/?results=100';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json["results"] as List<dynamic>;
    final users = results.map((user) {
      final name = UserName(
          title: user['name']['title'],
          first: user['name']['first'],
          last: user['name']['last']);
      final userDob = UserDob(
          date: DateTime.parse(user["dob"]["date"]), age: user["dob"]["age"]);
      return User(
          gender: user["gender"],
          email: user["email"],
          phone: user["phone"],
          cell: user["cell"],
          dateOfBirth: userDob,
          username: name,
          imageUrl: user["picture"]["thumbnail"]);
    }).toList();
    // print(users);
    // setState() {
    //   users = transformed;
    // }
    return users;
//
    // print("fetch completed.");
  }
}
