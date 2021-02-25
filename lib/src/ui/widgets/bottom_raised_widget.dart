part of 'widgets.dart';

class BottomRaisedWidget extends StatelessWidget {
  final String title;
  final Function accion;

  const BottomRaisedWidget({Key key, this.title, this.accion})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      color: primaryColor,
      textColor: Colors.white,
      child: Text(title),
      onPressed: accion,
    );
  }
}
