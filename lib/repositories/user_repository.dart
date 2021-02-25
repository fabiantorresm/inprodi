import 'package:dio/dio.dart';
import 'package:inprodi/src/models/models.dart';

class UserRepository {
  final String _endpoint = "https://randomuser.me/api/?page=1&results=30";
  final Dio _dio = Dio();

  Future<UserResponse> getUsers() async {
    try {
      Response response = await _dio.get(_endpoint);
      return UserResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return UserResponse.withError("$error");
    }
  }

  Future<UserResponse> getUser(int id) async {
    try {
      Response response = await _dio.get(_endpoint);
      // print(response);
      return UserResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return UserResponse.withError("$error");
    }
  }
}
