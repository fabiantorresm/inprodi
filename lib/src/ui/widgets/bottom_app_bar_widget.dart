part of 'widgets.dart';

class MyBottomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new BottomAppBar(
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
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                LineIcons.plusSquare,
                size: 30,
              ),
              color: Colors.white,
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                LineIcons.heart,
                size: 30,
              ),
              color: Colors.white,
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                LineIcons.user,
                size: 30,
              ),
              color: Colors.white,
              onPressed: () {},
            ),
            // Divider(),
          ],
        ),
      ),
    );
  }
}
