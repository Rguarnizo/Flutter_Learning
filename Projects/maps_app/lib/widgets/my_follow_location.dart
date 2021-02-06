part of 'widgets.dart';

class MyFollowLocationButton extends StatelessWidget {
  final onPress;


  const MyFollowLocationButton({Key key, this.onPress}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: CircleAvatar(
        backgroundColor: Colors.white,
        maxRadius: 25,
        child: IconButton(
          icon: Icon(Icons.follow_the_signs_outlined, color: Colors.black87),
          onPressed: onPress,
        ),
      ),
    );
  }
}
