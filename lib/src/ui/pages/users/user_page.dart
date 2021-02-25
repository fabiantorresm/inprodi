import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import 'package:inprodi/providers/user_provider.dart';
// import 'package:inprodi/src/models/models.dart';

class UserPage extends StatelessWidget {
  final int id;
  final String name;
  // final UserRepository _userRepository = UserRepository();

  UserPage({@required this.id, @required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(name),
        ),
        body: Container(
          child: Text('Hola'),
        )
        // FutureProvider(
        //   create: (context) => _userRepository.getUser(id),
        //   child: Center(
        //     child: Consumer<User>(
        //       builder: (context, employee, widget) {
        //         return (employee != null)
        //             ? Text('User Phone: ${employee.phone}')
        //             : CircularProgressIndicator();
        //       },
        //     ),
        //   ),
        // )
        );
  }
}
