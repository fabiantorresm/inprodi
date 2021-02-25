import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:inprodi/simple_bloc_observer.dart';

import 'package:inprodi/app.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(App());
}


// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         home: Scaffold(
//       body: Container(
//         width: double.infinity,
//         height: double.infinity,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text('Hola mundo'),
//             new MaterialButton(
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(20.0))),
//               elevation: 5.0,
//               minWidth: 200.0,
//               height: 35,
//               color: Color(0xFF801E48),
//               child: new Text('Get Users',
//                   style: new TextStyle(fontSize: 16.0, color: Colors.white)),
//               onPressed: () async {
//                 // UserResponse data = await getUser();
//                 // print(data.users.length);
//               },
//             ),
//           ],
//         ),
//       ),
//     ));
//   }

  // Future<UserResponse> getUsers() async {
  //   try {
  //     Response response = await _dio.get(_endpoint);
  //     print(response.data);
  //     return UserResponse.fromJson(response.data);
  //   } catch (error, stacktrace) {
  //     print("Exception occured: $error stackTrace: $stacktrace");
  //     return UserResponse.withError("$error");
  //   }
  // }
// }
