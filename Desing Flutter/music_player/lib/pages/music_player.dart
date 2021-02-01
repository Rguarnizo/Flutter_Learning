import 'package:flutter/material.dart';
import 'package:music_player/helpers/helpers.dart';
import 'package:music_player/widgets/custom_appbar.dart';

class MusicPlayerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          _Background(),
          Column(
            children: [
              CustomAppBar(),
              DiscoImageDuration(),
              TitleoPlay(),
              Expanded(child: Lyrics())
            ],
          ),
        ],
      ),
    ));
  }
}

class _Background extends StatelessWidget {
  const _Background({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final screenSize = MediaQuery.of(context).size;

    return Container(
      height:screenSize.height *0.65,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(60)),
        gradient: LinearGradient(
          colors: [
            Color(0xff33333E),
            Color(0xff201E28)
          ],
          begin: Alignment.centerLeft,
          end: Alignment.center
        ),
      ),
    );
  }
}

class Lyrics extends StatelessWidget {
  const Lyrics({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final lyrics = getLyrics();
    return Container(
      child: ListWheelScrollView(
        itemExtent: 42,
        children: lyrics
            .map((e) => Text(
                  e,
                  style: TextStyle(
                      fontSize: 20, color: Colors.white.withOpacity(0.5)),
                ))
            .toList(),
        diameterRatio: 1.5,
        physics: BouncingScrollPhysics(),
      ),
    );
  }
}

class TitleoPlay extends StatefulWidget {
  const TitleoPlay({
    Key key,
  }) : super(key: key);

  @override
  _TitleoPlayState createState() => _TitleoPlayState();
}

class _TitleoPlayState extends State<TitleoPlay> with SingleTickerProviderStateMixin{

  bool isPlaying = false;
  AnimationController playAnimation;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    playAnimation = AnimationController(vsync: this,duration: Duration(milliseconds: 500));
    
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    playAnimation.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      margin: EdgeInsets.only(top: 40),
      child: Row(
        children: [
          Column(
            children: [
              Text(
                'Far away',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white.withOpacity(0.8),
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '-Breaking Benjamin-',
                style: TextStyle(
                    fontSize: 15, color: Colors.white.withOpacity(0.8)),
              ),
            ],
          ),
          Spacer(),
          FloatingActionButton(
            onPressed: () {},
            backgroundColor: Color(0xffF8CB51),
            child: Icon(Icons.play_arrow),
            elevation: 0,
            highlightElevation: 0,
          ),
        ],
      ),
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
      padding: EdgeInsets.symmetric(horizontal: 30),
      margin: EdgeInsets.only(top: 70),
      child: Row(
        children: [
          ImageDisco(),
          SizedBox(
            width: 20,
          ),
          _ProgressSong(),
        ],
      ),
    );
  }
}

class _ProgressSong extends StatelessWidget {
  const _ProgressSong({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textStyle = TextStyle(color: Colors.white.withOpacity(0.4));

    return Container(
      child: Column(
        children: [
          Text(
            '00:00',
            style: textStyle,
          ),
          Stack(
            children: [
              Container(
                  width: 3, height: 230, color: Colors.white.withOpacity(0.1)),
              Positioned(
                  bottom: 0,
                  child: Container(
                      width: 3,
                      height: 100,
                      color: Colors.white.withOpacity(0.8)))
            ],
          ),
          Text(
            '00:00',
            style: textStyle,
          )
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
              colors: [Color(0xff484750), Color(0xff1e1c24)]),
          borderRadius: BorderRadius.circular(200)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(200),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image(
              image: AssetImage('assets/aurora.jpg'),
            ),
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
