part of 'widgets.dart';

class UserWidget extends StatelessWidget {
  final User user;

  const UserWidget({Key key, @required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [BoxShadow(blurRadius: 1, offset: Offset.infinite)]),
      child: Stack(
        children: <Widget>[
          InkWell(
            onTap: () =>
                Navigator.push(context, MaterialPageRoute(builder: (_) {
              return UserPage(
                user: user,
              );
            })),
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              height: 450,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(user.picture.large),
                      fit: BoxFit.cover)),
            ),
          ),
          Positioned(
            top: 250,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(30.0),
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60.0),
                      topRight: Radius.circular(60.0))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '${user.name.first} ${user.name.last}',
                    style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    user.name.title,
                    style: TextStyle(fontSize: 20.0, color: Colors.black),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    '${user.location.street.name} #${user.location.street.number}',
                    style: TextStyle(fontSize: 20.0, color: Colors.black),
                  ),
                  SizedBox(
                      height: 80,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BottomRaisedWidget(
                            title: 'RECOMENDAR',
                            accion: () {
                              InfoAlertBox(
                                context: context,
                                title: 'InprodiMX',
                                buttonColor: primaryColor,
                                infoMessage:
                                    'InprodiMx agradece tu recomendación.',
                              );
                            },
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          BottomRaisedWidget(
                            title: 'ME INTERESA',
                            accion: () {
                              InfoAlertBox(
                                context: context,
                                title: 'InprodiMX',
                                buttonColor: primaryColor,
                                infoMessage:
                                    'InprodiMx agradece tu preferencia.',
                              );
                            },
                          ),
                        ],
                      )),
                  SizedBox(height: 10.0),
                ],
              ),
            ),
          ),
          Positioned(
            top: 200,
            right: 40,
            child: CircleAvatar(
                radius: 20.0,
                foregroundColor: Colors.grey,
                backgroundColor: Colors.grey.shade200,
                child: Icon(Icons.favorite_border)),
          ),
          Positioned(
              top: 180,
              right: 40,
              left: 40,
              child: AvatarWidget(user.picture.large, radius: 60)),
          Positioned(
              top: 20,
              right: 40,
              left: 40,
              child: Row(
                children: [
                  Icon(
                    Icons.copyright_sharp,
                    color: yellowColor,
                    size: 40,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '\$1000',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Spacer(),
                  CircleAvatar(
                    backgroundColor: yellowColor,
                    child: IconButton(
                      icon: Icon(Icons.more_vert),
                      onPressed: () {},
                    ),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
