import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inprodi/src/logic/bloc/user/user_bloc.dart';
import 'package:inprodi/src/ui/pages/page_four/page_four.dart';
import 'package:inprodi/src/ui/pages/page_one/page_one.dart';
import 'package:inprodi/src/ui/pages/page_three/page_three.dart';
import 'package:inprodi/src/ui/pages/page_two/page_two.dart';
import 'package:inprodi/src/ui/widgets/widgets.dart';

import 'package:inprodi/src/models/models.dart';
import 'package:line_icons/line_icons.dart';

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
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('InprodiMx')),
        ),
        body: Stack(
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
                    child: Text('Algo ocurrió al conectarse con el servidor.'),
                  );
                }
                if (state is UserSuccess) {
                  if (state.users.isEmpty) {
                    return Center(
                      child: Text('No se encontraron usuarios en la petición.'),
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
        ),
        bottomNavigationBar: BottomAppBar(
          color: Color(0xFF002983),
          shape: CircularNotchedRectangle(),
          child: Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    LineIcons.home,
                  ),
                  color: Colors.white,
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(
                    LineIcons.wallet,
                    size: 30,
                  ),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return PageOne();
                    }));
                  },
                ),
                IconButton(
                  icon: Icon(
                    LineIcons.plusSquare,
                    size: 30,
                  ),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return PageTwo();
                    }));
                  },
                ),
                IconButton(
                  icon: Icon(
                    LineIcons.heart,
                    size: 30,
                  ),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return PageThree();
                    }));
                  },
                ),
                IconButton(
                  icon: Icon(
                    LineIcons.user,
                    size: 30,
                  ),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return PageFour();
                    }));
                  },
                ),
              ],
            ),
          ),
        ));
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
