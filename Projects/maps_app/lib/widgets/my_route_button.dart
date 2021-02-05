part of 'widgets.dart';

class MyRouteButton extends StatelessWidget {
  final onPress;

  const MyRouteButton({Key key, @required this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: CircleAvatar(
        backgroundColor: Colors.white,
        maxRadius: 25,
        child: IconButton(
          icon: Icon(Icons.linear_scale_outlined, color: Colors.black87),
          onPressed: onPress,
        ),
      ),
    );
  }
}
