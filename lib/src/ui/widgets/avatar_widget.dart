part of 'widgets.dart';

// ignore: must_be_immutable
class AvatarWidget extends StatelessWidget {
  final String image;
  final double radius;

  const AvatarWidget(this.image, {this.radius = 80});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: this.radius,
      child: CircleAvatar(
        radius: this.radius - 2,
        backgroundImage: NetworkImage(image),
      ),
    );
  }
}
