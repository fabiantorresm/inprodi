import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:inprodi/src/models/models.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final http.Client httpClient;

  UserBloc({@required this.httpClient}) : super(UserInitial());

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    final currentState = state;
    if (event is UserFetched && !_hasReachedMax(currentState)) {
      try {
        if (currentState is UserInitial) {
          final users = await _fetchUsers(0, 10);
          yield UserSuccess(users: users, hasReachedMax: false);
          return;
        }
        if (currentState is UserSuccess) {
          final users = await _fetchUsers(currentState.users.length, 10);
          yield users.isEmpty
              ? currentState.copyWith(hasReachedMax: true)
              : UserSuccess(
                  users: currentState.users + users,
                  hasReachedMax: false,
                );
        }
      } catch (_) {
        yield UserFailure();
      }
    }
  }

  bool _hasReachedMax(UserState state) =>
      state is UserSuccess && state.hasReachedMax;

  Future<List<User>> _fetchUsers(int startIndex, int limit) async {
    String url = 'https://randomuser.me/api/?page=1&results=10';
    // url = ''https://jsonplaceholder.typicode.com/posts?_start=$startIndex&_limit=$limit'';
    final response = await httpClient.get(url);

    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      UserResponse results = UserResponse.fromJson(body);
      final data = results.users;
      return data.map((rawUser) {
        return User(
          gender: rawUser.gender,
          name: rawUser.name,
          location: rawUser.location,
          email: rawUser.email,
          phone: rawUser.phone,
          cell: rawUser.cell,
          picture: rawUser.picture,
        );
      }).toList();
    } else {
      throw Exception('Error al obtener usuarios');
    }
  }
}
