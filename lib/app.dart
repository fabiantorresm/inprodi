import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:inprodi/src/constants/commons.dart';
import 'package:inprodi/src/logic/bloc/user/user_bloc.dart';

import 'package:inprodi/src/ui/pages/home/home_page.dart';

import 'src/ui/widgets/widgets.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Infinite Scroll',
      theme: ThemeData(primaryColor: primaryColor),
      home: Scaffold(
          appBar: AppBar(
            brightness: Brightness.dark,
            title: Center(child: Text('InprodiMX')),
          ),
          body: BlocProvider(
            create: (context) =>
                UserBloc(httpClient: http.Client())..add(UserFetched()),
            child: HomePage(),
          ),
          bottomNavigationBar: MyBottomAppBar()),
    );
  }
}
