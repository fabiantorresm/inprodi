import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:inprodi/src/constants/commons.dart';
import 'package:inprodi/src/logic/bloc/user/user_bloc.dart';

import 'package:inprodi/src/ui/pages/home/home_page.dart';

class App extends StatelessWidget {
  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'InprodiMx',
      theme: ThemeData(primaryColor: primaryColor, brightness: Brightness.dark),
      navigatorKey: _navigatorKey,
      onGenerateRoute: (_) => HomePage.route(),
      builder: (context, child) {
        return BlocProvider(
          create: (context) =>
              UserBloc(httpClient: http.Client())..add(UserFetched()),
          child: child,
        );
      },
    );
  }
}
