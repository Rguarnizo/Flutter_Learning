import 'package:flutter/material.dart';
import 'package:music_player/widgets/custom_appbar.dart';


class MusicPlayerPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(),

            DiscoImageDuration()
          ],
        ),
      )
   );
  }
}

class DiscoImageDuration extends StatelessWidget {
  const DiscoImageDuration({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          //TODO: Disco,
          ImageDisco(),
          //TODO: Barra Progreso.
        ],
      ),
    );
  }
}

class ImageDisco extends StatelessWidget {
  const ImageDisco({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      width: 250,
      height: 250,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          colors: [
          Color(0xff484750),
          Color(0xff1e1c24)
        ]),
        borderRadius: BorderRadius.circular(200)
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(200),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image(image: AssetImage('assets/aurora.jpg'),),
            Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.circular(100),
              ),
              
            ),
            Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                color: Color(0xff1C1C25),
                borderRadius: BorderRadius.circular(100),
              ),
              
            )
          ],
        ),
      ),
    );
  }
}