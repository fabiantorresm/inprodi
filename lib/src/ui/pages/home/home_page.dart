import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inprodi/src/logic/bloc/user/user_bloc.dart';
import 'package:inprodi/src/ui/widgets/widgets.dart';

import 'package:inprodi/src/models/models.dart';

List<User> users = [];

class HomePage extends StatefulWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => HomePage());
  }

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;
  UserBloc _userBloc;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _userBloc = BlocProvider.of<UserBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            // color: Colors.red[50],
            child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserInitial) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is UserFailure) {
              return Center(
                child: Text('failed to fetch posts'),
              );
            }
            if (state is UserSuccess) {
              if (state.users.isEmpty) {
                return Center(
                  child: Text('no posts'),
                );
              }
              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return index >= state.users.length
                      ? BottomLoader()
                      : UserWidget(user: state.users[index]);
                },
                itemCount: state.hasReachedMax
                    ? state.users.length
                    : state.users.length + 1,
                controller: _scrollController,
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        )),
      ],
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      _userBloc.add(UserFetched());
    }
  }
}
