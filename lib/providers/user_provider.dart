import 'package:flutter/material.dart';

import 'package:inprodi/repositories/user_repository.dart';

import 'package:inprodi/src/models/models.dart';

class UserProvider extends ChangeNotifier {
  UserRepository _userRepository = UserRepository();

  List<User> _users = [];

  List<User> get getUsers => _users;

  Future<List<User>> getData() async {
    UserResponse response = await _userRepository.getUsers();
    _users = response.users;
    return _users;
  }

  Future<User> getUser(int id) async {
    UserResponse response = await _userRepository.getUser(id);
    return response.users[0];
  }
}

// class UserRepository {
//   Future<List<User>> fetchUsers() async {
//     var response = await http.get("https://jsonplaceholder.typicode.com/users");
//     var jsonResponse = convert.jsonDecode(response.body) as List;
//     return jsonResponse.map((user) => User.fromJson(user)).toList();
//   }

//   Future<User> fetchuser(int id) async {
//     var response =
//         await http.get("https://jsonplaceholder.typicode.com/users/$id");
//     var jsonResponse = convert.jsonDecode(response.body);
//     return User.fromJson(jsonResponse);
//   }
// }
