

part of 'widgets.dart';

class MyLocationButton extends StatelessWidget {
  final onPress;

  const MyLocationButton({Key key, @required this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10,horizontal: 5),
      child: CircleAvatar(
        backgroundColor: Colors.white,
        maxRadius: 25,
        child: IconButton(
          icon: Icon(Icons.my_location, color: Colors.black87),
          onPressed: onPress,
        ),
      ),
    );
  }
}
