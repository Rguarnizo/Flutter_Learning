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
          icon: BlocBuilder<MapBloc, MapInitial>(
            builder: (context, state) {
              return Icon(state.followLocation? Icons.directions_run:Icons.accessibility,
                  color: Colors.black87);
            },
          ),
          onPressed: onPress,
        ),
      ),
    );
  }
}
