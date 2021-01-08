
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';


class SlideShowPage extends StatelessWidget {
  const SlideShowPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _Slides()),
      
    );
  }
}


class _Slides extends StatelessWidget {
  const _Slides({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        children: [
          _Slide(svg: 'assets/svg/slide-1.svg'),
          _Slide(svg:'assets/svg/slide-2.svg'),
          _Slide(svg:'assets/svg/slide-3.svg'),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {

  final String svg;
  const _Slide({
    Key key,
    this.svg
  }) : super(key: key);

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