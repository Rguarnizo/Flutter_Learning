import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class SlideShowPage extends StatelessWidget {
  const SlideShowPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          Expanded(child: _Slides()),
          _Dots(),
        ],
      )),
    );
  }
}

class _Dots extends StatelessWidget {
  const _Dots({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _Dot(0),
          _Dot(1),
          _Dot(2),
        ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {

  final int index;
  const _Dot(this.index,{
    
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 12,
      height: 12,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
    );
  }
}

class _Slides extends StatefulWidget {
  const _Slides({Key key}) : super(key: key);

  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {

final pageViewController = PageController();


  @override
  void initState() { 
    super.initState();
    pageViewController.addListener(() {
      print('Pagina Actual ${pageViewController.page}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: pageViewController,
        children: [
          _Slide(svg: 'assets/svg/slide-1.svg'),
          _Slide(svg: 'assets/svg/slide-2.svg'),
          _Slide(svg: 'assets/svg/slide-3.svg'),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String svg;
  const _Slide({Key key, this.svg}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(40),
      child: SvgPicture.asset(svg),
    );
  }
}
